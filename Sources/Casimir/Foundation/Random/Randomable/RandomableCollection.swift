public protocol RandomableCollection: Collection where Element: Randomable {
  /**
   Returns single random element from given collection instance.
   
   - Note: If the random element cannot be extracted from collection (eg. array is empty), then the element will be instantiated in-place randomly,
  using static `Randomable.random` property.
   - Note: To prevent "fake" element synthesis in above scenario, use `randomElement()` function from Swift's standard library.
   */
  var random: Element { get }
  
  /**
    Returns random chunk of elements from given collection instance.
   
   - Note: Do note that due to the randomness nature of this property, it may exhibit some corner cases on runtime, eg. returned chunk may be empty or
   may be exactly the same length as original collection etc.
   */
  var randomChunk: [Element] { get }
}


extension Array: RandomableCollection where Element: Randomable {
  public var random: Element {
    randomElement() ?? Element.random
  }
  
  public var randomChunk: [Element] {
    self.shuffled() // TODO: 
  }
}