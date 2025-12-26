import 'package:cloto/theme/tema_extension.dart';
import 'package:flutter/material.dart';

class ClotoCardPerfil extends StatefulWidget {

  final Widget? imagemWidget;

  const ClotoCardPerfil({
    super.key, this.imagemWidget,
  });

  @override
  State<ClotoCardPerfil> createState() => _ClotoCardPerfilState();
}

class _ClotoCardPerfilState extends State<ClotoCardPerfil> {

  @override
  Widget build(BuildContext context) {
    final tema = context.tema;

    return  Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: tema.cores.primary.cor, width: 4),
          boxShadow: [BoxShadow(color: tema.cores.primary.cor.withOpacity(0.3), blurRadius: 30, spreadRadius: 10)],
        ),
        child: CircleAvatar(
          radius: 150,
          backgroundColor: tema.cores.base300.cor,
          child: ClipOval(
            child: widget.imagemWidget,
          ),
        )
    );
  }
}