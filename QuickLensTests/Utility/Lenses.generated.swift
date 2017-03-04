// Generated using Sourcery 0.10.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

@testable import QuickLens

infix operator *~: MultiplicationPrecedence
infix operator |>: AdditionPrecedence

struct Lens<A, B> {
    let get: (A) -> B
    let set: (B, A) -> A
}

func * <A, B, C> (lhs: Lens<A, B>, rhs: Lens<B, C>) -> Lens<A, C> {
    return Lens<A, C>(
        get: { rhs.get(lhs.get($0)) },
        set: { lhs.set(rhs.set($0, lhs.get($1)), $1) }
    )
}

func *~ <A, B> (lhs: Lens<A, B>, rhs: B) -> (A) -> A {
    return { lhs.set(rhs, $0) }
}

func |> <A, B> (x: A, f: (A) -> B) -> B {
    return f(x)
}

func |> <A, B, C> (f: @escaping (A) -> B, g: @escaping (B) -> C) -> (A) -> C {
    return { g(f($0)) }
}

extension SNS: LensCompatible {}
extension LensExtension where Base == SNS {
    static let twitter = Lens<SNS, String?>(
        get: { $0.twitter },
        set: { twitter, base in
            SNS(twitter: twitter, github: base.github)
        }
    )
    static let github = Lens<SNS, String?>(
        get: { $0.github },
        set: { github, base in
            SNS(twitter: base.twitter, github: github)
        }
    )
}

extension User: LensCompatible {}
extension LensExtension where Base == User {
    static let name = Lens<User, String>(
        get: { $0.name },
        set: { name, base in
            User(name: name, age: base.age, sns: base.sns, type: base.type)
        }
    )
    static let age = Lens<User, Int>(
        get: { $0.age },
        set: { age, base in
            User(name: base.name, age: age, sns: base.sns, type: base.type)
        }
    )
    static let sns = Lens<User, SNS>(
        get: { $0.sns },
        set: { sns, base in
            User(name: base.name, age: base.age, sns: sns, type: base.type)
        }
    )
    static let type = Lens<User, CustomerType>(
        get: { $0.type },
        set: { type, base in
            User(name: base.name, age: base.age, sns: base.sns, type: type)
        }
    )
}

