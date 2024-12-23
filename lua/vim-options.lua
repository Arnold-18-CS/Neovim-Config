vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set smartindent")
vim.cmd("set modifiable")
vim.g.mapleader = " "

vim.g.python3_host_prog = '~/.venvs/nvim/bin/python'

local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
package.path = package.path .. ";" .. install_path .. "/?.lua"
package.cpath = package.cpath .. ";" .. install_path .. "/?.so"

