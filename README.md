# susemeee's dotfiles

## Install on a new machine

```sh
git clone --recursive git@github.com:susemeee/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install
```

`./install` runs [dotbot](https://github.com/anishathalye/dotbot) with
`install.conf.yaml`. It checks out the submodules, links the config files,
and runs `pre-install.sh` (Homebrew, oh-my-zsh, nvm, pyenv and so on).

dotbot does not overwrite existing files. If `~/.gitconfig`, `~/.zshrc`,
`~/.vim` or `~/.tmux.conf` already exist as regular files or directories,
it prints `already exists but is a regular file or directory` and skips them.
Move them out of the way and run `./install` again.

To pick up changes on a machine that is already set up:

```sh
cd ~/dotfiles
git pull
./install
```

## Update upstream submodules

Third-party code is pinned as git submodules:

| Path | Upstream | Pinned to |
| --- | --- | --- |
| `dotbot` | anishathalye/dotbot | release tag |
| `vim_runtime` | amix/vimrc | `master` commit |
| `vim/bundle/vim-pathogen` | tpope/vim-pathogen | `master` commit |
| `vim/bundle/vim-polyglot` | sheerun/vim-polyglot | `master` commit |

Submodules pinned to a release tag:

```sh
git -C dotbot fetch --tags
git -C dotbot tag --sort=-v:refname | head -3   # pick the latest tag
git -C dotbot checkout v1.24.1
git -C dotbot submodule update --init --recursive
```

Submodules that follow `master`:

```sh
git submodule update --remote vim_runtime
```

Then stage the new submodule commit before running anything else:

```sh
git add dotbot          # or the path you updated
./install               # check that it still works
git commit -m "Update dotbot to v1.24.1"
git push
```

Stage first because `./install` runs `git submodule update`, which resets
every submodule to the commit recorded in the index. If the new commit is not
staged yet, `./install` silently puts the old one back.

## Update tmux plugins

tmux plugins are not submodules. [TPM](https://github.com/tmux-plugins/tpm)
clones the `@plugin` entries in `tmux.conf` into `~/.tmux/plugins/` and
`./install` runs it. To update them to the latest upstream:

```sh
~/.tmux/plugins/tpm/bin/update_plugins all
tmux source-file ~/.tmux.conf
```

Inside tmux, `prefix + U` does the same. After adding or removing a `@plugin`
line, run `./install` (or `prefix + I`) to install it, and
`~/.tmux/plugins/tpm/bin/clean_plugins` to delete removed ones.

## List

### Vim
- pathogen
- vim-polyglot

### zsh
- oh-my-zsh
- zsh-syntax-highlighting
- zsh-autocompletion

### tmux
- [tpm](https://github.com/tmux-plugins/tpm)
- [catppuccin/tmux](https://github.com/catppuccin/tmux) (mocha). Needs tmux
  3.2 or later and a [Nerd Font](https://www.nerdfonts.com/) for the icons.
- [tmux-cpu](https://github.com/tmux-plugins/tmux-cpu) (CPU / RAM in the
  status line)

### etc
- autojump
- Homebrew (if mac)
- iproute2, tig (if mac)
- nvm
- pyenv
- [sl](https://github.com/mtoyoda/sl)

### iterm2
