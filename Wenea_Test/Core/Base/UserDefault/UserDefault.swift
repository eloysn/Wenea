//
//  UserDefault.swift
//  TimerWork
//
//  Created by eloysn on 24/8/21.
//

import Foundation

@propertyWrapper
public struct UserDefault<T> {
    private let key: UserDefaultKey
    private let defaultValue: T
    private let defaults: UserDefaults

    public var wrappedValue: T {
        get { defaults.value(forKey: key.rawValue) as? T ?? defaultValue }
        set {
            if let optional = newValue as? AnyOptional, optional.isNil {
                defaults.removeObject(forKey: key.rawValue)
                return
            }
            defaults.setValue(newValue, forKey: key.rawValue)
        }
    }

    public init(_ key: UserDefaultKey, defaults: UserDefaults = .standard, defaultValue: T) {
        self.key = key
        self.defaults = defaults
        self.defaultValue = defaultValue
    }

    public init(_ key: UserDefaultKey, defaults: UserDefaults = .standard) where T: ExpressibleByNilLiteral {
        self.init(key, defaults: defaults, defaultValue: nil)
    }

    public init(_ key: UserDefaultKey, defaults: UserDefaults = .standard) where T == String {
        self.init(key, defaults: defaults, defaultValue: "")
    }

    public init(_ key: UserDefaultKey, defaults: UserDefaults = .standard) where T == Bool {
        self.init(key, defaults: defaults, defaultValue: false)
    }
}

@propertyWrapper
public struct UserDefaultCodable<T: Codable> {
    let key: UserDefaultKey
    let defaultValue: T
    let userDefaultsSuite : UserDefaults = UserDefaults.standard
    
    public var wrappedValue: T {
        get {
            if let r = userDefaultsSuite.object(forKey: key.rawValue) as? Data, let orgVal = try? JSONDecoder().decode(T.self, from: r) {
                return orgVal
            }
            else { return defaultValue}
        }
        set {
            let s = try! JSONEncoder().encode(newValue)
            userDefaultsSuite.set(s, forKey: key.rawValue)
        }
    }
}

public enum UserDefaultKey: String {
    case users
}
