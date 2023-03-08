(defun whoami ()
  "Messages the username: if the variable user-full-name is not '',
   uses it. If not, uses the environment variable USER. Forces using
   the envvar setting whoami-use-envvar"
  (interactive)
  (let ((write-after
	 (if (or
	      (and (boundp 'whoami-use-envvar) (not (null whoami-use-envvar)))
	      (equal user-full-name ""))
	     (format "%s, at least that's what your computer said me." (getenv "USER"))
	   (format "%s, at least that's what you said me." user-full-name))))
    (message "You're %s" write-after)))

(defun cowsay ()
  "The world-famous Cow says. Uses the variable
   cowsay-command. Defaults to 'cowsay $(fortune)'"
  (interactive)
    (switch-to-buffer "*cowsay*")
    (read-only-mode -1)
    (erase-buffer)
    (insert (shell-command-to-string
	     (if (and (boundp 'cowsay-command) (not (null cowsay-command)))
		 cowsay-command
	       "cowsay $(fortune)")))
    (read-only-mode))
