local M = {}

function M.setup()
  -- AZERTY -> Colemak keyboard remapping
  vim.keymap.set({ 'n', 'v', 'o' }, 'gn', 'n')
  vim.keymap.set({ 'n', 'v', 'o' }, 'gN', 'N')
  vim.keymap.set({ 'n', 'v', 'o' }, 'n', 'h')
  vim.keymap.set({ 'n', 'v', 'o' }, 'N', 'H')

  -- Down
  vim.keymap.set({ 'n', 'v', 'o' }, 'ge', 'e')
  vim.keymap.set({ 'n', 'v', 'o' }, 'gE', 'E')
  vim.keymap.set({ 'n', 'v', 'o' }, 'e', 'j')
  vim.keymap.set({ 'n', 'v', 'o' }, 'E', 'J')

  -- Up
  vim.keymap.set({ 'n', 'v', 'o' }, 'gi', 'i')
  vim.keymap.set({ 'n', 'v', 'o' }, 'gI', 'I')
  vim.keymap.set({ 'n', 'v', 'o' }, 'i', 'k')
  vim.keymap.set({ 'n', 'v', 'o' }, 'I', 'K')

  -- Right
  vim.keymap.set({ 'n', 'v', 'o' }, 'go', 'o')
  vim.keymap.set({ 'n', 'v', 'o' }, 'gO', 'O')
  vim.keymap.set({ 'n', 'v', 'o' }, 'o', 'l')
  vim.keymap.set({ 'n', 'v', 'o' }, 'O', 'L')

  vim.keymap.set({ 'n', 'v', 'o' }, 'h', 'e')
  vim.keymap.set({ 'n', 'v', 'o' }, 'H', 'E')
  vim.keymap.set({ 'n', 'v', 'o' }, 's', 'i')
  vim.keymap.set({ 'n', 'v', 'o' }, 'S', 'I')
  vim.keymap.set({ 'n', 'v', 'o' }, 't', 'a')
  vim.keymap.set({ 'n', 'v', 'o' }, 'T', 'A')
  vim.keymap.set({ 'n', 'v', 'o' }, 'a', 'o')
  vim.keymap.set({ 'n', 'v', 'o' }, 'A', 'O')
end

return M
