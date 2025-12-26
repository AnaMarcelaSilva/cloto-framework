import 'dart:async';
import 'package:cloto/cloto.dart';
import 'package:flutter/material.dart';

class ClotoCarousel extends StatefulWidget {
  final List<Widget> itens;
  final double altura;
  final double?  larguraMaxima;
  final bool autoPlay;
  final Duration autoPlayDuration;
  final bool mostrarIndicadores;
  final bool mostrarControles;
  final double espacamentoEntreItens;

  const ClotoCarousel({
    super.key,
    required this. itens,
    this.altura = 400,
    this. larguraMaxima  ,
    this. autoPlay = true,
    this.autoPlayDuration = const Duration(seconds: 5),
    this.mostrarIndicadores = true,
    this. mostrarControles = true,
    this.espacamentoEntreItens = 0.85,
  });

  @override
  State<ClotoCarousel> createState() => _ClotoCarouselState();
}

class _ClotoCarouselState extends State<ClotoCarousel> {
  late PageController _pageController;
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: widget.espacamentoEntreItens,
      initialPage:  0,
    );

    if (widget.autoPlay) {
      _startAutoPlay();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoPlay() {
    _timer = Timer. periodic(widget.autoPlayDuration, (timer) {
      if (_currentPage < widget.itens.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      if (_pageController.hasClients) {
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds:  600),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  void _proximaPagina() {
    if (_currentPage < widget.itens.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  void _paginaAnterior() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final tema = context.tema;

    return SizedBox(
      height: widget. altura,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: ConstrainedBox(
              constraints:  BoxConstraints(
                maxWidth: widget.larguraMaxima ??  double.infinity,
              ),
              child: PageView. builder(
                controller: _pageController,
                onPageChanged:  (index) {
                  setState(() => _currentPage = index);
                },
                itemCount:  widget.itens.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: tema.espacamento,
                    ),
                    child: widget.larguraMaxima != null
                        ? ConstrainedBox(
                          constraints: BoxConstraints(
                            // maxWidth: widget.larguraMaxima!,
                          ),
                          child: widget.itens[index],
                        )
                        : widget.itens[index],
                  );
                },
              ),
            ),
          ),

          if (widget.mostrarControles)
            Positioned.fill(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: widget.larguraMaxima != null
                      ? widget.larguraMaxima!  + 100
                      : double.infinity,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildControle(
                      Icons.chevron_left,
                      _paginaAnterior,
                      _currentPage > 0,
                      tema,
                    ),
                    _buildControle(
                      Icons.chevron_right,
                      _proximaPagina,
                      _currentPage < widget.itens.length - 1,
                      tema,
                    ),
                  ],
                ),
              ),
            ),

          if (widget.mostrarIndicadores)
            Positioned(
              bottom: tema.espacamento * 2,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                  widget.itens.length,
                      (index) => _buildIndicador(index, tema),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildControle(IconData icon, VoidCallback onTap, bool ativo, tema) {
    if (!ativo) return const SizedBox(width: 48);

    return IconButton(
      onPressed: onTap,
      icon: Icon(icon),
      iconSize: 32,
      color: tema.cores.baseContent.cor,
      style: IconButton.styleFrom(
        backgroundColor: tema.cores. base100.cor.withOpacity(0.9),
        shape: const CircleBorder(),
      ),
    );
  }

  Widget _buildIndicador(int index, tema) {
    final ativo = index == _currentPage;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: tema.espacamento * 0.5),
      width: ativo ? 24 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: ativo
            ? tema.cores.primary. cor
            : tema.cores. baseContent.cor.withOpacity(0.3),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}