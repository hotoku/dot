sudo apt install -y tmux git emacs

cd ~
PROJECTS=projects
mkdir ${PROJECTS}
git clone https://github.com/hotoku/dot ${PROJECTS}/dot
ln -s ${PROJECTS}/dot/gitconfig ~/.gitconfig
ln -s ${PROJECTS}/dot/tmux.basic.conf ~/.tmux.conf
ln -s ${PROJECTS}/dot/bash_profile.bash ~/.bash_profile

cd ${PROJECTS}/dot
git submodule init
git submodule update
