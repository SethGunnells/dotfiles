-- Used to minimize personal window when running the layout
local mainFF = nil
local personalFF = nil

local apps = {
  dash = 'com.kapeli.dashdoc',
  firefox = 'org.mozilla.firefoxdeveloperedition',
  hey = 'com.hey.app.desktop',
  outlook = 'com.microsoft.Outlook',
  slack = 'com.tinyspeck.slackmacgap',
  spotify = 'com.spotify.client',
  teams = 'com.microsoft.teams'
}

function makeFullScreen(bundleId, screen)
  local window = hs.application.get(bundleId):mainWindow()
  window:setFullScreen(true)
  window:moveToScreen(screen)
end

function maxSize(bundleId, screen)
  local window = bundleId == nil
    and hs.window.frontmostWindow()
    or hs.application.get(bundleId):mainWindow()
  if window == nil then return end
  window:setFullScreen(false)
  screen = screen or window:screen()
  local f = screen:frame()

  window:move({x=f.x, y=f.y, w=f.w, h=f.h}, screen)
end

function moveLeft(bundleId, screen)
  local window = bundleId == nil
    and hs.window.frontmostWindow()
    or hs.application.get(bundleId):mainWindow()
  window:setFullScreen(false)
  screen = screen or window:screen()
  local f = screen:frame()

  window:move({x=f.x, y=f.y, w=f.w/2, h=f.h}, screen)
end

function moveRight(bundleId, screen)
  local window = bundleId == nil
    and hs.window.frontmostWindow()
    or hs.application.get(bundleId):mainWindow()
  screen = screen or window:screen()
  local f = screen:frame()

  if window:isFullScreen() then
    window:focus()
    window:setFullScreen(false)
  end

  window:move({x=f.x+f.w/2, y=f.y, w=f.w/2, h=f.h}, screen)
end

function moveApp(bundleId, screen, size)
  local window = hs.application.get(bundleId):mainWindow()
  window:setFullScreen(false)
  window:move(size, screen)
end

hs.hotkey.bind({'cmd', 'alt', 'ctrl'}, 'Up', maxSize)
hs.hotkey.bind({'cmd', 'alt', 'ctrl'}, 'Left', moveLeft)
hs.hotkey.bind({'cmd', 'alt', 'ctrl'}, 'Right', moveRight)

function layoutApp(appId, size, screen, hide)
  if size == 'left' then
    moveLeft(appId, screen)
  elseif size == 'right' then
    moveRight(appId, screen)
  elseif size == 'max' then
    maxSize(appId, screen)
  elseif size == 'full' then
    makeFullScreen(appId, screen)
  else
    moveApp(appId, screen, size)
  end

  if hide then hs.application.get(appId):hide() end
end

function setupFirefox()
  local mac = hs.screen'Color LCD'
  local id = 'org.mozilla.firefoxdeveloperedition'
  local ff = hs.application.open(id)

  mainFF = ff:focusedWindow()

  ff:selectMenuItem('New Window')

  hs.timer.doAfter(1, function()
    personalFF = ff:focusedWindow()
    maxSize(id, mac)
    ff:selectMenuItem('Personal')
    hs.timer.doAfter(1, function()
      hs.eventtap.keyStroke({'cmd', 'alt'}, 'Left')
      ff:selectMenuItem('Close Tab')
    end)
  end)
end

function runLaptopLayout()
  local mac = hs.screen'Color LCD'
  local f = mac:frame()

  personalFF:becomeMain()
  layoutApp('org.mozilla.firefoxdeveloperedition', 'max', mac, false)
  personalFF:minimize()
  mainFF:becomeMain()
  layoutApp('org.mozilla.firefoxdeveloperedition', 'max', mac, false)

  layoutApp('com.tinyspeck.slackmacgap', 'max', mac, true)
  layoutApp('com.spotify.client', 'max', mac, true)
  layoutApp('com.microsoft.Outlook', 'max', mac, true)
  layoutApp('com.kapeli.dashdoc', 'max', mac, true)
end

function runAlternateLayout()
  local mac = hs.screen'Color LCD'
  local dell = hs.screen'DELL'
  local f = mac:frame()

  personalFF:becomeMain()
  layoutApp('org.mozilla.firefoxdeveloperedition', 'max', mac, false)
  personalFF:minimize()
  mainFF:becomeMain()
  layoutApp('org.mozilla.firefoxdeveloperedition', 'max', dell, false)

  layoutApp('com.tinyspeck.slackmacgap', 'max', mac, true)
  layoutApp('com.spotify.client', 'max', mac, true)
  layoutApp('com.microsoft.Outlook', 'max', mac, false)
  layoutApp('com.kapeli.dashdoc', 'max', mac, true)
  layoutApp('com.microsoft.teams', 'max', mac, true)
  layoutApp('com.hey.app.desktop', 'max', mac, true)
  layoutApp('com.apple.Terminal', 'max', dell, false)
end

function runLayout()
  local isDocked = #hs.screen.allScreens() > 1

  if isDocked then
    runAlternateLayout()
  else
    runLaptopLayout()
  end
end

hs.hotkey.bind({'cmd', 'alt', 'ctrl'}, 'L', runLayout)

hs.urlevent.bind('startup', function()
  setupFirefox()
  hs.timer.doAfter(8, runLayout)
end)

hs.urlevent.bind('personaltab', function()
  local ff = hs.application.open('org.mozilla.firefoxdeveloperedition')
  hs.timer.doAfter(0.5, function()
    ff:selectMenuItem('Personal')
  end)
end)

hs.urlevent.bind('setupfirefox', setupFirefox)
