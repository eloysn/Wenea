//
//  Modifiable.swift
//  Wenea_Test
//
//  Created by eloysn on 28/1/23.
//

import Foundation

protocol Modifiable {}
extension Modifiable {
    @discardableResult
    func set<T>(_ keyPath: KeyPath<Self, T>, _ value: T) -> Self {
        var copy = self
        guard let keyPath = keyPath as? WritableKeyPath else {
            assertionFailure("KeyPath not casteable to WritableKeyPath ")
            return copy
        }
        copy[keyPath: keyPath] = value
        return copy
    }
}
