require "io"
require "os"

local progname = "gdb ./ast";
local swapname = "/tmp/ast.output.swp";

os.remove(swapname);
os.execute("mkfifo " .. swapname)

local mainproc = io.popen(progname .. " > " .. swapname, "w")
local swap = io.open(swapname, "r")

if not (mainproc and swap) then
	error("failed to open process")
end

local function check_prompt(ln)
	return #ln >= 6 and
		ln[#ln] == " " and
		ln[#ln - 1] == ")" and
		ln[#ln - 2] == "b" and
		ln[#ln - 3] == "d" and
		ln[#ln - 4] == "g" and
		ln[#ln - 5] == "(";
end

while true do
	local ln = {};
	while true do
		table.insert(ln, swap:read(1));
		if check_prompt(ln) then
			local len = #ln
			ln[len] = nil
			ln[len - 1] = nil
			ln[len - 2] = nil
			ln[len - 3] = nil
			ln[len - 4] = nil
			ln[len - 5] = nil
			assert(#ln == len - 6)
			print(table.concat(ln))
			ln = {}
			break
		end
	end
	io.write("(gdb) ");
	local line = io.read("*line");
	if line == "exit" then
		break
	end
	mainproc:write(line .. "\n");
	mainproc:flush();
end

swap:close();
mainproc:close();
os.remove(swapname);

return;
