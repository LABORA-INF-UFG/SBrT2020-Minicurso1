<!-- 
<div align="center">

<a href="https://github.com/LABORA-INF-UFG/my5Gcore"><img width="40%" src="./docs/figs/my5g-logo.png" alt="free5GC"/></a>

![GitHub](https://img.shields.io/github/license/LABORA-INF-UFG/my5GCore?color=blue) ![GitHub release (latest by date including pre-releases)](https://img.shields.io/github/v/release/LABORA-INF-UFG/my5GCore?include_prereleases) ![GitHub All Releases](https://img.shields.io/github/downloads/LABORA-INF-UFG/my5GCore/total) ![GitHub go.mod Go version](https://img.shields.io/github/go-mod/go-version/LABORA-INF-UFG/my5GCore) ![GitHub commit activity](https://img.shields.io/github/commit-activity/y/LABORA-INF-UFG/my5GCore) 
-->
<!-- 
![GitHub repo size](https://img.shields.io/github/repo-size/LABORA-INF-UFG/my5GCore) ![GitHub Workflow Status](https://img.shields.io/github/workflow/status/labora-inf-ufg/my5gcore/My5Gcore%20Workflow) ![GitHub last commit](https://img.shields.io/github/last-commit/LABORA-INF-UFG/my5GCore) ![GitHub contributors](https://img.shields.io/github/contributors/LABORA-INF-UFG/my5GCore)
</div>

-->

---

</div> 

<div align='center'>
  
# SBrT 2020 - Minicurso 1

# Understanding 5G core through an open-source implementation

</div>

<div align='center'>

João Paulo L. Silva (INF/UFG), Samuel Wanberg L. Nery (INF/UFG), Rogério S. e Silva (INF/UFG), Antonio Oliveira-Jr (INF/UFG & Fraunhofer Portugal AICOS), Kleber Cardoso (INF/UFG) e Cristiano B. Both (UNISINOS)

</div>

<div align='justified'>

This tutorial explores 5GC internals through an open-source implementation called [**my5G-core**](https://github.com/my5g/my5Gcore/). The tutorial is divided into sections, including installation and development environment setup, code overview, 5G system procedures execution, and a non-3GPP IoT use case. Each section provides videos and manuals to replicate these steps. All the procedures can be reproduced using a regular computer, e.g., a laptop (bare-metal or virtual machine), and the materials provided in this repository. [**my5G-core**](https://github.com/my5g/my5Gcore/) is a fork of the [free5GC project](https://github.com/free5gc/free5gc/) and integrates the [**my5G initiative**](https://github.com/my5g/).

## Material

* [Article](docs/arXiv_SBrT2020_minicurso1_final_19-11-20.pdf) 
* Sections
  * Installation and development environment - shows the steps required to install dependencies, download the source code, compile network functions, execute my5G-core and setup a local development environment.
     * Setting up my5G-core and development environment ([tutorial 1](docs/installation-dev-env-setup/core-install.md), [tutorial 2](docs/installation-dev-env-setup/env-install.md), [video](https://youtu.be/wfhsh9Ok8K8))
  * Code overview - presents how my5G-core source code is organized and how to debug network functions using GoLand IDE.
     * Source code organization ([tutorial](docs/code-overview/code-organization.md), [video 1](https://youtu.be/4W_xfD_ZJRg), [video 2](https://youtu.be/-MmQMZreVuY))
     * Code debugging ([tutorial](docs/code-overview/code-debugging.md), [video 1](https://youtu.be/ob5oFinwq9E), [video 2](https://youtu.be/CmcRcprDwxw))
  * 5G system procedures - shows step-by-step execution of initial registration  procedure over untrusted non-3GPP access.
     * Initial registration procedure ([tutorial](docs/5gs-procedures/initial-registration-procedure.md), [video](https://youtu.be/WYSlnlWD1P0))
  * Non-3GPP IoT use-case ([tutorial](docs/non3gpp-iot-use-case/non3gpp-iot-use-case.md)<!--, [video](http://youtubecom/)-->) - aims to demonstrate the untrusted non-3GPP access to the my5G-core using a Low Power Wide Area (LoRa/LoRaWAN) wireless network and docker containers.

</div>

## How to cite

It is a pleasure to share our knowledge and you are free to use! Please, cite our work as we can continue contributing. Thank you!
```
@incollection{underst5G_2021,
      title = {Entendendo o núcleo 5G na prática, através de uma implementação de código aberto},
      booktitle = {SBRT 2020: Livro de Minicursos},
      author = {J. P. L. {Silva} and S. W. L. {Nery} and R.S. {Silva} and A. C. {Oliveira-Jr} and K. V. {Cardoso} and C. B. {Both}},
      chapter = {1},
      isbn = {978-65-87572-23-9},
      publisher = {Instituto Federal de Ensino, Ciência e Tecnologia da Paraíba – IFPB},
      address = "Florianópolis-SC",
      year = {2021}
}
```
