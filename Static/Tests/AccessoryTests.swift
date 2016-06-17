import XCTest
import Static

final class AccessoryTests: XCTestCase {
    func testInitWithAccessoryType() {
        let accessory: Row.Accessory = .Checkmark
        
        let row = Row(accessory: accessory)
        
        XCTAssertTrue(row.accessory == accessory)
    }
    
    func testInitWithSelectableAccessoryType() {
        let selection: Selection = {}
        let accessory: Row.Accessory = .DetailButton(selection)
        
        let row = Row(accessory: accessory)
        
        XCTAssertEqual(row.accessory, accessory)
        XCTAssertTrue(row.accessory.selection != nil)
    }
    
    func testInitWithAccessoryView() {
        let view = UIView()
        let accessory: Row.Accessory = .View(view)
        
        let row = Row(accessory: accessory)
        
        XCTAssertEqual(row.accessory, accessory)
        XCTAssertEqual(row.accessory.view!, view)
    }
}
