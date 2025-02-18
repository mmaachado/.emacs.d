(load-theme 'modus-vivendi)
(org-indent-mode t)

(setq
 inhibit-startup-message t
 inhibit-default-init t
 inhibit-splash-screen t
 inhibit-startup-screen t
 inhibit-startup-buffer-menu t
 frame-inhibit-implied-size t
 inhibit-startup-echo-area-message user-login-name)

(push '(fullscreen . maximized) initial-frame-alist)
(push '(fullscreen . maximized) default-frame-alist)
(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10)
(column-number-mode 1)
(save-place-mode 1)
(recentf-mode 1)
(savehist-mode 1)

(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)
(dolist (mode '(org-mode-hook
  vterm-mode-hook
  shell-mode-hook
  eshell-mode-hook))
(add-hook mode (lambda () (display-line-numbers-mode 0))))

(delete-selection-mode t)

(global-hl-line-mode t)

(global-visual-line-mode t)

(global-display-line-numbers-mode t)

(global-auto-revert-mode t)

(fset 'yes-or-no-p 'y-or-n-p)

(electric-pair-mode 1)

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

(setq visible-bell nil)
(global-unset-key (kbd "C-z"))
(delete-selection-mode t)

(setq backup-directory-alist '((".*" . "~/.local/share/Trash/files")))

(setq custom-file (locate-user-emacs-file "custom.el"))
(load custom-file 'noerror 'nomessage)

(set-face-attribute 'default nil :font "JetBrainsMono")
(set-face-attribute 'variable-pitch nil :font "JetBrainsMono")
(set-face-attribute 'fixed-pitch nil :font "JetBrainsMono")

(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
(package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

(use-package rainbow-mode
  :diminish
  :hook org-mode prog-mode)
