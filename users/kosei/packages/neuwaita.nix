{ lib
, stdenvNoCC
, fetchFromGitHub
, unstableGitUpdater
, gtk3
, gtk4
, adwaita-icon-theme
, kdePackages
, hicolor-icon-theme
}:
stdenvNoCC.mkDerivation {
    name = "neuwaita";

    src = fetchFromGitHub {
        owner = "RusticBard";
        repo = "Neuwaita";
        rev = "7be7b285c1b24e790cf65aa4809acbab42ee7a6d";
        hash = "sha256-I2SOz75wMKDGXfM8WgAS69EAdxyx9IOmDxxucXU3fnE=";
    };

    propagatedBuildInputs = [ adwaita-icon-theme kdePackages.breeze-icons hicolor-icon-theme ];

    nativeBuildInputs = [ gtk3 gtk4 ];

    dontWrapQtApps = true;

    dontDropIconThemeCache = true;

    installPhase = ''
        runHook preInstall

        mkdir -p $out/share/icons/Neuwaita
        cp -r index.theme scalable Extras $out/share/icons/Neuwaita/
        # gtk-update-icon-cache -v -f $out/share/icons/Neuwaita/

        runHook postInstall
    '';

    passthru.updateScript = unstableGitUpdater {};
}
