import 'package:cloto/theme/tema_extension.dart';
import 'package:flutter/material.dart';

enum TipoIconeLinhaTempo { numero, icone, personalizado }

class ItemLinhaTempo {
  final String periodo;
  final String titulo;
  final String? descricao;
  final IconData? icone;
  final Widget? iconePersonalizado;
  final Color? cor;
  final List<String>? tags;

  const ItemLinhaTempo({
    required this.periodo,
    required this.titulo,
    this.descricao,
    this.icone,
    this.iconePersonalizado,
    this.cor,
    this.tags,
  });
}

class ClotoLinhaTempo extends StatelessWidget {
  final List<ItemLinhaTempo> itens;
  final TipoIconeLinhaTempo tipoIcone;
  final bool exibirLinha;
  final double espacamentoVertical;
  final Axis direcao;

  const ClotoLinhaTempo({
    super.key,
    required this.itens,
    this.tipoIcone = TipoIconeLinhaTempo.numero,
    this.exibirLinha = true,
    this.espacamentoVertical = 40,
    this.direcao = Axis.vertical,
  });

  @override
  Widget build(BuildContext context) {
    return direcao == Axis.vertical ? _buildVertical(context) : _buildHorizontal(context);
  }

  Widget _buildVertical(BuildContext context) {
    final tema = context.tema;

    return Column(
      children: List.generate(itens.length, (index) {
        final item = itens[index];
        final ehUltimo = index == itens.length - 1;

        return IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 60,
                child: Column(
                  children: [
                    _buildIcone(tema, item, index),
                    if (!ehUltimo && exibirLinha)
                      Expanded(
                        child: Container(
                          width: 2,
                          margin: EdgeInsets.symmetric(vertical: tema.espacamento),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                item.cor ?? tema.cores.primary.cor,
                                (itens.length > index + 1 ? itens[index + 1].cor : item.cor) ?? tema.cores.primary.cor,
                              ],
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),

              SizedBox(width: tema.espacamento * 2),

              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(bottom: ehUltimo ? 0 : espacamentoVertical),
                  child: _buildConteudo(tema, item),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildHorizontal(BuildContext context) {
    final tema = context.tema;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(itens.length, (index) {
          final item = itens[index];
          final ehUltimo = index == itens.length - 1;

          return SizedBox(
            width: 300,
            child: Column(
              children: [
                _buildIcone(tema, item, index),
                SizedBox(height: tema.espacamento * 2),
                _buildConteudo(tema, item),
                if (!ehUltimo && exibirLinha)
                  Container(
                    height: 2,
                    margin: EdgeInsets.symmetric(horizontal: tema.espacamento * 2),
                    color: item.cor ?? tema.cores.primary.cor,
                  ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _buildIcone(tema, ItemLinhaTempo item, int index) {
    final cor = item.cor ?? tema.cores.primary.cor;

    Widget conteudo;

    switch (tipoIcone) {
      case TipoIconeLinhaTempo.icone:
        conteudo = Icon(item.icone ?? Icons.circle, color: Colors.white, size: 20);
        break;
      case TipoIconeLinhaTempo.personalizado:
        conteudo = item.iconePersonalizado ?? Text('${index + 1}');
        break;
      case TipoIconeLinhaTempo.numero:
      default:
        conteudo = Text(
          '${index + 1}',
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 18),
        );
    }

    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: cor,
        shape: BoxShape.circle,
        border: Border.all(color: tema.cores.base100.cor, width: 4),
        boxShadow: [BoxShadow(color: cor.withOpacity(0.3), blurRadius: 8, offset: const Offset(0, 2))],
      ),
      child: Center(child: conteudo),
    );
  }

  Widget _buildConteudo(tema, ItemLinhaTempo item) {
    return Container(
      padding: EdgeInsets.all(tema.espacamento * 2),
      decoration: BoxDecoration(
        color: tema.cores.base100.cor,
        borderRadius: BorderRadius.circular(tema.borderRadiusM),
        border: Border.all(color: tema.cores.base300.cor, width: 1),
        boxShadow: [
          BoxShadow(color: tema.cores.baseContent.cor.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.periodo,
            style: TextStyle(
              fontSize: tema.textoPequeno,
              fontFamily: tema.fonteSecundaria,
              color: item.cor ?? tema.cores.primary.cor,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5,
            ),
          ),

          SizedBox(height: tema.espacamento),

          Text(
            item.titulo,
            style: TextStyle(
              fontSize: tema.textoGrande,
              fontFamily: tema.fontePrimaria,
              color: tema.cores.baseContent.cor,
              fontWeight: FontWeight.w700,
            ),
          ),

          if (item.descricao != null) ...[
            SizedBox(height: tema.espacamento),
            Text(
              item.descricao!,
              style: TextStyle(
                fontSize: tema.textoPadrao,
                fontFamily: tema.fonteSecundaria,
                color: tema.cores.baseContent.cor.withOpacity(0.7),
                height: 1.5,
              ),
            ),
          ],

          if (item.tags != null && item.tags!.isNotEmpty) ...[
            SizedBox(height: tema.espacamento * 1.5),
            Wrap(
              spacing: tema.espacamento,
              runSpacing: tema.espacamento * 0.5,
              children:
                  item.tags!.map((tag) {
                    return Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: tema.espacamento * 1.5,
                        vertical: tema.espacamento * 0.5,
                      ),
                      decoration: BoxDecoration(
                        color: tema.cores.base200.cor,
                        borderRadius: BorderRadius.circular(tema.borderRadiusP),
                      ),
                      child: Text(
                        tag,
                        style: TextStyle(
                          fontSize: tema.textoPequeno,
                          fontFamily: tema.fonteSecundaria,
                          color: tema.cores.baseContent.cor.withOpacity(0.8),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    );
                  }).toList(),
            ),
          ],
        ],
      ),
    );
  }
}
