#lang scheme

(define btr-sum  
  (lambda (a b)
    (cond
      ;; Ensure a is the longer string
      ((< (string-length a) (string-length b))
       (btr-sum (normalize a b) b))
      ((> (string-length a) (string-length b))
       (btr-sum a (normalize b a)))
      ;; Base case: both strings have the same length
      (else (real a b ".")))))

(define real
  (lambda (a b r) ;; strings
    (if (> (string-length a) 1)
        (string-append
         (real (substring a 0 (-(string-length a) 1))
                (substring b 0 (-(string-length b) 1))
                r)
         (string (somma (string-ref a (-(string-length a) 1))
                        (string-ref b (-(string-length b) 1))))
         )
        ;; Last character case
        (string (somma (string-ref a 0) (string-ref b 0))))))

(define normalize
  (lambda (subj obj)
    (if (not (= (string-length subj) (string-length obj)))
        (normalize (string-append "." subj) obj)
        subj)))

(define create-rip
  (lambda (a b c)
    (if (> (string-length a) 1)
        (let* ((last-a (string-ref a (-(string-length a) 1)))
               (last-b (string-ref b (-(string-length b) 1)))
               (new-c (cond
                        ((and (char=? last-a #\+) (char=? last-b #\+)) (string-append "+" c))
                        ((and (char=? last-a #\-) (char=? last-b #\-)) (string-append "-" c))
                        (else (string-append "." c)))))
          (create-rip (substring a 0 (-(string-length a) 1))
                      (substring b 0 (-(string-length b) 1))
                      new-c))
        ;; Last character case
        (cond
          ((and (char=? (string-ref a 0) #\+) (char=? (string-ref b 0) #\+)) (string-append "+" c))
          ((and (char=? (string-ref a 0) #\-) (char=? (string-ref b 0) #\-)) (string-append "-" c))
          (else (string-append "." c))))))

(define somma
  (lambda (a b)
    (cond
      ((and (char=? a #\-) (char=? b #\-)) #\+)
      ((and (char=? a #\.) (char=? b #\-)) #\-)
      ((and (char=? a #\+) (char=? b #\-)) #\.)
      ((and (char=? a #\-) (char=? b #\+)) #\.)
      ((and (char=? a #\.) (char=? b #\+)) #\+)
      ((and (char=? a #\+) (char=? b #\+)) #\-)
      ((and (char=? a #\-) (char=? b #\.)) #\-)
      ((and (char=? a #\.) (char=? b #\.)) #\.)
      ((and (char=? a #\+) (char=? b #\.)) #\+))))

;; Test case
(btr-sum "-" "--")
