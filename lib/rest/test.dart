import 'package:itemtrackers/models/FichaObjetoP.dart';
import 'package:itemtrackers/rest/RDS_Publicacion.dart';

class test {
  RDS_Publicacion rdsp = RDS_Publicacion();
  late Future<FichaObjetoP> ficha = rdsp.getFichaObjetoP('1');
  late Future<List<FichaObjetoP>> fichas = rdsp.getAll();
}
