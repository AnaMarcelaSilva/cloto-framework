import 'package:cloto/cloto.dart';
import 'package:flutter/material.dart';

class ClotoItemMenuLateral extends StatelessWidget {
  final IconData icone;
  final String titulo;
  final bool ativo;
  final VoidCallback onTap;
  final bool compacto;

  const ClotoItemMenuLateral({
    super.key,
    required this. icone,
    required this. titulo,
    this.ativo = false,
    required this.onTap,
    this.compacto = false,
  });

  @override
  Widget build(BuildContext context) {
    final tema = context.tema;
    final cor = ativo ? tema.cores.primary. cor : tema.cores.baseContent.cor;

    if (compacto) {
      return Tooltip(
        message: titulo,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(tema.borderRadiusM),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 160),
            padding: EdgeInsets.all(tema.espacamento * 1.2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(tema.borderRadiusM),
              color: ativo ? cor. withOpacity(0.12) : Colors.transparent,
            ),
            child: Icon(
              icone,
              size: 24,
              color:  cor,
            ),
          ),
        ),
      );
    }

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
          borderRadius:  BorderRadius.circular(tema.borderRadiusM),
          color: ativo ? cor.withOpacity(0.12) : Colors.transparent,
        ),
        child: Row(
          children: [
            Icon(icone, size: 20, color: cor),
            SizedBox(width: tema.espacamento),
            Expanded(
              child: Text(
                titulo,
                style: TextStyle(
                  color: cor,
                  fontFamily: tema.fontePrimaria,
                  fontSize: tema.textoPadrao,
                  fontWeight:  ativo ? FontWeight.w600 : FontWeight.w400,
                ),
                overflow:  TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}