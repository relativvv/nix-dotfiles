{
  fetchzip,
  installShellFiles,
  lib,
  stdenvNoCC,
}:

stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "aerospork";
  version = "1.1.8";

  src = fetchzip {
    url = "https://github.com/wbsmolen/aerospork/releases/download/v${finalAttrs.version}/aerospork-v${finalAttrs.version}.zip";
    hash = "sha256-ClYVdw/mTliguANIF8JmlB9fdG/XHDFzV7xauwoksXY=";
  };

  nativeBuildInputs = [ installShellFiles ];

  installPhase = ''
    runHook preInstall

    mkdir -p "$out/Applications" "$out/bin"
    cp -R AeroSpork.app "$out/Applications/AeroSpork.app"
    ln -s "$out/Applications/AeroSpork.app/Contents/MacOS/aerospork-cli" "$out/bin/aerospork"

    installManPage manpage/*
    installShellCompletion --bash shell-completion/bash/aerospork
    installShellCompletion --fish shell-completion/fish/aerospork.fish
    installShellCompletion --zsh shell-completion/zsh/_aerospork

    runHook postInstall
  '';

  # Keep the signed and notarized application bundle byte-identical.
  dontFixup = true;

  meta = {
    homepage = "https://github.com/wbsmolen/aerospork";
    description = "i3-like tiling window manager for macOS, forked from AeroSpace";
    license = lib.licenses.mit;
    sourceProvenance = [ lib.sourceTypes.binaryNativeCode ];
    platforms = lib.platforms.darwin;
    mainProgram = "aerospork";
  };
})
