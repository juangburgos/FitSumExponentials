# Fit Sum of Exponentials

The [files](./docs/files) directory contains a collection of **Python** scripts that implement the method proposed in this [stackexchange answer](https://math.stackexchange.com/questions/1428566/fit-sum-of-exponentials/3808325#3808325) to fit data to a sum of exponentials with an arbitrary number of exponential terms.

This repo also contains a static [jupyterlite](https://jupyterlite.readthedocs.io) website with a custom [pyodide](https://pyodide.org) kernel and the [PyArma](https://pyarma.sourceforge.io) Python module compiled for [webassembly](https://webassembly.org).

The website available at [**juangburgos.github.io/FitSumExponentials**](http://juangburgos.github.io/FitSumExponentials) allows to run the Python scripts in an _interactive_ Python environment that requires zero installation and no backend server, and it runs in almost all modern web browsers and devices.

Kudos to the _jupyterlite_, _pyodide_ and _PyArma_ guys for making this possible.

## Old Matlab Code

Before using Python and PyArma for exponentials the fit method implementation, there was a Matlab version, which was was available in an interactive online environment provided by [OctaveOnline](https://octave-online.net). Sadly, OctaveOnline decided to delete all my saved and shared scripts without any notification, which motivated me to create this static wbesite.

The old Matlab scripts can be accessed in the [matlab](./matlab) directory.

---

# License

MIT license.

Only for the files in the [files](./docs/files) and [matlab](./matlab) directories, the rest of the site files have licenses that belong to their own projects (_jupyterlite_, _pyodide_ and _PyArma_).

Copyright (c) 2020 - forever Juan Gonzalez Burgos

---

# Citing

To cite this algorithm please use:

```bibtex
@MISC {3808325,
    TITLE = {Fit sum of exponentials},
    AUTHOR = {Juan Gonzalez Burgos (https://math.stackexchange.com/users/605948/juan-gonzalez-burgos)},
    HOWPUBLISHED = {Mathematics Stack Exchange},
    NOTE = {URL:https://math.stackexchange.com/q/3808325 (version: 2020-08-31)},
    EPRINT = {https://math.stackexchange.com/q/3808325},
    URL = {https://math.stackexchange.com/q/3808325}
}
```

or

```amsrefs
\bib\{3808325}{misc}{    
    title={Fit sum of exponentials},    
    author={Juan Gonzalez Burgos (https://math.stackexchange.com/users/605948/juan-gonzalez-burgos)},    
    note={URL: https://math.stackexchange.com/q/3808325 (version: 2020-08-31)},    
    eprint={https://math.stackexchange.com/q/3808325},    
    organization={Mathematics Stack Exchange}  
}
```
