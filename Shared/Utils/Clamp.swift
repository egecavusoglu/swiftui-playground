//
//  Clamp.swift
//  Ege's Playground (iOS)
//
//  Created by Ege Çavuşoğlu on 6/14/22.
//

import Foundation

extension Comparable {
    func clamped(to limits: ClosedRange<Self>) -> Self {
        return min(max(self, limits.lowerBound), limits.upperBound)
    }
}
