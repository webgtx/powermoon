require("pwmn")
function title(value) print("\n".."[ "..value.." ]") end 
local tbl = {
  name = "jhondoe",
  age = 20,
  is_admin = false,
  1,
  0,
  1,
  do_smth = function (smth)
    print("smth", smth) 
  end,
  another_table = {1,2,4,":0"}
}

title("split test")
local str = "I love pancakes"
for i,v in pairs(split(str, "e")) do
  print(i,v)
end

title("shell integration testing")
print("Current Directory:", sh("pwd"))

title("esf.listof function test")
for i,v in pairs(efs.listof("./")) do
  print(i,v)
end

title("tprint fucntion test")
--print(type(tbl.do_smth))
tprint(tbl)
