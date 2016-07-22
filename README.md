Copyright 2014 - The CyanogenMod Project
===================================

Device configuration for Samsung Galaxy Core 2 SM-G355H (kanas)

---

		Instruction how to build

---

I think you already set up build enviroment so I will skip this.

---

First go to build/tools/device and open with gedit the file "makerecoveries.sh"
find the line:
		make -j16 recoveryzip
and remove -j16, result will be like it:
		make recoveryzip
because it won't eat your RAM and build will be faster

---

For build recovery, run this command in terminal from your working dir 

		source build/envsetup.sh && breakfast kanas && make recoveryimage

Your build will start and you will find your recovery.img in out/target/product/kanas

---

To make it flashable via ODIN you have to make it recovery.tar.md5

Navigate with terminal where you save your recovey.img
For example: cd out/target/product/kanas
and run command:

		tar -H ustar -c recovery.img > recovery.tar
		md5sum -t recovery.tar >> recovery.tar
		mv recovery.tar recovery.tar.md5

An now you got recovery.tar.md5 ready to be flashed usin ODIN selected as PDA file

---

To apply patches for example: external_tinyalsa.diff
go to external/tinyalsa, copy the patch in that directory and open terminal
and run command:

		patch -p1 < audio.patch

And for build rom, run this command in terminal from your working dir 

		source build/envsetup.sh && brunch kanas

Good luck and Happy building. (^_^)/
