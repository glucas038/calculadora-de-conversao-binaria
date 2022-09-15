void main() {
  var lista = new Calcular(10897, 16).calculando();
  print(lista);
  var conversao = new VoltarBase("2a91", 16).conversao();
  print(conversao);
}

class Calcular {
  int baseNumerica;
  int numeroEscolhido;
  var listaDeCodigo = [];
  int resultado = 0;
  var sobra = 0;
  var lista = [];
  var algarismo = new ModelarValores();

  Calcular(this.numeroEscolhido, this.baseNumerica); //Construtor padrão

  List? calculando() {
    if (numeroEscolhido < baseNumerica) {
      listaDeCodigo.add(algarismo.modelando(numeroEscolhido));
      return listaDeCodigo; //Adicionar quando já começa com o numero escolhido menor que a base
    } else {
      // enquanto base menor realizar divisão e guardar resultado
      while (baseNumerica <= numeroEscolhido) {
        sobra = numeroEscolhido % baseNumerica;
        listaDeCodigo.add(algarismo.modelando(sobra));
        resultado = numeroEscolhido ~/ baseNumerica;
        if (resultado >= baseNumerica) {
          numeroEscolhido = resultado;
        } else {
          listaDeCodigo.add(algarismo.modelando(resultado));
          numeroEscolhido = resultado;
        }
      }
      // realizar a inversão da lista para retorna-la ja configurada
      lista = listaDeCodigo.reversed.toList();

      return lista;
    }
  }
}

class ModelarValores {
  //realizar mudanças para caracteres
  dynamic modelando(var numero) {
    var letra = numero;
    if (numero >= 10) {
      switch (numero) {
        case 10:
          letra = "A";
          break;

        case 11:
          letra = "B";
          break;

        case 12:
          letra = "C";
          break;

        case 13:
          letra = "D";
          break;

        case 14:
          letra = "E";
          break;

        case 15:
          letra = "F";
          break;
      }
    }
    return letra;
  }
}

class ModelarValores3 {
  var chave;

  var listaTeste = <String, int>{
    "A": 10,
    "B": 11,
    "C": 12,
    "D": 13,
    "E": 14,
    "F": 15
  };

  int? pegarComponente(var chave) {
    var pegar = listaTeste[chave];
    //print(pegar);
    return pegar;
  }
}

class VoltarBase {
  int baseAtual;
  String numeroAtual2;
  String numeroAtual = "0";
  int? algarismoAtual;
  int calculo = 1;
  int resultadoConversao = 0;
  List lista = [];

  VoltarBase(this.numeroAtual2, this.baseAtual);

  List separandoAlgarismos() {
    // separando algarismos individuais
    numeroAtual = numeroAtual2.toUpperCase();
    var separandoString = numeroAtual.split("").reversed.toList();
    var tamanho = separandoString.length;
    for (var contador = 0; contador < tamanho; contador += 1) {
      var separando = separandoString[contador];

      var letraNumero = int.tryParse(separando);

      if (letraNumero == null) {
        var valor = ModelarValores3().pegarComponente(separando);
        lista.add(valor);
      } else {
        lista.add(letraNumero);
      }
    }

    return lista;
  }

  int conversao() {
    //convertendo para base 10
    lista = separandoAlgarismos();

    calculo = 1;
    int tamanhoLista = lista.length;
    int soma = 0;
    for (int contador = 0; contador < tamanhoLista; contador++) {
      // multiplicando cada algarismo individual com sua potência
      resultadoConversao = lista[contador];
      soma = soma + resultadoConversao * calculo;
      calculo = calculo * baseAtual;
    }

    return soma;
  }
}
