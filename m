Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA389B199D
	for <lists+amd-gfx@lfdr.de>; Sat, 26 Oct 2024 17:51:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AB4310E0AE;
	Sat, 26 Oct 2024 15:51:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="jbIYh9rs";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5791910EAFF
 for <amd-gfx@lists.freedesktop.org>; Fri, 25 Oct 2024 14:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+DycNMg+QnHPjRtLEoHAz9VQrFSxIWsCkAN1HMXt5II=; b=jbIYh9rsT1OBxKsFY3a2y57/Pm
 htSxA2DjgljyA3QzRvT/NreANC+q7bg3lLQuUv2SHLoSVctvvWqId2aKsDaOABf0H1QvpWQSiLbm/
 4us7LNR1CUKqBt3ToxdEvWNXDAiftsRZwiOYZMWblFLWLWGVB8WtBdPNAm1fAnZG93Oyrsw7GEg2w
 0W8Dh0J/dvEZty20r3x/pLc45kF5o8ofXlze1k39IGZOAQ1pd49B31HaLkxvb44gCmuWRhkaohArm
 2n9g1fDfH/juWXNheGhgsfIFW7PyhDvbvl0AL6HUrnHAJkPtWfgbzTwC6+RXwrL03VHfxUugzWUH1
 4IB8XCUw==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1t4LTt-00F413-RQ; Fri, 25 Oct 2024 16:40:01 +0200
Message-ID: <7bb9d58b-0718-41ec-8043-95cb7be9ac43@igalia.com>
Date: Fri, 25 Oct 2024 15:40:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/pm: Vangogh: Fix kernel memory out of bounds write
To: Mario Limonciello <mario.limonciello@amd.com>,
 Tvrtko Ursulin <tursulin@igalia.com>, amd-gfx@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Evan Quan <evan.quan@amd.com>,
 Wenyou Yang <WenYou.Yang@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 stable@vger.kernel.org
References: <20241025141526.18572-1-tursulin@igalia.com>
 <9323eaf1-d5c1-4153-bd5e-1bc12a4b0bc8@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <9323eaf1-d5c1-4153-bd5e-1bc12a4b0bc8@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 26 Oct 2024 15:51:52 +0000
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


On 25/10/2024 15:23, Mario Limonciello wrote:
> On 10/25/2024 09:15, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>
>> KASAN reports that the GPU metrics table allocated in
>> vangogh_tables_init() is not large enough for the memset done in
>> smu_cmn_init_soft_gpu_metrics(). Condensed report follows:
>>
>> [   33.861314] BUG: KASAN: slab-out-of-bounds in 
>> smu_cmn_init_soft_gpu_metrics+0x73/0x200 [amdgpu]
>> [   33.861799] Write of size 168 at addr ffff888129f59500 by task 
>> mangoapp/1067
>> ...
>> [   33.861808] CPU: 6 UID: 1000 PID: 1067 Comm: mangoapp Tainted: 
>> G        W          6.12.0-rc4 #356 
>> 1a56f59a8b5182eeaf67eb7cb8b13594dd23b544
>> [   33.861816] Tainted: [W]=WARN
>> [   33.861818] Hardware name: Valve Galileo/Galileo, BIOS F7G0107 
>> 12/01/2023
>> [   33.861822] Call Trace:
>> [   33.861826]  <TASK>
>> [   33.861829]  dump_stack_lvl+0x66/0x90
>> [   33.861838]  print_report+0xce/0x620
>> [   33.861853]  kasan_report+0xda/0x110
>> [   33.862794]  kasan_check_range+0xfd/0x1a0
>> [   33.862799]  __asan_memset+0x23/0x40
>> [   33.862803]  smu_cmn_init_soft_gpu_metrics+0x73/0x200 [amdgpu 
>> 13b1bc364ec578808f676eba412c20eaab792779]
>> [   33.863306]  vangogh_get_gpu_metrics_v2_4+0x123/0xad0 [amdgpu 
>> 13b1bc364ec578808f676eba412c20eaab792779]
>> [   33.864257]  vangogh_common_get_gpu_metrics+0xb0c/0xbc0 [amdgpu 
>> 13b1bc364ec578808f676eba412c20eaab792779]
>> [   33.865682]  amdgpu_dpm_get_gpu_metrics+0xcc/0x110 [amdgpu 
>> 13b1bc364ec578808f676eba412c20eaab792779]
>> [   33.866160]  amdgpu_get_gpu_metrics+0x154/0x2d0 [amdgpu 
>> 13b1bc364ec578808f676eba412c20eaab792779]
>> [   33.867135]  dev_attr_show+0x43/0xc0
>> [   33.867147]  sysfs_kf_seq_show+0x1f1/0x3b0
>> [   33.867155]  seq_read_iter+0x3f8/0x1140
>> [   33.867173]  vfs_read+0x76c/0xc50
>> [   33.867198]  ksys_read+0xfb/0x1d0
>> [   33.867214]  do_syscall_64+0x90/0x160
>> ...
>> [   33.867353] Allocated by task 378 on cpu 7 at 22.794876s:
>> [   33.867358]  kasan_save_stack+0x33/0x50
>> [   33.867364]  kasan_save_track+0x17/0x60
>> [   33.867367]  __kasan_kmalloc+0x87/0x90
>> [   33.867371]  vangogh_init_smc_tables+0x3f9/0x840 [amdgpu]
>> [   33.867835]  smu_sw_init+0xa32/0x1850 [amdgpu]
>> [   33.868299]  amdgpu_device_init+0x467b/0x8d90 [amdgpu]
>> [   33.868733]  amdgpu_driver_load_kms+0x19/0xf0 [amdgpu]
>> [   33.869167]  amdgpu_pci_probe+0x2d6/0xcd0 [amdgpu]
>> [   33.869608]  local_pci_probe+0xda/0x180
>> [   33.869614]  pci_device_probe+0x43f/0x6b0
>>
>> Empirically we can confirm that the former allocates 152 bytes for the
>> table, while the latter memsets the 168 large block.
>>
>> This is somewhat alleviated by the fact that allocation goes into a 192
>> SLAB bucket, but then for v3_0 metrics the table grows to 264 bytes which
>> would definitely be a problem.
>>
>> Root cause appears that when GPU metrics tables for v2_4 parts were added
>> it was not considered to enlarge the table to fit.
>>
>> The fix in this patch is rather "brute force" and perhaps later should be
>> done in a smarter way, by extracting and consolidating the part 
>> version to
>> size logic to a common helper, instead of brute forcing the largest
>> possible allocation. Nevertheless, for now this works and fixes the 
>> out of
>> bounds write.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Fixes: 41cec40bc9ba ("drm/amd/pm: Vangogh: Add new gpu_metrics_v2_4 to 
>> acquire gpu_metrics")
>> Cc: Mario Limonciello <mario.limonciello@amd.com>
>> Cc: Evan Quan <evan.quan@amd.com>
>> Cc: Wenyou Yang <WenYou.Yang@amd.com>
>> Cc: Alex Deucher <alexander.deucher@amd.com>
>> Cc: <stable@vger.kernel.org> # v6.6+
>> ---
>>   drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c 
>> b/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
>> index 22737b11b1bf..36f4a4651918 100644
>> --- a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
>> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
>> @@ -242,7 +242,10 @@ static int vangogh_tables_init(struct smu_context 
>> *smu)
>>           goto err0_out;
>>       smu_table->metrics_time = 0;
>> -    smu_table->gpu_metrics_table_size = max(sizeof(struct 
>> gpu_metrics_v2_3), sizeof(struct gpu_metrics_v2_2));
>> +    smu_table->gpu_metrics_table_size = sizeof(struct gpu_metrics_v2_2);
>> +    smu_table->gpu_metrics_table_size = 
>> max(smu_table->gpu_metrics_table_size, sizeof(struct gpu_metrics_v2_3));
>> +    smu_table->gpu_metrics_table_size = 
>> max(smu_table->gpu_metrics_table_size, sizeof(struct gpu_metrics_v2_4));
>> +    smu_table->gpu_metrics_table_size = 
>> max(smu_table->gpu_metrics_table_size, sizeof(struct gpu_metrics_v3_0));
> 
> AFAICT Van Gogh only supports 2.2, 2.3 or 2.4.  I don't think there is a 
> need to compare to 3.0 to solve this bug this way.

Gotcha.

> But generally yeah moving the initialization to a helper that actually 
> knows the size would be another way to solve this.

Yeah I was looking at smu_cmn_init_soft_gpu_metrics() and how it has the 
data of how large table needs to be for each frev+crev combo. But didn't 
go as far as trying to figure out if frev+crev would be available at 
table allocation time.

> Or looking at it how about moving all the conditional code in 
> vangogh_common_get_gpu_metrics() into vangogh_tables_init() and then 
> assigning a vfunc for vangogh_common_get_gpu_metrics() to call?

I did not quite follow. Happy to work on it though and I can look into 
it with fresh eyes but not next week, but the week after.

Or in the meantime if you want me to respin this fix just with v3_0 line 
removed I can do that today.

Regards,

Tvrtko

>>       smu_table->gpu_metrics_table = 
>> kzalloc(smu_table->gpu_metrics_table_size, GFP_KERNEL);
>>       if (!smu_table->gpu_metrics_table)
>>           goto err1_out;
> 
