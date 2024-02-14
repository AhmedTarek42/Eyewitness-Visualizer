abstract class RegisterStates2 {}

class RegisterInitialState2 extends RegisterStates2 {}

class RegisterLoadingState2 extends RegisterStates2 {}

class RegisterSuccessState2 extends RegisterStates2 {}

class RegisterErrorState2 extends RegisterStates2 {
  final String error;

  RegisterErrorState2(this.error);
}

class CreateUserSuccessState2 extends RegisterStates2 {}

class CreateUserErrorState2 extends RegisterStates2 {
  final String error;

  CreateUserErrorState2(this.error);
}

class RegisterChangePasswordVisibilityState extends RegisterStates2 {}

class ColorChangeState extends RegisterStates2 {}
