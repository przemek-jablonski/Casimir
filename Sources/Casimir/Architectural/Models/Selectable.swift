/**
 Represents model of `Model` class with baked-in type-safe selection capabilities.
 */
public enum Selectable<Model: ModelProtocol>: ModelProtocol {
    case selected(_ model: Model)
    case deselected(_ model: Model)
}

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
    
    mutating func mutate(selection: Bool) {
        self = .init(model, selected: selection)
    }
    
    mutating func toggle() {
        mutate(selection: !selected)
    }
}

public extension Selectable {
    var id: Model.ID { model.id }
    static var random: Selectable<Model> { Selectable(Model.random, selected: .random()) }
    init(from decoder: Decoder) throws {
        // TODO:
        self.init(.random, selected: .random())
    }
    
    func encode(to encoder: Encoder) throws {
        // TODO:
        try model.encode(to: encoder)
    }
}
