import 'package:cloto/cloto.dart';
import 'package:cloto/theme/tema_extension.dart';
import 'package:flutter/material.dart';

class ClotoSecaoPrincipal extends StatelessWidget {
  final String? imagemUrl;
  final Widget? imagemWidget;
  final String titulo;
  final String? tituloDestaque;
  final String subtitulo;
  final String? descricao;
  final List<Widget>? acoes;
  final AlignmentGeometry alinhamentoTexto;
  final AlignmentGeometry alinhamentoImagem;
  final double altura;
  final Color? corFundo;
  final Gradient? gradienteFundo;
  final Widget? backgroundWidget;

  const ClotoSecaoPrincipal({
    super.key,
    this.imagemUrl,
    this.imagemWidget,
    required this.titulo,
    this.tituloDestaque,
    required this.subtitulo,
    this.descricao,
    this.acoes,
    this.alinhamentoTexto = Alignment.centerLeft,
    this.alinhamentoImagem = Alignment.centerRight,
    this.altura = 600,
    this.corFundo,
    this.gradienteFundo,
    this.backgroundWidget,
  });

  @override
  Widget build(BuildContext context) {
    final tema = context.tema;
    final largura = MediaQuery.of(context).size.width;
    final ehMobile = largura < 768;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: corFundo ?? tema.cores.base200.cor, gradient: gradienteFundo),
      child: Stack(
        children: [
          if (backgroundWidget != null) Positioned.fill(child: backgroundWidget!),

          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: tema.espacamento * (ehMobile ? 3 : 8),
              vertical: tema.espacamento * 4,
            ),
            child: ehMobile ? _buildMobileLayout(tema, context) : _buildDesktopLayout(tema, context),
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout(tema, BuildContext contexto) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (alinhamentoImagem == Alignment.centerLeft) ...[
          Expanded(flex: 5, child: _buildImagem(contexto)),
          SizedBox(width: tema.espacamento * 4),
        ],
        Expanded(flex: 7, child: _buildConteudo(tema)),
        if (alinhamentoImagem == Alignment.centerRight) ...[
          SizedBox(width: tema.espacamento * 4),
          Expanded(flex: 5, child: _buildImagem(contexto)),
        ],
      ],
    );
  }

  Widget _buildMobileLayout(tema, BuildContext contexto) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (imagemWidget != null || imagemUrl != null) ...[_buildImagem(contexto), SizedBox(height: tema.espacamento * 3)],
        _buildConteudo(tema),
      ],
    );
  }

  Widget _buildImagem(BuildContext contexto) {
    return conteudoImagem();
  }

  Widget conteudoImagem() {
    if (imagemWidget != null) return imagemWidget!;
    if (imagemUrl != null) {
      return ClipRRect(borderRadius: BorderRadius.circular(16), child: Image.network(imagemUrl!, fit: BoxFit.cover));
    }
    return const SizedBox.shrink();
  }

  Widget _buildConteudo(tema) {
    return Column(
      crossAxisAlignment:
          alinhamentoTexto == Alignment.centerLeft
              ? CrossAxisAlignment.start
              : alinhamentoTexto == Alignment.center
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(
          textAlign:
              alinhamentoTexto == Alignment.centerLeft
                  ? TextAlign.left
                  : alinhamentoTexto == Alignment.center
                  ? TextAlign.center
                  : TextAlign.right,
          text: TextSpan(
            children: [
              TextSpan(
                text: titulo,
                style: TextStyle(
                  fontSize: tema.textoGrande * 2.5,
                  fontFamily: tema.fontePrimaria,
                  color: tema.cores.baseContent.cor,
                  fontWeight: FontWeight.w800,
                  height: 1.2,
                ),
              ),
              if (tituloDestaque != null)
                TextSpan(
                  text: ' $tituloDestaque',
                  style: TextStyle(
                    fontSize: tema.textoGrande * 2.5,
                    fontFamily: tema.fontePrimaria,
                    color: tema.cores.primary.cor,
                    fontWeight: FontWeight.w800,
                    height: 1.2,
                  ),
                ),
            ],
          ),
        ),

        SizedBox(height: tema.espacamento * 2),

        Text(
          subtitulo,
          textAlign:
              alinhamentoTexto == Alignment.centerLeft
                  ? TextAlign.left
                  : alinhamentoTexto == Alignment.center
                  ? TextAlign.center
                  : TextAlign.right,
          style: TextStyle(
            fontSize: tema.textoGrande * 1.2,
            fontFamily: tema.fontePrimaria,
            color: tema.cores.baseContent.cor.withOpacity(0.8),
            fontWeight: FontWeight.w600,
          ),
        ),

        if (descricao != null) ...[
          SizedBox(height: tema.espacamento * 2),
          Text(
            descricao!,
            textAlign:
                alinhamentoTexto == Alignment.centerLeft
                    ? TextAlign.left
                    : alinhamentoTexto == Alignment.center
                    ? TextAlign.center
                    : TextAlign.right,
            style: TextStyle(
              fontSize: tema.textoPadrao * 1.1,
              fontFamily: tema.fonteSecundaria,
              color: tema.cores.baseContent.cor.withOpacity(0.7),
              height: 1.6,
            ),
          ),
        ],

        if (acoes != null && acoes!.isNotEmpty) ...[
          SizedBox(height: tema.espacamento * 3),
          Wrap(
            spacing: tema.espacamento * 2,
            runSpacing: tema.espacamento,
            alignment:
                alinhamentoTexto == Alignment.centerLeft
                    ? WrapAlignment.start
                    : alinhamentoTexto == Alignment.center
                    ? WrapAlignment.center
                    : WrapAlignment.end,
            children: acoes!,
          ),
        ],
      ],
    );
  }
}
