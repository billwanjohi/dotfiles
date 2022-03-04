# dotfiles

This was a homesick castle, and is in the process of being shifted over to being managed via chezmoi.
You can pull and symlink using the homesick ruby gem and the chezmoi go package,
or just do so manually.

## Setup

1. [perform one-line binary install/init](https://www.chezmoi.io/install/#one-line-binary-install)

   ```bash
   sh -c "$(curl -fsLS chezmoi.io/get)" -- init --apply billwanjohi
   ```

## Manual steps

### all OSes

- gpg

### firefox

- sync settings from one account
- create new account, switch to that
- sync history
- change password on old account
- login to stackoverflow

### macos changes

https://github.com/kevinSuttle/macOS-Defaults/compare/master...suttle?diff=split

- spacevim install
- turn off automatic rearrangement of spaces
- turn on ctrl-num shortcuts to switch to space
- arrange display s
- move dock to top monitor (left or right)
- more space on display (high res)
- keyboard
  - swap command and option
- edit notifiation widgets
- two fingerprints

#### Notifications

- allow notifications from all installed apps
- Notification grouping: off
- allow notifications when mirroring (if we're not using extended display)

#### teams

- use OS notifications

#### Amethyst

- start at login
- ignore finder (because of time machine)
- auto-update
- enable more layouts
