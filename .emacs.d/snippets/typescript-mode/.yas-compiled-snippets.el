;;; Compiled snippets and support files for `typescript-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'typescript-mode
                     '(("let" "let ${1:name} = ${0:`%`};" "let" nil nil nil "/home/sel/.emacs.d/snippets/typescript-mode/let.yasnippet" nil nil)
                       ("importas" "import * as ${1:`%`} from '$2';" "import * as ..." nil nil nil "/home/sel/.emacs.d/snippets/typescript-mode/importas.yasnippet" nil nil)
                       ("import" "import {$2} from \"$1\";$0" "import ..." nil nil nil "/home/sel/.emacs.d/snippets/typescript-mode/import.yasnippet" nil nil)
                       ("const" "const ${1:name} = ${0:`%`};" "const" nil nil nil "/home/sel/.emacs.d/snippets/typescript-mode/const.yasnippet" nil nil)
                       ("class" "class ${1:Name} {\n    $2\n\n    constructor($3) {\n        `%`$0\n    }\n}" "class" nil nil nil "/home/sel/.emacs.d/snippets/typescript-mode/class.yasnippet" nil nil)))


;;; Do not edit! File generated at Fri Oct 18 10:40:29 2019
