import 'dart:convert';

import 'package:equatable/equatable.dart';

class OfficeModel extends Equatable {
  final String? id;
  final String? name;
  final String? imgUrl;
  final String? email;
  final String? phone;
  final String? address;
  final String? rule;
  final double? balanceInCashier;
  final double? completedOrderBalance;
  final double? pendingBalance;
  final double? arrivedOrdersBalance;
  final double? totalDriverAvailableBalance;
  final double? officeOrdersBalance;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<String>? userTokens;
  //don't save this in database
  final String? password;

  const OfficeModel(
      {this.id,
      this.name,
      this.imgUrl,
      this.email,
      this.phone,
      this.address,
      this.rule,
      this.balanceInCashier,
      this.completedOrderBalance,
      this.pendingBalance,
      this.arrivedOrdersBalance,
      this.totalDriverAvailableBalance,
      this.officeOrdersBalance,
      this.createdAt,
      this.updatedAt,
      this.userTokens,
      this.password});

  OfficeModel copyWith({
    String? id,
    String? name,
    String? imgUrl,
    String? email,
    String? phone,
    String? address,
    String? rule,
    double? balanceInCashier,
    double? completedOrderBalance,
    double? pendingBalance,
    double? arrivedOrdersBalance,
    double? totalDriverAvailableBalance,
    double? officeOrdersBalance,
    List<String>? userTokens,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return OfficeModel(
      id: id ?? this.id,
      name: name ?? this.name,
      imgUrl: imgUrl ?? this.imgUrl,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      rule: rule ?? this.rule,
      balanceInCashier: balanceInCashier ?? this.balanceInCashier,
      completedOrderBalance:
          completedOrderBalance ?? this.completedOrderBalance,
      pendingBalance: pendingBalance ?? this.pendingBalance,
      arrivedOrdersBalance: arrivedOrdersBalance ?? this.arrivedOrdersBalance,
      totalDriverAvailableBalance:
          totalDriverAvailableBalance ?? this.totalDriverAvailableBalance,
      officeOrdersBalance: officeOrdersBalance ?? this.officeOrdersBalance,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      userTokens: userTokens ?? this.userTokens,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'imgUrl': imgUrl,
      'email': email,
      'phone': phone,
      'address': address,
      'rule': rule,
      'balanceInCashier': balanceInCashier,
      'completedOrderBalance': completedOrderBalance,
      'pendingBalance': pendingBalance,
      'arrivedOrdersBalance': arrivedOrdersBalance,
      'totalDriverAvailableBalance': totalDriverAvailableBalance,
      'officeOrdersBalance': officeOrdersBalance,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'userTokens': userTokens,
    };
  }

  factory OfficeModel.fromMap(Map<String, dynamic> map) {
    return OfficeModel(
      id: map['id'],
      name: map['name'],
      imgUrl: map['imgUrl'],
      email: map['email'],
      phone: map['phone'],
      address: map['address'],
      rule: map['rule'],
      balanceInCashier: map['balanceInCashier']?.toDouble(),
      completedOrderBalance: map['completedOrderBalance']?.toDouble(),
      pendingBalance: map['pendingBalance']?.toDouble(),
      arrivedOrdersBalance: map['arrivedOrdersBalance']?.toDouble(),
      totalDriverAvailableBalance:
          map['totalDriverAvailableBalance']?.toDouble(),
      officeOrdersBalance: map['officeOrdersBalance']?.toDouble(),
      createdAt: map['createdAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(
              map['createdAt'].millisecondsSinceEpoch)
          : null,
      updatedAt: map['updatedAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(
              map['updatedAt'].millisecondsSinceEpoch)
          : null,
      userTokens: map['userTokens'] == null
          ? null
          : List<String>.from(map['userTokens']),
    );
  }

  String toJson() => json.encode(toMap());

  factory OfficeModel.fromJson(String source) =>
      OfficeModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'OfficeModel(id: $id, name: $name, imgUrl: $imgUrl, email: $email, phone: $phone, address: $address, rule: $rule, balanceInCashier: $balanceInCashier, completedOrderBalance: $completedOrderBalance, pendingBalance: $pendingBalance, arrivedOrdersBalance: $arrivedOrdersBalance, totalDriverAvailableBalance: $totalDriverAvailableBalance, officeOrdersBalance: $officeOrdersBalance, createdAt: $createdAt, updatedAt: $updatedAt, serTokens: $userTokens)';
  }

  @override
  List<Object?> get props {
    return [
      id,
      name,
      imgUrl,
      email,
      phone,
      address,
      rule,
      balanceInCashier,
      completedOrderBalance,
      pendingBalance,
      arrivedOrdersBalance,
      totalDriverAvailableBalance,
      officeOrdersBalance,
      createdAt,
      updatedAt,
      userTokens,
    ];
  }
}
