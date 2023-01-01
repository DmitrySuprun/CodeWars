import Foundation

func findOutlier(_ array: [Int]) -> Int {
    let odd = array.filter { $0 % 2 == 0 }
    if odd.count == 1 {
        return odd[0]
    } else {
        return array.filter { $0 % 2 != 0}[0]
    }
}

findOutlier([8, 2, 4, 4, 7])

