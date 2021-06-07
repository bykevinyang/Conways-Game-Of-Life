import Foundation

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
    var global_gen: Int = 0
    var mode = "inputCoor"

    print("Colony Size...", terminator: "")
    let console = readLine()!
    let sep = console.components(separatedBy:" ")

    if sep.count != 1{
      print("Error: Inputted board size wrong")
    }else{
      self.game = Colony(colonySize: Int(sep[0])!)
    }

    while(mode == "inputCoor"){
      print("Coor: ", terminator: "")
      let console = readLine()!
      let sep = console.components(separatedBy:" ")
      if sep[0] == ""{
        mode = "evolution"
        print("Running Evolution")
        print(commands)
        print("\nCommand...", terminator: "")
        break
      }else{
        let x = Int(sep[0])!
        let y = Int(sep[1])!
        game.setCellAlive(x, y)
        }
    }
    while(mode == "evolution"){
      let console = readLine()!
      if console.count == 0{
        print("Error: Given no input, please try again")
      }else{
        let check_int = Int(console)
        if check_int != nil{
          let generations = Int(console)!
          for _ in 0..<generations{
            print("Generation: \(global_gen)")
            print(game)
            print("\n")
            game.evolve()
            global_gen += 1
          }
          print("Command...", terminator: "")
        }else{
          if console == "Q" || console == "q"{
            print("Quitting runtime")
            break
          }else{
            print("Generation: \(global_gen)")
            print(game)
            print("\n")
            game.evolve()
            global_gen += 1
            print("\nCommand...", terminator: "")
        }
      }

    }

  }
}
}
