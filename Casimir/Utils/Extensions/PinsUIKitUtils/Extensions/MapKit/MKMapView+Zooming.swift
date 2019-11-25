import MapKit

public extension MKMapView {

    /**
        "Zooms in/out" given `MKMapView` instance.
        Equivalent to manually instantiating and assigning a new region to the `MKMapView`.

        - Parameter viewportSpanning: Zooms in so that at least this amount of meters
        will be displayed in the viewport of `MKMapView`.
        - Parameter coordinates: Center point for zooming.
        - Parameter latitudeOffset: Factor by which to move center point during zooming in Y axis.
        Optional. Nil by default, so no translation will take place.
        - Parameter longitudeOffset: Factor by which to move center point during zooming in X axis.
        Optional. Nil by default, so no translation will take place.
        - Parameter animated: Whether to animate the zooming transition or not. True by default.
     */
    @discardableResult
    func zoom(
        to viewportSpanning: Meter,
        centeringOn coordinates: CLLocationCoordinate2D,
        offsettingLatitudeBy latitudeOffset: Double? = nil,
        offsettingLongitudeBy longitudeOffset: Double? = nil,
        animated: Bool = true) -> MKMapView {
        var region = MKCoordinateRegion(center: coordinates, regionSpanning: viewportSpanning)
        if let offset = latitudeOffset { region = region.translateLatitude(by: offset) }
        if let offset = longitudeOffset { region = region.translateLongitude(by: offset) }
        setRegion(region, animated: animated)
        return self
    }
}
