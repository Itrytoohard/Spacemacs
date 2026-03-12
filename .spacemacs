;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
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

   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. "~/.mycontribs/")
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     ;; all-the-icons
     (auto-completion :variables
                      ;; -----------Enable only one of these:--------------
                      ;; --------------------------------------------------
                      ;; ;; Tab cycles, Enter completes
                      ;; auto-completion-tab-key-behavior 'cycle
                      ;; auto-completion-return-key-behavior 'complete
                      ;; --------------------------------------------------
                      ;; Tab completes, Enter does nothing, arrows to cycle
                      auto-completion-tab-key-behavior 'complete
                      auto-completion-return-key-behavior nil
                      ;; --------------------------------------------------
                      ;; Wait longer before showing
                      auto-completion-idle-delay 0.5
                      ;; Require 3 chars
                      auto-completion-minimum-prefix-length 2
                      ;; Mine Below
                      auto-completion-enable-snippets-in-popup t ;; <note> set to nil to fix YASnippet?
                      auto-completion-enable-sort-by-usage t
                      auto-completion-enable-help-tooltip t
                      ;; auto-completion-complete-with-key-sequence "qq"
                      auto-completion-complete-with-key-sequence-delay 1.0
                      ;; from spacemacs layer completion manual (defaults)
                      ;; auto-completion-return-key-behavior 'complete
                      ;; auto-completion-tab-key-behavior 'cycle
                      ;; auto-completion-complete-with-key-sequence nil
                      ;; auto-completion-complete-with-key-sequence-delay 0.1
                      ;; auto-completion-minimum-prefix-length 2
                      ;; auto-completion-idle-delay 0.2
                      ;; auto-completion-private-snippets-directory nil
                      ;; auto-completion-enable-snippets-in-popup nil
                      ;; auto-completion-enable-help-tooltip nil

                      ;; auto-completion-use-company-box nil
                      ;; auto-completion-enable-sort-by-usage nil
                      )

     ;; better-defaults ;; makes more sensible emacs configs. does nothing in vim mode (per docs)
     command-log
     ;; (compleseus :variables
     ;;             compleseus-engine 'vertico
     ;;             compleseus-consult-preview-keys '("M-." "C-SPC" :debounce 0.2 "<up>" "<down>") ; if you only are arrowing through, completion preview will wait til you hover on a selection for 0.5 seconds.
     ;;             )
     emacs-lisp
     git
     (helm :variables
           helm-enable-auto-resize nil

           )
     html
     java
     lsp ;; should probably enable this to see if it does anything different
     (markdown :variables
               ;; markdown-command "pandoc"
               ;; markdown-live-preview-engine 'pandoc
                                        ; Optional: Add extra arguments for GitHub-flavored markdown, mathjax, etc.
               markdown-command "pandoc -t html5 -f gfm --mathjax --highlight-style=pygments --toc"

               markdown-live-preview-engine 'pandoc
               )
     multiple-cursors
     (org :variables
          org-enable-roam-support t
          org-enable-roam-ui t
          ;; org-enable-roam-protocol t
          org-enable-sticky-header t
          ;; org-enable-modern-support t
          org-enable-appear-support t
          org-enable-transclusion-support t
          org-enable-superstar t
          )
     ;; (osx :variables
     ;; osx-command-as 'super
     ;;      osx-command-as       'control
     ;;      osx-option-as        'meta
     ;;      osx-control-as       'control
     ;;      ;; osx-function-as      nil
     ;;      osx-right-command-as 'left
     ;;      osx-right-option-as  'left
     ;;      osx-right-control-as 'left
     ;;      osx-swap-option-and-command nil)
     pandoc
     (ruby :variables ruby-version-manager 'rbenv)
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     (spell-checking :variables spell-checking-enable-by-default nil)
     syntax-checking
     ;; tabs
     ;; themes-megapack
     ;; version-control ; turned this off because the all-the-icons modeline was misbehaving
     treemacs
     yaml
     )


   ;; List of additional packages that will be installed without being wrapped
   ;; in a layer (generally the packages are installed only and should still be
   ;; loaded using load/require/use-package in the user-config section below in
   ;; this file). If you need some configuration for these packages, then
   ;; consider creating a layer. You can also put the configuration in
   ;; `dotspacemacs/user-config'. To use a local version of a package, use the
   ;; `:location' property: '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '(key-chord keyfreq)

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-but-keep-unused))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; Set `read-process-output-max' when startup finishes.
   ;; This defines how much data is read from a foreign process.
   ;; Setting this >= 1 MB should increase performance for lsp servers
   ;; in emacs 27.
   ;; (default (* 1024 1024))
   dotspacemacs-read-process-output-max (* 1024 1024)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. Spacelpa is currently in
   ;; experimental state please use only for testing purposes.
   ;; (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default t)
   dotspacemacs-verify-spacelpa-archives t

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim

   ;; If non-nil show the version string in the Spacemacs buffer. It will
   ;; appear as (spacemacs version)@(emacs version)
   ;; (default t)
   dotspacemacs-startup-buffer-show-version t

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official

   ;; Scale factor controls the scaling (size) of the startup banner. Default
   ;; value is `auto' for scaling the logo automatically to fit all buffer
   ;; contents, to a maximum of the full image height and a minimum of 3 line
   ;; heights. If set to a number (int or float) it is used as a constant
   ;; scaling factor for the default logo size.
   dotspacemacs-startup-banner-scale 'auto

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `recents-by-project' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   ;; The exceptional case is `recents-by-project', where list-type must be a
   ;; pair of numbers, e.g. `(recents-by-project . (7 .  5))', where the first
   ;; number is the project limit and the second the limit on the recent files
   ;; within a project.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Show numbers before the startup list lines. (default t)
   dotspacemacs-show-startup-list-numbers t

   ;; The minimum delay in seconds between number key presses. (default 0.4)
   dotspacemacs-startup-buffer-multi-digit-delay 0.4

   ;; If non-nil, show file icons for entries and headings on Spacemacs home buffer.
   ;; This has no effect in terminal or if "nerd-icons" package or the font
   ;; is not installed. (default nil)
   dotspacemacs-startup-buffer-show-icons t

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; If non-nil, *scratch* buffer will be persistent. Things you write down in
   ;; *scratch* buffer will be saved and restored automatically.
   dotspacemacs-scratch-buffer-persistent t

   ;; If non-nil, `kill-buffer' on *scratch* buffer
   ;; will bury it instead of killing.
   dotspacemacs-scratch-buffer-unkillable t

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light). A theme from external
   ;; package can be defined with `:package', or a theme can be defined with
   ;; `:location' to download the theme package, refer the themes section in
   ;; DOCUMENTATION.org for the full theme specifications.
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator nil :separator-scale 1.54)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font or prioritized list of fonts. This setting has no effect when
   ;; running Emacs in terminal. The font set here will be used for default and
   ;; fixed-pitch faces. The `:size' can be specified as
   ;; a non-negative integer (pixel size), or a floating-point (point size).
   ;; Point size is recommended, because it's device independent. (default 10.0)
   dotspacemacs-default-font '("SauceCodePro Nerd Font"
                               :size 14.0
                               :weight normal
                               :width normal)

   ;; Default icons font, it can be `all-the-icons' or `nerd-icons'.
   dotspacemacs-default-icons-font 'nerd-icons

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; <TODO> Potentially interesting
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m" for terminal mode, "M-<return>" for GUI mode).
   ;; Thus M-RET should work as leader key in both GUI and terminal modes.
   ;; C-M-m also should work in terminal mode, but not in GUI mode.
   dotspacemacs-major-mode-emacs-leader-key (if window-system "M-<return>" "C-M-m")

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab t

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

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

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state nil ;; Edited

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   ;; <changed>
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; It is also possible to use a posframe with the following cons cell
   ;; `(posframe . position)' where position can be one of `center',
   ;; `top-center', `bottom-center', `top-left-corner', `top-right-corner',
   ;; `top-right-corner', `bottom-left-corner' or `bottom-right-corner'
   ;; (default 'bottom)
   ;; <changed>
   dotspacemacs-which-key-position 'right

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; Make consecutive tab key presses after commands such as
   ;; `spacemacs/alternate-buffer' (SPC TAB) cycle through previous
   ;; buffers/windows/etc. Please see the option's docstring for more information.
   ;; Set the option to t in order to enable cycling for all current and
   ;; future cycling commands. Alternatively, choose a subset of the currently
   ;; supported commands: '(alternate-buffer alternate-window). (default nil)
   dotspacemacs-enable-cycling nil

   ;; Whether side windows (such as those created by treemacs or neotree)
   ;; are kept or minimized by `spacemacs/toggle-maximize-window' (SPC w m).
   ;; (default t)
   dotspacemacs-maximize-window-keep-side-windows t

   ;; If nil, no load-hints enabled. If t, enable the `load-hints' which will
   ;; put the most likely path on the top of `load-path' to reduce walking
   ;; through the whole `load-path'. It's an experimental feature to speedup
   ;; Spacemacs on Windows. Refer the FAQ.org "load-hints" session for details.
   dotspacemacs-enable-load-hints nil

   ;; If t, enable the `package-quickstart' feature to avoid full package
   ;; loading, otherwise no `package-quickstart' attemption (default nil).
   ;; Refer the FAQ.org "package-quickstart" section for details.
   dotspacemacs-enable-package-quickstart nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default t) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' to obtain fullscreen
   ;; without external boxes. Also disables the internal border. (default nil)
   dotspacemacs-undecorated-at-startup nil

   ;; <TODO>
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes the
   ;; transparency level of a frame background when it's active or selected. Transparency
   ;; can be toggled through `toggle-background-transparency'. (default 90)
   dotspacemacs-background-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Show the scroll bar while scrolling. The auto hide time can be configured
   ;; by setting this variable to a number. (default t)
   dotspacemacs-scroll-bar-while-scrolling nil

   ;; Control line numbers activation.
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but only visual lines are counted. For example, folded lines will not be
   ;; counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; When used in a plist, `visual' takes precedence over `relative'.
   ;; (default nil)
   dotspacemacs-line-numbers 'relative

   ;; Code folding method. Possible values are `evil', `origami' and `vimish'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil and `dotspacemacs-activate-smartparens-mode' is also non-nil,
   ;; `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil smartparens-mode will be enabled in programming modes.
   ;; (default t)
   dotspacemacs-activate-smartparens-mode t

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc...
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server nil

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `ack' and `grep'.
   ;; (default '("rg" "ag" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "ack" "grep")

   ;; <TODO>
   ;; The backend used for undo/redo functionality. Possible values are
   ;; `undo-redo', `undo-fu' and `undo-tree' see also `evil-undo-system'.
   ;; Note that saved undo history does not get transferred when changing
   ;; your undo system from or to undo-tree. (default `undo-redo')
   dotspacemacs-undo-system 'undo-redo

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; If nil then Spacemacs uses default `frame-title-format' to avoid
   ;; performance issues, instead of calculating the frame title by
   ;; `spacemacs/title-prepare' all the time.
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I | Path:%f | Mode: %m | mnemonics: %Z"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Color highlight trailing whitespace in all prog-mode and text-mode derived
   ;; modes such as c++-mode, python-mode, emacs-lisp, html-mode, rst-mode etc.
   ;; (default t)
   dotspacemacs-show-trailing-whitespace nil

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; The variable `global-spacemacs-whitespace-cleanup-modes' controls
   ;; which major modes have whitespace cleanup enabled or disabled
   ;; by default.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   ;; If non-nil activate `clean-aindent-mode' which tries to correct
   ;; virtual indentation of simple modes. This can interfere with mode specific
   ;; indent handling like has been reported for `go-mode'.
   ;; If it does deactivate it here.
   ;; (default t)
   dotspacemacs-use-clean-aindent-mode t

   ;; Accept SPC as y for prompts if non-nil. (default nil)
   dotspacemacs-use-SPC-as-y nil

   ;; If non-nil shift your number row to match the entered keyboard layout
   ;; (only in insert state). Currently supported keyboard layouts are:
   ;; `qwerty-us', `qwertz-de' and `querty-ca-fr'.
   ;; New layouts can be added in `spacemacs-editing' layer.
   ;; (default nil)
   dotspacemacs-swap-number-row nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; <TODO> Once I know the syntax
   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil

   ;; If nil the home buffer shows the full path of agenda items
   ;; and todos. If non-nil only the file name is shown.
   dotspacemacs-home-shorten-agenda-source nil

   ;; If non-nil then byte-compile some of Spacemacs files.
   dotspacemacs-byte-compile nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env)
  )

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
  ;; (setq ns-use-srgb-colorspace nil)
  ;; (setq powerline-image-apple-rgb nil)

  ;; <TODO> Get back to this and install jinx/huspell/enchant2
  ;;  (setq-default spell-checking-enable-by-default nil)
  (my/disable-autoevilfication-fail-messages)
  )

;; (defun dotspacemacs/matt-hello-world ()
;;   "Adds 3 new lines after the point, then brings the pointer back to the line"
;;   (interactive)
;;   (insert "\n"))
;;   (global-set-key "C-x C-q C-q C-q" 'dotspacemacs/matt-hello-world)
;; Starts with non-prefix C
;; USER CONFIG
(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here"

  ;; Try this out sometime:
  ;; (setq debug-on-message "welcome who")


  (load-file "/Users/Matt/.emacs.d/myelisps/clipboard-html-to-org-mode.el")
  ;; (spacemacs/declare-prefix "oo" "my-menu")
  ;; (spacemacs/set-leader-keys "ms" 'my/convert-clipboard-html-to-org-mac)
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "M-p" 'my/convert-clipboard-html-to-org-mac)


  ;; (use-package keycast
  ;;   :commands keycast-mode
  ;;   :config
  ;;   (keycast-mode 1)) ; Enable keycast-mode globally
  ;; Optional: customize where keycast appears (default is the mode line)
  ;; (setq keycast-mode-line-insert-after "%e")

  ;; (advice-add 'consult--buffer-preview :around #'my-consult-no-preview-help)
  ;; Enable vertico-buffer-mode for Helm-like display
  ;; (use-package vertico-buffer
  ;;   :after vertico
  ;;   :config
  ;;   (vertico-buffer-mode 1))
  ;; (with-eval-after-load 'vertico
  ;;   (setq vertico-buffer-display-action '(display-buffer-below-selected)))
  ;; Look into how to keep spaces up to indent level even if line is empty


  ;; Ok for some godforsaken reason, these two don't stick

  (setq mac-command-modifier 'super) ;; default before this was nil ;; works once but it stops working on f e R for some reason

  ;; not magit - still slow with no magit buffers
  ;; (global-diff-hl-mode -1)


  ;; <delete> this if other thing works
  ;; (with-eval-after-load 'spaceline
  ;;   (spaceline-define-segment version-control
  ;;     "Version control information without diffs."
  ;;     (when vc-mode
  ;;       (powerline-raw (s-trim vc-mode)))
  ;;     :when vc-mode))

  (with-eval-after-load 'which-key
    ;; (setq which-key-popup-type 'minibuffer) ; Use minibuffer for display
    (setq which-key-max-description-length nil) ; Do not truncate descriptions
    (setq which-key-allow-imprecise-window-fit t)) ; Allow better window fitting

  ;; Force the minibuffer to wrap text instead of truncating it
  (add-hook 'minibuffer-setup-hook (lambda () (setq truncate-lines nil)))

  ;; 1. Prevent the echo area from truncating long messages
  (setq message-truncate-lines nil)

  ;; Allow the echo area to grow vertically to fit text
  (setq resize-mini-windows 'grow-only)
  (setq resize-mini-frames 'grow-only)

  ;; Set the maximum height the minibuffer can reach (0.25 = 25% of frame height)
  (setq max-mini-window-height 0.25)

  ;; Prevents making a new headline from an old one splitting it
  (setq org-M-RET-may-split-line nil)

  (my/my-org-meta-return-at-end-of-line)

  ;; (my/set-capture-helper)
  ;; Create Personalized Org Capture Templates
  ;; (setq org-capture-templates
  ;;       '(
  ;;         ;; Comment For how these are laid out:
  ;;         ;; ("key" "name" entry (stuff+stuff+stuff "~/path" "Name"optional) "formatting string")

  ;;         ;; Example existing template for general TODOs
  ;;         ("t" "Todo" entry (file+headline "~/org/gtd.org" "Tasks")
  ;;          "* TODO %?\\n %i\\n %a")

  ;;         ;; Example new template for Journal entries
  ;;         ("j" "Journal" entry (file+olp+datetree "~/org/journal.org")
  ;;          "* %?\\nEntered on %U\\n %i\\n %a")

  ;;         ;; Add your new templates here
  ;;         ("n" "New Note" entry (file "~/org/notes.org")
  ;;          "* %^{Title}\\n%?\\nAdded on %U")

  ;;         ;; Quick Keybinding Note
  ;;         ;; TODO make mode specific one, unknown, all
  ;;         ("k" "Keybind" entry (file "~/.emacs.d/org/unordered-emacs-functions.org")
  ;;          ;; "** ~{key sequence}~ | {description} | {mode-specific} "
  ;;          ;; "** ~{key sequence}~ | {description} | {mode-specific} "
  ;;          "** ~{key sequence}~ | {description} | {mode-specific} "
  ;;          :empty-lines 1)
  ;;         ))
  (my/set-keybindings-master-func)

  ;; (add-hook 'magit-mode-hook
  ;;           (lambda ()
  ;;             (when (string-prefix-p "/src/GitHubRepos/itrytoohard.github.io" default-directory)
  ;;               (magit-mode -1))))
  ;; Global Tab **Bar** Mode
  ;; (global-tab-bar-mode 1)

  ;; Global Tab **Line** Mode
  ;; (global-tab-line-mode 1)

  ;; Save and restore sessions (buffers, window configurations)
  (desktop-save-mode 1)

  ;; Save minibuffer history
  (savehist-mode 1)

  ;; Optional: Save the location of the point in files
  (save-place-mode 1)

  (scroll-bar-mode -1)

  (setq org-hide-leading-stars t)
  (add-hook 'org-mode-hook 'org-indent-mode)

  ;; Hacky crap that is needed because smartparens decided it was too good
  ;; to not break crap
  ;; (my/fix-smartparens-attitude)
  ;; (require 'smartparens)
  ;; (defun smartparens-mode () (debug))
  ;; (with-eval-after-load 'smartparens
  ;;   (defun smartparens-mode (&optional arg)
  ;;     "Redefine to accept the ARG that Spacemacs is trying to pass."
  ;;     (interactive "P")
  ;;     ;; You can leave this empty or call the original logic if needed
  ;;     (message "Smartparens-mode called with arg: %s" arg)))

  ;; Enter insert mode on commit message opening
  (add-hook 'git-commit-setup-hook 'evil-insert-state)

  ;; Changes filename on mode line to file path if one exists
  (spaceline-define-segment buffer-id
    (if (buffer-file-name)
        (buffer-file-name)              ; Displays the full, absolute file path
      (powerline-buffer-id)))

  ;; <TODO> make evil display -----insert----- like vim does
  ;; (add-hook 'evil-insert-state-entry-hook 'function-to-display-insert-mode)

  ;; Make text wrapping break lines at word boundaries
  (global-visual-line-mode 1)

  ;; (setq ns-use-srgb-colorspace nil)

  ;; sets bullets to a font that works
  (setq org-bullets-bullet-list '("◉" "⁑" "⁂" "❖" "✮" "✱" "✸"))

  ;; make the command key act like a control key in emacs only
  ;; (setq mac-command-modifier 'control)

  ;; Use TAB to complete
  ;; (define-key company-active-map (kbd "q q") 'company-complete-selection)
  ;; (define-key company-active-map (kbd "q q") 'company-complete-selection)

  ;; <mycode> <Tag for searching>


  (setq spaceline-highlight-face-style 'none)

  ;; don't ask if I want to follow symlinks
  (setq find-file-visit-truename t)

  ;; Show full path in header
  (setq org-sticky-header-full-path 'full)

  ;; Clicking a directory in dired will open it in the same buffer
  ;; instead of creating a new one
  (define-key dired-mode-map [mouse-1] 'dired-mouse-find-file)
  ;;
  ;; Rebind jk or C-q to exit insert mode (Removed for interfering with Customize GUI Newline entry, and also i never used this anymore)
  ;; (define-key map new-keybinding function) ; Syntax
  ;; Map H to go to the previous buffer in normal mode
  ;; (define-key evil-insert-state-map (kbd "C-q") 'evil-normal-state)
  ;; (define-key evil-insert-state-map (kbd "j-k") 'evil-normal-state)
  ;; (define-key evil-insert-state-map (kbd "k-j") 'evil-normal-state) ;; cant type the letters if you do this # bigsad

  ;; (key-chord-define "jk"     'evil-normal-state)
  (key-chord-define evil-insert-state-map "kj"     'evil-normal-state)
  (key-chord-define evil-insert-state-map "jk"     'evil-normal-state)

  (setq org-fontify-whole-heading-line t)
  ;; Begin big jk smash exit insert mode segment from
  ;; https://github.com/cofi/dotfiles/blob/a000343ad9268786d459c776fbcf267036999422/emacs.d/config/cofi-evil.el#L81-L95
  ;; reccommended by https://emacs.stackexchange.com/questions/19961/using-jk-to-exit-insert-mode-with-key-chord-or-anything-else

  (defun my-kj ()
    (interactive)
    (let* ((initial-key ?k)
           (final-key ?j)
           (timeout 0.5)
           (event (read-event nil nil timeout)))
      (if event
          ;; timeout met
          (if (and (characterp event) (= event final-key))
              (evil-normal-state)
            (insert initial-key)
            (push event unread-command-events))
        ;; timeout exceeded
        (insert initial-key))))

  (define-key evil-insert-state-map (kbd "k") 'my-kj)

  (defun my-jk ()
    (interactive)
    (let* ((initial-key ?j)
           (final-key ?k)
           (timeout 0.5)
           (event (read-event nil nil timeout)))
      (if event
          ;; timeout met
          (if (and (characterp event) (= event final-key))
              (evil-normal-state)
            (insert initial-key)
            (push event unread-command-events))
        ;; timeout exceeded
        (insert initial-key))))

  (define-key evil-insert-state-map (kbd "j") 'my-jk)

  ;; (evil-define-command cofi/evil-maybe-exit ()
  ;;   :repeat change
  ;;   (interactive)
  ;;   (let ((modified (buffer-modified-p))
  ;;         (entry-key ?j)
  ;;         (exit-key ?k))
  ;;     (insert entry-key)
  ;;     (let ((evt (read-event (format "Insert %c to exit insert state" exit-key) nil 0.5)))
  ;;       (cond
  ;;        ((null evt) (message ""))
  ;;        ((and (integerp evt) (char-equal evt exit-key))
  ;;         (delete-char -1)
  ;;         (set-buffer-modified-p modified)
  ;;         (push 'escape unread-command-events))
  ;;        (t (push evt unread-command-events))))))





  (evil-ex-define-cmd "wq" 'save-and-kill-this-buffer)
  (defun save-and-kill-this-buffer()(interactive)(save-buffer)(kill-current-buffer))
  ;; My attempt
  ;; (evil-ex-define-cmd "q" 'kill-this-buffer-with-prompt)
  ;; (defun kill-this-buffer-with-prompt()
  ;;   (if (buffer-modified-p)
  ;;       ((interactive)
  ;;        (if (y-or-n-p "Kill buffer without saving?")
  ;;            (kill-current-buffer)
  ;;          (message "Kill buffer operation cancelled.")))
  ;;     (kill-current-buffer))
  ;;   )

  ;; Re-done with gemini because elisp is slightly cursed.
  ;; And trying to work on it without knowing what basic syntax means is
  ;; not a great idea
  "Kill current buffer, prompting for confirmation if it has unsaved changes."
  (evil-ex-define-cmd "q" 'kill-this-buffer-with-prompt)
  (defun kill-this-buffer-with-prompt()
    (interactive)
    (if (and (buffer-modified-p)
             (buffer-file-name))        ; Only prompt for file-visiting buffers
        (if (y-or-n-p "Buffer has unsaved changes. Kill anyway? ")
            (kill-current-buffer)
          (message "Kill buffer operation cancelled.")
          )
      (kill-current-buffer)))

  ;; Check if a package is installed
  ;; (package-installed-p 'helpful)

  (evil-ex-define-cmd "wqall" 'save-and-kill-this-buffer-and-window)
  (defun save-and-kill-this-buffer-and-window()(interactive)(save-buffer)(kill-buffer-and-window))

  (evil-ex-define-cmd "qall" 'quit-emacs-with-prompt)
  (defun quit-emacs-with-prompt()
    (interactive)
    (if (y-or-n-p "Quit Emacs without saving?")
        (kill-buffer-and-window)
      (message "Quit cancelled.")))

  ;;(evil-ex-define-cmd "qall" 'kill-buffer-and-window)
  ;; (defun save-and-kill-this-buffer()(interactive)(save-buffer)(kill-current-buffer))

                                        ; if this comment is still here, q didnt work
  (my/disable-autoevilfication-fail-messages)

  ;; remove those infernal red trailing whitespace boxes
  (setq-default spacemacs-show-trailing-whitespace nil)
  (setq-default show-trailing-whitespace nil)
  (setq spacemacs-show-trailing-whitespace nil)
  (setq show-trailing-whitespace nil)

  ;; Ok for some godforsaken reason, these two don't stick

  (setq mac-command-modifier 'super) ;; default before this was nil ;; works

  ;; not magit - still slow with no magit buffers
  ;; (global-diff-hl-mode -1)

  (message "--- LOADING MY DOTFILE FROM %s ---" buffer-file-name)
  ;; (with-eval-after-load 'diff-hl
  ;;   (diff-hl-flydiff-mode -1))

  ;; (spaceline-toggle-all-the-icons-modified)
  ;; (setq-default spaceline-all-the-icons-hide-vcs t)

  ;; Commented out now that not using consult
  ;; Remove *Help* buffer from buffer list
  ;; (goal is to avoid preview-sticking-glitch)
  ;; (with-eval-after-load 'consult
  ;;   (add-to-list 'consult-buffer-filter "\\*Help\\*"))

  ;; When I use a keybinding, add the name of whatever function
  ;; it just called to the minibuffer in a line above the standard output
  ;; (defadvice call-interactively (after show-last-command activate)
  ;;   "Shows the interactive command that was just run in the message area."
  ;;   (unless (eq major-mode 'minibuffer-inactive-mode)
  ;;     (message "Ran command: %S" this-command)))
  ;; disable the hack above
  ;; (ad-activate 'call-interactively)
  ;; (ad-disable-advice 'call-interactively 'after 'show-last-command)

  ;; TBD if this is any better than it was before
  ;; (setq marginalia-align 'left)
  ;; alone, shoves stuff even farther to the right :/
  ;; (setq marginalia-align-offset 5)

  ;; commented out now that not using embark
  ;; (setq prefix-help-command #'embark-prefix-help-command)
  ;; (my-ai-OCT-2)
  (my/capture-temp-define-vars)
  (my/org-capture-template-adder)

  (my/run-mar-2-keybind-gemini)

  (my/run-mar-2-keybind-claude-sonnet)
  )

(defun my/run-mar-2-keybind-claude-sonnet ()
  ;; 2. Add the following to the `dotspacemacs/user-config` function
  ;;    in your ~/.spacemacs (or ~/.spacemacs.d/init.el):

  ;; Load the key-logger
  ;; (load-file "~/.spacemacs.d/spacemacs-key-logger.el")
  ;; (already loaded)
  (require 'spacemacs-key-logger)

  ;; Set your desired log file path
  (setq my-keybinding-log-path "~/.emacs.d/myelisps/remember-key/run-mar-2-keybind-claude-sonnet.org")

  ;; Optional: bind to a convenient key in Spacemacs
  (spacemacs/set-leader-keys "oj" 'spacemacs/smart-log-keybinding)
  )

(defun my/run-mar-2-keybind-gemini ()
  (add-to-list 'load-path "/Users/Matt/.emacs.d/myelisps/remember-key/")
  (require 'remember-key)
  ;; For example, 'SPC o k' (o is traditionally for personal user bindings in Spacemacs)
  (spacemacs/set-leader-keys "o k" 'remember-key-record)
  )

(defun identify-keybind-source (keybind-string)
  "Identify the leader prefix and category for KEYBIND-STRING.
  Return Value: (\"prefix\" \"Category\")
  Category options are \"Major\" \"Help\" and \"Global\". Non Matches return (list \"\" \"No Prefix\")"
  ;; ;; Gemini Plan
  ;; I need you to make an elisp function that takes in a string as an argument. Its name will be keybind-string. It represents an Emacs keybinding sequence. It will check the string against 3 lists of prefixes. Those prefix lists are:
  ;;
  ;; major-leader-list:  ("SPC m" "," "M-RET" "C-c C-" "C-c 0" "C-c 1" "C-c 2" "C-c 3" "C-c 4" "C-c 5" "C-c 6" "C-c 7" "C-c 8" "C-c 9")
  ;; help-leader-list:   ("C-h" "SPC h")
  ;; global-leader-list: ("C-x" "C-c" "SPC u" "SPC")
  ;;
  ;; Return the prefix that matches, as well as the name of the list that it is from. For example: if they keybinding entered was "SPC m e c", the function would return ("SPC m" "Major")

  (let ((major-leader-list '("SPC m" "," "M-RET" "C-c C-" "C-c 0" "C-c 1" "C-c 2"
                             "C-c 3" "C-c 4" "C-c 5" "C-c 6" "C-c 7" "C-c 8" "C-c 9"))
        (help-leader-list  '("C-h" "SPC h"))
        (global-leader-list '("C-x" "C-c" "SPC u" "SPC")))
    (or
     ;; 1. Check Major Leader List (Most specific)
     (let ((match (seq-find (lambda (p) (string-prefix-p p keybind-string)) major-leader-list)))
       (when match (list match "Major")))

     ;; 2. Check Help Leader List
     (let ((match (seq-find (lambda (p) (string-prefix-p p keybind-string)) help-leader-list)))
       (when match (list match "Help")))

     ;; 3. Check Global Leader List (Least specific, includes "SPC")
     (let ((match (seq-find (lambda (p) (string-prefix-p p keybind-string)) global-leader-list)))
       (when match (list match "Global")))

     ;; Default if no match is found
     ;; Test to see if the key is from the evil package first. If it is, do (list "" "Evil"). If not, make a seperate thingy for the new mode. Actually, you can do this from outside of this function
     (list "" "No Prefix"))))

(defun run-keybind-tests ()
  "Test identify-keybind-source against a set of key sequences."
  ;; ;; Gemini Testing Suite Plan
  ;; Lets make a testing suite. it should define a list of example keysequences, and print the result. The output of each item of the keysrquences list should look something like:
  ;; "SPC m e c" : "SPC m" "Major"
  (let ((test-cases '("SPC m e c"   ; Should be Major
                      "C-c 5 f"     ; Should be Major
                      "C-h k"       ; Should be Help
                      "SPC h v"     ; Should be Help
                      "SPC f f"     ; Should be Global
                      "C-x C-s"     ; Should be Global
                      "M-RET"       ; Should be Major
                      "C-g"         ; Should be None/Nil
                      "SPC C c"     ; Should be Global
                      "SPC b b"     ; Should be Global
                      ", e c"       ; Should be Major
                      "C-h h"       ; Should be Help
                      "SPC SPC"     ; Should be Global
                      "SPC u"       ; Should be Global
                      "SPC g s"     ; Should be Global
                      "M-RET M-RET" ; Should be Major
                      "V"           ; Should be nil
                      "D"           ; Should be nil
                      "yi'"         ; Should be nil
                      )))
    (message "--- Keybind Test Results ---")
    (dolist (key test-cases)
      (let ((result (identify-keybind-source key)))
        (if result
            (message "\"%s\" : \"%s\" \"%s\""
                     key
                     (nth 0 result)
                     (nth 1 result))
          (message "\"%s\" : No match found" key))))))

(defun my/capture-temp-define-vars ()
  "Define variables for keybind org capture template"
  ;; --- Elisp God try # 1 ---
  ;; --- Keybind Capture State Variables ---
  (defvar my/capture-temp-key-desc nil "Temporarily stores the key description.")
  (defvar my/capture-temp-verbal-desc nil "Temporarily stores the verbal description.")
  (defvar my/capture-temp-command nil "Temporarily stores the command name.")
  (defvar my/capture-temp-origin-mode nil "Temporarily stores the original major mode.")
  (defvar my/capture-temp-type nil "Temporarily stores the command type.")
  (defvar my/capture-temp-arity nil "Temporarily stores the command arity.")
  (defvar my/capture-temp-docstring nil "Temporarily stores the command docstring.")
  (defvar my/capture-temp-category nil "Temporarily stores the top-level category."))

(defun my/identify-keybind-source (key-desc)
  "Analyze KEY-DESC (a string like \"SPC m b\") and return its top-level category.
This checks the prefix of the key against Spacemacs and Emacs conventions."
  ;; --- Emacs God Try # 1.5 ---
  (cond
   ;; 1. Major Mode Commands
   ;; Spacemacs major-mode leader `SPC m`, alternate leader `,`, or standard Emacs `C-c`
   ((or (string-prefix-p "SPC m" key-desc)
        (string-prefix-p "," key-desc)
        (string-prefix-p "C-c" key-desc))
    "Major Mode Specific Commands")

   ;; 2. Help Commands
   ;; Spacemacs help leader `SPC h`, or standard Emacs `C-h` / `<f1>`
   ((or (string-prefix-p "SPC h" key-desc)
        (string-prefix-p "C-h" key-desc)
        (string-prefix-p "<f1>" key-desc))
    "Help Commands")

   ;; 3. Global Commands
   ;; Other Spacemacs leader keys `SPC`, or standard Emacs `C-x` / `M-` / `C-`
   ((or (string-prefix-p "SPC" key-desc)
        (string-prefix-p "C-x" key-desc)
        (string-prefix-p "M-" key-desc)
        (string-prefix-p "C-" key-desc)) ; Catch-all for other control keys
    "Global Commands")

   ;; 4. Default: Evil Commands
   ;; Raw keys without modifiers like 'j', 'k', 'v', 'c'
   (t "Evil Commands")))

(defun my/gather-keybind-info-to-state ()
  "Prompts for keybinding info and stores it in temporary state variables."
  ;; --- Elisp God Try # 1 ----
  (let* ((original-buffer (plist-get org-capture-plist :original-buffer))
         ;; 1. Prompt user for inputs
         (key (read-key-sequence "Press key sequence to document: "))
         (verbal-description (read-string "What the binding does: "))
         (key-desc (key-description key))

         ;; 2. Fetch context from the original buffer
         (command (with-current-buffer original-buffer (key-binding key)))
         (origin-mode (string-trim-right (my/org-capture-get-original-major-mode) "-mode"))

         ;; 3. Fetch function information
         (command-type (if command (type-of (symbol-function command)) "No Type"))
         (command-arity (if command (func-arity command) "No Arity"))
         (command-docstring (if command (documentation command) "No docstring"))

         ;; 4. Determine Top-Level Category using your existing function
         (top-level-category (my/identify-keybind-source key-desc)))

    ;; 5. Assign values to state variables
    (setq my/capture-temp-key-desc key-desc)
    (setq my/capture-temp-verbal-desc verbal-description)
    (setq my/capture-temp-command command)
    (setq my/capture-temp-origin-mode origin-mode)
    (setq my/capture-temp-type command-type)
    (setq my/capture-temp-arity command-arity)
    (setq my/capture-temp-docstring command-docstring)
    (setq my/capture-temp-category top-level-category)))

(defun my/org-capture-route-keybind-location ()
  "Finds or creates the deterministic outline path for the keybinding."
  ;; --- Elisp God Try # 1 ----
  ;; 1. Gather info and set state variables first
  (my/gather-keybind-info-to-state)

  ;; 2. Start at the top of the file
  (goto-char (point-min))

  ;; 3. Find or create the Top-Level Heading
  (let ((top-level my/capture-temp-category))
    (unless (re-search-forward (format "^\\* %s" (regexp-quote top-level)) nil t)
      (goto-char (point-max))
      (insert "\n* " top-level "\n")
      (backward-char 1))

    ;; 4. If it's a Major Mode, find or create the Sub-Level Heading
    (when (string= top-level "Major Mode Specific Commands")
      ;; Narrow buffer to just this top-level section so we don't match modes elsewhere
      (save-restriction
        (org-narrow-to-subtree)
        (goto-char (point-min))
        (unless (re-search-forward (format "^\\*\\* %s" (regexp-quote my/capture-temp-origin-mode)) nil t)
          (goto-char (point-max))
          (insert "\n** " my/capture-temp-origin-mode "\n")
          (backward-char 1))))

    ;; 5. Move point to the end of the current active subtree to append the capture
    (org-end-of-subtree t t)))

(defun my/org-capture-format-keybind ()
  "Formats the keybinding string using the temporary state variables."
  ;; --- Elisp God Try # 1 ----
  (format "*** ~%s~ | %s | Mode: %s\nFunction Called: %s \nMode called from: %s\n**** Function Info: \nType: %s\nNumArgs: %s\n**** Docstring: %s\n"
          my/capture-temp-key-desc
          my/capture-temp-verbal-desc
          my/capture-temp-origin-mode
          my/capture-temp-command
          my/capture-temp-origin-mode
          my/capture-temp-type
          my/capture-temp-arity
          my/capture-temp-docstring))

(defun my/org-capture-template-adder ()
  "Adds oct from Elisp God Try # 1 to 'org-capture-templates"
  ;; --- Elisp God Try # 1 ----
  (add-to-list 'org-capture-templates
               '("f" "DEEZNUTS" entry
                 (file+function "~/org/oct-keybindings-example.org" my/org-capture-route-keybind-location)
                 "%(my/org-capture-format-keybind)"
                 :empty-lines-after 1)))

(defun my/set-custom-buffer-next-prev-bindings()
  ;; Set key sequence after SPC ; then assign them names in which-key
  (spacemacs/set-leader-keys "bj" 'next-buffer)
  (which-key-add-key-based-replacements "SPC b j" "Next Buffer")
  (spacemacs/set-leader-keys "bk" 'previous-buffer)
  (which-key-add-key-based-replacements "SPC b k" "Previous Buffer")
  )

(defun my/give-which-key-names-to-premade-keybinds()
  (which-key-add-key-based-replacements "SPC g s" "Magit Status Page: magit-status")
  )

(defun my/fix-smartparens-attitude ()

  ;; Hacky crap that is needed because smartparens decided it was too good
  ;; to not break crap
  (require 'smartparens)
  ;; (defun smartparens-mode () (debug))
  (with-eval-after-load 'smartparens
    (defun smartparens-mode (&optional arg)
      "Redefine to accept the ARG that Spacemacs is trying to pass."
      (interactive "P")
      ;; You can leave this empty or call the original logic if needed
      (message "Smartparens-mode called with arg: %s" arg)))
  )

;; (defun my/capture-template-helper()

;;   )

;; (my/set-capture-helper)
;; (defun my/set-capture-helper ()
;;   ;; set vars for org capture template
;;   (setq
;;    ;; my-capture-template-shortcut-key "k"
;;    my-capture-template-shortcut-name "Keybind"
;;    capture-template-filepath "~/.emacs.d/org/capture-templates-test.org"
;;    my-capture-template-format-string "* %^{Title}\\n%?\\nAdded on %U"
;;    )
;;   (setq my-capture-template-shortcut-key "k")
;;   (print my-capture-template-shortcut-key)
;;   (my/helper "a" "b" capture-template-filepath my-capture-template-format-string)
;;   )

;; (defun my/helper (key name path format)

;;   (setq org-capture-templates
;;         ;; Miminum required to use
;;         '(
;;           (
;;            "k" name entry (file path)
;;            format
;;            )
;;           )
;;         )
;;   )
;; ;; (fff ("test"))
;; (defun fff (string-arg)
;;  print(string-arg))

(defun my/my-org-meta-return-at-end-of-line-helper ()
  "Move to end of line before calling `org-meta-return`."
  (interactive)
  (end-of-line)
  (call-interactively 'org-meta-return)
  )

(defun my/my-org-meta-return-at-end-of-line ()
  (with-eval-after-load 'org
    (define-key org-mode-map (kbd "M-RET") 'my/my-org-meta-return-at-end-of-line-helper)
    )
  )

;; a 1 correct one
(defun my/org-capture-key-info-shortcut ()
  "Prompt for a key sequence and return a string with the key and its command."
  (message "Entering (my/org-capture-key-info-shortcut)")
  (let* ((original-buffer (plist-get org-capture-plist :original-buffer))
         ;; get key from here 02-24-2026
         (key (read-key-sequence "Press key sequence: "))
         (verbal-description (read-string "What the binding does: "))
         (key-desc (key-description key))
         ;; (command (key-binding key))
         (command (with-current-buffer original-buffer
                    (key-binding key)))
         (origin-mode (string-trim-right (my/org-capture-get-original-major-mode) "-mode"))
         ;; Descriptions:
         ;;
         ;; Type
         (command-type (type-of (symbol-function command)))
         ;; Arity
         (command-arity (func-arity command))
         ;; Docstring
         (command-docstring (documentation command))
         )
    ;; (format "Key: ~%s~\nDescription: %s\nCommand: %s"
    ;;         key-desc
    ;;         verbal-description
    ;;         (or command "Not bound"))

    ;; First Part (Dont mess with)
    (format "* ~%s~ | %s | Mode: %s\nFunction Called: %s \nMode called from: %s\n** Function Info: \nType: %s\nNumArgs: %s\n** Docstring: %s\n\n"
            key-desc
            verbal-description
            (or origin-mode "No Mode Data")
            (or command "No command")
            (or origin-mode "No Mode Data")
            (or command-type "No Type")
            (or command-arity "No Arity")
            (or command-docstring "No docstring")
            )
    )
  )




(defun my/org-keybind-capture-template-find-insertion-headline ()
  "Move point to the desired location in the target file."
  ;; 1. Ensure the correct buffer is selected if not already done by file+function
  ;;    (find-file-noselect "/path/to/file.org") is implicitly handled by file+function
  ;; 2. Move point to the target headline
  (goto-char (point-min)) ; Start from the beginning


  (org-forward-search-headline "My Target Headline") ; Search for the specific headline

  (if (keybind-starts-with-space) ; condition
      if-not-keybind-starts-with-space-m-or-M-RET
    then-form ; then-form
    else-forms...) ; else-forms...
  )


(defun my/keybind-is-major-mode-map-okctfih (keybind-string-entered)
  "Takes the keybind the user entered as input. Returns prefix if the beginning of the keybind matches one of the major mode prefixes. Does *not* check anything else about the keybinding, its function, or mode.

Returns (PREFIX, PREFIX-TYPE)

PREFIX-TYPE is \"Major\", \"Help\", \"Global\", or \"Evil\"

"

  ;;-----Global Binding Conventions:---------------------------------------
  ;; 1. SPC !m - Spacemacs - All Global Commands
  ;; 2. C-x    - Emacs     - Essential Commands
  ;; 3. C-h    - Emacs     - Help Commands
  ;; 4. SPC h  - Spacemacs - Help Commands
  ;; 5. SPC u  - Spacemacs - Universal Argument Commands
  ;;-----User Defined Global Binding Conventions:--------------------------
  ;; 1. C-c <up/lower-letter> - Emacs
  ;; 2. SPC o m               - Spacemacs - User Major Mode Bindings
  ;; 2. SPC o <!m>            - Spacemacs - User Global Bindings
  ;;-----Major Mode Binding Conventions------------------------------------

  ;; 1. 'SPC m'      - Spacemacs
  ;; 2. ','          - Spacemacs
  ;; 3. 'M-RET'      - Spacemacs
  ;; 4. 'C-c [0-9]'  - Emacs
  ;; 5. 'C-c C-<any> - Emacs
  ;;-----Minor Mode Binding Conventions------------------------------------
  ;; 1. C-c <ASCII punctuation> - Emacs
  ;; 2. C-c <symbol>            - Emacs
  ;; 3. any                     - Spacemacs
  ;;-----------------------------------------------------------------------


  ;;-----Logic:------------------------------------------------------------
  ;; If 'SPC m' ',' 'C-c' or 'M-RET', relevance = major mode
  ;; If SPC Prefix: relevance = global
  ;; If not 'SPC' 'SPC m' ',' 'C-c' or 'M-RET'
  ;;-----------------------------------------------------------------------

  ;; Create String Lists for Variables
  ;; User Prefix Strings == Check first - easiest rules.
  ;; (let (user-prefix-strings ("SPC m o")))

  ;; Major Mode Prefix Strings
  ;; returns the last value. Yeah, I have no idea either.
  (let ((prefix-strings (list "SPC m" "," "C-c" "M-RET"))
        (test2 (list "one" "two")))
    (print prefix-strings)
    (print test2)
    "let finished")

  (let (()))

  (let ((prefix-strings (list "test1" "test2" "string3" "string4")))
    (format "prefix-strings: %s" prefix-strings)
    )
  ;; Global Prefix Strings


  ;;-------------Steps:----------------------------------------------------
  ;; 1. Set list of prefix strings for major mode bindings
  ;; 2. Check if any prefix matches
  ;;-----------------------------------------------------------------------

  (let ((prefix-strings (list "test1" "test2" "string" "string")))
    (format "%s" prefix-strings))
  ;; Returns: "(\"test1\" \"test2\" \"string\" \"string\")"

  (let (
        (prefix-strings (list "test1" "test2" "string" "string"))
        (spacemacs-global-leader "SPC")
        )
    (format
     "
%s
%s
"
     prefix-strings
     spacemacs-global-leader
     )
    )

  (let*
      ((prefix-strings (list "test1" "test2" "string" "string") )
       (my-string "SPC h SPC")
       ;;-----Global Binding Conventions:---------------------------------------
       ;; 2. C-x    - Emacs     - Essential Commands
       (emacs-essentials-leader "C-x")
       ;; 3. C-h    - Emacs     - Help Commands
       (emacs-help-global-leader "C-h")
       ;; 4. SPC h  - Spacemacs - Help Commands
       (spacemacs-help-global-leader "SPC h")
       ;; 5. SPC u  - Spacemacs - Universal Argument Commands
       (universal-arg-leader "SPC u")
       ;; 1. SPC !m - Spacemacs - All Global Commands
       (spacemacs-global-leader "SPC")

       (help-leader-list (list
                          emacs-help-global-leader
                          spacemacs-help-global-leader
                          ) )
       ;; Set them all to globals
       (global-leader-list (list
                            emacs-essentials-leader
                            emacs-help-global-leader
                            spacemacs-help-global-leader
                            universal-arg-leader
                            ) )
       (prefix-strings (list "test1" "test2" "string" "string") )
       ;; Output:
       ;; "
       ;; (SPC C-x C-h SPC h SPC)
       ;; "

       ;;-----User Defined Global Binding Conventions:---------------------
       ;; 1. C-c <up/lower-letter> - Emacs
       ;; (emacs-user-global)
       ;; ;; 2. SPC o m               - Spacemacs - User Major Mode Bindings
       ;; (spacemacs-user-major "SPC o m")
       ;; ;; 2. SPC o <!m>            - Spacemacs - User Global Bindings
       ;; (spacemacs-user-global)
       ;; Don't need these.
       ;; If I set them they should be useful enough to remember
       ;;-----Major Mode Binding Conventions-------------------------------
       ;; 1. 'SPC m'      - Spacemacs
       (spacemacs-major-prefix-space "SPC m")
       ;; 2. ','          - Spacemacs
       (spacemacs-major-prefix-comma ",")
       ;; 3. 'M-RET'      - Spacemacs
       (spacemacs-major-prefix-mret "M-RET")
       ;; 4. 'C-c [0-9]'  - Emacs
       ;; forget it...jk that was suprisingly easy
       (emacs-major-prefix-C-c-nums (list "C-c 0" "C-c 1" "C-c 2" "C-c 3" "C-c 4" "C-c 5" "C-c 6" "C-c 7" "C-c 8" "C-c 9" ))
       ;; 5. 'C-c C-<any> - Emacs
       (emacs-major-prefix-C-c-C-any "C-c C-")

       (major-leader-list (
                           append ; appends one list to another
                           (list
                            spacemacs-major-prefix-space
                            spacemacs-major-prefix-comma
                            spacemacs-major-prefix-mret
                            emacs-major-prefix-C-c-C-any
                            )
                           emacs-major-prefix-C-c-nums
                           )
                          )

       ;;------------------------------------------------------------------
       ;; todo make `formatted-keybind-input'
       ;; (major-match (get-matching-key-prefix major-leader-list formatted-keybind-input))
       ;; go through major mode bindings to see if any matches:
       ;; use `get-matching-key-prefix'
       (my-x 1)


       ;; (cond
       ;;  ((= my-x 1)
       ;;   (message "x is 1"))
       ;;  ((= my-x 2)
       ;;   (message "x is 2"))
       ;;  (t ; The 't' condition acts as a default/else clause
       ;;   (message "x is something else")))

       ) ;; end variable definitions
    (format
     "
prefix-strings:     %s
major-leader-list:  %s
help-leader-list:   %s
global-leader-list: %s
"
     prefix-strings
     major-leader-list
     help-leader-list
     global-leader-list
     ;; (print major-leader-list)
     )

    ;; (get-matching-prefix keybind-string-entered )
    ;; (print "Major Leader List:")
    ;; (print major-leader-list)
    ;; (print "Global Leader List:")
    ;; (print global-leader-list)
    ;; (debug)
    ;; RETURN matching prefix string.
    (prefix-match (seq-find (lambda (prefix)
                              (string-prefix-p prefix my-string))
                            (append major-leader-list help-leader-list global-leader-list)))

    ;; 'SPC u , e e' to Debug?

    (cond
     ;; First clause: check if the variable 'my-var' is not nil
     ;; Check if there are no matches : EVIL MODE
     ((null prefix-match)
      ("Evil Mode"))

     ;; Check if prefix is from major list
     ((member prefix-match major-leader-list)

      (message "Prefix in Major Leader List")

      )

     ;; Check is prefix is from help list
     ((member prefix-match help-leader-list)

      (message "Prefix in Help Leader List")

      )

     ;; Second clause (the "if nil, do something"): check if 'my-var' is nil
     ((member prefix-match global-leader-list)

      (message "Prefix in Global Leader List")

      )
     ;; A 't' condition acts as a default 'else'
     (t
      (message "There was a match but somehow it wasn't in the prefix list")))







    ) ;; run let here



  ;; PREFIX-TYPE is \"Major\", \"Help\", \"Global\", or \"Evil\"


















  (if (keybind-starts-with-space) ; if keybind-string-entered matches
      if-not-keybind-starts-with-space-m-or-M-RET
    then-form ; then-form
    else-forms...) ; else-forms...)

  ;; returns true if prefix string starts with prefix, nil if not
  (string-prefix-p PREFIX STRING &optional IGNORECASE)

  )


;; The new entry will be inserted here, as a sibling headline or as a child depending on the template type and properties

(defun testlet ()

  (let*
      ((prefix-strings (list "test1" "test2" "string" "string") )
       (my-string "SPC h SPC")
       ;;-----Global Binding Conventions:---------------------------------------
       ;; 2. C-x    - Emacs     - Essential Commands
       (emacs-essentials-leader "C-x")
       ;; 3. C-h    - Emacs     - Help Commands
       (emacs-help-global-leader "C-h")
       ;; 4. SPC h  - Spacemacs - Help Commands
       (spacemacs-help-global-leader "SPC h")
       ;; 5. SPC u  - Spacemacs - Universal Argument Commands
       (universal-arg-leader "SPC u")
       ;; 1. SPC !m - Spacemacs - All Global Commands
       (spacemacs-global-leader "SPC")

       (help-leader-list (list
                          emacs-help-global-leader
                          spacemacs-help-global-leader
                          ) )
       ;; Set them all to globals
       (global-leader-list (list
                            emacs-essentials-leader
                            emacs-help-global-leader
                            spacemacs-help-global-leader
                            universal-arg-leader
                            ) )
       (prefix-strings (list "test1" "test2" "string" "string") )
       ;;-----Major Mode Binding Conventions-------------------------------
       ;; 1. 'SPC m'      - Spacemacs
       (spacemacs-major-prefix-space "SPC m")
       ;; 2. ','          - Spacemacs
       (spacemacs-major-prefix-comma ",")
       ;; 3. 'M-RET'      - Spacemacs
       (spacemacs-major-prefix-mret "M-RET")
       ;; 4. 'C-c [0-9]'  - Emacs
       ;; forget it...jk that was suprisingly easy
       (emacs-major-prefix-C-c-nums (list "C-c 0" "C-c 1" "C-c 2" "C-c 3" "C-c 4" "C-c 5" "C-c 6" "C-c 7" "C-c 8" "C-c 9" ))
       ;; 5. 'C-c C-<any> - Emacs
       (emacs-major-prefix-C-c-C-any "C-c C-")

       (major-leader-list (
                           append ; appends one list to another
                           (list
                            spacemacs-major-prefix-space
                            spacemacs-major-prefix-comma
                            spacemacs-major-prefix-mret
                            emacs-major-prefix-C-c-C-any
                            )
                           emacs-major-prefix-C-c-nums
                           )
                          )

       ;; RETURN matching prefix string.
       (debug)
       (prefix-match
        (seq-find
         (lambda (prefix)
           (string-prefix-p prefix my-string))
         (append major-leader-list help-leader-list global-leader-list)
         )
        )
       ) ;; end variable definitions
    (format
     "
prefix-strings:     %s
major-leader-list:  %s
help-leader-list:   %s
global-leader-list: %s
"
     prefix-strings
     major-leader-list
     help-leader-list
     global-leader-list
     ;; (print major-leader-list)
     )

    ;; (get-matching-prefix keybind-string-entered )
    ;; (print "Major Leader List:")
    ;; (print major-leader-list)
    ;; (print "Global Leader List:")
    ;; (print global-leader-list)
    (debug)

    ;; 'SPC u , e e' to Debug?

    (cond
     ;; First clause: check if the variable 'my-var' is not nil
     ;; Check if there are no matches : EVIL MODE
     ((null prefix-match)
      ("Evil Mode"))

     ;; Check if prefix is from major list
     ((member prefix-match major-leader-list)

      (message "Prefix in Major Leader List")
      (list prefix-match "Major Mode")
      )

     ;; Check is prefix is from help list
     ((member prefix-match help-leader-list)

      (message "Prefix in Help Leader List")

      )

     ;; Second clause (the "if nil, do something"): check if 'my-var' is nil
     ((member prefix-match global-leader-list)

      (message "Prefix in Global Leader List")

      )
     ;; A 't' condition acts as a default 'else'
     (t
      (message "There was a match but somehow it wasn't in the prefix list")))
    ) ;; run let here
  )


(defun get-matching-prefix (string prefix-list)
  "Return the first prefix from the list PREFIX-LIST that STRING starts with.
Return nil if no prefix matches."
  (catch 'matched
    (dolist (prefix prefix-list)
      (when (string-prefix-p prefix string)
        (throw 'matched prefix)))
    nil)
  )

(defun testthis ()
  "Test function for string prefix matching. Delete Later"
  ;; '("SPC m" "," "M-RET") ; This is a list of strings
  (setq prefix-strings '("SPC m" "," "C-c" "M-RET"))
  (setq keybind-string-entered-test "SPC c") ;; replace with big func arg
  (get-matching-prefix keybind-string-entered-test prefix-strings)

  ;; overcomplicated stuff
  ;; (string-prefix-p "SPC m" keybind-string-entered-test)
  ;; (seq-find (lambda (prefix) (string-prefix-p prefix keybind-string-entered-test)) 'prefix-strings)
  ;; (mapcar #'string-prefix-p )
  )

(defun get-matching-key-prefix (prefix-string-list keybinding-string-entered)
  "Returns the first prefix from `prefix-string-list' that matches the entered keybindings. Returns nil if none match. Redundant. Delete Later"
  (get-matching-prefix keybind-string-entered prefix-string-list)
  )


(defun delete-this-TODO ()

  ;; seq-find returns actual sucessful result
  ;; seq-find returns the result of the predicate
  (seq-some pred sequence)

  (seq-some (lambda (x) (> x 2)) [1 2 3 4 5]) ;; Returns 3 (the first element > 2)

  (seq-some (lambda (x) (< x 0)) [1 2 3]) ;; Returns nil (no element is negative)

  ;; find first match
  (seq-find (lambda (prefix) (and (string-prefix-p prefix keybind-string-entered) prefix)) '(0 2 3)) ;; Returns "found" (first non-nil result)
  (defun testthis ()

    (let (prefix-strings ("SPC m" "," "M-RET")))
    (let keybind-string-entered-test "SPC m e c") ;; replace with big func arg
    (seq-find (lambda (prefix) (string-prefix-p prefix keybind-string-entered-test) prefix-strings))
    )
  (testthis)
  ;; (seq-some (lambda (prefix) (and (string-prefix-p prefix keybind-string-entered) prefix)) '(0 2 3)) ;; Returns "found" (first non-nil result)
  )

;; a 2
(defun my/org-capture-get-desc ()
  (message "entering (my/org-capture-get-desc)")
  (let*
      (verbal-description (read-string "What the binding does: "))
    (format "%s" verbal-description)
    )
  )

;; a finish
(defun my/my-org-capture-finisher ()
  "Prompt for text and replace content between START_TOKEN and END_TOKEN."
  (message "entering (my/my-org-capture-finisher)")
  (save-excursion
    (goto-char (point-min))
    ;; The regex looks for: START_TOKEN + anything (minimal) + END_TOKEN
    (while (re-search-forward "START_TOKEN\\(.*?\\)END_TOKEN" nil t)
      (let* ((old-content (match-string 1)) ;; Optional: grabs the text currently there
             (new-text (read-string (format "Replace '%s' with: " old-content))))
        (replace-match new-text t t nil 1))))

  )


(defun my/rawr ()
  "get key sequence before doing anything else"
  ;; get key first
  (let* (key-desc (key-description (read-key-sequence "Press key sequence: ")))
    (format "* ~%s~ | " key-desc))
  )


;; Find and replace from before
;; if starts with <SPC> and !<SPC m> -> global command
;; if starts with <,> OR <M-RET> OR <SPC m> -> major mode command

(defun my/org-capture-get-original-major-mode ()
  "Return the symbol name of the major mode of the buffer
from which org-capture was called."
  (let* ((buffer (org-capture-get :original-buffer))
         (major-mode-symbol (with-current-buffer buffer major-mode)))
    (symbol-name major-mode-symbol)))

(defun my/get-function-info (command)
  "Retrieve and display information about a function by its name (a symbol)."
  (interactive "SFunction name: ") ; Makes the function interactive, prompting for a symbol
  (let* ((func (symbol-function command))
         (doc-string (documentation command))
         (arity-info (func-arity command)))
    (format "Captured in Mode: %s\n" my/org-capture-get-original-major-mode)
    (format "Information for %s:\n" command)
    (format "  Type: %s\n" (type-of func))
    (format "  Arity: %S\n" arity-info)
    (format "  Documentation:\n%s\n" doc-string)
    ;; You can add more checks, e.g., to find the source file location
    (message (format "Captured in Mode: %s\n\nInformation for %s:\n  Type: %s\n  Arity: %S\n  Documentation:\n%s\n" my/org-capture-get-original-major-mode command (type-of func) arity-info doc-string))))

;; Make insert line above and below macro

(defun my/enable-keyfreq-settings ()
  (require 'keyfreq)
  (keyfreq-mode 1)
  (keyfreq-autosave-mode 1)
  )

(defun my/custom-which-key-text()
  (my/custom-which-key-prefix-text)
  )

(defun my/custom-which-key-prefix-text()
  (my/custom-which-key-mode-specific-prefix-text)
  (spacemacs/declare-prefix "o" "My Tools")
  )

(defun my/custom-which-key-mode-specific-prefix-text()
  (spacemacs/declare-prefix-for-mode 'org-mode "m b" "Babel Actions")
  )


(defun my/set-keybindings-master-func ()
  (my/set-major-mode-keybindings)
  (my/set-global-keybindings)
  )

(defun my/set-major-mode-keybindings ()
  ;; Set Customize GUI button "Apply & Save" to <SPC m s> (From C-x C-s)
  (spacemacs/set-leader-keys-for-major-mode 'Custom-mode "a" 'Custom-save)

  ;; Eval Elisp without moving all the way down to the function call
  ;; ~, m~ for current file (using lowercase marks)
  ;; ~, .~ for across files (Using capital mark)
  (spacemacs/set-leader-keys-for-major-mode 'emacs-lisp-mode "m" 'eval-current-form-sp-at-mark-m)
  (spacemacs/set-leader-keys-for-major-mode 'emacs-lisp-mode "." 'eval-current-form-across-files)

  ;; TODO Re-evaluate function that current symbol calls.
  ;; ~m Y , g g j , e f ` Y~
  )

(defun my/set-global-keybindings ()
  ;; Set Tab Left & Right to <SPC T h> (left) and <SPC T l> (right)
  (spacemacs/set-leader-keys "Th" 'tab-bar-switch-to-prev-tab)
  (spacemacs/set-leader-keys "Tl" 'tab-bar-switch-to-next-tab)

  ;; Set previous buffer to h & j, set next buffer to
  (spacemacs/set-leader-keys "bh" 'previous-buffer)
  (spacemacs/set-leader-keys "bk" 'previous-buffer)
  (spacemacs/set-leader-keys "bl" 'next-buffer)
  (spacemacs/set-leader-keys "bj" 'next-buffer)

  ;; I don't remember what this does exactly. It was in user-config
  ;; Might want to insert  "my/"  at the beginning of this.
  (spacemacs/set-leader-keys "of" 'my-org-function-description-insert)

  ;; Set Keybinding Recorder
  (spacemacs/set-leader-keys "oo" 'my/document-keybinding)

  )

(defun my/convert-clipboard-html-to-org-mac ()
  "Import HTML from clipboard as org syntax on macOS."
  (interactive)
  (let* ((html (shell-command-to-string "osascript -e 'the clipboard as \"HTML\"' | perl -ne 'print chr foreach unpack(\"C*\",pack(\"H*\",substr($_,11,-3)))\'")))
    (insert (shell-command-to-string (format "echo %s | pandoc -f html -t org" (shell-quote-argument html))))))

(defun my/convert-clipboard-html-to-org-mac ()
  "Paste HTML from clipboard as Org-mode formatted text.
   Requires 'pandoc' to be installed."
  (interactive)
  (let* ((script "osascript -e 'get the clipboard as «class HTML»' | perl -ne 'print chr foreach unpack(\"C*\",pack(\"H*\",substr($_,11,-3)))'")
         (html (shell-command-to-string script)))
    (if (string-match-p "execution error" html)
        (progn
          (message "No HTML in clipboard; performing standard yank.")
          (yank))
      (insert (shell-command-to-string
               (format "echo %s | pandoc -f html -t org"
                       (shell-quote-argument html)))))))

;; Commented out when not using Consult
;; (defun my-consult-no-preview-help (orig-fun &rest args)
;;   "Disable preview for *Help* buffers in consult."
;;   (let* ((buffer (cadr args))
;;          (buffer-name (if (bufferp buffer) (buffer-name buffer) "")))
;;     (if (string-match-p "^\\*Help\\*$" buffer-name)
;;         (apply orig-fun (car args) nil (cddr args)) ; Call with no-preview (nil)
;;       (apply orig-fun args)))) ; Normal preview


(defun my/my-org-function-description-insert (function-name)
  "Insert the documentation for FUNCTION-NAME into the current buffer
  within an Org mode source block."
  (interactive "sEnter function name: ")
  (let* ((help-buffer (generate-new-buffer "*Help*"))
         (doc-string (documentation-property (intern function-name) 'function-documentation)))
    (if doc-string
        (with-current-buffer help-buffer
          (insert "#+BEGIN_SRC text\n")
          (insert doc-string)
          (insert "\n#+END_SRC\n")
          (insert-buffer-contents help-buffer (current-buffer))
          (kill-buffer help-buffer))
      (message "No documentation found for %s" function-name))))

;; Supposed to fix autoevilfication warning messages, but doesn't work.
(defun my/disable-autoevilfication-fail-messages()
  ;; remove startup auto-evilification messages:
  ;; Auto-evilification could not remap these functions in map ‘org-agenda-mode-map’:
  ;; - ‘org-agenda-next-line’ originally mapped on ‘C-n’
  ;; Auto-evilification could not remap these functions in map ‘org-agenda-mode-map’:
  ;; - ‘org-agenda-toggle-time-grid’ originally mapped on ‘G’
  ;; Auto-evilification could not remap these functions in map ‘org-agenda-mode-map’:
  ;; - ‘org-agenda-filter-remove-all’ originally mapped on ‘|’
  ;; Auto-evilification could not remap these functions in map ‘org-agenda-mode-map’:
  ;; - ‘org-agenda-filter-by-tag’ originally mapped on ‘\’
  ;; `org-agenda-next-line' and `org-agenda-toggle-time-grid' are already evilified to other non-conflicting keys.
  ;; `org-agenda-filter-remove-all' and `org-agenda-filter-by-tag' - we will evilify manually, along with other filter-by functions:
  (with-eval-after-load 'archive
    (dolist (key '("G")) (define-key archive-mode-map (kbd key) nil))
    (evil-define-key 'evilified archive-mode-map (kbd "xxxx") #'archive-chgrp-entry)
    )

  (with-eval-after-load 'tar
    (dolist (key '("G")) (define-key tar-mode-map (kbd key) nil))
    (evil-define-key 'evilified tar-mode-map (kbd "xxxxxx") #'tar-chgrp-entry))
  )


(defun eval-current-form-sp-at-mark-m ()
  "Does `, e c' at mark `m', moves back afterwards"
  ;; goto mark m
  (interactive)
  ;; set marker y to current position
  (evil-set-marker ?y (point))

  ;; move to marker m
  (evil-goto-mark ?m)
  ;; run eval-current-form-sp

  (spacemacs/eval-current-form-sp)
  ;; It is bound to M-<return> e c and M-m m e c, and many ordinary text characters.
  ;; (spacemacs/eval-current-form-sp &optional ARG)
  ;; Call ‘eval-last-sexp’ after moving out of one level of
  ;; parentheses. Will exit any strings and/or comments first.
  ;; An optional ARG can be used which is passed to ‘sp-up-sexp’ to move out of more
  ;; than one sexp.
  ;; Requires smartparens because all movement is done using ‘sp-up-sexp’.
  ;; jump back with C-o

  ;; Go back to mark y
  (evil-goto-mark ?y)
  ;; (evil-jump-backward) ; This doesn't work because moving to a mark doesn't
  ;; add old position to jump list
  )


(defun eval-current-form-across-files ()
  "Uses Global Markers Y and M, but is otherwise identical to `eval-current-form-sp-at-mark-m'"
  (interactive)
  ;; set marker Y to current position
  (evil-set-marker ?Y (point))

  ;; move to marker M
  (evil-goto-mark ?M)
  (spacemacs/eval-current-form-sp)

  ;; Go back to mark Y
  (evil-goto-mark ?Y)
  )

;; Still usable
(defun my/get-oct-keybind-org-file ()
  "Return path of org capture template keybind file."
  "~/.emacs.d/mytesting/my-capture-tests.org"
  )

;;unused - group 2
(defun my-ai-OCT-2 ()
  "Main function that defines the keybinding capture template =[k]: Keybinding=."
  (let* (my-org-cap-template-filepath ("~/.emacs.d/mytesting/my-capture-tests.org"))
    (add-to-list 'org-capture-templates
                 '("k" "Keybinding" entry (file 'my-org-cap-template-filepath)
                   "* `%^{Keybinding}`: %^{Description}
:PROPERTIES:
:CREATED: %U
:END:
%?"
                   :empty-lines 1))
    ;; Add refile hook
    (add-hook 'org-capture-prepare-finalize-hook #'my/org-capture-place-by-description)
    )
  )

;; unused - group 2
(defun my/org-capture-place-by-description ()
  "Programmatically determine the location based on the information captured.
Find a headline in the target file that matches the captured description."
  (when (string= (org-capture-get :key) "k")
    (save-excursion
      (goto-char (point-min))
      ;; Extract the description from the first line: * `key`: Description
      (when (re-search-forward ": \\(.*\\)$" (line-end-position) t)
        (let* ((desc (match-string 1))
               (target-file (my/get-oct-keybind-org-file))
               (pos (org-find-exact-headline-in-buffer desc (find-file-noselect target-file))))
          ;; If the headline exists, move the capture there
          (if pos
              (org-capture-put :target (list 'file+headline target-file desc))
            (message "No matching headline for '%s', using default." desc)))))))

;;
(defun find-package-from-function (function-name)
  "Find the package name that FUNCTION-NAME belongs to.
   Returns nil if the package cannot be determined.

Ex: (find-package-from-function 'helm-descbinds) returns \"helm\"
"
  (let* ((file-path (symbol-file function-name))
         (elpa-dir (file-name-as-directory package-user-dir)))
    (when (and file-path (string-prefix-p elpa-dir file-path))
      ;; Path is within the ELPA directory, extract package name
      (let* ((relative-path (file-relative-name file-path elpa-dir))
             (package-version-dir (car (split-string relative-path "/"))))
        ;; Package directory is typically "package-name-version"
        (car (split-string package-version-dir "-"))))))


;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
  (custom-set-variables
   ;; custom-set-variables was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   '(consult-preview-excluded-files '("\\`/[^/|:]+:" "\\.gpg\\'" "\\*Help\\*"))
   '(consult-preview-key '("M-." "C-SPC" :debounce 0.2 "<up>" "<down>"))
   '(custom-safe-themes
     '("01f347a923dd21661412d4c5a7c7655bf17fb311b57ddbdbd6fce87bd7e58de6"
       "9af2b1c0728d278281d87dc91ead7f5d9f2287b1ed66ec8941e97ab7a6ab73c0"
       "832a3471e6e56c42ae430771a14c65b0006412bb8a0eb94fcc4a604587e20b80" default))
   '(doc-view-continuous t)
   '(keycast-mode-line-insert-after "%e")
   '(keycast-mode-line-mode nil)
   '(keycast-tab-bar-mode t)
   '(mac-drawing-use-gcd t)
   '(nil nil t)
   '(ns-alternate-modifier 'meta)
   '(ns-command-modifier nil)
   '(org-capture-templates
     '(("t" "Todo" entry
        (file+headline "~/.emacs.d/mytesting/my-capture-tests.org" "Tests")
        #'my/make-format-string)
       ("a" "Test Customize Gui Menu" entry
        (file+olp "~/.emacs.d/mytesting/my-capture-tests.org" "GUI"
                  "Capture Template 1")
        "\12%(my/org-capture-key-info-shortcut)\12\12*** Extra Info:\12Date Captured: %U File Captured in: [[file:%F][%f]]\12"
        :empty-lines-after 1 :before-finalize (my/my-org-capture-finisher))))
   '(org-export-backends '(ascii html icalendar latex md odt))
   '(package-selected-packages
     '(a ace-link add-node-modules-path afternoon-theme aggressive-indent
         alect-themes alert all-the-icons ample-theme ample-zen-theme
         anti-zenburn-theme apropospriate-theme auto-compile auto-highlight-symbol
         auto-yasnippet autothemer avy-jump-helm-line badwolf-theme
         birds-of-paradise-plus-theme bubbleberry-theme bui bundler busybee-theme
         centaur-tabs centered-cursor-mode cherry-blossom-theme chocolate-theme
         chruby clean-aindent-mode closql clues-theme code-review
         color-theme-sanityinc-solarized color-theme-sanityinc-tomorrow
         column-enforce-mode command-log-mode company company-quickhelp
         company-statistics company-web compleseus-spacemacs-help consult
         consult-yasnippet counsel counsel-css cyberpunk-theme dakrone-theme
         dap-mode darkmine-theme darkokai-theme darktooth-theme deferred
         define-word devdocs diminish dired-quick-sort disable-mouse django-theme
         doom-modeline doom-themes dotenv-mode dracula-theme drag-stuff dumb-jump
         eat edit-indirect ef-themes elisp-def elisp-demos elisp-slime-nav emacsql
         embark embark-consult emmet-mode emojify emr enh-ruby-mode esh-help
         eshell-prompt-extras eshell-z espresso-theme eval-sexp-fu evil-anzu
         evil-args evil-cleverparens evil-collection evil-easymotion evil-escape
         evil-evilified-state evil-exchange evil-goggles evil-iedit-state
         evil-indent-plus evil-lion evil-lisp-state evil-matchit evil-mc
         evil-nerd-commenter evil-numbers evil-org evil-surround evil-textobj-line
         evil-tutor evil-unimpaired evil-visual-mark-mode evil-visualstar
         exotica-theme expand-region eyebrowse eziam-themes fancy-battery
         farmhouse-themes flatland-theme flatui-theme flycheck flycheck-elsa
         flycheck-package flycheck-pos-tip flyspell-correct flyspell-correct-helm
         flyspell-correct-popup forge gandalf-theme ggtags gh-md ghub git-link
         git-messenger git-modes git-timemachine gitignore-templates gntp gnuplot
         golden-ratio google-translate gotham-theme grandshell-theme
         groovy-imports groovy-mode gruber-darker-theme gruvbox-theme haml-mode
         hc-zenburn-theme helm-ag helm-c-yasnippet helm-comint helm-company
         helm-css-scss helm-descbinds helm-ls-git helm-lsp helm-make
         helm-mode-manager helm-org helm-org-rifle helm-projectile helm-purpose
         helm-swoop helm-xref hemisu-theme heroku-theme hide-comnt
         highlight-indentation highlight-numbers highlight-parentheses hl-todo
         holy-mode htmlize hungry-delete hybrid-mode impatient-mode indent-guide
         inf-ruby info+ inkpot-theme inspector ir-black-theme ivy jazz-theme
         jbeans-theme kaolin-themes key-chord keycast keyfreq launchctl
         light-soap-theme link-hint llama log4e lorem-ipsum lsp-docker lsp-java
         lsp-mode lsp-origami lsp-treemacs lsp-ui lush-theme macrostep
         madhat2r-theme magit magit-section marginalia markdown-mode markdown-toc
         material-theme maven-test-mode memoize minimal-theme minitest
         modus-themes moe-theme molokai-theme monochrome-theme monokai-theme
         multi-line multi-term multi-vterm mustang-theme mvn nameless
         naquadah-theme nerd-icons noctilux-theme obsidian-theme occidental-theme
         oldlace-theme omtose-phellack-themes open-junk-file orderless org
         org-category-capture org-cliplink org-contrib org-download org-mime
         org-pomodoro org-present org-project-capture org-projectile org-rich-yank
         org-superstar organic-green-theme orgit orgit-forge origami osx-clipboard
         osx-dictionary osx-trash overseer ox-pandoc package-lint page-break-lines
         pandoc-mode paradox password-generator pcache pcre2el
         phoenix-dark-mono-theme phoenix-dark-pink-theme planet-theme popwin
         pos-tip prettier-js professional-theme pug-mode purple-haze-theme
         quickrun railscasts-theme rainbow-delimiters rake rbenv rebecca-theme
         request restart-emacs reveal-in-osx-finder reverse-theme robe rspec-mode
         rubocop rubocopfmt ruby-hash-syntax ruby-refactor ruby-test-mode
         ruby-tools rvm sass-mode scss-mode seti-theme shell-pop shrink-path
         slim-mode smeargle smyx-theme soft-charcoal-theme soft-morning-theme
         soft-stone-theme solarized-theme soothe-theme space-doc spacegray-theme
         spaceline spaceline-all-the-icons spacemacs-purpose-popwin
         spacemacs-whitespace-cleanup string-edit-at-point string-inflection
         subatomic-theme subatomic256-theme sublime-themes sunny-day-theme swiper
         symbol-overlay symon tagedit tango-2-theme tango-plus-theme
         tangotango-theme tao-theme term-cursor terminal-here toc-org toxi-theme
         transient treemacs-evil treemacs-icons-dired treemacs-magit
         treemacs-persp treemacs-projectile treepy twilight-anti-bright-theme
         twilight-bright-theme twilight-theme ujelly-theme underwater-theme
         undo-fu-session unkillable-scratch uuidgen vertico vi-tilde-fringe
         volatile-highlights vterm vundo web-beautify web-completion-data web-mode
         wgrep which-key-posframe white-sand-theme winum with-editor
         writeroom-mode ws-butler yaml yaml-mode yasnippet zen-and-art-theme
         zenburn-theme zonokai-emacs))
   '(spaceline-all-the-icons-highlight-file-name nil)
   '(spaceline-all-the-icons-separator-type 'wave))
  (custom-set-faces
   ;; custom-set-faces was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   '(completions-annotations ((t (:foreground "MediumPurple2" :slant normal))))
   '(keycast-key ((t (:inherit fixed-pitch :foreground "orchid1" :weight bold)))))
  )
