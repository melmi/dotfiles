ubuntu = $(findstring Ubuntu,$(shell uname -a))

all:
	@echo "Making soft links."
	@ln -sf $(CURDIR)/bash_aliases ~/.bash_aliases
	@ln -sf $(CURDIR)/zshrc ~/.zshrc
	@ln -sf $(CURDIR)/gitconfig ~/.gitconfig
	@echo "Installing required packages"
	@sudo apt-get -qq install zsh git fzf bat
	@sudo chsh -s /bin/zsh
	@[ -e ~/.antigen ] || git clone -q https://github.com/zsh-users/antigen.git ~/.antigen
	@echo "Done."
