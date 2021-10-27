;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     sql
     csv
     ansible
     nginx
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     auto-completion
     better-defaults
     emacs-lisp
     git
     markdown
     org
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     ;; spell-checking
     syntax-checking
     version-control
     yaml
     github
     html
     javascript
     python
     docker
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(
                                      )
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages t))

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
   ;; when the current branch is not `develop'. (default t)
   dotspacemacs-check-for-update t
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged. (default 'vim)
   dotspacemacs-editing-style 'hybrid
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner nil
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(recents projects)
   ;; Number of recent files to show in the startup buffer. Ignored if
   ;; `dotspacemacs-startup-lists' doesn't include `recents'. (default 5)
   dotspacemacs-startup-recent-list-size 5
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light
                         solarized-light
                         solarized-dark
                         leuven
                         monokai
                         zenburn)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; (Not implemented) dotspacemacs-distinguish-gui-ret nil
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil `Y' is remapped to `y$'. (default t)
   dotspacemacs-remap-Y-to-y$ t
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout t
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido t
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state nil
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
   dotspacemacs-maximized-at-startup t
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
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
   dotspacemacs-whitespace-cleanup t
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init'.  You are free to put almost
any user code here.  The exception is org related code, which should be placed
in `dotspacemacs/user-config'."
  (setq user-full-name "Christian Liisberg"
        user-full-email-address "mail@host.tld"
        mail-host-address "domain.tld")
  (custom-set-variables
   '(send-mail-function (quote smtpmail-send-it))
   '(smtpmail-smtp-server "mailserver")
   '(smtpmail-smtp-service 25))


  (setq org-agenda-files
        (delq nil
              (mapcar (lambda (x) (and (file-exists-p x) x))
                      '("~/.org/Agenda"))))
  (setq org-default-notes-file "~/.org/notes.org")
  (setq org-use-speed-commands t)
  (setq org-image-actual-width 550)
  ;; archiving for old TODO items
  (setq org-archive-location "~/.org/archive/archive.org::* From %s")
  ;; org-mode capture templates: maybe org-mode need it's own file?
  (setq org-capture-templates
        '(("t" "Todo" entry (file+headline "~/.org/todo.org" "Ad-hoc")
           "* TODO %?\n  %i\n")
          ("n" "Note" entry (file "~/.org/notes.org")
           "* %? %t\n  %i\n")
          ("j" "Journal" entry (file+datetree "~/.org/journal.org")
           "* %T: %?\n\n  %i\n")))
  ;; Alter TODO states for more trackabillity.
  (setq org-todo-keywords
        (quote ((sequence "TODO(t)" "RESEARCH(r@/!)" "ACTIVE(a!)" "|" "FINISHED(f!)" "DONE(d!)"  "CANCELLED(c@/!)"))))
  (setq org-agenda-files (list "~/.org/todo.org"
                               "~/.org/plan.org"
                               "~/.org/notes.org"
                               "~/.org/journal.org"))
  ;; set specific agenda optionn to onnly see tasks assigned to me
  (setq org-agenda-custom-commands
        '(("c" "My Agenda"
           ((tags "ASSIGNEE={.+}")))))
  ;; with all this loggin, put it in a seperate drawer.
  (setq org-log-into-drawer t)
  ;; Select states fast by C-c C-t KEY
  (setq org-use-fast-todo-selection t)
  (with-eval-after-load 'org-agenda
    (require 'org-projectile)
    (push (org-projectile:todo-files) org-agenda-files))
  (setq org-todo-keyword-faces
        (quote (("TODO" :foreground "red" :weight bold)
                ("ACTIVE" :foreground "light blue" :weight bold)
                ("DONE" :foreground "forest green" :weight bold)
                ("DELEGATED" :foreground "green" :weight bold)
                ("WAITING" :foreground "orange" :weight bold)
                ("HOLD" :foreground "brown" :weight bold)
                ("CANCELLED" :foreground "light grey" :weight bold)
                ("MEETING" :foreground "yellow" :weight bold)
                ("PHONE" :foreground "yellow" :weight bold))))
                                        ;try to color literal code blocks
  (setq org-src-fontify-natively t
        org-src-window-setup 'current-window
        org-src-strip-leading-and-trailing-blank-lines t
        org-src-preserve-indentation t
        org-src-tab-acts-natively t)


  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration. You are free to put any user code."






  ;; ERC configuration...
  (setq erc-server "irc.freenode.net"
        erc-port 6667
        erc-nick "chl_"
        erc-user-full-name "chl_"
        erc-email-userid "mail@server.tld")
  ;; check channels
  (erc-track-mode t)
  (setq erc-track-exclude-types '("JOIN" "NICK" "PART" "QUIT" "MODE"
                                  "324" "329" "332" "333" "353" "477"))
  ;; don't show any of this
  (setq erc-hide-list '("JOIN" "PART" "QUIT" "NICK"))

  ;; auto join activated
  (erc-autojoin-mode t)
  (bind-key "s-M-t" 'transpose-sexps)
  ;; some other personal convenience settings.
  (global-set-key "\C-K" 'kill-whole-line)
  (global-set-key "\M-D" 'backward-kill-word)
  (global-set-key "\C-j" 'pop-global-mark)
  (blink-cursor-mode -1)
  ;; (add-hook 'python-mode-hook
  ;;           (lambda ()
  ;;             (setq python-shell-interpreter "python3")))
  (setq python-shell-interpreter "python3")
  (setq create-lockfiles nil)
  (defun occur-dwim ()
    "Call `occur' with a sane default."
    (interactive)
    (push (if (region-active-p)
              (buffer-substring-no-properties
               (region-beginning)
               (region-end))
            (thing-at-point 'symbol))
          regexp-history)
    (call-interactively 'occur))

  (bind-key "M-s o" 'occur-dwim)
  ;; Function to move to beginning of code if somwhere else
  (defun my--back-to-indentation ()
    "Move to indentation respecting `visual-line-mode'."
    (if visual-line-mode
        (flet ((beginning-of-line (arg) (beginning-of-visual-line arg)))
          (back-to-indentation))
      (back-to-indentation)))

  ;; funcition to move to beginning of line if at beginning of code
  (defun my--move-beginning-of-line (&optional arg)
    "Move to beginning of line respecting `visual-line-mode'."
    (if visual-line-mode
        (beginning-of-visual-line arg)
      (move-beginning-of-line arg)))

  ;; function implementing above written functions so this can be bound to C-a for easy moving around.
  (defun my-back-to-indentation-or-beginning (&optional arg)
    "Jump back to indentation of the current line.  If already
there, jump to the beginning of current line.  If visual mode is
enabled, move according to the visual lines."
    (interactive "p")
    (cond
     ((and (functionp 'org-table-p)
           (org-table-p))
      (let ((eob (save-excursion
                   (re-search-backward "|")
                   (forward-char 1)
                   (skip-chars-forward " ")
                   (point))))
        (if (= (point) eob)
            (org-beginning-of-line)
          (goto-char eob))))
     ((eq major-mode 'dired-mode)
      (if (= (point) (save-excursion
                       (dired-move-to-filename)
                       (point)))
          (progn
            (move-beginning-of-line 1)
            (skip-syntax-forward " "))
        (dired-move-to-filename)))
     ((eq major-mode 'org-mode)
      (org-beginning-of-line))
     (t
      (if (or (/= arg 1)
              (= (point) (save-excursion
                           (my--back-to-indentation)
                           (point))))
          (progn
            (my--move-beginning-of-line arg)
            (when (/= arg 1)
              (my--back-to-indentation)))
        (my--back-to-indentation)))))

  ;; Company mode indent or autocomplete function
                                        ; snippet i pulled and edited from emacs wiki as i  remember.. sry
  (defun indent-or-expand (arg)
    "Either indent according to mode, or expand the word preceding
point."
    (interactive "*P")
    (if (and
         (or (bobp) (= ?w (char-syntax (char-before))))
         (or (eobp) (not (= ?w (char-syntax (char-after))))))
        (company-complete)
      (indent-according-to-mode)))

  ;; setup mu4e config
;;; Set up some common mu4e variables
  (setq mu4e-maildir "~/.mail"
        mu4e-trash-folder "/Trash"
        mu4e-refile-folder "/Archive"
        mu4e-get-mail-command "mbsync -a"
        mu4e-update-interval nil
        mu4e-compose-signature-auto-include nil
        mu4e-view-show-images t
        mu4e-view-show-addresses t)

;;; Mail directory shortcuts
  (setq mu4e-maildir-shortcuts
        '(("/gmail/INBOX" . ?g)
          ("/work/INBOX" . ?w)))

;;; Bookmarks
  (setq mu4e-bookmarks
        `(("flag:unread AND NOT flag:trashed" "Unread messages" ?u)
          ("date:today..now" "Today's messages" ?t)
          ("date:7d..now" "Last 7 days" ?w)
          ("mime:image/*" "Messages with images" ?p)
          (,(mapconcat 'identity
                       (mapcar
                        (lambda (maildir)
                          (concat "maildir:" (car maildir)))
                        mu4e-maildir-shortcuts) " OR ")
           "All inboxes" ?i)))


  (bind-key "C-a" 'my-back-to-indentation-or-beginning)
  (global-set-key [S-left] 'windmove-left)
  (global-set-key [S-right] 'windmove-right)
  (global-set-key [S-up] 'windmove-up)
  (global-set-key [S-down] 'windmove-down)
  (global-set-key "\M-o" 'other-window)
  (bind-key "s-C-<left>"  'shrink-window-horizontally)
  (bind-key "s-C-<right>" 'enlarge-window-horizontally)
  (bind-key "s-C-<down>"  'shrink-window)
  (bind-key "s-C-<up>"    'enlarge-window)
  (global-set-key "\M-f" 'find-file)
  (global-set-key "\M-F" 'find-file-other-window)
  (global-set-key "\M-b" 'switch-to-buffer)
  (global-set-key "\M-B" 'switch-to-buffer-other-window)
  (global-set-key "\M-k" 'kill-this-buffer)
  (spacemacs/set-leader-keys "ff" 'ido-find-file)
  (spacemacs/set-leader-keys "fF" 'ido-find-file-other-window)
  (spacemacs/set-leader-keys "bk" 'kill-this-buffer)
  (spacemacs/set-leader-keys "bB" 'switch-to-buffer-other-window)
  ) 
;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flycheck-checker-error-threshold 4000)
 '(magit-am-arguments (quote ("--3way")))
 '(package-selected-packages
   (quote
    (ob-elixir flycheck-credo alchemist elixir-mode magit-diff-flycheck yapfify winum uuidgen unfill powerline py-isort pug-mode php-extras spinner org-projectile org-category-capture org-mime org-download nginx-mode mwim mu4e-maildirs-extension mu4e-alert alert log4e gntp markdown-mode magit-popup livid-mode skewer-mode simple-httpd live-py-mode link-hint multiple-cursors js2-mode jinja2-mode hydra lv dash-functional parent-mode projectile request haml-mode gitignore-mode github-search fringe-helper git-gutter+ git-gutter gh marshal logito pcache ht fuzzy pos-tip flycheck pkg-info epl flx eyebrowse evil-visual-mark-mode evil-unimpaired highlight magit git-commit with-editor smartparens iedit evil-ediff anzu evil goto-chg undo-tree eshell-z dumb-jump php-mode docker transient tablist docker-tramp json-snatcher json-reformat csv-mode csharp-mode web-completion-data company-ansible company column-enforce-mode bind-map bind-key yasnippet packed anaconda-mode pythonic f dash s helm helm-core async auto-complete popup phpunit phpcbf php-auto-yasnippets diminish sql-indent drupal-mode ansible-doc ansible ace-jump-buffer ace-jump-mode ace-jump-zap evil-avy avy yaml-mode xterm-color ws-butler window-numbering which-key web-mode web-beautify volatile-highlights vi-tilde-fringe use-package toc-org tagedit spacemacs-theme spaceline smooth-scrolling smeargle slim-mode shell-pop scss-mode sass-mode restart-emacs rainbow-delimiters quelpa pyvenv pytest pyenv-mode py-yapf popwin pip-requirements persp-mode pcre2el paradox page-break-lines package-build orgit org-repo-todo org-present org-pomodoro org-plus-contrib org-bullets open-junk-file omnisharp neotree multi-term move-text mmm-mode markdown-toc magit-gitflow magit-gh-pulls macrostep lorem-ipsum linum-relative leuven-theme less-css-mode json-mode js2-refactor js-doc jade-mode info+ indent-guide ido-vertical-mode hy-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation help-fns+ helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gnuplot github-clone github-browse-file gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gist gh-md flycheck-pos-tip flx-ido fill-column-indicator fancy-battery expand-region exec-path-from-shell evil-visualstar evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-args evil-anzu eval-sexp-fu eshell-prompt-extras esh-help erc-yt erc-view-log erc-social-graph erc-image erc-hl-nicks emmet-mode elisp-slime-nav dockerfile-mode disaster diff-hl define-word cython-mode company-web company-tern company-statistics company-quickhelp company-c-headers company-anaconda coffee-mode cmake-mode clean-aindent-mode clang-format buffer-move bracketed-paste auto-yasnippet auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(send-mail-function (quote smtpmail-send-it))
 '(smtpmail-smtp-server "mailserver")
 '(smtpmail-smtp-service 25))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
