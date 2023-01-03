import Foundation

func countDuplicates(_ s:String) -> Int {
    var result = 0
    var text = s.lowercased()
    while text.count != 0 {
        let char = text.removeFirst()
        if text.contains(where: { $0 == char }) {
            result += 1
            text.removeAll(where: { $0 == char })
        }
    }
    return result
}

countDuplicates("asdfas  awefasdfasdc")
