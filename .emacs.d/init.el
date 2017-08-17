(package-initialize)

;; ORG
(setq org-replace-disputed-keys t)

(require 'org)
(require 'ob-tangle)

;; Load loader.org
(setq init-dir (file-name-directory (or load-file-name (buffer-file-name))))
(org-babel-load-file (expand-file-name "loader.org" init-dir))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-echo-delay 0 t)
 '(company-global-modes (quote (not git-commit-mode)))
 '(company-idle-delay 0)
 '(company-minimum-prefix-length 0)
 '(edts-inhibit-package-check t)
 '(org-agenda-files (quote ("~/todo-home.org")))
 '(package-selected-packages
   (quote
    (yasnippet yaml-mode which-key web-mode use-package undo-tree tide tern smex popwin org-bullets mwim multiple-cursors multi-term markdown-preview-mode magit key-chord js2-mode jade-mode ido-vertical-mode ido-at-point hl-spotlight highlight-current-line helm-swoop go-complete go-autocomplete flx-ido expand-region erlang eproject emmet-mode editorconfig doremi-frm doremi-cmd dockerfile-mode docker dired+ darcula-theme counsel-projectile company-restclient company-php company-go coffee-mode ag))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(trailing-whitespace ((t (:foreground "#333333")))))
