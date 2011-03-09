require 'case'

TestCase = {}
  function TestCase:setUp()
    case = Case.new(1, 7)
  end

  function TestCase:testUneCaseAUnXEtUnY()
    assertEquals(1, case.x)
    assertEquals(7, case.y)
  end
  
  function TestCase:testMettreUnePieceSurUneCase()
    local nouvellePiece = Piece.new()
    case.piece = nouvellePiece
    assertEquals(nouvellePiece, case.piece)
  end
