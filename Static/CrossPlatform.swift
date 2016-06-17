#if os(OSX)
    import AppKit
    public typealias Image = NSImage
    public typealias View = NSView
#else
    import UIKit
    public typealias Image = UIImage
    public typealias View = UIView
#endif
