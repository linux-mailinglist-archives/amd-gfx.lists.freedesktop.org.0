Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD3813725F
	for <lists+amd-gfx@lfdr.de>; Fri, 10 Jan 2020 17:07:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 509826EA45;
	Fri, 10 Jan 2020 16:07:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2053.outbound.protection.outlook.com [40.107.237.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 755AF6EA42;
 Fri, 10 Jan 2020 16:07:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SRH90VjxOU3bK7NvGOYGfkJ1JcJnHXkPX+DXdM4SP2w1iVRqK2z2y5aUOHObY/1BT0thoHy6zlopIF1h7wazl0QfAuOAMkRLBQpq74zMFKzegzLGwWN9LChRUjWbO/ObZjU0gXSV+S1ES1tPzkR5y62guY/0FsuA3hp76T3oVjmkr2Kl772vkierqTV9iiHVg5+wAqBH+jp+3j7XSHdFDsuBYX5td65FIN5EmVUOX829XH0Eb/SlNjsuBVGWizOTvDIm7rOTm/i4JO7Q/UcIirsnLrHyGjuf3FDrtV0rTuroY/PggzM0534h0E+MmE/goJK+ak2HtUAgV8FpNJaq3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jkK5k89touXwLwS7AqYpmYpsBLsd0IHxaG1CDdPsGpA=;
 b=g7AbtfZ7zpvx6diZ11RkDD3BwAFaxTcMCTRy+qwx/hgdlJm2zL7qTnogoNH9rzTWJhLm2BJ+O0Z9IYNQVOSDGpWNk9WnAsNevdHdLHEs+45hynlWbZCktLyp4kG4Ow2Y/UPMrd7AnquzdPambAn8ldZJnFmvMYz4l9BUzEGWHsdSvh3S9Q4c6O4HS8bYN9UrYQDLLHGN9IwDUxSWxQ2Yfhk1eepIIclS3muZRDKL0H5p8wIdJZfqMADOaCpigtlVAEddltUXYgKwEbJTGCROrqWk/wnJWve6vxXaAYNkWat27eACiGbgPrIWC/UupHL3+uZ/TK160HJhuKZuQ2ytjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jkK5k89touXwLwS7AqYpmYpsBLsd0IHxaG1CDdPsGpA=;
 b=FPilZZavFn/PV0l8+QEXNu5K72c1XWs+s6ofhd5/ScbG6kNI1vqTw/JZJSuoPDUqwnWyg/MhDQ3fUYq1/LSrZvuE4p0FM58PGm8hmqnIc076m0yGLtS7S8w1xSz/YyNFGblRa1ZBz23RY0vv7gDrv8YxLVbprPOwCqZT3mt8kX8=
Received: from DM5PR1201MB2554.namprd12.prod.outlook.com (10.172.92.14) by
 DM5PR1201MB0092.namprd12.prod.outlook.com (10.174.106.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.9; Fri, 10 Jan 2020 16:07:09 +0000
Received: from DM5PR1201MB2554.namprd12.prod.outlook.com
 ([fe80::918b:7720:5da1:d845]) by DM5PR1201MB2554.namprd12.prod.outlook.com
 ([fe80::918b:7720:5da1:d845%9]) with mapi id 15.20.2623.013; Fri, 10 Jan 2020
 16:07:09 +0000
From: "Liu, Zhan" <Zhan.Liu@amd.com>
To: "bugzilla-daemon@bugzilla.kernel.org"
 <bugzilla-daemon@bugzilla.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [Bug 206155] New: amdgpu several warnings while booting Fiji GPU, 
 GPU not activated
Thread-Topic: [Bug 206155] New: amdgpu several warnings while booting Fiji
 GPU, GPU not activated
Thread-Index: AQHVx8AZz87ZZEJuZkm7iuHRU2+S2KfkD6Hw
Date: Fri, 10 Jan 2020 16:07:09 +0000
Message-ID: <DM5PR1201MB2554FB066F8666B6DD9887899E380@DM5PR1201MB2554.namprd12.prod.outlook.com>
References: <bug-206155-2300@https.bugzilla.kernel.org/>
In-Reply-To: <bug-206155-2300@https.bugzilla.kernel.org/>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Zhan.Liu@amd.com; 
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 14ee0bbc-ab3f-4233-f8b4-08d795e7259e
x-ms-traffictypediagnostic: DM5PR1201MB0092:
x-microsoft-antispam-prvs: <DM5PR1201MB009224EB925D92DD8294465A9E380@DM5PR1201MB0092.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 02788FF38E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10001)(10009020)(4636009)(39860400002)(396003)(366004)(376002)(136003)(346002)(189003)(199004)(13464003)(186003)(76116006)(64756008)(66446008)(66476007)(66556008)(8676002)(81166006)(81156014)(26005)(2906002)(5660300002)(33656002)(7696005)(66946007)(8936002)(30864003)(316002)(110136005)(71200400001)(9686003)(52536014)(478600001)(45080400002)(86362001)(55016002)(6506007)(966005)(53546011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR1201MB0092;
 H:DM5PR1201MB2554.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 13Sfc+9ZzncZG3S7WbTcv2jLTjYghgwYx584VmJINvtBbGLMyQf+ljnm0VQUXqCtaMPnox8WUfTDYEjBLErFezS3AYpOosaOFe7QpZliUckfQDxa+M+79eFcnJTD1Kpa049Rn2OMrpchq2oV5dPJzA2uZwXUH2haff3dDzpZWRXiGKA8b37QTFnV6K3Zc+ZHUcba3XsGxbGHtPxzhccMnp6S19jUWnXzNa2vj+W8MVHf0B1o8B3UoXyS+PHe3aSqPk9iRiSG/IkkrByAgwRqPy7Dy923RzXduz+twb7Vmt7AD0LKEHeXbWoMFk3AnvcJqBNAU1xLqobH+8aQiDFCDlMTDV1OFFK2F+vI9x+0EfV80mO/aRlG2gWoi15PiobplccpD306uu8dqUIf5BPJEyg2KBjw7sPF7KEwbXbaArt/IhcMICq/+49A0o0XD2dzevQXpRWjlQSUClsZ4qeCdgm7Q+V0ECe4YYFoJYgNhSl5FOZHfe6lqzaONLYFZDQFB38HkzSc9JSowMNnWQYK9Po1aXvV8f1ZEaODX32eB9NgYAF7Pz97u8RAlqO3dCimWUR5iDGFllmYVeZaaFSGgVpB+gSMcTNtNgRsTcwl+u4fppD6mbZc01qpzLs2vWPxT6BzkXhcocoennq7O0jg4A==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14ee0bbc-ab3f-4233-f8b4-08d795e7259e
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2020 16:07:09.5864 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CP8Z21rdf9ulANeI4rfiU7ytXv2jLjUTu8yk3VUKTNCCwsOOTlpB4XXhqhvgeLy8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0092
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

+ amd-gfx@lists.freedesktop.org

Hi there,

Thank you for your bug report (though from your email address seems like you are a robot :p)

Since it's an amdgpu related bug, please also add amd-gfx@lists.freedesktop.org for better visibility.

Thanks,
Zhan

> -----Original Message-----
> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
> bugzilla-daemon@bugzilla.kernel.org
> Sent: 2020/January/10, Friday 9:13 AM
> To: dri-devel@lists.freedesktop.org
> Subject: [Bug 206155] New: amdgpu several warnings while booting Fiji GPU,
> GPU not activated
> 
> https://bugzilla.kernel.org/show_bug.cgi?id=206155
> 
>             Bug ID: 206155
>            Summary: amdgpu several warnings while booting Fiji GPU, GPU
>                     not activated
>            Product: Drivers
>            Version: 2.5
>     Kernel Version: 5.4.7
>           Hardware: x86-64
>                 OS: Linux
>               Tree: Mainline
>             Status: NEW
>           Severity: blocking
>           Priority: P1
>          Component: Video(DRI - non Intel)
>           Assignee: drivers_video-dri@kernel-bugs.osdl.org
>           Reporter: janpieter.sollie@dommel.be
>         Regression: No
> 
> Created attachment 286739
>   --> https://bugzilla.kernel.org/attachment.cgi?id=286739&action=edit
> 
> powerplay-enabled dmesg
> 
> This dmesg is with powerplay disabled (using ppfeaturemask=0), attached pp-
> enabled dmesg
> ----------------------------
> [    6.728122] amdgpu: [powerplay]
>                 failed to send message 154 ret is 0
> [    6.728130] [drm] UVD initialized successfully.
> [    9.324771] amdgpu: [powerplay]
>                 last message was failed ret is 0
> [   11.818433] amdgpu: [powerplay]
>                 failed to send message 15a ret is 0
> [   12.122300] amdgpu 0000:0a:00.0: [drm:amdgpu_ring_test_helper
> [amdgpu]]
> *ERROR* ring vce0 test failed (-110)
> [   12.122382] [drm:amdgpu_device_init.cold [amdgpu]] *ERROR* hw_init of
> IP
> block <vce_v3_0> failed -110
> [   12.122383] amdgpu 0000:0a:00.0: amdgpu_device_ip_init failed
> [   12.122385] amdgpu 0000:0a:00.0: Fatal error during GPU init
> ----------------------------------
> 
> [   14.531652] amdgpu: [powerplay]
>                 last message was failed ret is 0
> [   14.532747] amdgpu: [powerplay] dpm has been disabled
> [   14.534668] ------------[ cut here ]------------
> [   14.534753] WARNING: CPU: 1 PID: 942 at
> amdgpu_bo_unpin.cold+0x23/0x42
> [amdgpu]
> [   14.534754] Modules linked in: btrfs xor raid6_pq kvm_amd(-) amdgpu(+)
> wmi_bmof gpu_sched ttm kvm uas irqbypass backlight i2c_piix4 k10temp
> aacraid wmi efivarfs
> [   14.534762] CPU: 1 PID: 942 Comm: systemd-udevd Not tainted 5.4.7 #8
> [   14.534763] Hardware name: Gigabyte Technology Co., Ltd. X570 UD/X570
> UD,
> BIOS F10 11/15/2019
> [   14.534847] RIP: 0010:amdgpu_bo_unpin.cold+0x23/0x42 [amdgpu]
> [   14.534849] Code: 84 00 00 00 00 00 90 48 8b bb f0 b0 ff ff 4c 89 e2 48 c7
> c6 b7 ea 66 c0 89 44 24 04 e8 02 30 21 d5 8b 44 24 04 e9 0f 94 e5 ff <0f> 0b
> 48 8b bb f0 b0 ff ff 4c 89 e2 48 c7 c6 9f ea 66 c0 e8 57 30
> [   14.534850] RSP: 0018:ffff9bba8132f9d0 EFLAGS: 00010246
> [   14.534851] RAX: ffff88de87d37450 RBX: ffff88de84984f10 RCX:
> ffff88de85444f80
> [   14.534852] RDX: 0000000000000000 RSI: 0000000000000000 RDI:
> ffff88de87d37400
> [   14.534852] RBP: ffff88de84987298 R08: 0000000000000001 R09:
> ffff88de95c03500
> [   14.534853] R10: ffff88de87d37000 R11: ffff88de87d371c0 R12:
> ffff88de87d37400
> [   14.534853] R13: ffff88de84987290 R14: ffff88de87d37400 R15:
> 0000000000000000
> [   14.534855] FS:  00007f3e897bc800(0000) GS:ffff88de96c40000(0000)
> knlGS:0000000000000000
> [   14.534856] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   14.534856] CR2: 00007f3e8945a440 CR3: 0000000207f2c000 CR4:
> 00000000003406e0
> [   14.534857] Call Trace:
> [   14.534929]  amdgpu_bo_free_kernel+0x7d/0x150 [amdgpu]
> [   14.535007]  amdgpu_gfx_rlc_fini+0x42/0x60 [amdgpu]
> [   14.535084]  gfx_v8_0_sw_fini+0x9a/0x190 [amdgpu]
> [   14.535167]  amdgpu_device_fini+0x238/0x42f [amdgpu]
> [   14.535234]  amdgpu_driver_unload_kms+0x50/0xb0 [amdgpu]
> [   14.535317]  amdgpu_driver_load_kms.cold+0x39/0x5b [amdgpu]
> [   14.535320]  drm_dev_register+0x139/0x180
> [   14.535322]  ? do_pci_enable_device+0xad/0xd0
> [   14.535389]  amdgpu_pci_probe+0xb4/0x120 [amdgpu]
> [   14.535392]  ? __pm_runtime_resume+0x54/0x70
> [   14.535394]  local_pci_probe+0x46/0x90
> [   14.535396]  pci_device_probe+0xe9/0x190
> [   14.535399]  really_probe+0xf3/0x2c0
> [   14.535400]  driver_probe_device+0x59/0xd0
> [   14.535402]  device_driver_attach+0x68/0x70
> [   14.535403]  __driver_attach+0x51/0xc0
> [   14.535404]  ? device_driver_attach+0x70/0x70
> [   14.535406]  bus_for_each_dev+0x5e/0x90
> [   14.535408]  bus_add_driver+0x198/0x1e0
> [   14.535409]  driver_register+0x67/0xb0
> [   14.535411]  ? 0xffffffffc0755000
> [   14.535412]  do_one_initcall+0x3e/0x1df
> [   14.535415]  ? __vunmap+0x1e3/0x230
> [   14.535417]  ? kmem_cache_alloc_trace+0x35/0x1b0
> [   14.535419]  do_init_module+0x56/0x210
> [   14.535421]  load_module+0x2033/0x2350
> [   14.535422]  ? frob_text.isra.0+0x20/0x20
> [   14.535425]  ? vfs_read+0x111/0x140
> [   14.535427]  __do_sys_finit_module+0xcd/0xf0
> [   14.535429]  do_syscall_64+0x41/0x160
> [   14.535432]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> [   14.535433] RIP: 0033:0x7f3e89909289
> [   14.535435] Code: 00 00 00 75 05 48 83 c4 18 c3 e8 c2 5f 01 00 66 90 48 89
> f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d
> 01
> f0 ff ff 73 01 c3 48 8b 0d d7 4b 09 00 f7 d8 64 89 01 48
> [   14.535436] RSP: 002b:00007ffec461c2d8 EFLAGS: 00000246 ORIG_RAX:
> 0000000000000139
> [   14.535437] RAX: ffffffffffffffda RBX: 000055e3d0cb2ea0 RCX:
> 00007f3e89909289
> [   14.535438] RDX: 0000000000000000 RSI: 000055e3d0cbe3f0 RDI:
> 000000000000000f
> [   14.535438] RBP: 0000000000020000 R08: 0000000000000000 R09:
> 0000000000000001
> [   14.535439] R10: 000000000000000f R11: 0000000000000246 R12:
> 000055e3d0cbe3f0
> [   14.535440] R13: 0000000000000000 R14: 000055e3d0cb04b0 R15:
> 000055e3d0cb2ea0
> [   14.535441] ---[ end trace 937a1e0bf1c14fd7 ]---
> [   14.535443] amdgpu 0000:0a:00.0: 000000006c58c490 unpin not
> necessary
> [   14.535657] ------------[ cut here ]------------
> [   14.535658] Memory manager not clean during takedown.
> [   14.535665] WARNING: CPU: 1 PID: 942 at drm_mm_takedown+0x1b/0x20
> [   14.535665] Modules linked in: btrfs xor raid6_pq kvm_amd(-) amdgpu(+)
> wmi_bmof gpu_sched ttm kvm uas irqbypass backlight i2c_piix4 k10temp
> aacraid wmi efivarfs
> [   14.535672] CPU: 1 PID: 942 Comm: systemd-udevd Tainted: G        W
> 5.4.7 #8
> [   14.535672] Hardware name: Gigabyte Technology Co., Ltd. X570 UD/X570
> UD,
> BIOS F10 11/15/2019
> [   14.535674] RIP: 0010:drm_mm_takedown+0x1b/0x20
> [   14.535676] Code: f7 34 24 e9 d6 fd ff ff 0f 1f 80 00 00 00 00 48 8b 47 38
> 48 83 c7 38 48 39 c7 75 02 f3 c3 48 c7 c7 98 76 20 96 e8 e5 ed ae ff <0f> 0b
> c3
> 66 90 41 57 49 89 f7 41 56 49 89 fe 41 55 41 54 55 53 48
> [   14.535676] RSP: 0018:ffff9bba8132f9d8 EFLAGS: 00010296
> [   14.535677] RAX: 0000000000000029 RBX: ffff88de849850a0 RCX:
> 000000000000045a
> [   14.535678] RDX: 0000000000000001 RSI: 0000000000000096 RDI:
> ffffffff9698e1e4
> [   14.535678] RBP: ffff88de84984f10 R08: 0000000000000001 R09:
> 000000000000045a
> [   14.535679] R10: ffff88de9f369464 R11: 0000000000000001 R12:
> ffff88de93fbed00
> [   14.535680] R13: ffff88de84985080 R14: 0000000000000170 R15:
> 0000000000000000
> [   14.535681] FS:  00007f3e897bc800(0000) GS:ffff88de96c40000(0000)
> knlGS:0000000000000000
> [   14.535682] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   14.535682] CR2: 00007f3e8945a440 CR3: 0000000207f2c000 CR4:
> 00000000003406e0
> [   14.535683] Call Trace:
> [   14.535755]  amdgpu_vram_mgr_fini+0x31/0xb0 [amdgpu]
> [   14.535760]  ttm_bo_clean_mm+0xc1/0xd0 [ttm]
> [   14.535828]  amdgpu_ttm_fini+0x78/0xe0 [amdgpu]
> [   14.535897]  amdgpu_bo_fini+0x9/0x30 [amdgpu]
> [   14.535970]  gmc_v8_0_sw_fini+0x2d/0x50 [amdgpu]
> [   14.536053]  amdgpu_device_fini+0x238/0x42f [amdgpu]
> [   14.536120]  amdgpu_driver_unload_kms+0x50/0xb0 [amdgpu]
> [   14.536202]  amdgpu_driver_load_kms.cold+0x39/0x5b [amdgpu]
> [   14.536204]  drm_dev_register+0x139/0x180
> [   14.536206]  ? do_pci_enable_device+0xad/0xd0
> [   14.536272]  amdgpu_pci_probe+0xb4/0x120 [amdgpu]
> [   14.536274]  ? __pm_runtime_resume+0x54/0x70
> [   14.536276]  local_pci_probe+0x46/0x90
> [   14.536278]  pci_device_probe+0xe9/0x190
> [   14.536279]  really_probe+0xf3/0x2c0
> [   14.536280]  driver_probe_device+0x59/0xd0
> [   14.536282]  device_driver_attach+0x68/0x70
> [   14.536283]  __driver_attach+0x51/0xc0
> [   14.536284]  ? device_driver_attach+0x70/0x70
> [   14.536286]  bus_for_each_dev+0x5e/0x90
> [   14.536287]  bus_add_driver+0x198/0x1e0
> [   14.536288]  driver_register+0x67/0xb0
> [   14.536289]  ? 0xffffffffc0755000
> [   14.536290]  do_one_initcall+0x3e/0x1df
> [   14.536292]  ? __vunmap+0x1e3/0x230
> [   14.536293]  ? kmem_cache_alloc_trace+0x35/0x1b0
> [   14.536295]  do_init_module+0x56/0x210
> [   14.536296]  load_module+0x2033/0x2350
> [   14.536297]  ? frob_text.isra.0+0x20/0x20
> [   14.536299]  ? vfs_read+0x111/0x140
> [   14.536301]  __do_sys_finit_module+0xcd/0xf0
> [   14.536303]  do_syscall_64+0x41/0x160
> [   14.536305]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> [   14.536306] RIP: 0033:0x7f3e89909289
> [   14.536307] Code: 00 00 00 75 05 48 83 c4 18 c3 e8 c2 5f 01 00 66 90 48 89
> f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d
> 01
> f0 ff ff 73 01 c3 48 8b 0d d7 4b 09 00 f7 d8 64 89 01 48
> [   14.536308] RSP: 002b:00007ffec461c2d8 EFLAGS: 00000246 ORIG_RAX:
> 0000000000000139
> [   14.536309] RAX: ffffffffffffffda RBX: 000055e3d0cb2ea0 RCX:
> 00007f3e89909289
> [   14.536310] RDX: 0000000000000000 RSI: 000055e3d0cbe3f0 RDI:
> 000000000000000f
> [   14.536310] RBP: 0000000000020000 R08: 0000000000000000 R09:
> 0000000000000001
> [   14.536311] R10: 000000000000000f R11: 0000000000000246 R12:
> 000055e3d0cbe3f0
> [   14.536311] R13: 0000000000000000 R14: 000055e3d0cb04b0 R15:
> 000055e3d0cb2ea0
> [   14.536313] ---[ end trace 937a1e0bf1c14fd8 ]---
> [   14.536320] [TTM] Finalizing pool allocator
> [   14.536323] [TTM] Finalizing DMA pool allocator
> [   14.536339] [TTM] Zone  kernel: Used memory at exit: 21 KiB
> [   14.536341] [TTM] Zone   dma32: Used memory at exit: 0 KiB
> [   14.536342] [drm] amdgpu: ttm finalized
> [   14.536356] ------------[ cut here ]------------
> [   14.536357] sysfs group 'fw_version' not found for kobject '0000:0a:00.0'
> [   14.536362] WARNING: CPU: 1 PID: 942 at
> sysfs_remove_group+0x8b/0xa0
> [   14.536362] Modules linked in: btrfs xor raid6_pq kvm_amd(-) amdgpu(+)
> wmi_bmof gpu_sched ttm kvm uas irqbypass backlight i2c_piix4 k10temp
> aacraid wmi efivarfs
> [   14.536368] CPU: 1 PID: 942 Comm: systemd-udevd Tainted: G        W
> 5.4.7 #8
> [   14.536368] Hardware name: Gigabyte Technology Co., Ltd. X570 UD/X570
> UD,
> BIOS F10 11/15/2019
> [   14.536370] RIP: 0010:sysfs_remove_group+0x8b/0xa0
> [   14.536371] Code: 8b 6c 24 08 48 83 c4 18 e9 f2 ba ff ff 48 89 ef e8 da b8
> ff ff eb be 49 8b 14 24 48 8b 33 48 c7 c7 40 82 1c 96 e8 b5 44 dd ff <0f> 0b 48
> 8b 1c 24 48 8b 6c 24 08 4c 8b 64 24 10 48 83 c4 18 c3 48
> [   14.536372] RSP: 0018:ffff9bba8132fa48 EFLAGS: 00010296
> [   14.536373] RAX: 000000000000003d RBX: ffffffffc05e4980 RCX:
> 000000000000049b
> [   14.536374] RDX: 0000000000000001 RSI: 0000000000000096 RDI:
> ffffffff9698e1e4
> [   14.536374] RBP: 0000000000000000 R08: 0000000000000001 R09:
> 000000000000049b
> [   14.536375] R10: ffff88de9f36a4f8 R11: 0000000000000001 R12:
> ffff88de9525f0b0
> [   14.536375] R13: ffff88de84994d40 R14: ffff88de954e6c70 R15:
> 0000000000000000
> [   14.536376] FS:  00007f3e897bc800(0000) GS:ffff88de96c40000(0000)
> knlGS:0000000000000000
> [   14.536377] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   14.536378] CR2: 00007f3e8945a440 CR3: 0000000207f2c000 CR4:
> 00000000003406e0
> [   14.536378] Call Trace:
> [   14.536461]  amdgpu_device_fini+0x3fb/0x42f [amdgpu]
> [   14.536528]  amdgpu_driver_unload_kms+0x50/0xb0 [amdgpu]
> [   14.536610]  amdgpu_driver_load_kms.cold+0x39/0x5b [amdgpu]
> [   14.536612]  drm_dev_register+0x139/0x180
> [   14.536613]  ? do_pci_enable_device+0xad/0xd0
> [   14.536680]  amdgpu_pci_probe+0xb4/0x120 [amdgpu]
> [   14.536682]  ? __pm_runtime_resume+0x54/0x70
> [   14.536683]  local_pci_probe+0x46/0x90
> [   14.536685]  pci_device_probe+0xe9/0x190
> [   14.536686]  really_probe+0xf3/0x2c0
> [   14.536688]  driver_probe_device+0x59/0xd0
> [   14.536689]  device_driver_attach+0x68/0x70
> [   14.536690]  __driver_attach+0x51/0xc0
> [   14.536691]  ? device_driver_attach+0x70/0x70
> [   14.536693]  bus_for_each_dev+0x5e/0x90
> [   14.536694]  bus_add_driver+0x198/0x1e0
> [   14.536696]  driver_register+0x67/0xb0
> [   14.536696]  ? 0xffffffffc0755000
> [   14.536698]  do_one_initcall+0x3e/0x1df
> [   14.536699]  ? __vunmap+0x1e3/0x230
> [   14.536701]  ? kmem_cache_alloc_trace+0x35/0x1b0
> [   14.536702]  do_init_module+0x56/0x210
> [   14.536703]  load_module+0x2033/0x2350
> [   14.536704]  ? frob_text.isra.0+0x20/0x20
> [   14.536706]  ? vfs_read+0x111/0x140
> [   14.536708]  __do_sys_finit_module+0xcd/0xf0
> [   14.536710]  do_syscall_64+0x41/0x160
> [   14.536711]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> [   14.536712] RIP: 0033:0x7f3e89909289
> [   14.536714] Code: 00 00 00 75 05 48 83 c4 18 c3 e8 c2 5f 01 00 66 90 48 89
> f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d
> 01
> f0 ff ff 73 01 c3 48 8b 0d d7 4b 09 00 f7 d8 64 89 01 48
> [   14.536715] RSP: 002b:00007ffec461c2d8 EFLAGS: 00000246 ORIG_RAX:
> 0000000000000139
> [   14.536716] RAX: ffffffffffffffda RBX: 000055e3d0cb2ea0 RCX:
> 00007f3e89909289
> [   14.536716] RDX: 0000000000000000 RSI: 000055e3d0cbe3f0 RDI:
> 000000000000000f
> [   14.536717] RBP: 0000000000020000 R08: 0000000000000000 R09:
> 0000000000000001
> [   14.536717] R10: 000000000000000f R11: 0000000000000246 R12:
> 000055e3d0cbe3f0
> [   14.536718] R13: 0000000000000000 R14: 000055e3d0cb04b0 R15:
> 000055e3d0cb2ea0
> [   14.536719] ---[ end trace 937a1e0bf1c14fd9 ]---
> [   14.536883] amdgpu: probe of 0000:0a:00.0 failed with error -110
> 
> --
> You are receiving this mail because:
> You are watching the assignee of the bug.
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.
> freedesktop.org%2Fmailman%2Flistinfo%2Fdri-
> devel&amp;data=02%7C01%7Czhan.liu%40amd.com%7C56624f6d788343e4
> 01b808d795d739ca%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%
> 7C637142623944629645&amp;sdata=l4z2lcSD9uZEeQWgjRGIc2k52w468PZII
> ytRxozTZhw%3D&amp;reserved=0
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
