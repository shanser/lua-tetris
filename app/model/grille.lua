require 'piece'
require 'case'

Grille = {}
function Grille.new()
  local self = {}

  self.width = 10
  self.height = 20
  self.cases = {}
  
  local init = function()
    for i=1,self.width do
      for j=1,self.height do
        table.insert(self.cases, Case.new(i, j))
      end
    end
  end
  
  local initialiseLesCases = function()
    for i,case in pairs(self.cases) do
      case.aEteDeplacee = false
    end
  end
  
  local deplaceLesPiecesDansLeSens = function(sensX, sensY, figeEnCasEchec)
    initialiseLesCases()
    for i,case in pairs(self.cases) do
      if case:estADeplacer(case) then
        local caseDestination = self.caseEnXY(case.x + sensX, case.y + sensY)
        Case.deplacePiece(case, caseDestination, figeEnCasEchec)
      end
    end
  end
  
  local aucuneCaseDeplacee = function()
    for i,case in pairs(self.cases) do
      if case.aEteDeplacee then
        return false
      end
    end
    return true
  end
  
  self.leTempsPasse = function()
    deplaceLesPiecesDansLeSens(0, 1, true)
    if aucuneCaseDeplacee() then
      self.caseEnXY(5, 1):creeUnePiece()
    end
  end
  
  self.caseEnXY = function(x, y)
    for i,case in pairs(self.cases) do
      if case.x == x and case.y == y then
        return case
      end
    end
  end
  
  self.deplacementLateral = function(sens)
    deplaceLesPiecesDansLeSens(sens, 0, false)
  end
  
  init()
  return self
end