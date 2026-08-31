# TeremCORE

Terem CORE is a high-performance out-of-order pipelined RISC-V CPU core written in SystemVerilog.

This project uses [KaravaiSV](https://github.com/BIG-Denis/karavaisv) powerful templating engine.

## About

This project's specific goal is to make higly configurable lightweigh yet powerful FPGA-friendly out-of-order RISC-V CPU core which can be used in real applications as well as in educational and research purposes.

Check out full description and detailed overview of Terem CORE abilities at [specification](./doc/trmc_spec.adoc).

## Key features

* 10 stage pipeline
* configurable fetch/decode/issue/commit width
* configurable ROB entries count

And this is not the end!

## Supported RISC-V extensions

Terem CORE implements 32 bit RISC-V ISA as it is more then enough for the most general applications.

Supported extensions:

* I (base extension)

## Repository usage

### Before you begin

This project uses [KaravaiSV](https://github.com/BIG-Denis/karavaisv) powerful templating engine which is a python library.
This project's Makefile also creates a virtual environment for building purposes.

Make sure you installed [Python](https://www.python.org/) 3.13 or higher and [venv Python extension](https://docs.python.org/3/library/venv).

### Makefile targets

The makefile by default have following targets:

* help      - show help message
* init      - init repository and install dependencies
* build     - build project with default config
* lint      - lint builded project with verilator
* lint-wall - lint builded project with verilator showing all warnings
* clean     - clean files from previous build
* clean-all - clean files from previous build and venv

### Repository structure

```plain
terem-core/
├── config/                    # KSV configs
├── doc/                       # Terem Core documentation
│   └── img/                       # included images
├── project/                   # project-specific files
│   └── filelists/                 # filelists
├── scripts/                   # scripts
├── src/                       # source code
├── verif/                     # everything for verification
├── .gitignore                 # git file to ignore others
├── Makefile                   # makefile for project
└── README.md                  # repository hello file (this one)
```

## Additional information

This project is made by a single person (I am a student actually), so it can contain bugs, so if you see any roughness, please, report this via GitHub's [create an issue](https://github.com/BIG-Denis/terem-core/issues) tab.

Note that this project is under active development so new features, optimizations and RISC-V extensions is about to be added.
