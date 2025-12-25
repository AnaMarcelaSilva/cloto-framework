import 'package:cloto/theme/controller/cor.dart';
import 'package:cloto/theme/tema.dart';

class TemaEscuroVermelhoProfundoCloto {
  TemaEscuroVermelhoProfundoCloto._();

  static TemaCloto temaConfigurado = TemaCloto.carregar(
    id: 9,
    idioma: 'pt-BR',
    selecionado: false,
    cores: CoresCloto(
      id: 9,
      primary: CorCloto. carregar('EF4444'),
      primaryContent: CorCloto.carregar('FEFEFE'),
      primaryFocus: CorCloto.carregar('B91C1C'),

      secondary: CorCloto.carregar('2D0A0F'),
      secondaryContent: CorCloto.carregar('FEE2E2'),
      secondaryFocus:  CorCloto.carregar('450A0A'),

      base100: CorCloto.carregar('1A0000'),
      base200: CorCloto.carregar('2D0A0F'),
      base300: CorCloto.carregar('450A0A'),
      baseContent: CorCloto.carregar('FEE2E2'),

      success: CorCloto.carregar('86EFAC'),
      warning: CorCloto.carregar('FCD34D'),
      error: CorCloto. carregar('FCA5A5'),
    ),
    borderRadiusXG: 24,
    borderRadiusG: 20,
    borderRadiusM: 14,
    borderRadiusP: 8,
    espacamento: 8,
    textoPadrao: 14,
    textoGrande: 18,
    textoPequeno: 12,
    opacidadeShadow: 0.2,
    fontePrimaria: 'Montserrat',
    fonteSecundaria: 'Inter',
  );
}