package kcj

import std.collection.*
import kcj.extension.*
import kcj.common.*

import std.convert.Parsable

public class MyData <: ToString & Equatable<MyData> {
    public MyData(var cardType: String, var cardSubType: String, var cardName: String) {

    }
    public func toString(): String {
        return "MyData(cardType = ${cardType}, cardSubType = ${cardSubType}, cardName = ${cardName})"
    }

    public operator func ==(other: MyData): Bool {
        return this.cardType == other.cardType && this.cardSubType == other.cardSubType && this.cardName == this.cardName
    }

    public operator func !=(other: MyData): Bool {
        return this.cardType != other.cardType || this.cardSubType != other.cardSubType || this.cardName != this.cardName
    }
}

let cards = [
    MyData("Monster", "Normal", "王室前のガーディアン"),
    MyData("Monster", "Normal", "満ち潮のマーマン"),
    MyData("Monster", "Normal", "スロットマシーンAM－７"),
    MyData("Monster", "Effect", "黒衣の大賢者"),
    MyData("Monster", "Effect", "ペンギン・ナイト"),
    MyData("Monster", "Fusion", "炎の剣士"),
    MyData("Monster", "Fusion", "竜騎士ガイア"),
    MyData("Monster", "Fusion", "メタル・ドラゴン"),
    MyData("Spell", "Normal", "成金ゴブリン"),
    MyData("Spell", "Normal", "押収"),
    MyData("Trap", "Normal", "天使の手鏡"),
    MyData("Trap", "Normal", "毒蛇の牙")
    ]

main(): Int64 {
    
    let list = cards.filter { it =>
        it.cardType == "Monster"
    }.groupBy { it =>
        it.cardSubType
    } 
    println(list)
    

    let s = """
        |aaa
        |bbbb
        |  cccc
        |  dddd
        |     eeee
        |     ffffff
        |ggggg
    """.trimMargin()

    println(s)

    return 0
}

 