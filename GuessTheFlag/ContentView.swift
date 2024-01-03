//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Mathew Szymanowski on 2024-01-03.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"]
        .shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showAlert = false
    
    @State private var scoreTitle = ""
    @State private var scoreColor = Color.clear
    @State private var score = 0
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 300, endRadius: 400)
                .ignoresSafeArea()

            VStack{
                Spacer()
                
                Text("Guess the Flag")
                        .font(.largeTitle.bold())
                        .foregroundStyle(.white)
                
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .foregroundStyle(.white)
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                            askQuestion()
                        } label: {
                            Image(countries[number])
                                .clipShape(.capsule)
                                .shadow(radius: 5)
                        }
                        
                    }
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .padding(.vertical, 30)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("\(scoreTitle)")
                    .foregroundStyle(scoreColor)
                    .font(.title.bold())

                Text("Score: \(score)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                
                Spacer()
            }
            .padding()
        }
        .alert("Reset", isPresented: $showAlert) {
            Button("Reset", role: .destructive,action: reset)
            Button("Cancel", role: .cancel,action: reset)
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            scoreColor = .green
            score += 1
        } else {
            scoreTitle = "Wrong"
            scoreColor = .red
            score -= 1
        }
        
        if score == 12 || score == -3 {
            showAlert = true
        }
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func reset() {
        scoreColor = Color.clear
        score = 0
    }
}

#Preview {
    ContentView()
}
