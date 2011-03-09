require 'piece'
require 'case'
require 'array'

Grille = {}
function Grille.new()
  local self = {}

  self.width = 10
  self.height = 20
  self.cases = {}
  
  for i=1,self.width do
    for j=1,self.height do
      table.insert(self.cases, Case.new(i, j))
    end
  end
  
  local initialiseLesCases = function()
    for i,case in pairs(self.cases) do
      case.aEteDeplacee = false
    end
  end
  
  local peutDeplacerDeCaseEnCase = function(case, caseDuDessous)
    return caseDuDessous and not case.aEteDeplacee and caseDuDessous.piece == nil and case.piece
  end

  local deplacePieceDeCaseEnCase = function(caseOrigine, caseDestination)
    if not peutDeplacerDeCaseEnCase(caseOrigine, caseDestination) then
      return
    end
    local piece = caseOrigine.piece
    caseOrigine.piece = nil
    caseDestination.piece = piece
    caseDestination.aEteDeplacee = true
  end
  
  local deplaceLesPieces = function()
    initialiseLesCases()
    for i,case in pairs(self.cases) do
      local caseDuDessous = self.caseEnXY(case.x, case.y + 1)
      deplacePieceDeCaseEnCase(case, caseDuDessous)
    end
  end
  
  local nombreDeCaseDeplacees = function()
    local compteur = 0
    for i,case in pairs(self.cases) do
      if case.aEteDeplacee then
        compteur = compteur + 1
      end
    end
    return compteur
  end
  
  local creeUneNouvellePiece = function()
    self.caseEnXY(5, 1).piece = Piece.new()
  end
  
  self.leTempsPasse = function()
    deplaceLesPieces()
    if nombreDeCaseDeplacees() == 0 then
      creeUneNouvellePiece()
    end
  end
  
  self.caseEnXY = function(x, y)
    for i,case in pairs(self.cases) do
      if case.x == x and case.y == y then
        return case
      end
    end
  end
  
  self.pieceEnXY = function(x, y)
    local case = self.caseEnXY(x, y)
    local piece = nil
    if case then
      piece = case.piece
    end
    return piece
  end
  
  return self
end