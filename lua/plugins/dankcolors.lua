return {
	{
		"RRethy/base16-nvim",
		priority = 1000,
		config = function()
			require('base16-colorscheme').setup({
				base00 = '#141311',
				base01 = '#141311',
				base02 = '#6c6c69',
				base03 = '#6c6c69',
				base04 = '#232322',
				base05 = '#bfbfbb',
				base06 = '#bfbfbb',
				base07 = '#bfbfbb',
				base08 = '#a15c53',
				base09 = '#a15c53',
				base0A = '#717155',
				base0B = '#488c3f',
				base0C = '#7c7c6e',
				base0D = '#717155',
				base0E = '#a9a99d',
				base0F = '#a9a99d',
			})

			vim.api.nvim_set_hl(0, 'Visual', {
				bg = '#6c6c69',
				fg = '#bfbfbb',
				bold = true
			})
			vim.api.nvim_set_hl(0, 'Statusline', {
				bg = '#717155',
				fg = '#141311',
			})
			vim.api.nvim_set_hl(0, 'LineNr', { fg = '#6c6c69' })
			vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#7c7c6e', bold = true })

			vim.api.nvim_set_hl(0, 'Statement', {
				fg = '#a9a99d',
				bold = true
			})
			vim.api.nvim_set_hl(0, 'Keyword', { link = 'Statement' })
			vim.api.nvim_set_hl(0, 'Repeat', { link = 'Statement' })
			vim.api.nvim_set_hl(0, 'Conditional', { link = 'Statement' })

			vim.api.nvim_set_hl(0, 'Function', {
				fg = '#717155',
				bold = true
			})
			vim.api.nvim_set_hl(0, 'Macro', {
				fg = '#717155',
				italic = true
			})
			vim.api.nvim_set_hl(0, '@function.macro', { link = 'Macro' })

			vim.api.nvim_set_hl(0, 'Type', {
				fg = '#7c7c6e',
				bold = true,
				italic = true
			})
			vim.api.nvim_set_hl(0, 'Structure', { link = 'Type' })

			vim.api.nvim_set_hl(0, 'String', {
				fg = '#488c3f',
				italic = true
			})

			vim.api.nvim_set_hl(0, 'Operator', { fg = '#232322' })
			vim.api.nvim_set_hl(0, 'Delimiter', { fg = '#232322' })
			vim.api.nvim_set_hl(0, '@punctuation.bracket', { link = 'Delimiter' })
			vim.api.nvim_set_hl(0, '@punctuation.delimiter', { link = 'Delimiter' })

			vim.api.nvim_set_hl(0, 'Comment', {
				fg = '#6c6c69',
				italic = true
			})

			local current_file_path = vim.fn.stdpath("config") .. "/lua/plugins/dankcolors.lua"
			if not _G._matugen_theme_watcher then
				local uv = vim.uv or vim.loop
				_G._matugen_theme_watcher = uv.new_fs_event()
				_G._matugen_theme_watcher:start(current_file_path, {}, vim.schedule_wrap(function()
					local new_spec = dofile(current_file_path)
					if new_spec and new_spec[1] and new_spec[1].config then
						new_spec[1].config()
						print("Theme reload")
					end
				end))
			end
		end
	}
}
