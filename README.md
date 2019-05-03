# cordova-plugin-insomnia

This is a re-working  of [Eddy Verbruggen's](http://www.x-services.nl) insomnia plugin, we have had issues when upgrading various parts of the cordova stack getting the plugin installed.

1. [Description](https://github.com/tombolaltd/cordova-plugin-insomnia#1-description)
2. [Installation](https://github.com/tombolaltd/cordova-plugin-insomnia#2-installation)
3. [Usage](https://github.com/tombolaltd/cordova-plugin-insomnia#3-usage)
4. [Credits](https://github.com/tombolaltd/cordova-plugin-insomnia#4-credits)
5. [License](https://github.com/tombolaltd/cordova-plugin-insomnia#5-license)

## 1. Description

Prevent the screen of the mobile device from falling asleep.

* The device will never fall asleep after calling `keepAwake`.
* After making your app practically a zombie, you can allow it to sleep again by calling `allowSleepAgain`.
* Works on Android, probably every version you'd care about.
* Works on iOS, probably every version you'd care about.
* Works on Windows and WP8.

## 2. Installation
```
$ cordova plugin add https://github.com/tombolaltd/cordova-plugin-insomnia.git
```
run this command afterwards:
```
$ cordova prepare
```

## 3. Usage
```html
<button onclick="window.plugins.insomnia.keepAwake()">keep awake</button>
<button onclick="window.plugins.insomnia.allowSleepAgain()">allow sleep again</button>
```
An optional successCallback (first argument) will be triggered if the functions succeed. Even calling `keepAwake` twice will fire the successCallback, because the app will respond as expected (being kept awake).

An optional errorCallback (second argument) will only be triggered if something fatal happened, preventing the plugin to work as expected.

Note that calling `allowSleepAgain` without calling `keepAwake` first will trigger `errorCallback` or throw an error if not provided.

### Quirks
[In this issue](#29) it was reported that on iOS the app would fall asleep after the Camera has been used,
even if you previously called `keepAwake`. A similar [issue on Android](#30) where the photo library was accessed during app usage.

So to make sure your app honors `keepAwake` you have to re-run that method after these kinds of 'external UI' thingies give control back to your app.

## 4. CREDITS ##


This plugin was enhanced for Plugman / PhoneGap Build by [Eddy Verbruggen](http://www.x-services.nl).

All executable code is Eddie Verbruggen's except for the native iOS code which tombola has converted to swift to help with maintainablility within our team.
We also changed Eddie Verbruggens's package.json and plugin.xml to fit our repo - this also fixed our specific problem but the equivalent changes are probably not something he'd want to pull into his repo. Additionally, we have dropped support for OSs we do not deploy to.

The iOS code was heavily inspired by [Wolfgang Koller](https://github.com/simplec-dev/powermanagement).


## 5. License

[The MIT License (MIT)](http://www.opensource.org/licenses/mit-license.html)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
