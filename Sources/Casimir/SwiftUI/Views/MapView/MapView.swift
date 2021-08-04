import SwiftUI
import MapKit
import Combine
import Combine

/// unavailability: macCatalyst - this environment will use below `UIViewRepresentable`-based struct for compilation.
#if canImport(AppKit) && !targetEnvironment(macCatalyst)
import AppKit

/**
 Wrapper for the platform-specific Map view from MapKit (for macOS it's NSView-backed MKMapView).
 */
public struct MapView<CustomCoordinator: MapViewBaseCoordinator>: NSViewRepresentable {
    
    @Binding private var region: MKCoordinateRegion
    @Binding private var annotations: [Selectable<MapViewAnnotation>]
    private let mapConfiguration: ((MKMapView) -> MKMapView)
    private let coordinator: CustomCoordinator
    
    private var cancellables = Set<AnyCancellable>()
    
    public init(_ region: Binding<MKCoordinateRegion>,
                _ annotations: Binding<[Selectable<MapViewAnnotation>]>,
                mapConfiguration: @escaping ((MKMapView) -> MKMapView),
                coordinator: CustomCoordinator) {
        self._region = region
        self._annotations = annotations
        self.mapConfiguration = mapConfiguration
        self.coordinator = coordinator
    }
    
    public func makeNSView(context: Context) -> MKMapView {
        let map = mapConfiguration(MKMapView())
        //        map.setRegion(initialRegion, animated: false)
        //        map.delegate = context.coordinator
        //        map.addAnnotations(annotations)
        return map
    }
    
    public func updateNSView(_ nsView: MKMapView, context: Context) {
        //        mapUpdateHandler?(nsView, context)
    }
    
    public static func dismantleNSView(_ nsView: MKMapView, coordinator: CustomCoordinator) {
        nsView.delegate = nil
    }
    
    public func makeCoordinator() -> CustomCoordinator {
        coordinator
    }
}


open class MapViewBaseCoordinator: NSObject, MKMapViewDelegate {
    // Map Loading
    public func mapViewWillStartLoadingMap(_ mapView: MKMapView) {}
    public func mapViewDidFinishLoadingMap(_ mapView: MKMapView) {}
    public func mapViewDidFailLoadingMap(_ mapView: MKMapView, withError error: Error) {}
    
    // Visible Region
    
    public func mapView(_ mapView: MKMapView, regionWillChangeAnimated animated: Bool) {}
    public func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {}
    public func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {}
    
    // User Locating
    public func mapViewWillStartLocatingUser(_ mapView: MKMapView) {}
    public func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {}
    public func mapViewDidStopLocatingUser(_ mapView: MKMapView) {}
    public func mapView(_ mapView: MKMapView, didFailToLocateUserWithError error: Error) {}
    //        public func mapView(_ mapView: MKMapView, didChange mode: MKUserTrackingMode, animated: Bool) {}
    
    // Map Rendering
    public func mapViewWillStartRenderingMap(_ mapView: MKMapView) {}
    public func mapViewDidFinishRenderingMap(_ mapView: MKMapView, fullyRendered: Bool) {}
    
    // Map Overlay Rendering
    public func mapView(_ mapView: MKMapView, didAdd renderers: [MKOverlayRenderer]) {}
    //        public func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {}
    
    // Annotations
    //        public func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {}
    //        public func mapView(_ mapView: MKMapView, clusterAnnotationForMemberAnnotations memberAnnotations: [MKAnnotation]) -> MKClusterAnnotation {}
    public func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, didChange newState: MKAnnotationView.DragState, fromOldState oldState: MKAnnotationView.DragState) {}
    public func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {}
    public func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {}
    public func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {}
}

#endif


/// unavailability: watchOS - although `Map` exists as part of `SwiftUI`, `MapKit` itself isn't available on watchOS.
#if canImport(UIKit) && !os(watchOS)
import UIKit

/**
 Wrapper for the platform-specific Map view from MapKit  (for iOS it's UIView-backed MKMapView).
 */
public struct MapView<CustomCoordinator: MKMapViewDelegate>: UIViewRepresentable {
    
    private let initialRegion: MKCoordinateRegion
    private let annotations: [MapViewAnnotation]
    private let mapUpdateHandler: ((MKMapView, Context) -> Void)?
    private let makeCoordinatorInstance: (() -> CustomCoordinator)
    private let mapConfiguration: ((MKMapView, Context) -> MKMapView)
    
    public init(_ initialRegion: MKCoordinateRegion,
                _ annotations: [MapViewAnnotation],
                mapConfiguration: @escaping ((MKMapView, MapView<CustomCoordinator>.Context) -> MKMapView),
                mapUpdateHandler: ((MKMapView, MapView<CustomCoordinator>.Context) -> Void)? = nil,
                makeCoordinatorInstance: @escaping (() -> CustomCoordinator)) {
        self.initialRegion = initialRegion
        self.annotations = annotations
        self.mapUpdateHandler = mapUpdateHandler
        self.makeCoordinatorInstance = makeCoordinatorInstance
        self.mapConfiguration = mapConfiguration
    }
    
    public func makeUIView(context: Context) -> MKMapView {
        let map = mapConfiguration(MKMapView(), context)
        map.setRegion(initialRegion, animated: false)
        map.delegate = context.coordinator
        map.addAnnotations(annotations)
        return map
    }
    
    public func updateUIView(_ uiView: MKMapView, context: Context) {
        mapUpdateHandler?(uiView, context)
    }
    
    public static func dismantleUIView(_ uiView: MKMapView, coordinator: CustomCoordinator) {
        uiView.delegate = nil
    }
    
    public func makeCoordinator() -> CustomCoordinator {
        makeCoordinatorInstance()
    }
}

#endif

#if !os(watchOS)
public final class MapViewAnnotation: NSObject, MKAnnotation, Randomable, Identifiable, Codable {
    public init(title: String, subtitle: String?, coordinates: CLLocationCoordinate2D, _ id: Int) {
        self.id = id
        self.coordinate = coordinates
        self.title = title
        self.subtitle = subtitle
    }
    public let id: Int
    public let coordinate: CLLocationCoordinate2D
    public let title: String?
    public let subtitle: String?
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.coordinate = CLLocationCoordinate2D(
            latitude: try container.decode(Double.self, forKey: .latitude),
            longitude: try container.decode(Double.self, forKey: .longitude))
        self.title = try container.decode(String.self, forKey: .title)
        self.subtitle = try container.decode(String.self, forKey: .subtitle)
        super.init()
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(coordinate.latitude, forKey: .latitude)
        try container.encode(coordinate.longitude, forKey: .longitude)
        try container.encode(title, forKey: .title)
        try container.encode(subtitle, forKey: .subtitle)
    }
}

public extension MapViewAnnotation {
    enum CodingKeys: CodingKey { case id, latitude, longitude, title, subtitle }
}

public extension MapViewAnnotation {
    static var random: MapViewAnnotation {
        .init(title: .random,
              subtitle: .random,
              coordinates: .init(latitude: .random, longitude: .random),
              .random)
    }
}
#endif
