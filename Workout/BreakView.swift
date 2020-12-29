//
//  BreakView.swift
//  Workout
//
//  Created by Cece Zhu on 29/12/20.
//

import SwiftUI

struct BreakView: View {
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
                    }
                Spacer()
            }
        }
        .navigationTitle("Tabata Workout App")

    }
}

struct BreakView_Previews: PreviewProvider {
    static var previews: some View {
        BreakView()
    }
}

