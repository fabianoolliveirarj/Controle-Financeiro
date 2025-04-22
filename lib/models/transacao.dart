class Transacao {
  final String descricao;
  final double valor;
  final String tipo; // Receita ou Despesa
  final DateTime data;

  Transacao({
    required this.descricao,
    required this.valor,
    required this.tipo,
    required this.data,
  });
}
