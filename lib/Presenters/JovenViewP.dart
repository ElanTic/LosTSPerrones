import 'package:itemtrackers/models/Joven.dart';
import 'package:itemtrackers/rest/RDS_joven.dart';

class JovenViewP {
  late RDS_joven rest;

  JovenViewP() {
    rest = RDS_joven();
  }

  List<Joven> getListaJovenes() {
    List<Joven> lista = [];
    Future<List<Joven>> response = rest.getAllJovenes();
    //for(Joven r in response){
    //alista.append
    //}

    return lista;
  }
}
