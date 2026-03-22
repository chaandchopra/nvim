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


