;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Problema 6 laboratorio|) (read-case-sensitive #t) (teachpacks ((lib "drawings.ss.txt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "drawings.ss.txt" "installed-teachpacks")) #f)))
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