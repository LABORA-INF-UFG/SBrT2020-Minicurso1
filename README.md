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

João Paulo Lobianco Silva (INF/UFG), Samuel Wanberg Lourenço Nery (INF/UFG), Rogério S. e Silva (INF/UFG), Antonio Oliveira-Jr (INF/UFG & Fraunhofer Portugal AICOS), Kleber Cardoso (INF/UFG) e Cristiano Bonato Both (UNISINOS)

</div>

<div align='justified'>

This tutorial explores 5GC internals through an open-source implementation called [**my5G-core**](https://github.com/my5g/my5Gcore/). The tutorial is divided into sections, including installation and development environment setup, code overview, 5G system procedures execution, and a non-3GPP IoT use case. Each section provides videos and manuals to replicate these steps. All the procedures can be reproduced using a regular computer, e.g., a laptop (bare-metal or virtual machine), and the materials provided in this repository. [**my5G-core**](https://github.com/my5g/my5Gcore/) is a fork of the [free5GC project](https://github.com/free5gc/free5gc/) and integrates the [**my5G initiative**](https://github.com/my5g/).

## Material

* [Article](docs/arXiv_SBrT2020_minicurso1_final_19-11-20.pdf) 
* Sections
  * Installation and development environment - shows the steps required to install dependencies, download the source code, compile network functions, execute my5G-core and setup a local development environment.
     * my5G-core Setup ([tutorial](docs/installation-dev-env-setup/core-install.md), [video](http://youtubecom/))
     * Setting up development environment ([tutorial](docs/installation-dev-env-setup/env-install.md), [video](http://youtubecom/))
  * Code overview - presents how my5G-core source code is organized and how to debug network functions using GoLand IDE.
     * Source code organization ([tutorial](docs/code-overview/code-organization.md), [video 1](https://drive.google.com/file/d/1y45SNzbln-wm0cPXPwvU3tDpw3FbFcP5/view?usp=sharing), [video 2](https://drive.google.com/file/d/14y7f72WEy-oGF5HQPWxid4BFNSKN7YY9/view?usp=sharing))
     * Reference points ([tutorial](docs/code-overview/reference-points.md), [video](https://drive.google.com/file/d/1SnF8yxIWQ8gXE8fXKHm4xcaB6WmwD-JV/view?usp=sharing))
     * Code debugging ([tutorial](docs/code-overview/code-debugging.md), [video 1](https://drive.google.com/file/d/1V-GdTCLid8Y5ICjcPIr2-80GIIsJoUw1/view?usp=sharing), [video 2](https://drive.google.com/file/d/16qVa3_bDR4AOsF-Z41qbBmdtftmhuXnq/view?usp=sharing))
  * 5G system procedures - shows step-by-step execution of initial registration  procedure over untrusted non-3GPP access.
     * Initial registration procedure ([tutorial](docs/5gs-procedures/initial-registration-procedure.md), [video](http://youtubecom/))
     <!-- * PDU session establishment procedure ([tutorial](docs/5gs-procedures/pdu-session-establishment-procedure.md), [video](http://youtubecom/)) -->
  * Non-3GPP IoT use-case ([tutorial](docs/non3gpp-iot-use-case/non3gpp-iot-use-case.md), [video](http://youtubecom/)) - aims to demonstrate the untrusted non-3GPP access to the my5Gcore using a Low Power Wide Area (LoRa/LoRaWAN) wireless network and docker containers.

</div>

## How to cite

It is a pleasure to share our knowledge and you are free to use! Please, cite our work as we can continue contributing. Thank you!
```
@misc{SBrT2020_minicurso6, 
    title={Entendendo o núcleo 5G na prática, através de uma implementação de código aberto},
    author={João Paulo Lobianco Silva and Samuel Wanberg Lourenço Nery and Rogério S. e Silva and Antonio Oliveira-Jr and Kleber Vieira Cardoso and Cristiano Bonato Both},
    year={2020},
    howpublished={XXXVIII Simpósio Brasileiro de Telecomunicações e Processamento de Sinais - SBrT 2020, Minicurso 1, Available at: \url{https://github.com/LABORA-INF-UFG/SBrT2020-Minicurso1}},
}
```
