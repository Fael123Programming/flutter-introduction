enum ScreenPercentage {
  //Screen dimension percentages based on the current device running the app.
  marginTopAFifthHalfScreen(0.1),
  marginTopAForthHalfScreen(0.13), 
  sizedBoxAfterBemVindoIfeirinha(0.035), 
  formContainerVerticalPadding(0.023), 
  formContainerHorizontalPadding(0.097),
  marginInbetweenTextFormFields(0.017), 
  smoothMarginRight(0.097), 
  bigButtonMarginTop(0.035), 
  bigButtonWidth(0.51), 
  bigButtonHeight(0.069), 
  bigButtonRadius(0.24), 
  marginTopAFifthScreen(0.2), 
  marginTopFormContainer(0.023),
  marginTopContainerTitle(0.012);

  final double _value;

  const ScreenPercentage(this._value);

  double get value => _value;
}
