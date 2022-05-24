import 'dart:convert';

class Quote {
  final String auther, quote;

  Quote(this.auther, this.quote);

  factory Quote.fromJson(dynamic json) {
    return Quote(json['a'], json['q']);
  }
}
