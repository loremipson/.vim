## Getting set up

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

## vim Packages

This configuration uses [pathogen](http://www.vim.org/scripts/script.php?script_id=2332), so it's a good idea to include any packages as git submodules. Make sure they're cloned to the `/bundle` directory.

ie:

    cd ~/.vim
	
	git submodule add git://github.com/path_to/plugin_url.git bundle/plugin_name --recursive
