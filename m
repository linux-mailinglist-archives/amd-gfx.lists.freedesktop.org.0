Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA2C675FBE
	for <lists+amd-gfx@lfdr.de>; Fri, 20 Jan 2023 22:50:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B381610EAC2;
	Fri, 20 Jan 2023 21:50:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de
 [130.133.4.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31DA110E39D
 for <amd-gfx@lists.freedesktop.org>; Fri, 20 Jan 2023 19:29:46 +0000 (UTC)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
 by outpost.zedat.fu-berlin.de (Exim 4.95) with esmtps (TLS1.3)
 tls TLS_AES_256_GCM_SHA384
 (envelope-from <mkarcher@zedat.fu-berlin.de>)
 id 1pIx54-002uuw-Fd; Fri, 20 Jan 2023 20:29:42 +0100
Received: from pd9f631ca.dip0.t-ipconnect.de ([217.246.49.202]
 helo=[192.168.144.87]) by inpost2.zedat.fu-berlin.de (Exim 4.95)
 with esmtpsa (TLS1.3) tls TLS_AES_128_GCM_SHA256
 (envelope-from <kernel@mkarcher.dialup.fu-berlin.de>)
 id 1pIx54-002Kos-8o; Fri, 20 Jan 2023 20:29:42 +0100
Content-Type: multipart/mixed; boundary="------------noR0LwKfcoz0L7zbRzJSPHS4"
Message-ID: <def16c9b-7bb1-a454-0896-b063a9e85964@fu-berlin.de>
Date: Fri, 20 Jan 2023 20:29:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: Calculating array sizes in C - was: Re: Build
 regressions/improvements in v6.2-rc1
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
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
From: Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>
In-Reply-To: <c1d233b9-bc85-dce9-ffa0-eb3170602c6c@physik.fu-berlin.de>
X-Original-Sender: kernel@mkarcher.dialup.fu-berlin.de
X-Originating-IP: 217.246.49.202
X-ZEDAT-Hint: A
X-Mailman-Approved-At: Fri, 20 Jan 2023 21:50:24 +0000
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

This is a multi-part message in MIME format.
--------------noR0LwKfcoz0L7zbRzJSPHS4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello Adrian,
> Could you post a kernel patch for that? I would be happy to test it on my
> SH-7785CLR board. Also, I'm going to file a bug report against GCC.

I filed the bug already. It's 
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=108483.

The diff is attached. It's published as CC0 in case anyone considers 
this trivial change copyrightable. This patch prevents this one specific 
warning from being upgraded to "error" even if you configure the kernel 
to use "-Werror". It still keeps it active as warning, though.

Kind regards,
   Michael Karcher

--------------noR0LwKfcoz0L7zbRzJSPHS4
Content-Type: text/plain; charset=UTF-8; name="werror.diff"
Content-Disposition: attachment; filename="werror.diff"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL01ha2VmaWxlIGIvTWFrZWZpbGUKaW5kZXggZTA5ZmUxMDBlZmIyLi5i
NGNkMDc1YzZhMTkgMTAwNjQ0Ci0tLSBhL01ha2VmaWxlCisrKyBiL01ha2VmaWxlCkBAIC04
NzAsNyArODcwLDcgQEAgc3RhY2twLWZsYWdzLSQoQ09ORklHX1NUQUNLUFJPVEVDVE9SX1NU
Uk9ORykgICAgICA6PSAtZnN0YWNrLXByb3RlY3Rvci1zdHJvbmcKIAogS0JVSUxEX0NGTEFH
UyArPSAkKHN0YWNrcC1mbGFncy15KQogCi1LQlVJTERfQ1BQRkxBR1MtJChDT05GSUdfV0VS
Uk9SKSArPSAtV2Vycm9yCitLQlVJTERfQ1BQRkxBR1MtJChDT05GSUdfV0VSUk9SKSArPSAt
V2Vycm9yIC1Xbm8tZXJyb3I9c2l6ZW9mLXBvaW50ZXItZGl2CiBLQlVJTERfQ1BQRkxBR1Mg
Kz0gJChLQlVJTERfQ1BQRkxBR1MteSkKIEtCVUlMRF9DRkxBR1MtJChDT05GSUdfQ0NfTk9f
QVJSQVlfQk9VTkRTKSArPSAtV25vLWFycmF5LWJvdW5kcwogCg==

--------------noR0LwKfcoz0L7zbRzJSPHS4--
