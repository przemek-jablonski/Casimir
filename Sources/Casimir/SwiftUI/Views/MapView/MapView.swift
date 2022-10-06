import SwiftUI
import MapKit
import Combine

/// unavailability: macCatalyst - this environment will use below `UIViewRepresentable`-based struct for compilation.
#if canImport(AppKit) && !targetEnvironment(macCatalyst)
import AppKit

public extension MapView {
    typealias Annotations = [MapViewAnnotation.ID: Selectable<MapViewAnnotation>]
}

/**
 Wrapper for the platform-specific Map view from MapKit (for macOS it's NSView-backed MKMapView).
 */
public struct MapView: NSViewRepresentable {

    // FIXME: two-way binding here doesn't work
    @Binding private var visibleRegion: MKCoordinateRegion

    // FIXME: annotations operations outside of add/remove to Dictionary DOESN'T WORK
    @Binding private var annotations: Annotations

    private let mapConfiguration: ((MKMapView) -> MKMapView)
    private var coordinator: MapViewCoordinator

    private var cancellables = Set<AnyCancellable>()

    public init(_ region: Binding<MKCoordinateRegion>,
                _ annotations: Binding<Annotations>,
                mapConfiguration: @escaping ((MKMapView) -> MKMapView),
                viewForAnnotation: @escaping MapViewCoordinator.AnnotationViewDelegate) {
        self._visibleRegion = region
        self._annotations = annotations
        self.mapConfiguration = mapConfiguration
        self.coordinator = MapViewCoordinator(visibleRegion: region)
        self.coordinator.annotationViewClosure = viewForAnnotation
        self.coordinator.annotationSelectionChanged = annotationSelectionChanged
    }

    private func annotationSelectionChanged(map: MKMapView, annotation: MapViewAnnotation, _ selected: Bool) {
        annotations[annotation.id]?.mutate(selection: selected)
    }

    public func makeNSView(context: Context) -> MKMapView {
        let map = mapConfiguration(MKMapView())
        map.setRegion(visibleRegion, animated: true)
        map.addAnnotations(annotations.map({ $0.value.model }))
        map.delegate = context.coordinator
        return map
    }

    public func updateNSView(_ mapView: MKMapView, context: Context) {
        if mapView.annotations.count != annotations.count {
            mapView.removeAllAnnotations()
            mapView.addAnnotations(annotations.map({ $0.value.model }))
        }
    }

    public static func dismantleNSView(_ nsView: MKMapView, coordinator: MapViewCoordinator) {
        nsView.delegate = nil
    }

    public func makeCoordinator() -> MapViewCoordinator { coordinator }
}

#endif
