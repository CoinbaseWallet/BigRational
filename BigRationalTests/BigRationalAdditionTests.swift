@testable import BigRational
import XCTest

class BigRationalAdditionTests: XCTestCase {
    func testAdditionSmallNumber() {
        guard
            let x = BigRational("1223456"),
            let y = BigRational("837567")
        else {
            return XCTFail("missing values")
        }

        let result = x + y
        let resultString = result.asDecimalString(precision: 100)

        XCTAssertEqual("2061023", resultString)
    }

    func testAdditionLargeNumber() {
        guard
            let x = BigRational(
                "12248579348653478965347865347865892764780346578034657034234597637856384765783465"
            ),
            let y = BigRational(
                "5647347865378657834657834678563475678346576"
            )
        else {
            return XCTFail("missing values")
        }

        let result = x + y
        let resultString = result.asDecimalString(precision: 100)

        let expected = "12248579348653478965347865347865892770427694443413314868892432316419860444130041"

        XCTAssertEqual(expected, resultString)
    }

    func testAdditionLargeDecimalNumber() {
        guard
            let x = BigRational(
                "34978637946739647364379.47896534786534786589"
            ),
            let y = BigRational(
                "786787769876789087897987564734786537.78563475678346576"
            )
        else {
            return XCTFail("missing values")
        }

        let result = x + y
        let resultString = result.asDecimalString(precision: 100)

        let expected = "786787769876824066535934304382150917.26460010464881362589"

        print("result \(result)")
        XCTAssertEqual(expected, resultString)
    }

    func testAdditionLargeNegativeDecimalNumber() {
        guard
            let x = BigRational(
                "-243587349857934875893475834534.345348753489759834758347"
            ),
            let y = BigRational(
                "786787769876789087897234783289473465763847653478657834657.3475634786578346578346"
            )
        else {
            return XCTFail("missing values")
        }

        let result = x + y
        let resultString = result.asDecimalString(precision: 100)

        let expected = "786787769876789087897234783045886115905912777585182000123.002214725168074823076253"

        print("result \(result)")
        XCTAssertEqual(expected, resultString)

        let result2 = y + x
        let resultString2 = result2.asDecimalString(precision: 100)

        let expected2 = "786787769876789087897234783045886115905912777585182000123.002214725168074823076253"

        print("result2 \(result2)")
        XCTAssertEqual(expected2, resultString2)
    }

    func testAdditionLargeNegativeDecimalNumbers() {
        guard
            let x = BigRational(
                "-243587349857934875893475834534.345348753489759834758347"
            ),
            let y = BigRational(
                "-8347578934657834605657863478056438.2347862384523685496235496235467983256794523976854"
            )
        else {
            return XCTFail("missing values")
        }

        let result = x + y
        let resultString = result.asDecimalString(precision: 100)

        let expected = "-8347822522007692540533756953890972.5801349919421283843818966235467983256794523976854"

        print("result \(result)")
        XCTAssertEqual(expected, resultString)
    }

    func testAdditionSmallNegativeDecimalNumber() {
        guard
            let x = BigRational(
                "-640.40"
            ),
            let y = BigRational(
                "849.49"
            )
        else {
            return XCTFail("missing values")
        }

        let result = x + y
        let resultString = result.asDecimalString(precision: 100)

        let expected = "209.09"

        print("result \(result)")
        XCTAssertEqual(expected, resultString)

        guard
            let a = BigRational(
                "640.40"
            ),
            let b = BigRational(
                "-849.49"
            )
        else {
            return XCTFail("missing values")
        }

        let result2 = a + b
        let result2String = result2.asDecimalString(precision: 17)

        let expected2 = "-209.09"

        print("result \(result2)")
        XCTAssertEqual(expected2, result2String)
    }
}
