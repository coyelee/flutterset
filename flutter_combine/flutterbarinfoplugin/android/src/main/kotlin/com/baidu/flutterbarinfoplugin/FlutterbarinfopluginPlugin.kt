package com.baidu.flutterbarinfoplugin

import android.app.Activity
import android.content.Context
import android.content.Intent
import android.net.Uri
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry
import io.flutter.plugin.common.PluginRegistry.Registrar

@Suppress("UNREACHABLE_CODE")
class FlutterbarinfopluginPlugin: MethodCallHandler, PluginRegistry.ActivityResultListener {

  @JvmField val REQUEST_CODE_OPEN = 89757
  lateinit var mActivity: Activity
  lateinit var mContext: Context

  constructor(activity: Activity, context: Context){
    this.mActivity = activity
    this.mContext = context
  }

  companion object {
    @JvmStatic
    fun registerWith(registrar: Registrar) {

      val channel = MethodChannel(registrar.messenger(), "flutterbarinfoplugin")

      val plugin = FlutterbarinfopluginPlugin(registrar.activity(),registrar.context())
      registrar.addActivityResultListener(plugin)
      channel.setMethodCallHandler(plugin)
    }
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    if (call.method == "getPlatformVersion") {
      result.success("Android ${android.os.Build.VERSION.RELEASE}")
    } else if (call.method == "getBarLevels"){
      result.success(BarInfoManager(mContext).barLevel())
    } else if (call.method == "getBarPics"){
      result.success(BarInfoManager(mContext).barPics())
    }else if (call.method == "getBarNames"){
      result.success(BarInfoManager(mContext).barNames())
    }else if (call.method == "getBarDes"){
      result.success(BarInfoManager(mContext).barDes())
    }else if (call.method == "getEnterForum"){
      val intent = Intent(Intent.ACTION_GET_CONTENT)
      intent.addCategory(Intent.CATEGORY_OPENABLE)
      intent.setType("audio/*")
      mActivity.startActivityForResult(intent,REQUEST_CODE_OPEN)
    }
    else {
      result.notImplemented()
    }
  }

  override fun onActivityResult(p0: Int, p1: Int, p2: Intent?): Boolean {
    TODO("not implemented") //To change body of created functions use File | Settings | File Templates.
    if (p0 == REQUEST_CODE_OPEN){
      val url: Uri? = p2!!.data
      print(url)
    }
  }
}
