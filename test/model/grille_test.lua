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
    assertNotNil(grille.caseEnXY(5, 1).piece)
  end
  
  function TestGrille:testLeTempsPasseFaitDescendreLesPiecesSurLePlateau()
    piece = poseUnePieceEnXY(2, 1)
    grille.leTempsPasse()
    assertNil(grille.pieceEnXY(2, 1))
    assertEquals(piece, grille.pieceEnXY(2, 2))
  end
  
  function TestGrille:testLeTempsPasseDeplacePlusieursFois()
    piece = poseUnePieceEnXY(2, 1)
    grille.leTempsPasse()
    grille.leTempsPasse()
    assertEquals(piece, grille.pieceEnXY(2, 3))
  end
  
  function TestGrille:testUneFoisAuSolLesPiecesNeTombentPlus()
    piece = poseUnePieceEnXY(2, 20)
    grille.leTempsPasse()
    assertEquals(piece, grille.pieceEnXY(2, 20))
  end
  
  function TestGrille:testDeuxPiecesNePeuventPasSeSupperposer()
    piece1 = poseUnePieceEnXY(2, 20)
    piece2 = poseUnePieceEnXY(2, 19)
    grille.leTempsPasse()
    assertEquals(piece1, grille.pieceEnXY(2, 20))
    assertEquals(piece2, grille.pieceEnXY(2, 19))
  end
  
function poseUnePieceEnXY(x, y)
  piece = Piece.new()
  grille.caseEnXY(x, y).piece = piece
  return piece
end