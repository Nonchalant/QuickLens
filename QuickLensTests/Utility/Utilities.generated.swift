// Generated using Sourcery 0.10.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation
@testable import QuickLens

// MARK: - Factory

protocol FactoryProvidable {
    static func generate() -> Self
}

extension Array: FactoryProvidable {
    static func generate() -> Array {
        return []
    }
}

extension Array where Element: FactoryProvidable {
    static func generate() -> Array {
        return [Element.generate()]
    }
}

extension Bool: FactoryProvidable {
    static func generate() -> Bool {
        return false
    }
}

extension Data: FactoryProvidable {
    static func generate() -> Data {
        return Data()
    }
}

extension Date: FactoryProvidable {
    static func generate() -> Date {
        return Date(timeIntervalSince1970: 0)
    }
}

extension Dictionary: FactoryProvidable {
    static func generate() -> Dictionary {
        return [:]
    }
}

extension Dictionary where Key: FactoryProvidable, Value: FactoryProvidable {
    static func generate() -> Dictionary {
        return [Key.generate(): Value.generate()]
    }
}

extension Double: FactoryProvidable {
    static func generate() -> Double {
        return 0
    }
}

extension Float: FactoryProvidable {
    static func generate() -> Float {
        return 0
    }
}

extension Int: FactoryProvidable {
    static func generate() -> Int {
        return 0
    }
}

extension Optional: FactoryProvidable {
    static func generate() -> Optional {
        return .none
    }
}

extension Optional where Wrapped: FactoryProvidable {
    static func generate() -> Optional {
        return .some(Wrapped.generate())
    }
}

extension String: FactoryProvidable {
    static func generate() -> String {
        return "test"
    }
}

// MARK: - Lens

struct LensExtension<Base> {
    let base: Base
    init (_ base: Base) {
        self.base = base
    }
}

protocol LensCompatible {
    associatedtype Compatible
    static var lens: Compatible.Type { get }
    var lens: Compatible { get }
}

extension LensCompatible {
    static var lens: LensExtension<Self>.Type {
        return LensExtension<Self>.self
    }

    var lens: LensExtension<Self> {
        return LensExtension(self)
    }
}
