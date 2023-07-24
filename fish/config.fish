if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -g fish_greeting "Hi Leo :)"

set -gx LDFLAGS "-L/opt/homebrew/opt/llvm/lib/c++ -Wl,-rpath,/opt/homebrew/opt/llvm/lib/c++ -L/opt/homebrew/opt/llvm/lib -L/Users/nerone/.idris2/lib "
set -gx CPPFLAGS "-I/opt/homebrew/opt/llvm/include"

# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/__tabtab.fish ]; and . ~/.config/tabtab/__tabtab.fish; or true

# opam configuration
source /Users/nerone/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin $PATH /Users/nerone/.ghcup/bin # ghcup-env

# pnpm
set -gx PNPM_HOME "/Users/nerone/Library/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/nerone/Downloads/google-cloud-sdk/path.fish.inc' ]; . '/Users/nerone/Downloads/google-cloud-sdk/path.fish.inc'; end

# bass source '/Users/nerone/Documents/Projects/tests/gcloud/completion.bash.inc'

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
set --export PATH $PATH /opt/homebrew/bin/

set -gx WASMTIME_HOME "$HOME/.wasmtime"
set -gx RUSTC_WRAPPER "/opt/homebrew/bin/sccache"

string match -r ".wasmtime" "$PATH" > /dev/null; or set -gx PATH "$WASMTIME_HOME/bin" $PATH

# Wasmer
export WASMER_DIR="/Users/nerone/.wasmer"
[ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"

# Nix
any-nix-shell fish --info-right | source

# >>> coursier install directory >>>
set -gx PATH "$PATH:/Users/nerone/Library/Application Support/Coursier/bin"
# <<< coursier install directory <<<

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /Volumes/WD_BLACK/conda/miniconda3/bin/conda
    eval /Volumes/WD_BLACK/conda/miniconda3/bin/conda "shell.fish" "hook" $argv | source
end
# <<< conda initialize <<<

