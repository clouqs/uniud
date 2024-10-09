#lang scheme
(define sup-tot-cilindro ; val: reale
  (lambda (r h)      ; r,h : reali (misure)
    (* (* (* 2 pi) r) (+ r h)) ; formula
    ))



(define plurale-sm        ; val: stringa
  (lambda (sm)            ; sm: stringa
    (string-append (radice-sost sm) "i")))


(define radice-sost        ;val: stringa
  (lambda (s)              ; s: stringa
    (substring s 0 (- (string-length s) 1))  ;(string=? (substring s 0 (- (string-length s) 1) restituisce un valore booleano
              ))




;--------------------------------------------------------------------------------------;
;  ; (string=? (substring s (- (string-length s) 1) (string-length s)) "a")

(define  femminile?     ; val: booleano (T or F)
  (lambda (s) ; s: stringa
    (char=? (string-ref s (- (string-length s) 1)) #\a)))


; Appunti: https://1drv.ms/o/c/7a2117e04902b169/EgJum9nv_DtIiX_XR8vPIGYBdvzltESzLdYZSam3X5GwrA
