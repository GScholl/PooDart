import 'motorista.dart';
import 'passageiro.dart';
import 'carro.dart';
import 'viagem.dart';
import 'dart:io';

void main() {
  List<Motorista> motoristas = [];
  List<Passageiro> passageiros = [];
  List<Viagem> viagens = [];

  while (true) {
    print('------------------------------------- \n \n ');
    print("Entre em uma das opções abaixo \n");
    print(
        " 1 - cadastro de  Motoristas \n 2 - cadastro de passageiros \n 3 - cadastro de viagens");
    print(" Qualquer outra tecla para sair");
    String? opcao = stdin.readLineSync();
    if (opcao == '1') {
      mostrarMotoristas(motoristas);
    } else if (opcao == '2') {
      mostrarPassageiros(passageiros);
    } else if (opcao == '3') {
      mostrarViagens(viagens, passageiros, motoristas);
    } else {
      exit(0);
    }
  }
}

List<Motorista> mostrarMotoristas(motoristas) {
  while (true) {
    print('------------------------------------- \n \n ');
    print("Lista de motoristas \n");

    if (motoristas.length > 0) {
      motoristas.forEach(
        (motorista) {
          int indice = motoristas.indexOf(motorista) + 1;
          print(
              "$indice  - ${motorista.nome},CPF ${motorista.cpf} , ${DateTime.now().year - motorista.ano_nascimento} de idade, CNH ${motorista.cnh} \n");
        },
      );
    } else {
      print("Não há motoristas no momento");
    }

    print("\n ---------------------------------------------------- \n");
    print("Escolha uma das opções abaixo e escreva o número correspondente \n");
    print(" 1 - Inserir Motorista");
    if (motoristas.length > 0) {
      print(" 2 - Excluir \n 3 - Editar \n");
    }

    print(" Qualquer outra tecla para voltar ao menu");
    String? opcao = stdin.readLineSync();
    if (opcao == "1") {
      inserirMotorista(motoristas);
    } else if (opcao == "2" && motoristas.length > 0) {
      excluirMotorista(motoristas);
    } else if (opcao == "3" && motoristas.length > 0) {
      editarMotorista(motoristas);
    } else {
      return motoristas;
    }
  }
}

bool indiceExiste(List<dynamic> lista, int indice) {
  return indice >= 0 && indice < lista.length;
}

List<Motorista> excluirMotorista(motoristas) {
  print("Digite o número a frente dos dados do motorista para exclusão");
  int indice = int.parse(stdin.readLineSync()!) - 1;
  if (indiceExiste(motoristas, indice)) {
    motoristas.removeAt(indice);

    print("Motorista Excluída com sucesso");
  } else {
    print(
        "O motorista digitado não existe, verifique os registros e tente novamente");
  }

  return motoristas;
}

List<Motorista> editarMotorista(motoristas) {
  print("Digite o número a frente dos dados do motorista para edição");
  int indice = int.parse(stdin.readLineSync()!) - 1;
  if (indiceExiste(motoristas, indice)) {
    print("Digite o nome do motorista");
    String? nome = stdin.readLineSync();
    print("Digite o ano de nascimento do motorista");
    int ano_nascimento = int.parse(stdin.readLineSync()!);
    print("Digite o cpf  do motorista");
    String? cpf = stdin.readLineSync();
    print("Digite a cnh do motorista");
    String? cnh = stdin.readLineSync();

    motoristas[indice].nome = nome;
    motoristas[indice].ano_nascimento = ano_nascimento;
    motoristas[indice].cpf = cpf;
    motoristas[indice].cnh = cnh;
  } else {
    print(
        "O motorista digitado não existe, verifique os registros e tente novamente");
  }

  return motoristas;
}

List<Motorista> inserirMotorista(motoristas) {
  print("Digite o nome do motorista");
  String? nome = stdin.readLineSync();
  print("Digite o ano de nascimento do motorista");
  int ano_nascimento = int.parse(stdin.readLineSync()!);
  print("Digite o cpf  do motorista");
  String? cpf = stdin.readLineSync();
  print("Digite a cnh do motorista");
  String? cnh = stdin.readLineSync();
  print("Digite o modelo do carro do motorista");
  String? modelo = stdin.readLineSync();
  print("Digite a placa do carro do motorista");
  String? placa = stdin.readLineSync();
  print("Digite a kilometragem do carro do motorista");
  int kilometragem = int.parse(stdin.readLineSync()!);
  print("Digite a ano do carro do motorista");
  int ano = int.parse(stdin.readLineSync()!);
  print("Digite a capacidade do tanque em litros do carro do motorista");
  int capacidade_tanque = int.parse(stdin.readLineSync()!);
  print("Digite a quantidade de combustivel em litros do carro do motorista");
  int combustivel_tanque = int.parse(stdin.readLineSync()!);
  Carro carro = new Carro(modelo.toString(), placa.toString(), kilometragem,
      ano, capacidade_tanque, combustivel_tanque);
  Motorista motorista = new Motorista(
      nome.toString(), cpf.toString(), ano_nascimento, cnh.toString(), carro);
  motoristas.add(motorista);
  print("Motorista inserido com sucesso");

  return motoristas;
}

List<Passageiro> mostrarPassageiros(passageiros) {
  while (true) {
    print('------------------------------------- \n \n ');
    print("Lista de passageiros \n");

    if (passageiros.length > 0) {
      passageiros.forEach(
        (passageiro) {
          int indice = passageiros.indexOf(passageiro) + 1;
          print(
              "$indice  - ${passageiro.nome},CPF ${passageiro.cpf} , ${DateTime.now().year - passageiro.ano_nascimento} de idade, Nº Cadastro ${passageiro.num_cadastro} \n");
        },
      );
    } else {
      print("Não há passageiros no momento");
    }

    print("\n ---------------------------------------------------- \n");
    print("Escolha uma das opções abaixo e escreva o número correspondente \n");
    print(" 1 - Inserir Passageiro");
    if (passageiros.length > 0) {
      print(" 2 - Excluir \n 3 - Editar \n");
    }

    print(" Qualquer outra tecla para voltar ao menu");
    String? opcao = stdin.readLineSync();
    if (opcao == "1") {
      inserirPassageiro(passageiros);
    } else if (opcao == "2" && passageiros.length > 0) {
      excluirPassageiro(passageiros);
    } else if (opcao == "3" && passageiros.length > 0) {
      editarPassageiro(passageiros);
    } else {
      return passageiros;
    }
  }
}

List<Passageiro> excluirPassageiro(passageiros) {
  print("Digite o número a frente dos dados do passageiro para exclusão");
  int indice = int.parse(stdin.readLineSync()!) - 1;
  if (indiceExiste(passageiros, indice)) {
    passageiros.removeAt(indice);

    print("Passageiro Excluído com sucesso");
  } else {
    print(
        "A passageiro digitado não existe, verifique os registros e tente novamente");
  }

  return passageiros;
}

List<Passageiro> editarPassageiro(passageiros) {
  print("Digite o número a frente dos dados do passageiro para edicao");
  int indice = int.parse(stdin.readLineSync()!) - 1;
  if (indiceExiste(passageiros, indice)) {
    print("Digite o nome do passageiro");
    String? nome = stdin.readLineSync();
    print("Digite o ano de nascimento do passageiro");
    int ano_nascimento = int.parse(stdin.readLineSync()!);
    print("Digite o cpf  do passageiro");
    String? cpf = stdin.readLineSync();
    passageiros[indice].nome = nome;
    passageiros[indice].ano_nascimento = ano_nascimento;
    passageiros[indice].cpf = cpf;
  } else {
    print(
        "o passageiro digitado não existe, verifique os registros e tente novamente");
  }

  return passageiros;
}

int geraNumCadastro( passageiros) {
  if (passageiros.length == 0) {
    return 1;
  }

  return passageiros[passageiros.length - 1].num_cadastro + 1;
}

List<Passageiro> inserirPassageiro(passageiros) {
  print("Digite o nome do passageiro");
  String? nome = stdin.readLineSync();
  print("Digite o ano de nascimento do passageiro");
  int ano_nascimento = int.parse(stdin.readLineSync()!);
  print("Digite o cpf  do passageiro");
  String? cpf = stdin.readLineSync();

  Passageiro passageiro = new Passageiro(nome.toString(), cpf.toString(),
      ano_nascimento, geraNumCadastro(passageiros));

  passageiros.add(passageiro);
  print("Passageiro inserido com sucesso");

  return passageiros;
}

List<Viagem> mostrarViagens(viagens, passageiros, motoristas) {
  while (true) {
    print('------------------------------------- \n \n ');
    print("Lista de Viagens \n");

    if (viagens.length > 0) {
      viagens.forEach(
        (viagem) {
          int indice = viagens.indexOf(viagem) + 1;
          print(
              "$indice  - Passageiro: ${viagem.passageiro.nome}, Motorista: ${viagem.motorista.nome}, Veículo: ${viagem.carro.modelo} - ${viagem.carro.placa}, ${viagem.status_viagem ? "Viagem em andamento" : "Viagem Finalizada"} \n");
        },
      );
    } else {
      print("Não há viagens no momento");
    }
    if (passageiros.length > 0 && motoristas.length > 0) {
      print("\n ---------------------------------------------------- \n");
      print(
          "Escolha uma das opções abaixo e escreva o número correspondente \n");
      print(" 1 - Iniciar Viagem");
      if (viagens.length > 0) {
        print(" 2 - Finalizar viagem");
      }
    } else {
      print(
          "Não há passageiros ou motoristas suficientes para iniciar uma viagem");
    }

    print(" Qualquer outra tecla para voltar ao menu");
    String? opcao = stdin.readLineSync();
    if (opcao == "1" && passageiros.length > 0 && motoristas.length > 0) {
      iniciarViagem(passageiros, motoristas, viagens);
    } else if (opcao == "2" &&
        passageiros.length > 0 &&
        motoristas.length > 0 &&
        viagens.length > 0) {
      encerrarViagem(viagens);
    } else {
      return viagens;
    }
  }
}

List<Viagem> iniciarViagem(passageiros, motoristas, viagens) {
  print('------------------------------------- \n \n ');
  print("Escolha o passageiro para a viagem \n");

  if (passageiros.length > 0) {
    passageiros.forEach(
      (passageiro) {
        int indice = passageiros.indexOf(passageiro) + 1;
        print(
            "$indice  - ${passageiro.nome},CPF ${passageiro.cpf} , ${DateTime.now().year - passageiro.ano_nascimento} de idade, Nº Cadastro ${passageiro.num_cadastro} \n");
      },
    );
  } else {
    return viagens;
  }
  print("Digite o número a frente dos dados do passageiro para selecionar");
  int indicePassageiro = int.parse(stdin.readLineSync()!) - 1;
  if (indiceExiste(passageiros, indicePassageiro)) {
    print("Passageiro selecionado com sucesso");
  } else {
    print(
        "O passageiro digitado não existe, verifique os registros e tente novamente");
  }
  print('------------------------------------- \n \n ');
  print("Escolha o motorista disponivel para a viagem \n");

  if (motoristas.length > 0) {
    int contagem_motoristas_disponiveis = 0;
    motoristas.forEach(
      (motorista) {
        int indice = motoristas.indexOf(motorista) + 1;
        if (motorista.disponivel) {
          contagem_motoristas_disponiveis++;
          print(
              "$indice  - ${motorista.nome},CPF ${motorista.cpf} , ${DateTime.now().year - motorista.ano_nascimento} de idade, CNH ${motorista.cnh} \n");
        }
      },
    );

    if (contagem_motoristas_disponiveis == 0) {
      print("Não há motoristas disponiveis no momento");
      return viagens;
    }
  } else {
    return viagens;
  }
  print("Digite o número a frente dos dados do motorista para selecionar");
  int indiceMotorista = int.parse(stdin.readLineSync()!) - 1;
  if (indiceExiste(motoristas, indiceMotorista)) {
    print("Motorista selecionado com sucesso");
  } else {
    print(
        "o motorista digitado não existe, verifique os registros e tente novamente");
  }
  Viagem viagem = new Viagem(
      motoristas[indiceMotorista],
      passageiros[indicePassageiro],
      motoristas[indiceMotorista].carro_motorista);
  viagens.add(viagem);

  return viagens;
}

List<Viagem> encerrarViagem(viagens) {
  if (viagens.length > 0) {
    int contagem_viagens_andamento = 0;
    viagens.forEach(
      (viagem) {
        if (viagem.status_viagem) {
          contagem_viagens_andamento++;
          int indice = viagens.indexOf(viagem) + 1;
          print(
              "$indice  - Passageiro: ${viagem.passageiro.nome}, Motorista: ${viagem.motorista.nome}, Veículo: ${viagem.carro.modelo} - ${viagem.carro.placa}, ${viagem.status_viagem ? "Viagem em andamento" : "Viagem Finalizada"} \n");
        }
      },
    );
    if (contagem_viagens_andamento == 0) {
      print("Não há viagens em andamento no momento");

      return viagens;
    }
    print("Digite o número a frente dos dados do passageiro para selecionar");
    int indice = int.parse(stdin.readLineSync()!) - 1;
    if (indiceExiste(viagens, indice)) {
      viagens[indice].status_viagem = false;
      print("viagem encerrada com sucesso");
    } else {
      print(
          "A viagem digitada não existe, verifique os registros e tente novamente");
    }
    return viagens;
  } else {
    print("Não há viagens no momento");
    return viagens;
  }
  
}
