//
//  View+ZeroParamsOnChange.swift
//  union-debounce
//
//  Created by Ben Sage on 3/29/25.
//

import SwiftUI

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension View {

    /// Adds a debounced observer to the given value. The provided closure is called after
    /// the specified delay has elapsed whenever the value changes. If the value changes
    /// again before the delay finishes, the timer resets.
    ///
    /// - Parameters:
    ///   - value: The value to observe for changes.
    ///   - debounce: The delay as a Duration before `action` is called.
    ///   - initial: Indicates whether the closure should be called immediately upon
    ///              the view's first appearance. Defaults to `false`.
    ///   - action: The closure that is called when the value changes after the debounce delay.
    ///
    /// Example:
    ///     struct AnotherExampleView: View {
    ///         @State private var counter = 0
    ///
    ///         var body: some View {
    ///             VStack {
    ///                 Button("Increment") {
    ///                     counter += 1
    ///                 }
    ///                 .onChange(of: counter, debounce: 2, initial: true) {
    ///                     print("Counter changed to \(counter) after a 2-second debounce")
    ///                 }
    ///             }
    ///         }
    ///     }
    nonisolated public func onChange<V>(
        of value: V,
        debounce: Duration,
        initial: Bool = false,
        _ action: @escaping () -> Void
    ) -> some View where V : Equatable {
        modifier(
            DebouncedOnChangeModifier(
                value: value,
                debounce: debounce,
                initial: initial,
                action: action
            )
        )
    }

    /// Adds a debounced observer to the given value. The provided closure is called after
    /// the specified delay has elapsed whenever the value changes. If the value changes
    /// again before the delay finishes, the timer resets.
    ///
    /// - Parameters:
    ///   - value: The value to observe for changes.
    ///   - debounce: The delay, in seconds, before `action` is called.
    ///   - initial: Indicates whether the closure should be called immediately upon
    ///              the view's first appearance. Defaults to `false`.
    ///   - action: The closure that is called when the value changes after the debounce delay.
    ///
    /// Example:
    ///     struct AnotherExampleView: View {
    ///         @State private var counter = 0
    ///
    ///         var body: some View {
    ///             VStack {
    ///                 Button("Increment") {
    ///                     counter += 1
    ///                 }
    ///                 .onChange(of: counter, debounce: .seconds(2), initial: true) {
    ///                     print("Counter changed to \(counter) after a 2-second debounce")
    ///                 }
    ///             }
    ///         }
    ///     }
    nonisolated public func onChange<V>(
        of value: V,
        debounce: Double,
        initial: Bool = false,
        _ action: @escaping () -> Void
    ) -> some View where V : Equatable {
        modifier(
            DebouncedOnChangeModifier(
                value: value,
                debounce: debounce,
                initial: initial,
                action: action
            )
        )
    }
}
