# vimfiles

Personal faved vim settings for gophers,crustaceans by My Tastes.
Current testing Environment: macOS sierra

Update: 2017-12-31

## Installing

### Manual way

Clone this repo:

    $ git clone https://github.com/dxiao/vimfiles.git ~/.vim
    $ rm ~/.vimrc && ln -s ~/.vim/vimrc ~/.vimrc

Install [Vundle](https://github.com/VundleVim/Vundle.vim.git):

    $ git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

Open up Vim, and issue this command:

    :BundleInstall

Now compile the vimproc extension:

    cd ~/.vim/bundle/vimproc.vim && make

TA-DA! Everything's done!

## Custom mappings

* The leader key is `,` (comma).

## Plug-ins

* christoomey/vim-tmux-navigator
    You must install tmux before, (vimux,vroom) vim-plugins need it.
* Yggdroot/indentLine
* fatih/vim-go
* rust-lang/rust.vim
