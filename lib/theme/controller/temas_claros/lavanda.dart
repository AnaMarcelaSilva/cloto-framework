import 'package:cloto/theme/controller/cor.dart';
import 'package:cloto/theme/tema.dart';

class TemaClaroLavandaCloto {
  TemaClaroLavandaCloto._();

  static TemaCloto temaConfigurado = TemaCloto. carregar(
    id: 10,
    idioma: 'pt-BR',
    selecionado: false,
    cores: CoresCloto(
      id: 10,
      primary: CorCloto. carregar('8B5CF6'),
      primaryContent: CorCloto.carregar('FFFFFF'),
      primaryFocus: CorCloto.carregar('7C3AED'),

      secondary: CorCloto.carregar('F5F3FF'),
      secondaryContent: CorCloto.carregar('5B21B6'),
      secondaryFocus: CorCloto.carregar('EDE9FE'),

      base100: CorCloto.carregar('FFFFFF'),
      base200: CorCloto.carregar('FAF5FF'),
      base300: CorCloto.carregar('F5F3FF'),
      baseContent: CorCloto.carregar('3B0764'),

      success: CorCloto.carregar('10B981'),
      warning: CorCloto.carregar('F59E0B'),
      error: CorCloto. carregar('EF4444'),
    ),
    borderRadiusXG: 24,
    borderRadiusG: 20,
    borderRadiusM: 14,
    borderRadiusP: 8,
    espacamento: 8,
    textoPadrao: 14,
    textoGrande: 18,
    textoPequeno: 12,
    opacidadeShadow: 0.10,
    fontePrimaria: 'Montserrat',
    fonteSecundaria: 'Inter',
  );
}