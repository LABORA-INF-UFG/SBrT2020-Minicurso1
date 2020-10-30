# SBrT 2020 - Minicurso 6

# Understanding 5G core through an open-source implementation

<center style="padding: 10%;">
João Paulo Lobianco Silva (Instituto de Informática (INF) - Universidade Federal de Goiás (UFG)), Samuel Wanberg Lourenço Nery (INF/UFG), Rogério S. e Silva (INF/UFG), Antonio Oliveira-Jr (INF/UFG & Fraunhofer Portugal AICOS Kleber Cardoso (INF/UFG) e Cristiano Bonato Both (Universidade do Vale do Rio dos Sinos - UNISINOS)</center>


This tutorial explores 5GC internals through an open-source implementation called [**my5Gcore**](https://github.com/my5g/my5Gcore/). The tutorial is divided into sections, including installation and development environment setup, code overview, 5G system procedures execution and a non-3GPP IoT use case. Each section provides videos and manuals to replicate these steps. All the procedures can be reproduced using only a regular computer, e.g., a notebook and the materials provided in this repository. [**my5Gcore**](https://github.com/my5g/my5Gcore/) is a fork of the [free5gc project](https://github.com/free5gc/free5gc/) and integrates the [**my5G initiative**](https://github.com/my5g/). The [**my5G initiative**](https://github.com/my5g/) is  an attempt to make 5G systems widely available.


## Material
-----
* [Article](https://arxiv.org/abs/2006.10409) <!-- TODO: Adequar p/ nosso documento -->
* Sections
  1. my5Gcore installation and development environment 
     1. my5Gcore installation ([tutorial](docs/core-install.md), [video](http://youtubecom/))
     2. Setting-up development environment ([tutorial](docs/env-install.md), [video](http://youtubecom/))
  2. Code overview 
     1. Go packages ([tutorial](docs/go-packages.md), [video](http://youtubecom/))
     2. Reference points ([tutorial](docs/reference-points.md), [video](http://youtubecom/))
     3. Code debugging ([tutorial](docs/code-debugging.md), [video](http://youtubecom/))
  3. 5G system procedures
     1. Initial Registration Procedure ([tutorial](docs/initial-registration-procedure.md), [video](http://youtubecom/))
     2. PDU Session Establishment Procedure ([tutorial](docs/pdu-session-establishment-procedure.md), [video](http://youtubecom/))
    1. Non-3GPP IoT Use-Case ([tutorial](docs/non3gpp-iot-use-case.md), [video](http://youtubecom/))


## How to cite

**TODO**: adequar para nosso documento
```
@misc{cardoso2020softwarized,
    title={A softwarized perspective of the 5G networks},
    author={Kleber Vieira Cardoso and Cristiano Bonato Both and Lúcio Rene Prade and Ciro J. A. Macedo and Victor Hugo L. Lopes},
    year={2020},
    eprint={2006.10409},
    archivePrefix={arXiv},
    primaryClass={cs.NI}
}
```