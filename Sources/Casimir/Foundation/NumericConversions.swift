import Foundation
import CoreGraphics

public extension Double {
    var float: Float {
        Float(self)
    }
    
    var int: Int {
        Int(self)
    }

    var string: String {
        String(self)
    }
}

public extension Optional where Wrapped == Double {
    var float: Float? {
        self?.float ?? nil
    }
    var int: Int? {
        self?.int ?? nil
    }

    var string: String? {
        self?.string ?? nil
    }
}

public extension Float {
    var int: Int {
        Int(self)
    }

    var string: String {
        String(self)
    }
}

public extension Optional where Wrapped == Float {
    var int: Int? {
        self?.int ?? nil
    }

    var string: String? {
        self?.string ?? nil
    }
}

public extension Int {
    var float: Float {
        Float(self)
    }

    var string: String {
        String(self)
    }
}

public extension Optional where Wrapped == Int {
    var float: Float? {
        self?.float ?? nil
    }

    var string: String? {
        self?.string ?? nil
    }
}


// MARK: Int16 / Int32 / Int64 shenanigans

public extension Int {
    var int16: Int16 {
        Int16(self)
    }
    
    var int32: Int32 {
        Int32(self)
    }
    
    var int64: Int64 {
        Int64(self)
    }
}

public extension Int16 {
    var int: Int {
        Int(self)
    }
}

public extension Int32 {
    var int: Int {
        Int(self)
    }
}

public extension Int64 {
    var int: Int {
        Int(self)
    }
}

// MARK: CGFloat

public extension Float {
    var cgFloat: CGFloat {
        CGFloat(self)
    }
}

public extension Double {
    var cgFloat: CGFloat {
        self.float.cgFloat
    }
}

public extension Int {
    var cgFloat: CGFloat {
        self.float.cgFloat
    }
}

public extension CGFloat {
    var float: Float {
        Float(self)
    }
    
    var int: Int {
        Int(self)
    }
}
