# Hindman docker-compose shortcuts, borrowed from gavelizer README.md
hindman_dc_folder() {
  ( # Use a subshell to make the `cd` temporary.
    if [ "$(basename $PWD)" = "website" ] && [ -d "../gavelizer" ]; then
      cd ../gavelizer >/dev/null 2>&1
    fi
    "$@"
  )
}
dc() { hindman_dc_folder docker-compose "$@"; }
dce() { dc exec "$@"; }
dceg() { dc exec gavelizer "$@"; }
dcegbe() { dc exec gavelizer bundle exec "$@"; }
dcew() { dc exec website "$@"; }
dcewnr() { dc exec website npm run "$@"; }
