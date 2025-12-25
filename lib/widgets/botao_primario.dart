import 'package:cloto/cloto.dart';
import 'package:flutter/material.dart';

class BotaoPrimario extends StatelessWidget {
  final String texto;
  final VoidCallback?  onPressed;

  const BotaoPrimario({
    super.key,
    required this.texto,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final tema = context.tema;

    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(tema.borderRadiusM),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: tema.espacamento * 2,
          vertical: tema.espacamento * 1.5,
        ),
        decoration: BoxDecoration(
          color: tema.cores.primary.cor,
          borderRadius: BorderRadius.circular(tema.borderRadiusM),
          boxShadow: [
            BoxShadow(
              blurRadius: 12,
              color: tema.cores.baseContent. cor
                  .withOpacity(tema.opacidadeShadow),
            )
          ],
        ),
        child: Center(
          child: Text(
            texto,
            style: TextStyle(
              fontSize: tema. textoPadrao,
              fontFamily: tema.fontePrimaria,
              color: tema.cores.primaryContent.cor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}