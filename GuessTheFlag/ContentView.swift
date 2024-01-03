//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Mathew Szymanowski on 2024-01-03.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Color.red
                Color.blue
            }

            Text("Your content")
                .foregroundStyle(.primary)
                .padding(50)
                .background(.ultraThinMaterial)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
