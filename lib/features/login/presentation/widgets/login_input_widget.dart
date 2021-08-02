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
  final Function onChanged;
  final Function onEditingComplete;
  final String textoDeErro;

  const TextInput(
      {Key key,
      @required this.texto,
      @required this.tamanhoDaFonte,
      @required this.corDePreenchimento,
      this.controlador,
      this.corDoCursor,
      this.habilitarCorretor,
      this.habilitarTextoObscuro,
      this.habilitarSugestoes,
      this.tipoDeInput,
      this.onChanged,
      this.textoDeErro,
      this.onEditingComplete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          hintText: texto,
          fillColor: corDePreenchimento,
          filled: true,
          border: InputBorder.none,
          errorText: textoDeErro != null ? textoDeErro : null),
      autocorrect: habilitarCorretor != null ? habilitarCorretor : true,
      enableSuggestions: habilitarSugestoes != null ? habilitarSugestoes : true,
      obscureText:
          habilitarTextoObscuro != null ? habilitarTextoObscuro : false,
      keyboardType: tipoDeInput != null ? tipoDeInput : null,
      cursorColor: corDoCursor != null ? corDoCursor : Colors.green,
      style: TextStyle(fontSize: tamanhoDaFonte.sp),
      controller: controlador != null ? controlador : null,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
    );
  }
}
