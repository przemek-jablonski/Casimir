import SwiftUI
import MapKit
import Combine

#if canImport(AppKit)
import AppKit

/**
 Wrapper for the platform-specific Map view from MapKit
 */
public struct MapView<CustomCoordinator: NSObject & MKMapViewDelegate>: NSViewRepresentable {
    @Binding public var coordinateRegion: MKCoordinateRegion
    public let annotations: [Annotation]
    public let mapUpdateHandler: ((MKMapView, Context) -> Void)?
    public let makeCoordinatorInstance: (() -> CustomCoordinator)
    public let mapConfiguration: ((MKMapView, Context) -> MKMapView)
    
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

#if canImport(UIKit)
import UIKit

/**
 Wrapper for the platform-specific Map view from MapKit
 */
public struct MapView<CustomCoordinator: MKMapViewDelegate>: UIViewRepresentable {
    @Binding public var coordinateRegion: MKCoordinateRegion
    public let annotations: [Annotation]
    public let mapUpdateHandler: ((MKMapView, Context) -> Void)?
    public let makeCoordinatorInstance: (() -> CustomCoordinator)
    public let mapConfiguration: ((MKMapView, Context) -> MKMapView)
    
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

public extension MapView {
    class Annotation: NSObject, MKAnnotation & Identifiable {
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
}


struct MapPreview: PreviewProvider {
    static var previews: some View {
        MapView(coordinateRegion: .constant(MKCoordinateRegion(center: CLLocationCoordinate2D(), span: MKCoordinateSpan())),
                annotations: [],
                mapUpdateHandler: { _, _ in },
                makeCoordinatorInstance: { MapCoordinator() }) { map, context in
            map.delegate = context.coordinator
            return map
        }
    }
}

class MapCoordinator: NSObject, MKMapViewDelegate {
    
}
