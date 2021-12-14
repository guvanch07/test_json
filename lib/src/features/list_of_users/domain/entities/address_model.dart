import 'package:equatable/equatable.dart';

class AddressModel extends Equatable {
  final String street;
  final String suite;
  final String city;
  final String zipcode;

  const AddressModel({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      street: json['street'],
      suite: json['suite'],
      city: json['city'],
      zipcode: json['zipcode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'street': street,
      'suite': suite,
      'city': city,
      'zipcode': zipcode,
    };
  }

  @override
  List<Object?> get props => [
        street,
        suite,
        city,
        zipcode,
      ];
}
