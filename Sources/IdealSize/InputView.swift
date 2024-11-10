//
//  ContentView.swift
//  Example
//
//  Created by Oleksii Shykov on 09.11.2024.
//

import SwiftUI

@available(iOS 16.0, macOS 13.0, *)
public struct InputView: View {
    @State private var weight: String = ""
    @State private var height: String = ""
    @State private var errorMessage: String?
    @State private var showResult: Bool = false
    @State private var size: SizeType?
    @State private var bmi: Float?
    @Environment(\.dismiss) private var dismiss

    public init() {
    }

    public var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Spacer()

                if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .font(.footnote)
                        .padding(.bottom, 10)
                }

                HStack {
                    Text("Height:")
                        .frame(width: 60, alignment: .leading)
                    TextField("Enter height", text: $height)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
#if os(iOS)
    .keyboardType(.decimalPad)
#endif
                        .frame(width: 200)
                    Text("cm")
                }

                HStack {
                    Text("Weight:")
                        .frame(width: 60, alignment: .leading)
                    TextField("Enter weight", text: $weight)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
#if os(iOS)
    .keyboardType(.decimalPad)
#endif
                        .frame(width: 200)
                    Text("kg")
                }

                Button(action: self.recommendTapped) {
                    Text("Get Size Recommendation")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .frame(width: 250)
                .padding(.top, 20)

                Spacer()

                NavigationLink(
                    destination: ResultView(
                        size: size ?? SizeType.S, bmi: bmi ?? 0,
                        dismiss: dismiss
                    )
                        .onDisappear(perform: { bmi = nil }), // ensure we can open ResultView again after Back clicked
                    isActive: Binding(
                        get: { size != nil && bmi != nil },
                        set: { _ in }
                    )
                ) {
                    EmptyView()
                }
            }
            .padding()
            .navigationTitle("Find Your Perfect Fit")
        }
    }

    private func recommendTapped() {
        // Convert height and weight to Float and ensure they are possitive numbers
        guard let heightValue = Float(height), heightValue > 0,
            let weightValue = Float(weight), weightValue > 0
        else {
            errorMessage =
                "Height and weight should be possitive numbers."
            return
        }

        // Clear error message
        errorMessage = nil

        // Calculate BMI: BMI = weight (kg) / (height (m) * height (m))
        let heightInMeters = heightValue / 100
        bmi = weightValue / (heightInMeters * heightInMeters)

        do {
            size = try IdealSize.sizeByBMI(with: bmi!)
            showResult = true
        } catch is IdealSizeError {
            errorMessage =
                "Height or Weight are outside of natural body parameters"
        } catch {
            errorMessage = "Unknown error"
        }

        print(
            "Calculated BMI: \(bmi!) and Size: \(size != nil ? size!.rawValue : "-")"
        )
    }
}
