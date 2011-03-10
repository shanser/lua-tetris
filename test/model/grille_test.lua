require 'grille'

TestGrille = {}
  function TestGrille:setUp()
    grille = Grille.new()
  end

  function TestGrille:testUneGrilleFait10DeLargeEt20DeHaut()
    assertEquals(10, grille.width)
    assertEquals(20, grille.height)
  end
  
  function TestGrille:testUneGrilleA200Cases()
    assertEquals(200, table.getn(grille.cases))
  end
  
  function TestGrille:testLeTempsPasseAjouteUnePieceSurLaPremiereCase()
    grille.leTempsPasse()
    assertNotNil(pieceEnXY(5, 1))
  end
  
  function TestGrille:testLeTempsPasseFaitDescendreLesPiecesSurLePlateau()
    piece = poseUnePieceEnXY(2, 1)
    grille.leTempsPasse()
    assertNil(pieceEnXY(2, 1))
    assertEquals(piece, pieceEnXY(2, 2))
  end
  
  function TestGrille:testLeTempsPasseDeplacePlusieursFois()
    piece = poseUnePieceEnXY(2, 1)
    grille.leTempsPasse()
    grille.leTempsPasse()
    assertEquals(piece, pieceEnXY(2, 3))
  end
  
  function TestGrille:testUneFoisAuSolLesPiecesNeTombentPlus()
    piece = poseUnePieceEnXY(2, 20)
    grille.leTempsPasse()
    assertEquals(piece, pieceEnXY(2, 20))
    assertEquals(true, grille.caseEnXY(2, 20).figee)
  end
  
  function TestGrille:testDeuxPiecesNePeuventPasSeSupperposer()
    piece1 = poseUnePieceEnXY(2, 20)
    piece2 = poseUnePieceEnXY(2, 19)
    grille.leTempsPasse()
    assertEquals(piece1, pieceEnXY(2, 20))
    assertEquals(piece2, pieceEnXY(2, 19))
  end
  
  function TestGrille:testDeplacementLateralDansLeSensPositif()
    piece = poseUnePieceEnXY(1, 1)
    grille.deplacementLateral(1)
    assertEquals(piece, pieceEnXY(2, 1))
  end
  
  function TestGrille:testNeDeplacePasUnePieceFigee()
    piece = poseUnePieceEnXY(1, 1)
    grille.caseEnXY(1, 1).figee = true
    grille.leTempsPasse()
    assertEquals(piece, pieceEnXY(1, 1))
  end
  
  function TestGrille:_testUneLigneCompleteEstSupprimeeEtFaitDescendreLesAutres()
    for i=1,grille.width do
      poseUnePieceEnXY(i, 20)
    end
    piece = poseUnePieceEnXY(1, 18)
    grille.leTempsPasse()
    for i=1,grille.width do
      assertNil(pieceEnXY(i, 20))
    end
    assertNil(pieceEnXY(1, 18))
    assertEquals(piece, pieceEnXY(1, 19))
  end
  
  function TestGrille:testLeDeplacementLateralNeFigePageLaCase()
    poseUnePieceEnXY(1, 1)
    local case = grille.caseEnXY(1, 1)
    grille.deplacementLateral(-1)
    assertEquals(false, case.figee)
  end
  
function poseUnePieceEnXY(x, y)
  local piece = Piece.new()
  grille.caseEnXY(x, y).piece = piece
  return piece
end

function pieceEnXY(x, y)
  local case = grille.caseEnXY(x, y)
  return case.piece
end

