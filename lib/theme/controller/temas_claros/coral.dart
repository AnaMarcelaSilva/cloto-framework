import 'package:cloto/theme/controller/cor.dart';
import 'package:cloto/theme/tema.dart';

class TemaClaroCoralCloto {
  TemaClaroCoralCloto._();

  static TemaCloto temaConfigurado = TemaCloto.carregar(
    id: 12,
    idioma: 'pt-BR',
    selecionado: false,
    cores: CoresCloto(
      id: 12,
      primary: CorCloto.carregar('F97316'),
      primaryContent: CorCloto.carregar('FFFFFF'),
      primaryFocus: CorCloto.carregar('EA580C'),

      secondary: CorCloto.carregar('FFF7ED'),
      secondaryContent: CorCloto.carregar('9A3412'),
      secondaryFocus:  CorCloto.carregar('FFEDD5'),

      base100: CorCloto.carregar('FFFFFF'),
      base200: CorCloto.carregar('FFF7ED'),
      base300: CorCloto.carregar('FFEDD5'),
      baseContent: CorCloto.carregar('7C2D12'),

      success: CorCloto.carregar('22C55E'),
      warning: CorCloto.carregar('FACC15'),
      error: CorCloto.carregar('DC2626'),
    ),
    borderRadiusXG: 24,
    borderRadiusG:  20,
    borderRadiusM: 14,
    borderRadiusP: 8,
    espacamento: 8,
    textoPadrao:  14,
    textoGrande: 18,
    textoPequeno: 12,
    opacidadeShadow: 0.10,
    fontePrimaria: 'Montserrat',
    fonteSecundaria: 'Inter',
  );
}