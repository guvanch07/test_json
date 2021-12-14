import 'package:equatable/equatable.dart';

import 'address_model.dart';
import 'company_model.dart';

class ListOfEntities extends Equatable {
  final int id;
  final String username;
  final String name;
  final String email;
  final String phone;
  final String website;
  final CompanyModel company;
  final AddressModel address;

  const ListOfEntities({
    required this.id,
    required this.username,
    required this.name,
    required this.email,
    required this.phone,
    required this.website,
    required this.company,
    required this.address,
  });

  factory ListOfEntities.fromJson(Map<String, dynamic> json) {
    return ListOfEntities(
      name: json['name'],
      username: json['username'],
      id: json['id'],
      email: json['email'],
      phone: json['phone'],
      website: json['website'],
      address: AddressModel.fromJson(json['address']),
      company: CompanyModel.fromJson(json['company']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'username': username,
      'id': id,
      'email': email,
      'phone': phone,
      'website': website,
      'company': company.toJson(),
      'address': address.toJson(),
    };
  }

  @override
  List<Object?> get props =>
      [name, id, username, email, phone, website, address, company];
}
