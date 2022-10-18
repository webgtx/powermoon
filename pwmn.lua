--
-- Alex Zolotarov @ 2022
-- https://github.com/webgtx
--

efs = {
  listof = function(path)
    local i, t, popen = 0, {}, io.popen
    local pfile = popen('ls -a "'..path..'"')
    for filename in pfile:lines() do
      i = i + 1
      t[i] = filename
    end
    pfile:close()
    return t
  end,
  linesof = function(file)
    if not file_exists(file) then return {} end
    lines = {}
    for line in io.lines(file) do
      lines[#lines + 1] = line
    end
    return lines
  end,
  isfile = function(file)
    local f = io.open(file)
    if f then f:close() end
    return f ~= nil
  end
}

function split(str, sep)
  if sep == nil then sep = "%s" end
  local tbl = {}
  for str in string.gmatch(str, "([^"..sep.."]+)") do
    table.insert(tbl, str)
  end
  return tbl
end

function sh(shell)
  local handle = io.popen(shell)
  local result = handle:read("*a")
  handle:close()
  return result
end

function tprint(tbl, indent)
  if not indent then indent = 0 end
  for k, v in pairs(tbl) do
    formatting = string.rep("  ", indent) .. k .. ": "
    if type(v) == "table" then
      print(formatting)
      tprint(v, indent+1)
    elseif type(v) == 'boolean' then
      print(formatting .. tostring(v))      
    elseif type(v) == 'function' then
      print(formatting .. "function")
    else
      print(formatting .. v)
    end
  end
end 
