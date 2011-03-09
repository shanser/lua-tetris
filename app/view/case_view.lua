require 'case'

CaseView = {}

function CaseView.new(case, caseWidth, offsetX, offsetY)
  local self = {}
  local strokeWidth = 1
  local rectangle
  
  function self.init()
    left = case.x* caseWidth + offsetX + strokeWidth
    top = case.y*caseWidth + offsetY + strokeWidth
    caseWidth = caseWidth - strokeWidth * 2
    rectangle = display.newRect(left , top , caseWidth, caseWidth )
    rectangle.strokeWidth = strokeWidth
  end

  
  function self.draw()
    if case.piece then
      rectangle:setFillColor(125, 255, 125)
      rectangle:setStrokeColor(0, 255, 0)
    else
      rectangle:setFillColor(0, 0, 0)
      rectangle:setStrokeColor(33, 33, 33)
    end
  end


  self.init()
  
  return self
end