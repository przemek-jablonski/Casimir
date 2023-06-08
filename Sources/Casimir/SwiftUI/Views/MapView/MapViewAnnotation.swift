import MapKit

#if !os(watchOS)
public final class MapViewAnnotation: NSObject, MKAnnotation, Randomable, Identifiable, Codable {
  public init(
    title: String,
    subtitle: String?,
    coordinates: CLLocationCoordinate2D,
    _ id: Int
  ) {
    self.id = id
    self.coordinate = coordinates
    self.title = title
    self.subtitle = subtitle
  }
  public let id: Int
  public let coordinate: CLLocationCoordinate2D
  public let title: String?
  public let subtitle: String?

  public required init(
    from decoder: Decoder
  ) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.id = try container.decode(Int.self, forKey: .id)
    self.coordinate = CLLocationCoordinate2D(
      latitude: try container.decode(Double.self, forKey: .latitude),
      longitude: try container.decode(Double.self, forKey: .longitude))
    self.title = try container.decode(String.self, forKey: .title)
    self.subtitle = try container.decode(String.self, forKey: .subtitle)
    super.init()
  }

  public func encode(
    to encoder: Encoder
  ) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(id, forKey: .id)
    try container.encode(coordinate.latitude, forKey: .latitude)
    try container.encode(coordinate.longitude, forKey: .longitude)
    try container.encode(title, forKey: .title)
    try container.encode(subtitle, forKey: .subtitle)
  }
}

extension MapViewAnnotation {
  public enum CodingKeys: CodingKey { case id, latitude, longitude, title, subtitle }
}

extension MapViewAnnotation {
  public static func random(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> MapViewAnnotation {
    MapViewAnnotation(
      title: .random(&randomNumberGenerator),
      subtitle: .random(&randomNumberGenerator),
      coordinates: CLLocationCoordinate2D(
        latitude: .random(&randomNumberGenerator),
        longitude: .random(&randomNumberGenerator)
      ),
      .random(&randomNumberGenerator)
    )
  }
}
#endif
