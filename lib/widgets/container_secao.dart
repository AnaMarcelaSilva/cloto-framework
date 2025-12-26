import 'package:cloto/theme/tema_extension.dart';
import 'package:flutter/material.dart';

class ClotoContainerSecao extends StatelessWidget {
  final String? titulo;
  final String? subtitulo;
  final Widget? tituloPersonalizado;
  final List<Widget> children;
  final Color? corFundo;
  final Gradient? gradienteFundo;
  final EdgeInsetsGeometry? padding;
  final double? larguraMaxima;
  final CrossAxisAlignment alinhamento;
  final double espacamentoItens;
  final Widget? rodape;

  const ClotoContainerSecao({
    super. key,
    this.titulo,
    this.subtitulo,
    this.tituloPersonalizado,
    required this.children,
    this. corFundo,
    this. gradienteFundo,
    this.padding,
    this.larguraMaxima = 1200,
    this.alinhamento = CrossAxisAlignment.center,
    this.espacamentoItens = 24,
    this.rodape,
  });

  @override
  Widget build(BuildContext context) {
    final tema = context.tema;
    final larguraTela = MediaQuery.of(context).size.width;
    final ehMobile = larguraTela < 768;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: corFundo,
        gradient: gradienteFundo,
      ),
      padding: padding ??
          EdgeInsets.symmetric(
            horizontal: tema.espacamento * (ehMobile ? 3 : 8),
            vertical: tema.espacamento * 8,
          ),
      child: Center(
        child: ConstrainedBox(
          constraints:  BoxConstraints(
            maxWidth: larguraMaxima ?? double.infinity,
          ),
          child: Column(
            crossAxisAlignment: alinhamento,
            children: [
              if (tituloPersonalizado != null)
                tituloPersonalizado!
              else if (titulo != null)
                _buildTitulo(tema),

              if ((titulo != null || tituloPersonalizado != null) &&
                  children.isNotEmpty)
                SizedBox(height: tema.espacamento * 4),

              ... children.map((child) {
                final index = children.indexOf(child);
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: index < children.length - 1 ?  espacamentoItens : 0,
                  ),
                  child: child,
                );
              }).toList(),

              if (rodape != null) ...[
                SizedBox(height: tema.espacamento * 4),
                rodape!,
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitulo(tema) {
    return Column(
      crossAxisAlignment: alinhamento,
      children: [
        Text(
          titulo! ,
          style: TextStyle(
            fontSize: tema.textoGrande * 2,
            fontFamily:  tema.fontePrimaria,
            color: tema.cores.primary.cor,
            fontWeight: FontWeight.w800,
          ),
          textAlign: alinhamento == CrossAxisAlignment.center
              ?  TextAlign.center
              : alinhamento == CrossAxisAlignment.start
              ? TextAlign.left
              : TextAlign.right,
        ),
        if (subtitulo != null) ...[
          SizedBox(height:  tema.espacamento),
          Text(
            subtitulo!,
            style: TextStyle(
              fontSize: tema. textoPadrao * 1.2,
              fontFamily: tema. fonteSecundaria,
              color:  tema.cores.primary.cor.withOpacity(0.7),
              height: 1.6,
            ),
            textAlign: alinhamento == CrossAxisAlignment.center
                ? TextAlign.center
                : alinhamento == CrossAxisAlignment.start
                ? TextAlign.left
                : TextAlign.right,
          ),
        ],
      ],
    );
  }
}