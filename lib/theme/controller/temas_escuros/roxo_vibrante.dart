import 'package:cloto/theme/controller/cor.dart';
import 'package:cloto/theme/tema.dart';

class TemaEscuroRoxoCloto {
  TemaEscuroRoxoCloto._();

  static TemaCloto temaConfigurado = TemaCloto.carregar(
    id: 3,
    idioma: 'pt-BR',
    selecionado: false,
    cores: CoresCloto(
      id: 3,
      primary: CorCloto. carregar('A78BFA'),
      primaryContent: CorCloto.carregar('1F1B2E'),
      primaryFocus: CorCloto.carregar('7C3AED'),

      secondary: CorCloto.carregar('1F1B2E'),
      secondaryContent: CorCloto.carregar('E9D5FF'),
      secondaryFocus:  CorCloto.carregar('2D2640'),

      base100: CorCloto.carregar('0F0D1A'),
      base200: CorCloto.carregar('1F1B2E'),
      base300: CorCloto. carregar('2D2640'),
      baseContent: CorCloto.carregar('E9D5FF'),

      success: CorCloto.carregar('86EFAC'),
      warning: CorCloto.carregar('FCD34D'),
      error: CorCloto.carregar('FCA5A5'),
    ),
    borderRadiusXG: 24,
    borderRadiusG: 20,
    borderRadiusM: 14,
    borderRadiusP: 8,
    espacamento: 8,
    textoPadrao:  14,
    textoGrande: 18,
    textoPequeno: 12,
    opacidadeShadow: 0.2,
    fontePrimaria:  'Montserrat',
    fonteSecundaria: 'Inter',
  );
}