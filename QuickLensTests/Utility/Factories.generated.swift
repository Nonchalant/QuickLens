// Generated using Sourcery 0.10.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


@testable import QuickLens

extension SNS: FactoryProvidable {
    static func generate() -> SNS {
        return SNS(
            twitter: String?.generate(),
            github: String?.generate()
        )
    }
}

extension User: FactoryProvidable {
    static func generate() -> User {
        return User(
            name: String.generate(),
            age: Int.generate(),
            sns: SNS.generate(),
            type: CustomerType.generate()
        )
    }
}

extension CustomerType: FactoryProvidable {
    static func generate() -> CustomerType {
        return .normal
    }
}

