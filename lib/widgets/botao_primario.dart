import 'package:cloto/theme/controller/temas.dart';
import 'package:flutter/material.dart';

class BotaoPrimario extends StatelessWidget {
  final String texto;

  const BotaoPrimario({super.key, required this.texto});

  @override
  Widget build(BuildContext context) {
    final tema = TemasCloto.temaSelecionado;


    return Container(
      padding: EdgeInsets.all(tema.espacamento),
      decoration: BoxDecoration(
        color: tema.cores.primary.cor,
        borderRadius: BorderRadius.circular(tema.borderRadiusM),
        boxShadow: [
          BoxShadow(
            blurRadius: 12,
            color: tema.cores.baseContent.cor
                .withOpacity(tema.opacidadeShadow),
          )
        ],
      ),
      child: Text(
        texto,
        style: TextStyle(
          fontSize: tema.textoPadrao,
          fontFamily: tema.fontePrimaria,
          color: tema.cores.primaryContent.cor,
        ),
      ),
    );
  }
}
