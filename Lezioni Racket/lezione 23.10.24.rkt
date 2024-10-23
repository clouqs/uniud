;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |lezione 23.10.24|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;-----complemento a uno con il cond-----;
(define bit-compl   ;val: stringa "0" o "1" 
  (lambda (bit)     ;bit: stringa "0" o "1"
    (if (string=? bit "0")
        "1"
        "0")))

;---------------------------------------;
(define compl-a-1   ;val: stringa 0/1
  (lambda (seq)     ;seq: stringa 0/1
    (if (= (string-length seq) 1)
        (bit-compl seq)
        (string-append
         (compl-a-1 (substring seq 0 (quotient (string-length seq) 2))) ;uso "quotient" perchè faccio divisione tra interi
         (compl-a-1 (substring seq (quotient (string-length seq) 2))))))) ;prendo la lunghezza della stringa e la divido per 2

;------------------LET------------------;


;(let (x1 E1) (x2 E2) ... (xk Ek) E[x1,x2,...,xk] )     // l'associazione è funzionale a differenza di "define"
;let definisce un'espressione che avrà un certo valore
;il define viene utilizzato per arricchire l'ambiente con costrutti permanenti
;let viene introdotto viene introdotto per un utilizzo circoscritto al campo ()





;---------conversione da binaria-----------;

(define bin-val
  (lambda (bin)     ;bin: stringa di 0/1
    (let (
          (k (- (string-length bin) 1 ))
          )
      (if (= k 0)
          (bit-val (string-ref bin k))
          (+ (* 2 (bin-val (substring bin 0 k))) ;parte rossa
             (bit-val (string-ref bin k))        ;parte verde
             ))
      )
    ))

(define bit-val
  (lambda(bit)
    (if (char=? bit #\0)
        0
        1)
    ))

;---------conversione da decimale---------;

(define bin-rep
  (lambda (n)
    (let (
          (q (quotient n 2))
          (r (remainder n 2))
          )
      (if (= q 0)
          (bit-rep r)
          (string-append
           (bin-rep q)
           (bit-rep r)
           ))
      )
    ))

(define bit-rep
  (lambda (v)
    (if (= v 0)
        "0"
        "1"
        )
    ))
