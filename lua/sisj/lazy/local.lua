local local_plugins = {
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local harpoon = require("harpoon")

			harpoon:setup()

			vim.keymap.set("n", "<leader>A", function()
				harpoon:list():prepend()
			end)
			vim.keymap.set("n", "<leader>a", function()
				harpoon:list():add()
			end)
			vim.keymap.set("n", "<C-e>", function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end)

			vim.keymap.set("n", "<M-1>", function()
				harpoon:list():select(1)
			end)
			vim.keymap.set("n", "<M-2>", function()
				harpoon:list():select(2)
			end)
			vim.keymap.set("n", "<M-3>", function()
				harpoon:list():select(3)
			end)
			vim.keymap.set("n", "<M-4>", function()
				harpoon:list():select(4)
			end)
		end,
	},
	{
		"ThePrimeagen/99",
		config = function()
			local _99 = require("99")
			local cwd = vim.uv.cwd()
			local basename = vim.fs.basename(cwd)

			_99.setup({
                model = "github-copilot/claude-opus-4.8",
				logger = {
					level = _99.DEBUG,
					path = "/tmp/" .. basename .. ".99.debug",
					print_on_error = true,
				},
				tmp_dir = "./tmp",
				md_files = { "AGENT.md" },
			})

			-- Visual mode: replace selection with AI output
			vim.keymap.set("v", "<leader>9v", function()
				_99.visual()
			end)

			-- Cancel all in-flight requests
			vim.keymap.set("n", "<leader>9x", function()
				_99.stop_all_requests()
			end)

			-- AI project search -> quickfix list
			vim.keymap.set("n", "<leader>9s", function()
				_99.search()
			end)

			-- Open last interaction result
			vim.keymap.set("n", "<leader>9o", function()
				_99.open()
			end)

			-- Telescope: switch model on the fly
			vim.keymap.set("n", "<leader>9m", function()
				require("99.extensions.telescope").select_model()
			end)

			-- Telescope: switch provider on the fly
			vim.keymap.set("n", "<leader>9p", function()
				require("99.extensions.telescope").select_provider()
			end)
		end,
	},
}

return local_plugins

