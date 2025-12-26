import 'package:cloto/theme/tema_extension.dart';
import 'package:flutter/material.dart';

enum TipoCardHabilidade {
  padrao,
  icone,
  progresso,
}

class ClotoCardHabilidade extends StatefulWidget {
  final String titulo;
  final String?  subtitulo;
  final IconData? icone;
  final Widget? iconePersonalizado;
  final String? imagemUrl;
  final Color? cor;
  final TipoCardHabilidade tipo;
  final double? nivelProgresso;
  final VoidCallback? onTap;
  final double? largura;
  final double? altura;

  const ClotoCardHabilidade({
    super.key,
    required this.titulo,
    this.subtitulo,
    this.icone,
    this.iconePersonalizado,
    this.imagemUrl,
    this.cor,
    this.tipo = TipoCardHabilidade. padrao,
    this.nivelProgresso,
    this. onTap,
    this. largura,
    this.altura,
  });

  @override
  State<ClotoCardHabilidade> createState() => _ClotoCardHabilidadeState();
}

class _ClotoCardHabilidadeState extends State<ClotoCardHabilidade> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final tema = context.tema;
    final cor = widget.cor ??  tema.cores.primary.cor;

    return MouseRegion(
      cursor: widget.onTap != null ? SystemMouseCursors.click : SystemMouseCursors.basic,
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
          width: widget.largura ?? 180,
          height: widget.altura ?? 140,
          transform: _hovering
              ? (Matrix4.identity()..scale(1.05))
              : Matrix4.identity(),
          padding: EdgeInsets.all(tema.espacamento * 2),
          decoration: BoxDecoration(
            color: tema.cores.base100.cor,
            borderRadius: BorderRadius. circular(tema.borderRadiusM),
            border: Border. all(
              color: _hovering ?  cor :  tema.cores.base300.cor,
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: _hovering
                    ? cor. withOpacity(0.2)
                    : tema.cores.baseContent.cor.withOpacity(0.08),
                blurRadius: _hovering ? 16 : 8,
                offset: _hovering ? const Offset(0, 6) : const Offset(0, 2),
              ),
            ],
          ),
          child: _buildConteudo(tema, cor),
        ),
      ),
    );
  }

  Widget _buildConteudo(tema, Color cor) {
    switch (widget.tipo) {
      case TipoCardHabilidade.icone:
        return _buildTipoIcone(tema, cor);
      case TipoCardHabilidade.progresso:
        return _buildTipoProgresso(tema, cor);
      case TipoCardHabilidade.padrao:
      default:
        return _buildTipoPadrao(tema, cor);
    }
  }

  Widget _buildTipoPadrao(tema, Color cor) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (widget.imagemUrl != null)
          Image.network(
            widget.imagemUrl!,
            width: 48,
            height: 48,
            fit: BoxFit. contain,
          )
        else if (widget.iconePersonalizado != null)
          SizedBox(
            width: 48,
            height: 48,
            child:  widget.iconePersonalizado!,
          )
        else if (widget.icone != null)
            Icon(
              widget. icone,
              size: 48,
              color: cor,
            ),
        SizedBox(height: tema.espacamento),
        Text(
          widget. titulo,
          style: TextStyle(
            fontSize: tema.textoPadrao,
            fontFamily: tema.fontePrimaria,
            color:  tema.cores.baseContent.cor,
            fontWeight: FontWeight. w700,
          ),
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (widget.subtitulo != null) ...[
          SizedBox(height: tema.espacamento * 0.5),
          Text(
            widget.subtitulo!,
            style: TextStyle(
              fontSize: tema.textoPequeno,
              fontFamily: tema.fonteSecundaria,
              color: tema.cores.baseContent.cor.withOpacity(0.6),
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ],
    );
  }

  Widget _buildTipoIcone(tema, Color cor) {
    return Row(
      children: [
        if (widget.imagemUrl != null)
          Image.network(
            widget.imagemUrl!,
            width:  40,
            height: 40,
            fit: BoxFit. contain,
          )
        else if (widget.iconePersonalizado != null)
          SizedBox(
            width: 40,
            height: 40,
            child: widget.iconePersonalizado!,
          )
        else if (widget.icone != null)
            Icon(
              widget.icone,
              size: 40,
              color: cor,
            ),
        SizedBox(width: tema.espacamento * 1.5),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.titulo,
                style: TextStyle(
                  fontSize: tema.textoPadrao,
                  fontFamily: tema.fontePrimaria,
                  color: tema.cores.baseContent.cor,
                  fontWeight: FontWeight.w700,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              if (widget.subtitulo != null) ...[
                SizedBox(height: tema. espacamento * 0.5),
                Text(
                  widget.subtitulo!,
                  style: TextStyle(
                    fontSize: tema.textoPequeno,
                    fontFamily:  tema.fonteSecundaria,
                    color: tema.cores.baseContent.cor.withOpacity(0.6),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTipoProgresso(tema, Color cor) {
    final progresso = widget.nivelProgresso ?? 0.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            if (widget.icone != null) ...[
              Icon(
                widget.icone,
                size: 24,
                color: cor,
              ),
              SizedBox(width: tema. espacamento),
            ],
            Expanded(
              child: Text(
                widget.titulo,
                style: TextStyle(
                  fontSize: tema.textoPadrao,
                  fontFamily: tema.fontePrimaria,
                  color:  tema.cores.baseContent.cor,
                  fontWeight: FontWeight.w700,
                ),
                maxLines: 1,
                overflow: TextOverflow. ellipsis,
              ),
            ),
            Text(
              '${(progresso * 100).toInt()}%',
              style: TextStyle(
                fontSize: tema. textoPequeno,
                fontFamily: tema.fonteSecundaria,
                color: cor,
                fontWeight: FontWeight. w700,
              ),
            ),
          ],
        ),
        SizedBox(height: tema.espacamento),
        ClipRRect(
          borderRadius:  BorderRadius.circular(tema.borderRadiusP),
          child: LinearProgressIndicator(
            value:  progresso,
            backgroundColor: tema.cores.base200.cor,
            valueColor: AlwaysStoppedAnimation<Color>(cor),
            minHeight: 8,
          ),
        ),
        if (widget.subtitulo != null) ...[
          SizedBox(height: tema.espacamento),
          Text(
            widget. subtitulo!,
            style: TextStyle(
              fontSize:  tema.textoPequeno,
              fontFamily: tema.fonteSecundaria,
              color:  tema.cores.baseContent.cor.withOpacity(0.6),
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ],
    );
  }
}