# Dotfiles

Install dotfiles, casks and packages.

## Things to do first

### install homebrew

This package leverages homebrew under the hood so you'll need to install it.
https://brew.sh/index_fr

## Install

```
ruby bin/install
```

## Things to do after

### Install ZSH

https://ohmyz.sh/

```
# Load the dotfiles zshr extension
echo 'source ~/.dotfilesrc' >> ~/.zshrc
```

### Configure git

```
git config --global core.excludesfile ~/.gitignore_global
git config --global user.name "paulhenri-l"
git config --global user.email "25308170+paulhenri-l@users.noreply.github.com"
git config --global user.signingkey 05D830EB702FB9ED
git config --global commit.gpgsign true
```

### Configure ssh

You may have ssh config and keys that you want to add in the ~/.ssh directory.

### Add php packages

```
composer global require laravel/installer laravel/valet phploc/phploc\
                        phpmetrics/phpmetrics phpunit/phpunit\
                        friendsofphp/php-cs-fixer
```

### Extra commands

```
# Allow key repeat
defaults write com.jetbrains.PhpStorm ApplePressAndHoldEnabled -bool false
```
