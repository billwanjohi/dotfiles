# dotfiles

This was a homesick castle, and is in the process of being shifted over to being managed via chezmoi.
You can pull and symlink using the homesick ruby gem and the chezmoi go package,
or just do so manually.

## Installation

1.  Type Cmd-Space to reach spotlight
1.  Type "terminal" and hit Enter

1.  Run each of the following in your new terminal session

    ```bash
    sudo gem install homesick
    homesick clone billwanjohi/dotfiles  # Accept download of developer tools
    homesick symlink
    homesick rc
    ```

1.  edit ~/.config/git/user to include your details

