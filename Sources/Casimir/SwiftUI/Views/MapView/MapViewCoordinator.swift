import MapKit
import SwiftUI

#if !os(watchOS)
public extension MapViewCoordinator {
    enum MapLoadingStatus { case loading, loaded, failure(Error) }
    typealias AnnotationViewDelegate = (MKMapView, MKAnnotation) -> MKAnnotationView?
    typealias AnnotationClusteringDelegate = (MKMapView, [MKAnnotation]) -> MKClusterAnnotation?
    typealias AnnotationSelectionDelegate = (MKMapView, MapViewAnnotation, _ selected: Bool) -> Void
    typealias RegionDidChangeDelegate = (MKMapView) -> Void
    typealias LoadingStatusDelegate = (MKMapView, MapLoadingStatus) -> Void
    typealias RenderingDidFinishDelegate = (MKMapView, _ fullyRendered: Bool) -> Void
}

open class MapViewCoordinator: NSObject, MKMapViewDelegate {
    @Binding public var visibleRegion: MKCoordinateRegion
    public var annotationViewClosure: AnnotationViewDelegate?
    public var annotationSelectionChanged: AnnotationSelectionDelegate?
    public var regionDidChange: RegionDidChangeDelegate?
    public var loadingStatus: LoadingStatusDelegate?
    public var renderingDidFinish: RenderingDidFinishDelegate?

    public var annotationSelectionSpan = MKCoordinateSpan(latitudeDelta: 16, longitudeDelta: 16)
    public var annotationDeselectionSpanMultiplier = 1.25

    internal init(visibleRegion: Binding<MKCoordinateRegion>? = nil,
                  annotationViewClosure: MapViewCoordinator.AnnotationViewDelegate? = nil,
                  annotationSelectionChanged: MapViewCoordinator.AnnotationSelectionDelegate? = nil,
                  regionDidChange: MapViewCoordinator.RegionDidChangeDelegate? = nil,
                  loadingStatus: MapViewCoordinator.LoadingStatusDelegate? = nil,
                  renderingDidFinish: MapViewCoordinator.RenderingDidFinishDelegate? = nil,
                  annotationSelectionSpan: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 16, longitudeDelta: 16),
                  annotationDeselectionSpanMultiplier: Double = 1.25) {
        self._visibleRegion = visibleRegion ?? .constant(.init())
        self.annotationViewClosure = annotationViewClosure
        self.annotationSelectionChanged = annotationSelectionChanged
        self.regionDidChange = regionDidChange
        self.loadingStatus = loadingStatus
        self.renderingDidFinish = renderingDidFinish
        self.annotationSelectionSpan = annotationSelectionSpan
        self.annotationDeselectionSpanMultiplier = annotationDeselectionSpanMultiplier
    }

    // MARK: - Map Loading
    public func mapViewWillStartLoadingMap(_ mapView: MKMapView) {
        loadingStatus?(mapView, .loading)
    }
    public func mapViewDidFinishLoadingMap(_ mapView: MKMapView) {
        loadingStatus?(mapView, .loaded)
    }
    public func mapViewDidFailLoadingMap(_ mapView: MKMapView, withError error: Error) {
        loadingStatus?(mapView, .failure(error))
    }

    // MARK: - Visible Region
    public func mapView(_ mapView: MKMapView, regionWillChangeAnimated animated: Bool) {
    }
    public func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        self.visibleRegion = mapView.region
        regionDidChange?(mapView)
    }
    public func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {

    }

    // MARK: - User Locating
    public func mapViewWillStartLocatingUser(_ mapView: MKMapView) {

    }
    public func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {

    }
    public func mapViewDidStopLocatingUser(_ mapView: MKMapView) {

    }
    public func mapView(_ mapView: MKMapView, didFailToLocateUserWithError error: Error) {

    }

    // MARK: - Map Rendering
    public func mapViewWillStartRenderingMap(_ mapView: MKMapView) {

    }
    public func mapViewDidFinishRenderingMap(_ mapView: MKMapView, fullyRendered: Bool) {
        renderingDidFinish?(mapView, fullyRendered)
    }

    // MARK: - Map Overlay Rendering
    public func mapView(_ mapView: MKMapView, didAdd renderers: [MKOverlayRenderer]) {

    }
    //        public func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {}

    // MARK: - Annotations
    public func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let annotation = annotation as? MapViewAnnotation else { return nil }
        return annotationViewClosure?(mapView, annotation)
    }

    public func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        guard let annotation = view.annotation as? MapViewAnnotation else { return }
        mapView.setRegion(
            annotation.coordinate,
            span: mapView.span > annotationSelectionSpan ? annotationSelectionSpan : mapView.span
        )
        annotationSelectionChanged?(mapView, annotation, true)
    }

    public func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
        guard let annotation = view.annotation as? MapViewAnnotation else { return }
        mapView.setRegion(
            mapView.region.center,
            span: mapView.span * annotationDeselectionSpanMultiplier
        )
        annotationSelectionChanged?(mapView, annotation, false)
    }

    public func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
    }
}
#endif
