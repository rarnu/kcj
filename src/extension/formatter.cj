package extension

class StrFormatter {

    public static func format(strPattern: String, argArray: Array<ToString>): String {
		return formatWith(strPattern, "{}", argArray)
	}

    public static func formatWith(strPattern: String, placeHolder: String, argArray: Array<ToString>): String {
        if (strPattern.isAsciiBlank() || placeHolder.isAsciiBlank() || argArray.isEmpty()) {
            return strPattern
        }
        let strPatternLength = strPattern.size
        let placeHolderLength = placeHolder.size
        let sbuf = StringBuilder(strPatternLength + 50)

        var handledPosition = 0
        var delimIndex: Int

        var argIndex = 0
        while(argIndex < argArray.size) {
            delimIndex = strPattern.indexOf(placeHolder, handledPosition) ?? -1
            if (delimIndex == -1) {
                if (handledPosition == 0) {
                    return strPattern
                }
                sbuf.append(strPattern.substring(handledPosition, strPatternLength))
                return sbuf.toString()
            }
            if (delimIndex > 0 && Int64(strPattern[delimIndex - 1]) == '\\'.code) {
                if (delimIndex > 1 && Int64(strPattern[delimIndex - 2]) == '\\'.code) {
                    sbuf.append(strPattern.substring(handledPosition, delimIndex - 1))
                    sbuf.append(argArray[argIndex].toString())
                    handledPosition = delimIndex + placeHolderLength
                } else {
                    argIndex--
                    sbuf.append(strPattern.substring(handledPosition, delimIndex - 1))
                    sbuf.append(Char(placeHolder[0]))
                    handledPosition = delimIndex + 1
                }
            } else {
                sbuf.append(strPattern.substring(handledPosition, delimIndex))
                sbuf.append(argArray[argIndex].toString())
                handledPosition = delimIndex + placeHolderLength
            }
            argIndex++
        }

        sbuf.append(strPattern.substring(handledPosition, strPatternLength))

        return sbuf.toString()
    }

    public static func format(template: String, map: Map<String, ToString>): String {
        if (map.isEmpty()) {
            return template
        }
        var template2 = template
        for ((k, v) in map) {
            template2 = template2.replace("{${k}}", "${v}")
        }
        return template2
    }

}

public class Formatter {

    public static func format(template: String, params: Array<ToString>): String {
        if (params.isEmpty() || template.isAsciiBlank()) {
            return template
        }
        return StrFormatter.format(template, params)
    }

    public static func format(template: String, map: Map<String, ToString>): String {
        return StrFormatter.format(template, map)
    }
    
}

