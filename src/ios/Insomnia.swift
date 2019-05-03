@objc(Insomnia) class Insomnia : CDVPlugin {
  private func setKeepAwakeStatus(command: CDVInvokedUrlCommand, isIdleTimerDisabled: Bool) { 
    // Acquire a reference to the local UIApplication singleton
    let application = UIApplication.shared;
    let pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: "The plugin succeeded");

    if application.isIdleTimerDisabled != isIdleTimerDisabled {
        application.isIdleTimerDisabled = isIdleTimerDisabled;
    }
    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId);
  }

  @objc(keepAwake:) // Declare your function name.
  func keepAwake(command: CDVInvokedUrlCommand) { // write the function code.
    setKeepAwakeStatus(command: command, isIdleTimerDisabled: true);
  }

  @objc(allowSleepAgain:) // Declare your function name.
  func allowSleepAgain(command: CDVInvokedUrlCommand) { // write the function code.
    setKeepAwakeStatus(command: command, isIdleTimerDisabled: false);
  }
}
