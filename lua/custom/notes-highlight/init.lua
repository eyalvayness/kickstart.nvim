local M = {}

M.keys = {
  Done = {
    key = 'x',
    bg_hl = '#00aa00',
    fg_hl = '#ffffff',
  },
  Partial = {
    key = '/',
    bg_hl = '#ffa500',
    fg_hl = '#ffffff',
  },
  Question = {
    key = '?',
    bg_hl = '#00a0d0',
    fg_hl = '#ffffff',
  },
  Attention = {
    key = '!',
    bg_hl = '#ff0000',
    fg_hl = '#ffffff',
  },
}

M.ns = vim.api.nvim_create_namespace 'notes-hl'

function M.setup_hl()
  for k, v in pairs(M.keys) do
    vim.cmd(':hi def NotesBg' .. k .. ' guibg=' .. v['bg_hl'] .. ' guifg=' .. v['fg_hl'] .. ' gui=bold')
  end
end

function M.check_buf_lines(buf, lstart, lend)
  vim.api.nvim_buf_clear_namespace(buf, M.ns, lstart, lend)
  local lines = vim.api.nvim_buf_get_lines(0, lstart, lend, false)
  -- print('Checking ' .. lstart .. ' -> ' .. lend)
  for i, line in ipairs(lines) do
    local lnum = lstart + i - 1
    local start_index, end_index = string.find(line, '- %[.%]')
    -- print('Checking (' .. lnum .. '): ' .. line)
    if start_index and end_index then
      local key = string.sub(line, start_index + 3, start_index + 3)
      -- print('Checking for key:' .. key)
      for k, v in pairs(M.keys) do
        if v['key'] == key then
          vim.api.nvim_buf_add_highlight(0, M.ns, 'NotesBg' .. k, lnum, start_index + 1, end_index)
        end
      end
    end
  end
end

function M.attach()
  vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
    pattern = { '*.notes' },
    group = vim.api.nvim_create_augroup('notes-cmdgroup', { clear = true }),
    callback = function()
      local line_count = vim.api.nvim_buf_line_count(0)
      M.check_buf_lines(0, 0, line_count + 1)
      vim.api.nvim_buf_attach(0, true, {
        on_lines = function(_event, buf, _tick, first, last, _lines)
          -- print('Checking ' .. first .. ' -> ' .. last)
          M.check_buf_lines(buf, first, last + 1)
        end,
      })
    end,
  })
  -- vim.api.nvim_create_autocmd('WinScrolled', {
  --   group = vim.api.nvim_create_augroup('notes-cmdgroup', { clear = false }),
  --   callback = function()
  --     local line_count = vim.api.nvim_buf_line_count(0)
  --     M.check_buf_lines(0, 0, line_count + 1)
  --   end,
  -- })
end

function M.setup()
  M.setup_hl()
  M.attach()
end

return M
