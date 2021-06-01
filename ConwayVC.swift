struct ConwayVC{
  var game: Colony
  var mode: String

  let commands = """
    Commands Are:
    \t Enter an Int, evolve that number generation
    \t Q, quit
    \t Any other text evolve one generation
    """

  init(){
    self.mode = "inputCoor"
    self.game = Colony(colonySize: 0)
  }

  mutating func run(){
    var mode = "inputCoor"

    print("Colony Size...", terminator: "")
    var console = readLine()!
    var sep = console.components(separatedBy:" ")

    if sep.count != 1{
      print("Error: Inputted board size wrong")
    }else{
      self.game = Colony(colonySize: Int(sep[0])!)
    }

    while(mode == "inputCoor"){
      print("Coor: ", terminator: "")
      var console = readLine()!
      var sep = console.components(separatedBy:" ")
      if sep[0] == ""{
        mode = "evolution"
        print("Running Evolution")
        print(commands)
        break
      }else{
        let x = Int(sep[0])!
        let y = Int(sep[1])!
        game.setCellAlive(x, y)
        print("x = \(x)")
        print("y = \(y)")
        // write rest from here
        }
    }
    while(mode == "evolution"){
      var console = readLine()!
      if console.count != 1{
        print("Error: Given more than one letter command, please try again")
      }else{
        let char: Character = console.first!
        let ascii = char.asciiValue!
        if ascii >= 48 && ascii <= 57{
          // evolve n generations
          
          print("is number")
        }else if ascii == 113 || ascii == 81{
          print("Quitting runtime")
          break
        }else{
          print("fix later")
          // evolve one generation
        }

      }

    }

  }
}
