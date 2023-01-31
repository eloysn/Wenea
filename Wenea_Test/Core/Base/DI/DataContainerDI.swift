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

    var authService: AuthService = AuthServiceImpl()
    var mapService: MapService = MapServiceImpl()
}
