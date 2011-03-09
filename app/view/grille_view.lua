require 'case_view'
GrilleView = {}

function GrilleView.new(grille)
  local self = {}
  local caseViews = {}
  
  function self.init()
    local caseWidth = 20
    local grilleWidth = caseWidth * grille.width
    local grilleHeight = caseWidth * grille.height
    local offsetX = (display.contentWidth - grilleWidth) / 2
    local offsetY = (display.contentHeight - grilleHeight) / 2
    local backgroundGrille = display.newRect( offsetX, offsetY, grilleWidth, grilleHeight )
    backgroundGrille:setStrokeColor(200, 200, 200)
    backgroundGrille.strokeWidth = 7

    for i,case in pairs(grille.cases) do
      caseView = CaseView.new(case, caseWidth, offsetX-caseWidth, offsetY-caseWidth)
      table.insert(caseViews, caseView)
    end
  end
  
  function self.draw()
    for i,caseView in pairs(caseViews) do
      caseView.draw()
    end
  end
  
  self.init()
  
  return self
end