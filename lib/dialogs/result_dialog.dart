import 'package:floor_calculator/models/result_model.dart';
import 'package:flutter/material.dart';

class ResultDialog extends StatelessWidget {
  final ResultModel result;

  const ResultDialog(this.result);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Resultado'),
      content: Wrap(
        children: [
          ListTile(
            title: Text('${result.amountPieces} pisos'),
            subtitle: Text('Quantidade de pisos'),
          ),
          ListTile(
            title: Text('${result.amountFooter} pisos'),
            subtitle: Text('Quantidade de pisos para o rodapé'),
          ),
          ListTile(
            title: Text('${result.amountPiecesAndFooter} pisos'),
            subtitle: Text('Total de pisos'),
          ),
          Divider(),
          ListTile(
            title: Text(
                '${result.areaWithoutFooter} m² sem rodapé e ${result.areaWithFooter} m² com rodapé'),
            subtitle: Text('Área'),
          ),
          Divider(),
          ListTile(
            title: Text('${result.totalPrice} reais'),
            subtitle: Text('Custo total'),
          ),
        ],
      ),
      actions: [
        FlatButton(
          child: Text('CONTINUAR'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
