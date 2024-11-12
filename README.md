```bash
nix build
```

Should result in 

```
...
       > Configure flags:
       > --prefix=/nix/store/chgbsp40fld223imj3cllb2lq89j44v4-th-orphans-lib-th-orphans-0.13.15 lib:th-orphans --package-db=clear --package-db=/private/tmp/nix-build-th-orphans-lib-th-orphans-0.13.15.drv-0/tmp.8NpXSsTWBc/lib/ghc-9.6.6/lib/package.conf.d --exact-configuration --dependency=mtl=mtl-2.3.1-3ir0ZKjsdE38agmlf56uY2 --dependency=transformers=transformers-0.6.1.0-82WQv2PKD8LCUHu5ap4VJu --dependency=th-compat=th-compat-0.1.5-1q3eWW1XeGC21yq08Ak29g --dependency=th-lift=th-lift-0.8.5-3y8jOTWd5Wt1dLz5kC3Zkv --dependency=th-abstraction=th-abstraction-0.5.0.0-8oJm59OaKrAJhI9lSVQalQ --dependency=containers=containers-0.6.7-7Fgmf1lZyN42SY21QUG1Cp --dependency=th-reify-many=th-reify-many-0.1.10-4Zs7i5E05sFDICML82jxh --dependency=mtl=mtl-2.3.1-3ir0ZKjsdE38agmlf56uY2 --dependency=safe=safe-0.3.21-F46Xmb3LoXlCc8daI6vSkg --dependency=th-expand-syns=th-expand-syns-0.4.11.0-ITqeduTRsGALwH1XZdEb1k --dependency=syb=syb-0.7.2.4-CGf6yzYBtNj1GaPOXC2hje --dependency=array=array-0.5.6.0 --dependency=base=base-4.18.2.1 --dependency=deepseq=deepseq-1.4.8.1 --dependency=ghc-bignum=ghc-bignum-1.3 --dependency=ghc-boot-th=ghc-boot-th-9.6.6 --dependency=ghc-prim=ghc-prim-0.10.0 --dependency=integer-gmp=integer-gmp-1.1 --dependency=pretty=pretty-1.1.3.6 --dependency=rts=rts-1.0.2 --dependency=system-cxx-std-lib=system-cxx-std-lib-1.0 --dependency=template-haskell=template-haskell-2.20.0.0 --with-ghc=ghc --with-ghc-pkg=ghc-pkg --with-hsc2hs=hsc2hs --with-gcc=cc --with-ar=ar --with-strip=strip --disable-executable-stripping --disable-library-stripping --disable-library-profiling --disable-profiling --enable-static --enable-shared --disable-executable-dynamic --disable-coverage --enable-library-for-ghci --datadir=/nix/store/7bq9l1gmwwlsxvicq2knpip1vibqh3ax-th-orphans-lib-th-orphans-0.13.15-data/share/ghc-9.6.6
       > Configuring library for th-orphans-0.13.15..
       > Warning: --enable-library-for-ghci is not supported with the current linker;
       > ignoring...
       > Running phase: buildPhase
       > Preprocessing library for th-orphans-0.13.15..
       > Building library for th-orphans-0.13.15..
       > [1 of 2] Compiling Language.Haskell.TH.Instances.Internal ( src/Language/Haskell/TH/Instances/Internal.hs, dist/build/Language/Haskell/TH/Instances/Internal.o, dist/build/Language/Haskell/TH/Instances/Internal.dyn_o )
       > [2 of 2] Compiling Language.Haskell.TH.Instances ( src/Language/Haskell/TH/Instances.hs, dist/build/Language/Haskell/TH/Instances.o, dist/build/Language/Haskell/TH/Instances.dyn_o )
       > /nix/store/vrjr8rg1gsvvncgdl7qybh5h7vgqdxvn-stdenv-darwin/setup: line 1596: 36086 Killed: 9               $SETUP_HS build lib:th-orphans -j$(($NIX_BUILD_CORES > 4 ? 4 : $NIX_BUILD_CORES)) --ghc-option=-fPIC --gcc-option=-fPIC
```
