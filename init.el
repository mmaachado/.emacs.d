;; gc 
(setq gc-cons-threshold (* 100 1024 1024))

;; general variables
  (setq inhibit-startup-message t                    ; no welcome buffer
        visible-bell t                               ; blinks at cursor limits
        history-length 20                            ; max history saves
        use-dialog-box nil                           ; no ugly dialogs
        global-auto-revert-non-file-buffers t        ; update buffers thar are non-files too
        tab-always-indent 'complete                  ; use TAB to complete symbols
        mouse-wheel-scroll-amount '(2 ((shift) . 1)) ; scroll 2 lines
        mouse-wheel-progressive-speed nil            ; don't accelerate
        mouse-wheel-follow-mouse 't                  ; scroll window under mouse cursor
        scroll-step 1)                               ; scroll 1 line with keyboard

;; line cursor and no blink
(set-default 'cursor-type  '(bar . 1))
(blink-cursor-mode 0)

;; no sound
(setq visible-bell t)
(setq ring-bell-function 'ignore)

;; no tooltip
(tooltip-mode 0)

;; set modeline at the top
(setq-default header-line-format mode-line-format)
(setq-default mode-line-format'(""))

;; electric pair mode
(electric-pair-mode 1)

;; esc to quit minibuffer
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; comments in italic
(set-face-attribute 'font-lock-comment-face nil :slant 'italic)

;; general default modes
(menu-bar-mode -1)                      ; no menu bar
(tool-bar-mode -1)                      ; no tools bar
(scroll-bar-mode -1)                    ; frame edges set to 10px
(column-number-mode 1)                  ; absolute numbering
(recentf-mode 1)                        ; remember recent files
(save-place-mode 1)                     ; remember cursor position
(savehist-mode 1)                       ; enable history saving
(delete-selection-mode t)               ; overwrite selected text when typing
(global-hl-line-mode 1)                 ; enable current line highlight
(global-visual-line-mode t)             ; visual line breaking
(global-auto-revert-mode 1)             ; update externaly edited files
(global-display-line-numbers-mode 1)    ; always show line numbers

;; asks y/n instead of yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;; send custom settings to another file
(setq custom-file (locate-user-emacs-file "custom.el"))
(load custom-file 'noerror 'nomessage)

;; backup dirs
(setq backup-directory-alist `(("." . ,(expand-file-name "saves/" user-emacs-directory))))

;; keybinds
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-;") 'comment-line)
(global-set-key (kbd "C-x C-x") 'execute-extended-command)

;; personal keybinds
(defun move-line-up ()
  "move up the current line."
  (interactive)
  (transpose-lines 1)
  (forward-line -2)
  (indent-according-to-mode))

(defun move-line-down ()
  "move down the current line."
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1)
  (indent-according-to-mode))

(defun duplicate-line ()
  "duplicate current line and keep it in kill ring."
  (interactive)
  (kill-whole-line)
  (yank)
  (yank))

(global-set-key (kbd "M-<up>") 'move-line-up)
(global-set-key (kbd "M-<down>") 'move-line-down)
(global-set-key (kbd "C-c v") 'duplicate-line)

;; package
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
             ("org"   . "https://orgmode.org/elpa/")
             ("elpa"  . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; use-package
(unless (package-installed-p 'use-package)
    (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

;; dashboard
(use-package dashboard
    :ensure t
    :config
    (setq dashboard-items '((bookmarks . 20)
                            (agenda . 20)))
    (setq dashboard-set-navigator t
          dashboard-agenda-release-buffers nil
          dashboard-set-heading-icons t
          dashboard-set-file-icons t
          dashboard-center-content t
	  dashboard-banner-logo-title "[G N U 🐉 E M A C S]"
          dashboard-startup-banner (concat user-emacs-directory "etc/banners/emacs-dragon.png")
	  )
    (dashboard-setup-startup-hook))

  (setq initial-buffer-choice (lambda ()
                                (get-buffer-create "*dashboard*")))

;; doom themes
  (use-package doom-themes
    :ensure t
    :config (setq doom-themes-enable-bold t
                  doom-themes-enable-italic t)
    (doom-themes-visual-bell-config)
    (doom-themes-org-config))

;; load theme
(load-theme 'doom-palenight t)

;; which key
(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.3)
  (setq which-key-show-early-on-C-h t))

(use-package yasnippet)

;; company
(use-package company
  :diminish company-mode
  :hook (after-init . global-company-mode))

;; flycheck
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

;; rainbow mode
(use-package rainbow-mode)

;; lsp
(use-package lsp-mode
  :hook ((web-mode . lsp)
         (python-mode . lsp)
	 (c-mode .lsp))
  :commands lsp)

(add-hook 'c-mode-hook 'lsp)
(add-hook 'python-mode-hook 'lsp)

;; jedi
(use-package jedi)
(add-hook 'python-mode-hook 'jedi:ac-setup)
(setq jedi:complete-on-dot t)

;; deferred
(use-package deferred)

;; auto-complete
(use-package auto-complete)

;; flyc
(add-hook 'after-init-hook #'global-flycheck-mode)

;; wakatime
(use-package wakatime-mode)
(global-wakatime-mode)

;;; init.el ends here
