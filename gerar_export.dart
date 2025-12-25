#!/usr/bin/env dart

import 'dart:io';

void main() {
  print('Gerando exports.. .\n');

  final buffer = StringBuffer();
  int total = 0;

  buffer.writeln('// Cloto Framework - Auto-generated');
  buffer.writeln('// dart run tool/gerar_exports. dart\n');

  total += _exportar(buffer, 'CORE', 'lib/core');
  total += _exportar(buffer, 'THEME', 'lib/theme', exclude: 'controller');
  total += _exportar(buffer, 'TEMAS', 'lib/theme/controller');
  total += _exportar(buffer, 'COMPONENTS', 'lib/components');
  total += _exportar(buffer, 'WIDGETS', 'lib/widgets');

  File('lib/cloto.dart').writeAsStringSync(buffer.toString());
  print('✅ $total arquivos exportados!\n');
}

int _exportar(StringBuffer buf, String nome, String path, {String? exclude}) {
  final dir = Directory(path);
  if (!dir.existsSync()) return 0;

  final arquivos = dir
      .listSync(recursive: exclude == null)
      .whereType<File>()
      .where((f) => f.path.endsWith('.dart'))
      .map((f) => f.path.replaceAll('\\', '/').replaceFirst('lib/', ''));

  if (arquivos.isEmpty) return 0;

  buf.writeln('// $nome');
  arquivos.forEach((f) => buf.writeln("export '$f';"));
  buf.writeln();

  print('✓ $nome: ${arquivos.length}');
  return arquivos.length;
}