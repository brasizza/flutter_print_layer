// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter_print_layer/core/enum/print_enum.dart';

class TextModel {
  final String text;
  int fontSize;
  bool? bold;
  bool? underline;
  bool? wordwrap;
  int? lineHeight;
  int? letterSpacing;
  int? marginLeft;
  PrintAlignLayer algin;
  TextModel({
    required this.text,
    required this.fontSize,
    this.bold,
    this.underline,
    this.wordwrap,
    this.lineHeight,
    this.letterSpacing,
    this.marginLeft,
    required this.algin,
  });

  TextModel copyWith({
    String? text,
    int? fontSize,
    bool? bold,
    bool? underline,
    bool? wordwrap,
    int? lineHeight,
    int? letterSpacing,
    int? marginLeft,
    PrintAlignLayer? algin,
  }) {
    return TextModel(
      text: text ?? this.text,
      fontSize: fontSize ?? this.fontSize,
      bold: bold ?? this.bold,
      underline: underline ?? this.underline,
      wordwrap: wordwrap ?? this.wordwrap,
      lineHeight: lineHeight ?? this.lineHeight,
      letterSpacing: letterSpacing ?? this.letterSpacing,
      marginLeft: marginLeft ?? this.marginLeft,
      algin: algin ?? this.algin,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'text': text,
      'fontSize': fontSize,
      'bold': bold,
      'underline': underline,
      'wordwrap': wordwrap,
      'lineHeight': lineHeight,
      'letterSpacing': letterSpacing,
      'marginLeft': marginLeft,
      'algin': algin,
    };
  }

  factory TextModel.fromMap(Map<String, dynamic> map) {
    return TextModel(
      text: map['text'] as String,
      fontSize: map['fontSize'] as int,
      bold: map['bold'] != null ? map['bold'] as bool : null,
      underline: map['underline'] != null ? map['underline'] as bool : null,
      wordwrap: map['wordwrap'] != null ? map['wordwrap'] as bool : null,
      lineHeight: map['lineHeight'] != null ? map['lineHeight'] as int : null,
      letterSpacing: map['letterSpacing'] != null ? map['letterSpacing'] as int : null,
      marginLeft: map['marginLeft'] != null ? map['marginLeft'] as int : null,
      algin: PrintAlignLayer.values.firstWhere(
        (element) => element.value == map['algin'],
        orElse: () => PrintAlignLayer.LEFT,
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory TextModel.fromJson(String source) => TextModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TextModel(text: $text, fontSize: $fontSize, bold: $bold, underline: $underline, wordwrap: $wordwrap, lineHeight: $lineHeight, letterSpacing: $letterSpacing, marginLeft: $marginLeft, algin: $algin)';
  }

  @override
  bool operator ==(covariant TextModel other) {
    if (identical(this, other)) return true;

    return other.text == text && other.fontSize == fontSize && other.bold == bold && other.underline == underline && other.wordwrap == wordwrap && other.lineHeight == lineHeight && other.letterSpacing == letterSpacing && other.marginLeft == marginLeft && other.algin == algin;
  }

  @override
  int get hashCode {
    return text.hashCode ^ fontSize.hashCode ^ bold.hashCode ^ underline.hashCode ^ wordwrap.hashCode ^ lineHeight.hashCode ^ letterSpacing.hashCode ^ marginLeft.hashCode ^ algin.hashCode;
  }
}
