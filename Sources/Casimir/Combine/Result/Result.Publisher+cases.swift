import Combine

public extension Result.Publisher {
    /**
     Returns `Result.Publisher` propagating `success` case with payload downstream.
     */
    static func success(_ output: Output) -> Result.Publisher {
        Result.Publisher(output)
    }

    /**
     Returns `Result.Publisher` propagating `failure` case with payload downstream (terminating the stream).
     */
    static func failure(_ failure: Failure) -> Result.Publisher {
        Result.Publisher(failure)
    }
}
