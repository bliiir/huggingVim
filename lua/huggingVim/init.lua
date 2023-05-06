--  https://www.linode.com/docs/guides/write-a-neovim-plugin-with-lua/
--  https://huggingface.github.io/text-generation-inference/
--  https://huggingface.github.io/text-generation-inference/#/Text%20Generation%20Inference/generate_stream
--  https://huggingface.co/jordiclive/gpt4all-alpaca-oa-codealpaca-lora-7b
--  bastibe_lunatic-python A two-way bridge between Python and Lua
--
--  https://official-joke-api.appspot.com/random_joke
--
local http = require("socket.http")
local body, code, headers, status = http.request("https://official-joke-api.appspot.com/random_joke")

-- Imports the plugin's additional Lua modules.
-- local fetch = require("example-plugin.fetch")
-- local update = require("example-plugin.update")

-- Creates an object for the module. All of the module's
-- functions are associated with this object, which is
-- returned when the module is called with `require`.
local M = {}
M.heades = headers
M.status = status
M.code = code
M.body = body

local row, col = unpack(vim.api.nvim_win_get_cursor(0))
vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col, { M.body })


-- Routes calls made to this module to functions in the
-- plugin's other modules.
-- M.fetch_todos = fetch.fetch_todos
-- M.insert_todo = update.insert_todo
-- M.complete_todo = update.complete_todo

return M
