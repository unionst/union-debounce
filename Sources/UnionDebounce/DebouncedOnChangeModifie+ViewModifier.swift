//
//  DebouncedOnChangeModifier+ViewModifier.swift
//  union-debounce
//
//  Created by Ben Sage on 3/29/25.
//

import Foundation
import SwiftUI

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension DebouncedOnChangeModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .onChange(of: value, initial: initial) { old, new in
                task?.cancel()
                task = Task {
                    try? await Task.sleep(for: debounce)
                    if !Task.isCancelled {
                        if let zeroParamAction {
                            zeroParamAction()
                        } else if let twoParamAction {
                            twoParamAction(old, new)
                        }
                    }
                }
            }
    }
}
