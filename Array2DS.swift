import Foundation

struct Array2DS: CustomStringConvertible {
 var numberRows: Int
 var numberCols: Int
 var data:[Int]
 let MAX_SIZE: Int
 
 var description: String{
  let present = "\u{2666} \t"
  let notPresent = "\u{25CB} \t"

  // let present = "\u{1F92F} \t"      // Emoji version
  // let notPresent = "\u{1F633} \t"   // Emoji version
  
  var msg: String = ""

  for r in 0..<numberRows{
    for c in 0..<numberCols-1{
      let number = get(row: r, col: c)
      if number == 1{msg += present}else{msg += notPresent}
    }
    let number = get(row: r, col: numberCols-1)
    if number == 1{msg += "\(present) \n"}else{msg += "\(notPresent) \n"}
  }

  msg.removeLast()
  return msg
 }


 init(numberRows: Int, numberCols: Int){
   self.numberRows = numberRows
   self.numberCols = numberCols
   MAX_SIZE = numberRows*numberCols
   data = [Int](repeating: 0, count: MAX_SIZE)
 }
 
 func getPosition (_ row:Int, _ col: Int) -> Int{
   return(row*numberCols + col)
 }
 
 mutating func set(row: Int, col: Int, value: Int){
    let position = getPosition(row, col)
    if check(position, row, col) == true {data[position] = value}
    else{()}
 }

 func check(_ position: Int, _ row: Int, _ col: Int) -> Bool{
   if col > numberCols-1 || col < 0{return false}
   if row > numberCols-1 || row < 0{return false}
   if position <= MAX_SIZE-1 && position >= 0 {return true}
   else{return false}
 }

 func get(row: Int, col: Int) -> Int{
    let position = getPosition(row, col)
    if check(position, row, col){return data[position]}
    else{return 0}
 }

 subscript(row: Int, col: Int) -> Int{
   get{
      return(get(row: row, col:col))
   }
   set(newValue) {
     set(row:row, col:col, value:newValue)
    }
 }
}