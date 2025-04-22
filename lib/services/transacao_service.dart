import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/transacao.dart';

class TransacaoService {
  static const String chave = 'transacoes';

  Future<void> salvarTransacoes(List<Transacao> lista) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> dados = lista
        .map((t) => jsonEncode({
              'descricao': t.descricao,
              'valor': t.valor,
              'tipo': t.tipo,
              'data': t.data.toIso8601String(),
            }))
        .toList();
    await prefs.setStringList(chave, dados);
  }

  Future<List<Transacao>> carregarTransacoes() async {
    final prefs = await SharedPreferences.getInstance();
    final dados = prefs.getStringList(chave) ?? [];

    return dados.map((json) {
      final map = jsonDecode(json);
      return Transacao(
        descricao: map['descricao'],
        valor: map['valor'],
        tipo: map['tipo'],
        data: DateTime.parse(map['data']),
      );
    }).toList();
  }
}
