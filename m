Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDC2674F44
	for <lists+amd-gfx@lfdr.de>; Fri, 20 Jan 2023 09:18:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AB3C10E100;
	Fri, 20 Jan 2023 08:18:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 468 seconds by postgrey-1.36 at gabe;
 Thu, 19 Jan 2023 22:19:12 UTC
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de
 [130.133.4.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 287A110E270
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Jan 2023 22:19:12 +0000 (UTC)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
 by outpost.zedat.fu-berlin.de (Exim 4.95) with esmtps (TLS1.3)
 tls TLS_AES_256_GCM_SHA384
 (envelope-from <mkarcher@zedat.fu-berlin.de>)
 id 1pId7s-000ES9-TO; Thu, 19 Jan 2023 23:11:16 +0100
Received: from pd9f631ca.dip0.t-ipconnect.de ([217.246.49.202]
 helo=[192.168.144.87]) by inpost2.zedat.fu-berlin.de (Exim 4.95)
 with esmtpsa (TLS1.3) tls TLS_AES_128_GCM_SHA256
 (envelope-from <Michael.Karcher@fu-berlin.de>)
 id 1pId7s-002cf1-Mu; Thu, 19 Jan 2023 23:11:16 +0100
Message-ID: <1732342f-49fe-c20e-b877-bc0a340e1a50@fu-berlin.de>
Date: Thu, 19 Jan 2023 23:11:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
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
From: "Michael.Karcher" <Michael.Karcher@fu-berlin.de>
Subject: Re: Calculating array sizes in C - was: Re: Build
 regressions/improvements in v6.2-rc1
In-Reply-To: <0d238f02-4d78-6f14-1b1b-f53f0317a910@physik.fu-berlin.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Original-Sender: Michael.Karcher@fu-berlin.de
X-Originating-IP: 217.246.49.202
X-Mailman-Approved-At: Fri, 20 Jan 2023 08:18:46 +0000
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
 Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>,
 linux-f2fs-devel@lists.sourceforge.net, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Isn't this supposed to be caught by this check:
>>>
>>>          a, __same_type(a, NULL)
>>>
>>> ?
>>
>> Yeah, but gcc thinks it is smarter than us...
>> Probably it drops the test, assuming UB cannot happen.
> Hmm, sounds like a GGC bug to me then. Not sure how to fix this then.


I don't see a clear bug at this point. We are talking about the C expression

   __same_type((void*)0, (void*)0)? 0 : sizeof((void*)0)/sizeof(*((void*0))

This expression is valid (assuming __same_type works, which is a GCC 
extension), and should return 0. As of now, I have no indication that 
this expression does not return 0. Also, it is true that this expression 
contains the suspicious pattern "sizeof(void*)/sizeof(void)", which is 
does not calculate the size of any array. GCC is free to emit as much 
warnings is it wants for any kind of expressions. From a C standard 
point of view, it's just a "quality of implementation" issue, and an 
implementation that emits useless warnings is of low quality, but not 
non-conforming.

In this case, we requested that gcc refuses to compile if it emits any 
kind of warning, which instructs gcc to reject programs that would be 
valid according to the C standard, but are deemed to be "likely incorrect".

I suggest to file a bug against gcc complaining about a "spurious 
warning", and using "-Werror -Wno-error-sizeof-pointer-div" until gcc is 
adapted to not emit the warning about the pointer division if the result 
is not used.


Regards,
   Michael Karcher

