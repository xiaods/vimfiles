# vimfiles

These are optimized Fedora edition,derive from new Codegram vimfiles!

## Installing

### Manual way

Clone this repo:

    $ git clone https://github.com/dxiao/vimfiles.git ~/.vim
    $ rm ~/.vimrc && ln -s ~/.vim/vimrc ~/.vimrc

Install [Vundle](https://github.com/gmarik/vundle):

    $ git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

Set up your `~/vimrc.local` with your custom plugins, themes, for example:

    " Color theme
    Bundle 'sjl/badwolf'
    colorscheme badwolf

Open up Vim, and issue this command:

    :BundleInstall

TA-DA! Everything's done!

### Notice

You must install Inconsolata to have powerline theme work correctly out of the box.
