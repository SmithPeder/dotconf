all: brew neovim zsh kitty

brew:
	brew bundle

neovim:
	ln -v -F -s ~/dotfiles/neovim/ ~/nvim
	ln -v -F -s ~/dotfiles/neovim/ ~/.config/nvim

zsh:
	ln -v -F -s ~/dotfiles/zsh/.zshrc ~/.zshrc

kitty:
	ln -F -s ~/dotfiles/kitty ~/.config/kitty
