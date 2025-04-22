import 'package:flutter/material.dart';

class TransactionFormPage extends StatefulWidget {
  const TransactionFormPage({super.key});

  @override
  State<TransactionFormPage> createState() => _TransactionFormPageState();
}

class _TransactionFormPageState extends State<TransactionFormPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _descricaoController = TextEditingController();
  final TextEditingController _valorController = TextEditingController();
  String _tipo = 'Receita';

  void _salvarTransacao() {
    if (_formKey.currentState!.validate()) {
      String descricao = _descricaoController.text;
      double valor = double.parse(_valorController.text);
      String tipo = _tipo;

      print('Transação: $descricao - $valor - $tipo');

      Navigator.of(context).pop(); // Volta para tela anterior
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nova Transação'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _descricaoController,
                decoration: const InputDecoration(labelText: 'Descrição'),
                validator: (value) =>
                    value!.isEmpty ? 'Informe uma descrição' : null,
              ),
              TextFormField(
                controller: _valorController,
                decoration: const InputDecoration(labelText: 'Valor'),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value!.isEmpty ? 'Informe um valor' : null,
              ),
              DropdownButtonFormField<String>(
                value: _tipo,
                items: const [
                  DropdownMenuItem(value: 'Receita', child: Text('Receita')),
                  DropdownMenuItem(value: 'Despesa', child: Text('Despesa')),
                ],
                onChanged: (value) {
                  setState(() {
                    _tipo = value!;
                  });
                },
                decoration: const InputDecoration(labelText: 'Tipo'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _salvarTransacao,
                child: const Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
