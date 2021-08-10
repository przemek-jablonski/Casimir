import MapKit

#if !os(watchOS)
public extension MKMapView {
    var span: MKCoordinateSpan { region.span }
}
#endif
