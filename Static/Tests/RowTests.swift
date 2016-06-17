import XCTest
import Static

final class RowTests: XCTestCase {
    func testInit() {
        let selection: Selection = {}
        let context: Row.Context = [
            "Hello": "world"
        ]

        #if os(OSX)
            let row = Row(text: "Title", selection: selection, context: context, UUID: "1234")
        #else
            let row = Row(text: "Title", detailText: "Detail", selection: selection, context: context, UUID: "1234")
            XCTAssertEqual("Detail", row.detailText!)
        #endif
        
        XCTAssertEqual("1234", row.UUID)
        XCTAssertEqual("Title", row.text!)
        XCTAssertEqual("world", row.context?["Hello"] as? String)
    }

    func testInitWithImage() {
        let image = Image(named: "Setting")
        let row = Row(image: image)
        XCTAssertEqual(row.image, image)
    }

    func testHashable() {
        let row = Row()
        var hash = [
            row: "hi"
        ]

        XCTAssertEqual("hi", hash[row]!)
    }

    func testEquatable() {
        let row1 = Row()
        let row2 = Row()

        XCTAssertEqual(row1, row1)
        XCTAssertFalse(row1 == row2)
    }
}
