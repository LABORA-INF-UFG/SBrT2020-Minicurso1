Docker
========================

<div align='justify'> 

##### Nota 22/01/2020 - 09:19:04 

## Instalação:
#### Desinstalando versões anteriores
> ```$ sudo apt-get remove docker docker-engine docker.io containerd runc ```

#### Atualizando o sistema e instalando dependências
 *Atualizando o índice de pacotes APT** 
> ```$ sudo apt update ```

 *Instalando as dependências ( permite ao APT usar repositório HTTPS)*
 
> ```$ sudo apt install apt-transport-https ca-certificates curl software-properties-common -y ```

 *Adicionando e validando a chave GPG do repositório oficial do Docker* 
 
> ```$ sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - ```
> ```$ sudo apt-key  fingerprint 0EBFCD88 ```

*Adicionando repositório Docker para o APT**

> ```$ sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" ```

 *Atualizando o índice de pacotes APT** 

> ```$ sudo apt update```

#### Instalando Docker Community Edition

*Instalando*

> ```$ sudo apt install docker-ce -y```

*Verificando instalação - Serviço ativo*

> ```$ sudo systemctl status docker ```

*Executando imagem **hello-world** - Testando Docker**

> ```$ sudo docker run hello-world ```

*Executando o **docker** sem **root**.**

> ```$ sudo groupadd docker ```
> ```$ sudo usermod -aG docker ${USER} ```

#### Instalando o Docker-compose

*Download da Versão (1.25.3)*

> ```$ sudo curl -L "https://github.com/docker/compose/releases/download/1.25.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose```

*Atribuindo permissão de executável*

> ```$ sudo chmod +x /usr/local/bin/docker-compose```

*Criando link simbólico para a pasta /usr/bin*

> ```$ sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose```

*[Opcional] - Instalando o bash-completion for docker compose*
> ```$sudo curl -L https://raw.githubusercontent.com/docker/compose/1.25.3/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose```


*Testando o docker-compose*

> ```$ docker-compose --version```


## Docker básico:
#### Obtendo informações do sistema sobre o docker
> ```$ docker info ```

#### Exibindo imagens locais
> ```$ docker images```

#### Pesquisando imagens no *Docker Hub*
> ```$ docker search <imagem> ```

#### Baixando imagens no *Docker Hub*
> ```$ docker pull <imagem>:[<tag>] ```

#### Removendo imagens locais
> ```$ docker rmi <imagem>```

#### Exibindo imagens locais
> ```$ docker images```

#### Executando imagens 
> ```$ docker run <imagem>```

## Dockerfile:

## Docker Imagens e Containers:



</div>
