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

(import (chicken format)
        (chicken io))

(declare (uses TERMINAL)
         (uses RANDOM)
         (uses SMTWO)
         (uses DATABASE)
         (uses UI)
         (uses UTILS)
         (uses SYSLOG))

(log-info "Starting program")

(define DBPATH "testdb.txt")

(log-debug "Loading database")
(each-line DBPATH
           (lambda (x)
             (set! database (cons x database))))

(clear-screen)

(let* ((lines    (num-lines DBPATH))
       (lineno   (random-range 0 lines))
       (row      (list-ref database lineno))
       (question (get-question row))
       (answer   (get-answer row)))
  (print "Question: " question)
  (get-input "Press enter to see answer")
  (newline)
  (print "Answer: " answer)
  (newline))

(for-each print QUALITYOPTIONS)
(get-quality)

(print "Program ended. Dropping you into the REPL.")
(repl)
