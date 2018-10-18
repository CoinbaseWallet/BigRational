@testable import BigRational
import XCTest

class BigRationalModTests: XCTestCase {
    func testModSmallNumber() {
        
        guard
            let x = BigRational("1223456"),
            let y = BigRational("837567")
        else {
            return XCTFail("missing values")
        }

        let result = x % y
        let resultString = result.asDecimalString(precision: 100)

        XCTAssertEqual("385889", resultString)
    }

    func testModLargeNumber() {
        
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

        let result = x % y
        let resultString = result.asDecimalString(precision: 125)

        let expected = "1792229951672327077961575539247896022571033"

        XCTAssertEqual(expected, resultString)
    }

    func testModLargeDecimalNumber() {
        
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

        let result = x % y
        let resultString = result.asDecimalString(precision: 100)

        let expected = "34978637946739647364379.47896534786534786589"

        print("result \(result)")
        XCTAssertEqual(expected, resultString)
    }

    func testModLargeNegativeDecimalNumber() {
        
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

        let result = x % y
        let resultString = result.asDecimalString(precision: 100)

        let expected = "-243587349857934875893475834534.345348753489759834758347"

        print("result \(result)")
        XCTAssertEqual(expected, resultString)

        let result2 = y % x
        let resultString2 = result2.asDecimalString(precision: 100)

        let expected2 = "161737319710527451638219757830.323968656901729906493739"

        print("result2 \(result2)")
        XCTAssertEqual(expected2, resultString2)
    }

    func testModLargeNegativeDecimalNumbers() {
        
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

        let result = x % y
        let resultString = result.asDecimalString(precision: 100)

        let expected = "-243587349857934875893475834534.345348753489759834758347"

        print("result \(result)")
        XCTAssertEqual(expected, resultString)
    }

    func testModSmallNegativeDecimalNumber() {
        
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

        let result = x % y
        let resultString = result.asDecimalString(precision: 100)

        let expected = "-640.4"

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

        let result2 = a % b
        let result2String = result2.asDecimalString(precision: 17)

        let expected2 = "640.4"

        print("result \(result2)")
        XCTAssertEqual(expected2, result2String)
    }
}
