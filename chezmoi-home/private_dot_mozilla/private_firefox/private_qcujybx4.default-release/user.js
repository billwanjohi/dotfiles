// https://github.com/arkenfox/user.js/wiki/2.1-User.js

// TODO figure out how to merely _extend_ rather than _replace_ domains
const restrictedDomainArray = [
  // Defaults (as of 2023-01-01)
  "accounts-static.cdn.mozilla.net",
  "accounts.firefox.com",
  "addons.cdn.mozilla.net",
  "addons.mozilla.org",
  "api.accounts.firefox.com",
  "content.cdn.mozilla.net",
  "discovery.addons.mozilla.org",
  "install.mozilla.org",
  "oauth.accounts.firefox.com",
  "profile.accounts.firefox.com",
  "support.mozilla.org",
  "sync.services.mozilla.com",
  // My additions
  "vault.bitwarden.com",
];

// final comma restricts local filesystem
// https://superuser.com/a/1642347
const restrictedDomainString = restrictedDomainArray.join(",") + ','

user_pref("extensions.webextensions.restrictedDomains", restrictedDomainString);
