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

               ; first consumes a list with at least one element and
(first List1)  ; produces the first element of the list
(first List2)
(first List3)