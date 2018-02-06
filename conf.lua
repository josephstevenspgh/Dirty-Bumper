function love.conf(t)
	--320
	--180
	--t.window.width = 320*4
    --t.window.height = 180*4
	t.window.width = 320*2
    t.window.height = 180*2
    t.window.title = "Dirty Bumper alpha"
    t.window.vsync = true
    --love-release
    t.releases = {
    title = "Dirty Bumper",              -- The project title (string)
    package = "dirtybumper",            -- The project command and package name (string)
    loveVersion = '0.10.0',        -- The project LÖVE version
    version = "0.10",            -- The project version
    author = "Joseph Stevens",             -- Your name (string)
    email = "joseph.stevens.pgh@gmail.com",              -- Your email (string)
    description = "check out the kickstarter!",        -- The project description (string)
    homepage = "twitter.com/splixel",           -- The project homepage (string)
    identifier = nil,         -- The project Uniform Type Identifier (string)
    releaseDirectory = "bin",   -- Where to store the project releases (string)
  }
end

