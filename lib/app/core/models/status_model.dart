import 'dart:convert';
import 'package:equatable/equatable.dart';

class StatusModel extends Equatable {
  final String? title;
  final DateTime? date;
  final bool? isActive;
  final int? activeIndex;

  const StatusModel({
    this.title,
    this.date,
    this.isActive,
    this.activeIndex,
  });

  StatusModel copyWith({
    String? title,
    DateTime? date,
    bool? isActive,
    int? activeIndex,
  }) {
    return StatusModel(
      title: title ?? this.title,
      date: date ?? this.date,
      isActive: isActive ?? this.isActive,
      activeIndex: activeIndex ?? this.activeIndex,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'date': date,
      'isActive': isActive,
      'activeIndex': activeIndex,
    };
  }

  factory StatusModel.fromMap(Map<String, dynamic> map) {
    return StatusModel(
      title: map['title'],
      date: map['date'] != null
          ? DateTime.fromMillisecondsSinceEpoch(
              map['date'].millisecondsSinceEpoch)
          : null,
      isActive: map['isActive'],
      activeIndex: map['activeIndex']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory StatusModel.fromJson(String source) =>
      StatusModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'StatusModel(title: $title, date: $date, isActive: $isActive, activeIndex: $activeIndex)';
  }

  @override
  List<Object?> get props => [title, date, isActive, activeIndex];
}
