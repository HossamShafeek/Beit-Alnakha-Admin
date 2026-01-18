class EndPoints {
  static const String baseUrl =
      'https://flavor-house.md-iraqsoft.com/api/v1';
  //static const String baseUrl = 'http://192.168.1.205:5674/api/';
  static const String login = '/auth/login';
  static const String getStatistics = 'appointment/statistics';
  static const String refreshToken = 'user/refreshToken';
  static const String viewImages = 'https://flavor-house.md-iraqsoft.com/';
  static const String getClinics = 'user';
  static const String vaExamBy = 'va-exam-by';
  static const String diagnostic = 'diagnostic';
  static const String getPackages = 'plan';
  static const String uploadImage = 'upload/image';
  static const String createClinic = 'user/create';
  static const String updateClinic = 'user/update-clinic';
  static const String deleteClinic = 'user/delete';
  static const String revokeClinicSession = 'user/revoke-session';
  static const String getReviewers = 'patient';
}
