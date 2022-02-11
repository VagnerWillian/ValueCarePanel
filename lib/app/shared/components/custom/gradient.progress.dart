import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const double _kLinearProgressIndicatorHeight = 6.0;
const int _kIndeterminateLinearDuration = 1800;

class GradientProgressIndicator extends StatefulWidget {
  const GradientProgressIndicator({
    this.key,
    this.value,
    this.backgroundColor = Colors.grey,
    required this.gradient,
  }) : super(key: key);

  @override
  final Key? key;
  final double? value;
  final LinearGradient gradient;
  final Color backgroundColor;

  @override
  _GradientProgressIndicatorState createState() =>
      _GradientProgressIndicatorState();
}

class _GradientProgressIndicatorState extends State<GradientProgressIndicator>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  late Animation<double> pAnimation;
  List<Color> colors = [];

  double? prevValue = 0.0;

  late CurvedAnimation curvedAnimation;

  @override
  void initState() {
    super.initState();

    assert(widget.gradient != null, 'Please set the gradient!');

    _setColorsArray();

    _controller = AnimationController(
      duration: const Duration(milliseconds: _kIndeterminateLinearDuration),
      vsync: this,
    );

    _setControllerListener();

    curvedAnimation =
        CurvedAnimation(parent: _controller!, curve: Curves.fastOutSlowIn);
    pAnimation = Tween<double>(begin: prevValue, end: widget.value ?? 1.0)
        .animate(curvedAnimation);
    prevValue = widget.value ?? 0;

    _controller!.forward();
  }

  void _setColorsArray() {
    colors.clear();
    colors.addAll(widget.gradient.colors);
  }

  void _setControllerListener() {
    if (widget.value == null) {
      _controller!.addStatusListener((status) {
        if (status == AnimationStatus.dismissed && widget.value == null) {
          _controller!.forward();
        } else if (status == AnimationStatus.completed &&
            widget.value == null) {
          _controller!.reverse();
        }
      });
    }
  }

  @override
  void didUpdateWidget(GradientProgressIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);

    _setColorsArray();

    _setControllerListener();

    if (widget.value == null && !_controller!.isAnimating) {
      _controller!.reset();
    } else if (widget.value != null) {
      pAnimation = Tween<double>(begin: prevValue, end: widget.value)
          .animate(curvedAnimation);
      _controller!
        ..reset()
        ..forward();
      prevValue = widget.value;
    }
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  void stopAnimation() {
    _controller!.stop();
  }


  Widget _buildIndicator(BuildContext context, double animationValue) {
    return Container(
      color: widget.backgroundColor,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            Expanded(
              flex: animationValue.toInt(),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    gradient: LinearGradient(
                        begin: widget.gradient.begin,
                        end: widget.gradient.end,
                        colors: colors)),
              ),
            ),
            Expanded(flex: (100-widget.value!).toInt(), child: Container(color: Colors.grey.shade200))
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
//    final TextDirection textDirection = Directionality.of(context);
    return AnimatedBuilder(
      animation: pAnimation,
      builder: (BuildContext context, Widget? child) {
        return _buildIndicator(context, pAnimation.value);
      },
    );
  }
}
