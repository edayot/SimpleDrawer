$data modify storage dork.base64:temp args.decode.binary set value "$(binary)$(converted)"
data modify storage dork.base64:temp args.decode.byte set value ""
data modify storage dork.base64:temp args.decode.byte set string storage dork.base64:temp args.decode.binary 0 8
execute unless data storage dork.base64:temp args.decode{byte:""} run function dork.base64:impl/decode/do_convert with storage dork.base64:temp args.decode
