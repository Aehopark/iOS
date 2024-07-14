//
//  AppState.swift
//  Aehopark
//
//  Created by wodnd on 7/15/24.
//

import Foundation
import SwiftUI

@MainActor
class AppState: ObservableObject {
    static let shared = AppState()
    
    @Published var currentTab: Tab = .home
    @Published var isTabViewHidden: Bool = false
    
    // navigation Path
    @Published var navigationPath = NavigationPath()
}
