//
//  DomainContainerDI.swift
//  Wenea_Test
//
//  Created by eloysn on 28/1/23.
//

protocol DomainContainerDI { }

final class DomainContainerDIImpl: DomainContainerDI {
    private init() {}
    static let shared = DomainContainerDIImpl()

    private lazy var authRepository: AuthRepository = AuthRepositoryImpl(
        authService: DataContainerDIImpl.shared.authService
    )
    lazy var loginUseCase: LoginUseCase = LoginCaseImpl(
        authRepository: authRepository
    )
    lazy var registerUseCase: RegisterUseCase = RegisterUseCaseImpl(
        authRepository: authRepository
    )
    private lazy var mapRepository: MapRepository = MapRepositoryImpl(
        mapService: DataContainerDIImpl.shared.mapService
    )
    lazy var mapUseCase: MapUseCase = MapUseCaseImpl(
        mapRepository: mapRepository
    )
}

