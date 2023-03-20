import Foundation

extension Forms {
  enum FormField {
    public class GenericDate: Forms.BaseFormField<Foundation.Date> {
      override public var isValueValidated: Forms.ValueValidationResult {
        isValidated(value)
      }
    }

    // TODO: `isValidated` should have `value` and `firstEdit` inputs
    public class GenericString: Forms.BaseFormField<String> {
      override public var isValueValidated: Forms.ValueValidationResult {
        isValidated(value)
      }
    }

    public class GenericBool: Forms.BaseFormField<Bool> {
      override public var isValueValidated: Forms.ValueValidationResult {
        isValidated(value)
      }
    }

    public class GenericOptionalAllowed<DataType: Hashable>: Forms.BaseFormField<DataType?> {
      override public var isValueValidated: Forms.ValueValidationResult {
        // TODO:
        .successful
      }
    }
    public class GenericOptionalDisallowed<DataType: Hashable>: Forms.BaseFormField<DataType?> {
      override public var isValueValidated: Forms.ValueValidationResult {
        if value == nil {
          return .valueIsNil
        }
        return .successful
      }
    }
  }
}

extension Forms.FormField.GenericDate {
  func isValidated(_ value: Date) -> Forms.ValueValidationResult {
    //        guard value != .invalid else { return .valueIsInvalidFailure }
    return .successful // TODO: needs implement validation really
  }
}

extension Forms.FormField.GenericString {
  func isValidated(_ value: String) -> Forms.ValueValidationResult {
    //        guard value != .invalid else { return .valueIsInvalidFailure }
    guard !value.isEmptyNoWhitespaces else { return .stringIsEmpty }
    return .successful
  }
}

extension Forms.FormField.GenericBool {
  func isValidated(_ value: Bool) -> Forms.ValueValidationResult {
    //        guard value != .invalid else { return .valueIsInvalidFailure }
    //        guard !value.isEmptyNoWhitespaces else { return .stringIsEmpty }
    return .successful
  }
}
