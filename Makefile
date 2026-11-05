FA_FONTS := $(shell nix build --no-link --print-out-paths nixpkgs\#font-awesome)/share/fonts

plotnikov_anton_cv.pdf: plotnikov_anton_cv.typ portrait.jpg
	typst compile --font-path ~/.nix-profile/share/fonts --font-path $(FA_FONTS) $<
