require 'grille'
require 'grille_view'

display.setStatusBar( display.HiddenStatusBar )

local background = display.newRect( 0, 0, display.contentWidth, display.contentHeight )
background:setFillColor(125, 125, 255)


local grille = Grille.new()
grilleView = GrilleView.new(grille)

function leTempsPasse( event)
  grille.leTempsPasse()
  grilleView.draw()
end

leTempsPasse()
timer.performWithDelay( 800, leTempsPasse, 0 )

function touche( event )
  if event.phase == 'began' then
    startX = event.x
  else
    if event.x == startX then
      return
    end
    if event.x > startX then
      sens = 1
    else
      sens = -1
    end
    startX = event.x
    grille.deplacementLateral(sens)
    grilleView.draw()
  end
end

Runtime:addEventListener('touch', touche)