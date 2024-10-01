import 'package:flutter/material.dart';
import 'package:showroom_maqueta/rutas/routes.dart';
import 'package:google_fonts/google_fonts.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late bool isObscured;
  final _formKey = GlobalKey<FormState>();
  final passwordFocusNode = FocusNode();
  final userFocusNode = FocusNode();
  String user = '';
  String pass = '';
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
   
  @override
  void initState() {
    super.initState();
    isObscured = true;
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (MediaQuery.of(context).size.height > MediaQuery.of(context).size.width)... [
                  Center(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(30),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Image.asset(
                                'images/ufo-logo.png',
                                fit: BoxFit.fill,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Bienvenido',
                                style: GoogleFonts.inter(
                                  fontSize: 28,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Inicia Sesion en tu cuenta',
                                style: GoogleFonts.inter(
                                  fontSize: 17,
                                  color: Colors.orange,
                                ),
                              ),
                              const SizedBox(height: 35),
                              Form(
                                key: _formKey,
                                child: TextFormField(
                                  controller: usernameController,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(),
                                      borderRadius: BorderRadius.circular(20)
                                    ),
                                  fillColor: Colors.white,
                                  filled: true,
                                  prefixIcon: const Icon(Icons.person),
                                  prefixIconColor:  Colors.orange,
                                  hintText: 'Ingrese su usuario'),
                                  validator: (value) {
                                    if (value!.isEmpty || value.trim().isEmpty){
                                      return 'Ingrese un usuario valido';
                                    }
                                    return null;
                                  },
                                  onSaved:(newValue) => user = newValue!,
                                )
                              ),
                              const SizedBox(height: 20),
                              Form(
                                child: TextFormField(
                                  controller: passwordController,
                                  obscureText: isObscured,
                                  focusNode: passwordFocusNode,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(),
                                      borderRadius: BorderRadius.circular(20)
                                    ),
                                    fillColor: Colors.white,
                                    filled: true,
                                    prefixIcon: const Icon(Icons.lock),
                                    prefixIconColor: Colors.orange,
                                    suffixIcon: IconButton(
                                      padding: const EdgeInsetsDirectional.only(end: 12.0),
                                      icon: isObscured
                                        ? const Icon(
                                            Icons.visibility_off,
                                            color: Colors.black,
                                          )
                                        : const Icon(Icons.visibility, color: Colors.black),
                                        onPressed: () {
                                          setState(() {
                                            isObscured = !isObscured;
                                          });
                                        },
                                      ),
                                    hintText: 'Ingrese su contraseña'
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty ||
                                        value.trim().isEmpty) {
                                      return 'Ingrese su contraseña';
                                    }
                                    if (value.length < 6) {
                                      return 'Contraseña invalida';
                                    }
                                    return null;
                                  },
                                  onFieldSubmitted: (value) async {
                                    await login(context);
                                  },
                                  onSaved: (newValue) => pass = newValue!,
                                )
                              ),
                              const SizedBox(height: 40,),
                              ElevatedButton(
                                style: const ButtonStyle(
                                  backgroundColor: WidgetStatePropertyAll(Colors.white),
                                  elevation: WidgetStatePropertyAll(10),
                                  shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.horizontal(
                                        left: Radius.circular(50),
                                        right: Radius.circular(50)
                                      )
                                    )
                                  )
                                ),
                                onPressed: () async{
                                  await login(context);
                                },
                                child: Text(
                                  'Iniciar Sesión',
                                  style: TextStyle(
                                    color: Colors.orange,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20
                                  ),
                                )
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ] else ...[
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                             height: MediaQuery.of(context).size.height * 0.962,
                             width: MediaQuery.of(context).size.width / 2,
                              // child: Image.asset(
                              //   'images/logo.png',
                              // ),
                              child: Placeholder(
                                child: Text('Logo'),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                constraints: const BoxConstraints(maxWidth: 18),
                                padding: const EdgeInsets.symmetric(horizontal: 45),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      'Bienvenido',
                                      style: GoogleFonts.inter(
                                        fontSize: 28,
                                        color: Colors.grey.shade700,
                                        fontWeight: FontWeight.w900
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      'Inicia Sesion en tu cuenta',
                                      style: GoogleFonts.inter(
                                        fontSize: 17,
                                        color: Colors.red,
                                        fontWeight: FontWeight.w700
                                      ),
                                    ),
                                    const SizedBox(height: 35),
                                    Form(
                                      key: _formKey,
                                      child: Column(
                                        children: [
                                          TextFormField(
                                            controller: usernameController,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderSide: const BorderSide(),
                                                borderRadius: BorderRadius.circular(20)
                                              ),
                                            fillColor: Colors.white,
                                            filled: true,
                                            prefixIcon: const Icon(Icons.person),
                                            prefixIconColor:Colors.red,
                                            hintText: 'Ingrese su usuario'),
                                            validator: (value) {
                                              if (value!.isEmpty ||
                                                value.trim().isEmpty) {
                                                return 'Ingrese un usuario valido';
                                              }
                                              return null;
                                            },
                                            onSaved: (newValue) => user = newValue!
                                          ),
                                          const SizedBox(height: 20,),
                                          TextFormField(
                                            controller: passwordController,
                                            obscureText: isObscured,
                                            focusNode: passwordFocusNode,
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderSide: const BorderSide(),
                                                borderRadius:BorderRadius.circular(20)
                                              ),
                                              fillColor: Colors.white,
                                              filled: true,
                                              prefixIcon: const Icon(Icons.lock),
                                              prefixIconColor: Colors.red, //const Color.fromARGB(255, 41, 146, 41)  
                                              suffixIcon: IconButton(
                                                padding: const EdgeInsetsDirectional.only(end: 12.0),
                                              icon: isObscured? 
                                                const Icon(
                                                  Icons.visibility_off,
                                                  color: Colors.black,
                                                ) : const Icon(
                                                  Icons.visibility,
                                                  color: Colors.black
                                                ),
                                                onPressed: () {
                                                  setState(() {
                                                    isObscured = !isObscured;
                                                  });
                                                },
                                              ),
                                              hintText: 'Ingrese su contraseña'
                                            ),
                                            validator: (value) {
                                              if (value!.isEmpty || value.trim().isEmpty) {
                                                return 'Ingrese su contraseña';
                                              }
                                              if (value.length < 6) {
                                               return 'Contraseña invalida';
                                              }
                                              return null;
                                            },
                                            onFieldSubmitted: (value) async {
                                             await login(context);
                                            },
                                            onSaved: (newValue) => pass = newValue!
                                          ),
                                          const SizedBox(height: 40,),
                                          ElevatedButton(
                                            style: const ButtonStyle(
                                              backgroundColor: WidgetStatePropertyAll(Colors.white),
                                              elevation: WidgetStatePropertyAll(10),
                                              shape: WidgetStatePropertyAll(
                                                RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.horizontal(
                                                    left: Radius.circular(50),
                                                    right: Radius.circular(50),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            onPressed: () async {
                                              await login(context);
                                            },
                                            child: Padding(
                                              padding:const EdgeInsets.symmetric(vertical: 8.5),
                                              child: Text('Iniciar Sesión',
                                                style: TextStyle(
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 25,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> login(BuildContext context) async {
    // await _loginServices.login(
    //   usernameController.text,
    //   passwordController.text,
    //   context,
    // );

    if (_formKey.currentState?.validate() == true) {
      // var statusCode = await _loginServices.getStatusCode();

      // if (statusCode == 200) {
        router.go('/menu');
      // } else if (statusCode == null) {
        
      // }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Credenciales inválidas. Intente nuevamente.'),
          backgroundColor: Colors.red,
        ),
      );
      print('Credenciales inválidas. Intente nuevamente.');
    }
  }
}
