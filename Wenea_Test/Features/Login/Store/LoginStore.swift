//
//  LoginViewModel.swift
//  Wenea_Test
//
//  Created by eloysn on 27/1/23.
//

import SwiftUI
import Combine

final class LoginStore: ObservableObject {
    private let loginUseCase: LoginUseCase
    
    init(
        loginUseCase: LoginUseCase
    ) {
        self.loginUseCase = loginUseCase
    }
    
    deinit {
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
    func reduce(_ state: State, _ event: Event) -> State {
        switch event {
        case .onLogin: return .loading
        case .onUserLoged: return .loged
        case .onFailedLogin(let error): return .error(error)
        }
    }
    
    func userLoged(input: AnyPublisher<Event, Never>) -> Feedback<State, Event> {
        Feedback { (state: State) -> AnyPublisher<Event, Never> in
            //guard case .loading = state else { return Empty().eraseToAnyPublisher() }
            return input.compactMap(\.onLogin)
                .flatMap { self.loginUseCase.login(with: $0) }
                .map { _ in Event.onUserLoged }
                .catch { Just(Event.onFailedLogin($0)) }
                .eraseToAnyPublisher()
        }
    }
    
    func userInput(input: AnyPublisher<Event, Never>) -> Feedback<State, Event> {
        Feedback { _ in input }
    }
}

