-- scaffold geniefile for meshoptimizer

meshoptimizer_script = path.getabsolute(path.getdirectory(_SCRIPT))
meshoptimizer_root = path.join(meshoptimizer_script, "meshoptimizer")

meshoptimizer_includedirs = {
	path.join(meshoptimizer_script, "config"),
	meshoptimizer_root,
}

meshoptimizer_libdirs = {}
meshoptimizer_links = {}
meshoptimizer_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { meshoptimizer_includedirs }
	end,

	_add_defines = function()
		defines { meshoptimizer_defines }
	end,

	_add_libdirs = function()
		libdirs { meshoptimizer_libdirs }
	end,

	_add_external_links = function()
		links { meshoptimizer_links }
	end,

	_add_self_links = function()
		links { "meshoptimizer" }
	end,

	_create_projects = function()

project "meshoptimizer"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		meshoptimizer_includedirs,
	}

	defines {}

	files {
		path.join(meshoptimizer_script, "config", "**.h"),
		path.join(meshoptimizer_root, "**.h"),
		path.join(meshoptimizer_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
