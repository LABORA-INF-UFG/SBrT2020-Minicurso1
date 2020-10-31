<div align='center'>
  
# SBrT 2020 - Minicurso 6

# Understanding 5G core through an open-source implementation

</div>

<div align='center'>

João Paulo Lobianco Silva (Instituto de Informática (INF) - Universidade Federal de Goiás (UFG)), Samuel Wanberg Lourenço Nery (INF/UFG), Rogério S. e Silva (INF/UFG), Antonio Oliveira-Jr (INF/UFG & Fraunhofer Portugal AICOS Kleber Cardoso (INF/UFG) e Cristiano Bonato Both (Universidade do Vale do Rio dos Sinos - UNISINOS)

</div>

<div align='justified'>

This tutorial explores 5GC internals through an open-source implementation called [**my5Gcore**](https://github.com/my5g/my5Gcore/). The tutorial is divided into sections, including installation and development environment setup, code overview, 5G system procedures execution and a non-3GPP IoT use case. Each section provides videos and manuals to replicate these steps. All the procedures can be reproduced using only a regular computer, e.g., a notebook and the materials provided in this repository. [**my5Gcore**](https://github.com/my5g/my5Gcore/) is a fork of the [free5gc project](https://github.com/free5gc/free5gc/) and integrates the [**my5G initiative**](https://github.com/my5g/). The [**my5G initiative**](https://github.com/my5g/) is  an attempt to make 5G systems widely available.


## Material

* [Article](https://arxiv.org/abs/2006.10409) <!-- TODO: Adequar p/ nosso documento -->
* Sections
  * Installation and development environment - this section shows the steps required to install dependencies, download the source code, compile network functions, execute my5Gcore and also setup the environment for local development.
     * my5Gcore installation ([tutorial](docs/installation-dev-env-setup/core-install.md), [video](http://youtubecom/))
     * Setting-up development environment ([tutorial](docs/installation-dev-env-setup/env-install.md), [video](http://youtubecom/))
  * Code overview - this sections shows how my5Gcode is organized and how to debug a network function using GoLand IDE.
     * Go packages ([tutorial](docs/code-overview/go-packages.md), [video](http://youtubecom/))
     * Reference points ([tutorial](docs/code-overview/reference-points.md), [video](http://youtubecom/))
     * Code debugging ([tutorial](docs/code-overview/code-debugging.md), [video](http://youtubecom/))
  * 5G system procedures - this sections presents procedures for registration and session establishment via untrusted non-3GPP access.
     * Initial registration procedure ([tutorial](docs/5gs-procedures/initial-registration-procedure.md), [video](http://youtubecom/))
     * PDU session establishment procedure ([tutorial](docs/5gs-procedures/pdu-session-establishment-procedure.md), [video](http://youtubecom/))
  * Non-3GPP IoT use-case ([tutorial](docs/non3gpp-iot-use-case/non3gpp-iot-use-case.md), [video](http://youtubecom/)) - this section aims to demonstrate the untrusted non-3GPP access to the my5Gcore using a Low Power Wide Area (LoRa/LoRaWAN) wireless network and docker containers.

</div>

## How to cite

**TODO**: adequar para nosso documento
```
@misc{??????,
    title={Entendendo o núcleo 5G na prática, através de uma implementação de código aberto},
    author={João Paulo Lobianco Silva and  Samuel Wanberg Lourenço Nery and Rogério S. e Silva and Antonio Oliveira-Jr Kleber Vieira Cardoso and Cristiano Bonato Both},
    year={2020},
    eprint={},
    archivePrefix={},
    primaryClass={}
}
```
