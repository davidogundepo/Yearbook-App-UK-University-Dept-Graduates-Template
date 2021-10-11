package com.icdatinnovations.uk_uni_dept_graduates_template

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.android.SplashScreen

class MainActivity: FlutterActivity() {

    override fun provideSplashScreen(): SplashScreen = SplashView()

}
