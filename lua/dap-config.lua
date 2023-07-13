local dap = require('dap')
local dapui = require('dapui')
dapui.setup({})

keyset('n', '<Leader>dc', dap.continue)
keyset('n', '<Leader>b', dap.toggle_breakpoint)
keyset('n', '<Leader>do', dap.step_over)
keyset('n', '<Leader>di', dap.step_into)
keyset('n', '<Leader>du', dap.step_out)
keyset('n', '<Leader>dr', dap.repl.open)
keyset('n', '<Leader>dt', dapui.toggle)

require("dap-vscode-js").setup({
	-- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
	debugger_path = "/home/zscott/test/vscode-js-debug", -- Path to vscode-js-debug installation.
	-- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
	adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' }, -- which adapters to register in nvim-dap
	-- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
	-- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
	-- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
})

for _, language in ipairs({ "typescript", "javascript" }) do
	require("dap").configurations[language] = {
		{
			type = "pwa-node",
			request = "launch",
			name = "Launch file",
			program = "${file}",
			cwd = "${workspaceFolder}",
		},
		{
			type = "pwa-node",
			request = "attach",
			name = "attach",
			processid = require'dap.utils'.pick_process,
			cwd = "${workspacefolder}",
		},
		{
			type = "pwa-node",
			request = "attach",
			name = "obbe-api",
			sourceMaps = true,
			port = 5858,
			cwd = "${workspacefolder}",
			cosnole = 'integratedTerminal',
			-- skipFiles = { '<node_internals>/**' },
			-- localRoot = '${workspaceFolder}',
			-- localRoot = '/home/app',
		},
		{
			type = "pwa-node-cust",
			request = "attach",
			name = "obbe-api-cust",
			-- sourceMaps = true,
			port = 5858,
			-- cwd = "${workspacefolder}",
			-- cosnole = 'integratedTerminal',
			-- skipFiles = { '<node_internals>/**' },
			-- localRoot = '${workspaceFolder}',
			-- localRoot = '/home/app',
		},
		{
			type = "pwa-node",
			request = "attach",
			name = "obbe",
			port = 5858,
			cwd = "${workspacefolder}",
		},
		{
			-- For this to work you need to make sure the node process is started with the `--inspect` flag.
			name = 'Attach to process',
			type = 'node2',
			request = 'attach',
			sourceMaps = true,
			port = 5858,
			cwd = vim.fn.getcwd(),
			console = 'integratedTerminal',
			skipFiles = { '<node_internals>/**' },
			localRoot = '${workspaceFolder}',
			remoteRoot = function()
				return vim.fn.input("Container code folder > ", "/", "file")
			end,
			-- protocol = 'inspector'
		},
	}
end
dap.adapters.node2 = {
	type = 'executable',
	command = 'node',
	args = {os.getenv('HOME') .. '/dev/microsoft/vscode-node-debug2/out/src/nodeDebug.js'},
}
dap.adapters['pwa-node-cust'] = {
	type = 'server',
	host = 'localhost',
	command = 'node',
	port = 5858,
	executable = {
		command = "node",
		args = { "/home/zscott/deps/js-debug/src/dapDebugServer.js", "5858"}
		-- args = {os.getenv('HOME') .. '/dev/microsoft/vscode-node-debug2/out/src/nodeDebug.js'},
	}
}
-- dap.configurations.javascript = {
-- 	{
-- 		name = 'Launch',
-- 		type = 'node2',
-- 		request = 'launch',
-- 		program = '${file}',
-- 		cwd = vim.fn.getcwd(),
-- 		sourceMaps = true,
-- 		protocol = 'inspector',
-- 		console = 'integratedTerminal',
-- 	},
-- 	{
-- 		-- For this to work you need to make sure the node process is started with the `--inspect` flag.
-- 		name = 'Attach to process',
-- 		type = 'node2',
-- 		request = 'attach',
-- 		processId = require'dap.utils'.pick_process,
-- 	},
-- }
