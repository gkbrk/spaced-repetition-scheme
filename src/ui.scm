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

(declare (unit UI)
         (uses TERMINAL))

(define QUALITYOPTIONS
  '("Please enter the number that corresponds with your answer"
    "5 - perfect response"
    "4 - correct response after a hesitation"
    "3 - correct response recalled with serious difficulty"
    "2 - incorrect response; where the correct one seemed easy to recall"
    "1 - incorrect response; the correct one remembered"
    "0 - total blackout"))

(define (get-quality)
  (let ((quality (parse-string (get-input "Confidence [0-5]: "))))
        (cond
          ((< quality 0) (get-quality))
          ((> quality 5) (get-quality))
          (else quality))))
