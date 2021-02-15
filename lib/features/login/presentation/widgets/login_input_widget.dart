import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextInput extends StatelessWidget {
  final String texto;
  final TextInputType tipoDeInput;
  final Color corDoCursor;
  final int tamanhoDaFonte;
  final bool habilitarCorretor;
  final bool habilitarSugestoes;
  final bool habilitarTextoObscuro;
  final TextEditingController controlador;
  final Color corDePreenchimento;

  const TextInput(
      {Key key,
      @required this.texto,
      @required this.tipoDeInput,
      @required this.corDoCursor,
      @required this.tamanhoDaFonte,
      @required this.habilitarCorretor,
      @required this.habilitarSugestoes,
      @required this.habilitarTextoObscuro,
      @required this.controlador,
      @required this.corDePreenchimento})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          hintText: texto,
          fillColor: corDePreenchimento,
          filled: true,
          border: InputBorder.none),
      autocorrect: habilitarCorretor,
      enableSuggestions: habilitarSugestoes,
      obscureText: habilitarTextoObscuro,
      keyboardType: tipoDeInput,
      cursorColor: corDoCursor,
      style: TextStyle(fontSize: tamanhoDaFonte.sp),
      controller: controlador,
    );
  }
}
