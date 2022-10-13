package steamworksBindGen
import "core:os"
import "core:fmt"
import "core:strings"
import "core:encoding/json"

INDENT :: "    "
print :: fmt.sbprint
println :: fmt.sbprintln

main :: proc() {
    if jsonData, jsonDataOk := os.read_entire_file_from_filename("../../Downloads/steam_api.json");
    jsonDataOk {
        fmt.println(transmute(string)jsonData)

        if groups, err := json.parse(jsonData); err == .None {
            groups := groups.(json.Object)

            foreignBuf: strings.Builder
            buf: strings.Builder

            {
                callbacks := groups["callback_structs"].(json.Array)
                for callback in callbacks {
                    // callback := callback.(json.Object)
                }
            }

            {
                consts := groups["consts"].(json.Array)
                for const in consts {
                    const := const.(json.Object)
                    constname := const["constname"].(json.String)
                    consttype := const["consttype"].(json.String)
                    constval := const["constval"].(json.String)

                    println(
                        buf = &buf,
                        args = {constname, ": ", convType(consttype), " : ", constval},
                        sep = "",
                    )
                }
                println(&buf)
            }

            {
                enums := groups["enums"].(json.Array)
                for enum_ in enums {
                    enum_ := enum_.(json.Object)
                    enumname := enum_["enumname"].(json.String)
                    values := enum_["values"].(json.Array)
                    println(&buf, enumname, ":: enum {")

                    for value in values {
                        value := value.(json.Object)
                        // NOTE: the value name could be shortened. Naming of enum values isn't completely consistent though...
                        valueName := value["name"]
                        valueValue := value["value"]
                        print(&buf, INDENT)
                        print(&buf, valueName, "=", valueValue)
                        println(&buf, ",")
                    }

                    println(&buf, "}")
                    println(&buf)
                }
            }

            {
                interfaces := groups["interfaces"].(json.Array)
                for interface in interfaces {
                    interface := interface.(json.Object)
                    classname := interface["classname"].(json.String)
                    assert(len(interface["fields"].(json.Array)) == 0)

                    for method in interface["methods"].(json.Array) {
                        method := method.(json.Object)
                        printMethod(&foreignBuf, classname, method)
                    }
                }
            }

            {
                structs := groups["structs"].(json.Array)
                for struct_ in structs {
                    struct_ := struct_.(json.Object)
                    name := struct_["struct"].(json.String)
                    fields := struct_["fields"].(json.Array)

                    println(&buf, name, ":: struct #packed {")

                    for field in fields {
                        field := field.(json.Object)
                        fieldname := field["fieldname"].(json.String)
                        fieldtype := field["fieldtype"].(json.String)
                        print(&buf, INDENT)
                        print(&buf, fieldname)
                        print(&buf, ": ")
                        print(&buf, fieldtype)
                        println(&buf, ",")
                    }

                    println(&buf, "}")
                    println(&buf)
                }
            }

            {
                typedefs := groups["typedefs"].(json.Array)
                for typedef in typedefs {
                    typedef := typedef.(json.Object)
                    typedefTypedef := typedef["typedef"].(json.String)
                    typedefType := typedef["type"].(json.String)

                    println(&buf, typedefTypedef, "::", convType(typedefType))
                }
            }


            fmt.println(strings.to_string(foreignBuf))
            fmt.println(strings.to_string(buf))

            // Final output
            {
                finalBuf: strings.Builder

                println(&finalBuf, "package steamworks")
                println(&finalBuf, "import \"core:c\"")
                println(&finalBuf, "foreign import lib \"steamworks_api.lib\"")
                println(&finalBuf)

                println(&finalBuf, strings.to_string(buf))
                println(&finalBuf)

                println(&finalBuf, "foreign lib {")
                println(&finalBuf, strings.to_string(foreignBuf))
                println(&foreignBuf, "} // foreign lib")

                if !os.write_entire_file("steamworks.odin", finalBuf.buf[:]) {
                    panic("Couldn't write file.")
                }
            }

        } else {
            fmt.println("json.parse Error:", err)
            panic("Couldn't parse json.")
        }
    } else do panic("Couldn't read file.")
}

convType :: proc(typeName: string) -> string {
    return typeName
}

printMethod :: proc(buf: ^strings.Builder, classname: string, method: json.Object) {
    methodname := method["methodname"].(json.String)
    params := method["params"].(json.Array)
    returntype := method["returntype"].(json.String)

    print(buf = buf, args = {classname, "_", methodname}, sep = "")
    print(buf, ":: proc(")
    print(buf = buf, args = {"self: ^", classname}, sep = "")
    if len(params) > 0 do print(buf, ", ")

    for param, i in params {
        param := param.(json.Object)
        paramname := param["paramname"]
        paramtype := param["paramtype"]
        print(buf, paramname)
        print(buf, ": ")
        print(buf, paramtype)

        if i + 1 < len(params) do print(buf, ", ")
    }
    print(buf, ")")

    if returntype != "void" {
        print(buf, " ->", convType(returntype))
    }

    println(buf, " ---")
}
