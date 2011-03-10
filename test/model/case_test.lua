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
  
  function TestCase:testDeplacePieceEstFauxAvecUneDestinationVide()
    succes = Case.deplacePiece(case, nil)
    assertEquals(false, succes)
  end
  
  function TestCase:testDeplacePieceEstVraiQuandLeDeplacementFonctionne()
    succes = Case.deplacePiece(Case.new(), Case.new())
    assertEquals(true, succes)
  end
  
  function TestCase:testDeplacePieceEstFauxQuandLaDestinationNEstPasLibre()
    caseOccupee = Case.new()
    caseOccupee.piece = Piece.new()
    succes = Case.deplacePiece(Case.new(), caseOccupee)
    assertEquals(false, succes)
  end
  
  function TestCase:testDeplacePieceFigeLOrigineEnCaseEchecSiDemande()
    caseOrigine = Case.new()
    Case.deplacePiece(caseOrigine, nil, true)
    assertEquals(true, caseOrigine.figee)
  end

  function TestCase:testDeplacePieceFigePasLOrigineEnCaseEchecSiPasDemande()
    caseOrigine = Case.new()
    Case.deplacePiece(caseOrigine, nil, false)
    assertEquals(false, caseOrigine.figee)
  end