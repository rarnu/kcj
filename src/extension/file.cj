package extension

from std import fs.*

public interface KtFile {

    func readBytes(): Array<Byte>
    func writeBytes(arr: Array<Byte>): Unit
    func appendBytes(arr: Array<Byte>): Unit
    func readText(): String
    func writeText(text: String): Unit
    func appendText(text: String): Unit
    func readLines(): ArrayList<String>
    func toRelativeString(base: File): String
    func relativeTo(base: File): File
    func relativeToOrSelf(base: File): File
    func relativeToOrNull(base: File): ?File
    func toRelativeStringOrNull(base: File): ?String
    func resolve(relative: File): File
    func resolve(relative: String): File
    func resolveSibling(relative: File): File
    func resolveSibling(relative: String): File
}

// extend File <: KtFile {
// TODO
// }