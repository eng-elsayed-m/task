import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:task/src/core/consts/consts.dart';
import 'package:task/src/core/error/exceptions.dart';
import 'package:task/src/core/error/failures.dart';
import 'package:task/src/features/movies/domain/domain.dart';
import 'package:task/src/features/movies/domain/entities/movie.dart';
part 'repositories_impl/movies_repo_impl.dart';
part 'sources/movies_remote_src.dart';
part 'models/movie_model.dart';
part 'models/movie_details_model.dart';
