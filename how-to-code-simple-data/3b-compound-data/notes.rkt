;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname notes) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;Notes:

;CH 3b

;Define Struct(video)

;#
To form a structure definition:

(define-struct <name> (<name>...))

(define-struct pos(x y))

;#
A structure definition defines:
 constructor: make-<structure-name>
 selector(s): <structure-name>-<field-name>
 predicate: <structure-name>?

;#
(define-struct pos(xy)) defines:
 constructor: make-pos
 selectors: pos-x pos-y
 predicate: pos?

;