
(define btr-val
  (lambda (btr)
    (let (
          (k (- (string-length btr) 1))
          )
      (if (= k 0)
          (btd-val btr)
          (+ (* 3 (btr-val (substring btr 0 k))
                (btd-val (substring btr k))
                ))
          )
      )
    ))
(define btd-val     ;vak: intero
  (lambda (btd)     ;btd: "-", ".", "+"
    (cond ((string=? btd "-") -1)
          ((string=? btd ".") 0)
          ((string=? btd "+") +1)
          )
    ))


;; bilancia ternaria con numeri in base 3: dove - == -1 // . == 0 // + == +1
;; i numeri vengono scritti e convertiti da base 3 a base 10

    
