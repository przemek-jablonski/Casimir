import MapKit

public func *(lhs: MKCoordinateSpan, rhs: Double) -> MKCoordinateSpan {
  MKCoordinateSpan(latitudeDelta: lhs.latitudeDelta * rhs,
                   longitudeDelta: lhs.longitudeDelta * rhs)
}

public func /(lhs: MKCoordinateSpan, rhs: Double) -> MKCoordinateSpan {
  MKCoordinateSpan(latitudeDelta: lhs.latitudeDelta / rhs,
                   longitudeDelta: lhs.longitudeDelta / rhs)
}

public func >(lhs: MKCoordinateSpan, rhs: MKCoordinateSpan) -> Bool {
  (lhs.latitudeDelta + lhs.longitudeDelta) / 2 > (rhs.latitudeDelta + rhs.longitudeDelta) / 2
}
