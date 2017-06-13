#!/bin/sh

echo "\n>>>>>>>>>> Your wish is my command master. One Mac with complete setup coming right up <<<<<<<<<<<"

# install homebrew if we dont have one
if test ! $(which brew); then

  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew update

fi

# Now install our bundle

echo "\n>>>>>>>>>> Installing all dependencies and Apps now. Please Sit back and relax master, this might take a while. <<<<<<<<<<<"

brew bundle install

# Next is Oh-My-ZSH

echo "\n>>>>>>>>>> Installing oh-my-zsh now <<<<<<<<<<<"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Add plugins to Oh-My-ZSH

echo "\n>>>>>>>>>> Adding plugins to it <<<<<<<<<<<"

sed -i -e 's/plugins=.*/plugins=(git xcode thefuck)/g' ~/.zshrc

# Link sublime
echo ">>>>>>>>>>> linking sublime-text for terminal use... <<<<<<<<<<<<\n"
ln -s “/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl” /usr/local/bin/s

echo ">>>>>>>>>>> Customizing your Dock!... <<<<<<<<<<<<\n"
# Configure Dock
dockutil --no-restart --remove all
dockutil --no-restart --add "/Applications/Mail.app"
dockutil --no-restart --add "/Applications/System Preferences.app"
dockutil --no-restart --add "/Applications/Utilities/iTerm.app"
dockutil --no-restart --add "/Applications/Xcode.app"
dockutil --no-restart --add "/Applications/SourceTree.app"
dockutil --no-restart --add "/Applications/Sublime Text 2.app"
dockutil --no-restart --add "/Applications/Google Chrome.app"
dockutil --no-restart --add "/Applications/Notes.app"

killall Dock

echo ">>>>>>>>>>> All done Master, enjoy your new setup - Genie <<<<<<<<<<<<\n"
