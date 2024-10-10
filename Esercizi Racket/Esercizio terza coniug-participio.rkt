;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Esercizio terza coniug-participio|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; conversione verbi -ere al participio passato
;; verbi regolari, NON irregolari
(define radice-verb
  (lambda (s)
    (substring s 0 (- (string-length s) 3))
    ))

(define part-pass-terza
  (lambda(s)
    (string-append (radice-verb s) "uto")
    ))
   

