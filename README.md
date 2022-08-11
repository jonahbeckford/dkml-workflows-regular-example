# dkml-workflows-example

Examples for GitHub Action workflows used by and with Diskuv OCaml (DKML) tooling. DKML helps you
distribute native OCaml applications on the most common operating systems.

These examples are useful for more than DKML though! If you want to test your
code with the Microsoft Visual Studio compiler and MSYS2, or if you want to produce Linux binaries
that don't need to be statically linked, this is the right place.

These workflows are **not quick** and won't improve unless you are willing to contribute PRs!
Expect to wait approximately:

| Build Step                                               | First Time | Subsequent Times |
| -------------------------------------------------------- | ---------- | ---------------- |
| setup-dkml / win32-windows_x86                           | `29m`      | sdf              |
| setup-dkml / win32-windows_x86_64                        | `29m`      | sdf              |
| setup-dkml / macos-darwin_all [1]                        | `29m`      | sdf              |
| setup-dkml / manylinux2014-linux_x86 (CentOS 7, etc.)    | `16m`      | sdf              |
| setup-dkml / manylinux2014-linux_x86_64 (CentOS 7, etc.) | `13m`      | sdf              |
| build / win32-windows_x86                                | `23m`      | sdf              |
| build / win32-windows_x86_64                             | `19m`      | sdf              |
| build / macos-darwin_all                                 | `27m`      | sdf              |
| build / manylinux2014-linux_x86 (CentOS 7, etc.)         | `09m`      | sdf              |
| build / manylinux2014-linux_x86_64 (CentOS 7, etc.)      | `09m`      | sdf              |
| release                                                  | `01m`      | sdf              |
| **TOTAL** *(not cumulative since steps run in parallel)* | `57m`      | sdf              |

You can see an example workflow at https://github.com/diskuv/dkml-workflows-example/actions/workflows/package.yml

[1] `setup-dkml/macos-darwin_all` is doing double-duty: it is compiling x86_64 and arm64 systems.

## Status

| What             | Branch/Tag | Status                                                                                                                                                                                        |
| ---------------- | ---------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Builds and tests |            | [![Builds and tests](https://github.com/diskuv/dkml-workflows-example/actions/workflows/package.yml/badge.svg)](https://github.com/diskuv/dkml-workflows-example/actions/workflows/build.yml) |
| Static checks    |            | [![Static checks](https://github.com/diskuv/dkml-workflows-example/actions/workflows/syntax.yml/badge.svg)](https://github.com/diskuv/dkml-workflows-example/actions/workflows/static.yml)    |
