import 'package:get_it/get_it.dart';
import 'package:take_my_tym/features/auth/data/datasources/remote_data_source.dart';
import 'package:take_my_tym/features/auth/data/repositories/signin_user_repo_impl.dart';
import 'package:take_my_tym/features/auth/data/repositories/signout_user_repo_impl.dart';
import 'package:take_my_tym/features/auth/data/repositories/signup_user_repo_impl.dart';
import 'package:take_my_tym/features/auth/data/repositories/social_auth_user_repo_impl.dart';
import 'package:take_my_tym/features/auth/domain/repositories/signin_repo.dart';
import 'package:take_my_tym/features/auth/domain/repositories/signout_repo.dart';
import 'package:take_my_tym/features/auth/domain/repositories/signup_repo.dart';
import 'package:take_my_tym/features/auth/domain/repositories/social_auth_repo.dart';
import 'package:take_my_tym/features/auth/domain/usecases/signin_usecase.dart';
import 'package:take_my_tym/features/auth/domain/usecases/signout_usecase.dart';
import 'package:take_my_tym/features/auth/domain/usecases/signup_usecase.dart';
import 'package:take_my_tym/features/auth/domain/usecases/social_auth_usecase.dart';

final class DependencyInject {
  void setupDependencies() {
    ///SignIn
    GetIt.instance.registerLazySingleton<SignInRepo>(
        () => SignInRepoImpl(RemoteDataSource()));
    GetIt.instance.registerLazySingleton<SignInUseCase>(
        () => SignInUseCase(GetIt.instance<SignInRepo>()));

    ///SignUp
    GetIt.instance.registerLazySingleton<SignUpRepo>(
        () => SignUpRepoImpl(RemoteDataSource()));
    GetIt.instance.registerLazySingleton<SignUpUseCase>(
        () => SignUpUseCase(GetIt.instance<SignUpRepo>()));

    ///SoialAuth
    GetIt.instance.registerLazySingleton<SocialAuthRepo>(
        () => SocialAuthRepoImpl(RemoteDataSource()));
    GetIt.instance.registerLazySingleton<SocialAuthUseCase>(
        () => SocialAuthUseCase(GetIt.instance<SocialAuthRepo>()));

    ///SignOut
    GetIt.instance.registerLazySingleton<SignOutRepo>(
        () => SignOutRepoImp(RemoteDataSource()));
    GetIt.instance.registerLazySingleton<SignOutUseCase>(
        () => SignOutUseCase(GetIt.instance<SignOutRepo>()));
  }
}
