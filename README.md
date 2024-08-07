

<a name="readme-top"></a>

[![colab][colab-shield]][colab-url]
![Release][release-shield]
[![License][license-shield]][license-url]
![Commit][commit-shield]
![Size][size-shield]
[![Downloads][download-shield]][download-url]
[![Doi][DOI-shield]][DOI-url]





# CASTING 

<p align="justify"> A Continuous Action Space Tree search for INverse desiGn (CASTING) Framework and Materials Discovery</p>


## Table of Contents
- [Introduction](#Introduction)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Running the code](#running-the-code)
- [Optimization of Gold nanocluster](#optimization-of-Gold-nanocluster)
- [Carbon metastable polymorphs](#carbon-metastable-polymorphs)
- [Citation](#citation)
- [License](#license)





## Introduction

A pseudocode implementation of CASTING framework ([Paper](https://doi.org/10.1038/s41524-023-01128-y)) for optimization of atomic nanoclusters only. This code uses MCTS (Monte Carlo Tree Search) as base optimizer.<br/> 
<p align="justify">&emsp;&emsp;&emsp;&emsp;Fast and accurate prediction of optimal crystal structure, topology, and microstructures is important for accelerating the design and discovery of new materials. Material properties are strongly correlated to the underlying structure and topology – inverse design is emerging as a powerful tool to discover new and increasingly complex materials that meet targeted functionalities. CASTING provides a unified framework for fast, scalable and accurate prediction & design of materials.</p>


<p align="center"> <a href="url"><img src="https://github.com/sbanik2/CASTING/blob/main/figs/MCTS.png?raw=true" align="center" height="500" width="600" ></a> </p>


<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Prerequisites
This package requires:
- [scipy](https://scipy.org/)
- [LAMMPS](https://www.lammps.org/)
- [pymatgen](https://pymatgen.org/)
- [pandas](https://pandas.pydata.org/)
- [numpy](https://numpy.org/)
- [networkx](https://networkx.org/)
- [ase](https://wiki.fysik.dtu.dk/ase/#)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Installation

### Set up Python environment

[Install Miniconda](https://docs.anaconda.com/miniconda/miniconda-install/).

```
conda create -p /path/to/env-casting python=3.11
source activate /path/to/env-casting
```


### Install CASTING from GitHub

```
python -m pip install git+https://github.com/ANL-NST/CASTING.git
```

To update or reinstall,

```
python -m pip install --force-reinstall --no-deps git+https://github.com/ANL-NST/CASTING.git
```


### CASTING endpoint server

```
$ python -m CASTING.endpoint --host 127.0.0.1 --port 5000
INFO:     Started server process
INFO:     Waiting for application startup.
INFO:     Application startup complete.
INFO:     Uvicorn running on http://127.0.0.1:5000 (Press CTRL+C to quit)

# Visit http://127.0.0.1:5000 on a web browser.
```


### Install LAMMPS simulator

```
git clone https://github.com/lammps/lammps.git

root=$(pwd)/lammps

cd $root/src
make yes-manybody
make -j4 mode=shared serial
ln -s $root/src/liblammps_serial.so $root/python/liblammps.so

echo "export PYTHONPATH=\${PYTHONPATH}:$root/python" >> $HOME/.bashrc
echo "export LD_LIBRARY_PATH=\${LD_LIBRARY_PATH}:$root/src" >> $HOME/.bashrc
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>


### Running the code

<p align="justify"> First, all the parameters crystal (constrains), LAMMPS parameters (pair style, pair coefficient etc.) and the perturbation parameter need to be set.</p>


```
python -m CASTING inputs.json
```

The optimization produces a "dumpfile.dat" output containing all the crystal parameters and the energy values as the output. To extract the structures in either 'poscar' or 'cif' format, one can use the  'StructureWriter' module.

 ``` python
 
from CASTING.writer import StructureWriter

num_to_write = 10 # number of stuctures to extract
writer = StructureWriter(
                         "dumpfile.dat",
                          outpath="structures",
                          objfile="energy.dat",
                          file_format="poscar" # "poscar" or "cif"
                          ) 
writer.write( num_to_write, sort=True) # sort to arrange in increasing order of energy
 
 
 ```
This will extract 'num_to_write' number of structures in ascending order of objective. 


<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Optimization of Gold nanocluster

An example optimization of Gold (Au) nanocluster is given in "example" directory. We have used CASTING to optimize the already known global minima (Sutton-Chen) of 13 atom Au nanocluster (Icosahedral structure).  Details on additional examples can be found in [Paper](https://doi.org/10.48550/arXiv.2212.12106).

<p align="center"> <a href="url"><img src="https://github.com/sbanik2/CASTING/blob/main/figs/sutton_chen.gif" align="center" height="200" width="200" ></a> </p>

<p align="right">(<a href="#readme-top">back to top</a>)</p>


### Launch in Colab

An example optimization of a Gold (Au) - Sutton-Chen nanocluster in the form of a Jupyter notebook that does not require LAMMPS Python binding has been provided in the `notebooks` directory. This can be launched in Google Colab using the [link](https://colab.research.google.com/github/sbanik2/CASTING/blob/main/notebooks/Au_example_Ase.ipynb).

## Carbon metastable polymorphs

We have also used CASTING to sample metastable polymorphs of Carbon(C). All the structures are then further relaxed with DFT. The unique polymorphs and their corresponding DFT energies have been provided in “C_polymorphs” directory.

<p align="center"> <a href="url"><img src="https://github.com/sbanik2/CASTING/blob/main/figs/MetastableC.png" align="center" height="400" width="500" ></a> </p>

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Citation
```
@article{banik2023continuous,
  title={A continuous action space tree search for INverse desiGn (CASTING) framework for materials discovery},
  author={Banik, Suvo and Loefller, Troy and Manna, Sukriti and Chan, Henry and Srinivasan, Srilok and Darancet, Pierre and Hexemer, Alexander and Sankaranarayanan, Subramanian KRS},
  journal={npj Computational Materials},
  volume={9},
  number={1},
  pages={1--16},
  year={2023},
  publisher={Nature Publishing Group}
}

```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## License
CASTING is distributed under MIT License. See `LICENSE` for details.


<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!--LINKS -->

[colab-shield]: https://colab.research.google.com/assets/colab-badge.svg
[colab-url]: https://colab.research.google.com/github/sbanik2/CASTING/blob/main/notebooks/Au_example_Ase.ipynb
[release-shield]: https://img.shields.io/github/v/release/sbanik2/CASTING
[license-shield]: https://img.shields.io/github/license/sbanik2/CASTING
[license-url]: https://github.com/sbanik2/CASTING/blob/main/LICENSE
[download-shield]: https://static.pepy.tech/badge/casting
[download-url]: https://pepy.tech/project/casting
[commit-shield]:https://img.shields.io/github/last-commit/sbanik2/CASTING
[size-shield]: https://img.shields.io/github/languages/code-size/sbanik2/CASTING
[DOI-shield]: https://img.shields.io/badge/Paper-8A2BE2
[DOI-url]: https://doi.org/10.1038/s41524-023-01128-y


