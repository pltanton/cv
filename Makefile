plotnikov_anton_cv.pdf: plotnikov_anton_cv.typ portrait.jpg
	typst compile --font-path ~/.nix-profile/share/fonts $<
