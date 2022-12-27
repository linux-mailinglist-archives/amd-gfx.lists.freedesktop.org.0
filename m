Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB91656C94
	for <lists+amd-gfx@lfdr.de>; Tue, 27 Dec 2022 16:34:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9E1510E0C2;
	Tue, 27 Dec 2022 15:34:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 575 seconds by postgrey-1.36 at gabe;
 Tue, 27 Dec 2022 08:46:35 UTC
Received: from gauss.telenet-ops.be (gauss.telenet-ops.be [195.130.132.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D79B10E0B5
 for <amd-gfx@lists.freedesktop.org>; Tue, 27 Dec 2022 08:46:35 +0000 (UTC)
Received: from albert.telenet-ops.be (albert.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:1a])
 by gauss.telenet-ops.be (Postfix) with ESMTPS id 4Nh7Kc00kdz4x04L
 for <amd-gfx@lists.freedesktop.org>; Tue, 27 Dec 2022 09:36:19 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:312a:feb:527f:f392])
 by albert.telenet-ops.be with bizsmtp
 id 1LbH290023T8eJe06LbH8w; Tue, 27 Dec 2022 09:35:19 +0100
Received: from geert (helo=localhost)
 by ramsan.of.borg with local-esmtp (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1pA5Qa-001J4O-Tj; Tue, 27 Dec 2022 09:35:16 +0100
Date: Tue, 27 Dec 2022 09:35:16 +0100 (CET)
From: Geert Uytterhoeven <geert@linux-m68k.org>
X-X-Sender: geert@ramsan.of.borg
To: linux-kernel@vger.kernel.org
Subject: Re: Build regressions/improvements in v6.2-rc1
In-Reply-To: <20221227082932.798359-1-geert@linux-m68k.org>
Message-ID: <alpine.DEB.2.22.394.2212270933530.311423@ramsan.of.borg>
References: <CAHk-=wgf929uGOVpiWALPyC7pv_9KbwB2EAvQ3C4woshZZ5zqQ@mail.gmail.com>
 <20221227082932.798359-1-geert@linux-m68k.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1893319093-1672130116=:311423"
X-Mailman-Approved-At: Tue, 27 Dec 2022 15:33:58 +0000
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: linux-xtensa@linux-xtensa.org, linux-sh@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-mips@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-f2fs-devel@lists.sourceforge.net,
 kasan-dev@googlegroups.com, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1893319093-1672130116=:311423
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 8BIT

On Tue, 27 Dec 2022, Geert Uytterhoeven wrote:
> Below is the list of build error/warning regressions/improvements in
> v6.2-rc1[1] compared to v6.1[2].
>
> Summarized:
>  - build errors: +11/-13

amd-gfx@lists.freedesktop.org
linux-arm-kernel@lists.infradead.org
linux-media@vger.kernel.org
linux-wireless@vger.kernel.org
linux-mips@vger.kernel.org
linux-sh@vger.kernel.org
linux-f2fs-devel@lists.sourceforge.net
linuxppc-dev@lists.ozlabs.org
kasan-dev@googlegroups.com
linux-xtensa@linux-xtensa.org

   + /kisskb/src/drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c: error: the frame size of 2224 bytes is larger than 2048 bytes [-Werror=frame-larger-than=]:  => 7082:1
   + /kisskb/src/drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c: error: the frame size of 2208 bytes is larger than 2048 bytes [-Werror=frame-larger-than=]:  => 7127:1

arm64-gcc5/arm64-allmodconfig

   + /kisskb/src/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c: error: array subscript 2 is above array bounds of 'u32[2]' {aka 'unsigned int[2]'} [-Werror=array-bounds]:  => 641:28
   + /kisskb/src/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c: error: array subscript 3 is above array bounds of 'u32[2]' {aka 'unsigned int[2]'} [-Werror=array-bounds]:  => 641:28

m68k-gcc8/m68k-allmodconfig
See also https://lore.kernel.org/all/CAMuHMdWpPX2mpqFEWjjbjsQvDBQOXyjjdpKnQu9qURAuVZXmMw@mail.gmail.com

   + /kisskb/src/include/linux/bitfield.h: error: call to '__field_overflow' declared with attribute error: value doesn't fit into mask:  => 151:3

In function 'u32_encode_bits',
     inlined from 'ieee80211_mlo_multicast_tx' at /kisskb/src/net/mac80211/tx.c:4435:17,
     inlined from 'ieee80211_subif_start_xmit' at /kisskb/src/net/mac80211/tx.c:4483:3:

mipsel-gcc5/mips-allmodconfig

   + /kisskb/src/include/linux/compiler_types.h: error: call to '__compiletime_assert_262' declared with attribute error: Unsupported access size for {READ,WRITE}_ONCE().:  => 358:45
   + /kisskb/src/include/linux/compiler_types.h: error: call to '__compiletime_assert_263' declared with attribute error: Unsupported access size for {READ,WRITE}_ONCE().:  => 358:45

In function 'follow_pmd_mask',
     inlined from 'follow_pud_mask' at /kisskb/src/mm/gup.c:735:9,
     inlined from 'follow_p4d_mask' at /kisskb/src/mm/gup.c:752:9,
     inlined from 'follow_page_mask' at /kisskb/src/mm/gup.c:809:9:

sh4-gcc11/sh-defconfig (G�nter wondered if pmd_t should use union)

   + /kisskb/src/include/linux/fortify-string.h: error: '__builtin_memcpy' offset [0, 127] is out of the bounds [0, 0] [-Werror=array-bounds]:  => 57:33

/kisskb/src/arch/s390/kernel/setup.c: In function 'setup_lowcore_dat_on':
s390x-gcc11/s390-all{mod,yes}config

   + /kisskb/src/include/linux/fortify-string.h: error: '__builtin_memset' pointer overflow between offset [28, 898293814] and size [-898293787, -1] [-Werror=array-bounds]:  => 59:33

/kisskb/src/fs/f2fs/inline.c: In function 'f2fs_move_inline_dirents':

powerpc-gcc11/ppc64_book3e_allmodconfig
powerpc-gcc11/powerpc-all{mod,yes}config

   + /kisskb/src/kernel/kcsan/kcsan_test.c: error: the frame size of 1680 bytes is larger than 1536 bytes [-Werror=frame-larger-than=]:  => 257:1

xtensa-gcc11/xtensa-allmodconfig (patch available)

   + {standard input}: Error: unknown pseudo-op: `.cfi_def_c':  => 1718

sh4-gcc11/sh-allmodconfig (ICE = internal compiler error)

> [1] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/1b929c02afd37871d5afb9d498426f83432e71c2/ (all 152 configs)
> [2] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/830b3c68c1fb1e9176028d02ef86f3cf76aa2476/ (all 152 configs)

Gr{oetje,eeting}s,

 						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
 							    -- Linus Torvalds
--8323329-1893319093-1672130116=:311423--
