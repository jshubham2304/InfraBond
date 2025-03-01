import 'package:flutter/material.dart';

class HighlightedText extends StatelessWidget {
  final String text;
  final String highlightText;
  final TextStyle style;
  final TextStyle highlightStyle;
  final TextOverflow overflow;
  final int? maxLines;

  const HighlightedText({
    Key? key,
    required this.text,
    required this.highlightText,
    required this.style,
    required this.highlightStyle,
    this.overflow = TextOverflow.clip,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (highlightText.isEmpty) {
      return Text(
        text,
        style: style,
        overflow: overflow,
        maxLines: maxLines,
      );
    }

    final List<TextSpan> spans = [];
    final String lowerCaseText = text.toLowerCase();
    final String lowerCaseHighlight = highlightText.toLowerCase();

    int start = 0;
    int indexOfHighlight;

    do {
      indexOfHighlight = lowerCaseText.indexOf(lowerCaseHighlight, start);
      if (indexOfHighlight < 0) {
        // No more matches
        if (start < text.length) {
          spans.add(TextSpan(
            text: text.substring(start),
            style: style,
          ));
        }
        break;
      }

      if (indexOfHighlight > start) {
        // Add the text before the highlight
        spans.add(TextSpan(
          text: text.substring(start, indexOfHighlight),
          style: style,
        ));
      }

      // Add the highlighted text
      spans.add(TextSpan(
        text: text.substring(indexOfHighlight, indexOfHighlight + highlightText.length),
        style: highlightStyle,
      ));

      start = indexOfHighlight + highlightText.length;
    } while (start < text.length);

    return RichText(
      text: TextSpan(children: spans),
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}
