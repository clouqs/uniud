(define L-tassellation
  (lambda (x)
    (creazione x L-tile)))

(define crea
  (lambda (x tile)
    (glue-tiles
     (glue-tiles
      (glue-tiles tile (shift-down (shift-right tile (/ x 4)) (/ x 4)))
      (shift-down (quarter-turn-left tile) ( / x 2)))
     (shift-right (quarter-turn-right tile) (/ x 2)))))

(define creazione
  (lambda (x tile)
    (if (> x 1)
        (crea x (creazione (/ x 2) tile))
        tile)
    ))
