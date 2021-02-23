# dotfiles

This is a homesick castle.
You can pull and symlink using that ruby gem,
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

## Update

```bash
cd $(homesick show_path)
git pull
git submodule foreach git pull origin master
homesick rc
```

## Configuration

### .homesick_subdir

Directories listed here should be supplemented but not replaced by castle contents

e.g. if there is one public and one secret config

https://github.com/technicalpickles/homesick#homesick_subdir

## Reasons

- installing postgresql-libs to allow `asdf install php`
