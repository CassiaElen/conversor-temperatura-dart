import 'dart:io';

void main(){
  int opcao = 0;
  
  do{
    print("CONVERSOR DE TEMPERATURAS");
    print("Qual a temperatura quer converter?");
    print("""  
  (1) - Celsius para Fahrenheit.
  (2) - Fahrenheit para Celsius. 
  (3) - Celsius para Kelvin.
  (4) - Kelvin para Celsius.
  (5) - Fahrenheit para Kelvin.
  (6) - Sair.""");

    String? operacao = stdin.readLineSync(); 
    opcao = parseTo(operacao, "int") ?? 0;
    
    if(opcao!=6){
      print("Digite a temperatura: ");
      String? temperaturaInput = stdin.readLineSync();
      double temperatura = parseTo(temperaturaInput, "double");

      print(converterTemperatura(opcao, temperatura));
    }
    
  }while(opcao != 6);
  print("Programa encerrado.");
}

dynamic parseTo(String? valor, String tipo){
  if (valor == null || valor.isEmpty) {
    print("Nenhum valor digitado.");
    return null;
  }
    try {
      return tipo == "int" ? int.parse(valor) : double.parse(valor);
    } catch (e) {
      print("Erro: Digite um número válido!");
      return null;
    }
}

String converterTemperatura(int opcao, double temperatura){
  double resultado = 0.0;
  String temp = " ";
  switch(opcao){
      case 1:
        resultado = ((temperatura * 9) / 5) + 32;
        temp = "°F";
        break;
      case 2:
        resultado = (temperatura - 32) * (5 / 9);
        temp = "°C";
        break;
      case 3:
        resultado = temperatura + 273.15;
        temp = "°K";
        break;
      case 4:
        resultado = temperatura - 273.15;
        temp = "°C";
        break;
      case 5:
        resultado = (temperatura - 32) * (5 / 9) + 273.15;
        temp = "°K";
        break;
      default:
        return 'Opção inválida!';
    }
  String resultadoString = resultado.toStringAsFixed(2);
  return "O resultado é: $resultadoString $temp";
}