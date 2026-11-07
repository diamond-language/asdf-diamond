# asdf-diamond

An [asdf](https://asdf-vm.com) and [mise](https://mise.jdx.dev) plugin for
[d6](https://github.com/diamond-language/diamond) (formerly Diamond). It builds d6 from
source: each version is a `vX.Y.Z` tag in the d6 repository. Install it under the name
`d6`; the name is yours to pick, and the commands below assume `d6`. The repository is
still called asdf-diamond until the repositories move.

## Requirements

- GCC 15+ or Clang 19+ (d6 is C23 and uses `#embed`), `make`, `git`,
  `curl` and `tar`.
- Development headers for OpenSSL, SQLite, PostgreSQL (libpq), MariaDB
  Connector/C, zlib and libcrypt. The per-platform package lists are in
  d6's
  [CONTRIBUTING.md](https://github.com/diamond-language/diamond/blob/main/CONTRIBUTING.md#build-and-test).

## Install

asdf:

```sh
asdf plugin add d6 https://github.com/diamond-language/asdf-diamond.git
asdf install d6 0.28.0    # `asdf list all d6` shows every version
asdf set -u d6 0.28.0     # asdf 0.16+; older asdf: asdf global d6 0.28.0
```

mise:

```sh
mise plugins install d6 https://github.com/diamond-language/asdf-diamond.git
mise use -g d6@latest
mise use -g d6@ref:main   # or build any branch, tag or commit
```

Installed the plugin as `diamond` before? Add it again as `d6`: versions are kept per
plugin name, so install them under `d6` too, then `mise plugins uninstall diamond`.

To switch between the latest release and a development build of `main`, install both
and pick one with `mise use` (globally with `-g`, or per project):

```sh
mise install d6@latest d6@ref:main
mise use -g d6@latest     # latest release
mise use -g d6@ref:main   # main, reports e.g. `d6 0.29.0-dev`
```

A `ref:` install is built once, from the commit `main` pointed to at the time, and
`mise upgrade` leaves it alone. Rebuild it to pick up newer commits:

```sh
mise install -f d6@ref:main
```

Either way you get `d6`, `facet` (the package manager), `d6-lsp` and
`d6-dap` on your `PATH` (0.22.0 and older: `diamond`, `diamond-lsp` and
`diamond-dap`). The install keeps the whole built tree, because
`d6 build` finds the runtime sources and Makefile it links standalone
executables with by walking up from its own executable.

Then follow d6's
[getting-started guide](https://github.com/diamond-language/diamond/blob/main/docs/getting-started.md).

## License

MIT; see [LICENSE](LICENSE).
