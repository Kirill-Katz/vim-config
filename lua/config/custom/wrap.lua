local M = {}

function M.wrap_visual(left, right)
    local bufnr = 0

    local start_pos = vim.api.nvim_buf_get_mark(bufnr, "<")
    local end_pos   = vim.api.nvim_buf_get_mark(bufnr, ">")

    local srow, scol = start_pos[1] - 1, start_pos[2]
    local erow, ecol = end_pos[1] - 1, end_pos[2]

    local lines = vim.api.nvim_buf_get_text(bufnr, srow, scol, erow, ecol, {})
    if #lines == 0 then return end

    lines[1] = left .. lines[1]
    lines[#lines+1] = lines[#lines] .. right

    vim.api.nvim_buf_set_text(bufnr, srow, scol, erow, ecol, lines)
end

return M

