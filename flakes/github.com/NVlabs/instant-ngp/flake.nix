{
  inputs = {
    # You'll want this to correspond to the version of the nvidia driver you're
    # using. If you don't, you can get errors like
    # cudamalloc failed with error forward compatibility was attempted on non supported HW
    # If you're on NixOS, just point this to the channel you're using
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
