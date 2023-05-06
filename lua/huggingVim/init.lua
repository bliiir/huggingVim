--  https://www.linode.com/docs/guides/write-a-neovim-plugin-with-lua/
--  https://huggingface.github.io/text-generation-inference/
--  https://huggingface.github.io/text-generation-inference/#/Text%20Generation%20Inference/generate_stream
--  https://huggingface.co/jordiclive/gpt4all-alpaca-oa-codealpaca-lora-7b
--  bastibe_lunatic-python A two-way bridge between Python and Lua
--  https://official-joke-api.appspot.com/random_joke

local http = require("socket.http")
local body, code, headers, status = http.request("https://official-joke-api.appspot.com/random_joke")

local M = {}
M.heades = headers
M.status = status
M.code = code
M.body = body

local row, col = unpack(vim.api.nvim_win_get_cursor(0))
vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col, { M.body })

return M
