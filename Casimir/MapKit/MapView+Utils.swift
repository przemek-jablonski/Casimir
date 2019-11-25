import MapKit

public extension MKMapView {
    func removeAllAnnotations() {
        self.removeAnnotations(self.annotations)
    }
}
