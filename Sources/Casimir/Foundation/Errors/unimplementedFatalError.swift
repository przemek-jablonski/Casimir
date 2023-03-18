/**
 Calls the Swift's `fatalError` function with suggestion about unimplemented code.
 
 - Note: Useful in interface mocking, where touching particular interface method should abort the code / test execution.
 */
public func unimplementedFatalError(
  _ file: String = #file,
  _ function: String = #function,
  _ line: Int = #line
) -> Never {
  fatalError("Called unimplemented function - aborting execution (at \(file):\(function).\(line)).")
}
