package com.utfpr.aventura_com_bako.blescanner

import android.content.*
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.EventChannel.EventSink


class BleScanEventChannel(context: Context):EventChannel.StreamHandler {

    private var devicesState: BroadcastReceiver? = null
    private var applicationContext: Context = context

    override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
        devicesState = createDeviceState(events!!)
        applicationContext.registerReceiver(
            devicesState,
            IntentFilter("com.utfpr.aventura_com_bako")
        )
    }

    override fun onCancel(arguments: Any?) {
        applicationContext.unregisterReceiver(devicesState)
        devicesState = null
    }

    private fun createDeviceState(events: EventSink): BroadcastReceiver? {
        return object : BroadcastReceiver() {
            override fun onReceive(context: Context, intent: Intent) {
                val devices = intent.getSerializableExtra("device") as ArrayList<*>
                events.success(devices)
            }
        }
    }


}