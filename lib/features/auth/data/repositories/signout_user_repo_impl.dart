import 'package:take_my_tym/features/auth/data/datasources/remote_data_source.dart';
import 'package:take_my_tym/features/auth/domain/repositories/signout_repo.dart';

class SignOutRepoImp implements SignOutRepo{
  final RemoteDataSource _remoteDataSource;
  SignOutRepoImp(this._remoteDataSource);
  @override
  Future<void> signOut() async {
    _remoteDataSource.signOut();
  }
  
}