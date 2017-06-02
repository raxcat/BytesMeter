

#if os(iOS)
    import UIKit
#elseif os(OSX)
    import Foundation
#endif

public class BytesMeter : NSObject {
    
    dynamic var bytesCount: UInt = 0 {
        didSet{
            stopTime = CFAbsoluteTimeGetCurrent()
        }
    }
    
    public func addBytesCount(_ count:UInt){
        bytesCount += count
    }
    
    private dynamic var startTime: CFAbsoluteTime = 0 {
        didSet{
            bytesCount = 0;
        }
    }
    private dynamic var stopTime: CFAbsoluteTime = 0
    
    public func reset(){
        startTime = CFAbsoluteTimeGetCurrent()
        stopTime = startTime;
    }
    
    public dynamic var speed: Double {
        get
        {
            return Double(bytesCount)/(stopTime - startTime)
        }
    }
    
    class func keyPathsForValuesAffectingSpeed() -> Set<String>{
        return ["bytesCount", "startTime"]
    }
    
}
