all:
	#making soft links
	ln -sfr bash_aliases ~/.bash_aliases
	ln -sfr bashrc ~/.bashrc
	ln -sfr zshrc ~/.zshrc
	ln -sfr bash_aliases ~/.bash_aliases
	ln -sfr vimrc ~/.vimrc
	[ -e ~/.vim ] || ln -sfr vim/ ~/.vim
	ln -sfr gitconfig ~/.gitconfig
	#installing required packages
	sudo apt-get install zsh git clang-format
	sudo chsh -s /bin/zsh
	[ -e ~/.antigen ] || git clone https://github.com/zsh-users/antigen.git ~/.antigen
	[ -e ~/.vim/bundle/Vundle.vim ] || git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	vim +PluginInstall +qall
	echo "Done."
	echo "Try installing ycm by:"
	echo "cd ~/.vim/bundle/YouCompleteMe"
	echo "./install.py --clang-completer"
