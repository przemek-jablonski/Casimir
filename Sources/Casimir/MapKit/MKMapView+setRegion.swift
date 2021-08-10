import MapKit

#if !os(watchOS)
public extension MKMapView {
    func setRegion(_ center: CLLocationCoordinate2D, span: MKCoordinateSpan, animated: Bool = true) {
        setRegion(MKCoordinateRegion(center: center, span: span), animated: animated)
    }
}
#endif
