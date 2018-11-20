@testable import BigRational
import XCTest

class BigRationalDivisionTests: XCTestCase {
    func testDivisionSmallNumber() {
        guard
            let x = BigRational("1223456"),
            let y = BigRational("837567")
        else {
            return XCTFail("missing values")
        }

        let result = x / y
        let resultString = result.asDecimalString(precision: 100)

        let expected = "1.460726126984468108222983952328589832216407762005905199225852976537996363" + "27601254586200268157651865462"

        XCTAssertEqual(expected, resultString)

        let smallPrecisionResult = result.asDecimalString(precision: 3)

        XCTAssertEqual("1.4607", smallPrecisionResult)
    }

    func testDivisionLargeNumber() {
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

        let result = x / y
        let resultString = result.asDecimalString(precision: 125)

        let expected = "2168908245186026780316675332317175157.3173578101430018879775655968137125204006906" + "90183117912734979827602984952742326360120389246772681767620816486053016968390016567"

        XCTAssertEqual(expected, resultString)
    }

    func testDivisionLargeDecimalNumber() {
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

        let result = x / y
        let resultString = result.asDecimalString(precision: 100)

        let expected = "0.0000000000000444575262681285700789105772939319358415701006397003034842691180" +
            "9589617154761451398744491"

        print("result \(result)")
        XCTAssertEqual(expected, resultString)
    }

    func testDivisionLargeNegativeDecimalNumber() {
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

        let result = x / y
        let resultString = result.asDecimalString(precision: 179)

        let expected = "-0.00000000000000000000000000030959727538225541886327809138044670607304785115301275" +
            "6287147903713354294063197840370160332723534548230544359317540064232479612407706580792019969533156203"

        print("result \(result)")
        XCTAssertEqual(expected, resultString)

        let result2 = y / x
        let resultString2 = result2.asDecimalString(precision: 100)

        let expected2 = "-3230002585666537306203895063.663980784736382920648963518602566216561936741554114541" +
            "01895986062264388208336461454808791493248883681"

        print("result2 \(result2)")
        XCTAssertEqual(expected2, resultString2)
    }

    func testDivisionLargeNegativeDecimalNumbers() {
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

        let result = x / y
        let resultString = result.asDecimalString(precision: 124)

        let expected = "0.000029180598562129016502390976365771446313647213039544440061958047276106267910940771301" +
            "61928178962965240709975524635446019048"

        print("result \(result)")
        XCTAssertEqual(expected, resultString)
    }

    func testDivisionSmallNegativeDecimalNumber() {
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

        let result = x / y
        let resultString = result.asDecimalString(precision: 17)

        let expected = "-0.753864083155775818"

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

        let result2 = a / b
        let result2String = result2.asDecimalString(precision: 17)

        let expected2 = "-0.753864083155775818"

        print("result \(result2)")
        XCTAssertEqual(expected2, result2String)
    }
}
