class AppStrings {
  static const String noRouteFound = 'الصفحة غير موجودة';

  // Authentication

  static const String loginTitle = 'تسجيل الدخول إلى لوحة الإدارة';
  static const String loginSubtitle =
      'أدخل بيانات الدخول للوصول إلى لوحة تحكم مطعمك وإدارة الطلبات والعمليات بكل سهولة.';
  static const String login = 'تسجيل الدخول';
  static const String logout = 'تسجيل الخروج';

  static const String password = 'كلمة السر';
  static const String enterPassword = 'أدخل كلمة السر...';
  static const String pleaseEnterPassword = 'من فضلك أدخل كلمة السر';
  static const String confirmPassword = 'تأكيد كلمة السر';
  static const String enterConfirmPassword = 'أدخل تأكيد كلمة السر...';
  static const String pleaseEnterConfirmPassword = 'من فضلك أدخل تأكيد كلمة السر';
  static const String passwordIsTooShort = 'كلمة السر قصيرة جداََ';
  static const String  passwordsDoNotMatch = 'كلمة السر غير متطابقة';
  static const String username = 'اسم المستخدم';
  static const String enterUsername = 'أدخل اسم المستخدم...';
  static const String pleaseEnterUsername = 'من فضلك أدخل اسم المستخدم';
  static const String loggedInSuccessfully = 'تم تسجيل الدخول بنجاح';
  // Layout

  static const String requests = 'الطلبات';
  static const String customers = 'العملاء';
  static const String drivers = 'السائقين';
  static const String agents = 'الوكلاء';
  static const String chefs = 'الشيفات';
  static const String meals = 'الوجبات';
  static const String features = 'المميزات';
  static const String codesAndPoints = 'الكودات والنقاط';
  static const String departments = 'الأقسام';
  static const String settings = 'الإعدادات';

  // Common
  static const String edit = 'تعديل';
  static const String delete = 'حذف';
  static const String cancel = 'إلغاء';
  static const String viewAll = 'عرض الكل';
  static const String areYouSureLogout = 'هل أنت متأكد من تسجيل الخروج؟';
  static const String searchHintTextByName = 'ابحث بالاسم...';
  static const String phoneNumber = 'رقم الهاتف';
  static const String enterPhoneNumber = 'ادخل رقم الهاتف...';
  static const String pleaseEnterPhoneNumber = 'من فضلك ادخل رقم الهاتف';
  static const String doNotStartNumberWithZero = 'لا تبدء رقم الهاتف بصفر';
  static const String pleaseEnterPhoneNumberValid =
      'من فضلك ادخل رقم هاتف صحيح';
  static const String downloadedSuccessfullyInPath =
      'تم تنزيل الملف في المسار';
  static const String downloadedSuccessfully =
      'تم تنزيل الملف بنجاح';

  // Errors Messages
  static const String connectionTimeoutErrorMessage =
      'مهلة الاتصال. يرجى التحقق من اتصالك بالإنترنت.';
  static const String sendTimeoutErrorMessage =
      'إرسال المهلة. غير قادر على إرسال الطلب. يرجى المحاولة مرة أخرى.';
  static const String receiveTimeoutErrorMessage =
      'تلقي المهلة. غير قادر على تلقي البيانات. من فضلك حاول مرة أخرى.';
  static const String badCertificateErrorMessage =
      'شهادة سيئة. لا يمكن تأسيس اتصال آمن.';
  static const String cancelErrorMessage = 'تم إلغاء الطلب.';
  static const String connectionErrorMessage =
      'يرجى التحقق من اتصالك بالإنترنت والمحاولة مرة أخرى.';
  static const String unknownErrorMessage =
      'خطأ غير متوقع، يرجى المحاولة مرة أخرى.';
  static const String statusCode500ErrorMessage =
      'خطأ داخلي في الخادم، يرجى المحاولة لاحقًا!';
  static const String defaultErrorMessage =
      'عفوًا، حدث خطأ، يرجى المحاولة مرة أخرى!';
  static const String noInternetTitle = 'لا يوجد اتصال بالانترنت!';
  static const String noInternetSubtitle =
      'تحقق من اتصالك بالانترنت ثم أعد المحاولة.';
  static const String tryAgain = 'أعد المحاولة';
  static const String imageSizeIsLarge =
      'يرجى اختيار صورة بحجم أصغر من 2 ميجابايت.';
  static const String failedToOpenUrl = 'تعذر فتح الرابط';
  static const String failedToOpenWhatsApp = 'تعذر فتح واتساب';
  static const String callFailed = 'فشل في إجراء المكالمة';
  static const String smsFailed = 'لا يمكن إرسال الرسالة';
  static const String emailFailed = 'تعذر إرسال الإيميل';
  static const String mapsFailedByName = 'فشل في فتح الموقع على الخرائط';

  static const List<String> internetConnectionErrorList = [
    connectionTimeoutErrorMessage,
    connectionErrorMessage,
  ];
}
