function testPage(r)
  return fm.serveContent("testPage", {})
end

fm.setRoute(fm.GET "/testpage", testPage)

