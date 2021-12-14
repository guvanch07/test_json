import 'package:equatable/equatable.dart';

class CompanyModel extends Equatable {
  final String catchPhrase;
  final String name;
  final String bs;

  const CompanyModel({
    required this.bs,
    required this.name,
    required this.catchPhrase,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      name: json['name'],
      bs: json['bs'],
      catchPhrase: json['catchPhrase'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'bs': bs,
      'catchPhrase': catchPhrase,
    };
  }

  @override
  List<Object?> get props => [
        name,
        bs,
        catchPhrase,
      ];
}
