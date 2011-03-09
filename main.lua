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
timer.performWithDelay( 80, leTempsPasse, 0 )