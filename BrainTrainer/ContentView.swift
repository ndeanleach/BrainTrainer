//
//  ContentView.swift
//  BrainTrainer
//
//  Created by Nathan Leach on 9/5/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var appChoice = "📄"
    @State private var playerChoice = "🪨"
    
    @State private var winLose = Bool.random()
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    @State private var playerScore = 0
    
    let choices: [String: String] = ["🪨": "✂️", "✂️": "📄", "📄": "🪨"]
    
    var body: some View {
        NavigationStack {
            ZStack{
                LinearGradient(
                    gradient: Gradient(colors: [Color.cyan, Color.gray]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .edgesIgnoringSafeArea(.all)
                VStack{
                    Text(winLose == true ? "Win" : "Lose")
                        .font(.largeTitle)
                        .bold()
                    Text("Opponent: \(appChoice)")
                        .font(.title)
                        .padding(.bottom, 45)
                    HStack{
                        ForEach(Array(choices.keys), id: \.self){ choice in
                            Button("\(choice)"){
                                playerChoice = choice
                                check()
                            }
                            .font(.largeTitle)
                        }
                    }
                    Text("\(playerScore)")
                        .padding(45)
                        .font(.largeTitle)
                }
            }
            .navigationTitle("Brain Trainer")
            .alert(isPresented: $showingAlert){
                Alert(
                    title: Text("\(alertTitle)"),
                    message: Text("\(alertMessage)"),
                    primaryButton: .default(Text("OK")){
                        appChoice =  Array(choices.values).randomElement() ?? ""
                        winLose = Bool.random()
                        showingAlert = false
                    },
                    secondaryButton: .cancel()
                )
            }
        }
    }
    
    func check(){
        if winLose == true {
            if let appResult = choices[playerChoice], appResult == appChoice {
                alertTitle = "Correct"
                alertMessage = "+1 point"
                playerScore += 1
                showingAlert = true
            } else {
                alertTitle = "Incorrect"
                alertMessage = "-1 point"
                playerScore -= 1
                showingAlert = true
            }
        } else {
            if let appResult = choices[playerChoice], appResult != appChoice{
                alertTitle = "Correct"
                alertMessage = "+1 point"
                playerScore += 1
                showingAlert = true
            } else {
                alertTitle = "Incorrect"
                alertMessage = "-1 point"
                playerScore -= 1
                showingAlert = true
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
