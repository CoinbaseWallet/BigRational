@testable import BigRational
import XCTest

class BigRationalPowerTests: XCTestCase {
    func testPowerWithSmallNumber() {
        guard let x = BigRational("1223456") else { return XCTFail("missing values") }

        let result = x.power(10)

        XCTAssertEqual(
            "7514213861687882321508436906751650375244395058222039276978176",
            result.asDecimalString(precision: 10)
        )
    }

    func testPowerWithSmallNegativeNumber() {
        guard let x = BigRational("-1223456") else { return XCTFail("missing values") }

        let result = x.power(10)
        let expected = "7514213861687882321508436906751650375244395058222039276978176"

        XCTAssertEqual(expected, result.asDecimalString(precision: 10))
    }

    func testPowerWithLargeNumber() {
        guard let x = BigRational("385889385889385889385889385889385889385889385889") else {
            return XCTFail("missing values")
        }

        let result = x.power(10)
        let expected = "732197652489266841567431622819579381035914900488509344686617643132178009368328072579652663" +
            "8290354423298769250914334841360521712988917661797022504952488932758017249027482011830209741907400743" +
            "6511560288923734400945263983858360706665870286917880791594476548629793007654238907694505195119676" +
            "745687510175207308220889236943325232090686630233655103596908518496428206120850456007457470" +
            "367758276602529756422725981695816455779223445102022979291522248008667305296884542382853133050305601"

        XCTAssertEqual(expected, result.asDecimalString(precision: 10))
    }

    func testPowerWithLargeNegativeNumber() {
        guard let x = BigRational("456734567543458765434356789") else { return XCTFail("missing values") }

        let result = x.power(10)
        let expected = "395037951355766610359245575126066482713110168666662983956045348801475886" + "02283501908534394862670364710471605680772957464875155437961045658214336047364273990" +
            "576258173327787528972109059568714101107260596520325391537827525295328585965408247483759" +
            "7785835599375601280736601"

        XCTAssertEqual(expected, result.asDecimalString(precision: 10))
    }
}
