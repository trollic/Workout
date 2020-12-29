//
//  ParentView.swift
//  Workout
//
//  Created by Cece Zhu on 29/12/20.
//

import SwiftUI

struct ParentView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var totalTime: Counter

    var body: some View {
        switch
            viewRouter.currentPage
            {
        case .page1:
            SelectTimeView()
        case .page2:
            WorkoutCountDownView()
        case .page3:
            BreakView()
        }
    }
}

struct ParentView_Previews: PreviewProvider {
    static var previews: some View {
        ParentView()
            .environmentObject(ViewRouter())
            .environmentObject(Counter())
    }
}
