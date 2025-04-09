//
//  DebouncedOnChangeModifier.swift
//  union-debounce
//
//  Created by Ben Sage on 1/21/25.
//

import SwiftUI

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
struct DebouncedOnChangeModifier<Value: Equatable> {
    @State var task: Task<Void, Never>? = nil

    let value: Value
    let debounce: Duration
    let initial: Bool
    let zeroParamAction: (() -> Void)?
    let twoParamAction: ((Value, Value) -> Void)?
}
