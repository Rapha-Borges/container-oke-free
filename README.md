# Imagem Docker com scripts para provisionar um cluster OKE gratuito

Antes de executar a imagem, é necessário configurar algumas coisas. Preste muita atenção nos passos a seguir, pois qualquer erro na configuração pode resultar em falha na execução e o processo de reversão pode ser demorado e manual.

## Estrutura de diretórios

Nesse repositorio já existe a estrutura base de diretórios que será utilizada para a execução da imagem. Mas você precisa configurar os arquivos de credenciais da Oracle Cloud e as variáveis de ambiente.

```
.
├── env.sh
├── .oci
│   ├── config
│   └── oci_api_key.pem
├── README.md
├── ssh
│   ├── id_rsa
│   └── id_rsa.pub
└── terraform-state
    ├── terraform.tfstate
    └── terraform.tfstate.backup
```

## Variáveis de ambiente

Vamos começar configurando as variáveis de ambiente. Abra o arquivo env.sh e substitua os valores das variáveis abaixo pelos valores correspondentes da sua conta na Oracle Cloud.

As instruções para obter esses valores estão disponíveis no [README](https://github.com/Rapha-Borges/oke-free?tab=readme-ov-file#autenticando-na-oci) do repositório OKE-FREE.

```bash
export TF_VAR_tenancy_ocid=<tenancy_ocid>
export TF_VAR_user_ocid=<user_ocid>
export TF_VAR_fingerprint=<fingerprint>
export TF_VAR_region=<region>
export TF_VAR_image_id=<image_ocid>
```

## Arquivos de credenciais

Agora vamos configurar os arquivos de credenciais da Oracle Cloud. Você precisa criar um arquivo chamado config dentro diretório .oci e um arquivo chamado oci_api_key.pem no diretório .oci. 

As instruções para obter esses valores estão disponíveis no [README](https://github.com/Rapha-Borges/oke-free?tab=readme-ov-file#autenticando-na-oci) do repositório OKE-FREE. 

### Arquivo .oci/config

```bash
[DEFAULT]
user=<user_ocid>
fingerprint=<fingerprint>
tenancy=<tenancy_ocid>
region=<region>
key_file=~/.oci/oci_api_key.pem
```

### Arquivo .oci/oci_api_key.pem

```bash
-----BEGIN PRIVATE KEY-----
<your private key>
-----END PRIVATE KEY-----
```

## Chave SSH

Para a configuração do cluster OKE, é necessário uma chave SSH. Vamos seguir o padrão do [README](https://github.com/Rapha-Borges/oke-free?tab=readme-ov-file#autenticando-na-oci) do repositório OKE-FREE e criar uma chave SSH chamada id_rsa e id_rsa.pub no diretório ssh exclusivamente para o projeto.

```bash
mkdir -p ssh
ssh-keygen -t rsa -b 4096 -f ./ssh/id_rsa
```

## Executando a imagem

Agora que configuramos todas as variáveis e arquivos necessários, podemos executar a imagem. Esse comando deverá ser executado na raiz do projeto.

```bash
docker run --rm -v $(pwd):/root -it --name oke-free raphaelborges/oke-free:0.1.1@sha256:09d0e440a2eac2bb97e884030b407be79250578194bcf13cbe6fd088091d7d32
```

## Arquivos de estado

Após a execução da imagem, o arquivo de estado do terraform será criado no diretório terraform-state. Esse arquivo é importante para a manutenção do cluster OKE. Não o perca.

## Script Presente na Imagem

O script presente na imagem faz o provisionamento do cluster OKE e está configurado para tentar aplicar novamente em 5 minutos caso ocorra algum erro. Fique atento ao log para verificar se o processo foi concluído com sucesso, ou se é necessário alguma intervenção manual. Caso queira forçar o término do script, e o comnado `Ctrl + C` não funcione, execute o comando `docker stop oke-free`.