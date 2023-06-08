/**
 Represents model of `Model` class with baked-in type-safe selection capabilities.
 */
public enum Selectable<Model: ModelProtocol>: ModelProtocol {
  case selected(_ model: Model)
  case deselected(_ model: Model)
}

// MARK: - Conveniences
public extension Selectable {
  var model: Model {
    switch self {
    case .selected(let model): return model
    case .deselected(let model): return model
    }
  }

  var selected: Bool {
    guard case .selected = self else { return false }
    return true
  }

  init(_ model: Model, selected: Bool) {
    self = selected ? .selected(model) : .deselected(model)
  }
}

// MARK: - Mutators
public extension Selectable {
  @discardableResult
  mutating func mutate(_ mutations: (inout Self) -> Void) -> Self {
    mutations(&self); return self
  }

  @discardableResult
  mutating func mutate(selection: Bool) -> Self {
    mutate { $0 = .init($0.model, selected: selection) }
  }

  @discardableResult
  mutating func toggle() -> Self {
    mutate(selection: !selected)
  }
}

// MARK: - ModelProtocol conformance
extension Selectable {
  public var id: Model.ID { model.id }
  public static func random(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> Selectable<Model> {
    Selectable(
      .random(&randomNumberGenerator),
      selected: .random(using: &randomNumberGenerator)
    )
  }
}

// MARK: - Codable conformance (inferred from ModelProtocol)
extension Selectable {
  public init(
    from decoder: Decoder
  ) throws {
    // TODO:
    self.init(
      .random(),
      selected: .random()
    )
  }

  public func encode(
    to encoder: Encoder
  ) throws {
    // TODO:
    try model.encode(
      to: encoder
    )
  }
}
