Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4C68C9AD9
	for <lists+amd-gfx@lfdr.de>; Mon, 20 May 2024 11:59:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A8A110E32F;
	Mon, 20 May 2024 09:59:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=yandex.ru header.i=@yandex.ru header.b="cYF+YYNG";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 470 seconds by postgrey-1.36 at gabe;
 Sun, 19 May 2024 13:00:27 UTC
Received: from forward502a.mail.yandex.net (forward502a.mail.yandex.net
 [178.154.239.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FC8B10E1FD
 for <amd-gfx@lists.freedesktop.org>; Sun, 19 May 2024 13:00:26 +0000 (UTC)
Received: from mail-nwsmtp-mxback-production-main-72.vla.yp-c.yandex.net
 (mail-nwsmtp-mxback-production-main-72.vla.yp-c.yandex.net
 [IPv6:2a02:6b8:c18:486:0:640:200c:0])
 by forward502a.mail.yandex.net (Yandex) with ESMTPS id 3BA6A60C51;
 Sun, 19 May 2024 15:52:34 +0300 (MSK)
Received: from mail.yandex.ru (2a02:6b8:c0d:91:0:640:566d:0
 [2a02:6b8:c0d:91:0:640:566d:0])
 by mail-nwsmtp-mxback-production-main-72.vla.yp-c.yandex.net (mxback/Yandex)
 with HTTP id UqG2EH5O0Ko0-C4be1G2S; Sun, 19 May 2024 15:52:33 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
 t=1716123153; bh=5L8fi5JUq0n0of2poPTByRTgAzI9PuoUJYWi/l8DFhs=;
 h=References:Date:Message-Id:Cc:Subject:To:From:In-Reply-To;
 b=cYF+YYNGOULFdIgWxYVZmHIEnZjVnY4q9CNKtlIgERfwXQkLzSy317lVHCY9j2rgy
 NKfhM2w0u38lfmvxZ+T6amcillMHa4FAZ/aFaXezVKZz2ebk7XwFCy9UuKRZHMUvUi
 xHOt+cJov/w0/f8X+JJZiuzs023XhNyR7QZ8V+4c=
Authentication-Results: mail-nwsmtp-mxback-production-main-72.vla.yp-c.yandex.net;
 dkim=pass header.i=@yandex.ru
Received: by 6dmalpruuq6nvlco.vla.yp-c.yandex.net with HTTP;
 Sun, 19 May 2024 15:52:33 +0300
From: Tranton Baddy <t.baddy@yandex.ru>
Envelope-From: t-baddy@yandex.ru
To: Alex Deucher <alexdeucher@gmail.com>
Cc: amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Borislav Petkov <bp@alien8.de>
In-Reply-To: <CADnq5_NNATnV+mTEn6Mshro3gqpH5ffjQ=EWdH8QVZgEBYB-ew@mail.gmail.com>
References: <1237381714935562@dmcmxrwo3x2o7y3i.sas.yp-c.yandex.net>
 <20240505224508.GAZjgL9PO9Y5QaAO2t@fat_crate.local>
 <CADnq5_NNATnV+mTEn6Mshro3gqpH5ffjQ=EWdH8QVZgEBYB-ew@mail.gmail.com>
Subject: Re: Error in amd driver?
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Sun, 19 May 2024 15:52:33 +0300
Message-Id: <62301716123153@6dmalpruuq6nvlco.vla.yp-c.yandex.net>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8
X-Mailman-Approved-At: Mon, 20 May 2024 09:59:27 +0000
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

Yes, problem is no more.
Thanks.

> On Mon, May 6, 2024 at 6:00 AM Borislav Petkov <bp@alien8.de> wrote:
> 
>> + amd-gfx@lists.freedesktop.org
>>
>> On Sun, May 05, 2024 at 09:59:22PM +0300, Tranton Baddy wrote:
>>> I have this in my dmesg since version 6.8.6, not sure when it appeared. Is amdgpu driver has bug?
> 
> Should be fixed in:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d3a9331a6591e9df64791e076f6591f440af51c3
> 
> Alex
> 
>>> [ 64.253144] ==================================================================
>>> [ 64.253162] BUG: KFENCE: use-after-free read in amdgpu_bo_move+0x51f/0x7a0
>>>
>>> [ 64.253183] Use-after-free read at 0x00000000671c48dd (in kfence-#111):
>>> [ 64.253192] amdgpu_bo_move+0x51f/0x7a0
>>> [ 64.253202] ttm_bo_handle_move_mem+0xcf/0x180
>>> [ 64.253211] ttm_mem_evict_first+0x1c5/0x500
>>> [ 64.253218] ttm_resource_manager_evict_all+0xa3/0x1e0
>>> [ 64.253228] amdgpu_device_prepare+0x66/0x110
>>> [ 64.253237] amdgpu_pmops_runtime_suspend+0xbe/0x1c0
>>> [ 64.253248] pci_pm_runtime_suspend+0x74/0x200
>>> [ 64.253259] vga_switcheroo_runtime_suspend+0x21/0xb0
>>> [ 64.253268] __rpm_callback+0x5f/0x190
>>> [ 64.253277] rpm_callback+0x7f/0x90
>>> [ 64.253283] rpm_suspend+0x120/0x6a0
>>> [ 64.253290] pm_runtime_work+0x9c/0xa0
>>> [ 64.253297] process_one_work+0x164/0x330
>>> [ 64.253310] worker_thread+0x302/0x430
>>> [ 64.253320] kthread+0xe4/0x110
>>> [ 64.253329] ret_from_fork+0x4c/0x60
>>> [ 64.253341] ret_from_fork_asm+0x1b/0x30
>>>
>>> [ 64.253353] kfence-#111: 0x00000000d018cf03-0x0000000034e821d1, size=96, cache=kmalloc-96
>>>
>>> [ 64.253363] allocated by task 152 on cpu 3 at 64.248952s:
>>> [ 64.253418] kmalloc_trace+0x283/0x340
>>> [ 64.253427] amdgpu_vram_mgr_new+0x8f/0x3f0
>>> [ 64.253435] ttm_resource_alloc+0x39/0x90
>>> [ 64.253444] ttm_bo_mem_space+0xa4/0x260
>>> [ 64.253450] ttm_mem_evict_first+0x18a/0x500
>>> [ 64.253456] ttm_resource_manager_evict_all+0xa3/0x1e0
>>> [ 64.253465] amdgpu_device_prepare+0x66/0x110
>>> [ 64.253472] amdgpu_pmops_runtime_suspend+0xbe/0x1c0
>>> [ 64.253481] pci_pm_runtime_suspend+0x74/0x200
>>> [ 64.253489] vga_switcheroo_runtime_suspend+0x21/0xb0
>>> [ 64.253496] __rpm_callback+0x5f/0x190
>>> [ 64.253503] rpm_callback+0x7f/0x90
>>> [ 64.253509] rpm_suspend+0x120/0x6a0
>>> [ 64.253516] pm_runtime_work+0x9c/0xa0
>>> [ 64.253523] process_one_work+0x164/0x330
>>> [ 64.253532] worker_thread+0x302/0x430
>>> [ 64.253542] kthread+0xe4/0x110
>>> [ 64.253550] ret_from_fork+0x4c/0x60
>>> [ 64.253559] ret_from_fork_asm+0x1b/0x30
>>>
>>> [ 64.253570] freed by task 152 on cpu 3 at 64.253117s:
>>> [ 64.253582] ttm_resource_free+0x67/0x90
>>> [ 64.253591] ttm_bo_move_accel_cleanup+0x247/0x2e0
>>> [ 64.253598] amdgpu_bo_move+0x1bd/0x7a0
>>> [ 64.253605] ttm_bo_handle_move_mem+0xcf/0x180
>>> [ 64.253612] ttm_mem_evict_first+0x1c5/0x500
>>> [ 64.253618] ttm_resource_manager_evict_all+0xa3/0x1e0
>>> [ 64.253626] amdgpu_device_prepare+0x66/0x110
>>> [ 64.253634] amdgpu_pmops_runtime_suspend+0xbe/0x1c0
>>> [ 64.253642] pci_pm_runtime_suspend+0x74/0x200
>>> [ 64.253650] vga_switcheroo_runtime_suspend+0x21/0xb0
>>> [ 64.253658] __rpm_callback+0x5f/0x190
>>> [ 64.253664] rpm_callback+0x7f/0x90
>>> [ 64.253671] rpm_suspend+0x120/0x6a0
>>> [ 64.253677] pm_runtime_work+0x9c/0xa0
>>> [ 64.253684] process_one_work+0x164/0x330
>>> [ 64.253693] worker_thread+0x302/0x430
>>> [ 64.253703] kthread+0xe4/0x110
>>> [ 64.253711] ret_from_fork+0x4c/0x60
>>> [ 64.253723] ret_from_fork_asm+0x1b/0x30
>>>
>>> [ 64.253735] CPU: 3 PID: 152 Comm: kworker/3:2 Tainted: P OE 6.8.9 #3 e7323d0d25f89e853881fc823e59523bdcc577c6
>>> [ 64.253756] Hardware name: Hewlett-Packard HP Pavilion Notebook /80B9, BIOS F.54 05/27/2019
>>> [ 64.253761] Workqueue: pm pm_runtime_work
>>> [ 64.253771] ==================================================================
>>>
>>
>> --
>> Regards/Gruss,
>> Boris.
>>
>> https://people.kernel.org/tglx/notes-about-netiquette
