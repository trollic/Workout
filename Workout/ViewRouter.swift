//
//  ViewRouter.swift
//  Workout
//
//  Created by Cece Zhu on 29/12/20.
//

import SwiftUI
import Foundation

enum Page {
    case page1
    case page2
    case page3
}

class ViewRouter: ObservableObject {
    @Published var currentPage: Page = .page1
    
}
