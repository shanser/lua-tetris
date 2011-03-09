require 'piece'

TestPiece = {}
  function TestPiece:setUp()
    piece = Piece.new()
  end
  
  function TestPiece:testSetPositionAssigneLeBonX()
    piece.setPosition(1, 2)
    assertEquals(1, piece.x)
  end
  
  function TestPiece:testSetPositionAssigneLeBonY()
    piece.setPosition(0, 4)
    assertEquals(4, piece.y)
  end
  
