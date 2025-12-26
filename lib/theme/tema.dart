import 'dart:ui';

import 'controller/cor.dart';

class TemaCloto {
  final int id;
  final String idioma;

  final CoresCloto cores;

  bool selecionado;

  final double borderRadiusXG;
  final double borderRadiusG;
  final double borderRadiusM;
  final double borderRadiusP;

  final double espacamento;

  final double textoPadrao;
  final double textoGrande;
  final double textoPequeno;

  final double opacidadeShadow;

  final String fontePrimaria;
  final String fonteSecundaria;

  TemaCloto._({
    required this.id,
    required this.idioma,
    required this.cores,
    required this.selecionado,
    required this.borderRadiusXG,
    required this.borderRadiusG,
    required this.borderRadiusM,
    required this.borderRadiusP,
    required this.espacamento,
    required this.textoPadrao,
    required this.textoGrande,
    required this.textoPequeno,
    required this.opacidadeShadow,
    required this.fontePrimaria,
    required this.fonteSecundaria,
  });

  factory TemaCloto.carregar({
    required int id,
    required String idioma,
    required CoresCloto cores,
    required bool selecionado,
    required double borderRadiusXG,
    required double borderRadiusG,
    required double borderRadiusM,
    required double borderRadiusP,
    required double espacamento,
    required double textoPadrao,
    required double textoGrande,
    required double textoPequeno,
    required double opacidadeShadow,
    required String fontePrimaria,
    required String fonteSecundaria,
  }) {
    return TemaCloto._(
      id: id,
      idioma: idioma,
      cores: cores,
      selecionado: selecionado,
      borderRadiusXG: borderRadiusXG,
      borderRadiusG: borderRadiusG,
      borderRadiusM: borderRadiusM,
      borderRadiusP: borderRadiusP,
      espacamento: espacamento,
      textoPadrao: textoPadrao,
      textoGrande: textoGrande,
      textoPequeno: textoPequeno,
      opacidadeShadow: opacidadeShadow,
      fontePrimaria: fontePrimaria,
      fonteSecundaria: fonteSecundaria,
    );
  }

  static TemaCloto customizado({required Color corPrimaria, required Color corSecundaria, required Color corBase}) {
    return TemaCloto._(
      id: 0,
      idioma: 'pt',
      cores: CoresCloto(
        id: 0,
        primary: CorCloto.carregar(corPrimaria.value.toRadixString(16).substring(2)),
        primaryContent: CorCloto.carregar('FFFFFF'),
        primaryFocus: CorCloto.carregar('CCCCCC'),
        secondary: CorCloto.carregar(corSecundaria.value.toRadixString(16).substring(2)),
        secondaryContent: CorCloto.carregar('FFFFFF'),
        secondaryFocus: CorCloto.carregar('CCCCCC'),
        base100: CorCloto.carregar(corBase.value.toRadixString(16).substring(2)),
        base200: CorCloto.carregar(corBase.value.toRadixString(16).substring(2)),
        base300: CorCloto.carregar(corBase.value.toRadixString(16).substring(2)),
        baseContent: CorCloto.carregar('000000'),
        success: CorCloto.carregar('28A745'),
        warning: CorCloto.carregar('FFC107'),
        error: CorCloto.carregar('DC3545'),
      ),
      selecionado: false,
      borderRadiusXG: 16.0,
      borderRadiusG: 12.0,
      borderRadiusM: 8.0,
      borderRadiusP: 4.0,
      espacamento: 8.0,
      textoPadrao: 14.0,
      textoGrande: 18.0,
      textoPequeno: 12.0,
      opacidadeShadow: 0.2,
      fontePrimaria: 'Roboto',
      fonteSecundaria: 'OpenSans',
    );
  }
}
