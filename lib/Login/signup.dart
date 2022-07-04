import 'package:cine_one/Login/auxiliar.dart';
import 'package:cine_one/Login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Cinema/home_cine_page.dart';
import 'Widgets/text_one.dart';

class SignupPage extends StatefulWidget {
  @override
  SignupPageState createState() => SignupPageState();
}

class SignupPageState extends State<SignupPage> {
  bool _contrasenaVisible1 = false;
  bool _contrasenaVisible2 = false;
  static bool visible = false;
  FirebaseAuth auth = FirebaseAuth.instance;

  void initState() {
    super.initState();
    visible = false;
  }

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _usuarioController = TextEditingController();
  TextEditingController _contrasenaController1 = TextEditingController();
  TextEditingController _contrasenaController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return Scaffold(
      body: Container(
        child: Scaffold(
          backgroundColor: Color.fromARGB(255, 245, 245, 245),
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 210,
                        color: const Color(0xff22222C),
                      ),
                      Positioned(
                        top: 110,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 50,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 245, 245, 245),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 110,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: const Color(0xff22222C),
                              borderRadius: const BorderRadius.only(
                                  bottomRight: const Radius.circular(40.0)),
                              border: Border.all(
                                  color: const Color(0xff22222C), width: 0)),
                        ),
                      ),
                      Positioned(
                        top: 160,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 245, 245, 245),
                              borderRadius: const BorderRadius.only(
                                  topLeft: const Radius.circular(40.0)),
                              border: Border.all(color: Color.fromARGB(255, 245, 245, 245))),
                        ),
                      ),
                      Positioned(
                        top: 55,
                        left: 20,
                        child: Container(
                            height: 70,
                            width: 70,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                'assets/login/logo.png',
                              ),
                            )),
                      ),
                      const Positioned(
                          top: 75,
                          left: 100,
                          child: TextOne(
                              text: 'CineOne',
                              fontSize: 25,
                              color: Colors.white)),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 0.0, bottom: 5.0),
                    child: Text(
                      'Crear una cuenta nueva',
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 25,
                        color: Color(0xff22222C),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.mail_outline_rounded,
                            color: Color.fromARGB(252, 0, 0, 0),
                          ),
                          labelText: 'Correo electrónico',
                          suffixIcon: Icon(Icons.alternate_email_outlined)),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextField(
                      controller: _usuarioController,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.account_circle_outlined,
                            color: Color.fromARGB(252, 0, 0, 0),
                          ),
                          labelText: 'Nombre de usuario',
                          suffixIcon: Icon(Icons.person)),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextField(
                      keyboardType: TextInputType.visiblePassword,
                      controller: _contrasenaController1,
                      obscureText: !_contrasenaVisible1,
                      decoration: InputDecoration(
                        labelText: 'Contraseña',
                        prefixIcon: const Icon(
                          Icons.visibility_off_outlined,
                          color: Color.fromARGB(252, 0, 0, 0),
                        ),
                        suffixIcon: IconButton(
                            icon: Icon(
                              _contrasenaVisible1
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: const Color.fromARGB(179, 0, 0, 0),
                            ),
                            onPressed: () {
                              setState(() {
                                _contrasenaVisible1 = !_contrasenaVisible1;
                              });
                            }),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          borderSide:
                              const BorderSide(color: Colors.white, width: 2),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextField(
                      keyboardType: TextInputType.visiblePassword,
                      controller: _contrasenaController2,
                      obscureText: !_contrasenaVisible2,
                      decoration: InputDecoration(
                        labelText: 'Confirmar contraseña',
                        prefixIcon: const Icon(
                          Icons.visibility_off_outlined,
                          color: Color.fromARGB(252, 0, 0, 0),
                        ),
                        suffixIcon: IconButton(
                            icon: Icon(
                              _contrasenaVisible2
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: const Color.fromARGB(179, 0, 0, 0),
                            ),
                            onPressed: () {
                              setState(() {
                                _contrasenaVisible2 = !_contrasenaVisible2;
                              });
                            }),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          borderSide: BorderSide(color: Colors.white, width: 2),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      height: 55,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: const Color(0xff22222C),
                          borderRadius: BorderRadius.circular(7.0)),
                      child: TextButton(
                        child: const TextOne(
                            text: 'Crear cuenta',
                            color: Colors.white,
                            fontSize: 22),
                        onPressed: () {
                          if (!_emailController.text.contains('@')) {
                            mostrarSnackBar(
                                'Introduzca un correo electrónico correcto', context);
                          } else if (_usuarioController.text.isEmpty) {
                            mostrarSnackBar('Introduzca su nombre', context);
                          } else if (_contrasenaController1.text.length < 6) {
                            mostrarSnackBar(
                                'La contraseña debe tener al menos 6 carácteres',
                                context);
                          } else if (_contrasenaController1.text !=
                              _contrasenaController2.text) {
                            mostrarSnackBar(
                                'Las contraseñas no coinciden', context);
                          } else {
                            setState(() {
                              cambiarVisibilidadIndicadorProgreso();
                            });
                            registroNuevoUsuario(context);
                          }
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      height: 55,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7.0),
                          border: Border.all(
                              color: const Color(0xff22222C).withOpacity(.3))),
                      child: TextButton(
                        child: const TextOne(
                            text: 'Cancelar',
                            color: Colors.black,
                            fontSize: 20),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const LoginPage()));
                        },
                      ),
                    ),
                  ),
                  Visibility(
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
                    visible: visible,
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: Container(
                            width: 290,
                            margin: EdgeInsets.only(),
                            child: LinearProgressIndicator(
                              minHeight: 2,
                              backgroundColor: Colors.blueGrey[800],
                              valueColor: AlwaysStoppedAnimation(Colors.white),
                            ))),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _contrasenaController1.dispose();
    _contrasenaController2.dispose();
    _usuarioController.dispose();
    super.dispose();
  }

  Future<void> registroNuevoUsuario(BuildContext context) async {
    // ignore: unused_local_variable
    User usuario;
    try {
      usuario = (await auth.createUserWithEmailAndPassword(
              email: _emailController.text.trim(),
              password: _contrasenaController1.text.trim()))
          .user!;
      mostrarSnackBar("Usuario registrado correctamente", context);
      Navigator.pop(context);
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => HomeCinePage()));
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        mostrarSnackBar("Contraseña demasidado débil", context);
      } else if (e.code == "email-already-in-use") {
        mostrarSnackBar("Ese usuario ya existe", context);
      } else {
        mostrarSnackBar("Lo sentimos, hubo un error", context);
      }
    } catch (e) {
      mostrarSnackBar("Lo sentimos, hubo un error", context);
    } finally {
      setState(() {
        cambiarVisibilidadIndicadorProgreso();
      });
    }
  }

  void cambiarVisibilidadIndicadorProgreso() {
    visible = !visible;
  }
}