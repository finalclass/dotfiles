;;; Compiled snippets and support files for `css-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'css-mode
                     '(("user-sel" "-webkit-user-select: none;\n-moz-user-select: none;\n-ms-user-select: none;\nuser-select: none;" "user-select" nil nil nil "/home/sel/.emacs.d/snippets/css-mode/user-sel.yasnippet" nil nil)
                       ("transi" "-webkit-transition: ${1:all} ${2:1s};\n-moz-transition: $1 $2;\n-ms-transition: $1 $2;\n-o-transition: $1 $2;\ntransition: $1 $2;$0" "transi" nil nil nil "/home/sel/.emacs.d/snippets/css-mode/transi.yasnippet" nil nil)
                       ("transf" "-ms-transform: translate(${1:0}, ${2:0});\n-webkit-transform: translate($1, $2);\n-moz-transform: translate($1, $2);\ntransform: translate($1, $2);$0" "transf" nil nil nil "/home/sel/.emacs.d/snippets/css-mode/transf.yasnippet" nil nil)
                       ("section" "/*-----------${1:.selector}*/\n$1 {\n\n}\n/* END $1 */" "section" nil nil nil "/home/sel/.emacs.d/snippets/css-mode/section.yasnippet" nil nil)
                       ("box-sha" "-webkit-box-shadow: ${1:0} ${2:0} ${3:0} ${4:0} rgba(${5:0}, ${6:0}, ${7:0}, ${8:0.75});\n-moz-box-shadow: $1 $2 $3 $4 rgba($5, $6, $7, $8);\nbox-shadow: $1 $2 $3 $4 rgba($5, $6, $7, $8);$0" "box-sha" nil nil nil "/home/sel/.emacs.d/snippets/css-mode/box-sha.yasnippet" nil nil)
                       ("border-ra" "-webkit-border-radius: ${1:3px};\n-moz-border-radius: $1;\nborder-radius: $1;$0\n" "border-radius" nil nil nil "/home/sel/.emacs.d/snippets/css-mode/border-ra.yasnippet" nil nil)))


;;; Do not edit! File generated at Fri Oct 18 10:40:29 2019
