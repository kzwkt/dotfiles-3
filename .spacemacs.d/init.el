;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.
;;
;; Reload: <SPC f e R> (Vim) or <M-m f e R> (Emacs)

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     vimscript
     lua
     csv
     javascript
     yaml
     haskell
     html
     python
     helm
     auto-completion
     better-defaults
     emacs-lisp
     git
     latex
     markdown
     mu4e
     org
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     spell-checking
     syntax-checking
     version-control
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '()
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(anaconda-mode smartparens)
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Bitstream Vera Sans Mono"
                               :size 12
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  ;; (setq initial-frame-alist '((top . 0) (left . 1870) (width . 95) (height . 80)))
  )

(defun dotspacemacs/user-config ()
  (progn
    ;; Dvorak keybindings for evil and org.
    (define-key evil-normal-state-map "h" 'evil-backward-char)
    (define-key evil-normal-state-map "t" 'evil-next-line)
    (define-key evil-normal-state-map "n" 'evil-previous-line)
    (define-key evil-normal-state-map "s" 'evil-forward-char)
    ;; (define-key evil-normal-state-map [left] 'undefined)
    ;; (define-key evil-normal-state-map [down] 'undefined)
    ;; (define-key evil-normal-state-map [up] 'undefined)
    ;; (define-key evil-normal-state-map [right] 'undefined)
    (define-key evil-normal-state-map "k" 'undefined)
    (define-key evil-normal-state-map "l" 'undefined)
    (define-key evil-normal-state-map ";" 'undefined)

    (define-key evil-motion-state-map "h" 'evil-backward-char)
    (define-key evil-motion-state-map "t" 'evil-next-line)
    (define-key evil-motion-state-map "n" 'evil-previous-line)
    (define-key evil-motion-state-map "s" 'evil-forward-char)
    ;; (define-key evil-motion-state-map [left] 'undefined)
    ;; (define-key evil-motion-state-map [down] 'undefined)
    ;; (define-key evil-motion-state-map [up] 'undefined)
    ;; (define-key evil-motion-state-map [right] 'undefined)
    (define-key evil-motion-state-map "k" 'undefined)
    (define-key evil-motion-state-map "l" 'undefined)
    (define-key evil-motion-state-map ";" 'undefined)

    (define-key evil-normal-state-map "N" 'undefined)
    (define-key evil-normal-state-map "k" 'evil-search-next)
    (define-key evil-normal-state-map "K" 'evil-search-previous)

    (evil-define-key 'normal evil-org-mode-map "t" 'evil-next-line)

    ;; Python.
    (global-flycheck-mode -1)
    (custom-set-variables '(python-guess-indent nil)
                          '(python-indent-offset 4))

    ;; org-mode.
    (setq org-agenda-files
          '("~/org"
                             ;; "/ssh:j:~/empc/notes/bamos.org"
                             ;; "/ssh:j:~/optnet.private/notes.org"))
            ))

    ;; mu4e.
    ;; (add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu4e")
    (add-to-list 'load-path "/usr/local/Cellar/mu/HEAD-90868bd_1/share/emacs/site-lisp/mu/mu4e")
    (setq user-full-name "Brandon Amos"
          user-mail-address "bamos@cs.cmu.edu"
          message-send-mail-function 'smtpmail-send-it
          smtpmail-local-domain "gmail.com"
          smtpmail-default-smtp-server "smtp.gmail.com"
          smtpmail-smtp-server "smtp.gmail.com"
          smtpmail-smtp-service 587
          smtpmail-queue-mail nil
          smtpmail-queue-dir "~/.mu/queue/cur"
          mu4e-maildir "~/mbsync"
          mu4e-drafts-folder "/[Gmail].Drafts"
          mu4e-sent-folder   "/[Gmail].Sent Mail"
          mu4e-refile-folder   "/[Gmail].All Mail"
          mu4e-trash-folder  "/[Gmail].Trash"
          mu4e-sent-messages-behavior 'delete
          message-kill-buffer-on-exit t
          mu4e-maildir-shortcuts
          '( ("/INBOX"               . ?i)
             ("/[Gmail].Sent Mail"   . ?s)
             ("/[Gmail].Trash"       . ?t)
             ("/[Gmail].Drafts"      . ?d)
             ("/[Gmail].All Mail"    . ?a))
          mu4e-get-mail-command "mbsync gmail"
          mu4e-update-interval (* 10 60)
          mu4e-view-image-max-width 800
          mu4e-view-show-images t
          mu4e-view-show-addresses t
          mu4e-change-filenames-when-moving t
          mu4e-hide-index-messages 1
          mu4e-confirm-quit nil
          mu4e-headers-leave-behavior 'apply
          mu4e-compose-complete-only-personal t)
    (when (fboundp 'imagemagick-register-types)
      (imagemagick-register-types))
    (defun my-mu4e-mark-execute-all-no-confirm ()
      (interactive)
      (mu4e-mark-execute-all 'no-confirm))
    (eval-after-load 'mu4e
      '(progn
         (define-key mu4e-headers-mode-map "x" #'my-mu4e-mark-execute-all-no-confirm)))

    ;; https://emacs.stackexchange.com/a/24430
    (defun draft-auto-save-buffer-name-handler (operation &rest args)
      "for `make-auto-save-file-name' set '.' in front of the file name; do nothing for other operations"
      (if
          (and buffer-file-name (eq operation 'make-auto-save-file-name))
          (concat (file-name-directory buffer-file-name)
                  "."
                  (file-name-nondirectory buffer-file-name))
        (let ((inhibit-file-name-handlers
               (cons 'draft-auto-save-buffer-name-handler
                     (and (eq inhibit-file-name-operation operation)
                          inhibit-file-name-handlers)))
              (inhibit-file-name-operation operation))
          (apply operation args))))

    (add-to-list 'file-name-handler-alist '("Drafts/cur/" . draft-auto-save-buffer-name-handler))

    (autoload 'mm-url-decode-entities-string "mm-url")
    (defun get-url-html-title (url &rest ignored)
      "Return the title of the HTML page at URL."
      (let ((download-buffer (url-retrieve-synchronously url))
            title-start title-end)
        (save-excursion
          (set-buffer download-buffer)
          (beginning-of-buffer)
          (setq title-start (search-forward "<title>"))
          (search-forward "</title>")
          (setq title-end (search-backward "<"))
          (s-trim
           (s-collapse-whitespace
            (mm-url-decode-entities-string
             (buffer-substring-no-properties title-start title-end)))))))

    (defun my-org-toggle-auto-link-description ()
      "Toggle automatically downloading link descriptions."
      (interactive)
      (if org-make-link-description-function
          (progn
            (setq org-make-link-description-function nil)
            (message "Automatic link description downloading disabled."))
        (setq org-make-link-description-function #'get-url-html-title)
        (message "Automatic link description downloading enabled.")))

    ;; https://emacs.stackexchange.com/a/9588
    (require 'cl)
    (require 'dash)

    (defun todo-to-int (todo)
      (first (-non-nil
              (mapcar (lambda (keywords)
                        (let ((todo-seq
                               (-map (lambda (x) (first (split-string  x "(")))
                                     (rest keywords)))) 
                          (cl-position-if (lambda (x) (string= x todo)) todo-seq)))
                      org-todo-keywords))))

    (defun my-org-sort-key ()
      (let* ((todo-max (apply #'max (mapcar #'length org-todo-keywords)))
             (todo (org-entry-get (point) "TODO"))
             (todo-int (if todo (todo-to-int todo) todo-max))
             (priority (org-entry-get (point) "PRIORITY"))
             (priority-int (if priority (string-to-char priority) org-default-priority)))
        (format "%03d %03d" todo-int priority-int)
        ))

    (defun my-org-sort-entries ()
      (interactive)
      (org-sort-entries nil ?f #'my-org-sort-key))

    (setq org-capture-templates
          '(("t" "todo" entry (file "~/org/todo.org")
             "* TODO %a %?\nDEADLINE: %(org-insert-time-stamp (org-read-date nil t \"+0d\"))")))

    ))


;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (vimrc-mode dactyl-mode xterm-color smeargle shell-pop orgit org-projectile org-category-capture org-present org-pomodoro org-download mwim multi-term alert log4e gntp mmm-mode markdown-toc markdown-mode magit-gitflow htmlize helm-gitignore helm-company helm-c-yasnippet gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gh-md flyspell-correct-helm flyspell-correct flycheck-pos-tip pos-tip flycheck-haskell evil-magit magit magit-popup git-commit ghub let-alist with-editor eshell-z eshell-prompt-extras esh-help diff-hl company-web web-completion-data company-statistics company-cabal company-anaconda auto-yasnippet auto-dictionary ac-ispell auto-complete lua-mode company-auctex auctex-latexmk auctex w3m csv-mode mu4e-maildirs-extension mu4e-alert ht winum unfill fuzzy web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc company-tern dash-functional tern coffee-mode yaml-mode intero flycheck hlint-refactor hindent helm-hoogle haskell-snippets yasnippet company-ghci company-ghc ghc company haskell-mode cmm-mode yapfify ws-butler window-numbering which-key web-mode volatile-highlights vi-tilde-fringe uuidgen use-package toc-org tagedit spaceline powerline slim-mode scss-mode sass-mode restart-emacs request rainbow-delimiters pyvenv pytest pyenv-mode py-isort pug-mode popwin pip-requirements persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum live-py-mode linum-relative link-hint less-css-mode info+ indent-guide ido-vertical-mode hydra hy-mode hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-css-scss helm-ag haml-mode google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight emmet-mode elisp-slime-nav dumb-jump diminish define-word cython-mode column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed anaconda-mode pythonic f dash s aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async quelpa package-build spacemacs-theme)))
 '(python-guess-indent nil)
 '(python-indent-guess-indent-offset nil)
 '(python-indent-offset 4)
 '(send-mail-function (quote mailclient-send-it)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )