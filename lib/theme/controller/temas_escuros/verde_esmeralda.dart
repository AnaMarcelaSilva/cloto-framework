import 'package:cloto/theme/controller/cor.dart';
import 'package:cloto/theme/tema.dart';

class TemaEscuroVerdeEsmeraldaCloto {
  TemaEscuroVerdeEsmeraldaCloto._();

  static TemaCloto temaConfigurado = TemaCloto.carregar(
    id: 4,
    idioma: 'pt-BR',
    selecionado: false,
    cores: CoresCloto(
      id: 4,
      primary: CorCloto.carregar('34D399'),
      primaryContent: CorCloto.carregar('022C22'),
      primaryFocus: CorCloto.carregar('059669'),

      secondary: CorCloto.carregar('022C22'),
      secondaryContent: CorCloto.carregar('D1FAE5'),
      secondaryFocus: CorCloto.carregar('064E3B'),

      base100: CorCloto.carregar('021A14'),
      base200: CorCloto.carregar('022C22'),
      base300: CorCloto.carregar('064E3B'),
      baseContent: CorCloto.carregar('D1FAE5'),

      success: CorCloto.carregar('6EE7B7'),
      warning: CorCloto.carregar('FCD34D'),
      error: CorCloto.carregar('F87171'),
    ),
    borderRadiusXG: 24,
    borderRadiusG:  20,
    borderRadiusM: 14,
    borderRadiusP: 8,
    espacamento: 8,
    textoPadrao:  14,
    textoGrande: 18,
    textoPequeno: 12,
    opacidadeShadow: 0.18,
    fontePrimaria:  'Montserrat',
    fonteSecundaria: 'Inter',
  );
}