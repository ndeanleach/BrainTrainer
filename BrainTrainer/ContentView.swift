//
//  ContentView.swift
//  BrainTrainer
//
//  Created by Nathan Leach on 9/5/23.
//

import SwiftUI

// testing upload

struct ContentView: View {
    
    @State private var appChoice = "📄"
    @State private var winLose = Bool.random()
    @State private var playerChoice = "🪨"
    @State private var alertMessage = ""
    @State private var showingAlert = false
    @State private var playerScore = 0
    
    var optionList = ["🪨", "📄", "✂️"].shuffled()
    
    var body: some View {
        NavigationStack {
            VStack{
                Text(winLose == true ? "Win" : "Lose")
                    .font(.largeTitle)
                    .bold()
                Text("Opponent: \(appChoice)")
                    .font(.title)
                    .padding(.bottom, 45)
                HStack{
                    ForEach(optionList, id: \.self){
                        Button("\($0)"){
                            check()
                        }
                        .font(.largeTitle)
                    }
                }
                Text("\(playerScore)")
                    .padding(45)
                    .font(.largeTitle)
            }
            .navigationTitle("Brain Trainer")
        }
        .padding()
    }
    
    func check(){
        if winLose == true{
            if playerChoice == "🪨" && appChoice == "✂️"{
                // add alert message
                playerScore += 1
            } else if playerChoice == "✂️" && appChoice == "📄"{
                //add alert message
                playerScore += 1
            } else if playerChoice == "📄" && appChoice == "🪨"{
                //add alert message
                playerScore += 1
            } else{
                //add alert message
            }
        } else if winLose == false {
            if playerChoice != "🪨" && appChoice == "✂️"{
                // add alert message
                playerScore += 1
            } else if playerChoice != "✂️" && appChoice == "📄"{
                //add alert message
                playerScore += 1
            } else if playerChoice != "📄" && appChoice == "🪨"{
                //add alert message
                playerScore += 1
            } else{
                //add alert message
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
