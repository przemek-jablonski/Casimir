import CoreHaptics

public protocol Haptics {
    func nudge()
    func swipeNudge()
    func systemSelection()
    //    func normal()
    //    func success()
    //    func error()
    //    func warning()
}

public struct HapticsGenerator: Haptics {
    public static let shared: Haptics = HapticsGenerator()
    private let engine: CHHapticEngine?
    //    private let selectionHapticsGenerator: UISelectionFeedbackGenerator
    
    private init() {
        engine = try? CHHapticEngine()
        //        selectionHapticsGenerator = UISelectionFeedbackGenerator()
        
        if !isRunningAsSwiftUIPreview() {
            if CHHapticEngine.capabilitiesForHardware().supportsHaptics ||
                CHHapticEngine.capabilitiesForHardware().supportsAudio {
                try? engine?.start()
            }
        }
    }
    
    // slight
    public func nudge() {
        play(hapticTransient(sharpness: 1, intensity: 0.40, decay: -1, relativeTime: 0.05))
    }
    
    // slightly stronger variant of nudge / slight
    public func swipeNudge() {
        play(hapticTransient(sharpness: 1, intensity: 0.50, attack: 1, decay: 1, relativeTime: 0.08))
    }
    
    public func systemSelection() {
        nudge()
        //        selectionHapticsGenerator.selectionChanged()
    }
}

private extension HapticsGenerator {
    func hapticTransient(sharpness: Float,
                         intensity: Float,
                         attack: Float = 0.0,
                         decay: Float = 0.0,
                         relativeTime: TimeInterval = 0.0) -> CHHapticEvent {
        CHHapticEvent(eventType: .hapticTransient,
                      parameters: [CHHapticEventParameter(parameterID: .hapticSharpness, value: sharpness),
                                   CHHapticEventParameter(parameterID: .hapticIntensity, value: intensity),
                                   CHHapticEventParameter(parameterID: .attackTime, value: attack),
                                   CHHapticEventParameter(parameterID: .decayTime, value: decay)],
                      relativeTime: relativeTime)
    }
    
    func play(_ haptics: CHHapticEvent...) {
        try? engine?.makePlayer(with: CHHapticPattern(events: haptics, parameters: [])).start(atTime: 0)
    }
}
