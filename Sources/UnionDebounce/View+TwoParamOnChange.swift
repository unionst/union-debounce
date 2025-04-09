//
//  View+TwoParamOnChange.swift
//  union-debounce
//
//  Created by Ben Sage on 3/29/25.
//

import SwiftUI

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension View {

    /// Adds a debounced observer to the given value. The provided closure receives both the old
    /// and new values when the value changes, after the specified delay has elapsed. If the value
    /// changes again before the delay finishes, the timer resets.
    ///
    /// - Parameters:
    ///   - value: The value to observe for changes.
    ///   - debounce: The delay as a Duration before `action` is called.
    ///   - initial: Indicates whether the closure should be called immediately upon the view's first appearance. The default is `false`.
    ///   - action: The closure that is called when the value changes after the debounce delay.
    ///             It receives the old and new values.
    ///
    /// Example:
    ///     struct ExampleView: View {
    ///         @State private var text = ""
    ///
    ///         var body: some View {
    ///             TextField("Type here", text: $text)
    ///                 .onChange(of: text, debounce: .seconds(1), initial: true) { oldText, newText in
    ///                     print("Value changed from \(oldText) to \(newText)")
    ///                 }
    ///         }
    ///     }
    nonisolated public func onChange<V>(
        of value: V,
        debounce: Duration,
        initial: Bool = false,
        _ action: @escaping (_ oldValue: V, _ newValue: V) -> Void
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

    /// Adds a debounced observer to the given value. The provided closure receives both the old
    /// and new values when the value changes, after the specified delay has elapsed. If the value
    /// changes again before the delay finishes, the timer resets.
    ///
    /// - Parameters:
    ///   - value: The value to observe for changes.
    ///   - debounce: The delay, in seconds, before `action` is called.
    ///   - initial: Indicates whether the closure should be called immediately upon the view's first appearance. The default is `false`.
    ///   - action: The closure that is called when the value changes after the debounce delay.
    ///             It receives the old and new values.
    ///
    /// Example:
    ///     struct ExampleView: View {
    ///         @State private var text = ""
    ///
    ///         var body: some View {
    ///             TextField("Type here", text: $text)
    ///                 .onChange(of: text, debounce: 1, initial: true) { oldText, newText in
    ///                     print("Value changed from \(oldText) to \(newText)")
    ///                 }
    ///         }
    ///     }
    nonisolated public func onChange<V>(
        of value: V,
        debounce: Double,
        initial: Bool = false,
        _ action: @escaping (_ oldValue: V, _ newValue: V) -> Void
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
