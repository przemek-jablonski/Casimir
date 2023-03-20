import MapKit

#if !os(watchOS)
public extension MKMapView {
  func removeAllAnnotations() {
    removeAnnotations(annotations)
  }
}
#endif
