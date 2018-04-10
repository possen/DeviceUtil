import XCTest
@testable import DeviceUtil

class DeviceUtilTests: XCTestCase {

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
//        XCTAssertEqual(DeviceUtil().text, "Hello, World!")
        print(DeviceUtil.hardware)
        XCTAssertNotNil(DeviceUtil.hardware)
    }


    static var allTests = [
        ("testExample", testExample),
    ]
}
