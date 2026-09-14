{
  fetchurl,
  libarchive,
  lib,
  stdenvNoCC,
}:

stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "omniwm";
  version = "0.6.10";

  src = fetchurl {
    url = "https://github.com/BarutSRB/OmniWM/releases/download/v${finalAttrs.version}/OmniWM-v${finalAttrs.version}.zip";
    hash = "sha256-EO74kwd9IQ0VRfV3WiuSsvNm32HbT72KvCKzqx0IxK8=";
  };

  sourceRoot = "OmniWM.app";

  __structuredAttrs = true;
  strictDeps = true;

  nativeBuildInputs = [ libarchive ];

  # unzip breaks the .app code signature, bsdtar preserves it.
  unpackCmd = ''bsdtar -xf "$curSrc"'';

  installPhase = ''
    runHook preInstall

    mkdir -p "$out/Applications/OmniWM.app" "$out/bin"
    cp -R . "$out/Applications/OmniWM.app"

    ln -s "$out/Applications/OmniWM.app/Contents/MacOS/OmniWM" "$out/bin/OmniWM"
    ln -s "$out/Applications/OmniWM.app/Contents/MacOS/omniwmctl" "$out/bin/omniwmctl"

    runHook postInstall
  '';

  # Keep the signed and notarized application bundle byte-identical.
  dontFixup = true;

  meta = {
    homepage = "https://github.com/BarutSRB/OmniWM";
    description = "Tiling window manager for Apple Silicon Macs with Niri-style scrolling containers and Hyprland-style Dwindle BSP";
    license = lib.licenses.gpl2Only;
    sourceProvenance = [ lib.sourceTypes.binaryNativeCode ];
    platforms = [ "aarch64-darwin" ];
    mainProgram = "omniwmctl";
  };
})
