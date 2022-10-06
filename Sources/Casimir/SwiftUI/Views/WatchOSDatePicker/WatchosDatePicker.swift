#if os(watchOS)
import SwiftUI
import UIKit

public typealias DateFormattingClosure = (Date) -> String

/**
 Holy Grail of subviews - DatePicker for WatchOS 💪
 // TODO: Hiding label doesnt really work (I think?)
 */
@available(watchOS 6.0, *)
public struct WatchosDatePicker: View {

    @Binding private var selectedDate: Date

    private let dates: [Date]
    private let pickerTooltipTitle: String?
    private let pickerRowFormattingClosure: DateFormattingClosure
    private let calendar = Calendar.autoupdatingCurrent

    public init(_ selectedDate: Binding<Date>,
                dateLowerRange: Date,
                dateUpperRange: Date,
                granularity: Calendar.Component,
                granularityValue: Int = 1,
                labelText: String? = nil,
                pickerRowFormattingClosure: DateFormattingClosure? = nil) {
        self.init(selectedDate,
                  dates: Calendar.autoupdatingCurrent.stride(from: dateLowerRange,
                                                             to: dateUpperRange,
                                                             enumerating: granularity,
                                                             every: granularityValue),
                  granularity: granularity,
                  labelText: labelText,
                  pickerRowFormattingClosure: pickerRowFormattingClosure)
    }

    /**
     - Note: Although array of dates is already passed as input, granularity (`enumerating: Calendar.Component`)
     still needs to be provided - it is used in default row formatter closure and for calculating initial date
     to display.
     */
    public init(_ selectedDate: Binding<Date>,
                dates: [Date],
                granularity: Calendar.Component,
                labelText: String? = nil,
                pickerRowFormattingClosure: DateFormattingClosure? = nil) {
        self.dates = dates
        self.pickerTooltipTitle = labelText
        self._selectedDate = selectedDate

        self.pickerRowFormattingClosure = pickerRowFormattingClosure ?? {
            DateFormatter().string(from: $0)
        }

        if let alignedInitialDate = dates.first(where: {
            calendar.isDate($0, equalTo: self.selectedDate, toGranularity: granularity)
        }) { self.selectedDate = alignedInitialDate }
    }

    public var body: some View {
        Picker(selection: self.$selectedDate, label: pickerLabel) {
            ForEach(self.dates, id: \.self) {
                Text(self.pickerRowFormattingClosure($0)).allowsTightening(true)
            }
        }
    }

    private var pickerLabel: some View {
        if let title = pickerTooltipTitle {
            return Text(title).erased()
        } else {
            return EmptyView().erased()
        }
    }

}

struct WatchosDatePickerPreviews: PreviewProvider {

    private static let calendar = Calendar.autoupdatingCurrent
    @State private static var selectedDate = Date()

    static var previews: some View {
        WatchosDatePicker($selectedDate,
                          dateLowerRange: mockDateLowerRange(goBackBy: 3),
                          dateUpperRange: mockDateUpperRange(advancingBy: 3),
                          granularity: .hour
        )
    }
}

#endif
