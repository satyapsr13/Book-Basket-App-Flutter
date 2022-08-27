enum Status {
  initial,
  loading,
  success,
  failure,
  createPending,
  createSuccess,
  updatePending,
  updateSuccess,
  deletePending,
  deleteSuccess,
  forgotAccesscodeSuccess,
  tokenLoginFailed,
  bpAddedSucceess,
}

enum PatientStatus { healthy, warning, danger }

enum CartStatus { initial, loading, success, failure, recalculated }

enum ConnectionType { wifi, mobile }

enum AppTheme { lightTheme, darkTheme }

enum AuthStatus {
  initial,
  otpSending,
  otpSent,
  otpResent,
  otpSendingError,
  loggingIn,
  otpVerified,
  loggedIn,
  loggingOut,
  loggedOut,
  unauthorized
}

enum FormStatus { empty, filled, validated }

enum InitialScreenStatus { initial, dashboard }
