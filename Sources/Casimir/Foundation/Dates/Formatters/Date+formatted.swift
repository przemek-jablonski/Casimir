#if os(iOS)
import Foundation

@available(iOS, introduced: 15.0)
public extension Date {
    @available(iOS 15.0, *)
    var formattedCompleteDateOnly: String {
        formatted(date: .complete, time: .omitted)
    }
    
    @available(iOS 15.0, *)
    var formattedCompleteTimeOnly: String {
        formatted(date: .omitted, time: .complete)
    }
    
    @available(iOS 15.0, *)
    var formattedCompleteDateTime: String {
        formatted(date: .complete, time: .complete)
    }
    
    @available(iOS 15.0, *)
    var formattedShortDateTime: String {
        formatted(date: .abbreviated, time: .shortened)
    }
}
#endif
