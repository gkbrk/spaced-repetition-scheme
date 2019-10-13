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

(declare (unit UTILS))

(define (parse-string line)
  (read (open-input-string line)))

(define (repl)
  (print (eval (parse-string (get-input "> "))))
  (repl))
