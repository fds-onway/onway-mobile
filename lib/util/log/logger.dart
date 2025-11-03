abstract class ILogger {
  Future<void> logInfo(String message);
  Future<void> logWarning(String message);
  Future<void> logError(String message, [Exception? exception]);
}
