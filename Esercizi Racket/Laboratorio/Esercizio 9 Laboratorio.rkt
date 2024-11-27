;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Esercizio 9 Laboratorio|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Caesare cipher ;

(define (cesare cif shift)
  (let* ((a (string->list cif))
         (shifted (map (lambda (ch)
                         (if (char-alphabetic? ch)
                             (let* ((base (if (char-lower-case? ch) #\a #\A))
                                    (offset (modulo (+ (- (char->integer ch) (char->integer base)) shift) 26)))
                               (integer->char (+ (char->integer base) offset)))
                             ch))
                       a)))
    (list->string shifted)))

; cipher
(define (cifra testo shift)
  (cesare testo shift))

; decipher
(define (decifra testo shift)
  (cesare testo (- shift)))





