import 'package:cloto/theme/controller/cor.dart';
import 'package:cloto/theme/tema.dart';

class TemaEscuroAzulOceanoCloto {
  TemaEscuroAzulOceanoCloto._();

  static TemaCloto temaConfigurado = TemaCloto.carregar(
    id: 8,
    idioma: 'pt-BR',
    selecionado: false,
    cores: CoresCloto(
      id: 8,
      primary: CorCloto.carregar('38BDF8'),
      primaryContent: CorCloto.carregar('082F49'),
      primaryFocus: CorCloto.carregar('0284C7'),

      secondary: CorCloto.carregar('082F49'),
      secondaryContent: CorCloto.carregar('E0F2FE'),
      secondaryFocus:  CorCloto.carregar('0C4A6E'),

      base100: CorCloto.carregar('051923'),
      base200: CorCloto.carregar('082F49'),
      base300: CorCloto.carregar('0C4A6E'),
      baseContent: CorCloto.carregar('E0F2FE'),

      success: CorCloto.carregar('86EFAC'),
      warning: CorCloto.carregar('FCD34D'),
      error: CorCloto.carregar('F87171'),
    ),
    borderRadiusXG: 24,
    borderRadiusG: 20,
    borderRadiusM: 14,
    borderRadiusP:  8,
    espacamento:  8,
    textoPadrao: 14,
    textoGrande: 18,
    textoPequeno: 12,
    opacidadeShadow: 0.18,
    fontePrimaria:  'Montserrat',
    fonteSecundaria: 'Inter',
  );
}