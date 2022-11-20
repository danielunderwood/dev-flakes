{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.05";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, utils }:
    utils.lib.eachDefaultSystem (system:
      let
		  pkgs = import nixpkgs {
			  inherit system;
			  config = { allowUnfree = true; };
		  };
      in
      {
        devShell = with pkgs; mkShell {
			buildInputs = [
				cmake
				cudaPackages.cuda_nvcc
				cudaPackages.cudatoolkit
				cudaPackages.cudnn
				gcc
				glew
				xorg.libX11
				xorg.libXcursor
				xorg.libXext
				xorg.libXi
				xorg.libXinerama
				xorg.libXrandr
				linuxPackages.nvidia_x11
				vulkan-headers
				vulkan-loader
				vulkan-tools
			];
        };
      });
}
