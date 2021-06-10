public enum Selection<T: Hashable> {
    case selected(T)
    case deselected(T)
}
