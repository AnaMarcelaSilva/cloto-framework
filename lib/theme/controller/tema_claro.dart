import 'package:cloto/theme/tema.dart';

import 'cor.dart';

class TemaClaroCloto {

  TemaClaroCloto._();

  static TemaCloto temaConfigurado = TemaCloto.carregar(
    id: 1,
    idioma: 'pt-BR',
    selecionado: true,

    cores: CoresCloto(
      id: 1,
      primary: CorCloto.carregar('4F46E5'),
      primaryContent: CorCloto.carregar('FFFFFF'),
      primaryFocus: CorCloto.carregar('312E81'),

      secondary: CorCloto.carregar('F3F4F6'),
      secondaryContent: CorCloto.carregar('111827'),
      secondaryFocus: CorCloto.carregar('E5E7EB'),

      base100: CorCloto.carregar('FFFFFF'),
      base200: CorCloto.carregar('F9FAFB'),
      base300: CorCloto.carregar('E5E7EB'),
      baseContent: CorCloto.carregar('111827'),

      success: CorCloto.carregar('22C55E'),
      warning: CorCloto.carregar('FACC15'),
      error: CorCloto.carregar('EF4444'),
    ),

    borderRadiusXG: 24,
    borderRadiusG: 20,
    borderRadiusM: 14,
    borderRadiusP: 8,

    espacamento: 8,

    textoPadrao: 14,
    textoGrande: 18,
    textoPequeno: 12,

    opacidadeShadow: 0.12,

    fontePrimaria: 'Montserrat',
    fonteSecundaria: 'Inter',
  );
}