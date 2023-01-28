//
//  DataContainerDI.swift
//  Wenea_Test
//
//  Created by eloysn on 28/1/23.
//

import Foundation

protocol DataContainerDI { }

final class DataContainerDIImpl: DataContainerDI {
    private init() {}
    static let shared = DataContainerDIImpl()

//    var everyThingMapApiService: EveryThingMapApiService = EveryThingMapApiServiceImpl(
//        baseURL: UIApplication.serviceLocator.appConfiguration.serverHostCustomMap,
//        version: UIApplication.serviceLocator.appConfiguration.serverApiVersionCustomMap,
//        service: "everythingmap"
//    )
}
