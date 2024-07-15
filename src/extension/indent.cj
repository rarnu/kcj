package kcj.extension

import std.collection.*


public func stringReplaceIndentByMargin(str: String, newIndent!: String = "", marginPrefix!: String = "|"): String {
    if (marginPrefix.isAsciiBlank()) {
        throw IllegalArgumentException("marginPrefix must be non-blank string.")
    }
    let lines = str.split("\n", removeEmpty: false)
    return lines.reindent(getIndentFunction(newIndent)) { line =>
        let firstNonWhitespaceIndex = line.indexOfFirst { it => !it.isWhitespace() }
        match {
            case firstNonWhitespaceIndex == -1 => None
            case line.trimAscii().startsWith(marginPrefix) => line.trimAscii().substring(marginPrefix.size)
            case _ => None
        }
    }
}

public func stringTrimMargin(str: String, marginPrefix!: String = "|"): String {
    return stringReplaceIndentByMargin(str, newIndent: "", marginPrefix: marginPrefix)
}

public func stringTrimIndent(str: String): String {
    return stringReplaceIndent(str, newIndent: "")
}

public func stringPrependIndent(str: String, indent!: String = "    "): String {
    let lines = str.split("\n", removeEmpty: false)
    return lines.map { it: String =>
        match {
            case it.isAsciiBlank() =>
                match {
                    case it.size < indent.size => indent
                    case _ => it
                }
            case _ => indent + it
        }
    }.joinToString(separator: "\n") { it => it }
}

func stringReplaceIndent(str: String, newIndent!: String = ""): String {
    let lines = str.split("\n", removeEmpty: false)

    let minCommonIndent = lines.filter { it => !it.isAsciiBlank() }.map { it: String => indentWidth(it) }.minOrNone() ?? 0

    return lines.reindent(getIndentFunction(newIndent)) { line =>
        line.drop(minCommonIndent)
    }
}

func indentWidth(str: String): Int {
    let index = str.indexOfFirst { it => !it.isWhitespace() }
    return if (index == -1) { str.size } else { index }
}

func getIndentFunction(indent: String): (String) -> String {
    return match {
        case indent.isEmpty() => { line: String => line }
        case _ => { line: String => indent + line }
    }
}


extend Array<String> {

    func mapIndexedNotNone(transform: (Int, String) -> ?String): Array<String> {
        let arr = ArrayList<String>()
        var index = 0
        for (e in this) {
            let item = transform(index, e)
            if (item != None) {
                arr.append(item.getOrThrow())
            }
            index++
        }
        return arr.toArray()
    }

    func reindent(indentAddFunction: (String) -> String, indentCutFunction: (String) -> ?String): String {
        let li = this.size - 1
        return this.mapIndexedNotNone { i, v =>
            if ((i == 0 || i == li) && v.isAsciiBlank()) {
                None
            } else {
                var cv = indentCutFunction(v)
                if (cv != None) {
                    cv = indentAddFunction(cv.getOrThrow())
                }
                if (cv == None) {
                    cv = v
                }
                cv
            }
        }.joinToString(separator: "\n") { it => it }
    }
}

extend<T> Array<T> where T <: Comparable<T> {

    func minOrNone(): ?T {
        if (this.isEmpty()) {
            return None
        }
        let iter = this.iterator()
        var min = iter.next().getOrThrow()

        while (let Some(o) <- iter.next()) {
            if (min > o) {
                min = o
            }
        }
        return min
    }

}
