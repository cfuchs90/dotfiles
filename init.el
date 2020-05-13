 ;; Add the org, melpa, melpa-stable and gnu servers to list of package mirrors
(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'load-path "~/emacs.d/offline-packages")

(setq package-enable-at-startup nil)
(package-initialize)

;; Instruct Emacs to use use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; require use-package
(eval-when-compile
 (require 'use-package))

; atom-one-dark theme as main theme for emacs
(use-package atom-one-dark-theme
  :ensure t)

   ; org-beautify for a prettier org mode
(use-package org-beautify-theme
  :ensure t)

; the smart mode line
(use-package smart-mode-line
  :ensure t)

(use-package shell-pop
  :ensure t)

;; which key packe pops up a list of possible key combinations after pressing 
;; for example C-x
(use-package which-key
  :ensure t
  :init
    (which-key-mode))

;; helm package - extremely useful
;; (use-package helm
;;   :ensure t
;;   :init (require 'helm)
;;   :config
;;   (helm-mode t))
(use-package ivy
  :config
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d%d)")
  (ivy-mode 1))

(use-package all-the-icons-ivy
  :ensure t
  :init
  (all-the-icons-ivy-setup))

(use-package all-the-icons-dired
  :ensure t
  :hook (dired-mode . all-the-icons-dired-mode))

;; The perspeen package provides layouts and vim-style tabs for emacs
(use-package perspeen
  :ensure t
  :init
  (setq perspeen-use-tab t)
  :config
  (perspeen-mode))

;; watch images and print image-thumbnails in dired
(use-package image-dired
  :ensure t
  :config
  (setq image-dired-thumb-margin 5))

;; yasnippet for snippets
(use-package yasnippet
  :ensure t
  :config
  (add-hook 'org-mode-hook 'yas-minor-mode))
;; A snippets pack for multiple modes
(use-package yasnippet-snippets
  :ensure t)

;; makes it possible to use python regular expressions in emacs
(use-package visual-regexp-steroids
  :ensure t
  :config
  (require 'visual-regexp-steroids))

;; install evil leader
;; (use-package evil-leader
;;   :ensure t
;;   :config
;;   (evil-leader/set-leader "<SPC>")
;;   (evil-leader/set-key
;;     "f" 'find-file)) 

 ;; Vim style navigation key bindins
(use-package evil
  :ensure t
  :init
  (setq evil-disable-insert-state-bindings t)
  (setq evil-toggle-key "C-?")
  (require 'evil))
  ;; :config
  ;; (evil-mode 1))

;; vim-key bindings in org mode
;; (use-package evil-org
;;   :ensure t
;;   :after org
;;   :config
;;   (add-hook 'org-mode-hook 'evil-org-mode)
;;   (add-hook 'evil-org-mode-hook
;; 	    (lambda ()
;; 	      (evil-org-set-key-theme)))
;;   (require 'evil-org-agenda)
;;   (evil-org-agenda-set-keys))

;; key chord lets you define keybindings
;; used to press "jk" to enter the evil normal state 
(use-package key-chord
  :ensure t
  :init
  (require 'key-chord)
  (key-chord-mode 1)
  (key-chord-define-global "qq" 'view-mode)
  (key-chord-define evil-insert-state-map "jk" 'evil-normal-state))

;; press gcc in normal mode to comment a line
(use-package evil-commentary
  :ensure t
  :init
  (evil-commentary-mode))

;; Git integration
(use-package magit
  :ensure t)
  

;; inserts parantheses automatically
(use-package paredit
   :ensure t)

;; project amangement
(use-package projectile
   :ensure t)

;; make the parens coloured
(use-package rainbow-delimiters
   :ensure t)
   
;; check syntax and style on the fly
(use-package flycheck
  :ensure t)

;; R integration
(use-package ess
  :ensure t
  :init (require 'ess-site))

(use-package expand-region
  :ensure t)

;; enhanced python integration
(use-package elpy
  :ensure t
  :init
  (elpy-enable))

;; web-mode for better html and css support
(use-package web-mode
  :ensure t
  :init
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq js-indent-level 2)
  (setq web-mode-enable-auto-pairing t)
  (setq web-mode-enable-auto-expanding t)
  (setq web-mode-enable-css-colorization t)
  (add-hook 'web-mode-hook 'electric-pair-mode)
  (add-hook 'web-mode-hook 'emmet-mode)
(setq web-mode-engines-alist
      '(("jinja2"    . "\\.jinja2\\'")
        ("django"    . "\\.html\\'")))
  :config
  :mode ("\\.html$" . web-mode)
  :mode ("\\.css$" . web-mode)
)

(use-package dot-mode
  :ensure t
  :config
  (dot-mode-on))

;; sass-mode, makes it possible to use sass
(use-package sass-mode
  :ensure t
  :mode ("\\.scss$" . sass-mode))

;; browse css/scss classes with helm
(use-package helm-css-scss
  :ensure t)


;; for zencoding
(use-package emmet-mode
  :ensure t
  :commands (emmet-mode
             emmet-next-edit-point
             emmet-prev-edit-point)
  :init
  (setq emmet-indentation 2)
  (setq emmet-move-cursor-between-quotes t)
  :config
  ;; Auto-start on any markup modes
  (add-hook 'sgml-mode-hook 'emmet-mode)
  (add-hook 'web-mode-hook 'emmet-mode))

(use-package julia-mode
  :ensure t)

;; pretty bullets
(use-package org-bullets
  :ensure t
  :init
  (add-hook 'org-mode-hook (lambda ()
			     (org-bullets-mode 1))))

 ;; group org items im a better way
(use-package org-super-agenda
  :ensure t
  :config
  (org-super-agenda-mode t)
  (setq org-super-agenda-groups '((:name "Important"
					 :priority "A")
				  (:name "Today"
					 :time-grid t
					 :scheduled today)
				  (:name "Overdue"
					 :deadline past)
				  (:name "Due soon"
					 :deadline future)
				  (:name "Errands"
					 :tag "Haushalt")
				  (:name "Waiting"
					 :todo "WAITING"))))

 ;; bibtex citations for Org mode
(use-package org-ref
  :ensure t
  :init
    (setq reftex-default-bibliography '("~/Dokumente/MastersThesis/references.bib"))
    (setq org-ref-default-bibliography '("~/Dokumente/MastersThesis/references.bib")
	org-ref-pdf-directory "~/Dokumente/ResearchPaper"
	))


(use-package counsel
  :ensure t)

(use-package company
  :ensure t
  :config
  (global-company-mode))

 ;; Latex integration !!!! MAY NOT WORK PROPERLY!!!!
(use-package auctex
  :defer t
  :ensure auctex
  :config
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq-default TeX-master nil)
  (add-hook 'LaTeX-mode-hook 'visual-line-mode)
  (add-hook 'LaTeX-mode-hook 'flyspell-mode)
  (add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
  (add-hook 'LaTeX-mode-hook 'turn-on-reftex)
  (setq reftex-plug-into-AUCTeX t)
  (setq TeX-PDF-mode t)
    (load "auctex.el" nil t t)
    (load "preview-latex.el" nil t t))

;; use helm to browse and search bibtex entries
  (use-package helm-bibtex
    :ensure t)

;; standard academic phrases used in papers
(use-package academic-phrases
  :ensure t)

;; A thesaurus for emacs
(use-package synosaurus
  :ensure t)

(require 'epa-file)
(epa-file-enable)
(setq epa-pinentry-mode 'loopback)



;(setq org-src-tab-acts-natively t)
(setq org-src-preserve-indentation t)

;; Let org mode show images inline
(setq org-startup-with-inline-images t)

  (setq org-capture-templates
        '(("t" "Todo" entry (file+headline "/home/christian/Dokumente/Persoenliches/privat.org.gpg" "Inbox")
          "* TODO %?\n  %i\n  %a")
          ("j" "Journal" entry (file+datetree "~/org/journal.org")
           "* %?\nEntered on %U\n  %i\n  %a")
          ("a" "Scheduled TODO" entry (file+headline "~/Dokumente/Persoenliches/privat.org.gpg" "Inbox")
           "* TODO %? %^G \nSCHEDULED: %^t\n  %U" :empty-lines 1)
          ("d" "Deadline" entry (file+headline  "~/Dokumente/Persoenliches/privat.org.gpg" "Inbox")
           "* TODO %? %^G \n DEADLINE: %^t" :empty-lines 1)
          ("s" "Shopping Item" entry (file+headline "~/Dokumente/Persoenliches/mylife.org.gpg" "Shopping")
          "* TODO %? %^G \nSCHEDULED: %^t\n  %U" :empty-lines 1)
          ("p" "Project" entry (file "~/Dokumente/projects.org.gpg")
           "*  %? %i " :empty-lines 1)
          ("i" "Idea" entry (file "~/Dokumente/ideas.org")
           "*  %? %i %^G" :empty-lines 1)
          ("c" "Schedule & Deadline" entry (file+headline  "~/Dokumente/Persoenliches/privat.org.gpg" "Inbox")
           "* TODO %? %^G \nSCHEDULED: %^t\n DEADLINE: %^t" :empty-lines 1)
          ("b" "Bookmark" entry (file+headline "~/Dokumente/Persoenliches/privat.org.gpg" "Bookmarks")
  	         "* %?\n:PROPERTIES:\n:CREATED: %U\n:END:\n\n" :empty-lines 1)
         ))

  (setq org-todo-keywords
        '((sequence "NEXT(n)" "TODO(t)" "WAITING(w)" "SOMEDAY(s)" "|" "DONE(d)" "CANCELLED(c)")))

(setq org-tag-alist '(("UNI" . ?u) ("Lesen" . ?l) ("Daily" . ?d) ("Haushalt" . ?h) ("Programmieren" . ?p) ("Schreiben" . ?w) ("PC Adminstration" . ?a) ("Buch" . ?b)))

(setq org-directory "~/Dokumente/Persoenliches/")
(setq org-agenda-files '("~/Dokumente/Persoenliches/privat.org.gpg"))
(setq org-agenda-span 2)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((R . t)
   (python . t)
   (emacs-lisp . t)
   (shell . t)
   (sql . t)
   (sqlite . t)))

;; (global-set-key (kbd "C-#") 'push-mark-no-activate)
;; (global-set-key (kbd "M-#") 'jump-to-mark)
;; (global-set-key (kbd "C-x p") 'proced)
;; (global-set-key (kbd "C-c c") 'org-capture)
;; (global-set-key (kbd "C-x a") 'org-agenda)
;; (global-set-key (kbd "C-x C-f") 'helm-find-files)
;; (global-set-key "\C-x\C-m" 'execute-extended-command)
;; (global-set-key "\C-c\C-m" 'execute-extended-command)
;; (global-set-key (kbd "C-c r") 'vr/replace)
;; (global-set-key (kbd "C-c q") 'vr/query-replace)
;; (global-set-key (kbd "M-z") 'perspeen-tab-next)
;; (global-set-key (kbd "M-Z") 'perspeen-tab-prev)
;; (global-set-key (kbd "C-x b") 'helm-mini)
;; (global-set-key (kbd "C-x w") 'window-swap-states)

;;===== ERC - IRC Configs ======
;; (add-hook 'erc-after-connect '(lambda (SERVER NICK)
;; 				(erc-message "PRIVMSG" "NickServ identify ichwillin")))


;;==== KEYBINDINGS=====
;; (global-set-key (kbd "C-s") 'swiper-isearch)
(global-set-key (kbd "M-s") 'swiper-isearch)
;; (global-set-key (kbd "M-s") 'shell-pop)
(global-set-key (kbd "M-ü") 'er/expand-region)
(global-set-key (kbd "C-a") 'back-to-indentation)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key "\C-x\C-m" 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "M-y") 'counsel-yank-pop)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "<f2> j") 'counsel-set-variable)
(global-set-key (kbd "C-x b") 'ivy-switch-buffer)
(global-set-key (kbd "C-c v") 'ivy-push-view)
(global-set-key (kbd "C-c V") 'ivy-pop-view)
(global-set-key (kbd "C-t") 'perspeen-tab-next)
(global-set-key (kbd "C-T") 'perspeen-tab-prev)
(global-set-key (kbd "M-z") 'zap-up-to-char)
(global-set-key (kbd "M-Z") 'zap-to-char)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-x a") 'org-agenda)
(global-set-key (kbd "C-x b") 'ivy-switch-buffer)

(all-the-icons-ivy-setup)

(evil-define-key nil normal-state-map
  "/" 'vr/isearch-forward
  "?" 'vr/isearch-backward)
(evil-ex-define-cmd "ls" 'ivy-switch-buffer)

;;==== GENERAL SETUP=====
(set-frame-font "Hack 12" nil t)


(put 'narrow-to-region 'disabled nil)
(put 'set-goal-column 'disabled nil)
(put 'narrow-to-page 'disabled nil)

(setq delete-old-versions -1) ;; delete excess backup versions silently
(setq version-control t) ; use version control
(setq vc-make-backup-files t) ;; make backup files even when in version controlled dir
(setq backup-directory-alist'(("." . "~/.emacs.d/backups"))) ; which directory to put backup files
(setq vc-follow-symlinks t) ; Follow sym link
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t))) ;; transform backups file name
(setq inhibit-startup-screen t) ;; don't show startup screen
(setq ring-bell-function 'ignore) ; silent bell, loud bell is annoying
(setq coding-system-for-read 'utf-8) ; use utf-8 by default
(setq coding-system-for-write 'utf-8)
(setq sentence-end-double-space nil) ;; sentence should end with only a point.
(setq default-fill-column 80) ;; toggle wrapping after 80 chars
(setq-default cursor-type 'bar) ;; set the cursor to a bar
(defalias 'yes-or-no-p 'y-or-n-p)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(setq-default major-mode 'text-mode)
(global-display-line-numbers-mode)
(electric-pair-mode)
(global-subword-mode 1)
(show-paren-mode 1)
(windmove-default-keybindings)
(load-theme 'atom-one-dark t)
(load-theme 'org-beautify t)
;;(sml/setup)
(add-hook 'emacs-startup-hook 'eshell)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("669e02142a56f63861288cc585bee81643ded48a19e36bfdf02b66d745bcc626" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default)))
 '(package-selected-packages
   (quote
    (lua-mode dot-mode shell-pop powerthesaurus ranger dired-ranger evil-leader helm-bibtex rainbow-mode all-the-icons-dired all-the-icons-ivy all-the-icons all-the-icons-ivy-rich ivy swiper counsel yasnippet-snippets which-key web-mode visual-regexp-steroids use-package synosaurus smart-mode-line sass-mode rainbow-delimiters projectile perspeen paredit org-super-agenda org-ref org-bullets org-beautify-theme magit julia-repl helm-css-scss flycheck expand-region evil-org evil-commentary ess emmet-mode elpy auctex atom-one-dark-theme ace-window academic-phrases)))
 '(shell-pop-shell-type (quote ("eshell" "*eshell*" (lambda nil (eshell)))))
 '(shell-pop-universal-key "C-ö")
 '(shell-pop-window-position "bottom")
 '(shell-pop-window-size 20)
 '(web-mode-enable-current-element-highlight t)
 '(web-mode-enable-element-content-fontification nil)
 '(web-mode-enable-html-entities-fontification t)
 '(web-mode-enable-sql-detection t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:foreground "#ABB2BF" :background "#282C34")))))
