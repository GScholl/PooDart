import 'pessoa.dart';

class Passageiro extends Pessoa {
  int num_cadastro;

  Passageiro(String nome, String cpf, int ano_nascimento, this.num_cadastro)
      : super(nome, cpf, ano_nascimento);
}
