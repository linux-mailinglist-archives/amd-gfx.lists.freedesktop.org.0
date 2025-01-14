Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28475A0FF15
	for <lists+amd-gfx@lfdr.de>; Tue, 14 Jan 2025 04:12:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EF1010E220;
	Tue, 14 Jan 2025 03:12:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="iLL4oH4/";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from out30-101.freemail.mail.aliyun.com
 (out30-101.freemail.mail.aliyun.com [115.124.30.101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CA4810E220
 for <amd-gfx@lists.freedesktop.org>; Tue, 14 Jan 2025 03:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1736824361; h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To;
 bh=OQFu48lNLL4W+y8JDM+Vza0Rudl0tQFWGA7fLB70hSQ=;
 b=iLL4oH4/hz+iIcI2/17mqRBw9ylddvisXr1fd/23lyK0aa+hl5/ezxBNdNpWpkzycaEYNfLmSJ+xeswa/UAFO2n05Mz025rQBrHT/NjnQd7U6snBD8VOHeTWiL7v+ZnepUYSQHN81JMsXSj3EXKKh2TO1eay1oHO3E+rYAYJyBg=
Received: from smtpclient.apple(mailfrom:gerry@linux.alibaba.com
 fp:SMTPD_---0WNdFDO5_1736824358 cluster:ay36) by smtp.aliyun-inc.com;
 Tue, 14 Jan 2025 11:12:40 +0800
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [v4 1/5] drm/amdgpu: clear adev->in_suspend flag when fails to
 suspend
From: Gerry Liu <gerry@linux.alibaba.com>
In-Reply-To: <9127d203-554c-46d3-9bf2-dcddd0405893@amd.com>
Date: Tue, 14 Jan 2025 11:12:38 +0800
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, simona@ffwll.ch, sunil.khatri@amd.com,
 lijo.lazar@amd.com, Hawking.Zhang@amd.com, xiaogang.chen@amd.com,
 Kent.Russell@amd.com, shuox.liu@linux.alibaba.com,
 amd-gfx@lists.freedesktop.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <316C73DC-2711-4B7E-B355-CB6FC3DE5910@linux.alibaba.com>
References: <cover.1736474822.git.gerry@linux.alibaba.com>
 <04046faffc26d2dfceda01806782df1083450066.1736474822.git.gerry@linux.alibaba.com>
 <9127d203-554c-46d3-9bf2-dcddd0405893@amd.com>
To: Mario Limonciello <mario.limonciello@amd.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
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



> 2025=E5=B9=B41=E6=9C=8811=E6=97=A5 02:57=EF=BC=8CMario Limonciello =
<mario.limonciello@amd.com> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On 1/9/2025 20:08, Jiang Liu wrote:
>> Clear adev->in_suspend flag when fails to suspend, otherwise it will
>> cause too much warnings like:
>> [ 1802.212027] ------------[ cut here ]------------
>> [ 1802.212028] WARNING: CPU: 97 PID: 11282 at =
drivers/gpu/drm/amd/amdgpu/amdgpu_object.c:452 =
amdgpu_bo_free_kernel+0xf9/0x120 [amdgpu]
>> [ 1802.212198] Modules linked in: amdgpu(E-) tcp_diag(E) inet_diag(E) =
rfkill(E) intel_rapl_msr(E) intel_rapl_common(E) =
intel_uncore_frequency(E) intel_uncore_frequency_common(E) i10nm_edac(E) =
nfit(E) x86_pkg_temp_thermal(E) intel_powerclamp(E) coretemp(E) =
kvm_intel(E) kvm(E) crct10dif_pclmul(E) crc32_pclmul(E) =
ghash_clmulni_intel(E) rapl(E) iTCO_wdt(E) pmt_telemetry(E) =
iTCO_vendor_support(E) pmt_class(E) intel_cstate(E) snd_hda_intel(E) =
ipmi_ssif(E) snd_intel_dspcfg(E) snd_hda_codec(E) snd_hda_core(E) =
snd_hwdep(E) snd_pcm(E) snd_timer(E) intel_uncore(E) snd(E) cdc_ether(E) =
pcspkr(E) i2c_i801(E) idxd(E) mei_me(E) usbnet(E) ses(E) isst_if_mmio(E) =
isst_if_mbox_pci(E) mii(E) joydev(E) soundcore(E) isst_if_common(E) =
idxd_bus(E) mei(E) enclosure(E) intel_vsec(E) i2c_smbus(E) i2c_ismt(E) =
sunrpc(E) acpi_power_meter(E) ipmi_si(E) acpi_ipmi(E) ipmi_devintf(E) =
acpi_pad(E) ipmi_msghandler(E) vfat(E) fat(E) sg(E) video(E) amdxcp(E) =
drm_ttm_helper(E) ttm(E) drm_exec(E) gpu_sched(E) drm_suballoc_helper(E) =
crc32c_intel(E) drm_buddy(E)
>> [ 1802.212223]  ast(E) drm_shmem_helper(E) drm_display_helper(E) =
i2c_algo_bit(E) drm_kms_helper(E) virtio_net(E) mpt3sas(E) drm(E) =
net_failover(E) ahci(E) raid_class(E) failover(E) libahci(E) =
scsi_transport_sas(E) dimlib(E) libata(E) i2c_core(E) wmi(E) =
pinctrl_emmitsburg(E) [last unloaded: amdgpu(E)]
>> [ 1802.212231] CPU: 97 PID: 11282 Comm: rmmod Kdump: loaded Tainted: =
G        W   E      6.10.0+ #2
>> [ 1802.212232] Hardware name: Alibaba Alibaba Cloud ECS/Alibaba Cloud =
ECS, BIOS 3.0.ES.AL.P.087.05 04/07/2024
>> [ 1802.212232] RIP: 0010:amdgpu_bo_free_kernel+0xf9/0x120 [amdgpu]
>> [ 1802.212401] Code: 00 00 00 4d 85 e4 74 08 49 c7 04 24 00 00 00 00 =
48 85 ed 74 08 48 c7 45 00 00 00 00 00 5b 5d 41 5c 41 5d 41 5e c3 cc cc =
cc cc <0f> 0b e9 3b ff ff ff 3d 00 fe ff ff 74 b3 49 8b be b0 10 ff ff =
4c
>> [ 1802.212402] RSP: 0018:ffffbe0e92087cb0 EFLAGS: 00010202
>> [ 1802.212403] RAX: 0000000000000206 RBX: ffff9cbc06c37f10 RCX: =
000000000020000d
>> [ 1802.212404] RDX: ffff9cbc06c37f18 RSI: ffff9cbc06c37f58 RDI: =
ffff9cbc06c37f10
>> [ 1802.212407] RBP: ffff9cbc06c37f18 R08: ffff9cba42388800 R09: =
000000000020000d
>> [ 1802.212409] R10: 0000000000040000 R11: 0000000000000006 R12: =
ffff9cbc06c37f58
>> [ 1802.212410] R13: ffff9cba4238dc00 R14: ffff9cbc06c0ef50 R15: =
ffff9cbc06c00000
>> [ 1802.212411] FS:  00007f927dc4e740(0000) GS:ffff9db47e880000(0000) =
knlGS:0000000000000000
>> [ 1802.212412] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> [ 1802.212413] CR2: 000056342b2be1a8 CR3: 00000003f1546005 CR4: =
0000000000f70ef0
>> [ 1802.212413] DR0: 0000000000000000 DR1: 0000000000000000 DR2: =
0000000000000000
>> [ 1802.212414] DR3: 0000000000000000 DR6: 00000000fffe07f0 DR7: =
0000000000000400
>> [ 1802.212415] PKRU: 55555554
>> [ 1802.212415] Call Trace:
>> [ 1802.212416]  <TASK>
>> [ 1802.212417]  ? __warn+0x83/0x130
>> [ 1802.212419]  ? amdgpu_bo_free_kernel+0xf9/0x120 [amdgpu]
>> [ 1802.212586]  ? __report_bug+0xea/0x100
>> [ 1802.212588]  ? report_bug+0x24/0x70
>> [ 1802.212589]  ? handle_bug+0x3c/0x70
>> [ 1802.212590]  ? exc_invalid_op+0x18/0x70
>> [ 1802.212591]  ? asm_exc_invalid_op+0x1a/0x20
>> [ 1802.212594]  ? amdgpu_bo_free_kernel+0xf9/0x120 [amdgpu]
>> [ 1802.212746]  amdgpu_ring_fini+0x91/0x120 [amdgpu]
>> [ 1802.212901]  amdgpu_jpeg_sw_fini+0xb2/0xe0 [amdgpu]
>> [ 1802.213106]  amdgpu_device_ip_fini.isra.0+0xb1/0x1c0 [amdgpu]
>> [ 1802.213247]  amdgpu_device_fini_sw+0x49/0x290 [amdgpu]
>> [ 1802.213413]  amdgpu_driver_release_kms+0x16/0x30 [amdgpu]
>> [ 1802.213576]  devm_drm_dev_init_release+0x4e/0x70 [drm]
>> [ 1802.213602]  release_nodes+0x35/0xb0
>> [ 1802.213605]  devres_release_all+0x8f/0xd0
>> [ 1802.213606]  device_unbind_cleanup+0xe/0x70
>> [ 1802.213609]  device_release_driver_internal+0x1bc/0x200
>> [ 1802.213611]  driver_detach+0x48/0x90
>> [ 1802.213613]  bus_remove_driver+0x6d/0xf0
>> [ 1802.213615]  pci_unregister_driver+0x2e/0xb0
>> [ 1802.213618]  amdgpu_exit+0x15/0x1c4 [amdgpu]
>> [ 1802.213861]  __do_sys_delete_module.constprop.0+0x176/0x310
>> [ 1802.213863]  do_syscall_64+0x5d/0x170
>> [ 1802.213866]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
>> [ 1802.213869] RIP: 0033:0x7f927d6620cb
>> [ 1802.213870] Code: 73 01 c3 48 8b 0d a5 6d 19 00 f7 d8 64 89 01 48 =
83 c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa b8 b0 00 00 00 =
0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 75 6d 19 00 f7 d8 64 89 01 =
48
>> [ 1802.213871] RSP: 002b:00007fff031d9d78 EFLAGS: 00000206 ORIG_RAX: =
00000000000000b0
>> [ 1802.213873] RAX: ffffffffffffffda RBX: 000055d8d6df69e0 RCX: =
00007f927d6620cb
>> [ 1802.213873] RDX: 000000000000000a RSI: 0000000000000800 RDI: =
000055d8d6df6a48
>> [ 1802.213874] RBP: 0000000000000000 R08: 0000000000000000 R09: =
0000000000000000
>> [ 1802.213875] R10: 00007f927d7aaac0 R11: 0000000000000206 R12: =
00007fff031d9fa0
>> [ 1802.213876] R13: 00007fff031da5f1 R14: 000055d8d6df62a0 R15: =
000055d8d6df69e0
>> [ 1802.213878]  </TASK>
>> [ 1802.213879] ---[ end trace 0000000000000000 ]---
>=20
> This patch seems like it's attacking two different problems; a failure =
to suspend and a failure to resume.  Some comments inline on each.
>=20
>=20
>> Signed-off-by: Jiang Liu <gerry@linux.alibaba.com>
>> ---
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 13 +++++++++----
>>  1 file changed, 9 insertions(+), 4 deletions(-)
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c =
b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> index 0a121aab5c74..5ff53a3b9851 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> @@ -4910,7 +4910,7 @@ int amdgpu_device_suspend(struct drm_device =
*dev, bool notify_clients)
>>  		amdgpu_virt_fini_data_exchange(adev);
>>  		r =3D amdgpu_virt_request_full_gpu(adev, false);
>>  		if (r)
>> -			return r;
>> +			goto error_out;
>>  	}
>>    	if (amdgpu_acpi_smart_shift_update(dev, AMDGPU_SS_DEV_D3))
>> @@ -4930,7 +4930,7 @@ int amdgpu_device_suspend(struct drm_device =
*dev, bool notify_clients)
>>    	r =3D amdgpu_device_evict_resources(adev);
>>  	if (r)
>> -		return r;
>> +		goto error_out;
>>    	amdgpu_ttm_set_buffer_funcs_status(adev, false);
>>  @@ -4943,9 +4943,12 @@ int amdgpu_device_suspend(struct drm_device =
*dev, bool notify_clients)
>>    	r =3D amdgpu_dpm_notify_rlc_state(adev, false);
>>  	if (r)
>> -		return r;
>> +		goto error_out;
>=20
> For the changes to suspend, I would worry that this isn't really =
"unwinding" the suspend.  I think that if you just "abort" and say =
in_suspend =3D false this is going to leave some IP in an inconsistent =
state depending on where you failed.  For example let's (hypothetically) =
say this is a dGPU that you failed to evict resources.
>=20
> You would have still called amdgpu_device_ip_suspend_phase1() which =
means that all the valid blocks would have had amdgpu_ip_block_suspend() =
called.  This calls an individual block's suspend() callback but not =
it's resume().
>=20
> The failure code for amdgpu_device_suspend() would bubble up to the =
pmops handlers.  I think if it's called from runtime pm =
(amdgpu_pmops_runtime_suspend) then the runtime support is no longer =
functional.  If it's from amdgpu_pmops_suspend() or =
amdgpu_pmops_freeze() though I don't think anyone calls asic reset.
>=20
> To change that flag I think you either need to unwind everything or we =
need a recovery path in the callers to do amdgpu_asic_reset().
Hi Mario,
	You are right. My fix is just hiding the warning instead of =
solving the issue.
I have tried to handle the failure at amdgpu_pmops_suspend() by calling =
amdgpu_asic_reset(). But that doesn=E2=80=99t really fix the issue, it =
will cause following `amd-smi` hang forever with many kernel warnings.
So seem I can=E2=80=99t find a reasonable way to handle the situation =
and have to drop this patch:(


>=20
>>    	return 0;
>> +error_out:
>> +	adev->in_suspend =3D false;
>> +	return r;
>>  }
>>    /**
>> @@ -5007,8 +5010,10 @@ int amdgpu_device_resume(struct drm_device =
*dev, bool notify_clients)
>>  		amdgpu_virt_release_full_gpu(adev, true);
>>  	}
>>  -	if (r)
>> +	if (r) {
>> +		adev->in_suspend =3D false;
>>  		return r;
>> +	}
>>    	/* Make sure IB tests flushed */
>>  	flush_delayed_work(&adev->delayed_init_work);
>=20
> With the resume path is the failure to resume a real problem?  Or is =
that just hypothetical?
>=20
> Similarly; I don't think you can just say you're not in suspend =
anymore.  If this is just hypothetical I think this chunk should be =
dropped.
>=20
> If it's real, again maybe a better recovery is a reset.

