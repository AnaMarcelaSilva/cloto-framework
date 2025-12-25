import 'package:flutter/material.dart';

class CorCloto {
  final String hex;

  CorCloto._(this.hex);

  factory CorCloto.carregar(String valor) => CorCloto._(valor);

  Color get cor {
    final value = int.parse('0xFF$hex');
    return Color(value);
  }
}

class CoresCloto {
  final int id;

  final CorCloto primary;
  final CorCloto primaryContent;
  final CorCloto primaryFocus;

  final CorCloto secondary;
  final CorCloto secondaryContent;
  final CorCloto secondaryFocus;

  final CorCloto base100;
  final CorCloto base200;
  final CorCloto base300;
  final CorCloto baseContent;

  final CorCloto success;
  final CorCloto warning;
  final CorCloto error;

  const CoresCloto({
    required this.id,
    required this.primary,
    required this.primaryContent,
    required this.primaryFocus,
    required this.secondary,
    required this.secondaryContent,
    required this.secondaryFocus,
    required this.base100,
    required this.base200,
    required this.base300,
    required this.baseContent,
    required this.success,
    required this.warning,
    required this.error,
  });
}


