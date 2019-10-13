; Spaced Repetition software in Chicken Scheme
; Copyright (C) 2019 Gokberk Yaltirakli
;
; This program is free software: you can redistribute it and/or modify it under
; the terms of the GNU Affero General Public License as published by the Free
; Software Foundation, either version 3 of the License, or (at your option) any
; later version.
;
; This program is distributed in the hope that it will be useful, but WITHOUT
; ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
; FOR A PARTICULAR PURPOSE.  See the GNU Affero General Public License for more
; details.
;
; You should have received a copy of the GNU Affero General Public License
; along with this program.  If not, see <https://www.gnu.org/licenses/>.

(declare (unit DATABASE)
         (uses UTILS))

(import (chicken io))

; TODO: Add function to update/write DB to disk

(set! database '())

(define (each-line path fn)
  (let ((file (open-input-file path)))
    (do ((line (read-line file) (read-line file))) ((eof-object? line))
      (fn (parse-string line)))))

(define (num-lines path)
  (let ((lines 0))
    (each-line
      path
      (lambda (x) (set! lines (+ 1 lines)))) lines))

(define (get-question row)
  (car (alist-ref 'question row)))

(define (get-answer row)
  (car (alist-ref 'answer row)))
