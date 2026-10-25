# asdf-diamond

An [asdf](https://asdf-vm.com) and [mise](https://mise.jdx.dev) plugin for
[Diamond](https://github.com/diamond-language/diamond). It builds Diamond from
source: each version is a `vX.Y.Z` tag in the Diamond repository.

## Requirements

- GCC 15+ or Clang 19+ (Diamond is C23 and uses `#embed`), `make`, `git`,
  `curl` and `tar`.
- Development headers for OpenSSL, SQLite, PostgreSQL (libpq), MariaDB
  Connector/C, zlib and libcrypt. The per-platform package lists are in
  Diamond's
  [CONTRIBUTING.md](https://github.com/diamond-language/diamond/blob/main/CONTRIBUTING.md#build-and-test).

## Install

asdf:

```sh
asdf plugin add diamond https://github.com/diamond-language/asdf-diamond.git
asdf install diamond 0.19.1    # `asdf list all diamond` shows every version
asdf set -u diamond 0.19.1     # asdf 0.16+; older asdf: asdf global diamond 0.19.1
```

mise:

```sh
mise plugins install diamond https://github.com/diamond-language/asdf-diamond.git
mise use -g diamond@latest
mise use -g diamond@ref:main   # or build any branch, tag or commit
```

Either way you get `diamond`, `facet` (the package manager), `diamond-lsp` and
`diamond-dap` on your `PATH`. The install keeps the whole built tree, because
`diamond build` finds the runtime sources and Makefile it links standalone
executables with by walking up from its own executable.

Then follow Diamond's
[getting-started guide](https://github.com/diamond-language/diamond/blob/main/docs/getting-started.md).

## License

MIT; see [LICENSE](LICENSE).
