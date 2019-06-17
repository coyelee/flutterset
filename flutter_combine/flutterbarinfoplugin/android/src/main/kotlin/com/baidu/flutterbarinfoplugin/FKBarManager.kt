package com.baidu.flutterbarinfoplugin

import android.content.Context
import org.json.JSONArray
import org.json.JSONObject
import java.io.BufferedReader
import java.io.IOException
import java.io.InputStreamReader

class BarInfoManager {
    lateinit var mContext: Context
    constructor(context: Context){
        mContext = context
    }


    fun barPics():List<*>? {
        val jsonString: String? = parseJson()
        jsonString?.let {
            val jsonObject = JSONObject(it)
            val barInfo = jsonObject.getJSONObject("barInfo")
            val pics: JSONArray = barInfo.getJSONArray("barPics")

            val list: MutableList<String> = mutableListOf()
            for (i in 0 until pics.length()){
                val barPic = pics!!.getString(i)
                list.add(barPic)
            }
            return list
        }
        return null
    }

    fun barNames(): List<*>? {
        val jsonString: String? = parseJson()
        jsonString?.let {
            val jsonObject = JSONObject(it)
            val barInfo = jsonObject.getJSONObject("barInfo")
            val names: JSONArray = barInfo.getJSONArray("barNames")

            val list: MutableList<String> = mutableListOf()
            for (i in 0 until names.length()){
                val barName = names!!.getString(i)
                list.add(barName)
            }
            return list
        }
        return null
    }

    fun barDes(): List<*>? {
        val jsonString: String? = parseJson()
        jsonString?.let {
            val jsonObject = JSONObject(it)
            val barInfo = jsonObject.getJSONObject("barInfo")
            val des: JSONArray = barInfo.getJSONArray("barDes")

            val list: MutableList<String> = mutableListOf()
            for (i in 0 until des.length()){
                val barDes = des!!.getString(i)
                list.add(barDes)
            }
            return list
        }
        return null
    }

    fun barLevel(): List<*>? {
        val jsonString: String? = parseJson()
        jsonString?.let {
            val jsonObject = JSONObject(it)
            val barInfo = jsonObject.getJSONObject("barInfo")
            val level: JSONArray = barInfo.getJSONArray("barLevels")

            val list: MutableList<String> = mutableListOf()
            for (i in 0 until level.length()){
                val barLevel = level!!.getString(i)
                list.add(barLevel)
            }
            return list
        }
        return null
    }

    // 此方法因为返回的数据结构模型Flutter不能映射，所以不可用
    fun barList():List<*>? {
        val jsonString: String? = parseJson()
        jsonString?.let {
            val jsonObject = JSONObject(it)
            val barInfo = jsonObject.getJSONObject("barInfo")
            val pics: JSONArray = barInfo.getJSONArray("barPics")
            val names: JSONArray = barInfo.getJSONArray("barNames")
            val des: JSONArray = barInfo.getJSONArray("barDes")
            val level: JSONArray = barInfo.getJSONArray("barLevels")

            val list: MutableList<KTBarInfo> = mutableListOf()
            for (i in 0 until pics.length()){
                val barInfo = KTBarInfo()
                barInfo.barName = names!!.getString(i)
                barInfo.barPic = pics!!.getString(i)
                barInfo.barDes = des.getString(i)
                barInfo.barLevel = level.getString(i)
                list.add(barInfo)
            }
            return list
        }
        return null
    }

    fun parseJson(): String? {

        //将json数据变成字符串
        val stringBuilder = StringBuilder()
        try {
            //val context = ContextWrapper(null).createPackageContext("KTParseBarInfo", Context.CONTEXT_IGNORE_SECURITY)
            val assetManager = mContext.assets
            //通过管理器打开文件并读取
            val bf = BufferedReader(
                    InputStreamReader(
                            assetManager.open("li.json")
                    )
            )
            var line: String? = bf.readLine()
            while (line != null) {
                stringBuilder.append(line)
                line = bf.readLine()
            }
        } catch (e: IOException) {
            e.printStackTrace()
        }

        return stringBuilder.toString()
    }

    class KTBarInfo {
         var barName: String = ""
         var barPic: String = ""
         var barDes: String = ""
         var barLevel: String = ""
    }
}