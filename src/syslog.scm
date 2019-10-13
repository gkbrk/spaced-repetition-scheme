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

(declare (unit SYSLOG))

#>
  #include <syslog.h>
  extern void openlog(const char *ident, int option, int facility);
  extern void syslog(int priority, const char *format, ...);
  extern void closelog(void);
<#

(import (chicken foreign))

(define openlog  (foreign-lambda void "openlog" c-string int int))
(define xsyslog  (foreign-lambda void "syslog" int c-string c-string))
(define closelog (foreign-lambda void "closelog"))
(define (syslog priority text) (xsyslog priority "%s" text))

; Helper functions
(define (log-emerg text)   (syslog 0 text))
(define (log-alert text)   (syslog 1 text))
(define (log-crit text)    (syslog 2 text))
(define (log-error text)   (syslog 3 text))
(define (log-warning text) (syslog 4 text))
(define (log-notice text)  (syslog 5 text))
(define (log-info text)    (syslog 6 text))
(define (log-debug text)   (syslog 7 text))
