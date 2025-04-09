import 'package:uuid/uuid.dart';

import '/database/database_helper.dart';
import '/models/receita.dart';

class ReceitaRepository {
  static final DatabaseHelper _db = DatabaseHelper();

  Future<int> adicionar(Receita receita) async {
    return _db.inserir("receita", receita.toMap());
  }

  Future<int> editar(Receita receita) async {
    return _db.editar(
      "receita",
      receita.toMap(),
      condicao: 'id = ?',
      conidcaoArgs: [receita.id],
    );
  }

  Future<List<Receita>> todasReceitas() async {
    var receitasNoBanco = await _db.obterTodos("receita");
    List<Receita> listaDeReceitas = [];

    for (var i = 0; i < receitasNoBanco.length; i++) {
      listaDeReceitas.add(Receita.fromMap(receitasNoBanco[i]));
    }

    return listaDeReceitas;
  }
}
