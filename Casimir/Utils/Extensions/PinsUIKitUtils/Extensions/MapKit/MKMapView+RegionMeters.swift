import MapKit

public extension MKMapView {
    func getSpanInMeters() -> (latitudeSpan: Meter, longitudeSpan: Meter) {
        return region.getSpanInMeters()
    }
}

public extension MKCoordinateRegion {
    func getSpanInMeters() -> (latitudeSpan: Meter, longitudeSpan: Meter) {
        let eastBorder = CLLocation(
            latitude: center.latitude - span.latitudeDelta * 0.5,
            longitude: center.longitude)
        let westBorder = CLLocation(
            latitude: center.latitude + span.latitudeDelta * 0.5,
            longitude: center.longitude)
        let southBorder = CLLocation(
            latitude: center.latitude,
            longitude: center.longitude - span.longitudeDelta * 0.5)
        let northBorder = CLLocation(
            latitude: center.latitude,
            longitude: center.longitude + span.longitudeDelta * 0.5)
        return (eastBorder.distance(from: westBorder), southBorder.distance(from: northBorder))
    }
}
