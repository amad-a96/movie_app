import 'dart:convert';
import 'package:equatable/equatable.dart';

class OrderStatusHistoryModel extends Equatable {
  final String? title;
  final DateTime? date;
  final String? status;

  const OrderStatusHistoryModel({
    this.title,
    this.date,
    this.status,
  });

  OrderStatusHistoryModel copyWith({
    String? title,
    DateTime? date,
    String? status,
  }) {
    return OrderStatusHistoryModel(
      title: title ?? this.title,
      date: date ?? this.date,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'date': date,
      'status': status,
    };
  }

  factory OrderStatusHistoryModel.fromMap(Map<String, dynamic> map) {
    return OrderStatusHistoryModel(
      title: map['title'],
      date: map['date'] != null
          ? DateTime.fromMillisecondsSinceEpoch(
              map['date'].millisecondsSinceEpoch)
          : null,
      status: map['status'],
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderStatusHistoryModel.fromJson(String source) =>
      OrderStatusHistoryModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'OrderStatusHistoryModel(title: $title, date: $date, status: $status)';

  @override
  List<Object?> get props => [title, date, status];
}
