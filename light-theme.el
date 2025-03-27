;;; light-theme.el --- a minimal light theme for black emacs
;;; -------------------------------------------------------------------
;;; author: Marques <uniqueduckinbox@duck.com>
;;; -------------------------------------------------------------------
;;; URL: https://github.com/mmaachado/.emacs.d
;;; -------------------------------------------------------------------
;;; version: 1
;;; package-requires: ((emacs "29.4"))
;;; -------------------------------------------------------------------
;;; This file is not part of GNU Emacs.
;;;
;;; This program is free software: you can redistribute it and/or
;;; modify it under the terms of the GNU General Public License as
;;; published by the Free Software Foundation, either version 3 of the
;;; License, or (at your option) any later version.
;;;
;;; This program is distributed in the hope that it will be useful, but
;;; WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;;; General Public License for more details.
;;;
;;; You should have received a copy of the GNU General Public License
;;; along with this program. If not, see <http://www.gnu.org/licenses/>
;;; -------------------------------------------------------------------
;;; code:

;; theme definition
;; -------------------------------------------------------------------
(deftheme light-theme
  "a minimal light theme for black emacs")


;; require black-emacs-common
;; -------------------------------------------------------------------
;; (load "~/.emacs.d/black.el")
(require 'black)


;; general colors
;; -------------------------------------------------------------------
(set-background-color "#ffffff")
(set-foreground-color "#333333")
(set-face-attribute 'default nil
		    :foreground (face-foreground 'default)
		    :background (face-background 'default))
(set-face-attribute 'face-critical nil :foreground "#ffffff"
		    :background "#ff6347")
(set-face-attribute 'face-popout nil :foreground "#ffa07a")
(set-face-attribute 'face-strong nil :foreground "#333333"
		    :weight 'regular)
(set-face-attribute 'face-salient nil :foreground "#00008b"
		    :weight 'light)
(set-face-attribute 'face-faded nil :foreground "#999999"
		    :weight 'light)
(set-face-attribute 'face-subtle nil :background "#f0f0f0")

(set-modeline-faces)

'(cus-edit (set-button-faces))


;; provide the black-emacs-light theme
;; -------------------------------------------------------------------
(provide-theme 'light-theme)


;; light-theme.el ends here