//
//  SelectTimeView.swift
//  Workout
//
//  Created by Cece Zhu on 29/12/20.
//

import SwiftUI

struct SelectTimeView: View {
    @State private var excerises = ["Plank", "Side Plank", "Push ups", "Burpees", "Jumping Jacks", "V sit ups", "Sit ups"].shuffled()

    var body: some View {
        NavigationView{
            VStack{
                Text("Choose your workout duration")
                Spacer()
                ForEach(1 ..< 5) { number in
                    Button(action: {
                        // TODO: do something when button is tapped
                        
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
        SelectTimeView()
    }
}
