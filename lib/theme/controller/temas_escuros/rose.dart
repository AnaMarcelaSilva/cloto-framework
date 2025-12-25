import 'package:cloto/theme/controller/cor.dart';
import 'package:cloto/theme/tema.dart';

class TemaEscuroRosaCloto {
  TemaEscuroRosaCloto._();

  static TemaCloto temaConfigurado = TemaCloto.carregar(
    id: 6,
    idioma: 'pt-BR',
    selecionado: false,
    cores: CoresCloto(
      id: 6,
      primary: CorCloto.carregar('FB7185'),
      primaryContent: CorCloto.carregar('2D0A0F'),
      primaryFocus: CorCloto.carregar('E11D48'),

      secondary: CorCloto.carregar('2D0A0F'),
      secondaryContent: CorCloto.carregar('FFE4E6'),
      secondaryFocus:  CorCloto.carregar('4C0519'),

      base100: CorCloto.carregar('1A0509'),
      base200: CorCloto.carregar('2D0A0F'),
      base300: CorCloto.carregar('4C0519'),
      baseContent: CorCloto.carregar('FFE4E6'),

      success: CorCloto.carregar('86EFAC'),
      warning: CorCloto.carregar('FCD34D'),
      error: CorCloto.carregar('FCA5A5'),
    ),
    borderRadiusXG: 24,
    borderRadiusG: 20,
    borderRadiusM: 14,
    borderRadiusP: 8,
    espacamento: 8,
    textoPadrao: 14,
    textoGrande: 18,
    textoPequeno: 12,
    opacidadeShadow: 0.18,
    fontePrimaria: 'Montserrat',
    fonteSecundaria: 'Inter',
  );
}