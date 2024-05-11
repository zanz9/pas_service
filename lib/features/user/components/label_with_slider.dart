import 'package:flutter/material.dart';

class LabelWithSlider extends StatefulWidget {
  const LabelWithSlider({
    super.key,
    required this.onChanged,
    required this.text,
    this.value = 1,
  });
  final String text;
  final double value;
  final Function(double) onChanged;

  @override
  State<LabelWithSlider> createState() => _LabelWithSliderState();
}

class _LabelWithSliderState extends State<LabelWithSlider> {
  double value = 0;
  @override
  void initState() {
    super.initState();
    value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      children: [
        Text(widget.text, style: theme.textTheme.labelLarge),
        Slider(
          value: value,
          onChanged: (v) {
            widget.onChanged(v);
            value = v;
            setState(() {});
          },
          max: 10,
          min: 0,
          divisions: 10,
          label: value.toInt().toString(),
        ),
      ],
    );
  }
}
