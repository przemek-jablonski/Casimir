import MapKit

public extension MKCoordinateRegion {
  static var petersburg: MKCoordinateRegion { MKCoordinateRegion(center: .petersburg, latitudinalMeters: 62, longitudinalMeters: 23) }
  static var tokyo: MKCoordinateRegion { MKCoordinateRegion(center: .tokyo, latitudinalMeters: 39, longitudinalMeters: 26) }
  static var cupertino: MKCoordinateRegion { MKCoordinateRegion(center: .cupertino, latitudinalMeters: 60, longitudinalMeters: 55) }
  static var nyc: MKCoordinateRegion { MKCoordinateRegion(center: .nyc, latitudinalMeters: 76, longitudinalMeters: 39) }
  static var santiago: MKCoordinateRegion { MKCoordinateRegion(center: .santiago, latitudinalMeters: 30, longitudinalMeters: 32) }
  static var reykjavik: MKCoordinateRegion { MKCoordinateRegion(center: .reykjavik, latitudinalMeters: 25, longitudinalMeters: 41) }
}

public extension MKCoordinateRegion {
  static var random: MKCoordinateRegion {
    [.petersburg, .tokyo, .cupertino, .nyc, .santiago, .reykjavik].randomElement() ?? .petersburg
  }
}
