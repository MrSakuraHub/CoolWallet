local fm = require "fullmoon"

local util = require "util"

function testPage(r)
  return fm.serveContent("testPage", {})
end

fm.setRoute(fm.GET "/testpage", testPage)

