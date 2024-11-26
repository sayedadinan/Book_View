import 'package:books_app/core/utils/extentions.dart';
import 'package:books_app/core/utils/shared_preference.dart';
import 'package:books_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:books_app/features/auth/data/repositeries/auth_repository_impl.dart';
import 'package:books_app/features/auth/domain/usecase/register_user.dart';
import 'package:books_app/features/auth/presentation/bloc/bloc/auth_bloc_bloc.dart';
import 'package:books_app/features/auth/presentation/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

void main() async {
  final authRemoteDataSource = AuthRemoteDataSourceImpl(client: http.Client());
  final authRepository =
      AuthRepositoryImpl(remoteDataSource: authRemoteDataSource);
  final registerUser = RegisterUser(repository: authRepository);

  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesHelper.init();

  runApp(MyApp(registerUser: registerUser));
}

class MyApp extends StatelessWidget {
  final RegisterUser registerUser;

  const MyApp({super.key, required this.registerUser});

  @override
  Widget build(BuildContext context) {
    AppMediaquery().init(context);
  
    return BlocProvider(
      create: (_) => AuthBloc(registerUser: registerUser),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
