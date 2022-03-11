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
- search engine
- [x] disable html cache when devtools open

### macos changes

https://github.com/kevinSuttle/macOS-Defaults/compare/master...suttle?diff=split
https://gist.github.com/vraravam/5e28ca1720c9dddacdc0e6db61e093fe

- spacevim install
- turn off automatic rearrangement of spaces
- [ ] turn on ctrl-num shortcuts to switch to space
- arrange display s
- move dock to top monitor (left or right)
- more space on display (high res)
- keyboard
  - [x] swap command and option on usb keyboard
- edit notifiation widgets
- two fingerprints

#### Notifications

- allow notifications from all installed apps
- Notification grouping: off
- allow notifications when mirroring (if we're not using extended display)

#### zoom

https://support.zoom.us/hc/en-us/articles/115001799006-Mass-deploying-with-preconfigured-settings-for-macOS

- [x] log in
- [x] open links with
- [ ] always show meeting controls
- [x] blur background

#### teams

- use OS notifications

#### Amethyst

- [x] start at login
- [ ] ignore finder (because of time machine)
- [x] auto-update (SUEnableAutomaticChecks)
- [ ] enable more layouts

#### TODO

- [ ] attend to brew doctor
