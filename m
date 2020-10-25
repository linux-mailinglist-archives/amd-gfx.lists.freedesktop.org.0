Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5144129850E
	for <lists+amd-gfx@lfdr.de>; Mon, 26 Oct 2020 00:48:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2FAA6E0C8;
	Sun, 25 Oct 2020 23:48:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 213C26E0C8;
 Sun, 25 Oct 2020 23:48:24 +0000 (UTC)
Received: from localhost (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8B6BD21D41;
 Sun, 25 Oct 2020 23:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603669703;
 bh=IlA8aq40niqkt+JTVvUxPEIa3URGVBJOaB6rWiw688I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=leJLUqBFjDZGMz5TsZqqyNr6HAQ5TuU9rp0htZGyAHZyTNSVX22GsWk9nFBMVpN+U
 1g/05GUBRggJJ/gjVhTJGfEfnD9OOApmnF5yRVmHgcgDjAMy0Uean20+41q9IPMJAh
 E80HrSqVlirUvSn3GXpgRXnXErHNXTyV0Sejeg+w=
Date: Sun, 25 Oct 2020 19:48:22 -0400
From: Sasha Levin <sashal@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH AUTOSEL 5.9 090/111] drm/amd/display: Fix a list corruption
Message-ID: <20201025234822.GG4060117@sasha-vm>
References: <20201018191807.4052726-1-sashal@kernel.org>
 <20201018191807.4052726-90-sashal@kernel.org>
 <CADnq5_PeOWc_=w4aChDX=SyYH+kFggn2wrJZOzxbnGOTobZ3EQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADnq5_PeOWc_=w4aChDX=SyYH+kFggn2wrJZOzxbnGOTobZ3EQ@mail.gmail.com>
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
Cc: xinhui pan <xinhui.pan@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Feifei Xu <FeifeiXu@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 "for 3.8" <stable@vger.kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Mon, Oct 19, 2020 at 08:40:36AM -0400, Alex Deucher wrote:
>On Sun, Oct 18, 2020 at 3:19 PM Sasha Levin <sashal@kernel.org> wrote:
>>
>> From: xinhui pan <xinhui.pan@amd.com>
>>
>> [ Upstream commit 1545fbf97eafc1dbdc2923e58b4186b16a834784 ]
>>
>> Remove the private obj from the internal list before we free aconnector.
>>
>> [   56.925828] BUG: unable to handle page fault for address: ffff8f84a870a560
>> [   56.933272] #PF: supervisor read access in kernel mode
>> [   56.938801] #PF: error_code(0x0000) - not-present page
>> [   56.944376] PGD 18e605067 P4D 18e605067 PUD 86a614067 PMD 86a4d0067 PTE 800ffff8578f5060
>> [   56.953260] Oops: 0000 [#1] SMP DEBUG_PAGEALLOC NOPTI
>> [   56.958815] CPU: 6 PID: 1407 Comm: bash Tainted: G           O      5.9.0-rc2+ #46
>> [   56.967092] Hardware name: System manufacturer System Product Name/PRIME Z390-A, BIOS 1401 11/26/2019
>> [   56.977162] RIP: 0010:__list_del_entry_valid+0x31/0xa0
>> [   56.982768] Code: 00 ad de 55 48 8b 17 4c 8b 47 08 48 89 e5 48 39 c2 74 27 48 b8 22 01 00 00 00 00 ad de 49 39 c0 74 2d 49 8b 30 48 39 fe 75 3d <48> 8b 52 08 48 39 f2 75 4c b8 01 00 00 00 5d c3 48 89 7
>> [   57.003327] RSP: 0018:ffffb40c81687c90 EFLAGS: 00010246
>> [   57.009048] RAX: dead000000000122 RBX: ffff8f84ea41f4f0 RCX: 0000000000000006
>> [   57.016871] RDX: ffff8f84a870a558 RSI: ffff8f84ea41f4f0 RDI: ffff8f84ea41f4f0
>> [   57.024672] RBP: ffffb40c81687c90 R08: ffff8f84ea400998 R09: 0000000000000001
>> [   57.032490] R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000006
>> [   57.040287] R13: ffff8f84ea422a90 R14: ffff8f84b4129a20 R15: fffffffffffffff2
>> [   57.048105] FS:  00007f550d885740(0000) GS:ffff8f8509600000(0000) knlGS:0000000000000000
>> [   57.056979] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> [   57.063260] CR2: ffff8f84a870a560 CR3: 00000007e5144001 CR4: 00000000003706e0
>> [   57.071053] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
>> [   57.078849] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
>> [   57.086684] Call Trace:
>> [   57.089381]  drm_atomic_private_obj_fini+0x29/0x82 [drm]
>> [   57.095247]  amdgpu_dm_fini+0x83/0x170 [amdgpu]
>> [   57.100264]  dm_hw_fini+0x23/0x30 [amdgpu]
>> [   57.104814]  amdgpu_device_fini+0x1df/0x4fe [amdgpu]
>> [   57.110271]  amdgpu_driver_unload_kms+0x43/0x70 [amdgpu]
>> [   57.116136]  amdgpu_pci_remove+0x3b/0x60 [amdgpu]
>> [   57.121291]  pci_device_remove+0x3e/0xb0
>> [   57.125583]  device_release_driver_internal+0xff/0x1d0
>> [   57.131223]  device_release_driver+0x12/0x20
>> [   57.135903]  pci_stop_bus_device+0x70/0xa0
>> [   57.140401]  pci_stop_and_remove_bus_device_locked+0x1b/0x30
>> [   57.146571]  remove_store+0x7b/0x90
>> [   57.150429]  dev_attr_store+0x17/0x30
>> [   57.154441]  sysfs_kf_write+0x4b/0x60
>> [   57.158479]  kernfs_fop_write+0xe8/0x1d0
>> [   57.162788]  vfs_write+0xf5/0x230
>> [   57.166426]  ksys_write+0x70/0xf0
>> [   57.170087]  __x64_sys_write+0x1a/0x20
>> [   57.174219]  do_syscall_64+0x38/0x90
>> [   57.178145]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
>>
>> Signed-off-by: xinhui pan <xinhui.pan@amd.com>
>> Acked-by: Feifei Xu <Feifei Xu@amd.com>
>> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>
>This ended up getting reverted.  Please drop this one.

Dropped, thanks!

-- 
Thanks,
Sasha
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
