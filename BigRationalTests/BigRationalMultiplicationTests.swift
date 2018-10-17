@testable import BigRational
import XCTest

class BigRationalMultiplicationTests: XCTestCase {
    func testMultiplicationSmallNumber() {
        let decimalSeparator = Locale.current.decimalSeparator ?? "."
        guard
            let x = BigRational("1223456", decimalSeparator: decimalSeparator),
            let y = BigRational("837567", decimalSeparator: decimalSeparator)
        else {
            return XCTFail("missing values")
        }

        let result = x * y
        let resultString = result.asDecimalString(precision: 100, decimalSeparator: decimalSeparator)

        XCTAssertEqual("1024726371552", resultString)
    }

    func testMultiplicationLargeNumber() {
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

        let result = x * y
        let resultString = result.asDecimalString(precision: 100, decimalSeparator: decimalSeparator)

        let expected = "6917198843853933559357547377484180318666156016070984643203755268020013" +
            "4716013714367584953063903295899465693548650440165840"
        XCTAssertEqual(expected, resultString)
    }

    func testMultiplicationLargeDecimalNumber() {
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

        let result = x * y
        let resultString = result.asDecimalString(precision: 100, decimalSeparator: decimalSeparator)

        let expected = "27520764543442916034902652271377244921823070331112934" +
            "626032.3665319064057172046826000162538869264"

        print("result \(result)")
        XCTAssertEqual(expected, resultString)
    }

    func testMultiplicationLargeNegativeDecimalNumber() {
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

        let result = x * y
        let resultString = result.asDecimalString(precision: 100, decimalSeparator: decimalSeparator)

        let expected = "-19165154776492177825676307611063107061923888097046931064294386025296970249006408869" +
            "3023.9529642732621241613472371564240534347212954062"

        print("result \(result)")
        XCTAssertEqual(expected, resultString)
    }

    func testMultiplicationSmallNegativeDecimalNumber() {
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

        let result = x * y
        let resultString = result.asDecimalString(precision: 100, decimalSeparator: decimalSeparator)

        let expected = "-5440133960"

        print("result \(result)")
        XCTAssertEqual(expected, resultString)
    }
}
