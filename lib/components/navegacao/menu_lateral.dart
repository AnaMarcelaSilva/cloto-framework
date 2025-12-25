import 'package:cloto/theme/tema_extension.dart';
import 'package:flutter/material.dart';
import 'item_menu_lateral.dart';

class ClotoMenuLateral extends StatefulWidget {
  final bool aberto;
  final double largura;

  final String? titulo;
  final Widget? logo;

  final Widget? cabecalho;
  final Widget? rodape;

  final List<ClotoItemMenuLateral> itens;

  final Alignment? alinhamento;

  const ClotoMenuLateral({
    super.key,
    this.aberto = true,
    this.largura = 260,
    this.titulo,
    this.logo,
    this.cabecalho,
    this.rodape,
    required this.itens,
    this.alinhamento = Alignment.topLeft,
  });

  @override
  State<ClotoMenuLateral> createState() => _ClotoMenuLateralState();
}

class _ClotoMenuLateralState extends State<ClotoMenuLateral> {
  late bool aberto;

  @override
  void initState() {
    super.initState();
    aberto = widget.aberto;
  }

  void alternar() {
    setState(() => aberto = !aberto);
  }

  @override
  Widget build(BuildContext context) {
    final tema = context.tema;

    if (!aberto) {
      return Align(
        alignment: widget.alinhamento!,
        child: Padding(
          padding: EdgeInsets.all(tema.espacamento),
          child: FloatingActionButton.small(
            onPressed: alternar,
            backgroundColor: tema.cores.primary.cor,
            child: Icon(Icons.menu, color: tema.cores.primaryContent.cor),
          ),
        ),
      );
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 220),
      curve: Curves.easeOut,
      constraints: BoxConstraints(maxWidth: widget.largura),
      padding: EdgeInsets.all(tema.espacamento * 2),
      decoration: BoxDecoration(
        color: tema.cores.base100.cor,
        border: Border(right: BorderSide(color: tema.cores.base300.cor.withOpacity(.6))),
        boxShadow: [
          BoxShadow(
            blurRadius: 12,
            offset: const Offset(2, 0),
            color: tema.cores.baseContent.cor.withOpacity(tema.opacidadeShadow),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (widget.logo != null) widget.logo!,

              if (widget.titulo != null)
                Padding(
                  padding: EdgeInsets.only(left: tema.espacamento),
                  child: Text(
                    widget.titulo!,
                    style: TextStyle(
                      fontSize: tema.textoGrande,
                      fontFamily: tema.fontePrimaria,
                      color: tema.cores.baseContent.cor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

              IconButton(
                onPressed: alternar,
                tooltip: "Fechar menu",
                icon: Icon(Icons.menu_open, color: tema.cores.baseContent.cor),
              ),
            ],
          ),

          if (widget.cabecalho != null) ...[SizedBox(height: tema.espacamento * 1.5), widget.cabecalho!],

          SizedBox(height: tema.espacamento),

          Flexible(child: ListView(children: widget.itens)),

          if (widget.rodape != null) ...[
            const SizedBox(height: 8),
            Divider(color: tema.cores.base300.cor.withOpacity(.5)),
            SizedBox(height: tema.espacamento),
            widget.rodape!,
          ],
        ],
      ),
    );
  }
}
