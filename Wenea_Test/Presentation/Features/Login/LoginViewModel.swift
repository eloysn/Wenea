//
//  LoginViewModel.swift
//  Wenea_Test
//
//  Created by eloysn on 27/1/23.
//

import SwiftUI
import Combine

final class LoginViewModel: ObservableObject {
    @Published private(set) var state = State.idle
    private var bag = Set<AnyCancellable>()
    private let input = PassthroughSubject<Event, Never>()
    private let loginUseCase: LoginUseCase
    
    init(
        loginUseCase: LoginUseCase
    ) {
        self.loginUseCase = loginUseCase
        Publishers.system(
            initial: state,
            reduce: Self.reduce,
            scheduler: RunLoop.main,
            feedbacks: [
                userLoged(input: input.eraseToAnyPublisher())
            ]
        )
        .assign(to: \.state, on: self)
        .store(in: &bag)
    }
    
    deinit {
        bag.removeAll()
    }
    
    func send(event: Event) {
        input.send(event)
    }
}


extension LoginViewModel {
    enum State {
        case idle
        case loading
        case loged
        case error(Error)
    }
    
    enum Event {
        case onLogin(user: User)
        case onUserLoged
        case onFailedLogin(Error)
        
        var onLogin: User? {
            if case let .onLogin(user) = self {
                return user
            }
            return nil
        }
    }
}

extension LoginViewModel {
    static func reduce(_ state: State, _ event: Event) -> State {
        switch state {
        case .idle:
            switch event {
            case .onLogin: return .loading
            default: return state
            }
        case .loading:
            switch event {
            case .onUserLoged: return .loged
            case .onFailedLogin(let err): return .error(err)
            default: return state
            }
        case .loged: return state
        case .error: return state
        }
    }
    
    func userLoged(input: AnyPublisher<Event, Never>) -> Feedback<State, Event> {
        Feedback { (state: State) -> AnyPublisher<Event, Never> in
            guard case .idle = state else { return Empty().eraseToAnyPublisher() }
            return input.compactMap(\.onLogin)
                .flatMap { self.loginUseCase.login(with: $0) }
                .map { _ in Event.onUserLoged }
                .catch { Just(Event.onFailedLogin($0)) }
                .eraseToAnyPublisher()
        }
    }
}

func service(user: User) -> AnyPublisher<Void, Error> {
    return Just(Void()).setFailureType(to: Error.self).eraseToAnyPublisher()
}
