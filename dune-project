(lang dune 2.9)

(name your_example)

(generate_opam_files true)

(source
 (github username/reponame))

(authors "Author Name")

(maintainers "Maintainer Name")

(license Apache-2.0)

(documentation https://url/to/documentation)

(package
 (name your_example)
 (synopsis "An example for you")
 (description
  "An example of using dkml-workflows to build on multiple platform, including Windows with Visual Studio and Linux with an old C library.")
 (depends ocaml dune diskuvbox)
 (tags
  (topics "to describe" your project)))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/dune-files.html#dune-project
