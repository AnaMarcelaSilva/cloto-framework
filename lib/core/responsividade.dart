import 'package:flutter/material.dart';

enum TipoTela { mobile, tablet, desktop }

class ClotoResponsividade {
  static TipoTela tipoDaTela(double largura) {
    if (largura >= 1000) return TipoTela.desktop;
    if (largura >= 700) return TipoTela.tablet;
    return TipoTela.mobile;
  }

  static double tamanhoDaTela(BuildContext context) {
    final largura = MediaQuery.of(context).size.width;
    return largura;
  }

  static bool mobile(BuildContext contexto) => MediaQuery.of(contexto).size.width < 700;

  static bool tablet(BuildContext contexto) {
    final largura = MediaQuery.of(contexto).size.width;
    return largura >= 700 && largura < 1000;
  }

  static bool desktop(BuildContext contexto) => MediaQuery.of(contexto).size.width >= 1000;
}
