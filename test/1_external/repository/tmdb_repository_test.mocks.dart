// Mocks generated by Mockito 5.4.4 from annotations
// in the_movie_database_front_end/test/1_external/repository/tmdb_repository_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:dio/dio.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i7;
import 'package:the_movie_database_front_end/1_external/datasource/tmdb_datasource.dart'
    as _i4;
import 'package:the_movie_database_front_end/3_domain/entities/pagination_movie_entity.dart'
    as _i3;
import 'package:the_movie_database_front_end/3_domain/entities/person_entity.dart'
    as _i6;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeDio_0 extends _i1.SmartFake implements _i2.Dio {
  _FakeDio_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakePaginationMovieEntity_1 extends _i1.SmartFake
    implements _i3.PaginationMovieEntity {
  _FakePaginationMovieEntity_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [TMDBDatasource].
///
/// See the documentation for Mockito's code generation for more information.
class MockTMDBDatasource extends _i1.Mock implements _i4.TMDBDatasource {
  MockTMDBDatasource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Dio get dio => (super.noSuchMethod(
        Invocation.getter(#dio),
        returnValue: _FakeDio_0(
          this,
          Invocation.getter(#dio),
        ),
      ) as _i2.Dio);

  @override
  _i5.Future<List<_i6.PersonEntity>> movieCredits(int? movieId) =>
      (super.noSuchMethod(
        Invocation.method(
          #movieCredits,
          [movieId],
        ),
        returnValue:
            _i5.Future<List<_i6.PersonEntity>>.value(<_i6.PersonEntity>[]),
      ) as _i5.Future<List<_i6.PersonEntity>>);

  @override
  _i5.Future<_i3.PaginationMovieEntity> popularMovies(int? pageNumber) =>
      (super.noSuchMethod(
        Invocation.method(
          #popularMovies,
          [pageNumber],
        ),
        returnValue: _i5.Future<_i3.PaginationMovieEntity>.value(
            _FakePaginationMovieEntity_1(
          this,
          Invocation.method(
            #popularMovies,
            [pageNumber],
          ),
        )),
      ) as _i5.Future<_i3.PaginationMovieEntity>);

  @override
  _i5.Future<String> recentMovieTrailerURL(int? movieId) => (super.noSuchMethod(
        Invocation.method(
          #recentMovieTrailerURL,
          [movieId],
        ),
        returnValue: _i5.Future<String>.value(_i7.dummyValue<String>(
          this,
          Invocation.method(
            #recentMovieTrailerURL,
            [movieId],
          ),
        )),
      ) as _i5.Future<String>);

  @override
  _i5.Future<_i3.PaginationMovieEntity> searchMovies(
    String? searchText,
    int? pageNumber,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchMovies,
          [
            searchText,
            pageNumber,
          ],
        ),
        returnValue: _i5.Future<_i3.PaginationMovieEntity>.value(
            _FakePaginationMovieEntity_1(
          this,
          Invocation.method(
            #searchMovies,
            [
              searchText,
              pageNumber,
            ],
          ),
        )),
      ) as _i5.Future<_i3.PaginationMovieEntity>);

  @override
  _i5.Future<_i3.PaginationMovieEntity> trendingMovies(int? pageNumber) =>
      (super.noSuchMethod(
        Invocation.method(
          #trendingMovies,
          [pageNumber],
        ),
        returnValue: _i5.Future<_i3.PaginationMovieEntity>.value(
            _FakePaginationMovieEntity_1(
          this,
          Invocation.method(
            #trendingMovies,
            [pageNumber],
          ),
        )),
      ) as _i5.Future<_i3.PaginationMovieEntity>);

  @override
  _i5.Future<_i3.PaginationMovieEntity> upcomingMovies(int? pageNumber) =>
      (super.noSuchMethod(
        Invocation.method(
          #upcomingMovies,
          [pageNumber],
        ),
        returnValue: _i5.Future<_i3.PaginationMovieEntity>.value(
            _FakePaginationMovieEntity_1(
          this,
          Invocation.method(
            #upcomingMovies,
            [pageNumber],
          ),
        )),
      ) as _i5.Future<_i3.PaginationMovieEntity>);
}