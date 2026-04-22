{ lib, options, config, stdenvNoCC, fetchFromGitHub, unstableGitUpdater, gtk3 }:
stdenvNoCC.mkDerivation {
    name = "neuwaita";

    src = fetchFromGitHub {
        owner = "RusticBard";
        repo = "Neuwaita";
        rev = "7be7b285c1b24e790cf65aa4809acbab42ee7a6d";
        hash = lib.fakeSha256;
    };

    nativeBuildInputs = [ gtk3 ];

    dontDropIconThemeCache = true;

    installPhase = ''
        runHook preInstall

        mkdir -p $out/share/icons/Neuwaita
        cp -r . $out/share/icons/Neuwaita
        gtk-update-icon-cache $out/share/icons/Neuwaita

        runHook postInstall
    '';

    passthru.updateScript = unstableGitUpdater {};
}
