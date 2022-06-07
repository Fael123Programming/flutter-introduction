import 'dart:convert';

Company companyFromJson(String str) => Company.fromMap(json.decode(str));

String companyToJson(Company company) => json.encode(company.toMap());

class Company {
    String name;
    String catchPhrase;
    String bs;
    
    Company({
        required this.name,
        required this.catchPhrase,
        required this.bs
    });


    factory Company.fromMap(Map<String, dynamic> map) => Company(
        name: map["name"],
        catchPhrase: map["catchPhrase"],
        bs: map["bs"],
    );

    Map<String, dynamic> toMap() => {
        "name": name,
        "catchPhrase": catchPhrase,
        "bs": bs,
    };
}
