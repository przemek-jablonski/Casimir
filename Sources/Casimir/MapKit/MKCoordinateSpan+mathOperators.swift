import MapKit

/**
 Performs multiplication operation on given coordinate span (`lhs`) by multiplying span by given `rhs` value.
 */
public func * (
  lhs: MKCoordinateSpan,
  rhs: Double
) -> MKCoordinateSpan {
  MKCoordinateSpan(
    latitudeDelta: lhs.latitudeDelta * rhs,
    longitudeDelta: lhs.longitudeDelta * rhs
  )
}

/**
 Performs division operation on given coordinate span (`lhs`) by dividing span by given `rhs` value.
 */
public func / (
  lhs: MKCoordinateSpan,
  rhs: Double
) -> MKCoordinateSpan {
  MKCoordinateSpan(
    latitudeDelta: lhs.latitudeDelta / rhs,
    longitudeDelta: lhs.longitudeDelta / rhs
  )
}

/**
 Performs comparison operation on given coordinate span (`lhs`) by comparing `lhs` span to given `rhs` span.
 */
public func > (
  lhs: MKCoordinateSpan,
  rhs: MKCoordinateSpan
) -> Bool {
  (lhs.latitudeDelta + lhs.longitudeDelta) / 2 > (rhs.latitudeDelta + rhs.longitudeDelta) / 2
}
