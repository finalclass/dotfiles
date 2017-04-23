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
 '(org-agenda-files (quote ("~/todo-home.org")))
 '(package-selected-packages
   (quote
    (popwin editorconfig doremi-cmd doremi-frm doremi company-php counsel edts dired+ projectile magit markdown-preview-mode multiple-cursors markdown-mode markdown mwim which-key smex ido-at-point ido-vertical-mode flx-ido use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
