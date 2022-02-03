#if os(iOS)
import Foundation

@available(iOS 15.0, *)
public extension Date {
    var formattedCompleteDateOnly: String {
        formatted(date: .complete, time: .omitted)
    }
    
    var formattedCompleteTimeOnly: String {
        formatted(date: .omitted, time: .complete)
    }
    
    var formattedCompleteDateTime: String {
        formatted(date: .complete, time: .complete)
    }
    
    var formattedShortDateTime: String {
        formatted(date: .abbreviated, time: .shortened)
    }
}
#endif
