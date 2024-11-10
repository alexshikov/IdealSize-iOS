//
//  IdealSize.swift
//  IdeaSize
//
//  Created by Oleksii Shykov on 09.11.2024.
//
// TODO add license description

import SwiftUI

/// Size of the (Body / Cloths / ?)
public enum SizeType: String, Sendable {
    case S
    case M
    case L
    case XL
}

public enum IdealSizeError: Error {
    /// BMI value is outside of reasonable range 1-100
    case invalidBodyMassIndex
}

public struct IdealSize {

    /**
    Provides Recommended Size based on the BMI (Body Mass Index)
    - parameter bmi: Body Mass Index
    - throws: An error of type IdealSizeError when BMI value is outside of reasonable range 1-100
    - returns: Recommended size (type SizeType)
    */
    public static func sizeByBMI(with bmi: Float) throws -> SizeType {
        if bmi < 1 || bmi >= 100 {
            throw IdealSizeError.invalidBodyMassIndex
        }

        if bmi < 18.5 { return SizeType.S }
        if bmi < 25 { return SizeType.M }
        if bmi < 30 { return SizeType.L }

        return SizeType.XL
    }
}
