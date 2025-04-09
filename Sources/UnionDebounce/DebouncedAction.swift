//
//  DebouncedAction.swift
//  union-debounce
//
//  Created by Ben Sage on 3/29/25.
//

import Foundation

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
enum DebouncedAction<Value> {
    case zero(() -> Void)
    case two((Value, Value) -> Void)
}
