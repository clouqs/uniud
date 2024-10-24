;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |lezione 17.10.24 - Copia|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;------------------------------------------------; N.B "delega" è una funzione
;--------------complemento a uno-----------------;     separata

(define compl-a-uno       ;val: stringa di 0/1
  (lambda (seq)                       ;seq: stringa di 0/1 lunga...
    (if (> (string-length seq) 1)
         ;almeno due bit
    (string-append
    (bit-compl (substring seq 0 1))        ;estrazione del primo bit
    (compl-a-uno (substring seq 1))        ;estrazione del secondo bit per ricorsione....
    )
         ;esattamente un bit
    (bit-compl seq)
    )
    ))



;------------------------------------------------;   compl-a-uno e "delega" fanno la stessa cosa
;----------convertire 0 -> 1 o 1 -> 0------------;
(define bit-compl   ;val: stringa "0" o "1" 
  (lambda(bit)      ;bit: stringa "0" o "1"
       (if (string=? bit "0")
           "1"
           "0"
           )
    ))






;-------------------------------------------------; N.B. senza ricorsione
;---------------reverse stringa-------------------;
(define rev-str
  (lambda (s)
    (list->string (reverse (string->list s))) 
    ))



;-------------------------------------------------;
;---------reverse stringa con ricorsione----------;

(define string-reverse
  (lambda (str)
    (if (< (string-length str) 1)
        ""
        (string-append
         (string-reverse (substring str 1))
         (substring str 0 1)
         )
        )
    ))

;-----------calcolo foglio formato An------------;

(define s     ; val: reale (misura cm)
  (lambda (k)     ;k: intero > 0
    ;(if (< k 2)
    ;    (if (= k 0) s0 s1)

    ;    (/ (s (- k 2)) 2)
    (cond ((= k 0)
           s0)
          ((= k 1)
           s1)
          (else
          ( / (s (- k 2)) 2))
    )
    ))

(define s0 (* 100 (expt 2 1/4)))
(define s1 (* 100 (expt 2 -1/4)))
