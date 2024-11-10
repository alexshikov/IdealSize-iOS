//
//  RecommendationsView.swift
//  Example
//
//  Created by Oleksii Shykov on 09.11.2024.
//

import SwiftUI

@available(iOS 16.0, macOS 12.0, *)
internal struct ResultView: View {
    let size: SizeType
    let bmi: Float
    let dismiss: DismissAction?

    public var body: some View {
        VStack {
            Text("Your Recommended Size: \(size.rawValue)")
                .font(.largeTitle)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 20)
            
            Spacer()

            Text("Based on your info, size \(size.rawValue) is recommended.")
                .font(.title)
                .padding(.all, 20)

            Spacer()
            
            Button(action: {
                dismiss?()
            }) {
                Text("Ok")
                    .frame(maxWidth: .infinity)
            }
                .buttonStyle(.borderedProminent)
                .frame(width: 250)
                .padding(.top, 20)

        }
        .padding()
        // .navigationTitle("Recommendation")
    }
}

