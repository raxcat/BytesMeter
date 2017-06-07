

#if os(iOS)
    import UIKit
#elseif os(OSX)
    import Foundation
#endif

@objc public class BytesMeter : NSObject {
    
    dynamic var bytesCount: UInt = 0 {
        didSet{
            stopTime = CFAbsoluteTimeGetCurrent()
        }
    }
    
    /**
     Add bttes count.
     */
    @objc public func addBytesCount(_ count:UInt){
        bytesCount += count
    }
    
    private dynamic var startTime: CFAbsoluteTime = 0 {
        didSet{
            bytesCount = 0;
        }
    }
    private dynamic var stopTime: CFAbsoluteTime = 0
    
    
    /**
     Reset/Start counting. All values will be set to zero.
     */
    @objc public func reset(){
        startTime = CFAbsoluteTimeGetCurrent()
        stopTime = startTime;
    }
    
    /**
     Return `speed` in Double.
     
     - Note : Supports KVO.
     */
    @objc public dynamic var speed: Double {
        get
        {
            return Double(bytesCount)/(stopTime - startTime)
        }
    }
    
    class func keyPathsForValuesAffectingSpeed() -> Set<String>{
        return ["bytesCount", "startTime"]
    }
    
}
