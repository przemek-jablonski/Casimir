import MapKit

public extension MKCoordinateRegion {
  /**
   Coordinate region for the Tokyo, Japan.
   */
  static var tokyo: MKCoordinateRegion { MKCoordinateRegion(center: .tokyo, latitudinalMeters: 39, longitudinalMeters: 26) }

  /**
   Coordinate region for the Cupertino, CA.
   */
  static var cupertino: MKCoordinateRegion { MKCoordinateRegion(center: .cupertino, latitudinalMeters: 60, longitudinalMeters: 55) }

  /**
   Coordinate region for the New York City, NY.
   */
  static var nyc: MKCoordinateRegion { MKCoordinateRegion(center: .nyc, latitudinalMeters: 76, longitudinalMeters: 39) }

  /**
   Ccoordinate region for the Santiago, Philippines.
   */
  static var santiago: MKCoordinateRegion { MKCoordinateRegion(center: .santiago, latitudinalMeters: 30, longitudinalMeters: 32) }

  /**
   Ccoordinate region for the Reykjavik, Iceland.
   */
  static var reykjavik: MKCoordinateRegion { MKCoordinateRegion(center: .reykjavik, latitudinalMeters: 25, longitudinalMeters: 41) }

  /**
   Ccoordinate region for the Petersburg, Russia.
   */
  static var petersburg: MKCoordinateRegion { MKCoordinateRegion(center: .petersburg, latitudinalMeters: 62, longitudinalMeters: 23) }
}

public extension MKCoordinateRegion {
  static var random: MKCoordinateRegion {
    [
      .tokyo,
      .cupertino,
      .nyc,
      .santiago,
      .reykjavik,
      .petersburg
    ].random()
  }
}
