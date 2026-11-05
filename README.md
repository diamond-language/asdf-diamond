# asdf-diamond

An [asdf](https://asdf-vm.com) and [mise](https://mise.jdx.dev) plugin for
[d6](https://github.com/diamond-language/diamond) (formerly Diamond). It builds d6 from
source: each version is a `vX.Y.Z` tag in the d6 repository. The plugin and tool
are still called `diamond` until the repositories move.

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
asdf plugin add diamond https://github.com/diamond-language/asdf-diamond.git
asdf install diamond 0.26.0    # `asdf list all diamond` shows every version
asdf set -u diamond 0.26.0     # asdf 0.16+; older asdf: asdf global diamond 0.26.0
```

mise:

```sh
mise plugins install diamond https://github.com/diamond-language/asdf-diamond.git
mise use -g diamond@latest
mise use -g diamond@ref:main   # or build any branch, tag or commit
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
