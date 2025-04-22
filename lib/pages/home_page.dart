import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double totalReceitas = 0;
  double totalDespesas = 0;

  @override
  Widget build(BuildContext context) {
    double saldo = totalReceitas - totalDespesas;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Controle Financeiro'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              child: ListTile(
                title: const Text('Saldo'),
                subtitle: Text('R\$ ${saldo.toStringAsFixed(2)}'),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Card(
                    color: Colors.green[100],
                    child: ListTile(
                      title: const Text('Receitas'),
                      subtitle: Text('R\$ ${totalReceitas.toStringAsFixed(2)}'),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Card(
                    color: Colors.red[100],
                    child: ListTile(
                      title: const Text('Despesas'),
                      subtitle: Text('R\$ ${totalDespesas.toStringAsFixed(2)}'),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          'fabianoolliveirarj',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
