local function open_q_chat()
    if not vim.env.TMUX then
        vim.notify("Not in a tmux session", vim.log.levels.WARN)
        return
    end

    -- Check if window named "q" exists
    local check_result = vim.fn.system('tmux list-windows -F "#{window_name}" | grep -x "q"')

    if vim.v.shell_error == 0 then
        -- Window exists, switch to it
        local switch_result = vim.fn.system('tmux select-window -t "q"')
        if vim.v.shell_error ~= 0 then
            vim.notify("Failed to switch to window 'q': " .. switch_result, vim.log.levels.ERROR)
        end
    else
        -- Window doesn't exist, create it and switch to it
        local create_result = vim.fn.system('tmux new-window -n "q" "q chat"')
        if vim.v.shell_error ~= 0 then
            vim.notify("Failed to create window 'q': " .. create_result, vim.log.levels.ERROR)
        end
    end
end

vim.keymap.set('n', '<leader>qc', open_q_chat, { desc = 'Open Q Chat in tmux split' })

return {}

-- Plugin - not ideal
-- return {
--   {
--     name = 'amazonq',
--     url = 'ssh://git.amazon.com/pkg/AmazonQNVim',
--     opts = {
--       ssoStartUrl = 'https://amzn.awsapps.com/start',
--     },
--     config = function ()
--       require('amazonq').setup({
--         ssoStartUrl = 'https://amzn.awsapps.com/start',
--         inline_suggest = true,
--         filetypes = {
--           'amazonq', 'bash', 'java', 'python', 'typescript', 'javascript', 'kotlin', 'sh', 'sql', 'c',
--           'cpp', 'go', 'rust', 'lua',
--         },
--         on_chat_open = function()
--           vim.cmd[[
--             vertical topleft split
--             set wrap breakindent nonumber norelativenumber nolist
--           ]]
--         end,
--       })
--
--       vim.keymap.del({ "n", "v" }, "zq")
--       vim.keymap.set({ "n", "v" }, "<leader>qc", ":AmazonQ<cr>", {})
--     end
--   },
-- }
--
