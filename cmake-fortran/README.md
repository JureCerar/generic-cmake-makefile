# READ ME

 [![GitHub version](https://img.shields.io/github/release/JureCerar/xslib.svg?label=Version&color=blue)](https://github.com/JureCerar/xslib/releases)
![Language](https://img.shields.io/badge/Language-Fortran-brightgreen.svg)
[![License](https://img.shields.io/badge/License-GNU_GPL_v3.0-red.svg)](https://www.gnu.org/licenses/gpl-3.0.html)

## Build & Install

Move into directory and type the following:
```bash
mkdir build
cd build
cmake ..
make
```
To install library type the following as *root* (or *sudo*):
```bash
make install
```
You should consider using the following [CMake options](https://cmake.org/cmake/help/v3.6/manual/cmake.1.html) with the appropriate value instead of `xxx`:
- `-DCMAKE_Fortran_COMPILER=xxx` equal to the name of the Fortran Compiler you wish to use (or the ENV variable `FC`).
- `-DCMAKE_INSTALL_PREFIX=xxx` to install program to a non-standard location (default `/usr/local/bin/`).
- `-DCMAKE_BUILD_TYPE=xxx` equal to `RELEASE` for normal build or `DEBUG` for debugging.

## License
This program is licensed under the **GNU General Public License v3.0**

Copyright (C) 2019 [Jure Cerar](https://github.com/JureCerar)

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program. If not, see http://www.gnu.org/licenses/.
