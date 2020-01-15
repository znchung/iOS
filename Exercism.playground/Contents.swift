import UIKit
import Foundation

struct BeerSong {
    let numberOfBeerBottles: Int
    
    func generateVersesOfBeerSong() -> String {
        var count = numberOfBeerBottles-1
        var returnString = getVerse(for: numberOfBeerBottles)
        while count >= 0 {
            
            returnString += "\n\n\(getVerse(for: count))"

            count -= 1
        }
        return returnString
    }
    
    private func getVerse(for num: Int) -> String {
        let firstVerse: String
        var secondVerse: String
        
        if num > 0 {
            firstVerse = "\(num) \(num > 1 ? "bottles" : "bottle") of beer on the wall, \(num) \(num > 1 ? "bottles" : "bottle") of beer."
        } else {
            firstVerse = "No more bottles of beer on the wall, no more bottles of beer."
        }
                
        if num > 0 {
            secondVerse = "Take one down and pass it around, "
        } else {
            secondVerse = "Go to the store and buy some more, "
        }
        
        let remaining: Int = num-1 >= 0 ? num-1 : 99
        
        let secondHalf: String
        switch remaining {
        case 0:
            secondHalf = "no more"
        default:
            secondHalf = "\(remaining) \(remaining > 1 ? "bottles" : "bottle")"
        }
        
        secondVerse += "\(secondHalf) of beer on the wall."

        return "\(firstVerse)\n\(secondVerse)"
    }
}

//let resultVerse = BeerSong(numberOfBeerBottles: 2).generateVersesOfBeerSong()
//print(resultVerse)


class TwelveDaysSong {
    private static let christmasList: [String] = ["a Partridge in a Pear Tree",
    "two Turtle Doves",
    "three French Hens",
    "four Calling Birds",
    "five Gold Rings",
    "six Geese-a-Laying",
    "seven Swans-a-Swimming",
    "eight Maids-a-Milking",
    "nine Ladies Dancing",
    "ten Lords-a-Leaping",
    "eleven Pipers Piping",
        "twelve Drummers Drumming"].reversed()

    static func verse(_ start: Int) -> String {
        return singleVerse(start)
    }

    static func verses(_ start: Int, _ end: Int) -> String {
        return (start...end).map({ singleVerse($0) }).joined(separator: "\n")
    }

    private static func singleVerse(_ num: Int) -> String {
        var dayString: String = ""
        switch num {
        case 1:
            dayString = "first"
        case 2:
            dayString = "second"
        case 3:
            dayString = "third"
        case 4:
            dayString = "fourth"
        case 5:
            dayString = "fifth"
        case 6:
            dayString = "sixth"
        case 7:
            dayString = "seventh"
        case 8:
            dayString = "eigth"
        case 9:
            dayString = "ninth"
        case 10:
            dayString = "tenth"
        case 11:
            dayString = "eleventh"
        case 12:
            dayString = "twelfth"
        default:
            dayString = ""
        }
        
        var result: String
        if num > 1 {
            result = christmasList[(12-num)..<11].joined(separator: ", ")
            result.append(" and \(christmasList[11])")
        } else {
            result = christmasList[11]
        }
    
        return "On the \(dayString) day of Christmas my true love gave to me: \(result)."
    }

    static func sing() -> String {
        return singleVerse(12)
    }
}

let verse = TwelveDaysSong.verse(1)
print(verse)


enum TestEnum: Int, CaseIterable {
    case one = 0
    case two = 10
    case three
    case four
}

print(TestEnum.allCases.map{ $0.rawValue })

private func isLeapYear(year: Int) -> Bool {
    if year.isMultiple(of: 4) {
        if year.isMultiple(of: 100) {
            if year.isMultiple(of: 400) {
                return true
            }
            return false
        }
        return true
    }
    return false
}

print(isLeapYear(year: 2022))

enum OptionType: String {
    case first = "1st"
    case second = "2nd"
    case third = "3rd"
    case fourth = "4th"
    case last = "last"
    case teenth = "teenth"
}
    
class Meetup {
    var year: Int
    var month: Int

    private var meetupDate: Date?

    init(year:Int, month:Int) {
        self.year = year
        self.month = month
    }

    func day(_ weekday: Int, which: String) -> String {
        
        guard let optionType = OptionType(rawValue: which) else { return "" }
        
        var returnDate = DateComponents.init(calendar: Calendar.init(identifier: .iso8601), timeZone: nil, era: nil, year: year, month: month, day: nil, hour: nil, minute: nil, second: nil, nanosecond: nil, weekday: weekday, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil)
        
        if which == "teentth" {
            for day in 13...19 {
                returnDate.day = day
                
                if returnDate.isValidDate {
                    break
                }
            }
        } else {
            switch optionType {
            case .first:
                returnDate.weekdayOrdinal = 1
            case .second:
                returnDate.weekdayOrdinal = 2
            case .third:
                returnDate.weekdayOrdinal = 3
            case .fourth:
                returnDate.weekdayOrdinal = 4
            case .last:
                if let calendar = returnDate.calendar,
                    let date = returnDate.date {
                    if let last = calendar.range(of: .weekdayOrdinal,
                                               in: .month,
                        for: date)?.last {
                        returnDate.weekdayOrdinal = last
                    }
                }
            case .teenth:
                // dont do anything
                print("nothing")
            }
        }
        
       let formatter = ISO8601DateFormatter()
        formatter.formatOptions = .withFullDate
        return formatter.string(from: returnDate.date!)
    }
}

let dayOfWeek = (Sunday:1, Monday:2, Tuesday:3, Wednesday:4, Thursday:5, Friday:6, Saturday:7)

let whichOptions = (first:"1st", second:"2nd", third:"3rd", fourth:"4th", fifth:"5th", last:"last", teenth:"teenth")


let meetUp = Meetup(year: 2013, month: 2)
let meetupDay = meetUp.day(dayOfWeek.Saturday, which: whichOptions.teenth)
print(meetupDay)

struct Temp: Encodable {
    let str = ""
}

let encoder = JSONEncoder()
let z: Temp? = nil

do {
    try encoder.encode(z)
    print("no error")
} catch (let error) {
    print(error)
}

extension String {
    func isAnagram(word: String) -> Bool {
        let wordCharacters = word.sorted()
        let toMatchCharacters = self.sorted()
        
        return wordCharacters == toMatchCharacters
    }
}

struct Anagram {
    var word: String

    func match(_ words: [String]) -> [String] {
        let lowercased = word.lowercased()
        return words.filter({ $0.lowercased().isAnagram(word: lowercased) && $0.lowercased() != lowercased })
    }
}

let anagram = Anagram(word: "master")
let anagramResult = anagram.match(["stream", "pigeon", "maters"])

print("anagramResult: \(anagramResult)")

struct Series {
    let digits: [Int]
    
    init(_ str: String) {
        digits = str.map{ Int(String($0)) ?? 0 }
    }
    
    func slices(_ length: Int) -> [[Int]] {
        guard digits.count >= length else { return [] }
        
        return (0...(digits.count - length)).map{Array(digits[$0..<($0+length)])}
    }
}


let series = Series("982347")
let seriesResult = series.slices(3)
print("seriesResult \(seriesResult)")


class Element<T> {
    let value: T?
    let next: Element?
    
    init(_ value: T? = nil, _ next: Element? = nil) {
        self.value = value
        self.next = next
    }
    
    func toArray() -> [T] {
        var result = [T]()
        
        if let value = value {
            result.append(value)
            
            if let next = next {
                result += next.toArray()
            }
        }
        return result
    }
    
    static func fromArray(_ values: [T]) -> Element {
        var result = Element()
        let elements = values.reversed()
        
        for v in elements {
            let new = Element(v, result)
            result = new
        }
        return result
    }
    
    func reverseElements() -> Element {
        let elements = self.toArray()
        return Element.fromArray(elements.reversed())
    }
}
