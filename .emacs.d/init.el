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
 '(company-idle-delay 0)
 '(company-minimum-prefix-length 0)
 '(edts-inhibit-package-check t)
 '(js2-auto-indent-p t)
 '(js2-consistent-level-indent-inner-bracket t)
 '(js2-enter-indents-newline t)
 '(js2-indent-level 4)
 '(js2-indent-on-enter-key t)
 '(js2-mode-show-strict-warnings t)
 '(js2-strict-inconsistent-return-warning nil)
 '(js2-strict-trailing-comma-warning nil)
 '(org-agenda-files (quote ("~/todo-home.org")))
 '(package-selected-packages
   (quote
    (yasnippet editorconfig-mode coffee-mode coffeescript-mode coffeescript flycheck-typescript-tslint highlight-current-line hl-spotlight undo-tree yaml-mode dockerfile-mode docker company-restclient key-chord expand-region tide jade web-mode emmet-mode emmet emment emment-mode org-bullets popwin editorconfig doremi-cmd doremi-frm doremi company-php counsel edts dired+ projectile magit markdown-preview-mode multiple-cursors markdown-mode markdown mwim which-key smex ido-at-point ido-vertical-mode flx-ido use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(trailing-whitespace ((t (:foreground "#333333")))))
