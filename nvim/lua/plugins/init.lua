local Event = require("lazy.core.handler.event")

-- Add custom lazy event when entering a file
Event.mappings.LazyFile = { id = "LazyFile", event = { "BufReadPost", "BufNewFile", "BufWritePre" } }
Event.mappings["User LazyFile"] = Event.mappings.LazyFile

return {}
