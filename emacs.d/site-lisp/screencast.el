;; screencast.el -- A set of helper functions for recording
;;   screencasts using ffmpeg

;; Filename: screencast.el

;; Description: A set of helper functions for recording screencasts using ffmpeg
;; Author: Rick Dillon <rpdillon@killring.org>
;; Copyright (C) 2011, Rick Dillon, all rights reserved.
;; Created: 17 October 2011
;; Version: 0.2b
;; Keywords: screencast, capture, record, video
;; Compatibility: GNU Emacs 22 ~ 23
;;
;; This file is NOT part of GNU Emacs

;; License
;;
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth
;; Floor, Boston, MA 02110-1301, USA.

;; Commentary:
;;
;; This file provides some (currently quite brittle) capablility to
;; capture the content of an Emacs frame under a X windowing system.
;; It has only been tested on Linux, and its chance of success varies
;; from window manager to window manager.
;;
;; Requirements:
;;  ffmpeg 0.7.2+
;;
;; To setup:
;;  (require 'screencast)
;;  (screencast-default-keybindings)
;;
;; You can start screencasts with C-c s a and stop them with C-c s e.
;; These keybinds intercede on the reserved C-c mapping, so modifying
;; them might be desirable for users that already have those keys
;; bound.
;;
;; You can inspect screencast output by viewing the "*screencast*"
;; buffer.
;;
;; It require a fairly recent build of ffmpeg (http://ffmpeg.org) such
;; as that included in builds of Ubuntu starting with Ubuntu 11.10.
;;
;; It really needs some improvement before it is used by anyone
;; seriously, though it does provide a good basis for hacking together
;; a screencasting capability on your own (Linux-based) box.


(setq screencast-vertical-padding 0)

(defun screencast-get-size-string ()
  (let ((width (frame-pixel-width))
        (height (frame-pixel-height)))
    (concat (number-to-string (if (oddp width) (+ 1 width) width))
            "x"
            (number-to-string (+ screencast-vertical-padding (if (oddp height) (+ 1 height) height))))))

(defun screencast-get-position-string ()
  (let ((left (frame-parameter nil 'left))
        (top (frame-parameter nil 'top)))
    (concat ":0.0+"
            (number-to-string left)
            ","
            (number-to-string top))))

; TODO: defcustom
(setq screencast-process-name "screencast-process")
(setq screencast-buffer-name "*screencast*")
(setq screencast-recording-directory (expand-file-name "~/Skrivebord/"))

(defun screencast-make-date ()
  (let* ((date-list (split-string (current-time-string)))
         (year (nth 4 date-list))
         (month (nth 1 date-list))
         (day (nth 2 date-list))
         (time (nth 3 date-list)))
    (concat year "-" month "-" day "-" time)))

(defun screencast-create-recording-name ()
  (let ((base-name "emacs")
        (base-extension ".mpg"))
    (concat base-name "-" (screencast-make-date) base-extension)))

(defun screencast-start ()
  (interactive)
  (if (equalp (process-status screencast-process-name) nil)
      (progn
        (start-process screencast-process-name
                       screencast-buffer-name
                       "/usr/bin/ffmpeg"
                       "-f" "x11grab" "-s"
                       (screencast-get-size-string)
                       "-r" "50" "-i"
                       (screencast-get-position-string)
                       "-f" "alsa" "-i" "pulse" "-sameq"
                       (concat screencast-recording-directory "/" (screencast-create-recording-name)))
)))

(defun screencast-stop ()
  (interactive)
  (let* ((p (get-process screencast-process-name)))
    (defun cleanup-out-buffer (process event)
      (let ((out-buffer (get-buffer screencast-buffer-name)))
        (kill-buffer out-buffer)))
    (set-process-sentinel p 'cleanup-out-buffer)
    (interrupt-process p)
))

; Set up the key bindings
(defun screencast-default-keybindings ()
  (interactive)
  (define-prefix-command 'screencast-map)
  (global-set-key (kbd "C-c s") screencast-map)
  (global-set-key (kbd "C-c s a") 'screencast-start)
  (global-set-key (kbd "C-c s e") 'screencast-stop))

(provide 'screencast)
