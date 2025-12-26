import 'package:cloto/cloto.dart';
import 'package:flutter/material.dart';

enum TipoBotao { primario, secundario, contorno, texto, icone }

enum TamanhoBotao { pequeno, medio, grande }

class ClotoBotao extends StatefulWidget {
  final String? texto;
  final IconData? icone;
  final Widget? iconePersonalizado;
  final VoidCallback? onPressed;
  final TipoBotao tipo;
  final TamanhoBotao tamanho;
  final Color? cor;
  final bool larguraCompleta;
  final bool carregando;
  final bool posicaoIconeDireita;

  const ClotoBotao({
    super.key,
    this.texto,
    this.icone,
    this.iconePersonalizado,
    required this.onPressed,
    this.tipo = TipoBotao.primario,
    this.tamanho = TamanhoBotao.medio,
    this.cor,
    this.larguraCompleta = false,
    this.carregando = false,
    this.posicaoIconeDireita = false,
  }) : assert(texto != null || icone != null || iconePersonalizado != null);

  @override
  State<ClotoBotao> createState() => _ClotoBotaoState();
}

class _ClotoBotaoState extends State<ClotoBotao> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final tema = context.tema;
    final cor = widget.cor ?? tema.cores.primary.cor;

    final paddingHorizontal =
        widget.tamanho == TamanhoBotao.pequeno
            ? tema.espacamento * 2
            : widget.tamanho == TamanhoBotao.grande
            ? tema.espacamento * 4
            : tema.espacamento * 3;

    final paddingVertical =
        widget.tamanho == TamanhoBotao.pequeno
            ? tema.espacamento
            : widget.tamanho == TamanhoBotao.grande
            ? tema.espacamento * 2
            : tema.espacamento * 1.5;

    final fontSize =
        widget.tamanho == TamanhoBotao.pequeno
            ? tema.textoPequeno
            : widget.tamanho == TamanhoBotao.grande
            ? tema.textoGrande
            : tema.textoPadrao;

    final iconSize =
        widget.tamanho == TamanhoBotao.pequeno
            ? 16.0
            : widget.tamanho == TamanhoBotao.grande
            ? 24.0
            : 20.0;

    return MouseRegion(
      cursor: widget.onPressed != null ? SystemMouseCursors.click : SystemMouseCursors.forbidden,
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: Container(
        width: widget.larguraCompleta ? double.infinity : null,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: widget.carregando ? null : widget.onPressed,
            borderRadius: BorderRadius.circular(tema.borderRadiusM),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: paddingHorizontal, vertical: paddingVertical),
              decoration: _getDecoracao(tema, cor),
              child: _buildConteudo(tema, cor, fontSize, iconSize),
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration _getDecoracao(tema, Color cor) {
    switch (widget.tipo) {
      case TipoBotao.primario:
        return BoxDecoration(
          color:
              widget.onPressed == null
                  ? cor.withOpacity(0.5)
                  : _hovering
                  ? cor.withOpacity(0.9)
                  : cor,
          borderRadius: BorderRadius.circular(tema.borderRadiusM),
          boxShadow:
              _hovering && widget.onPressed != null
                  ? [BoxShadow(color: cor.withOpacity(0.3), blurRadius: 12, offset: const Offset(0, 4))]
                  : null,
        );

      case TipoBotao.secundario:
        return BoxDecoration(
          color:
              widget.onPressed == null
                  ? tema.cores.base200.cor
                  : _hovering
                  ? tema.cores.base300.cor
                  : tema.cores.base200.cor,
          borderRadius: BorderRadius.circular(tema.borderRadiusM),
        );

      case TipoBotao.contorno:
        return BoxDecoration(
          color: _hovering ? cor.withOpacity(0.1) : Colors.transparent,
          border: Border.all(color: widget.onPressed == null ? tema.cores.base300.cor : cor, width: 2),
          borderRadius: BorderRadius.circular(tema.borderRadiusM),
        );

      case TipoBotao.texto:
      case TipoBotao.icone:
        return BoxDecoration(
          color: _hovering ? tema.cores.base200.cor : Colors.transparent,
          borderRadius: BorderRadius.circular(tema.borderRadiusM),
        );
    }
  }

  Widget _buildConteudo(tema, Color cor, double fontSize, double iconSize) {
    final corTexto =
        widget.tipo == TipoBotao.primario
            ? Colors.white
            : widget.tipo == TipoBotao.texto || widget.tipo == TipoBotao.contorno
            ? cor
            : tema.cores.baseContent.cor;

    if (widget.carregando) {
      return SizedBox(
        width: iconSize,
        height: iconSize,
        child: CircularProgressIndicator(strokeWidth: 2, valueColor: AlwaysStoppedAnimation<Color>(corTexto)),
      );
    }

    final iconeWidget =
        widget.iconePersonalizado ??
        (widget.icone != null ? Icon(widget.icone, size: iconSize, color: corTexto) : null);

    if (widget.tipo == TipoBotao.icone) {
      return iconeWidget ?? const SizedBox();
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (iconeWidget != null && !widget.posicaoIconeDireita) ...[
          iconeWidget,
          if (widget.texto != null) SizedBox(width: tema.espacamento),
        ],
        if (widget.texto != null)
          Text(
            widget.texto!,
            style: TextStyle(
              fontSize: fontSize,
              fontFamily: tema.fontePrimaria,
              color: corTexto,
              fontWeight: FontWeight.w600,
            ),
          ),
        if (iconeWidget != null && widget.posicaoIconeDireita) ...[
          if (widget.texto != null) SizedBox(width: tema.espacamento),
          iconeWidget,
        ],
      ],
    );
  }
}
