import MapKit

#if !os(watchOS)
open class MapViewCoordinator: NSObject, MKMapViewDelegate {
    public enum MapLoadingStatus { case loading, loaded, failure(Error) }
    
    public typealias AnnotationViewDelegate = (MKMapView, MKAnnotation) -> MKAnnotationView?
    public typealias AnnotationClusteringDelegate = (MKMapView, [MKAnnotation]) -> MKClusterAnnotation?
    public typealias AnnotationSelectionDelegate = (MKMapView, MapViewAnnotation, _ selected: Bool) -> ()
    public typealias RegionDidChangeDelegate = (MKMapView) -> ()
    public typealias LoadingStatusDelegate = (MKMapView, MapLoadingStatus) -> ()
    public typealias RenderingDidFinishDelegate = (MKMapView, _ fullyRendered: Bool) -> ()
    
    public var annotationViewClosure: AnnotationViewDelegate? = nil
    //    private let annotationClusteringClosure: AnnotationClusteringDelegate? = nil
    public var annotationSelectionChanged: AnnotationSelectionDelegate? = nil
    public var regionDidChange: RegionDidChangeDelegate? = nil
    public var loadingStatus: LoadingStatusDelegate? = nil
    public var renderingDidFinish: RenderingDidFinishDelegate? = nil
    
    public var annotationSelectionSpan = MKCoordinateSpan(latitudeDelta: 16, longitudeDelta: 16)
    public var annotationDeselectionSpanMultiplier = 1.25
    
    // Map Loading
    public func mapViewWillStartLoadingMap(_ mapView: MKMapView) {
        loadingStatus?(mapView, .loading)
    }
    public func mapViewDidFinishLoadingMap(_ mapView: MKMapView) {
        loadingStatus?(mapView, .loaded)
    }
    public func mapViewDidFailLoadingMap(_ mapView: MKMapView, withError error: Error) {
        loadingStatus?(mapView, .failure(error))
    }
    
    // Visible Region
    public func mapView(_ mapView: MKMapView, regionWillChangeAnimated animated: Bool) {}
    public func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        regionDidChange?(mapView)
    }
    public func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {}
    
    // User Locating
    public func mapViewWillStartLocatingUser(_ mapView: MKMapView) {}
    public func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {}
    public func mapViewDidStopLocatingUser(_ mapView: MKMapView) {}
    public func mapView(_ mapView: MKMapView, didFailToLocateUserWithError error: Error) {}
    
    // Map Rendering
    public func mapViewWillStartRenderingMap(_ mapView: MKMapView) {}
    public func mapViewDidFinishRenderingMap(_ mapView: MKMapView, fullyRendered: Bool) {
        renderingDidFinish?(mapView, fullyRendered)
    }
    
    // Map Overlay Rendering
    public func mapView(_ mapView: MKMapView, didAdd renderers: [MKOverlayRenderer]) {}
    //        public func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {}
    
    // Annotations
    public func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let annotation = annotation as? MapViewAnnotation else { return nil }
        return annotationViewClosure?(mapView, annotation)
    }
    
    public func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        guard let annotation = view.annotation as? MapViewAnnotation else { return }
        mapView.setRegion(annotation.coordinate,
                          span: mapView.span > annotationSelectionSpan ? annotationSelectionSpan : mapView.span)
        annotationSelectionChanged?(mapView, annotation, true)
    }
    
    public func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
        guard let annotation = view.annotation as? MapViewAnnotation else { return }
        mapView.setRegion(mapView.region.center,
                          span: mapView.span * annotationDeselectionSpanMultiplier)
        annotationSelectionChanged?(mapView, annotation, false)
    }
    
    public func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {}
}
#endif
