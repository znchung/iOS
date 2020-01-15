import UIKit
import Foundation

func hourglassSum(arr: [[Int]]) -> Int {
    var result = [Int]()
    for i in 0...3 {
        for j in 0...3 {
            var total = 0
            
            // first row
            total += arr[i][j...j+2].reduce(0, { result, current in
                return result + current
            })
            
            // second row
            total = total + arr[i+1][j+1]
                    
            // third row
            total += arr[i+2][j...j+2].reduce(0, {result, current in
                return result + current
            })
            
            result.append(total)
        }
    }
    return result.max() ?? 0
}

let hourglassResult = hourglassSum(arr: [
    [-9, -9, -9, 1, 1, 1],
    [0, -9, 0, 4, 3, 2],
    [-9, -9, -9, 1, 2, 3],
    [0, 0, 8, 6, 6, 0],
    [0, 0, 0, -2, 0, 0],
    [0, 0, 1, 2, 4, 0]
])

print("hourglass result \(hourglassResult)")

func matchingStrings(strings: [String], queries: [String]) -> [Int] {
    var result = [Int]()
    
    for query in queries {
        result.append(strings.filter({ $0 == query }).count)
    }
    
    return result
}

let matchingStringsResult = matchingStrings(
    strings: ["aba", "baba", "aba", "xzxb"],
    queries: ["aba", "xzxb", "ab"])

print("matchingStrings \(matchingStringsResult)")

func arrayManipulation(n: Int, queries: [[Int]]) -> Int {

    var numbers = Array(repeating: 0, count: n + 1)
    var ans = 0

    for i in 0 ..< queries.count {
        let a = queries[i][0]
        let b1 = queries[i][1] + 1
        let k = queries[i][2]

        numbers[a] += k
        
        if b1 <= n {
            numbers[b1] -= k
        }
        
        print(numbers)
    }

    for i in 1...n {
        numbers[i] += numbers[i - 1]
                
        if numbers[i] > ans {
            ans = numbers[i]
        }
    }
        
    return ans
}

let arrayManipulationResult = arrayManipulation(n: 10, queries: [
    [1, 5, 3],
    [4, 8, 2],
    [6, 9, 9],
])

print("arrayManipulationResult \(arrayManipulationResult)")

func icecreamParlor(m: Int, arr: [Int]) -> [Int] {
    var result = [Int]()
    
    for i in 0..<arr.count {
        for j in 0..<arr.count {
            if i == j { continue }
            if arr[i] + arr[j] == m {
                if i >= j {
                    result = [j+1, i+1]
                } else {
                    result = [i+1, j+1]
                }
                
                if !result.isEmpty {
                    break
                }
            }
        }
    }
    return result
}

let arr1 = [1,3,4,5,6] // m: 6
let arr2 = [1,3,4,6,7,9] // m: 9
let arr3 = [1,4,5,3,2] // m: 4
let arr4 = [1,3,4,4,6,8] // m: 8
let arr5 = [1,2] // m: 3
let icecreamParlorResult = icecreamParlor(m: 4, arr: arr3)

print("icecreamParlorResult \(icecreamParlorResult)")
