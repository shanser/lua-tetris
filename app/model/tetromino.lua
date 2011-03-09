require 'piece'

Tetromino = {}

function Tetromino.newO ()
  local self = {}
  self.x = 0
  self.y = 0

  self.pieces = {
    Piece.new(),
    Piece.new(),
    Piece.new(),
    Piece.new()
  }
  
  function self.setPosition(x, y)
    self.x = x
    self.y = y
    pieces = self.pieces
    pieces[1].setPosition(x, y)
    pieces[2].setPosition(x+1, y)
    pieces[3].setPosition(x, y+1)
    pieces[4].setPosition(x+1, y+1)
  end
  return self
end