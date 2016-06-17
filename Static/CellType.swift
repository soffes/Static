#if os(OSX)
    import AppKit
#else
    import UIKit
#endif

public protocol CellType: class {
    static func description() -> String
    
    #if os(OSX)
        static func nib() -> NSNib?
    #else
        static func nib() -> UINib?
    #endif

    func configure(row row: Row)
}

#if os(OSX)
    extension CellType {
        public static func nib() -> NSNib? {
            return nil
        }
    }

    
    extension CellType where Self: NSTableCellView {
        public func configure(row row: Row) {
//            textLabel?.text = row.text
//            detailTextLabel?.text = row.detailText
//            imageView?.image = row.image
//            accessoryType = row.accessory.type
//            accessoryView = row.accessory.view
        }
    }
#else
    extension CellType {
        public static func nib() -> UINib? {
            return nil
        }
    }

    
    extension CellType where Self: UITableViewCell {
        public func configure(row row: Row) {
            textLabel?.text = row.text
            detailTextLabel?.text = row.detailText
            imageView?.image = row.image
            accessoryType = row.accessory.type
            accessoryView = row.accessory.view
        }
    }
#endif
