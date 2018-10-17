@testable import BigRational
import XCTest

class BigRationalSubtractionTests: XCTestCase {
    func testSubtractionSmallNumber() {
        let decimalSeparator = Locale.current.decimalSeparator ?? "."
        guard
            let x = BigRational("1223456", decimalSeparator: decimalSeparator),
            let y = BigRational("837567", decimalSeparator: decimalSeparator)
        else {
            return XCTFail("missing values")
        }

        let result = x - y
        let resultString = result.asDecimalString(precision: 100, decimalSeparator: decimalSeparator)

        XCTAssertEqual("385889", resultString)
    }

    func testSubtractionLargeNumber() {
        let decimalSeparator = Locale.current.decimalSeparator ?? "."
        guard
            let x = BigRational(
                "12248579348653478965347865347865892764780346578034657034234597637856384765783465",
                decimalSeparator: decimalSeparator
            ),
            let y = BigRational(
                "5647347865378657834657834678563475678346576",
                decimalSeparator: decimalSeparator
            )
        else {
            return XCTFail("missing values")
        }

        let result = x - y
        let resultString = result.asDecimalString(precision: 100, decimalSeparator: decimalSeparator)

        let expected = "12248579348653478965347865347865892759132998712655999199576762959292909087436889"

        XCTAssertEqual(expected, resultString)
    }

    func testSubtractionLargeDecimalNumber() {
        let decimalSeparator = Locale.current.decimalSeparator ?? "."
        guard
            let x = BigRational(
                "34978637946739647364379.47896534786534786589",
                decimalSeparator: decimalSeparator
            ),
            let y = BigRational(
                "786787769876789087897987564734786537.78563475678346576",
                decimalSeparator: decimalSeparator
            )
        else {
            return XCTFail("missing values")
        }

        let result = x - y
        let resultString = result.asDecimalString(precision: 100, decimalSeparator: decimalSeparator)

        let expected = "-786787769876754109260040825087422158.30666940891811789411"

        print("result \(result)")
        XCTAssertEqual(expected, resultString)
    }

    func testSubtractionLargeNegativeDecimalNumber() {
        let decimalSeparator = Locale.current.decimalSeparator ?? "."
        guard
            let x = BigRational(
                "-243587349857934875893475834534.345348753489759834758347",
                decimalSeparator: decimalSeparator
            ),
            let y = BigRational(
                "786787769876789087897234783289473465763847653478657834657.3475634786578346578346",
                decimalSeparator: decimalSeparator
            )
        else {
            return XCTFail("missing values")
        }

        let result = x - y
        let resultString = result.asDecimalString(precision: 100, decimalSeparator: decimalSeparator)

        let expected = "-786787769876789087897234783533060815621782529372133669191.692912232147594492592947"

        print("result \(result)")
        XCTAssertEqual(expected, resultString)
    }

    func testSubtractionSmallNegativeDecimalNumber() {
        let decimalSeparator = Locale.current.decimalSeparator ?? "."
        guard
            let x = BigRational(
                "-64040",
                decimalSeparator: decimalSeparator
            ),
            let y = BigRational(
                "84949",
                decimalSeparator: decimalSeparator
            )
        else {
            return XCTFail("missing values")
        }

        let result = x - y
        let resultString = result.asDecimalString(precision: 100, decimalSeparator: decimalSeparator)

        let expected = "-148989"

        print("result \(result)")
        XCTAssertEqual(expected, resultString)
    }
}
