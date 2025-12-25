import 'package:cloto/theme/tema_notifier.dart';
import 'package:cloto/theme/tema_provider.dart';
import 'package:flutter/material.dart';
import 'package:cloto/theme/tema.dart';
import 'package:cloto/theme/controller/cor.dart';

extension ClotoTemaExtension on BuildContext {
  /// Obtém o tema atual (reativo)
  TemaCloto get tema => ClotoTemaProvider.of(this);

  /// Obtém as cores do tema atual (reativo)
  CoresCloto get cores => ClotoTemaProvider.of(this).cores;

  /// Obtém o espaçamento do tema atual (reativo)
  double get espacamento => ClotoTemaProvider. of(this).espacamento;

  /// Obtém o notifier para trocar temas
  ClotoTemaNotifier get temaNotifier => ClotoTemaProvider.notifierOf(this);

  /// Troca para tema claro
  void usarTemaClaro() => temaNotifier.usarTemaClaro();

  /// Troca para tema escuro
  void usarTemaEscuro() => temaNotifier.usarTemaEscuro();

  /// Alterna entre claro e escuro
  void alternarTema() => temaNotifier.alternarTema();

  /// Verifica se está em tema escuro
  bool get ehTemaEscuro => temaNotifier.ehTemaEscuro;
}