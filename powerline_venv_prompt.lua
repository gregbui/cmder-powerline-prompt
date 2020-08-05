local exports = require('path')

-- VENV virtual environment variable name
local VENV = "VIRTUAL_ENV"

-- * Segment object with these properties:
---- * isNeeded: sepcifies whether a segment should be added or not. For example: no Git segment is needed in a non-git folder
---- * text
---- * textColor: Use one of the color constants. Ex: colorWhite
---- * fillColor: Use one of the color constants. Ex: colorBlue
local segment = {
    isNeeded = false,
    text = "",
    textColor = colorWhite,
    fillColor = colorCyan
}

local function init()
    env_path = clink.get_env(VENV)
    if env_path then
        segment.text = " ("..exports.basename(env_path)..") "
    else
        segment.text = ""
    end
end

---
-- add virtual env name
---
function venv_prompt_filter()
    init()
    addSegment(segment.text, segment.textColor, segment.fillColor)
end

-- Register this addon with Clink
clink.prompt.register_filter(venv_prompt_filter, 54)