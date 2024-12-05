# Spack

These repo contains configurations for the centrally installed version of spack.
The configuration is set using environment variables. The user can easily override these configurations to a custom directory.

The archer2repo folder contains patches for broken or non-existent packages on Archer2, including a patch to cmake to let it recognise libsci

## Using spack

### Loading spack

```bash
module load spack/0.23.0
```

### Useful commands

- `spack find`:  view installed packages. See `spack find -h` for options.
- `spack install ${SPEC}` : to install a specifick package name.
- `spack compilers` : show availabe compilers
- `spack list ` : shows all packages available in the repository

### Creating packages

A scaffold for a spack package can be created by typing

```bash
spack create --force --name hello_world https://github.com/lucaparisi91/hello_world/archive/refs/tags/v1.0.tar.gz
```
A few examples can be found in the `custom_packages` subdirectory.

## Installation of spack

Navigate to the folder where you wish to install spack

```bash
git clone --recursive -b v0.23.0 https://github.com/EPCCed/spack-epcc-20241106.git
```

You can generate module files to load spack using

```bash
python scripts/generate_modules.py $VERSION --output $MY_MODULES_ROOT/spack
```