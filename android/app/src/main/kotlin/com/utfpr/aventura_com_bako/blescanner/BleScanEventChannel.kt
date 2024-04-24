package com.utfpr.aventura_com_bako.blescanner

import android.content.*
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.EventChannel.EventSink

class BleScanEventChannel private constructor(private var applicationContext: Context) : BroadcastReceiver(), EventChannel.StreamHandler {

    private var devicesState: BroadcastReceiver? = null

    companion object {
        fun with(context: Context): BleScanEventChannel {
            return BleScanEventChannel(context)
        }
    }
    override fun onReceive(context: Context, intent: Intent) {
        this.applicationContext = context
        val devices = intent.getSerializableExtra("device") as ArrayList<*>
        // Aqui você pode usar um EventSink para enviar os dispositivos para o Flutter
    }

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
