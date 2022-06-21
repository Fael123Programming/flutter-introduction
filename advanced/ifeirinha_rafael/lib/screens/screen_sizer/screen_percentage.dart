enum ScreenPercentage {
  smoothMarginTop(0.05),
  bigMarginTop(0.23),
  marginTopAForthHalfScreen(0.13),
  sizedBoxAfterBemVindoIfeirinha(0.035),
  formContainerVerticalPadding(0.023),
  formContainerHorizontalPadding(0.097),
  marginInbetweenTextFormFields(0.006),
  smoothMarginRight(0.097),
  bigButtonMarginTop(0.035),
  bigButtonWidth(0.51),
  bigButtonSpecialWidth(0.6),
  bigButtonHeight(0.069),
  bigButtonRadius(0.24),
  marginTopAFifthScreen(0.2),
  marginTopFormContainer(0.023),
  marginTopContainerTitle(0.012),
  customCodeInputWidth(0.12),
  customCodeInputHeight(0.12),
  customCodeInputVerticalMargin(0.017),
  customCodeInputHorizontalMargin(0.036);

  final double _value;

  const ScreenPercentage(this._value);

  double get value => _value;
}
