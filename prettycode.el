(defun pretty-add-keywords (mode keywords)
  "Add pretty character KEYWORDS to MODE
MODE should be a symbol, the major mode command name, such as
`c-mode' or nil. If nil, pretty keywords are added to the current
buffer. KEYWORDS should be a list where each element has the
form (REGEXP . CHAR). REGEXP will be replaced with CHAR in the
relevant buffer(s)."
  (font-lock-add-keywords
   mode (mapcar (lambda (kw) `(,(car kw)
                               (0 (prog1 nil
                                    (compose-region (match-beginning 0)
                                                    (match-end 0)
                                                    ,(cdr kw))))))
                keywords)))
