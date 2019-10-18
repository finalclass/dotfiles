;;; Compiled snippets and support files for `js-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'js-mode
                     '(("svar" "var ${1:var} = spec.$1;" "extract variable from a spec var" nil nil nil "/home/sel/.emacs.d/snippets/js-mode/svar.yasnippet" nil nil)
                       ("section" "/*********************************\n * $1\n *********************************/$0" "creates a comment section" nil nil nil "/home/sel/.emacs.d/snippets/js-mode/section.yasnippet" nil nil)
                       ("@p" " * @param {$2} $1" "create a jsdoc param" nil nil nil "/home/sel/.emacs.d/snippets/js-mode/param.yasnippet" nil nil)
                       ("Oeach" "Object.keys(${obj}).forEach(function (${key}) {\n    $0\n});" "Oeach" nil nil nil "/home/sel/.emacs.d/snippets/js-mode/oeach.yasnippet" nil nil)
                       ("/**" "/**\n * $0\n *\n *\n */" "create a jsdoc block" nil nil nil "/home/sel/.emacs.d/snippets/js-mode/jsdoc.yasnippet" nil nil)
                       ("impl" "throw new Error('Not implemented yet');$0" "throw not implemented error" nil nil nil "/home/sel/.emacs.d/snippets/js-mode/impl.yasnippet" nil nil)
                       ("fun" "function $1($2) {\n    $0\n}" "fun" nil nil nil "/home/sel/.emacs.d/snippets/js-mode/fun.yasnippet" nil nil)
                       ("svar" "var ${1:var} = spec.$1;" "extract variable from a spec var" nil nil nil "/home/sel/.emacs.d/snippets/js-mode/ctrl.yasnippet" nil nil)
                       ("con" "console.log(${what});$0" "console.log" nil nil nil "/home/sel/.emacs.d/snippets/js-mode/con.yasnippet" nil nil)
                       ("cobj" "function create${Obj}(spec) {\n    var self = Object.create(null);\n\n    $0\n\n    return Object.defineProperties(self, {\n\n    });\n}" "create object function" nil nil nil "/home/sel/.emacs.d/snippets/js-mode/cobj.yasnippet" nil nil)
                       ("cl" "console.log($0);" "console.log statement" nil nil nil "/home/sel/.emacs.d/snippets/js-mode/cl.yasnippet" nil nil)
                       ("Ofr" "Object.freeze($0);" "Object.freeze()" nil nil nil "/home/sel/.emacs.d/snippets/js-mode/Ofr.yasnippet" nil nil)
                       ("Odefs" "Object.defineProperties(${self}, {$0});" "Object.defineProperties(...)" nil nil nil "/home/sel/.emacs.d/snippets/js-mode/Odefs.yasnippet" nil nil)
                       ("Odef" "Object.defineProperty(${self}, '${property}', ${val});$0~" "Object.defineProperty(...)" nil nil nil "/home/sel/.emacs.d/snippets/js-mode/Odef.yasnippet" nil nil)
                       ("Ocr" "Object.create(${null});$0" "Object.create()" nil nil nil "/home/sel/.emacs.d/snippets/js-mode/Ocr.yasnippet" nil nil)))


;;; Do not edit! File generated at Fri Oct 18 10:40:29 2019
