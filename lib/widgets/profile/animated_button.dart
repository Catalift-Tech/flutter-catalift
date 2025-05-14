import 'package:flutter/material.dart';
import 'package:new_task_app/constants/color_const.dart';

class AnimatedButton extends StatefulWidget {
  final String text;
  final bool primary;
  final VoidCallback onTap;

  const AnimatedButton({
    super.key,
    required this.text,
    required this.primary,
    required this.onTap,
  });

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Define colors based on whether it's primary or secondary button
    final Color bgColor =
        widget.primary ? AppColors.primaryColor : Color(0xffe6e6ef);

    final Color textColor =
        widget.primary ? Color(0xffe6e6ef) : AppColors.primaryColor;

    final Color borderColor =
        widget.primary ? Colors.transparent : AppColors.primaryColor;

    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _isPressed = true;
        });
        _controller.forward();
      },
      onTapUp: (_) {
        setState(() {
          _isPressed = false;
        });
        _controller.reverse();
        widget.onTap();
      },
      onTapCancel: () {
        setState(() {
          _isPressed = false;
        });
        _controller.reverse();
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Container(
              height: 40,
              width: 160,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: borderColor, width: 2),
                boxShadow:
                    _isPressed
                        ? []
                        : [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
              ),
              child: Center(
                child: Text(
                  widget.text,
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
