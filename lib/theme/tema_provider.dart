import 'package:cloto/theme/tema_notifier.dart';
import 'package:flutter/material.dart';
import 'package:cloto/theme/tema.dart';


class ClotoTemaProvider extends StatelessWidget {
  final Widget child;
  final ClotoTemaNotifier notifier;

  ClotoTemaProvider({
    super.key,
    required this.child,
    ClotoTemaNotifier? notifier,
  }) : notifier = notifier ??  ClotoTemaNotifier();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: notifier,
      builder: (context, _) {
        return _ClotoTemaInherited(
          tema: notifier.temaAtual,
          notifier: notifier,
          child: child,
        );
      },
    );
  }

  static TemaCloto of(BuildContext context) {
    final inherited = context.dependOnInheritedWidgetOfExactType<_ClotoTemaInherited>();
    assert(inherited != null, 'ClotoTemaProvider não encontrado na árvore de widgets');
    return inherited! .tema;
  }

  static ClotoTemaNotifier notifierOf(BuildContext context) {
    final inherited = context.dependOnInheritedWidgetOfExactType<_ClotoTemaInherited>();
    assert(inherited != null, 'ClotoTemaProvider não encontrado na árvore de widgets');
    return inherited! .notifier;
  }
}

class _ClotoTemaInherited extends InheritedWidget {
  final TemaCloto tema;
  final ClotoTemaNotifier notifier;

  const _ClotoTemaInherited({
    required this.tema,
    required this.notifier,
    required super.child,
  });

  @override
  bool updateShouldNotify(_ClotoTemaInherited oldWidget) {
    return tema. id != oldWidget.tema.id;
  }
}