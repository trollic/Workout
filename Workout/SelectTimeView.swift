//
//  SelectTimeView.swift
//  Workout
//
//  Created by Cece Zhu on 29/12/20.
//

import SwiftUI

class Counter: ObservableObject {
    @Published var minutesDuration: Int = 0
}


struct SelectTimeView: View {
    @EnvironmentObject var totalTime: Counter
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        NavigationView{
            VStack{
                Text("Choose your workout duration")
                Spacer()
                ForEach(1 ..< 5) { number in
                    Button(action: {
                        // Set total time minutes duration
                        totalTime.minutesDuration = (number*10)
                        // Switch to Workout CountDown view
                        viewRouter.currentPage = .page2
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
        SelectTimeView()
            .environmentObject(ViewRouter())
            .environmentObject(Counter())
    }
}
