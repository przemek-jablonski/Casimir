//
// Copyright (c) Vatsal Manot
//

import Swift
import SwiftUI
//swiftlint:disable all
public extension Binding {
    @inlinable
    static func receiveValue<Wrapped>(_ receiveValue: @escaping (Wrapped?) -> ()) -> Binding where Optional<Wrapped> == Value {
        .init(
            get: { nil },
            set: receiveValue
        )
    }
}

public extension Binding {
    @inlinable
    func forceCast<U>(to type: U.Type) -> Binding<U> {
        return .init(
            get: { self.wrappedValue as! U },
            set: { self.wrappedValue = $0 as! Value }
        )
    }
    
    @inlinable
    func withDefaultValue<T>(_ defaultValue: T) -> Binding<T> where Value == Optional<T> {
        return .init(
            get: { self.wrappedValue ?? defaultValue },
            set: { self.wrappedValue = $0 }
        )
    }
}

public extension Binding {
    @inlinable
    func beforeSet(_ body: @escaping (Value) -> ()) -> Self {
        return .init(
            get: { self.wrappedValue },
            set: { body($0); self.wrappedValue = $0 }
        )
    }
    
    @inlinable
    func onSet(_ body: @escaping (Value) -> ()) -> Self {
        return .init(
            get: { self.wrappedValue },
            set: { self.wrappedValue = $0; body($0) }
        )
    }
}

public extension Binding {
    @inlinable
    func isNil<Wrapped>() -> Binding<Bool> where Optional<Wrapped> == Value {
        .init(
            get: { self.wrappedValue == nil },
            set: { isNil in self.wrappedValue = isNil ? nil : self.wrappedValue  }
        )
    }

    @inlinable
    func isNotNil<Wrapped>() -> Binding<Bool> where Optional<Wrapped> == Value {
        .init(
            get: { self.wrappedValue != nil },
            set: { isNotNil in self.wrappedValue = isNotNil ? self.wrappedValue : nil  }
        )
    }
}

public extension Binding where Value == Bool {
    @inlinable
    static func && (lhs: Binding, rhs: Bool) -> Binding {
        .init(
            get: { lhs.wrappedValue && rhs },
            set: { lhs.wrappedValue = $0 }
        )
    }
}

public extension Binding where Value == Bool? {
    @inlinable
    static func && (lhs: Binding, rhs: Bool) -> Binding {
        .init(
            get: { lhs.wrappedValue.map({ $0 && rhs }) },
            set: { lhs.wrappedValue = $0 }
        )
    }
}

public extension Binding where Value == String {
    @inlinable
    func takePrefix(_ count: Int) -> Self {
        .init(
            get: { self.wrappedValue },
            set: {
                self.wrappedValue = $0
                self.wrappedValue = .init($0.prefix(count))
            }
        )
    }
    
    @inlinable
    func takeSuffix(_ count: Int) -> Self {
        .init(
            get: { self.wrappedValue },
            set: {
                self.wrappedValue = $0
                self.wrappedValue = .init($0.suffix(count))
            }
        )
    }
}

public extension Binding where Value == String? {
    @inlinable
    func takePrefix(_ count: Int) -> Self {
        .init(
            get: { self.wrappedValue },
            set: {
                self.wrappedValue = $0
                self.wrappedValue = $0.map({ .init($0.prefix(count)) })
            }
        )
    }
    
    @inlinable
    func takeSuffix(_ count: Int) -> Self {
        .init(
            get: { self.wrappedValue },
            set: {
                self.wrappedValue = $0
                self.wrappedValue = $0.map({ .init($0.suffix(count)) })
            }
        )
    }
}
