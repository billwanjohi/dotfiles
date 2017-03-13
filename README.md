# dotfiles

This is a homesick castle.
You can pull and symlink using that ruby gem,
or just do so manually.

This is now geared exclusively to OSX.

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

## Update

```bash
cd $(homesick show_path)
git pull
git submodule foreach git pull origin master
homesick rc
```

## TODO
*   add source highlight for LESS
*   other mac tweaks
    *   show scroll bars: always
    *   tab through windows
    *   side swipe doesn't move back
    *   turn on filevault

