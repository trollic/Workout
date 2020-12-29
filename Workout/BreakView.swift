//
//  BreakView.swift
//  Workout
//
//  Created by Cece Zhu on 29/12/20.
//

import SwiftUI

struct BreakView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var totalMinutes: Counter
    @State var timeRemaining = 15
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        NavigationView{
            VStack{
                Text("Take a break!")
                Spacer()
                Text("\(timeRemaining) seconds left")
                    .onReceive(timer) { _ in
                        if self.timeRemaining > 0 {
                            self.timeRemaining -= 1
                        }
                        else { // Switch View back to workout page
                            viewRouter.currentPage = .page2
                        }
                    }
                Text("\(totalMinutes.minutesDuration) minutes left in Workout")
                Spacer()
            }
        }
        .navigationTitle("Tabata Workout App")

    }
}

struct BreakView_Previews: PreviewProvider {
    static var previews: some View {
        BreakView()
            .environmentObject(ViewRouter())
            .environmentObject(Counter())
    }
}

