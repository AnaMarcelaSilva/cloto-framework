import 'package:cloto/theme/controller/temas.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClotoItemMenuLateral extends StatelessWidget {
  final IconData icone;
  final String titulo;
  final bool ativo;
  final VoidCallback onTap;

  const ClotoItemMenuLateral({
    super.key,
    required this.icone,
    required this.titulo,
    this.ativo = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final tema = TemasCloto.temaSelecionado;

    final cor = ativo
        ? tema.cores.primary.cor
        : tema.cores.baseContent.cor;

    return InkWell(
      borderRadius: BorderRadius.circular(tema.borderRadiusM),
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 160),
        padding: EdgeInsets.symmetric(
          vertical: tema.espacamento * 1.2,
          horizontal: tema.espacamento,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(tema.borderRadiusM),
          color: ativo
              ? cor.withOpacity(.12)
              : Colors.transparent,
        ),
        child: Row(
          children: [
            Icon(icone, size: 20, color: cor),

            SizedBox(width: tema.espacamento),

            Text(
              titulo,
              style: TextStyle(
                color: cor,
                fontFamily: tema.fontePrimaria,
                fontSize: tema.textoPadrao,
                fontWeight: ativo ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
