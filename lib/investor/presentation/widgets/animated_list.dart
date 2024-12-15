import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:taba_app/investor/presentation/painter/list_painter.dart';

import 'project_widget.dart';

class AnimatedListTaba extends StatefulWidget {
  const AnimatedListTaba(this.screenHeight, {super.key});
  final double screenHeight;

  @override
  State<AnimatedListTaba> createState() => _AnimatedListTabaState();
}

class _AnimatedListTabaState extends State<AnimatedListTaba>
    with SingleTickerProviderStateMixin {
  late Ticker _ticker;
  late List<double> _positions;
  final int _itemCount = 20;
  final double _itemHeight = 200.0;
  final Duration _animationDuration = const Duration(milliseconds: 800);
  late Duration _totalAnimationDuration;

  final List<double> _startTimes = [];
  bool _animationCompleted = false;

  @override
  void initState() {
    super.initState();

    // Inicializar posições fora da tela
    _positions = List.generate(_itemCount, (_) => widget.screenHeight);

    // Calcular o tempo total da animação
    int itemsVisibleOnScreen = (widget.screenHeight / _itemHeight).ceil();
    _totalAnimationDuration = Duration(
      milliseconds: (_animationDuration.inMilliseconds +
              (itemsVisibleOnScreen - 1) * 400)
          .round(),
    );

    // Definir os tempos de início escalonados
    for (int i = 0; i < _itemCount; i++) {
      _startTimes.add(i * 0.4); // 0.4 segundos entre itens
    }

    // Iniciar ticker
    _ticker = createTicker(_onTick)..start();
  }

  void _onTick(Duration elapsed) {
    setState(() {
      if (elapsed > _totalAnimationDuration) {
        _ticker.stop();
        _animationCompleted = true;
      } else {
        for (int i = 0; i < _itemCount; i++) {
          double startTime = _startTimes[i];
          double endTime = startTime + _animationDuration.inMilliseconds / 1000;

          if (elapsed.inMilliseconds / 1000 >= startTime &&
              elapsed.inMilliseconds / 1000 <= endTime) {
            double progress = (elapsed.inMilliseconds / 1000 - startTime) /
                (_animationDuration.inMilliseconds / 1000);
            _positions[i] = widget.screenHeight -
                (progress * (widget.screenHeight - i * _itemHeight));
          } else if (elapsed.inMilliseconds / 1000 > endTime) {
            _positions[i] = i * _itemHeight;
          }
        }
      }
    });
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_animationCompleted) {
      return _buildAnimatedList();
    } else {
      return _buildStaticList();
    }
  }

  Widget _buildAnimatedList() {
    return RepaintBoundary(
      child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return CustomPaint(
                  painter: ListPainter(_positions, _itemHeight, index),
                  size: const Size(double.infinity, 1),
                );
              },
              childCount: _positions.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStaticList() {
    return ListView.builder(
      itemCount: _itemCount,
      itemBuilder: (context, index) {
        return const ProjectWidget();
      },
    );
  }
}
