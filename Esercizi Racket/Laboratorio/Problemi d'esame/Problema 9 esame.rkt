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


; da finire sto codice!!!!!!!!;
