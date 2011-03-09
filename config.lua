AppPath = debug.getinfo(1,"S").source:match("@(.*"..package.config:sub(1,1)..")") 
package.path = package.path .. ';'.. AppPath .. '/app/model/?.lua'
package.path = package.path .. ';'.. AppPath .. '/app/view/?.lua'
package.path = package.path .. ';'.. AppPath .. '/lib/?.lua'
package.path = package.path .. ';'.. AppPath .. '/test/model/?.lua'

application =
{
  content =
  {
    width = 320,
    height = 480,
    scale = "letterbox"
  },
}