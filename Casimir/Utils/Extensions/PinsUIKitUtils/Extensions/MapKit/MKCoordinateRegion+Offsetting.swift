import MapKit

extension MKCoordinateRegion {
    /**
        Instantiates new `MKCoordinateRegion`, where `latitudinalMeters` and `longitudinalMeters`
        (that is, viewport height and width in meters) are the same.

        - Note: Unless `MKMapView` instance has width and height equal, then region will not be
        rendered 'as-is', because of dimensions mismatch.
     */
    init(center: CLLocationCoordinate2D, regionSpanning meters: Meter) {
        self.init(center: center, latitudinalMeters: meters, longitudinalMeters: meters)
    }

    /**
        Returns new `MKCoordinateRegion`, where center is moved along the Y axis, either up
        or down of the prior region center.

        - Note: Useful when given point of interest should not be displayed directly at the center
        of the viewport.

        - Parameter offsetFactor: Factor by which center will be moved. Factors above 1.0 will move
        center up the Y axis, factors below 1.0 will move it down. Eg. if you want to move prior
        center point so that it will be displayed at the 1/3rd of the screen (from the top),
        pass 3.0f as a parameter.
     */
    func translateLatitude(by offsetFactor: Double) -> MKCoordinateRegion {
        var regionCenter = center
        regionCenter.latitude -= span.latitudeDelta / offsetFactor
        return MKCoordinateRegion(center: regionCenter, span: span)
    }

    /**
        Returns new `MKCoordinateRegion`, where center is moved along the X axis, either left
        or right of the prior region center.

        - Note: Useful when given point of interest should not be displayed directly at the center
        of the viewport.

        - Parameter offsetFactor: Factor by which center will be moved. Factors above 1.0 will move
        center left the Y axis, factors below 1.0 will move it right. Eg. if you want to move prior
        center point so that it will be displayed at the 1/4rd of the screen (from the left edge),
        pass 4.0f as a parameter.
     */
    func translateLongitude(by offsetFactor: Double) -> MKCoordinateRegion {
        var regionCenter = center
        regionCenter.longitude -= span.longitudeDelta / offsetFactor
        return MKCoordinateRegion(center: regionCenter, span: span)
    }
}
