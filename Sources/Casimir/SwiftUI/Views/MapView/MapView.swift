import SwiftUI
import MapKit
import Combine

/// unavailability: macCatalyst - this environment will use below `UIViewRepresentable`-based struct for compilation.
#if canImport(AppKit) && !targetEnvironment(macCatalyst)
import AppKit

/**
 Wrapper for the platform-specific Map view from MapKit (for macOS it's NSView-backed MKMapView).
 */
public struct MapView: NSViewRepresentable {
    
    @Binding private var visibleRegion: MKCoordinateRegion
    private let annotations: [Selectable<MapViewAnnotation>]
    
    private let mapConfiguration: ((MKMapView) -> MKMapView)
    private let coordinator: MapViewCoordinator
    
    private var cancellables = Set<AnyCancellable>()
    
    public init(_ region: Binding<MKCoordinateRegion>,
                _ annotations: [Selectable<MapViewAnnotation>],
                mapConfiguration: @escaping ((MKMapView) -> MKMapView),
                viewForAnnotation: @escaping MapViewCoordinator.AnnotationViewDelegate,
                annotationSelectionChanged: @escaping MapViewCoordinator.AnnotationSelectionDelegate) {
        self._visibleRegion = region
        self.annotations = annotations
        self.mapConfiguration = mapConfiguration
        self.coordinator = MapViewCoordinator()
        self.coordinator.annotationViewClosure = viewForAnnotation
        self.coordinator.annotationSelectionChanged = annotationSelectionChanged
    }
    
    public func makeNSView(context: Context) -> MKMapView {
        let map = mapConfiguration(MKMapView())
        map.setRegion(visibleRegion, animated: true)
        map.addAnnotations(annotations.map({ $0.model }))
        map.delegate = context.coordinator
        return map
    }
    
    public func updateNSView(_ nsView: MKMapView, context: Context) {
        // set appearance (light / dark mode)
        // set accessibility
    }
    
    public static func dismantleNSView(_ nsView: MKMapView, coordinator: MapViewCoordinator) {
        nsView.delegate = nil
    }
    
    public func makeCoordinator() -> MapViewCoordinator { coordinator }
}

#endif
