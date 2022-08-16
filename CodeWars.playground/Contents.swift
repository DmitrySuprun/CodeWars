import Foundation

func nextBigger(num: Int) -> Int? {
    
    var arrayOfNum = String(num).compactMap { String($0) }
    
    if arrayOfNum.count == 1 {
        return nil
    }
    
    var array = [String]()
    
    array.append(arrayOfNum.removeLast())
    
    while arrayOfNum.count != 0 {
        
        array.append(arrayOfNum.removeLast())
        
        if array.last! < array[array.count - 2] {
            let removeNum = array.firstIndex(where: { $0 > array.last! })!
            arrayOfNum.append(array.remove(at: removeNum))
            if Int(arrayOfNum.joined() + array.sorted(by: <).joined()) == num {
                return nil
            }
            return Int(arrayOfNum.joined() + array.sorted(by: <).joined())
        }
    }
   
  return nil
}
