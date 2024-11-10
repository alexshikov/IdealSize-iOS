//
//  ContentView.swift
//  Example
//
//  Created by Seifer on 10.11.2024.
//

import IdealSize
import SwiftUI

struct ContentView: View {
    @State private var recommendedSize: String?
    @State private var showModal = false

    var body: some View {
        VStack {
            if let size = recommendedSize {
                Text("Recommended Size: \(size)")
                    .padding()
            }

            Button("Get Recommendations") {
                showModal = true
            }
            .sheet(isPresented: $showModal) {
                InputView()
            }
        }
    }
}

#Preview {
    ContentView()
}
