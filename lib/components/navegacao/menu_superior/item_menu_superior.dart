import 'package:cloto/theme/tema_extension.dart';
import 'package:flutter/material.dart';

enum TipoItemMenuSuperior {
  link,
  dropdown,
}

class ClotoItemMenuSuperior {
  final IconData? icone;
  final String? texto;
  final VoidCallback? onTap;
  final TipoItemMenuSuperior tipo;
  final List<ClotoItemMenuSuperior>? subitens;
  final bool ativo;

  const ClotoItemMenuSuperior({
    this.icone,
    this. texto,
    this.onTap,
    this.tipo = TipoItemMenuSuperior.link,
    this.subitens,
    this. ativo = false,
  });
}

class ClotoItemMenuSuperiorWidget extends StatefulWidget {
  final ClotoItemMenuSuperior item;
  final bool ehMobile;

  const ClotoItemMenuSuperiorWidget({
    super.key,
    required this. item,
    this.ehMobile = false,
  });

  @override
  State<ClotoItemMenuSuperiorWidget> createState() =>
      _ClotoItemMenuSuperiorWidgetState();
}

class _ClotoItemMenuSuperiorWidgetState
    extends State<ClotoItemMenuSuperiorWidget> {
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

  void _showDropdown() {
    if (widget.item.subitens == null || widget.item.subitens! .isEmpty) return;

    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
  }

  OverlayEntry _createOverlayEntry() {
    final tema = context.tema;
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;

    return OverlayEntry(
      builder: (context) => GestureDetector(
        onTap: _removeOverlay,
        behavior: HitTestBehavior. translucent,
        child:  Stack(
          children: [
            Positioned(
              width: 220,
              child: CompositedTransformFollower(
                link: _layerLink,
                showWhenUnlinked: false,
                offset: Offset(0, size.height + 8),
                child: Material(
                  elevation: 8,
                  borderRadius: BorderRadius.circular(tema.borderRadiusM),
                  color: tema.cores.base100.cor,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(tema.borderRadiusM),
                      border: Border. all(
                        color: tema.cores.base300.cor. withOpacity(0.5),
                        width: 1,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(tema.borderRadiusM),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: widget.item.subitens!. map((subitem) {
                          return _DropdownItem(
                            item: subitem,
                            onTap:  () {
                              _removeOverlay();
                              subitem.onTap?.call();
                            },
                          );
                        }).toList(),
                      ),
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
    final ehDropdown = widget.item.tipo == TipoItemMenuSuperior.dropdown;

    return CompositedTransformTarget(
      link: _layerLink,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        hitTestBehavior: HitTestBehavior.opaque,
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
          onTap: () {
            if (ehDropdown) {
              if (_overlayEntry == null) {
                _showDropdown();
              } else {
                _removeOverlay();
              }
            } else {
              widget.item.onTap?.call();
            }
          },
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: tema.espacamento * 2,
              vertical: tema.espacamento * 1.5,
            ),
            decoration: BoxDecoration(
              color: widget.item.ativo
                  ? tema.cores. primary.cor.withOpacity(0.1)
                  :  _hovering
                  ? tema. cores.base300.cor
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(tema.borderRadiusP),
            ),
            child:  Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.item.icone != null) ...[
                  Icon(
                    widget.item.icone,
                    color: widget.item.ativo
                        ? tema.cores.primary.cor
                        : tema.cores.baseContent.cor,
                    size: 20,
                  ),
                  if (widget.item.texto != null)
                    SizedBox(width: tema.espacamento),
                ],
                if (widget.item.texto != null)
                  Text(
                    widget.item. texto!,
                    style:  TextStyle(
                      fontSize:  tema.textoPadrao,
                      fontFamily: tema.fontePrimaria,
                      color: widget.item.ativo
                          ? tema.cores.primary.cor
                          : tema. cores.baseContent.cor,
                      fontWeight:
                      widget.item. ativo ? FontWeight.w600 : FontWeight.w500,
                    ),
                  ),
                if (ehDropdown) ...[
                  SizedBox(width: tema.espacamento * 0.5),
                  Icon(
                    Icons.keyboard_arrow_down,
                    size: 18,
                    color: widget.item.ativo
                        ? tema.cores.primary.cor
                        : tema.cores. baseContent.cor,
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DropdownItem extends StatefulWidget {
  final ClotoItemMenuSuperior item;
  final VoidCallback onTap;

  const _DropdownItem({
    required this.item,
    required this.onTap,
  });

  @override
  State<_DropdownItem> createState() => _DropdownItemState();
}

class _DropdownItemState extends State<_DropdownItem> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final tema = context.tema;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      hitTestBehavior: HitTestBehavior.opaque,
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
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          curve: Curves.easeOut,
          padding: EdgeInsets.symmetric(
            horizontal: tema.espacamento * 2,
            vertical: tema.espacamento * 1.5,
          ),
          color: _hovering ?  tema.cores.base200.cor : tema.cores.base100.cor,
          child: Row(
            children: [
              if (widget. item.icone != null) ...[
                Icon(
                  widget.item.icone,
                  size: 18,
                  color: tema.cores.baseContent.cor. withOpacity(0.7),
                ),
                SizedBox(width: tema.espacamento),
              ],
              if (widget.item.texto != null)
                Expanded(
                  child: Text(
                    widget.item. texto!,
                    style:  TextStyle(
                      fontSize:  tema.textoPadrao,
                      fontFamily: tema.fontePrimaria,
                      color: tema.cores.baseContent.cor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}