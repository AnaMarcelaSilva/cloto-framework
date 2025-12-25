import 'package:cloto/theme/controller/tema_claro.dart';
import 'package:cloto/theme/controller/tema_escuro.dart';
import 'package:cloto/theme/tema.dart';

class TemasCloto {
  static TemasCloto? _instancia;

  factory TemasCloto() {
    _instancia ??= TemasCloto._();
    return _instancia!;
  }

  TemasCloto._();

  static TemaCloto get temaSelecionado => _temaSelecionado;

  static TemaCloto _temaSelecionado = TemaClaroCloto.temaConfigurado;


  static void selecionarTema(TemaCloto tema) {
    _temaSelecionado = tema;
  }

  static TemaCloto temaClaro = TemaClaroCloto.temaConfigurado;

  static void redefinirTemaClaro() {
    temaClaro = TemaClaroCloto.temaConfigurado;
    _temaSelecionado = temaClaro;
  }

  static void definirNovoTemaClaro(TemaCloto novoTema) {
    temaClaro = novoTema;
    _temaSelecionado = temaClaro;
  }

  static void selecionarTemaClaro() {
    _temaSelecionado = temaClaro;
  }

  static TemaCloto temaEscuro = TemaEscuroCloto.temaConfigurado;

  static redefinirTemaEscuro() {
    temaEscuro = TemaEscuroCloto.temaConfigurado;
    _temaSelecionado = temaEscuro;
  }

  static selecionarTemaEscuro() {
    _temaSelecionado = temaEscuro;
  }

  static void definirNovoTemaEscuro(TemaCloto novoTema) {
    temaEscuro = novoTema;
    _temaSelecionado = temaEscuro;
  }

}