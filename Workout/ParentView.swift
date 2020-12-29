//
//  ParentView.swift
//  Workout
//
//  Created by Cece Zhu on 29/12/20.
//

import SwiftUI

struct ParentView: View {
    @EnvironmentObject var viewRouter : ViewRouter

    var body: some View {
        switch
            viewRouter.currentPage
            {
        case .page1:
            SelectTimeView(viewRouter: viewRouter)
        case .page2:
            WorkoutCountDownView(viewRouter: viewRouter)
        case .page3:
            BreakView(viewRouter: viewRouter)
        }
    }
}

struct ParentView_Previews: PreviewProvider {
    static var previews: some View {
        ParentView().environmentObject(ViewRouter())
    }
}
