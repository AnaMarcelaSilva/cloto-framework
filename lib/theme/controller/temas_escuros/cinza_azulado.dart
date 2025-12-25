import 'package:cloto/theme/controller/cor.dart';
import 'package:cloto/theme/tema.dart';

class TemaEscuroCinzaAzuladoCloto {
  TemaEscuroCinzaAzuladoCloto._();

  static TemaCloto temaConfigurado = TemaCloto. carregar(
    id: 7,
    idioma: 'pt-BR',
    selecionado: false,
    cores: CoresCloto(
      id: 7,
      primary: CorCloto.carregar('94A3B8'),
      primaryContent: CorCloto.carregar('0F172A'),
      primaryFocus:  CorCloto.carregar('64748B'),

      secondary: CorCloto.carregar('1E293B'),
      secondaryContent:  CorCloto.carregar('E2E8F0'),
      secondaryFocus: CorCloto.carregar('334155'),

      base100: CorCloto.carregar('020617'),
      base200: CorCloto.carregar('0F172A'),
      base300: CorCloto.carregar('1E293B'),
      baseContent: CorCloto.carregar('E2E8F0'),

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
    opacidadeShadow: 0.2,
    fontePrimaria:  'Montserrat',
    fonteSecundaria: 'Inter',
  );
}