//
//  WorkoutApp.swift
//  Workout
//
//  Created by Cece Zhu on 29/12/20.
//

import SwiftUI

@main
struct WorkoutApp: App {

    var body: some Scene {
        WindowGroup {
            SelectTimeView()
        }
    }
}

struct WorkoutApp_Previews: PreviewProvider {
    static var previews: some View {
        SelectTimeView()
    }
}
