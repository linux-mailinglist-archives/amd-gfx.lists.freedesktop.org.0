Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7C84BD791
	for <lists+amd-gfx@lfdr.de>; Mon, 21 Feb 2022 09:30:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10BDA11240B;
	Mon, 21 Feb 2022 08:30:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [IPv6:2a01:488:42:1000:50ed:8234::])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2698B10E1DB
 for <amd-gfx@lists.freedesktop.org>; Sun, 20 Feb 2022 17:33:55 +0000 (UTC)
Received: from ip4d144895.dynamic.kabel-deutschland.de ([77.20.72.149]
 helo=[192.168.66.200]); authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1nLq5p-0007yD-E6; Sun, 20 Feb 2022 18:33:53 +0100
Message-ID: <978944b7-4e71-475a-2fe6-c414d3e8f64e@leemhuis.info>
Date: Sun, 20 Feb 2022 18:33:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-BS
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>
Subject: Bug 215600 - Radeon - *ERROR* Failed waiting for UVD message
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1645378436;
 67278621; 
X-HE-SMSGID: 1nLq5p-0007yD-E6
X-Mailman-Approved-At: Mon, 21 Feb 2022 08:30:47 +0000
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
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Hi, this is your Linux kernel regression tracker.

I noticed a regression report in bugzilla.kernel.org that afaics nobody
acted upon since it was reported about a week ago, that's why I decided
to forward it to the lists and all the relevant people. To quote
https://bugzilla.kernel.org/show_bug.cgi?id=215600 :

>  Richard Herbert 2022-02-12 22:13:07 UTC
> 
> Created attachment 300445 [details]
> Details
> 
> When attempting to play some types of videos with VLC 3.0.16 (eg. *.flv, *.mp4), when running kernels 5.17-rc1 to 5.17-rc3, only the audio portion is heard and the VLC video screen remains black. Meanwhile, many of these entries are written per second to /var/log/syslog:
> 
> 2/12/22 3:41 PM	starbug	kernel	[drm:radeon_uvd_cs_parse [radeon]] *ERROR* Failed waiting for UVD message (-1)!
> 2/12/22 3:41 PM	starbug	kernel	[drm:radeon_cs_ioctl [radeon]] *ERROR* Invalid command stream !
> 2/12/22 3:41 PM	starbug	kernel	[drm:radeon_uvd_cs_parse [radeon]] *ERROR* Failed waiting for UVD message (-1)!
> 2/12/22 3:41 PM	starbug	kernel	[drm:radeon_cs_ioctl [radeon]] *ERROR* Invalid command stream !
> 2/12/22 3:41 PM	starbug	kernel	[drm:radeon_uvd_cs_parse [radeon]] *ERROR* Failed waiting for UVD message (-1)!
> 2/12/22 3:41 PM	starbug	kernel	[drm:radeon_cs_ioctl [radeon]] *ERROR* Invalid command stream !
> 
> 
> The problem doesn't occur in kernels of the 5.16 series.  It may have been introduced here:
> 
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/diff/drivers/gpu/drm/radeon/radeon_uvd.c?id=v5.16&id2=v5.17-rc1
> 
> 
> Thanks!

Could somebody take a look into this? Or was this discussed somewhere
else already? Or even fixed?

Anyway, to get this tracked:

#regzbot introduced: v5.16..v5.17-rc1
#regzbot from:  Richard Herbert <rherbert@sympatico.ca>
#regzbot title: drm: radeon: no sound on video, *ERROR* Failed waiting
for UVD message
#regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=215600

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I'm getting a lot of
reports on my table. I can only look briefly into most of them and lack
knowledge about most of the areas they concern. I thus unfortunately
will sometimes get things wrong or miss something important. I hope
that's not the case here; if you think it is, don't hesitate to tell me
in a public reply, it's in everyone's interest to set the public record
straight.

-- 
Additional information about regzbot:

If you want to know more about regzbot, check out its web-interface, the
getting start guide, and the references documentation:

https://linux-regtracking.leemhuis.info/regzbot/
https://gitlab.com/knurd42/regzbot/-/blob/main/docs/getting_started.md
https://gitlab.com/knurd42/regzbot/-/blob/main/docs/reference.md

The last two documents will explain how you can interact with regzbot
yourself if your want to.

Hint for reporters: when reporting a regression it's in your interest to
CC the regression list and tell regzbot about the issue, as that ensures
the regression makes it onto the radar of the Linux kernel's regression
tracker -- that's in your interest, as it ensures your report won't fall
through the cracks unnoticed.

Hint for developers: you normally don't need to care about regzbot once
it's involved. Fix the issue as you normally would, just remember to
include 'Link:' tag in the patch descriptions pointing to all reports
about the issue. This has been expected from developers even before
regzbot showed up for reasons explained in
'Documentation/process/submitting-patches.rst' and
'Documentation/process/5.Posting.rst'.
