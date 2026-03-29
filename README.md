### Quick Note 

Don't forget to install ripgrep for telescope grepstringto work 

`sudo apt install ripgrep`

You will need Nodejs fro Mason to work 


### tmux installation 

implement the tmux changes

git clone https://github.com/tmux-plugins/tmux-yank ~/.tmux/plugins/tmux-yank

sudo apt-get install xsel

tmux source-file .tmux.conf

### font choices 

unzip ./JetBrainsMono.zip /usr/local/share/font

### git setup 

ssh-keygen -t ed25519 -C "chaandchopra@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
ssh -T git@github.com
cat ~/.ssh/id_ed25519.pub
ssh -T git@github.com

### oh my zsh theme
mv ~/.oh-my-zsh/themes/robbyrussell.zsh-theme ~/.oh-my-zsh/themes/robbyrussell.zsh-theme.temp
ln -s ~/.config/nvim/robbyrussell.zsh-theme ~/.oh-my-zsh/themes/robbyrussell.zsh-theme


### To Consider

**High Impact**
- `gitsigns.nvim` — inline git blame, hunk navigation (`]c`/`[c`), stage/reset individual hunks
- Expand Treesitter languages — add `javascript`, `typescript`, `json`, `yaml`, `toml`, `html`, `css`, `bash`, `markdown`, `vimdoc`
- `flash.nvim` or `leap.nvim` — jump to any visible character in 2-3 keystrokes
- `trouble.nvim` — better diagnostics/quickfix list with persistent, filterable panel
- `nvim-ts-autotag` — auto-close and auto-rename HTML/JSX tags via treesitter

**Medium Impact**
- `telescope-fzf-native` — native C sorter for significantly faster fuzzy finding
- `telescope-ui-select` — replaces `vim.ui.select` with telescope for nicer code actions menu
- `which-key.nvim` — popup showing available keys after pressing leader
- Add more LSP servers — `ts_ls`, `bashls`, `jsonls`, `yamlls` (especially since prettier is already configured)
- `cmp-nvim-lsp-signature-help` — inline parameter hints while typing
- `todo-comments.nvim` — highlights TODO/FIXME/HACK and search them via telescope

**Quick Wins**
- `mini.surround` or `nvim-surround` — add/change/delete surrounding quotes, brackets, tags
- Fix `<C-j>` keybinding conflict (mapped to both "previous quickfix" and "escape from insert mode")
- Add `<leader>w` for quick save from normal mode
