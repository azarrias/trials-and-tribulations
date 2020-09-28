--[[
    constants
  ]]
GAME_TITLE = 'Trials and tribulations'
DEBUG_MODE = true

-- OS checks in order to make necessary adjustments to support multiplatform
MOBILE_OS = (love._version_major > 0 or love._version_minor >= 9) and (love.system.getOS() == 'Android' or love.system.getOS() == 'OS X')
WEB_OS = (love._version_major > 0 or love._version_minor >= 9) and love.system.getOS() == 'Web'

-- libraries
Class = require 'libs.class'
push = require 'libs.push'
tiny = require 'libs.tiny'

-- general purpose / utility
require 'Rect'
require 'util'

-- pixels resolution
WINDOW_SIZE = tiny.Vector2D(1600, 900)
VIRTUAL_SIZE = tiny.Vector2D(1600, 900)
