//
//  WorkoutCountDownView.swift
//  Workout
//
//  Created by Cece Zhu on 29/12/20.
//

import SwiftUI

struct WorkoutCountDownView: View {
    @State var timeRemaining = 50
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        NavigationView{
            VStack{
                // TODO: Connect to exercises array in SelectTimeView
                Text("Do XYZ Workout!")
                Spacer()
                Text("\(timeRemaining) seconds left")
                    .onReceive(timer) { _ in
                        if self.timeRemaining > 0 {
                            self.timeRemaining -= 1
                        }
                        // TODO: Switch to other view once this Workout timer expires. i.e. to Break if total time is remaining or to back to SelectTimeView if complete
                    }
                Spacer()
            }
        }
        .navigationTitle("Tabata Workout App")

    }
}

struct WorkoutCountDownView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutCountDownView()
    }
}
