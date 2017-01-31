ubuntu = $(findstring Ubuntu,$(shell uname -a))

all:
	@echo "Making soft links."
	@ln -sf $(CURDIR)/bash_aliases ~/.bash_aliases
	@ln -sf $(CURDIR)/bashrc ~/.bashrc
	@ln -sf $(CURDIR)/zshrc ~/.zshrc
	@ln -sf $(CURDIR)/bash_aliases ~/.bash_aliases
	@ln -sf $(CURDIR)/vimrc ~/.vimrc
	@ln -sf $(CURDIR)/gitconfig ~/.gitconfig
	@[ -e ~/.vim ] || ln -sf $(CURDIR)/vim/ ~/.vim
	@echo "Installing required packages"
	@sudo apt-get -qq install zsh git clang-format cmake
	@sudo chsh -s /bin/zsh
	@[ -e ~/.antigen ] || git clone -q https://github.com/zsh-users/antigen.git ~/.antigen
	@[ -e ~/.vim/bundle/Vundle.vim ] || git clone -q https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	@echo "Installing vim plugins."
	@vim +PluginInstall +qall
	@[ -n $(ubuntu) ] && echo "Installing ycm" && cd ~/.vim/bundle/YouCompleteMe && ./install.py --clang-completer
	@echo "Done."
