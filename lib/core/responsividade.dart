enum TipoTela { mobile, tablet, desktop }

class ClotoResponsividade {
  static TipoTela tipoDaTela(double largura) {
    if (largura >= 1000) return TipoTela.desktop;
    if (largura >= 700) return TipoTela.tablet;
    return TipoTela.mobile;
  }

}
