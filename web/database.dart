import 'package:TRNIdart/TRNIdart.dart';


abstract class Hash {
  int get hashCode;
}

abstract class Data {
  int get data;
}

abstract class ContainsKeyAndGetHash {
  bool containsKey(Object key);
  @S("Top") bool operator [](Object key);
}

class Database {
  @S("Data") Database();

  @S("ContainsKeyAndGetHash") Map<String, int> get data => {
    "mmeneses@dcc.uchile.cl": "12345".hashCode,
    "matias.imc@gmail.com": "123456".hashCode,
  };
}