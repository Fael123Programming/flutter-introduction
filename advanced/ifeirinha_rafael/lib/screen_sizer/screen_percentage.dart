enum ScreenPercentage {
  //Screen dimension percentages based on the current device running the app.
  //--------------------------------------------------------------------------
  //sign_in_screen.dart
  marginTopBemVindoIfeirinha(0.1154), //11.54%
  sizedBoxAfterBemVindoIfeirinha(0.035), //3.5%
  sizedBoxAfterLoginEntreEDeGraca(0.023), //2.3%
  formContainerVerticalPadding(0.023), //2.3%
  formContainerHorizontalPadding(0.097), //9.7%
  sizedBoxAfterEmailLoginInput(0.017), //1.7%
  marginRightContainerEsqueciMinhaSenha(0.097), //9.7%
  marginTopEntrarButtonContainer(0.035), //3.5%
  widthEntrarButtonContainer(0.51), //51%
  heightEntrarButtonContainer(0.069), //6.9%;
  radiusEntrarButton(0.24), //24%
  marginTopContainerNaoTemUmaContaCadastreSe(0.2); //20%
  //--------------------------------------------------------------------------
  final double _value;

  ScreenPercentage(this._value);

  double get value => this._value;
}