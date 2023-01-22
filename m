Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E116772AE
	for <lists+amd-gfx@lfdr.de>; Sun, 22 Jan 2023 22:33:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F04F410E2F5;
	Sun, 22 Jan 2023 21:33:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de
 [130.133.4.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EE5A10E04D
 for <amd-gfx@lists.freedesktop.org>; Sat, 21 Jan 2023 21:26:51 +0000 (UTC)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
 by outpost.zedat.fu-berlin.de (Exim 4.95) with esmtps (TLS1.3)
 tls TLS_AES_256_GCM_SHA384
 (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1pJLNr-001fc4-Li; Sat, 21 Jan 2023 22:26:43 +0100
Received: from dynamic-089-012-154-190.89.12.pool.telefonica.de
 ([89.12.154.190] helo=[192.168.1.11])
 by inpost2.zedat.fu-berlin.de (Exim 4.95) with esmtpsa (TLS1.3)
 tls TLS_AES_128_GCM_SHA256
 (envelope-from <glaubitz@physik.fu-berlin.de>)
 id 1pJLNr-001xPR-F4; Sat, 21 Jan 2023 22:26:43 +0100
Message-ID: <7c6b114a-38f8-1a0b-8623-d492f9cc2fb9@physik.fu-berlin.de>
Date: Sat, 21 Jan 2023 22:26:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: Calculating array sizes in C - was: Re: Build
 regressions/improvements in v6.2-rc1
Content-Language: en-US
To: Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>,
 Geert Uytterhoeven <geert@linux-m68k.org>
References: <CAHk-=wgf929uGOVpiWALPyC7pv_9KbwB2EAvQ3C4woshZZ5zqQ@mail.gmail.com>
 <20221227082932.798359-1-geert@linux-m68k.org>
 <alpine.DEB.2.22.394.2212270933530.311423@ramsan.of.borg>
 <c05bee5d-0d69-289b-fe4b-98f4cd31a4f5@physik.fu-berlin.de>
 <CAMuHMdXNJveXHeS=g-aHbnxtyACxq1wCeaTg8LbpYqJTCqk86g@mail.gmail.com>
 <3800eaa8-a4da-b2f0-da31-6627176cb92e@physik.fu-berlin.de>
 <CAMuHMdWbBRkhecrqcir92TgZnffMe8ku2t7PcVLqA6e6F-j=iw@mail.gmail.com>
 <429140e0-72fe-c91c-53bc-124d33ab5ffa@physik.fu-berlin.de>
 <CAMuHMdWpHSsAB3WosyCVgS6+t4pU35Xfj3tjmdCDoyS2QkS7iw@mail.gmail.com>
 <0d238f02-4d78-6f14-1b1b-f53f0317a910@physik.fu-berlin.de>
 <1732342f-49fe-c20e-b877-bc0a340e1a50@fu-berlin.de>
 <c1d233b9-bc85-dce9-ffa0-eb3170602c6c@physik.fu-berlin.de>
 <def16c9b-7bb1-a454-0896-b063a9e85964@fu-berlin.de>
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
In-Reply-To: <def16c9b-7bb1-a454-0896-b063a9e85964@fu-berlin.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 89.12.154.190
X-Mailman-Approved-At: Sun, 22 Jan 2023 21:32:59 +0000
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
Cc: linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>,
 linux-sh@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-mips@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
 linux-f2fs-devel@lists.sourceforge.net, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Hi!

On 1/20/23 20:29, Michael Karcher wrote:
> Hello Adrian,
>> Could you post a kernel patch for that? I would be happy to test it on my
>> SH-7785CLR board. Also, I'm going to file a bug report against GCC.
> 
> I filed the bug already. It's https://gcc.gnu.org/bugzilla/show_bug.cgi?id=108483.
> 
> The diff is attached. It's published as CC0 in case anyone considers this trivial change copyrightable. This patch prevents this one specific warning from being upgraded to "error" even if you configure the kernel to use "-Werror". It still keeps it active as warning, though.

I used the following variant and it fixes the issue for me:

diff --git a/arch/sh/Makefile b/arch/sh/Makefile
index 5c8776482530..11b22f7167d2 100644
--- a/arch/sh/Makefile
+++ b/arch/sh/Makefile
@@ -167,7 +167,7 @@ drivers-y                   += arch/sh/drivers/
  cflags-y       += $(foreach d, $(cpuincdir-y), -I $(srctree)/arch/sh/include/$(d)) \
                    $(foreach d, $(machdir-y), -I $(srctree)/arch/sh/include/$(d))
  
-KBUILD_CFLAGS          += -pipe $(cflags-y)
+KBUILD_CFLAGS          += -pipe -Wno-error=sizeof-pointer-div $(cflags-y)
  KBUILD_CPPFLAGS                += $(cflags-y)
  KBUILD_AFLAGS          += $(cflags-y)

If you agree, can you post a patch to LKML so we can unbreak the SH build for CONFIG_WERROR?

Thanks,
Adrian

-- 
  .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
   `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

