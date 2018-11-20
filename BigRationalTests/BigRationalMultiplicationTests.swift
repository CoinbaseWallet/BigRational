@testable import BigRational
import XCTest

class BigRationalMultiplicationTests: XCTestCase {
    func testMultiplicationSmallNumber() {
        guard
            let x = BigRational("1223456"),
            let y = BigRational("837567")
        else {
            return XCTFail("missing values")
        }

        let result = x * y
        let resultString = result.asDecimalString(precision: 100)

        XCTAssertEqual("1024726371552", resultString)
    }

    func testMultiplicationLargeNumber() {
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

        let result = x * y
        let resultString = result.asDecimalString(precision: 100)

        let expected = "6917198843853933559357547377484180318666156016070984643203755268020013" +
            "4716013714367584953063903295899465693548650440165840"
        XCTAssertEqual(expected, resultString)
    }

    func testMultiplicationLargeDecimalNumber() {
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

        let result = x * y
        let resultString = result.asDecimalString(precision: 100)

        let expected = "27520764543442916034902652271377244921823070331112934" +
            "626032.3665319064057172046826000162538869264"

        print("result \(result)")
        XCTAssertEqual(expected, resultString)
    }

    func testMultiplicationLargeNegativeDecimalNumber() {
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

        let result = x * y
        let resultString = result.asDecimalString(precision: 100)

        let expected = "-19165154776492177825676307611063107061923888097046931064294386025296970249006408869" +
            "3023.9529642732621241613472371564240534347212954062"

        print("result \(result)")
        XCTAssertEqual(expected, resultString)
    }

    func testMultiplicationLargeNegativeDecimalNumbers() {
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

        let result = x * y
        let resultString = result.asDecimalString(precision: 100)

        let expected = "2033364630423225250989321920784171113818480815879200329568084524.6381447639506829" +
            "091726392807841869206263141764512033896915391756511300338"

        print("result \(result)")
        XCTAssertEqual(expected, resultString)

        let result2 = y * x
        let resultString2 = result2.asDecimalString(precision: 100)

        let expected2 = "2033364630423225250989321920784171113818480815879200329568084524.6381447639506829" +
            "091726392807841869206263141764512033896915391756511300338"

        print("result2 \(result2)")
        XCTAssertEqual(expected2, resultString2)
    }

    func testMultiplicationSmallNegativeDecimalNumber() {
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

        let result = x * y
        let resultString = result.asDecimalString(precision: 100)

        let expected = "-544013.396"

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

        let result2 = a * b
        let result2String = result2.asDecimalString(precision: 17)

        let expected2 = "-544013.396"

        print("result \(result2)")
        XCTAssertEqual(expected2, result2String)
    }
}
