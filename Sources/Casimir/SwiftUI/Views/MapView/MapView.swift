import SwiftUI
import MapKit
import Combine

/// unavailability: macCatalyst - this environment will use below `UIViewRepresentable`-based struct for compilation.
#if canImport(AppKit) && !targetEnvironment(macCatalyst)
import AppKit

/**
 Wrapper for the platform-specific Map view from MapKit
 */
public struct MapView<CustomCoordinator: NSObject & MKMapViewDelegate>: NSViewRepresentable {
    
    @Binding public var coordinateRegion: MKCoordinateRegion
    public let annotations: [MapViewAnnotation]
    public let mapUpdateHandler: ((MKMapView, Context) -> Void)?
    public let makeCoordinatorInstance: (() -> CustomCoordinator)
    public let mapConfiguration: ((MKMapView, Context) -> MKMapView)
    
    public init(_ coordinateRegion: Binding<MKCoordinateRegion>,
                _ annotations: [MapViewAnnotation],
                mapConfiguration: @escaping ((MKMapView, MapView<CustomCoordinator>.Context) -> MKMapView),
                mapUpdateHandler: ((MKMapView, MapView<CustomCoordinator>.Context) -> Void)? = nil,
                makeCoordinatorInstance: @escaping (() -> CustomCoordinator)) {
        self._coordinateRegion = coordinateRegion
        self.annotations = annotations
        self.mapUpdateHandler = mapUpdateHandler
        self.makeCoordinatorInstance = makeCoordinatorInstance
        self.mapConfiguration = mapConfiguration
    }
    
    public func makeNSView(context: Context) -> MKMapView {
        mapConfiguration(MKMapView(), context)
    }
    
    public func updateNSView(_ nsView: MKMapView, context: Context) {
        mapUpdateHandler?(nsView, context)
    }
    
    public static func dismantleNSView(_ nsView: MKMapView, coordinator: CustomCoordinator) {
        nsView.delegate = nil
    }
    
    public func makeCoordinator() -> CustomCoordinator {
        makeCoordinatorInstance()
    }
}

#endif

/// unavailability: watchOS - although `Map` exists as part of `SwiftUI`, `MapKit` itself isn't available on watchOS.
#if canImport(UIKit) && !os(watchOS)
import UIKit

/**
 Wrapper for the platform-specific Map view from MapKit
 */
public struct MapView<CustomCoordinator: MKMapViewDelegate>: UIViewRepresentable {
    
    @Binding private var coordinateRegion: MKCoordinateRegion
    private let annotations: [MapViewAnnotation]
    private let mapUpdateHandler: ((MKMapView, Context) -> Void)?
    private let makeCoordinatorInstance: (() -> CustomCoordinator)
    private let mapConfiguration: ((MKMapView, Context) -> MKMapView)
    
    public init(_ coordinateRegion: Binding<MKCoordinateRegion>,
                _ annotations: [MapViewAnnotation],
                mapConfiguration: @escaping ((MKMapView, MapView<CustomCoordinator>.Context) -> MKMapView),
                mapUpdateHandler: ((MKMapView, MapView<CustomCoordinator>.Context) -> Void)? = nil,
                makeCoordinatorInstance: @escaping (() -> CustomCoordinator)) {
        self._coordinateRegion = coordinateRegion
        self.annotations = annotations
        self.mapUpdateHandler = mapUpdateHandler
        self.makeCoordinatorInstance = makeCoordinatorInstance
        self.mapConfiguration = mapConfiguration
    }
    
    public func makeUIView(context: Context) -> MKMapView {
        mapConfiguration(MKMapView(), context)
    }
    
    public func updateUIView(_ uiView: MKMapView, context: Context) {
        mapUpdateHandler?(uiView, context)
    }
    
    
    public static func dismantleUIView(_ uiView: MKMapView, coordinator: CustomCoordinator  ) {
        uiView.delegate = nil
    }
    
    public func makeCoordinator() -> CustomCoordinator {
        makeCoordinatorInstance()
    }
}

#endif

#if !os(watchOS)
public class MapViewAnnotation: NSObject, MKAnnotation & Identifiable {
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
}
#endif
