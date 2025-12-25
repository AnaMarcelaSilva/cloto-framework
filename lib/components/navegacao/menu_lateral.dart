import 'package:cloto/theme/tema.dart';
import 'package:cloto/theme/tema_extension.dart';
import 'package:flutter/material.dart';
import 'item_menu_lateral.dart';

enum EstadoMenuLateral { expandido, compacto, escondido }

class ClotoMenuLateral extends StatefulWidget {
  final EstadoMenuLateral estadoInicial;
  final EstadoMenuLateral estadoFechado;
  final double larguraExpandido;
  final double larguraCompacto;

  final String? titulo;
  final Widget? logo;
  final Widget? cabecalho;
  final Widget? rodape;

  final List<ClotoItemMenuLateral> itens;
  final Alignment alinhamento;

  const ClotoMenuLateral({
    super.key,
    this.estadoInicial = EstadoMenuLateral.expandido,
    this.estadoFechado = EstadoMenuLateral.compacto,
    this.larguraExpandido = 260,
    this.larguraCompacto = 72,
    this.titulo,
    this.logo,
    this.cabecalho,
    this.rodape,
    required this.itens,
    this.alinhamento = Alignment.topLeft,
  }) : assert(estadoFechado != EstadoMenuLateral.expandido);

  @override
  State<ClotoMenuLateral> createState() => _ClotoMenuLateralState();
}

class _ClotoMenuLateralState extends State<ClotoMenuLateral> {
  late EstadoMenuLateral _estado;

  @override
  void initState() {
    super.initState();
    _estado = widget.estadoInicial;
  }

  void _alternarEstado() {
    setState(() {
      if (_estado == EstadoMenuLateral.expandido) {
        _estado = widget.estadoFechado;
      } else {
        _estado = EstadoMenuLateral.expandido;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final tema = context.tema;

    if (_estado == EstadoMenuLateral.escondido) {
      return Align(
        alignment: widget.alinhamento,
        child: Padding(
          padding: EdgeInsets.all(tema.espacamento * 2),
          child: FloatingActionButton.small(
            onPressed: _alternarEstado,
            backgroundColor: tema.cores.primary.cor,
            child: Icon(Icons.menu, color: tema.cores.primaryContent.cor),
          ),
        ),
      );
    }

    final bool ehCompactoDestino = _estado == EstadoMenuLateral.compacto;
    final double larguraDestino = ehCompactoDestino ? widget.larguraCompacto : widget.larguraExpandido;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
      width: larguraDestino,
      clipBehavior: Clip.hardEdge,
      padding: EdgeInsets.symmetric(
        vertical: tema.espacamento * 2,
        horizontal: tema.espacamento * (ehCompactoDestino ? 1 : 2),
      ),
      decoration: BoxDecoration(
        color: tema.cores.base100.cor,
        border: Border(right: BorderSide(color: tema.cores.base300.cor.withOpacity(0.6), width: 1)),
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
          _buildHeader(tema, ehCompactoDestino),

          if (!ehCompactoDestino && widget.cabecalho != null) ...[
            SizedBox(height: tema.espacamento * 1.5),
            widget.cabecalho!,
          ],

          SizedBox(height: tema.espacamento * 2),

          Expanded(
            child: ListView.separated(
              itemCount: widget.itens.length,
              separatorBuilder: (_, __) => SizedBox(height: tema.espacamento * 0.5),
              itemBuilder: (context, index) {
                final item = widget.itens[index];
                return ClotoItemMenuLateral(
                  icone: item.icone,
                  titulo: item.titulo,
                  ativo: item.ativo,
                  onTap: item.onTap,
                  compacto: ehCompactoDestino,
                );
              },
            ),
          ),

          if (widget.rodape != null && !ehCompactoDestino) ...[
            SizedBox(height: tema.espacamento),
            Divider(color: tema.cores.base300.cor.withOpacity(0.5)),
            SizedBox(height: tema.espacamento),
            widget.rodape!,
          ],
        ],
      ),
    );
  }

  Widget _buildHeader(TemaCloto tema, bool ehCompacto) {
    if (ehCompacto) {
      return Column(
        children: [
          if (widget.logo != null)
            SizedBox(
              width: widget.larguraCompacto,
              height: 40,
              child: FittedBox(fit: BoxFit.contain, child: widget.logo!),
            ),
          IconButton(
            onPressed: _alternarEstado,
            tooltip: "Expandir menu",
            icon: Icon(Icons.chevron_right, color: tema.cores.baseContent.cor),
            padding: EdgeInsets.zero,
          ),
          SizedBox(height: tema.espacamento),
          Divider(color: tema.cores.base300.cor.withOpacity(0.5)),
        ],
      );
    }

    return Column(
      children: [
        Row(
          children: [
            if (widget.titulo != null)
              Expanded(
                child: Text(
                  widget.titulo!,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: tema.textoGrande,
                    fontFamily: tema.fontePrimaria,
                    color: tema.cores.baseContent.cor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            else
            Spacer(),
            IconButton(
              onPressed: _alternarEstado,
              tooltip: widget.estadoFechado == EstadoMenuLateral.compacto ? "Compactar menu" : "Esconder menu",
              icon: Icon(
                widget.estadoFechado == EstadoMenuLateral.compacto ? Icons.chevron_left : Icons.close,
                color: tema.cores.baseContent.cor,
              ),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              iconSize: 24,
            ),
          ],
        ),

        SizedBox(height: tema.espacamento),

        Divider(color: tema.cores.base300.cor.withOpacity(0.5)),
      ],
    );
  }
}
