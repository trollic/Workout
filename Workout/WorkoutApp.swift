//
//  WorkoutApp.swift
//  Workout
//
//  Created by Cece Zhu on 29/12/20.
//

import SwiftUI

@main
struct WorkoutApp: App {
    @StateObject var viewRouter = ViewRouter()
    @StateObject var totalTime = Counter()

    var body: some Scene {
        WindowGroup {
            ParentView()
                .environmentObject(viewRouter)
                .environmentObject(totalTime)
        }
    }
}

struct WorkoutApp_Previews: PreviewProvider {
    static var previews: some View {
        ParentView()
            .environmentObject(ViewRouter())
            .environmentObject(Counter())
    }
}
