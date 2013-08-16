Make sure you're in your user directory:

`cd`

Now, clone this repository down to your user folder.

`git clone git@github.com:Implemint/.vim.git --recursive`

Note: Include the `--recursive` so that all the submodule dependencies clone down as well. Otherwise you'll need to run:

    cd ~/.vim
	git submodule update --init

Create symbolic links to the repository vimrc and gvimrc files.

    ln -s .vim/.vimrc .vimrc
	ln -s .vim/.gvimrc .gvimrc

You should be set now. Cowabunga!
