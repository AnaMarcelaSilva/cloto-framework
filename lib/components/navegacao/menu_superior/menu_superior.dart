import 'package:cloto/core/responsividade.dart';
import 'package:cloto/theme/tema.dart';
import 'package:cloto/theme/tema_extension.dart';
import 'package:cloto/widgets/seletor_tema.dart';
import 'package:flutter/material.dart';
import 'item_menu_superior.dart';

class ClotoMenuSuperior extends StatefulWidget {
  final Widget?  logo;
  final String? titulo;
  final List<ClotoItemMenuSuperior> itens;
  final bool exibirSeletorTema;
  final double altura;
  final Widget Function(VoidCallback onOpen)? menuMobileBuilder;

  const ClotoMenuSuperior({
    super.key,
    this.logo,
    this.titulo,
    this.itens = const [],
    this.exibirSeletorTema = true,
    this.altura = 70,
    this.menuMobileBuilder,
  });

  @override
  State<ClotoMenuSuperior> createState() => _ClotoMenuSuperiorState();
}

class _ClotoMenuSuperiorState extends State<ClotoMenuSuperior>
    with SingleTickerProviderStateMixin {
  bool _menuMobileAberto = false;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  OverlayEntry? _overlayEntry;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _fadeAnimation = CurvedAnimation(
      parent:  _animationController,
      curve: Curves.easeInOut,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -0.15),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ));
  }

  @override
  void dispose() {
    _removeOverlay();
    _animationController.dispose();
    super.dispose();
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  void _toggleMenuMobile() {
    if (_menuMobileAberto) {
      _animationController.reverse().then((_) {
        _removeOverlay();
        if (mounted) {
          setState(() {
            _menuMobileAberto = false;
          });
        }
      });
    } else {
      setState(() {
        _menuMobileAberto = true;
      });
      _showMobileMenu();
      _animationController.forward();
    }
  }

  void _fecharMenuMobile() {
    if (_menuMobileAberto) {
      _toggleMenuMobile();
    }
  }

  void _showMobileMenu() {
    final tema = context.tema;

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: widget.altura,
        left: 0,
        right: 0,
        bottom: 0,
        child:  FadeTransition(
          opacity:  _fadeAnimation,
          child:  GestureDetector(
            onTap: _fecharMenuMobile,
            child: Container(
              color: Colors.black.withOpacity(0.5),
              child: GestureDetector(
                onTap: () {},
                child: SlideTransition(
                  position: _slideAnimation,
                  child:  Align(
                    alignment: Alignment.topCenter,
                    child: Material(
                      color: tema.cores.base100. cor,
                      elevation: 8,
                      child: Container(
                        width: double.infinity,
                        constraints: BoxConstraints(
                          maxHeight: MediaQuery.of(context).size.height - widget.altura,
                        ),
                        decoration: BoxDecoration(
                          color: tema.cores.base100.cor,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 20,
                              offset: const Offset(0, 4),
                              color: tema. cores.baseContent.cor. withOpacity(0.2),
                            ),
                          ],
                        ),
                        child: SafeArea(
                          top: false,
                          child:  SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            padding: EdgeInsets.all(tema.espacamento * 2),
                            child:  Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                ... widget.itens.map((item) {
                                  if (item.tipo == TipoItemMenuSuperior.dropdown &&
                                      item.subitens != null) {
                                    return _MobileDropdownItem(
                                      item:  item,
                                      onItemTap: _fecharMenuMobile,
                                    );
                                  }
                                  return _MobileMenuItem(
                                    item: item,
                                    onTap: () {
                                      item.onTap?.call();
                                      _fecharMenuMobile();
                                    },
                                  );
                                }),
                                SizedBox(height: tema.espacamento * 2),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry! );
  }

  @override
  Widget build(BuildContext context) {
    final tema = context.tema;
    final ehMobile = ClotoResponsividade.mobile(context);

    return Container(
      height: widget.altura,
      padding: EdgeInsets.symmetric(
        horizontal: tema.espacamento * (ehMobile ? 2 : 4),
      ),
      decoration: BoxDecoration(
        color: tema.cores.base100.cor,
        border: Border(
          bottom: BorderSide(
            color: tema.cores.base300.cor. withOpacity(0.6),
            width: 1,
          ),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            offset: const Offset(0, 2),
            color: tema.cores.baseContent.cor.withOpacity(tema.opacidadeShadow),
          ),
        ],
      ),
      child: Row(
        children: [
          _buildBrand(tema, ehMobile),

          const Spacer(),

          if (!ehMobile) ...[
            ... widget.itens.map(
                  (item) => ClotoItemMenuSuperiorWidget(
                item: item,
              ),
            ),

            if (widget.exibirSeletorTema) ...[
              SizedBox(width: tema.espacamento),
              const ClotoSeletorTema(),
            ],
          ],

          if (ehMobile) ...[
            if (widget.exibirSeletorTema)
              const ClotoSeletorTema(exibirTexto: false),
            SizedBox(width: tema.espacamento),
            IconButton(
              onPressed: _toggleMenuMobile,
              icon: AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                transitionBuilder: (child, animation) {
                  return RotationTransition(
                    turns:  Tween<double>(begin: 0.0, end: 0.5).animate(animation),
                    child: child,
                  );
                },
                child: Icon(
                  _menuMobileAberto ? Icons.close : Icons.menu,
                  key: ValueKey(_menuMobileAberto),
                  color: tema.cores.baseContent.cor,
                ),
              ),
              iconSize: 28,
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildBrand(TemaCloto tema, bool ehMobile) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.logo != null) ...[
          SizedBox(
            height: widget.altura * 0.5,
            child: FittedBox(
              fit: BoxFit.contain,
              child: widget.logo!,
            ),
          ),
          if (widget.titulo != null && ! ehMobile)
            SizedBox(width: tema.espacamento * 1.5),
        ],
        if (widget.titulo != null && ! ehMobile)
          Text(
            widget.titulo!,
            style: TextStyle(
              fontSize: tema.textoGrande,
              fontFamily: tema.fontePrimaria,
              color: tema.cores.baseContent.cor,
              fontWeight: FontWeight.w700,
            ),
          ),
      ],
    );
  }
}

class _MobileMenuItem extends StatelessWidget {
  final ClotoItemMenuSuperior item;
  final VoidCallback onTap;

  const _MobileMenuItem({
    required this.item,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final tema = context.tema;

    return Padding(
      padding: EdgeInsets.only(bottom: tema.espacamento),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap:  onTap,
          borderRadius: BorderRadius. circular(tema.borderRadiusM),
          child: Ink(
            decoration: BoxDecoration(
              color: item.ativo
                  ? tema.cores.primary.cor. withOpacity(0.1)
                  : Colors.transparent,
              borderRadius: BorderRadius. circular(tema.borderRadiusM),
            ),
            child: Padding(
              padding:  EdgeInsets.symmetric(
                horizontal: tema.espacamento * 2,
                vertical: tema. espacamento * 2,
              ),
              child: Row(
                children: [
                  if (item.icone != null) ...[
                    Icon(
                      item.icone,
                      color: item.ativo
                          ? tema.cores. primary.cor
                          : tema.cores.baseContent.cor,
                      size: 24,
                    ),
                    SizedBox(width: tema.espacamento * 1.5),
                  ],
                  Expanded(
                    child: Text(
                      item.texto ?? '',
                      style: TextStyle(
                        fontSize: tema.textoPadrao,
                        fontFamily:  tema.fontePrimaria,
                        color: item.ativo
                            ? tema.cores. primary.cor
                            : tema.cores.baseContent. cor,
                        fontWeight:  item.ativo ?  FontWeight.w600 : FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _MobileDropdownItem extends StatefulWidget {
  final ClotoItemMenuSuperior item;
  final VoidCallback onItemTap;

  const _MobileDropdownItem({
    required this. item,
    required this.onItemTap,
  });

  @override
  State<_MobileDropdownItem> createState() => _MobileDropdownItemState();
}

class _MobileDropdownItemState extends State<_MobileDropdownItem> {
  bool _expandido = false;

  @override
  Widget build(BuildContext context) {
    final tema = context.tema;

    return Padding(
      padding: EdgeInsets.only(bottom: tema.espacamento),
      child: Column(
        crossAxisAlignment:  CrossAxisAlignment.stretch,
        children: [
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap:  () {
                setState(() {
                  _expandido = !_expandido;
                });
              },
              borderRadius: BorderRadius.circular(tema. borderRadiusM),
              child: Ink(
                decoration: BoxDecoration(
                  color: widget.item.ativo
                      ? tema.cores. primary.cor.withOpacity(0.1)
                      :  Colors.transparent,
                  borderRadius: BorderRadius.circular(tema.borderRadiusM),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: tema.espacamento * 2,
                    vertical: tema. espacamento * 2,
                  ),
                  child: Row(
                    children: [
                      if (widget.item. icone != null) ...[
                        Icon(
                          widget.item.icone,
                          color: widget.item. ativo
                              ? tema.cores.primary.cor
                              :  tema.cores.baseContent.cor,
                          size: 24,
                        ),
                        SizedBox(width: tema. espacamento * 1.5),
                      ],
                      Expanded(
                        child: Text(
                          widget.item. texto ?? '',
                          style:  TextStyle(
                            fontSize:  tema.textoPadrao,
                            fontFamily: tema.fontePrimaria,
                            color: widget.item.ativo
                                ? tema.cores.primary.cor
                                : tema. cores.baseContent.cor,
                            fontWeight: widget.item.ativo
                                ? FontWeight.w600
                                : FontWeight.w500,
                          ),
                        ),
                      ),
                      AnimatedRotation(
                        turns: _expandido ? 0.5 : 0,
                        duration: const Duration(milliseconds: 200),
                        child: Icon(
                          Icons.expand_more,
                          color: tema.cores.baseContent.cor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: _expandido && widget. item.subitens != null
                ? Padding(
              padding: EdgeInsets. only(
                left: tema.espacamento * 3,
                top: tema.espacamento,
              ),
              child: Column(
                children:  widget.item.subitens! .map((subitem) {
                  return _MobileMenuItem(
                    item: subitem,
                    onTap:  () {
                      subitem.onTap?.call();
                      widget.onItemTap();
                    },
                  );
                }).toList(),
              ),
            )
                : const SizedBox. shrink(),
          ),
        ],
      ),
    );
  }
}