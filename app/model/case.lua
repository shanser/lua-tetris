Case = {}
function Case.new(x, y)
  self = {}
  self.x = x
  self.y = y
  self.piece = nil
  self.aEteDeplacee = false
  self.figee = false

  function self:estADeplacer()
    return self.piece and not self.aEteDeplacee and not self.figee
  end
  
  function self:estLibre()
    return self.piece == nil
  end
  
  function self:creeUnePiece()
    self.piece = Piece.new()
  end
  
  return self
end

function Case.deplacePiece(caseOrigine, caseDestination, figeEnCasEchec)
  if not caseDestination or not caseOrigine or caseDestination.piece then
    if figeEnCasEchec then
      caseOrigine.figee = true
    end
    return false
  end
  local piece = caseOrigine.piece
  caseOrigine.piece = nil
  caseDestination.piece = piece
  caseDestination.aEteDeplacee = true
  return true
end  