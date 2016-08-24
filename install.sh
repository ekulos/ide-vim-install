#!/bin/bash

install_vim() {
    dependencies=(
        git
        vim
        cmake
        python-devel
        python-pip
        python-setuptools
        python-pep8
        python2-flake8
        python-autopep8
        pylint
        pyflakes
        ctags
        xdg-utils
        npm
        silversearcher-ag
    )

    repositories=(
        MarcWeber/vim-addon-mw-utils
        tomtom/tlib_vim
        garbas/vim-snipmate
        honza/vim-snippets
        nvie/vim-flake8
        vim-scripts/indentpython.vim
        tmhedberg/SimpylFold
        majutsushi/tagbar
        klen/python-mode
        Valloric/YouCompleteMe
        bling/vim-airline
        tpope/vim-fugitive
        scrooloose/nerdtree
        jistr/vim-nerdtree-tabs
        scrooloose/syntastic
        ntpeters/vim-better-whitespace
        sjl/gundo.vim
        mattn/emmet-vim
        Raimondi/delimitMate
        szw/vim-maximizer
        godlygeek/tabular
        SirVer/ultisnips
        suan/vim-instant-markdown
        kien/ctrlp.vim
        rking/ag.vim
        rhysd/vim-grammarous
        airblade/vim-gitgutter
        dkprice/vim-easygrep
        nelstrom/vim-qargs
        junegunn/vim-easy-align
        terryma/vim-multiple-cursors
    )

    # Backup
    mv ~/.vimrc{,.old.$(date +%s)}
    mv ~/.vim{,.old.$(date +%s)}

    # Install packages
    sudo dnf install -y ${dependencies[@]}

    # Plugin manager bootstrap
    mkdir -p ~/.vim/{autoload,bundle,colors,scripts}
    wget -P ~/.vim/autoload "https://tpo.pe/pathogen.vim"
    wget -P ~/.vim/colors "https://raw.githubusercontent.com/xlucas/go-vim-install/master/molokai.vim"

    # Clone necessary stuff
    for repository in ${repositories[@]} ; do
        git clone "https://github.com/${repository}.git" ~/.vim/bundle/${repository#[^/]*/}
    done

    # Closetag script and snippets
    curl -sL -o ~/.vim/scripts/closetag.vim "http://vim.sourceforge.net/scripts/download_script.php?src_id=4318"

    # YCM compilation
    cd ~/.vim/bundle/YouCompleteMe && {
        git submodule update --init --recursive
        bash install.sh
    } && cd -

    # Powerline
    pip install --user powerline-status

    # Fonts
    mkdir -p ~/.{fonts,config/fontconfig/conf.d}
    wget -L -O - "https://raw.github.com/cstrap/monaco-font/master/install-font-ubuntu.sh" | bash
    wget -P ~/.fonts "https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf"
    wget -P ~/.config/fontconfig/conf.d "https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf"
    fc-cache -vf ~/.fonts

    # Instant markdown
    sudo npm -g install instant-markdown-d

    # Vimrc
    wget -P ~ "https://raw.githubusercontent.com/ekulos/ide-vim-install/master/.vimrc"

    # Path
    echo "export PATH=\$PATH:$(readlink -f ~/.local/bin)" >> ~/.profile
    exit 0
}


# Main
install_vim $2;
exit 1
