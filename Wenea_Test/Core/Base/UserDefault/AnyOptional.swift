//
//  AnyOptional.swift
//  TimerWork
//
//  Created by eloysn on 24/8/21.
//

import Foundation

public protocol AnyOptional {
    var isNil: Bool { get }
}

extension Optional: AnyOptional {
    public var isNil: Bool { self == nil }
}

