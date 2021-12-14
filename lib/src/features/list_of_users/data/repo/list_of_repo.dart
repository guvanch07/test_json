// import 'package:dartz/dartz.dart';

// import 'package:test_skleton/core/error/exceptions.dart';
// import 'package:test_skleton/core/error/failures.dart';
// import 'package:test_skleton/core/platform/platform.dart';
// import 'package:test_skleton/src/features/list_of_users/data/datasource/local/local_ds.dart';
// import 'package:test_skleton/src/features/list_of_users/data/datasource/remote/remote_ds.dart';
// import 'package:test_skleton/src/features/list_of_users/domain/entities/list_entities.dart';
// import 'package:test_skleton/src/features/list_of_users/domain/repo/list_repo.dart';

// class ListOfItemImpl implements ListOfItemsRepository {
//   final ListOfItemsDataSource listOfItemsDataSource;
//   final ListOfLocalDataSource listOfLocalDataSource;
//   final NetworkInfo networkInfo;

//   ListOfItemImpl(
//     this.listOfItemsDataSource,
//     this.listOfLocalDataSource,
//     this.networkInfo,
//   );

//   @override
//   Future<Either<Failture, ListOfEntities>> getListOfItems() async {
//     if (await networkInfo.isConnected) {
//       try {
//         final remoteDate =
//             await listOfItemsDataSource.getListOfRemoteDataSource();
//         listOfLocalDataSource.casheListOfUsers(remoteDate);
//         return Right(remoteDate);
//       } on ServerExceptions {
//         return Left(ServerFailure());
//       }
//     } else {
//       try {
//         final localList = await listOfLocalDataSource.getListOfUsers();
//         return Right(localList);
//       } on CacheExceptions {
//         return Left(CacheFailure());
//       }
//     }
//   }
// }
