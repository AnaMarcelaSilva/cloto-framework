import 'package:cloto/theme/tema_extension.dart';
import 'package:flutter/material.dart';

class ClotoCardProjeto extends StatefulWidget {
  final String titulo;
  final String?  subtitulo;
  final String? imagemUrl;
  final Widget? imagemWidget;
  final List<String>? tags;
  final VoidCallback? onTap;
  final double?  largura;
  final double? larguraMaxima;
  final double? altura;

  const ClotoCardProjeto({
    super.key,
    required this. titulo,
    this.subtitulo,
    this.imagemUrl,
    this.imagemWidget,
    this.tags,
    this.onTap,
    this.largura,
    this.larguraMaxima,
    this. altura = 300,
  });

  @override
  State<ClotoCardProjeto> createState() => _ClotoCardProjetoState();
}

class _ClotoCardProjetoState extends State<ClotoCardProjeto> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final tema = context.tema;

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: widget.larguraMaxima ?? double.infinity,
        maxHeight: widget.altura ?? double.infinity,
      ),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _hovering = true),
        onExit: (_) => setState(() => _hovering = false),
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
            width: widget.largura,
            height: widget.altura,
            transform: _hovering
                ? (Matrix4.identity()..translate(0.0, -8.0))
                : Matrix4.identity(),
            decoration: BoxDecoration(
              color: tema.cores.base100.cor,
              borderRadius: BorderRadius.circular(tema.borderRadiusG),
              border: Border.all(
                color: _hovering
                    ?  tema.cores.primary.cor. withOpacity(0.5)
                    : tema.cores. base300.cor,
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: _hovering
                      ?  tema.cores.primary.cor. withOpacity(0.2)
                      : tema.cores. baseContent.cor.withOpacity(0.1),
                  blurRadius: _hovering ?  20 : 10,
                  offset: _hovering ?  const Offset(0, 10) : const Offset(0, 4),
                ),
              ],
            ),
            clipBehavior: Clip.antiAlias,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 7,
                  child: widget.imagemWidget ??
                      (widget.imagemUrl != null
                          ? Image.network(
                        widget.imagemUrl!,
                        fit: BoxFit. cover,
                      )
                          : Container(
                        color: tema.cores.base200.cor,
                        child: Icon(
                          Icons.image_outlined,
                          size: 64,
                          color: tema.cores.baseContent.cor. withOpacity(0.3),
                        ),
                      )),
                ),

                Expanded(
                  flex: 3,
                  child:  Padding(
                    padding:  EdgeInsets.all(tema. espacamento * 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment. start,
                      children: [
                        Text(
                          widget.titulo,
                          style: TextStyle(
                            fontSize: tema.textoGrande,
                            fontFamily: tema.fontePrimaria,
                            color: tema.cores.baseContent. cor,
                            fontWeight:  FontWeight.w700,
                          ),
                          maxLines:  1,
                          overflow:  TextOverflow.ellipsis,
                        ),
                        if (widget.subtitulo != null) ...[
                          SizedBox(height: tema.espacamento * 0.5),
                          Text(
                            widget. subtitulo!,
                            style: TextStyle(
                              fontSize: tema.textoPequeno,
                              fontFamily:  tema.fonteSecundaria,
                              color: tema.cores.baseContent.cor.withOpacity(0.6),
                            ),
                            maxLines:  2,
                            overflow:  TextOverflow.ellipsis,
                          ),
                        ],
                        if (widget.tags != null && widget.tags!. isNotEmpty) ...[
                          const Spacer(),
                          Wrap(
                            spacing: tema.espacamento * 0.5,
                            runSpacing: tema.espacamento * 0.5,
                            children: widget.tags!.take(3).map((tag) {
                              return Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: tema. espacamento,
                                  vertical: tema.espacamento * 0.5,
                                ),
                                decoration: BoxDecoration(
                                  color: tema. cores.primary.cor. withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(tema.borderRadiusP),
                                ),
                                child: Text(
                                  tag,
                                  style: TextStyle(
                                    fontSize: tema.textoPequeno,
                                    color: tema.cores.primary.cor,
                                    fontWeight:  FontWeight.w600,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}