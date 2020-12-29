//
//  BreakView.swift
//  Workout
//
//  Created by Cece Zhu on 29/12/20.
//

import SwiftUI

struct BreakView: View {
    @StateObject var viewRouter: ViewRouter
    @State var timeRemaining = 10
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
                        // TODO: Switch to other view once Break timer expires
                        else { // at the moment going back to workout page
                            viewRouter.currentPage = .page2
                        }
                    }
                Spacer()
            }
        }
        .navigationTitle("Tabata Workout App")

    }
}

struct BreakView_Previews: PreviewProvider {
    static var previews: some View {
        BreakView(viewRouter: ViewRouter())
    }
}

