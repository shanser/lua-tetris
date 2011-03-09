require 'tetromino'

TestTetromino = {}
  function TestTetromino:setUp()
    tetromino = Tetromino.newO()
  end

  function TestTetromino:testUnTetrominoA4Pieces()
    table_size = table.getn(tetromino.pieces)
    assertEquals(4, table_size)
  end
  
  function TestTetromino:testSetPositionPositionneLesPieces()
    tetromino.setPosition(0, 2)
    premierePiece = tetromino.pieces[1]
    assertEquals(0, premierePiece.x)
    assertEquals(2, premierePiece.y)
  end