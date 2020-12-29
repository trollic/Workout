//
//  WorkoutCountDownView.swift
//  Workout
//
//  Created by Cece Zhu on 29/12/20.
//

import SwiftUI

class Exercisies: ObservableObject {
    @Published var excercises = ["Plank", "Side Plank", "Push ups", "Burpees", "Jumping Jacks", "V sit ups", "Sit ups"].shuffled()

}

struct WorkoutCountDownView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @ObservedObject var arrayEx = Exercisies()
    @EnvironmentObject var totalMinutes: Counter
    
    @State var timeRemaining = 45
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        NavigationView{
            VStack{
                // TODO: Connect dynamic variable to exercises  array in SelectTimeView
                Text("Do \(arrayEx.excercises[0])!")
                Spacer()
                Text("\(timeRemaining) seconds left")
                    .onReceive(timer) { _ in
                        if self.timeRemaining > 0 {
                            self.timeRemaining -= 1
                        }
                        // Once time is up, swtich to relevant new view
                        else {
                            if (totalMinutes.minutesDuration > 0) {
                                // decrement
                                totalMinutes.minutesDuration -= 1
                                // go to break
                                viewRouter
                                    .currentPage = .page3
                            } else { // if time is up, return to select time view
                                totalMinutes.minutesDuration = 0
                                viewRouter
                                    .currentPage = .page1
                                
                            }

                        }
                
                
                    }

                Text("\(totalMinutes.minutesDuration) minutes left in Workout")
                Spacer()
            }
        
        }.navigationTitle("Tabata Workout App")

    }
}

struct WorkoutCountDownView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutCountDownView()
            .environmentObject(ViewRouter())
            .environmentObject(Counter())
    }
}
