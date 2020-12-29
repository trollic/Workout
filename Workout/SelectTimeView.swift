//
//  SelectTimeView.swift
//  Workout
//
//  Created by Cece Zhu on 29/12/20.
//

import SwiftUI

class Counter: ObservableObject {
    @Published var minutesDuration: Int?
}
//struct ViewSwitch: View {
//    @ObservedObject var totalTime = Counter()
//    // TODO: do something using count to switch between views
//    if (totalTime.minutesDuration != nil) {
//        currentView = WorkoutCountDownView()
//    }
//    else {
//        return SelectTimeView()
//    }
//    
//    var body: some View {
//        NavigationLink(
//            destination: /*@START_MENU_TOKEN@*/Text("Destination")/*@END_MENU_TOKEN@*/,
//            label: {
//                /*@START_MENU_TOKEN@*/Text("Navigate")/*@END_MENU_TOKEN@*/
//            })
//    }
//}

struct SelectTimeView: View {
    @ObservedObject var totalTime = Counter()
    @StateObject var viewRouter: ViewRouter
    
    var body: some View {
        NavigationView{
            VStack{
                Text("Choose your workout duration")
                Spacer()
                ForEach(1 ..< 5) { number in
                    Button(action: {
                        // TODO: do something when button is tapped
                        totalTime.minutesDuration = number*10
                        // TODO: switch to Workout CountDown view
                        // self.showSelf = false
                        // TODO: Countdown based on number*10 duration
                    }, label: {
                        Text("\(number*10) minutes")
                    })
                    .padding()
                    
                }
                Spacer()
            }
        }.navigationTitle("Tabata Workout App")
    }
}

struct SelectTimeView_Previews: PreviewProvider {
    static var previews: some View {
        SelectTimeView(viewRouter: ViewRouter())
    }
}
