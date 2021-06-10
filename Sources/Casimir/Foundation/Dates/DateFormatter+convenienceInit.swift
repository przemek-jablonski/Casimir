import Foundation

public extension DateFormatter {
    convenience init(calendar: Calendar,
                     locale: Locale,
                     timeZone: TimeZone,
                     dateStyle: Style? = nil,
                     timeStyle: Style? = nil,
                     dateFormat: String? = nil,
                     formattingContext: Context? = nil,
                     doesRelativeDateFormatting: Bool? = nil) {
        self.init()
        self.calendar = calendar
        self.locale = locale
        self.timeZone = timeZone
        if let dateStyle = dateStyle { self.dateStyle = dateStyle }
        if let timeStyle = timeStyle { self.timeStyle = timeStyle }
        if let dateFormat = dateFormat { self.dateFormat = dateFormat }
        if let formattingContext = formattingContext { self.formattingContext = formattingContext }
        if let relative = doesRelativeDateFormatting { self.doesRelativeDateFormatting = relative }
    }
}
