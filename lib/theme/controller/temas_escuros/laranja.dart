import 'package:cloto/theme/controller/cor.dart';
import 'package:cloto/theme/tema.dart';

class TemaEscuroLaranjaCloto {
  TemaEscuroLaranjaCloto._();

  static TemaCloto temaConfigurado = TemaCloto.carregar(
    id: 5,
    idioma: 'pt-BR',
    selecionado:  false,
    cores: CoresCloto(
      id: 5,
      primary: CorCloto.carregar('FCD34D'),
      primaryContent:  CorCloto.carregar('2D1B00'),
      primaryFocus: CorCloto.carregar('F59E0B'),

      secondary: CorCloto.carregar('2D1B00'),
      secondaryContent: CorCloto.carregar('FEF3C7'),
      secondaryFocus: CorCloto.carregar('451A03'),

      base100: CorCloto.carregar('1A1000'),
      base200: CorCloto.carregar('2D1B00'),
      base300: CorCloto.carregar('451A03'),
      baseContent:  CorCloto.carregar('FEF3C7'),

      success: CorCloto. carregar('86EFAC'),
      warning: CorCloto.carregar('FB923C'),
      error: CorCloto.carregar('F87171'),
    ),
    borderRadiusXG: 24,
    borderRadiusG: 20,
    borderRadiusM: 14,
    borderRadiusP: 8,
    espacamento: 8,
    textoPadrao: 14,
    textoGrande: 18,
    textoPequeno: 12,
    opacidadeShadow: 0.16,
    fontePrimaria: 'Montserrat',
    fonteSecundaria: 'Inter',
  );
}