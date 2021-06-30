#if canImport(SFSafeSymbols)
import SFSafeSymbols
public extension SFSymbol {
    var random: SFSymbol {
        SFSymbol.allCases.randomElement() ?? .questionmarkCircleFill
    }
}
#endif
