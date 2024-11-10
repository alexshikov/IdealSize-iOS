import Testing
@testable import IdealSize

struct SizeWithBMI: Sendable {
    var bmi: Float
    var size: SizeType
}

struct IdealSizeTests {

    @Test("Throw error for negative BMI") 
    func testNegativeBMI() {
        #expect(throws: IdealSizeError.invalidBodyMassIndex) {
            try IdealSize.sizeByBMI(with: -1)
        }
    }

    @Test("Throw error for zero BMI") 
    func testZeroBMI() {
        #expect(throws: IdealSizeError.invalidBodyMassIndex) {
            try IdealSize.sizeByBMI(with: 0)
        }
    }

    @Test("Throw error for huge BMI")
    func testErrorForHugeBMI() {
        #expect(throws: IdealSizeError.invalidBodyMassIndex) {
            try IdealSize.sizeByBMI(with: 10000)
        }
    }

    @Test("Returns proper size", arguments: [
        SizeWithBMI(bmi: 15, size: SizeType.S),
        SizeWithBMI(bmi: 18.499, size: SizeType.S),
        SizeWithBMI(bmi: 18.5, size: SizeType.M),
        SizeWithBMI(bmi: 20, size: SizeType.M),
        SizeWithBMI(bmi: 24.99, size: SizeType.M),
        SizeWithBMI(bmi: 25, size: SizeType.L),
        SizeWithBMI(bmi: 29.99, size: SizeType.L),
        SizeWithBMI(bmi: 30, size: SizeType.XL),
        SizeWithBMI(bmi: 50, size: SizeType.XL),
        SizeWithBMI(bmi: 90, size: SizeType.XL),
    ])
    func testSizeByBMI(_ sizeWithBMI: SizeWithBMI) throws {
        let size = try IdealSize.sizeByBMI(with: sizeWithBMI.bmi)
        #expect(size == sizeWithBMI.size)
    }
}
