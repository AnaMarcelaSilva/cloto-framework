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
}
