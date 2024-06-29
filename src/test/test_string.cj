package test

from std import unittest.*
from std import unittest.testmacro.*
from kcj import extension.KtString

@Test
class TestStringExtension {

    let str = "abcdefg"

    @TestCase
    func testSubstring() {

        @Assert(str.substring(2, 4), "cd")
        // @Assert(condition: Bool)
    }
}