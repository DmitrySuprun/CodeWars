import Foundation

func mix(_ s1: String, _ s2: String) -> String {
    var sortedS1 = s1.reduce(into: [:]) { partialResult, character in
        partialResult[character, default: 0] += 1
    }
    
    var sortedS2 = s2.reduce(into: [:]) { partialResult, character in
        partialResult[character, default: 0] += 1
    }
    
    for key in sortedS1.keys {
        if !key.isLowercase || sortedS1[key] == 1 {
            sortedS1[key] = nil
        }
    }
    
    for key in sortedS2.keys {
        if !key.isLowercase || sortedS2[key] == 1 {
            sortedS2[key] = nil
        }
    }
    
    
    let merged = sortedS2.merging(sortedS1) { value1, value2 in
        value1 > value2 ? value1 : value2
    }
    
    var result1: [String] = []
    var result2: [String] = []
    var resultE: [String] = []
    
    for key in merged.keys.sorted() {
        let valueS1 = sortedS1[key] ?? 0
        let valueS2 = sortedS2[key] ?? 0
        if valueS1 > valueS2 {
            result1.append("1:" + String(repeating: key, count: valueS1))
        } else if valueS1 < valueS2 {
            result2.append("2:" + String(repeating: key, count: valueS2))
        } else {
            resultE.append("E:" + String(repeating: key, count: valueS2))
        }
    }
    
    var result = (result1 + result2 + resultE).sorted(by: { $0.count > $1.count }).joined(separator: "/")
    return result
}
let s1 = "Are they here"
let s2 = "yes, they are here"
mix(s1, s2)

