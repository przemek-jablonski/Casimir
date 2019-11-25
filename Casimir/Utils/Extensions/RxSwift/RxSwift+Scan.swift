import RxSwift

public extension Observable {
    /**
        Shorthand for .scan operator usage, returns Observable of all previously emitted Elements
        in the stream.

        - Note: Returning Array of all elements is accomplished using emptyArray as a seed
        and appending to array as an accumulator.
     */
    func scanAccumulatingAllElements() -> Observable<[Element]> {
        return scan([], accumulator: { (previous, current) -> [Element] in
            return Array(previous + [current])
        })
    }
}
