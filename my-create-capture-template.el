;; Example existing template for general TODOs
;; Create Personalized Org Capture Templates

;;------------FORMAT---------
;; * ~KEYBIND~ - MYDESCRIPTION - MODE
;;
(setq key "t"
      name "Todo"
      path "~/.emacs.d/mytesting/my-capture-tests.org"
      formatstring "* TODO ";;%?\\n %i\\n %a"
      under-headline "Tests")

(defun my/make-format-string()
  "* headline text goes here
** String Format Properties List:
File: %[~/.emacs.d/myelisps/replace-string-literal-with-variable.el]
Time (%\\t): %t
Datetime (%\\T): %T
------
Initial Context (Whatever was selected when the capture was initiated): %i
------
Annotation (%\\a): %a

(%\\c): %c
(%\\x): %x
(%\\k): %k
Username (taken from user-full-name) (%\\n ): %n

File visited by current buffer when org-capture was called:
(%\\f): %f

Full path of file or directory visited by current buffer
(%\\F): %F

DODODODOODDODODODDO
now make it do the thing where it captures the keybindings
ODODODODDODODODDODO
 ")
;; Prompted Description Annotation (%\\A): %A
;; SEXP: %(insert "This string is from an sexp")

(setq org-capture-templates
      `(
        (,key ,name entry (file+headline ,path ,under-headline)
              (function my/make-format-string))

        ))

;; Comment For how these are laid out:
;; ("key" "name" entry (stuff+stuff+stuff "~/path" "Name"optional) "formatting string")
;; Example existing template for general TODOs
;; (setq origin-file (plist-get org-capture-current-plist :original-file))
