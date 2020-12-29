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
    @StateObject var viewRouter: ViewRouter
    @ObservedObject var arrayEx = Exercisies()
    @ObservedObject var totalMinutes = Counter()
    
    @State var timeRemaining = 50
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
                        // TODO: Switch to other view once this Workout timer expires. i.e. to Break if total time is remaining or to back to SelectTimeView if complete
                        else {
                            viewRouter
                                // at the moment only going to BreakView
                                .currentPage = .page3
                        }
                
                
                    }
                Spacer()
            }
        
        }.navigationTitle("Tabata Workout App")

    }
}

struct WorkoutCountDownView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutCountDownView(viewRouter: ViewRouter())
    }
}
