;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |lezione 10.10.24|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))


;------------------------------------------------------------------;
;                   plurale dei verbi                              ;
(define part-passato-1  ; val: stringa
  (lambda (inf1)        ; inf1: stringa
    (string-append (radice-verb inf1) "ato")
    
    ))

(define radice-verb          ;non è propriamente la radice ma siccome la lettera dopo la radice si ripete
  ;allora risparmio caratteri nella funzione sotto
  (lambda (inf)
    (substring inf 0 (- (string-length inf) 2))
    ))




(define part-passato-1-3
  (lambda (inf13)
    (string-append (radice-verb inf13) "to")
    ))



;-----------------------------------------------------------------;
;                            if statement                         ;





(define  femminile?     ; val: booleano (T or F)
  (lambda (s) ; s: stringa
    (char=? (string-ref s (- (string-length s) 1)) #\a)))

(define plurale-sf
  (lambda (s)
    (string-append (substring s 0 (- (string-length s) 1 )) "e" ))
  )


(define plurale-sm
  (lambda (s)
    (string-append (substring s 0 (- (string-length s) 1 )) "i" ))
  )


(define plurale
  (lambda (s)
    (if (femminile? s)
        (plurale-sf s)
        (plurale-sm s)
        )
    ))