;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Esercizio 2 laboratorio... croce quadrato|) (read-case-sensitive #t) (teachpacks ((lib "drawings.ss.txt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "drawings.ss.txt" "installed-teachpacks")) #f)))
;--------croce--------;

(glue-tiles (glue-tiles (shift-right (shift-down smaller-tile 0) 1.6) (shift-right (shift-down (half-turn smaller-tile) 4) 1.6)) (glue-tiles (shift-down (shift-right (half-turn larger-tile) 1.6) 0.8) larger-tile))




;-------quadrato-------;


(glue-tiles (glue-tiles (half-turn smaller-tile) smaller-tile) (shift-down (glue-tiles (half-turn smaller-tile) smaller-tile) 0.8))
