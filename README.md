# Dotfiles

```
bundle install

ruby bin/dotfiles full
ruby bin/dotfiles homebrew
ruby bin/dotfiles vim
```

## Things you might want to do

### Install ZSH
```
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo 'source ~/.dotfilesrc' >> ~/.zshrc
```

### Install Ruby
```
rbenv install 2.4.2
rbenv global 2.4.2
rbenv rehash
gem install rails neovim
```

### Install php packages
```
composer global require laravel/installer laravel/valet phploc/phploc phpmetrics/phpmetrics phpmd/phpmd phpunit/phpunit squizlabs/php_codesniffer laravel/lumen-installer friendsofphp/php-cs-fixer
```

### Run these commands
Allow key repeat

```defaults write com.jetbrains.PhpStorm ApplePressAndHoldEnabled -bool false```

Set the global gitignore

```git config --global core.excludesfile ~/.gitignore_global```
