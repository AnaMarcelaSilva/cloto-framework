import 'package:flutter/foundation.dart';
import 'package:cloto/theme/tema.dart';
import 'package:cloto/theme/controller/temas_claros/tema_claro_principal.dart';
import 'package:cloto/theme/controller/temas_claros/lavanda.dart';
import 'package:cloto/theme/controller/temas_claros/menta.dart';
import 'package:cloto/theme/controller/temas_claros/coral.dart';
import 'package:cloto/theme/controller/temas_escuros/tema_escuro_principal.dart';
import 'package:cloto/theme/controller/temas_escuros/roxo_vibrante.dart';
import 'package:cloto/theme/controller/temas_escuros/verde_esmeralda.dart';
import 'package:cloto/theme/controller/temas_escuros/laranja.dart';
import 'package:cloto/theme/controller/temas_escuros/rose.dart';
import 'package:cloto/theme/controller/temas_escuros/cinza_azulado.dart';
import 'package:cloto/theme/controller/temas_escuros/azul_oceano.dart';
import 'package:cloto/theme/controller/temas_escuros/vermelho_profundo.dart';

/// Gerenciador de estado do tema Cloto
/// Singleton com ChangeNotifier para reatividade
class ClotoTemaNotifier extends ChangeNotifier {
  static ClotoTemaNotifier?  _instancia;

  factory ClotoTemaNotifier() {
    _instancia ??= ClotoTemaNotifier._();
    return _instancia!;
  }

  ClotoTemaNotifier._();

  TemaCloto _temaAtual = TemaClaroCloto.temaConfigurado;

  TemaCloto get temaClaro => TemaClaroCloto. temaConfigurado;
  TemaCloto get temaClaroLavanda => TemaClaroLavandaCloto.temaConfigurado;
  TemaCloto get temaClaroMenta => TemaClaroMentaCloto.temaConfigurado;
  TemaCloto get temaklaroCoral => TemaClaroCoralCloto.temaConfigurado;

  TemaCloto get temaEscuro => TemaEscuroCloto.temaConfigurado;
  TemaCloto get temaEscuroRoxo => TemaEscuroRoxoCloto.temaConfigurado;
  TemaCloto get temaEscuroVerdeEsmeralda => TemaEscuroVerdeEsmeraldaCloto.temaConfigurado;
  TemaCloto get temaEscuroLaranja => TemaEscuroLaranjaCloto.temaConfigurado;
  TemaCloto get temaEscuroRosa => TemaEscuroRosaCloto.temaConfigurado;
  TemaCloto get temaEscuroCinzaAzulado => TemaEscuroCinzaAzuladoCloto.temaConfigurado;
  TemaCloto get temaEscuroAzulOceano => TemaEscuroAzulOceanoCloto.temaConfigurado;
  TemaCloto get temaEscuroVermelhoProfundo => TemaEscuroVermelhoProfundoCloto.temaConfigurado;


  List<TemaCloto> get temasClaros => [
    temaClaro,
    temaClaroLavanda,
    temaClaroMenta,
    temaklaroCoral,
  ];

  List<TemaCloto> get temasEscuros => [
    temaEscuro,
    temaEscuroRoxo,
    temaEscuroVerdeEsmeralda,
    temaEscuroLaranja,
    temaEscuroRosa,
    temaEscuroCinzaAzulado,
    temaEscuroAzulOceano,
    temaEscuroVermelhoProfundo,
  ];

  List<TemaCloto> get todosTemas => [
    ... temasClaros,
    ...temasEscuros,
  ];


  TemaCloto get temaAtual => _temaAtual;


  void trocarTema(TemaCloto novoTema) {
    if (_temaAtual. id != novoTema.id) {
      _temaAtual = novoTema;
      notifyListeners();
    }
  }

  void alternarTema() {
    if (_temaAtual.id == temaClaro.id) {
      trocarTema(temaEscuro);
    } else {
      trocarTema(temaClaro);
    }
  }


  void usarTemaClaro() => trocarTema(temaClaro);
  void usarTemaClaroLavanda() => trocarTema(temaClaroLavanda);
  void usarTemaClaroMenta() => trocarTema(temaClaroMenta);
  void usarTemaClaroCoral() => trocarTema(temaklaroCoral);


  void usarTemaEscuro() => trocarTema(temaEscuro);
  void usarTemaEscuroRoxo() => trocarTema(temaEscuroRoxo);
  void usarTemaEscuroVerdeEsmeralda() => trocarTema(temaEscuroVerdeEsmeralda);
  void usarTemaEscuroLaranja() => trocarTema(temaEscuroLaranja);
  void usarTemaEscuroRosa() => trocarTema(temaEscuroRosa);
  void usarTemaEscuroCinzaAzulado() => trocarTema(temaEscuroCinzaAzulado);
  void usarTemaEscuroAzulOceano() => trocarTema(temaEscuroAzulOceano);
  void usarTemaEscuroVermelhoProfundo() => trocarTema(temaEscuroVermelhoProfundo);


  bool get ehTemaEscuro => temasEscuros.any((t) => t.id == _temaAtual.id);

  bool get ehTemaClaro => temasClaros.any((t) => t.id == _temaAtual.id);
}