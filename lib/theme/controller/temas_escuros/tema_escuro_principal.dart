import 'package:cloto/theme/controller/cor.dart';
import 'package:cloto/theme/tema.dart';

class TemaEscuroCloto {

  TemaEscuroCloto._();

  static TemaCloto temaConfigurado = TemaCloto.carregar(
    id: 2,
    idioma: 'pt-BR',
    selecionado: false,

    cores: CoresCloto(
      id: 2,
      primary: CorCloto.carregar('818CF8'),
      primaryContent: CorCloto.carregar('111827'),
      primaryFocus: CorCloto.carregar('4338CA'),

      secondary: CorCloto.carregar('020617'),
      secondaryContent: CorCloto.carregar('E5E7EB'),
      secondaryFocus: CorCloto.carregar('111827'),

      base100: CorCloto.carregar('020617'),
      base200: CorCloto.carregar('111827'),
      base300: CorCloto.carregar('1F2937'),
      baseContent: CorCloto.carregar('E5E7EB'),

      success: CorCloto.carregar('4ADE80'),
      warning: CorCloto.carregar('FACC15'),
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

    opacidadeShadow: 0.18,

    fontePrimaria: 'Montserrat',
    fonteSecundaria: 'Inter',
  );
}