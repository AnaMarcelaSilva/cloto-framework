import 'package:cloto/theme/controller/cor.dart';
import 'package:cloto/theme/tema.dart';

class TemaClaroMentaCloto {
  TemaClaroMentaCloto._();

  static TemaCloto temaConfigurado = TemaCloto.carregar(
    id: 11,
    idioma: 'pt-BR',
    selecionado: false,
    cores: CoresCloto(
      id: 11,
      primary: CorCloto.carregar('14B8A6'),
      primaryContent: CorCloto.carregar('FFFFFF'),
      primaryFocus:  CorCloto.carregar('0D9488'),

      secondary: CorCloto.carregar('F0FDFA'),
      secondaryContent: CorCloto.carregar('115E59'),
      secondaryFocus:  CorCloto.carregar('CCFBF1'),

      base100: CorCloto.carregar('FFFFFF'),
      base200: CorCloto.carregar('F0FDFA'),
      base300: CorCloto.carregar('CCFBF1'),
      baseContent: CorCloto.carregar('134E4A'),

      success: CorCloto.carregar('22C55E'),
      warning: CorCloto.carregar('F59E0B'),
      error: CorCloto.carregar('EF4444'),
    ),
    borderRadiusXG: 24,
    borderRadiusG: 20,
    borderRadiusM:  14,
    borderRadiusP: 8,
    espacamento: 8,
    textoPadrao: 14,
    textoGrande:  18,
    textoPequeno: 12,
    opacidadeShadow: 0.08,
    fontePrimaria:  'Montserrat',
    fonteSecundaria: 'Inter',
  );
}