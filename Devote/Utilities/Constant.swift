//
//  Constant.swift
//  Devote
//
//  Created by Visarut Tippun on 26/3/22.
//

import Foundation
import SwiftUI

// Mark: - Formatter
let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

var backgroundGradient: LinearGradient {
    return .init(gradient: .init(colors: [.pink, .blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
}
