import Argument
import Argument_Tagged
import Tagged
import Tagged_Standard_Library_Integration
import Testing

extension Argument.Environment.Variable.Name {
    @Suite("Argument.Environment.Variable.Name")
    struct Test {
        @Suite struct Unit {
            @Test func `constructs from an underlying string`() {
                let name = Argument.Environment.Variable.Name(_unchecked: "MYAPP_VERBOSITY")
                #expect(name.underlying == "MYAPP_VERBOSITY")
            }

            @Test func `constructs from string literal via Tagged SLI`() {
                let name: Argument.Environment.Variable.Name = "MYAPP_VERBOSITY"
                #expect(name.underlying == "MYAPP_VERBOSITY")
            }

            @Test func `two names with same underlying are equal`() {
                let a: Argument.Environment.Variable.Name = "FOO"
                let b: Argument.Environment.Variable.Name = "FOO"
                #expect(a == b)
            }
        }

        @Suite struct `Edge Case` {}

        @Suite struct Integration {}
    }
}
