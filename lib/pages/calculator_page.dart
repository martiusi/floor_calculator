import 'dart:ui';

import 'package:floor_calculator/dialogs/result_dialog.dart';
import 'package:floor_calculator/controllers/calculator_controller.dart';
import 'package:floor_calculator/helpers/validator_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final _formKey = GlobalKey<FormState>();
  final _controller = CalculatorController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
//optei por um cinza leve no fundo para eliminar o brilho forte do branco
      appBar: AppBar(title: const Text('Calculadora de pisos')),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(15.0),
          child: _buildForm(),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildHeaderText('Dimensões do cômodo'),
          buildVerticalSpace(),
          _buildNumberInputField(
            'Largura (metros)',
            onSaved: _controller.setRoomWidth,
          ),
          buildVerticalSpace(),
          _buildNumberInputField(
            'Comprimento (metros)',
            onSaved: _controller.setRoomLength,
          ),
          buildVerticalSpace(),
          _buildHeaderText('Dimensões do piso'),
          buildVerticalSpace(),
          _buildNumberInputField(
            'Largura (metros)',
            onSaved: _controller.setFloorWidth,
          ),
          buildVerticalSpace(),
          _buildNumberInputField(
            'Comprimento (metros)',
            onSaved: _controller.setFloorLength,
          ),
          buildVerticalSpace(),
          _buildHeaderText('Custo do piso'),
          buildVerticalSpace(),
          //***********campo para valor***********
          _buildNumberInputField(
            'Custo unitário em reais',
            onSaved: _controller.setFloorUnitPrice,
          ),
          buildCalculateButton(),
          buildclearButton(),
        ],
      ),
    );
  }

  Widget _buildNumberInputField(String label, {Function(String) onSaved}) {
    return TextFormField(
      onSaved: onSaved,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.number,
      validator: ValidatorHelper.isValidText,
    );
  }

  Widget buildVerticalSpace({double height = 15}) => SizedBox(height: height);

  Widget buildCalculateButton() {
    return RaisedButton(
      child: Text('CALCULAR'),
      onPressed: _calculate,
    );
  }

  //************botão para limpar*************
  Widget buildclearButton() {
    return RaisedButton(
      child: Text('LIMPAR'),
      onPressed: _clear,
    );
  }

  void _calculate() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      final result = _controller.calculate();
      showDialog(
        context: context,
        builder: (context) => ResultDialog(result),
      );
    }
  }

  void _clear() {
    _formKey.currentState.reset();
  }

  Widget _buildHeaderText(String label) {
    return Container(
      height: 18,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.2),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
