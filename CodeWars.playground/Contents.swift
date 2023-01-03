import Foundation

extension Int {
  func isPrime() -> Bool {
      if self == 1 || self == 2 || self == 3 {
          return true
      }
      let maxDivider = Int(sqrt(Double(self)))
      for i in 2...maxDivider {
          if self % i == 0 { return false }
      }
      return true
  }
}

func getPrimes(from start: Int, to end: Int) -> [Int] {
    let range = start > end ? end...start : start...end
    var result = [Int]()
    for i in range {
        if i.isPrime() {
            result.append(i)
        }
    }
    return result
}


