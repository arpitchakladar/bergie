{
	description = "Flake for development environment for bergie.";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
	};

	outputs = { self, nixpkgs }:
	let
		pkgs = nixpkgs.legacyPackages."x86_64-linux";
		buildScript = pkgs.writeShellScriptBin "run" ''
#!/bin/sh
cmake -B build
make -C build && ./build/bergie
		'';
	in
	{
		devShells."x86_64-linux".default = pkgs.mkShell {
			packages = with pkgs; [
				(clang-tools.override {
					enableLibcxx = false;
				})
				clang
				cmake
				glfw
				glew
				buildScript
			];

			shellHook = ''
export CC="${pkgs.clang}/bin/clang"
export CXX="${pkgs.clang}/bin/clang++"
			'';
		};
	};
}
