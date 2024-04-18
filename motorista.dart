import 'pessoa.dart';
import 'carro.dart';

class Motorista extends Pessoa {
  Carro carro_motorista;
  String cnh;
  bool disponivel = true;

  Motorista(String nome, String cpf, int ano_nascimento, this.cnh,
      this.carro_motorista)
      : super(nome, cpf, ano_nascimento);

  bool motoristaDisponivel() {
    return this.disponivel;
  }

  void ocuparMotorista() {
    this.disponivel = false;
  }

  void desocuparMotorista() {
    this.disponivel = true;
  }

  
}
