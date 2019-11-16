import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // global key
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  // var text field
  final _nama = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _passwordConfirm = TextEditingController();
  // boolean
  bool _namaKosong = false;
  bool _emailKosong = false;
  bool _passwordKosong = false;
  bool _passwordConfirmKosong = false;
  bool _passwordTidakSama = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registrasi"),
      ),
      body: _buildBody(),
      bottomNavigationBar: _buildButtomNav(),
    );
  }

  Widget _buildBody() {
    return Container(
      padding: EdgeInsets.all(10),
      child: ListView(
        children: <Widget>[
          // nama
          TextField(
            controller: _nama,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: "Nama Lengkap",
              errorText: _namaKosong ? "Nama harus diisi" : null,
            ),
          ),
          // email
          TextField(
            controller: _email,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: "Email",
              errorText: _emailKosong ? "Email harus diisi" : null,
            ),
          ),
          // password
          TextField(
            controller: _password,
            obscureText: true,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: "Password",
              suffixIcon: InkWell(
                onTap: (){
                  
                },
                child: Icon(
                  FontAwesomeIcons.eyeSlash,
                  size: 15,
                ),
              ),
              errorText: _passwordKosong ? "Password harus diisi" :
                _passwordTidakSama ? "Password tidak sama" : null,
            ),
          ),
          // password confirm
          TextField(
            controller: _passwordConfirm,
            obscureText: true,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: "Password Confirm",
              errorText: _passwordConfirmKosong ? "Password confirm harus diisi" :
                _passwordTidakSama ? "Password tidak sama" : null,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtomNav() {
    return Container(
      height: 50,
      child: FlatButton(
        color: Colors.grey[300],
        onPressed: (){
          // validasi
          setState(() {
            _nama.text.isEmpty ? _namaKosong = true : _namaKosong = false;
            _email.text.isEmpty ? _emailKosong = true : _emailKosong = false;
            _password.text.isEmpty ? _passwordKosong = true : _passwordKosong = false;
            _passwordConfirm.text.isEmpty ? _passwordConfirmKosong = true : _passwordConfirmKosong = false;
            _password.text != _passwordConfirm.text
                ? _passwordTidakSama = true
                : _passwordTidakSama = false;
          });
          // debug text field
          print("Nama: " + _nama.text);
          print("Email: ${_email.text}");
          print("Password: ${_password.text}");
          print("Password Confirm: ${_passwordConfirm.text}");
          // mau menghapus
          _nama.text = "";
        },
        child: Text("DAFTAR"),
      ),
    );
  }
}
