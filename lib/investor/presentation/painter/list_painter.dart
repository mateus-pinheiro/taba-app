import 'package:flutter/material.dart';

class ListPainter extends CustomPainter {
  final double position;
  final double itemHeight;
  final int index;

  ListPainter(this.position, this.itemHeight, this.index);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..filterQuality = FilterQuality.none
      ..isAntiAlias = false
      ..color = Colors.purple;

    // Calcular a posição do item
    final top = position;
    final rect = Rect.fromLTRB(0, top, size.width, top + itemHeight);

    // Desenhar o retângulo
    canvas.drawRect(rect, paint);

    // Renderizar o texto
    final TextPainter textPainter = TextPainter(
      textDirection: TextDirection.ltr,
    );

    textPainter.text = TextSpan(
      text: 'Item ${index + 1}',
      style: const TextStyle(color: Colors.white, fontSize: 16),
    );
    textPainter.layout();

    textPainter.paint(
      canvas,
      Offset(
        size.width / 2 - textPainter.width / 2,
        top + itemHeight / 2 - textPainter.height / 2,
      ),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}