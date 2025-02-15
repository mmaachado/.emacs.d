(load-theme 'modus-vivendi)
(org-indent-mode)

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
