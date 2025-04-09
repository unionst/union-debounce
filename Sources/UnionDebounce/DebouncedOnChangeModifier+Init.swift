//
//  DebouncedOnChangeModifier+Init.swift
//  union-debounce
//
//  Created by Ben Sage on 3/29/25.
//

import Foundation

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension DebouncedOnChangeModifier {
    nonisolated init(
        value: Value,
        debounce: Double,
        initial: Bool,
        action: @escaping () -> Void
    ) {
        self.value = value
        self.debounce = .seconds(debounce)
        self.initial = initial
        self.zeroParamAction = action
        self.twoParamAction = nil
    }

    nonisolated init(
        value: Value,
        debounce: Double,
        initial: Bool,
        action: @escaping (Value, Value) -> Void
    ) {
        self.value = value
        self.debounce = .seconds(debounce)
        self.initial = initial
        self.zeroParamAction = nil
        self.twoParamAction = action
    }

    nonisolated init(
        value: Value,
        debounce: Duration,
        initial: Bool,
        action: @escaping () -> Void
    ) {
        self.value = value
        self.debounce = debounce
        self.initial = initial
        self.zeroParamAction = action
        self.twoParamAction = nil
    }

    nonisolated init(
        value: Value,
        debounce: Duration,
        initial: Bool,
        action: @escaping (Value, Value) -> Void
    ) {
        self.value = value
        self.debounce = debounce
        self.initial = initial
        self.zeroParamAction = nil
        self.twoParamAction = action
    }
}
