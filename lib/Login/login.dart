import 'package:cine_one/Login/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../Cinema/home_cine_page.dart';
import 'Widgets/text_one.dart';
import 'auxiliar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
    _estaUsuarioAutenticado();
  }

  void _estaUsuarioAutenticado() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        // ignore: avoid_print
        print("Usuario no autenticado");
      } else {
        // ignore: avoid_print
        print("Usuario autenticado");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Login(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  static bool _contrasenaVisible = false;
  static bool visible = false;
  static bool googleVisible = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _contrasenaController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  void initState() {
    super.initState();
    visible = false;
    googleVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 25,
                    color: Color(0xff22222C),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.only(top: 0, bottom: 0.0),
                child: Center(
                  child: Container(
                      width: 250,
                      height: 250,
                      child: Image.asset("Assets/login/logo-black.png")),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 0.0, bottom: 5.0),
                child: Text(
                  'Iniciar sesión',
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: "Roboto",
                    color: Color(0xff22222C),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.mail_outline_rounded,
                        color: Color(0xff22222C),
                      ),
                      labelText: 'Correo electrónico',
                      suffixIcon: Icon(Icons.alternate_email_outlined)),
                ),
              ),
              //password
              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: _contrasenaController,
                  obscureText: !_contrasenaVisible,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    labelText: 'Contraseña',
                    prefixIcon: const Icon(
                      Icons.visibility_off_outlined,
                      color: Color.fromARGB(252, 0, 0, 0),
                    ),
                    suffixIcon: IconButton(
                        icon: Icon(
                          _contrasenaVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: const Color.fromARGB(179, 0, 0, 0),
                        ),
                        onPressed: () {
                          setState(() {
                            _contrasenaVisible = !_contrasenaVisible;
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

              const SizedBox(height: 40),
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
                        text: 'Iniciar sesión',
                        color: Colors.white,
                        fontSize: 22),
                    onPressed: () {
                      if (!_emailController.text.contains('@')) {
                        mostrarSnackBar('Correo electrónico incorrecto', context);
                      } else if (_contrasenaController.text.length < 6) {
                        mostrarSnackBar(
                            'La contraseña debe contener al menos 6 carácteres',
                            context);
                      } else {
                        setState(() {
                          _cambiarEstadoIndicadorProgreso();
                        });
                        acceder(context);
                      }
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
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      child: Container(
                          width: 320,
                          margin: const EdgeInsets.only(),
                          child: LinearProgressIndicator(
                            minHeight: 2,
                            backgroundColor: Colors.blueGrey[800],
                            valueColor:
                                const AlwaysStoppedAnimation(Colors.white),
                          )))),

              //Crear cuenta
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
                        text: 'Crear una cuenta nueva',
                        color: Colors.black,
                        fontSize: 20),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  SignupPage()));
                    },
                  ),
                ),
              ),

              Visibility(
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  visible: googleVisible,
                  child: ClipRRect(
                      borderRadius:
                          const BorderRadius.all(const Radius.circular(10)),
                      child: Container(
                          width: 320,
                          margin: const EdgeInsets.only(bottom: 20),
                          child: LinearProgressIndicator(
                            minHeight: 2,
                            backgroundColor: Colors.blueGrey[800],
                            valueColor: const AlwaysStoppedAnimation(
                                const Color.fromARGB(255, 0, 0, 0)),
                          )))),

              //Icons
              const TextOne(
                  text: ' O ', color: Color(0xffA0A5B9), fontSize: 16),
              const SizedBox(height: 30),

              const _ButtonCustom(
                text: 'Iniciar sesión con Google',
                icon: 'google.png',
              ),
              const SizedBox(height: 20),
              const _ButtonCustom(
                text: 'Iniciar sesión con Facebook',
                icon: 'facebook.png',
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                      height: 1,
                      width: MediaQuery.of(context).size.width * .35,
                      color: Colors.grey[400]),
                  Container(
                      height: 1,
                      width: MediaQuery.of(context).size.width * .35,
                      color: Colors.grey[400]),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> acceder(BuildContext context) async {
    final formState = _formKey.currentState;
    if (formState!.validate()) {
      formState.save();
      try {
        UserCredential credencial = await auth.signInWithEmailAndPassword(
            email: _emailController.text.trim(),
            password: _contrasenaController.text.trim());
        // ignore: use_build_context_synchronously
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeCinePage()));
        setState(() {
          _cambiarEstadoIndicadorProgreso();
        });
      } on FirebaseAuthException catch (e) {
        if (e.code == "user-not-found") {
          mostrarSnackBar("Usuario no identificado", context);
        } else if (e.code == "wrong-password") {
          mostrarSnackBar("Contraseña incorrecta", context);
        } else {
          mostrarSnackBar("Lo sentimos, hubo un error", context);
        }
        setState(() {
          _cambiarEstadoIndicadorProgreso();
        });
      }
    }
  }

  Future<void> accederGoogle(BuildContext context) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken);
      await auth.signInWithCredential(credential);
      _formKey.currentState!.save();
      // ignore: use_build_context_synchronously
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeCinePage()));
    } catch (e) {
      mostrarSnackBar("Lo sentimos, se produjo un error", context);
    } finally {
      setState(() {
        _cambiarEstadoIndicadorProgresoGoogle();
      });
    }
  }

  void _cambiarEstadoIndicadorProgreso() {
    visible = !visible;
  }

  void _cambiarEstadoIndicadorProgresoGoogle() {
    googleVisible = !googleVisible;
  }

  @override
  void dispose() {
    _emailController.dispose();
    _contrasenaController.dispose();
    super.dispose();
  }
}

class _ButtonCustom extends StatelessWidget {
  final String text;
  final String icon;

  const _ButtonCustom({required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Color(0xffA0A5B9).withOpacity(0.35),
                    spreadRadius: 1,
                    blurRadius: 20)
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('Assets/login/$icon', height: 20),
              const SizedBox(width: 15.0),
              TextOne(
                  text: text, color: const Color(0xffA0A5B9), fontSize: 16)
            ],
          ),
        ),
      ),
    );
  }
}