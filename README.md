# SBrT 2020 - Minicurso 6

# Understanding 5G core through an open-source implementation

(Universidade  Federal  de  Goiás)   
João Paulo Lobianco Silva   
Samuel Wanberg   
Rogério S. e Silva   
Antonio Oliveira-Jr     
Kleber  Cardoso    

(Universidade do Vale do Rio dos Sinos)   
Cristiano  Bonato  Both


This tutorial explores 5GC internals through an open-source implementation called [my5Gcore](https://github.com/my5g/my5Gcore/) and presents a non-3GPP IoT use case. The tutorial is divided into sections, including installation and development environment setup, code overview, 5G system procedures execution and a non-3GPP IoT use case. Each section provides videos and manuals instructing the reader how to replicate the steps. All the procedures can be reproduced using only a regular computer, e.g., a notebook and the materials provided in this repository. 

Each setion contains videos and manuals including all the commands demonstrated in the videos.

It presents the installation and development environment setup, code overview; 5GS procedures execution and the IoT is divided into sections. This first section
shows how to install and setup a my5Gcore development environment. The secund one, code debugging and network traffic sniffing. It also details some of the main 5GS procedures, including initial registration and PDU session establishment. The 


[my5Gcore](https://github.com/my5g/my5Gcore/) is fork of the [free5gc](https://github.com/free5gc/free5gc/) andpart of the my5G initiative and 

my5Gcore is part of the [my5G initiative](https://github.com/my5g/), an attempt to make 5G system widely available. [my5Gcore](https://github.com/my5g/my5Gcore/) is a fork of the [free5gc project](https://github.com/free5gc/free5gc/), in accomplish to [3GPP release 15](https://www.3gpp.org/release-15) and beyond. 


my5G2 é uma iniciativa de software de código aberto que pretende tornar o sistema 5G acessível para todos. my5GCore é um fork do projeto free5GC. Esse projeto implementa o núcleo da rede 5G (5GC), seguindo as especificações técnicas do Lançamento 15 3GPP e posteriores. Nesse contexto, o objetivo deste minicurso é apresentar, na prática, o 5GC(my5GCore) e um caso de uso IoT não-3GPP, através de uma implementação de código aberto da iniciativa my5G. Todo o processo de instalação, configuração, preparação do ambiente e o desenvolvimento de software no contexto do 5GC é apresentado, descrito e disponibilizado para os participantes do minicurso.





This tutorial aims to explore the softwarization in the 5G system composed of the Radio Access Network (RAN) and the core components, following the standards defined by 3GPP, particularly the Release 15. The tutorial provides a brief overview of wireless mobile cellular networks, including basic concepts and the evolution through the called ‘generations’ of mobile networks. From a software perspective, RAN is presented in the context of 4G and 5G networks, which includes the virtualized and disaggregated RAN. A significant part of the tutorial is dedicated to the 5G core, i.e., considering the Service-Based Architecture (SBA), due to its relevance and fully softwarized approach. The tutorial is motivated by a set of experiments. For each experiment, we make available a detailed manual and all the necessary software to replicate it. Some experiments can be reproduced using only a regular computer, e.g., a notebook, but some of them demand specific hardware, e.g., a Software-Defined Radio (SDR).



## Material
-----
* [Article](https://arxiv.org/abs/2006.10409)
* Sections
  1. my5Gcore installation and development environment 
     1. my5Gcore installation ([tutorial](docs/core-install.md), [video](http://youtubecom/))
     2. Setting-up development environment ([tutorial](docs/env-install.md), [video](http://youtubecom/))
  2. Code overview 
     1. Go packages ([tutorial](docs/core-overview.md), [video](http://youtubecom/))
     2. Reference points ([tutorial](docs/reference-points.md), [video](http://youtubecom/))
     3. Code debugging ([tutorial](docs/code-debugging.md), [video](http://youtubecom/))
  3. 5G system procedures
     1. Initial Registration Procedure ([tutorial](docs/initial-registration-procedure.md), [video](http://youtubecom/))
     2. PDU Session Establishment Procedure ([tutorial](docs/pdu-session-establishment-procedure.md), [video](http://youtubecom/))
    1. Non-3GPP IoT Use-Case ([tutorial](docs/non3gpp-iot-usecase.md), [video](http://youtubecom/))


## How to cite

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