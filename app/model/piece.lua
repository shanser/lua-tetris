Piece = {}
function Piece.new()
  local self = {}

  function self.setPosition(x, y)
    self.x = x
    self.y = y
  end
  
  return self
end