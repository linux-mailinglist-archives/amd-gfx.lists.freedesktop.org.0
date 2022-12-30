Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE067654363
	for <lists+amd-gfx@lfdr.de>; Thu, 22 Dec 2022 15:52:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44B0110E51B;
	Thu, 22 Dec 2022 14:51:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 1161 seconds by postgrey-1.36 at gabe;
 Thu, 22 Dec 2022 12:50:36 UTC
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B797810E11C
 for <amd-gfx@lists.freedesktop.org>; Thu, 22 Dec 2022 12:50:36 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1p8KjA-0002nv-4B; Thu, 22 Dec 2022 13:31:12 +0100
Message-ID: <28c5c38b-de13-b2b5-0ffa-8a08d96391df@leemhuis.info>
Date: Thu, 22 Dec 2022 13:31:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [6.2][regression] looks like commit
 aab9cf7b6954136f4339136a1a7fc0602a2c4d8b leads to use-after-free and random
 computer hangs
Content-Language: en-US, de-DE
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <Christian.Koenig@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, luben.tuikov@amd.com,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <CABXGCsNryN9Koz48DiSTPwTBSOKo0U0B3PnW3+gEf2B8n8u0GA@mail.gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <CABXGCsNryN9Koz48DiSTPwTBSOKo0U0B3PnW3+gEf2B8n8u0GA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1671713436;
 0b60710d; 
X-HE-SMSGID: 1p8KjA-0002nv-4B
X-Mailman-Approved-At: Thu, 22 Dec 2022 14:51:39 +0000
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Hi, this is your Linux kernel regression tracker.

On 18.12.22 14:28, Mikhail Gavrilov wrote:
>
> The kernel 6.2 preparation cycle has begun.
> And after the kernel was updated on my Fedora Rawhide I started
> receiving use-after-free errors with complete computer hangs.
> At least a good reproducer of this behaviour is launch of the game
> "Marvel's Avengers".
> 
> The backtrace of the issue looks like:
> [...]

Thx for your report. I'm not one of the developers for this area of the
kernel, but to my untrained eyes it looks like this patch might fix your
problem:

https://lore.kernel.org/all/20221219104718.21677-1-christian.koenig@amd.com/

Anyway, to be sure the issue doesn't fall through the cracks unnoticed,
I'm adding it to regzbot, my Linux kernel regression tracking bot:

#regzbot ^introduced aab9cf7b695413
#regzbot title drm: amdgpu: use-after-free and random computer hangs
#regzbot monitor:
https://lore.kernel.org/all/20221219104718.21677-1-christian.koenig@amd.com/
#regzbot fix: drm/amdgpu: grab extra fence reference for
drm_sched_job_add_dependency
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.
