Dotfiles
========

My lame dotfiles. If you're looking for good ideas, you should probably keep looking.


Installation
------------

The idea is that there's a hidden directory called `.dotfiles` in home directory. All files of these files are then symlinked from your home directory using the supplied Rake task. That way your entire home directory isn't a git working tree.

To install:

    git clone http://github.com/philoye/dotfiles.git ~/.dotfiles
    cd ~/.dotfiles
    rake install


LICENSE
------------

This software is licensed under the MIT license.