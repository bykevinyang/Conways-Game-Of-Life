// struct Colony: CustomStringConvertible{
struct Colony: CustomStringConvertible{
  let colonySize: Int
  var numberLivingCells: Int
  var gameArray: Array2DS

  init(colonySize: Int){
    self.colonySize = colonySize
    gameArray = Array2DS(numberRows: colonySize, numberCols: colonySize)
    numberLivingCells = 0
  }

  var description: String{
    return(gameArray.description)
  }
  
  mutating func setCellAlive(_ xCoor: Int, _ yCoor: Int){
    gameArray[xCoor, yCoor] = 1
    numberLivingCells += 1
  }
  
  mutating func setCellDead(_ xCoor: Int, _ yCoor: Int){
    gameArray[xCoor, yCoor] = 0
    numberLivingCells += -1
  }

  mutating func resetColony(){
    gameArray = Array2DS(numberRows: colonySize, numberCols: colonySize)
    numberLivingCells = 0
  }

  func isCellAlive( xCoor: Int, yCoor: Int) -> Bool{
    let value = gameArray[xCoor, yCoor]
    if value == 1{return true}
    else{return false}
  }

  mutating func evolve(){
    var copyArray = gameArray
    for r in 0..<gameArray.numberRows{
      for c in 0..<gameArray.numberCols{
        let cellsNextTo = gameArray[r-1,c-1] + gameArray[r-1,c] + gameArray[r-1,c+1] + gameArray[r,c-1] + gameArray[r,c+1] + gameArray[r+1,c-1] + gameArray[r+1,c] + gameArray[r+1,c+1]

        // print(cellsNextTo, " (\(r), \(c))")
        if gameArray[r,c] == 1{
          if cellsNextTo < 2 || cellsNextTo > 3{
            copyArray[r,c] = 0
            numberLivingCells += -1
        }
        }else if cellsNextTo == 3{
          copyArray[r,c] = 1
          numberLivingCells += 1
        }
      }
    }
    gameArray = copyArray
  }
} 