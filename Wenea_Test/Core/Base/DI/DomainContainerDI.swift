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

//    private lazy var locationManager: LocationManager = LocationManagerImpl(
//        coreLocationManager: CLLocationManager()
//    )
//    lazy var locationUseCase: LocationUseCase = LocationUseCaseImpl(
//        locationManager: locationManager
//    )
//
//    private lazy var everythingMapRepository: EveryThingMapRepository = EveryThingMapRepositoryImpl(
//        everyThingMapApiService: DataContainerDIImpl.shared.everyThingMapApiService
//    )
//    lazy var mapUseCase: MapUseCase = MapUseCaseImpl(
//        everythingMapRepository: everythingMapRepository
//    )
}
