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
 '(company-global-modes '(not git-commit-mode))
 '(company-idle-delay 0)
 '(company-minimum-prefix-length 1)
 '(custom-safe-themes
   '("3d5720f488f2ed54dd4e40e9252da2912110948366a16aef503f3e9e7dfe4915" default))
 '(edts-inhibit-package-check t)
 '(js-indent-level 4)
 '(js2-auto-indent-p t)
 '(js2-consistent-level-indent-inner-bracket t)
 '(js2-enter-indents-newline t)
 '(js2-include-node-externs t)
 '(js2-indent-level 4)
 '(js2-indent-on-enter-key t)
 '(js2-mode-show-parse-errors nil)
 '(js2-mode-show-strict-warnings t)
 '(js2-strict-inconsistent-return-warning nil)
 '(js2-strict-trailing-comma-warning nil)
 '(js2-toggle-warnings-and-errors nil)
 '(lsp-ui-doc-use-webkit nil t)
 '(org-agenda-files '("~/todo-home.org"))
 '(package-selected-packages
   '(eldoc-box eglot elixir- elixir :elixir elixir-ls lsp-elixir\.el lsp-elixir mood-line doom-modeline dap-mode helm-lsp lsp-treemacs company-lsp lsp-ui lsp-mode haskell-mode purescript-interactive-mode purescript-mode erlang-mode distel edts org-tree-slide epresent skewer-mode simple-httpd indium json-mode elm-mode alchemist js-doc prettier-js prettier discover yafolding espresso toml-mode rust-mode jinja2-mode jinja2 yasnippet yaml-mode which-key web-mode use-package undo-tree tide tern smex popwin org-bullets mwim multiple-cursors multi-term markdown-preview-mode magit key-chord js2-mode jade-mode ido-vertical-mode ido-at-point hl-spotlight highlight-current-line helm-swoop go-complete go-autocomplete flx-ido expand-region erlang eproject emmet-mode editorconfig doremi-frm doremi-cmd dockerfile-mode docker dired+ darcula-theme counsel-projectile company-restclient company-php company-go coffee-mode ag)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(trailing-whitespace ((t (:foreground "#333333")))))
(put 'narrow-to-region 'disabled nil)
