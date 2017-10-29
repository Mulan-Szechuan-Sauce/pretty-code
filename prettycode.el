(defun fun (kw)
  (let* ((regex (car kw))
         (replacement-fun (cdr kw)))
    `(,regex
      (0 (prog1 nil
           (compose-region (match-beginning 1)
                           (match-end 1)
                           (funcall ,replacement-fun ,regex)))))))

(defun pretty-add-keywords (mode keywords)
  "Add pretty character KEYWORDS to MODE
MODE should be a symbol, the major mode command name, such as
`c-mode' or nil. If nil, pretty keywords are added to the current
buffer. KEYWORDS should be a list where each element has the
form (REGEXP . CHAR). REGEXP will be replaced with CHAR in the
relevant buffer(s)."
  (font-lock-add-keywords
   mode (mapcar 'fun keywords)))

(pretty-add-keywords nil '(("\\(foo\\|bar\\)" . (lambda (r) ?a))))

(pretty-add-keywords nil '(("\\(foo\\|bar\\)" . (lambda (r)
                                                  (aref (match-string 0) 0)))))

; *Maybe* add umlauts to vowels
(pretty-add-keywords nil '(("\\(a\\|o\\|e\\|u\\|i\\)" . (lambda (r)
                                                          (+ 200 (aref (match-string 0) 0))))))

;;"https://github.com/emacs-mirror/emacs/blob/bc511a64f6da9ab51acc7c8865e80c4a4cb655c2/lisp/progmodes/prog-mode.el"
;;"https://github.com/drothlis/pretty-symbols"

C-x 8 <RET>

;; http://www.fileformat.info/info/unicode/char/0308/index.htm

jk

ݶu 

ḧ
l̈
ö
ä

é⃝t

