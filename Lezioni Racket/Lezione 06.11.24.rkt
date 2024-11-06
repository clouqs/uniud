#lang scheme
; LCS ;

(define (lcs u v)
  (cond ((or (string=? u "") (string=? v ""))
         ""
         )
    ((char=? (string-ref u 0) (string-ref v 0))
     (string-append (substring u 0 1) (lcs (substring u 1) (substring v 1)))
        )
     (else
      (longer (lcs (substring  u 1) v) (lcs u (substring v 1)))
     )
     )
  )

(define (longer u v)
  (let ((m (string-length u))
        (n (string-length v))
        )
    (cond ((< m n)
           v)
          ((> m n)
           u)
          ((= (random 2) 0)
           v)
          (else
           u)
          ))
  )