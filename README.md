[![CI](https://github.com/alexshikov/IdealSize-iOS/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/alexshikov/IdealSize-iOS/actions/workflows/ci.yml)

# Overview

This is a simple SDK that helps to provide a size recommendations based on Body Mass Index (BMI).


# Requirements

iOS 16.0+, MacOS 13.0+

# Installation

### Swift Package Manager

Use Swift Package Manager to install IdealSize SDK:

```
import PackageDescription

let package = Package(
    name: "YOUR_PROJECT_NAME",
    dependencies: [
        .package(url: "https://github.com/alexshikov/IdealSize-iOS.git", .branch("main")), // TODO use tags
    ]
)
```

Then run `swift build`.

### CocoaPods & Carthage 

Not supported yet. Coming soon.

# Usage

### Get Recommendation from known Body Mass Index

```swift
import IdealSize

let size = try IdealSize.sizeByBMI(with: 18.0)
```

### Show Recommendations View

```swift
import IdealSize
import SwiftUI

struct ContentView: View {
    @State private var showModal = false

    var body: some View {
        VStack {
            // ... 

            Button("Get Recommendations") {
                showModal = true
            }
            .sheet(isPresented: $showModal) {
                InputView() // show IdealSize InputView
            }
        }
    }
}
```


# Roadmap

1. Add CocoaPod & Carthage support
2. ...

# Contribution

(Coming soon)

# Licence

MIT. See [License](./LICENSE)
