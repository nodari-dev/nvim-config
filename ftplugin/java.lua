local home = os.getenv 'HOME'
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local path_to_holy_molly_java = home .. '/.local/share'
local workspace_dir = path_to_holy_molly_java .. '/nvim/jdtls-workspace/' .. project_name

local config_for_os = vim.fn.has('macunix') and 'config_mac' or 'confix_linux'

local status, jdtls = pcall(require, 'jdtls')
if not status then
	return
end

local extendedClientCapabilities = jdtls.extendedClientCapabilities
local config = {
	cmd = {
		'java',
		'-Declipse.application=org.eclipse.jdt.ls.core.id1',
		'-Dosgi.bundles.defaultStartLevel=4',
		'-Declipse.product=org.eclipse.jdt.ls.core.product',
		'-Dlog.protocol=true',
		'-Dlog.level=ALL',
		'-Xmx1g',
		'--add-modules=ALL-SYSTEM',
		'--add-opens', 'java.base/java.util=ALL-UNNAMED',
		'--add-opens', 'java.base/java.lang=ALL-UNNAMED',
		'-javaagent:' .. path_to_holy_molly_java .. '/java-lombok/lombok.jar',
		'-jar', vim.fn.glob(path_to_holy_molly_java .. '/java-lsp/plugins/org.eclipse.equinox.launcher_1.6.800.v20240304-1850.jar'),
		'-configuration', path_to_holy_molly_java.. '/java-lsp/' .. config_for_os,
		'-data', workspace_dir,
	},
	root_dir = require('jdtls.setup').find_root({ '.git', 'mvnw', 'gradlew' }),

	settings = {
		java = {
			signatureHelp = { enabled = true },
			extendedClientCapabilities = extendedClientCapabilities,
			maven = {
				downloadSources = true,
			},
			referencesCodeLens = {
				enabled = true,
			},
			references = {
				includeDecompiledSources = true,
			},
			inlayHints = {
				parameterNames = {
					enabled = 'all'
				},
			},
			format = {
				enabled = false,
			},
		},
	},

	-- Language server `initializationOptions`
	-- You need to extend the `bundles` with paths to jar files
	-- if you want to use additional eclipse.jdt.ls plugins.
	--
	-- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
	--
	-- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
	init_options = {
		bundles = {}
	},
}

require('jdtls').start_or_attach(config)
