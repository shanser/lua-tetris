PieceView = {}

function PieceView.new()
  local cote = 20
  local coteWidth = 2
  local self = display.newRect( 0, 0, cote, cote )
  
  self:setFillColor(255, 0, 0)
  self.strokeWidth = coteWidth
  self:setStrokeColor(0, 0, 0)
  
  local function projete(index)
    return index * cote + ((cote + coteWidth) / 2)
  end
  
  function self.draw(x, y)
    self.x = projete(x)
    self.y = projete(y)
  end
  return self
end