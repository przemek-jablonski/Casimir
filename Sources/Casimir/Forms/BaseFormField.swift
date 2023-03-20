import Foundation

extension Forms {
  public enum ValueValidationResult {
    var isSuccessful: Bool { self == .successful }
    var isFailure: Bool { !isSuccessful }

    case undefined
    case successful

    case valueIsInvalidFailure
    case valueIsBelowZeroFailure
    case stringIsEmpty
    case dateInvalidFailure
    case dateInFutureFailure
    case dateTooFarInThePastFailure
    case valueIsNil
  }
}

extension Forms {
  public class BaseFormField<ValueType: Hashable>: Hashable {
    public typealias ValueValidationClosure = (ValueType) -> ValueValidationResult
    public var title: LocalizedString
    public var value: ValueType

    public var isValueValidated: ValueValidationResult {
      fatalError("isValueValidatedClosure was not provided")
    }

    public var isValueValidatedSuccesfully: Bool { isValueValidated.isSuccessful }

    public init(title: LocalizedString, value: ValueType) {
      self.title = title
      self.value = value
    }
  }
}

extension Forms.BaseFormField {
  public static func == (lhs: Forms.BaseFormField<ValueType>,
                         rhs: Forms.BaseFormField<ValueType>) -> Bool {
    lhs.title == rhs.title && lhs.value == rhs.value
  }
  public func hash(into hasher: inout Hasher) {
    hasher.combine(title)
    hasher.combine(value)
  }
}
