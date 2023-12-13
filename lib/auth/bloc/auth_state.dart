part of 'auth_bloc.dart';

sealed class AuthState {}

final class AuthLoading extends AuthState {}

final class AuthUninitialized extends AuthState {}

final class AuthAuthenticated extends AuthState {}

final class AuthUnauthenticated extends AuthState {}
