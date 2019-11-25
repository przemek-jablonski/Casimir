//
//  Swift+KotlinScoping.swift
//  Pins2
//
//  Created by Przemyslaw Jablonski on 30/03/2019.
//  Copyright © 2019 Przemyslaw Jablonski. All rights reserved.
//

// Kotlin inspired scoping functions.
// This is a solution for a problem where there is a need for calling substantial amount of
// methods or property assignments before object will become useful in context of a given task.
//
// `configure` method is an equivalent of `when` Kotlin method, whereas `instantiate`
// is an equivalent of `apply` method.
// More advanced scoping methods are basically impossible to implement in Swift due to
// language immaturity and lack of language and/or compiler features.
// This is one the reasons why invocation of methods is different than in Kotlin
// (eg. configure(object, with) instead of object.configure(with))
// https://kotlinlang.org/docs/reference/scope-functions.html

/**
    Configures given object with code sent as 'block' closure.

    - Warning: This function should be used only for configuration of already existing object instances.
    For performing configuration along instantiation,
    `configure(object:performing:)` function should be used.
 */
public func configure<T>(object: T, with block: (T) -> ()) -> T {
    block(object)
    return object
}

public func configure<T, U>(object: T, with block: (T) -> (U)) -> U {
    return block(object)
}


/**
     Configures given objects (pair) with code sent as 'block' closure
     (accepting pair of compatible generic types).

     - Warning: This function should be used only for configuration of already existing object instances.
     For performing configuration along instantiation,
     `configure(object:performing:)` function should be used.
 */

public func configure<A, B>(objects: (A, B), with block: (A, B) -> ()) -> (A, B) {
    block(objects.0, objects.1)
    return objects
}
