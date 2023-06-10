import MapKit

extension MKCoordinateRegion: Randomable {
  public static func random(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> Self {
    MKCoordinateRegion(
      center: .random(&randomNumberGenerator),
      span: .random(&randomNumberGenerator)
    )
  }
}

extension CLLocationCoordinate2D: Randomable {
  public static func random(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> Self {
    CLLocationCoordinate2D(
      latitude: .random(&randomNumberGenerator),
      longitude: .random(&randomNumberGenerator)
    )
  }
}

extension MKCoordinateSpan: Randomable {
  public static func random(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> Self {
    MKCoordinateSpan(
      latitudeDelta: .random(&randomNumberGenerator),
      longitudeDelta: .random(&randomNumberGenerator)
    )
  }
}
