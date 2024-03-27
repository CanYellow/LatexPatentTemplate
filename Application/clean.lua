package.path = "D:/ProgramFiles/luarocks/lua/?.lua;D:/ProgramFiles/luarocks/lua/?/init.lua;C:/Users/BrightHuang/AppData/Roaming/LuaRocks/share/lua/5.1/?.lua;C:/Users/BrightHuang/AppData/Roaming/LuaRocks/share/lua/5.1/?/init.lua;D:/ProgramFiles/luarocks/systree/share/lua/5.1/?.lua;D:/ProgramFiles/luarocks/systree/share/lua/5.1/?/init.lua;" .. package.path

package.cpath = "C:/Users/BrightHuang/AppData/Roaming/LuaRocks/lib/lua/5.1/?.dll;D:/ProgramFiles/luarocks/systree/lib/lua/5.1/?.dll;" .. package.cpath

local lfs=require"lfs"
local os=require"os"
local str=require"string"

function clean(path)
    for file in lfs.dir(path) do
        local f = path..'/'..file
        local attr = lfs.attributes (f)
        
        -- 去除目录 包括了 figure ..(父目录) .(当前目录)
        if attr.mode ~= "directory" then
            -- 模式匹配 去除.csv .pdf .tex .lua 以及 latexmkrc 文件
            if not (str.find(file, "%.csv") or str.find(file, "%.lua") or str.find(file, "%.pdf") or str.find(file, "latexmkrc") or str.find(file, "%.tex")) then
                os.remove(f)
            end
        end
    end
end

clean(".")
