class QueenAttack {
  static new() { this.new({}) }
  construct new(pieces) {
    for (position in pieces) {
      for (coord in position.value) {
        if (coord < 0 || coord > 7) {
          Fiber.abort("Queen must be placed on the board")
        }
      }
    }

    if (! pieces.containsKey("black")) pieces["black"] = [0,3]
    if (! pieces.containsKey("white")) pieces["white"] = [7,3]

    if (pieces["white"][0] == pieces["black"][0] && pieces["white"][1] == pieces["black"][1]) {
      Fiber.abort("Queens cannot share the same space")
    }

    if (pieces["white"]) {
      _white = pieces["white"]
    }

    if (pieces["black"]) {
      _black = pieces["black"]
    }

  }

  white { _white }
  black { _black }

  toString {
    var board = (0..7).map {|i| List.filled(8, "_")}.toList

    board[white[0]][white[1]] = "W"
    board[black[0]][black[1]] = "B"

    return board.map{|row| row.join(" ")}.join("\n")
  }

  canAttack {
    if (white[0] == black[0] || white[1] == black[1] || (white[0] - black[0]).abs == (white[1] - black[1]).abs) {
      return true
    }

    return false
  }
}
