Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6592C5740FC
	for <lists+amd-gfx@lfdr.de>; Thu, 14 Jul 2022 03:39:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3A0912B50F;
	Thu, 14 Jul 2022 01:39:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 849479DAC4
 for <amd-gfx@lists.freedesktop.org>; Thu, 14 Jul 2022 01:30:14 +0000 (UTC)
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4LjxfC2SPvzVft0;
 Thu, 14 Jul 2022 09:26:27 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 14 Jul 2022 09:30:06 +0800
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 14 Jul 2022 09:30:05 +0800
Message-ID: <d5b32c3f-b0dd-a816-5ddf-ecf4032aa571@huawei.com>
Date: Thu, 14 Jul 2022 09:30:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: Linux 5.19-rc6
Content-Language: en-US
To: "Russell King (Oracle)" <linux@armlinux.org.uk>, Linus Torvalds
 <torvalds@linux-foundation.org>
References: <CAHk-=wgTmGaToVFdSdoFqT2sNkk7jg2rSWasUYv-tASUZ2j_0Q@mail.gmail.com>
 <20220713050724.GA2471738@roeck-us.net>
 <CAHk-=widUqghhXus_GCM9+FESa5vHqMb_pO3=0dGYH8C+yix2w@mail.gmail.com>
 <Ys8hqoiN5iWbslsM@shell.armlinux.org.uk>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <Ys8hqoiN5iWbslsM@shell.armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 14 Jul 2022 01:39:47 +0000
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
Cc: Leo Li <sunpeng.li@amd.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Balbir Singh <bsingharora@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Paul Mackerras <paulus@ozlabs.org>, Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Guenter Roeck <linux@roeck-us.net>,
 Daniel Axtens <dja@axtens.net>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>


On 2022/7/14 3:48, Russell King (Oracle) wrote:
> On Wed, Jul 13, 2022 at 12:36:50PM -0700, Linus Torvalds wrote:
>> On Tue, Jul 12, 2022 at 10:07 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>> OF: amba_device_add() failed (-19) for /amba/smc@10100000
>>> ------------[ cut here ]------------
>>> WARNING: CPU: 0 PID: 1 at lib/refcount.c:28 of_platform_bus_create+0x33c/0x3dc
>>> refcount_t: underflow; use-after-free.
Sorry to lead to this issue,
>> This too has been going on since -rc1, but it's not obvious what caused it.
>>
>> At a guess, looking around the amba changes, I'm assuming it's
>>
>>    7719a68b2fa4 ("ARM: 9192/1: amba: fix memory leak in amba_device_try_add()")
>>
>> Does reverting that commit make it go away?
> There may be a patch that solves that, but it's never been submitted to
> my patch system:
>
> https://lore.kernel.org/all/20220524025139.40212-1-wangkefeng.wang@huawei.com/
This patch is to fix the above issue reported-by Guenter, and it merged 
into linux-next
for a while, which Applied in 
https://www.armlinux.org.uk/developer/patches/viewpatch.php?id=9207/1
>
> I'm sorry, but I'm utterly crap at picking up patches off mailing lists,
> so if stuff doesn't end up inthe patch system, it gets missed.
Is there some special for bugfix patch when send to arm patch system, please
let me know if I missed.
