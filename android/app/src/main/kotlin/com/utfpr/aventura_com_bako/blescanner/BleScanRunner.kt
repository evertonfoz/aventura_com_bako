package com.utfpr.aventura_com_bako.blescanner

import android.annotation.SuppressLint
import android.bluetooth.BluetoothManager
import android.content.Context
import android.content.Intent
import android.os.Build
import android.util.Log
import androidx.annotation.RequiresApi
import com.utfpr.aventura_com_bako.blescanner.manager.BleScanManager
import com.lorenzofelletti.simpleblescanner.blescanner.model.BleScanCallback
import com.utfpr.aventura_com_bako.BuildConfig.DEBUG
import kotlin.math.PI
import kotlin.math.pow
import kotlin.math.sqrt

class BleScanRunner(private val btManager: BluetoothManager, private val periodTime: Long = 0, private val applicationContext:Context) {

    private lateinit var bleScanManager: BleScanManager
    private lateinit var foundDevices: MutableList<List<String>>


    @RequiresApi(Build.VERSION_CODES.O)
    @SuppressLint("MissingPermission")
    fun init(): BleScanManager {

        foundDevices = emptyList<List<String>>().toMutableList()

        bleScanManager = BleScanManager(btManager, periodTime, scanCallback = BleScanCallback({ deviceFound ->
            if (deviceFound?.device?.address.isNullOrBlank()) return@BleScanCallback
            val macAdress = deviceFound!!.device.address!!
            val name:String = (if (deviceFound.device.name != null) deviceFound.device.name else '-').toString()
            val rssi = deviceFound.rssi
            val ptx = if (deviceFound.txPower != 127 ) deviceFound.txPower else -26 //padrão do fabricante Holy-IOT

            // verificar e documentar essa função
            val friis = calculateDistanceFriis(ptx.toDouble(),rssi.toDouble())
            val ldplm = calculateDistanceLDPLM(rssi)
            val distance = String.format("%.5f", ldplm)

            val device:MutableList<String> = mutableListOf(macAdress, name, rssi.toString(), distance)

            var hasDevice = false
            foundDevices = foundDevices.map {
                val dev = it.toMutableList()
                if (dev[0] == (macAdress)) {
                    hasDevice = true
                    dev[2] = rssi.toString()
                    dev[3] = distance
                }
                dev
            }.toMutableList()


            if (!hasDevice) {
                foundDevices += device
            }

            val intent = Intent("com.utfpr.aventura_com_bako")
            intent.putExtra("device",ArrayList(foundDevices.map { ArrayList(it) }))
            applicationContext.sendBroadcast(intent)

        }))

        return bleScanManager

    }

    fun stop() {
        bleScanManager.scanBleDevices()
    }

    private fun calculateDistanceLDPLM(rssi: Int, rssi0: Int = -66): Double {
        //val RSSI0 = -66 // potencia à um 1 m
        val n = 2.0
        return 10.0.pow((rssi0 - rssi) / (10 * n))
    }

    private fun calculateDistanceFriis(pt: Double, pr: Double): Double {
        return sqrt(converterDbmToWatts(pt) / converterDbmToWatts(pr)) * (3.0*10.0.pow(8) / (4 * PI * 2.4*10.0.pow(9)))
    }

    private fun converterDbmToWatts(dbm: Double): Double {
        return 10.0.pow(dbm/10)
    }

    companion object {
        private val TAG = BleScanRunner::class.java.simpleName
    }
}