//
//  StringExtension.swift

import Foundation

//extension Double {
//    func toDateStringFromTimeStamp(format: String) -> String? {
//        guard !format.isEmpty else { return nil }
//        let date = Date(timeIntervalSince1970: self)
//        Formatter.shared.dateFormatter.dateFormat = format
//        return Formatter.shared.dateFormatter.string(from: date)
//    }
//}
//
//extension Date {
//    func getElapsedInterval() -> String {
//
//        let interval = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: self, to: Date())
//
//        if let year = interval.year, year > 0 {
//            return year == 1 ? "\(year)" + " " + "year ago" : "\(year)" + " " + "years ago"
//        } else if let month = interval.month, month > 0 {
//            return month == 1 ? "\(month)" + " " + "month ago" : "\(month)" + " " + "months ago"
//        } else if let day = interval.day, day > 0 {
//            return day == 1 ? "\(day)" + " " + "day ago" : "\(day)" + " " + "days ago"
//        } else if let hour = interval.hour, hour > 0 {
//            return hour == 1 ? "\(hour)" + " " + "hour ago" : "\(hour)" + " " + "hours ago"
//        } else if let minute = interval.minute, minute > 0 {
//            return minute == 1 ? "\(minute)" + " " + "minute ago" : "\(minute)" + " " + "minutes ago"
//        } else {
//            return "a moment ago"
//        }
//    }
//
//    // Date debug log
//    func dblog() -> String {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "yyyyMMdd HH:mm:ss.SSS"
//        formatter.timeZone = TimeZone(identifier: "UTC")!
//        return formatter.string(from: self)
//    }
//
//    func stringRepresentation(format: String, timeZone: TimeZone? = TimeZone.current) -> String? {
//        guard !format.isEmpty else {
//            return nil
//        }
//
//        let dateFormatter = DateFormatter()
//        let locale = Locale(identifier: "ja_JP")
//        dateFormatter.locale = locale
//        dateFormatter.calendar = Calendar(identifier: .gregorian)
//        dateFormatter.dateFormat = format
//        dateFormatter.timeZone = timeZone
//        return dateFormatter.string(from: self)
//    }
//
//    func getDayOfWeek() -> Int? {
//        if let myCalendar = NSCalendar(calendarIdentifier: .gregorian) {
//            let myComponents = myCalendar.components(.weekday, from: self)
//            let weekDay = myComponents.weekday
//            return weekDay
//        } else {
//            return nil
//        }
//    }
//
//    func toStringLocalTime(_ format: String) -> String {
//        Formatter.shared.dateFormatter.dateFormat = format
//        return Formatter.shared.dateFormatter.string(from: self)
//    }
//
//    func toStringJPTime(_ format: String) -> String {
//        Formatter.shared.dateFormatter.dateFormat = format
//        Formatter.shared.dateFormatter.locale = Locale(identifier: "ja_JP")
//        return Formatter.shared.dateFormatter.string(from: self)
//    }
//}
//
//class Formatter: NSObject {
//
//    // MARK: - Properties
//    static let shared = Formatter()
//
//    public let dateFormatter = DateFormatter()
//
//    // MARK: - Initializer
//    private override init() {}
//
//    // MARK: - Methods
//    public func convertFromUTC(_ strDate: String) -> Date? {
//        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSZ"
//        return dateFormatter.date(from: strDate)
//    }
//
//    public func convertFromFormat(_ strDate: String, with format: String) -> Date? {
//        dateFormatter.dateFormat = format
//        return dateFormatter.date(from: strDate)
//    }
//
//    public func convertToLocal(_ date: Date, with format: String) -> String {
//        dateFormatter.dateFormat = format
//        dateFormatter.timeZone = NSTimeZone.local
//        return dateFormatter.string(from: date)
//    }
//
//    public func toStringDateFormat(dateString: String, dateFormatServer: String, dateFormatLocal: String) -> String {
//        let dateString = dateString
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = dateFormatServer
//        dateFormatter.locale = Locale.init(identifier: "ja_JP")
//        let dateObj = dateFormatter.date(from: dateString)
//        dateFormatter.dateFormat = dateFormatLocal
//        return dateFormatter.string(from: dateObj!)
//    }
//}
//
//extension Date {
//    func isSameYear() -> Bool {
//        let componentsCurrent = Calendar.current.dateComponents([.year], from: Date())
//        let componentsTarget = Calendar.current.dateComponents([.year], from: self)
//        if componentsCurrent.year == componentsTarget.year {
//            return true
//        }
//
//        return false
//    }
//
//    var startOfDay: Date {
//        var comp: DateComponents = Calendar.current.dateComponents([.year, .month, .day], from: Date())
//        comp.timeZone = TimeZone(abbreviation: "UTC")!
//        let truncated = Calendar.current.date(from: comp)!
//        return truncated
//    }
//
//    var endOfDay: Date {
//        var components = DateComponents()
//        components.day = 1
//        components.second = -1
//        return Calendar.current.date(byAdding: components, to: startOfDay)!
//    }
//
//    var startOfWeek: Date {
//        var components = Calendar.current.dateComponents([.weekOfYear, .yearForWeekOfYear], from: self)
//        components.weekday = 2
//        components.timeZone = TimeZone(abbreviation: "UTC")!
//        return Calendar.current.date(from: components)!
//    }
//
//    var startOfMonth: Date {
//        var components = Calendar.current.dateComponents([.year, .month], from: startOfDay)
//        components.timeZone = TimeZone(abbreviation: "UTC")!
//        return Calendar.current.date(from: components)!
//    }
//
//    var endOfMonth: Date {
//        var components = DateComponents()
//        components.month = 1
//        components.second = -1
//        return Calendar.current.date(byAdding: components, to: startOfMonth)!
//    }
//    var yesterday: Date {
//        return Calendar.current.date(byAdding: .day, value: -1, to: self)!
//    }
//    var tomorrow: Date {
//        return Calendar.current.date(byAdding: .day, value: 1, to: self)!
//    }
//    var noon: Date {
//        return Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: self)!
//    }
//    var month: Int {
//        return Calendar.current.component(.month,  from: self)
//    }
//    var isLastDayOfMonth: Bool {
//        return tomorrow.month != month
//    }
//    func getPreviousMonth() -> Date? {
//        return Calendar.current.date(byAdding: .month, value: -1, to: self)
//    }
////    func startOfMonth() -> Date {
////        return Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: Calendar.current.startOfDay(for: self)))!
////    }
////    func endOfMonth() -> Date {
////        return Calendar.current.date(byAdding: DateComponents(month: 1, day: -1), to: self.startOfMonth())!
////    }
//
//    static var UTCDate : Date {
//        var comp: DateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: Date())
//        comp.timeZone = TimeZone(abbreviation: "UTC")!
//        let truncated = Calendar.current.date(from: comp)!
//        return truncated
//    }
//}
//
//extension Date {
//    func getDateComponent() -> DateComponents {
//        let date = self
//        let calendar = Calendar.current
//        let components = calendar.dateComponents([.year, .month, .day, .weekday], from: date)
//        return components
//    }
//
//    func getDateString(stringFormart: String, timeZone: TimeZone? = TimeZone(identifier: "UTC")) -> String {
//        let date = self
//        let format = DateFormatter()
//        format.dateFormat = stringFormart
//        format.timeZone = timeZone ?? TimeZone(identifier: "UTC")!
////        format.locale = Locale(identifier: "vi_VN")
//        let formattedDate = format.string(from: date)
//        return formattedDate
//    }
//
//    func dayOfWeek() -> String {
//        let calendar = Calendar.current
//        let components = calendar.component(.weekday, from: self)
//        return DayOfWeak.weekdays[components - 1]
//    }
////    func dayOfWeek() -> String? {
////        let dateFormatter = DateFormatter()
////        dateFormatter.dateFormat = "EEE"
////        dateFormatter.locale = Locale(identifier: "vi_VN")
////        return dateFormatter.string(from: self).capitalized
////        // or use capitalized(with: locale) if you want
////    }
//
//    static func getTimeInterval(recent: Date, previous: Date) -> String {
//        let interval = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: previous, to: recent)
//
//        if let year = interval.year, year > 0 {
//            return year == 1 ? "\(year)" + " " + "year" : "\(year)" + " " + "years"
//        } else if let month = interval.month, month > 0 {
//            return month == 1 ? "\(month)" + " " + "month" : "\(month)" + " " + "months"
//        } else if let day = interval.day, day > 0 {
//            return day == 1 ? "\(day)" + " " + "day" : "\(day)" + " " + "days"
//        } else if let hour = interval.hour, hour > 0 {
//            var time = hour == 1 ? "\(hour)" + " " + "hour".localized : "\(hour)" + " " + "hours".localized
//            if let minute = interval.minute, minute > 0 {
//                let timeMinute =  minute == 1 ? "\(minute)" + " " + "minute".localized : "\(minute)" + " " + "minutes".localized
//                time = time + " " + timeMinute
//            }
//            return time
//        } else if let minute = interval.minute, minute > 0 {
//            return minute == 1 ? "\(minute)" + " " + "minute".localized : "\(minute)" + " " + "minutes".localized
//        } else {
//            return "a moment ago"
//        }
//    }
//
//    static func getTimeClassBooking(recent: Date, previous: Date) -> String {
//        let interval = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: previous, to: recent)
//
//        if let year = interval.year, year > 0 {
//            return year == 1 ? "\(year)" + " " + "year" : "\(year)" + " " + "years"
//        } else if let month = interval.month, month > 0 {
//            return month == 1 ? "\(month)" + " " + "month" : "\(month)" + " " + "months"
//        } else if let day = interval.day, day > 0 {
//            return day == 1 ? "\(day)" + " " + "day" : "\(day)" + " " + "days"
//        } else if let hour = interval.hour, hour > 0 {
//            var time = hour * 60
//            if let minute = interval.minute, minute > 0 {
//                let timeMinute =  minute
//                time = time + timeMinute
//            }
//            return "\(time) \("minute".localized)"
//        } else if let minute = interval.minute, minute > 0 {
//            return minute == 1 ? "\(minute)" + " " + "minute".localized : "\(minute)" + " " + "minutes".localized
//        } else {
//            return "a moment ago"
//        }
//    }
//
//    func subtract(previous: Date) -> Int {
//        let interval = Calendar.current.dateComponents([.minute], from: self, to: previous)
////        print("==> \(self) \t \(previous) time \(interval.minute ?? 0)")
//        if let minute = interval.minute {
//            return minute
//        } else {
//            return 0
//        }
//    }
//
//    func hasSame(_ components: Set<Calendar.Component>, as date: Date) -> Bool {
//        var calendar = Calendar.current
//        calendar.timeZone = TimeZone(secondsFromGMT: 0)!
//        return components.filter { calendar.component($0, from: date) != calendar.component($0, from: self) }.isEmpty
//    }
//
//}
