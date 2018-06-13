;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname list-mechanism-notes) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

empty

; cons: is a two argument constructor
(define List1 (cons "Flames" empty))                ; list of 1 element
(define List2 (cons "Leafs" (cons "Flames" empty))) ; list of 2 elements
(define List3 (cons (square 10 "solid" "blue")
      (cons (triangle 20 "solid" "green")
            empty)))

; Primitives to get items from a list
; first: selects the first element of a list

; first consumes a list with at least one element and produces the
; first element of the list

(first List1)
(first List2)
(first List3)

; rest consumes a list with at least one elment and
; produces the list after the first element

(rest List1) 
(rest List2)
(rest List3)

; (... List2)
; how can we get the second element of List2 only using
; the primitives first and rest?

(first (rest List2))
(first (rest (rest List2))) ; to get the third element

; empty? produces true if argument is the empty list
(empty? empty)
(empty? List1)