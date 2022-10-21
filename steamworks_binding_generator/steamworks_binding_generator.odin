package steamworksBindGen
import "core:os"
import "core:fmt"
import "core:strings"
import "core:encoding/json"

INDENT :: "    "
print :: fmt.sbprint
println :: fmt.sbprintln

main :: proc() {
	if jsonData, jsonDataOk := os.read_entire_file_from_filename("d:/steamworks_sdk_155/public/steam/steam_api.json"); jsonDataOk {
		if groups, err := json.parse(jsonData); err == .None {
			groups := groups.(json.Object)

			foreignBuf: strings.Builder
			buf: strings.Builder

			{
				fmt.println("callbacks ...")
				callbacks := groups["callback_structs"].(json.Array)
				for callback in callbacks {
					callback := callback.(json.Object)
					printStruct(&buf, &foreignBuf, callback)
				}
			}

			{
				fmt.println("consts ...")
				consts := groups["consts"].(json.Array)
				for const in consts {
					const := const.(json.Object)
					constname := const["constname"].(json.String)
					consttype := const["consttype"].(json.String)
					constval := const["constval"].(json.String)

					println(buf = &buf, args = {constname, ": ", convType(consttype), " : ", constval}, sep = "")
				}
				println(&buf)
			}

			{
				fmt.println("enums ...")
				enums := groups["enums"].(json.Array)
				for enum_ in enums {
					enum_ := enum_.(json.Object)
					printEnum(&buf, "", enum_)
				}
			}

			{
				fmt.println("interfaces ...")
				interfaces := groups["interfaces"].(json.Array)
				for interface in interfaces {
					interface := interface.(json.Object)
					classname := interface["classname"].(json.String)
					assert(len(interface["fields"].(json.Array)) == 0)

					for method in interface["methods"].(json.Array) {
						method := method.(json.Object)
						printMethod(&foreignBuf, classname, method)
					}

					if enums, enumsOk := interface["enums"].(json.Array); enumsOk {
						for enum_ in enums {
							enum_ := enum_.(json.Object)
							printEnum(&buf, classname, enum_)
						}
					}

					if accessors, accessorsOk := interface["accessors"].(json.Array); accessorsOk {
						for accessor in accessors {
							accessor := accessor.(json.Object)
							kind := accessor["kind"].(json.String)
							name := accessor["name"].(json.String)
							nameflat := accessor["name_flat"].(json.String)

							switch kind {
							case "user":
								// Versioned accessor
								versionedName := nameflat[len("SteamAPI_"):]
								print(&foreignBuf, versionedName)
								print(&foreignBuf, " :: proc() -> ^")
								print(&foreignBuf, classname)
								println(&foreignBuf, " ---")

								// Helper accessor
								print(&buf, name)
								print(&buf, ": proc() -> ^")
								print(&buf, classname)
								print(&buf, " : ")
								println(&buf, versionedName)

							case "gameserver":
							}
						}
					}

					// Separate each interfaces procedures with an empty line
					println(&foreignBuf)

					// TODO: version_string
				}

				println(&buf)

				// Interface type definitions
				for interface in interfaces {
					interface := interface.(json.Object)
					println(&buf, interface["classname"].(json.String), ":: distinct rawptr")
				}

				println(&buf)
			}

			{
				fmt.println("structs ...")
				structs := groups["structs"].(json.Array)
				for struct_ in structs {
					struct_ := struct_.(json.Object)
					name := struct_["struct"].(json.String)

					switch name {
					case "SteamInputActionEvent_t":
						continue
					}

					printStruct(&buf, &foreignBuf, struct_)
				}
			}

			// Note: those are manually defined in `steamworks.odin`, it's easier that way
			/*{
                typedefs := groups["typedefs"].(json.Array)
                for typedef in typedefs {
                    typedef := typedef.(json.Object)
                    typedefTypedef := typedef["typedef"].(json.String)
                    typedefType := typedef["type"].(json.String)

                    println(&buf, typedefTypedef, "::", convType(typedefType))
                }
            }*/

			// Final output
			{
				fmt.println("Finalizing ...")

				finalBuf: strings.Builder

				println(&finalBuf, "package steamworks")
				println(&finalBuf, "import \"core:c\"")
				println(&finalBuf, "foreign import lib \"steam_api.lib\"")
				println(&finalBuf)

				println(&finalBuf, strings.to_string(buf))
				println(&finalBuf)

				println(&finalBuf, "@(link_prefix = \"SteamAPI_\", default_calling_convention = \"c\")")
				println(&finalBuf, "foreign lib {")
				println(&finalBuf, strings.to_string(foreignBuf))
				println(&finalBuf, "} // foreign lib")

				fmt.println("Writing file ...")
				if !os.write_entire_file("steamworks/steamworks_generated.odin", finalBuf.buf[:]) {
					panic("Couldn't write file.")
				}
			}

			fmt.println("Sucessfully generated 'steamworks_generated.odin'")

		} else {
			fmt.println("json.parse Error:", err)
			panic("Couldn't parse json.")
		}
	} else do panic("Couldn't read file.")
}

convType :: proc(typeName: string) -> string {
	switch typeName {
	case "int":
		return "c.int"
	case "unsigned int":
		return "c.uint"
	case "unsigned long long":
		return "u64"
	case "unsigned short":
		return "c.ushort"
	case "unsigned char":
		return "u8"
	case "char":
		return "i8"
	case "const char*":
		return "cstring"
	case "const char *":
		return "cstring"
	case "const void*":
		return "rawptr"
	case "const void *":
		return "rawptr"
	case "float":
		return "f32"
	case "double":
		return "f64"
	}

	typeName := strings.trim_space(typeName)

	last := typeName[len(typeName) - 1]

	// pointer
	if last == '*' || last == '&' {
		return strings.concatenate({"^", convType(typeName[:len(typeName) - 1])}, context.temp_allocator)
	}

	typeName, _ = strings.remove_all(typeName, "const", context.temp_allocator)
	typeName, _ = strings.replace_all(typeName, "::", "_", context.temp_allocator)

	return typeName
}

printMethod :: proc(buf: ^strings.Builder, classname: string, method: json.Object) {
	methodname := method["methodname"].(json.String)
	params := method["params"].(json.Array)
	returntype := method["returntype"].(json.String)

	print(buf = buf, args = {classname, "_", methodname}, sep = "")
	print(buf, " :: proc(")
	print(buf = buf, args = {"self: ^", classname}, sep = "")
	if len(params) > 0 do print(buf, ", ")

	for param, i in params {
		param := param.(json.Object)
		paramname := param["paramname"].(json.String)
		paramtype := param["paramtype"].(json.String)
		print(buf, paramname)
		print(buf, ": ")
		print(buf, convType(paramtype))

		if i + 1 < len(params) do print(buf, ", ")
	}
	print(buf, ")")

	if returntype != "void" {
		print(buf, " ->", convType(returntype))
	}

	println(buf, " ---")
}

printEnum :: proc(buf: ^strings.Builder, classname: string, enum_: json.Object) {
	enumname := enum_["enumname"].(json.String)
	values := enum_["values"].(json.Array)
	name := enumname if classname == "" else strings.concatenate({classname, "_", enumname})
	println(buf, name, ":: enum {")

	for value in values {
		value := value.(json.Object)
		// NOTE: the value name could be shortened. Naming of enum values isn't completely consistent though...
		valueName := value["name"]
		valueValue := value["value"]
		print(buf, INDENT)
		print(buf, valueName, "=", valueValue)
		println(buf, ",")
	}

	println(buf, "}")
	println(buf)
}

printStruct :: proc(buf: ^strings.Builder, methodBuf: ^strings.Builder, struct_: json.Object) {
	name := struct_["struct"].(json.String)

	println(buf, name, ":: struct #packed {")

	for field in struct_["fields"].(json.Array) {
		field := field.(json.Object)
		fieldname := field["fieldname"].(json.String)
		fieldtype := field["fieldtype"].(json.String)
		print(buf, INDENT)
		print(buf, fieldname)
		print(buf, ": ")
		print(buf, convType(fieldtype))
		println(buf, ",")
	}

	println(buf, "}")
	println(buf)

	if methods, methodsOk := struct_["methods"].(json.Array); methodsOk {
		for method in methods {
			method := method.(json.Object)
			printMethod(methodBuf, name, method)
		}
	}

}
