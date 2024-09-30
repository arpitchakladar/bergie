{
	description = "A very basic flake";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
	};

	outputs = { self, nixpkgs }: {
		devShells."x86_64-linux".default = pkgs.mkShell {
			packages = with pkgs; [
				clang
				cmake
				glfw
			];
		};
	};
}
