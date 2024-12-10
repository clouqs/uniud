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



; Parte II ;

(define (H f g)
  (lambda (m n)
    (if (= n 0)
        (f m)
        (g m ((H f g) m (- n 1)))
        )
    ))


(define i (lambda (x) x))

(define z (lambda (x) 0))

(define u (lambda (x) 1))

(define s2 (lambda (u v) (+ v 1))) 



(define add (H i s2))

(define mul (H z (lambda (m v) (add m v)))) 

(define pow (H u (lambda (m v) (mul m v))))





