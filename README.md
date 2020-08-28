# Gerenciamento Clínico
![alt text](https://github.com/sifthedog/doctor-management/blob/master/health_.png?raw=true)

Esta é uma solução elaborada com Ruby On Rails para agendamentos de consultas, cadastros de pacientes e médicos. 

## Regras de negócio
---
1. Listagem de médicos - cada registro com opção de edição e exclusão;
2. Cadastro de médicos:

    2.1. Não pode ser permitido o cadastro de médicos com CRM duplicados;

    2.2. Todos os atributos são obrigatórios;

3. Exclusão de médicos:

    3.1. Não deve ser possível excluir médicos com pacientes vinculados;

4. Listagem de pacientes - cada registro com opção de edição e exclusão;
5. Criação de pacientes

    5.1. Todos os atributos são obrigatórios;

    5.2. Todo paciente deve estar vinculado a um médico;

    5.3. O sistema não deve permitir cadastro de mesmo CPF;

    5.4. O sistema deve validar os CPFs;

6. Exclusão de pacientes;
7. Cadastro de consultas

    7.1. Horário de atendimento das 9h-12h e 13h-18h;

    7.2. Cada consulta dura 30 minutos;

    7.3. O mesmo médico não pode ter 2 consultas no mesmo horário;

    7.4. Todos os atributos são obrigatórios;

8. Tela de dados que pode ser filtrada por médico ou visualizar todos (padrão):

    8.1. Deve ser possível filtrar por médico;

    8.2. Filtro padrão "Todos os médicos";

    8.3. Mostrar consultas realizadas;
    
    8.4. Mostrar pacientes diferentes atendidos;

## Como executar
---
Este projeto utiliza [Docker](https://www.docker.com/), portanto, para conseguir executá-lo, é necessário primeiro ter instalado o Docker e o Docker-Compose. Siga o passo-a-passo que está no site fornecido. É recomendado que, se estiver usando Linux, faça os passos para que Docker possa ser executado sem necessitar do `sudo`.

Com o Docker instalado, abra o terminal na pasta do repositório e execute:

`sh build.sh`

Pronto. Este script irá realizar todas as configurações necessárias. A primeira inicialização deve demorar um pouco, pois há 2 partes:
- execução de comandos no terminal, que fica visível ao usuário;
- execução de comandos dentro do container (migration, seed), que apenas são visíveis utilizando o comando `docker logs <id_do_container>`;

Após a inicialização, o seu container deve poder ser acessado na porta 3000. 


## TODO
---

- Aumentar e melhorar a cobertura de testes;
- Melhorar a usabilidade no front-end nas edições;