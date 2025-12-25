import 'package:cloto/theme/tema.dart';
import 'package:cloto/theme/tema_extension.dart';
import 'package:cloto/theme/tema_notifier.dart';
import 'package:flutter/material.dart';

class ClotoSeletorTema extends StatefulWidget {
  final bool exibirIcone;
  final bool exibirTexto;

  const ClotoSeletorTema({
    super.key,
    this.exibirIcone = true,
    this.exibirTexto = false,
  });

  @override
  State<ClotoSeletorTema> createState() => _ClotoSeletorTemaState();
}

class _ClotoSeletorTemaState extends State<ClotoSeletorTema> {
  bool _hovering = false;
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();

  @override
  void dispose() {
    _removeOverlay();
    super.dispose();
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  void _toggleOverlay() {
    if (_overlayEntry == null) {
      _showThemePicker();
    } else {
      _removeOverlay();
    }
  }

  void _showThemePicker() {
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
  }

  OverlayEntry _createOverlayEntry() {
    final tema = context.tema;
    final notifier = ClotoTemaNotifier();
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;
    var offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context) => GestureDetector(
        onTap: _removeOverlay,
        behavior: HitTestBehavior.translucent,
        child: Stack(
          children: [
            Positioned(
              left: offset.dx - 300 + size.width,
              top: offset.dy + size.height + 8,
              width: 320,
              child: Material(
                elevation: 12,
                borderRadius: BorderRadius.circular(tema.borderRadiusG),
                color: tema.cores.base300.cor,
                child: Container(
                  constraints: const BoxConstraints(maxHeight: 500),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(tema.borderRadiusG),
                    border: Border.all(
                      color: tema.cores.base300.cor.withOpacity(0.3),
                      width: 1,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(tema. borderRadiusG),
                    child: Column(
                      mainAxisSize: MainAxisSize. min,
                      children: [
                        Container(
                          padding: EdgeInsets.all(tema.espacamento * 2),
                          decoration:  BoxDecoration(
                            color: tema.cores.base200.cor,
                            border: Border(
                              bottom: BorderSide(
                                color: tema.cores.base300.cor. withOpacity(0.5),
                                width: 1,
                              ),
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.palette_outlined,
                                color: tema. cores.primary.cor,
                                size: 20,
                              ),
                              SizedBox(width: tema. espacamento),
                              Text(
                                'Escolha seu tema',
                                style: TextStyle(
                                  fontSize: tema.textoGrande,
                                  fontFamily: tema.fontePrimaria,
                                  color: tema.cores.baseContent. cor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),

                        Flexible(
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:  EdgeInsets.all(tema. espacamento * 2),
                                  child: Text(
                                    'Temas Claros',
                                    style:  TextStyle(
                                      fontSize: tema.textoPequeno,
                                      fontFamily: tema.fontePrimaria,
                                      color: tema. cores.baseContent.cor
                                          . withOpacity(0.6),
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                ),
                                ... notifier.temasClaros.map(
                                      (temaItem) => _CardTema(
                                    tema: temaItem,
                                    onTap: () {
                                      notifier.trocarTema(temaItem);
                                      _removeOverlay();
                                    },
                                  ),
                                ),

                                SizedBox(height: tema.espacamento),
                                Divider(
                                  color:  tema.cores.base300.cor.withOpacity(0.5),
                                  height: 1,
                                ),
                                SizedBox(height: tema.espacamento),

                                Padding(
                                  padding:  EdgeInsets.all(tema. espacamento * 2),
                                  child: Text(
                                    'Temas Escuros',
                                    style: TextStyle(
                                      fontSize: tema.textoPequeno,
                                      fontFamily: tema.fontePrimaria,
                                      color: tema. cores.baseContent.cor
                                          .withOpacity(0.6),
                                      fontWeight: FontWeight.w600,
                                      letterSpacing:  0.5,
                                    ),
                                  ),
                                ),
                                ...notifier.temasEscuros.map(
                                      (temaItem) => _CardTema(
                                    tema: temaItem,
                                    onTap: () {
                                      notifier.trocarTema(temaItem);
                                      _removeOverlay();
                                    },
                                  ),
                                ),
                                SizedBox(height: tema. espacamento),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final tema = context.tema;

    return CompositedTransformTarget(
      link: _layerLink,
      child: MouseRegion(
        onEnter: (_) {
          if (mounted) {
            setState(() => _hovering = true);
          }
        },
        onExit: (_) {
          if (mounted) {
            setState(() => _hovering = false);
          }
        },
        child: GestureDetector(
          onTap: _toggleOverlay,
          child: AnimatedContainer(
            duration: const Duration(seconds: 150),
            curve: Curves.easeOut,
            padding: EdgeInsets.symmetric(
              horizontal: tema.espacamento * 2,
              vertical: tema.espacamento * 1.5,
            ),
            decoration:  BoxDecoration(
              color:  _hovering ? tema.cores.base200.cor : Colors.transparent,
              borderRadius: BorderRadius.circular(tema.borderRadiusP),
            ),
            child: Row(
              mainAxisSize: MainAxisSize. min,
              children: [
                if (widget.exibirIcone)
                  Icon(
                    Icons.palette_outlined,
                    color: tema.cores.baseContent.cor,
                    size: 20,
                  ),
                if (widget.exibirTexto && widget.exibirIcone)
                  SizedBox(width: tema. espacamento),
                if (widget.exibirTexto)
                  Text(
                    'Tema',
                    style: TextStyle(
                      fontSize: tema. textoPadrao,
                      fontFamily: tema.fontePrimaria,
                      color: tema. cores.baseContent.cor,
                      fontWeight: FontWeight. w500,
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

class _CardTema extends StatefulWidget {
  final TemaCloto tema;
  final VoidCallback onTap;

  const _CardTema({
    required this.tema,
    required this. onTap,
  });

  @override
  State<_CardTema> createState() => _CardTemaState();
}

class _CardTemaState extends State<_CardTema> {
  bool _hovering = false;

  void _setHover(bool value) {
    if (_hovering != value && mounted) {
      setState(() => _hovering = value);
    }
  }

  @override
  Widget build(BuildContext context) {
    final temaAtual = context.tema;
    final notifier = ClotoTemaNotifier();
    final ehSelecionado = notifier.temaAtual.id == widget.tema.id;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      opaque: true,
      onEnter: (_) => _setHover(true),
      onExit: (_) => _setHover(false),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: widget.onTap,
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: temaAtual.espacamento * 2,
            vertical: temaAtual.espacamento * 0.5,
          ),
          padding: EdgeInsets.all(temaAtual.espacamento * 1.5),
          decoration: BoxDecoration(
            color: ehSelecionado
                ? temaAtual.cores.primary.cor.withOpacity(0.12)
                : _hovering
                ? temaAtual.cores.base200.cor
                : Colors.transparent,
            borderRadius: BorderRadius.circular(temaAtual.borderRadiusM),
            border: Border.all(
              color: ehSelecionado
                  ? temaAtual.cores.primary.cor
                  : Colors.transparent,
              width: 2,
            ),
          ),
          child: _conteudo(temaAtual, ehSelecionado),
        ),
      ),
    );
  }

  Widget _conteudo(TemaCloto temaAtual, bool ehSelecionado) {
    return Row(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _BolinhaCor(cor: widget.tema.cores.primary.cor, tamanho: 24),
            SizedBox(width: temaAtual.espacamento * 0.5),
            _BolinhaCor(cor: widget.tema.cores.secondary.cor, tamanho: 20),
            SizedBox(width: temaAtual.espacamento * 0.5),
            _BolinhaCor(
              cor: widget.tema.cores.base200.cor,
              tamanho: 16,
              temBorda: true,
            ),
          ],
        ),
        SizedBox(width: temaAtual.espacamento * 1.5),
        Expanded(
          child: Text(
            widget.tema.idioma,
            style: TextStyle(
              fontSize: temaAtual.textoPadrao,
              fontFamily: temaAtual.fontePrimaria,
              color: temaAtual.cores.baseContent.cor,
              fontWeight: ehSelecionado ? FontWeight.w600 : FontWeight.w500,
            ),
          ),
        ),
        if (ehSelecionado)
          Icon(
            Icons.check_circle,
            color: temaAtual.cores.primary.cor,
            size: 20,
          ),
      ],
    );
  }
}

class _BolinhaCor extends StatelessWidget {
  final Color cor;
  final double tamanho;
  final bool temBorda;

  const _BolinhaCor({
    required this.cor,
    this.tamanho = 20,
    this.temBorda = false,
  });

  @override
  Widget build(BuildContext context) {
    final tema = context.tema;

    return Container(
      width: tamanho,
      height: tamanho,
      decoration: BoxDecoration(
        color: cor,
        shape: BoxShape.circle,
        border: temBorda
            ? Border.all(
          color: tema.cores.base300.cor,
          width: 1.5,
        )
            : null,
      ),
    );
  }
}