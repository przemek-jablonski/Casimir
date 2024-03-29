import Foundation
import MapKit

extension MKCoordinateRegion: Equatable {
  public static func == (lhs: MKCoordinateRegion, rhs: MKCoordinateRegion) -> Bool {
    lhs.center == rhs.center && lhs.span == rhs.span
  }

  public func equalDegrees(to other: Self, margin: CLLocationDegrees) -> Bool {
    (self.center.latitude - other.center.latitude).magnitude <= margin &&
      (self.center.longitude - other.center.longitude).magnitude <= margin
  }
}

extension CLLocationCoordinate2D: Equatable {
  public static func == (lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool {
    lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude
  }
}

extension MKCoordinateSpan: Equatable {
  public static func == (lhs: MKCoordinateSpan, rhs: MKCoordinateSpan) -> Bool {
    lhs.latitudeDelta == rhs.latitudeDelta && lhs.longitudeDelta == rhs.longitudeDelta
  }
}
