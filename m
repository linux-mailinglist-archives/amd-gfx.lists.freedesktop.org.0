Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE40AB714
	for <lists+amd-gfx@lfdr.de>; Fri,  6 Sep 2019 13:23:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAC166E250;
	Fri,  6 Sep 2019 11:23:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam04on0615.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe4d::615])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5499E6E24E
 for <amd-gfx@lists.freedesktop.org>; Fri,  6 Sep 2019 11:23:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ec9dOHR+QNCYO6FIUA+P3ucJ5e/KaDmu+vX7ab/F0HYVkKANDmdWzravJjOwl+DafGGh1YaXTIMOu0lHlQtwx7B51Vk/e4KeF6LrRZM7A7PFxgI6GMZdGvjhXwLsViz7Rfc41y/f+gLqDXslJOimPTFPnWKNj+37UUilCY1Alhn37dqJ1i+g7jbyBMhiiO0B/cOOD2tjMZZ32+9tiZMHu8HC/XVABRPXt28iC6CuMZbtrYQxt2m521diBAmt+x+zD5fINl4UmureSqYdvi32DZFViXMNHrLAe0ovByx23znZTI1ll0bm36OxEXp4vQTjf3VgLrdOHKHHnwaap4OBrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I4kMT0qBS/w6BecrKYdZfR1UWd2zWjXRILzxj8KuXRU=;
 b=fSb95+FfuI4fyY1Kxn0IyQ5J29zx9KnxXuqjpTv1DhsvoTifkUEx3mKM5q+vgiQW3I8x1dT+DdJKGg9zmaGtC80NJSFlw2NN1mCwSSkYBifh9QVH6UGwUNzxqoMqH/TH6L+Hfh63R7+RtDuc7V2aXm9rBD0vJ8y+raSzaFJOhinE5u7w1LV7/yPnNToy1B07pS23vvfMyELTCE8Ey6wNOC6S0NTaJGsEfdQox+KLmPU9WQ78a5zP3vIMD/IncEbNjRveJj5Rgs10ArfkZmdsXVY6/Uh7NYlQeaUqpqQLEmU9ypVG0PtJnG50q3fdHLmOQG5sXAbm8Ij9/jidKPopdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB2407.namprd12.prod.outlook.com (52.132.141.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.21; Fri, 6 Sep 2019 11:23:20 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::9d43:b3d4:9ef:29fc]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::9d43:b3d4:9ef:29fc%8]) with mapi id 15.20.2220.022; Fri, 6 Sep 2019
 11:23:20 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: yanhua <78666679@qq.com>, amd-gfx <amd-gfx@lists.freedesktop.org>
Subject: =?GB18030?B?UmU6ILvYuLSjuiC72Li0o7ogu9i4tKO6IEJ1ZzogYW1kZ3B1IGRybSBkcml2?=
 =?GB18030?B?ZXIgY2F1c2UgcHJvY2VzcyBpbnRvIERpc2sgc2xlZXAgc3RhdGU=?=
Thread-Topic: =?GB18030?B?u9i4tKO6ILvYuLSjuiC72Li0o7ogQnVnOiBhbWRncHUgZHJtIGRyaXZlciBj?=
 =?GB18030?B?YXVzZSBwcm9jZXNzIGludG8gRGlzayBzbGVlcCBzdGF0ZQ==?=
Thread-Index: AQHVYior7LFqNiJ5HU6M6kt7SCAvu6cZnOyAgABLCoCAAATAgIAAAqqAgAAAyQCAAmAUAIACNl+A
Date: Fri, 6 Sep 2019 11:23:20 +0000
Message-ID: <badd9ea1-6f78-abbc-bdbe-e11271188524@amd.com>
References: <tencent_4DEABBEB3BB4C6A6D84CA9F0DB225FBF5809@qq.com>
 <f761fec0-c0cc-426c-6bcb-c3fd23808888@amd.com>
 <tencent_7DC9F5195A4D538FA626F85991875FC5F508@qq.com>
 <2162676e-dbfa-a67d-248c-98e9eb2099c2@amd.com>
 <tencent_DFCD5A0853FDA639F81F91375F8DF55AF508@qq.com>
 <88a08dcc-2e95-9379-693f-2d3fd928aa11@amd.com>
 <tencent_20683D4D4999B2E0A746EA7D01D677D6070A@qq.com>
In-Reply-To: <tencent_20683D4D4999B2E0A746EA7D01D677D6070A@qq.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0174.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1c::18) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0c6e7164-beb0-4c7d-4a32-08d732bc9f0f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB2407; 
x-ms-traffictypediagnostic: DM5PR12MB2407:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB24079D305E6307877F2892E183BA0@DM5PR12MB2407.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0152EBA40F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(346002)(376002)(396003)(39860400002)(199004)(189003)(6246003)(81166006)(236005)(5024004)(14444005)(256004)(224303003)(52116002)(81156014)(99286004)(25786009)(8936002)(71200400001)(71190400001)(6436002)(6306002)(54896002)(6512007)(4326008)(53936002)(36756003)(6116002)(65806001)(65956001)(606006)(2906002)(66446008)(229853002)(6486002)(66946007)(66476007)(64756008)(66556008)(110136005)(58126008)(11346002)(478600001)(446003)(7736002)(2616005)(476003)(486006)(86362001)(31686004)(31696002)(386003)(102836004)(6506007)(76176011)(186003)(966005)(14454004)(5660300002)(316002)(46003)(105384003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2407;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: UGSEVO1g0ZcBV7SxwSa3twxK1nCUpJ11dK3ZwRKw1n6h2BbTGYXfRfW16JgtYWCu4Qg3gS5WtBhUgAdtsHqxiwRo1DzSFXBsDQcMHodSWW9BZ+aJFIuKJkVyhJYg5UVsvUki6o5PoWeS4bRapXI/JKDcaavS8WpD1r7n7HVlNZ5MB8UouwUYlNiF3fNyv0dtdIieaQauvE6b03OVCjdCgbDldDZ6FntcHVu/MtDipX6n4zp3YRAyT7nDmQHB3bTbqWjrAKz3J6Z7bUH9SPWFGFxKEO1hUN/5dBaqAnggNw3WfHTahtei5/aSycM2ilhBiCdyqYoIvT2ag8kQkYfbe1Y2/bA3ZE3lrhTQj0ikQELuziAXpZX23qNVfd4NdidCLE12hh5G+Cn3N1gXWEp8DnOyw7CulicpBnzFtQiZh5s=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c6e7164-beb0-4c7d-4a32-08d732bc9f0f
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2019 11:23:20.5571 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5oGnfn7jKrR3Ea4YDcdz6Y1Azc9Tzp+KqYQGsatB8ANt7gpRfylELIscFq5Ojbwd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2407
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I4kMT0qBS/w6BecrKYdZfR1UWd2zWjXRILzxj8KuXRU=;
 b=hVmyPZV2OlnZ8m/rOv8yqQrM85juLJ9/uq+lSxfvUfD7Qcg6LXdBLcZM4qVvKfMFqiIvIaKyIhbs205oOPzyKEcRIRB1JrUA4rNi0FRlChP+zgkh7PfDFNkDfCgaoSagQuuxV2hkmnZxccmbL50Vh3VsFI3RcAxb/qAN893ZEZQ=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Content-Type: multipart/mixed; boundary="===============0792055804=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0792055804==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_badd9ea16f78abbcbdbee11271188524amdcom_"

--_000_badd9ea16f78abbcbdbee11271188524amdcom_
Content-Type: text/plain; charset="GB18030"
Content-Transfer-Encoding: quoted-printable

Are there anything I have missed ?

Yeah, unfortunately quite a bunch of things. The fact that arm64 doesn't su=
pport the PCIe NoSnoop TLP attribute is only the tip of the iceberg.

You need a full "recent" driver stack, e.g. not older than a few month till=
 a year, for this to work. And not only the kernel, but also recent userspa=
ce components.

Maybe that's something you could first, e.g. install a recent version of Me=
sa and/or tell Mesa to not use the SDMA at all. But since you are running i=
nto an SDMA lockup with a kernel triggered page table update I see little c=
hance that this work.

The only other alternative I can see is the DKMS package of the pro-driver.=
 With that one you might be able to compile the recent driver for an older =
kernel version.

But I can't guarantee at all that this actually works on ARM64.

Sorry that I don't have better news for you,
Christian.

Am 05.09.19 um 03:36 schrieb yanhua:
Hi, Christian,
        I noticed that you said  'amdgpu is known to not work on arm64 unti=
l very recently'.    I found the CPU related commit with drm is "drm: disab=
le uncached DMA optimization for ARM and arm64".
@@ -47,6 +47,24 @@ static inline bool drm_arch_can_wc_memory(void)
        return false;
 #elif defined(CONFIG_MIPS) && defined(CONFIG_CPU_LOONGSON3)
        return false;
+#elif defined(CONFIG_ARM) || defined(CONFIG_ARM64)
+       /*
+        * The DRM driver stack is designed to work with cache coherent dev=
ices
+        * only, but permits an optimization to be enabled in some cases, w=
here
+        * for some buffers, both the CPU and the GPU use uncached mappings=
,
+        * removing the need for DMA snooping and allocation in the CPU cac=
hes.
+        *
+        * The use of uncached GPU mappings relies on the correct implement=
ation
+        * of the PCIe NoSnoop TLP attribute by the platform, otherwise the=
 GPU
+        * will use cached mappings nonetheless. On x86 platforms, this doe=
s not
+        * seem to matter, as uncached CPU mappings will snoop the caches i=
n any
+        * case. However, on ARM and arm64, enabling this optimization on a
+        * platform where NoSnoop is ignored results in loss of coherency, =
which
+        * breaks correct operation of the device. Since we have no way of
+        * detecting whether NoSnoop works or not, just disable this
+        * optimization entirely for ARM and arm64.
+        */
+       return false;
 #else
        return true;
 #endif

The real effect is to  in amdgpu_object.c

   if (!drm_arch_can_wc_memory())
                bo->flags &=3D ~AMDGPU_GEM_CREATE_CPU_GTT_USWC;

And we have AMDGPU_GEM_CREATE_CPU_GTT_USWC turned off in our 4.19.36 kernel=
, So I think this is not  the cause of my bug.  Are there anything I have m=
issed ?

I had suggest the machine supplier to use a more newer kernel such as 5.2.2=
, But they failed to do so after some try.  We also backport a series patch=
es from newer kernel. But still we get the bad ring timeout.

We have dived into the amdgpu drm driver a long time, bu it is really diffi=
cult for me, especially the hardware related ring timeout.

------------------
Yanhua

------------------ =D4=AD=CA=BC=D3=CA=BC=FE ------------------
=B7=A2=BC=FE=C8=CB: "Koenig, Christian"<Christian.Koenig@amd.com><mailto:Ch=
ristian.Koenig@amd.com>;
=B7=A2=CB=CD=CA=B1=BC=E4: 2019=C4=EA9=D4=C23=C8=D5(=D0=C7=C6=DA=B6=FE) =CD=
=ED=C9=CF9:19
=CA=D5=BC=FE=C8=CB: "yanhua"<78666679@qq.com><mailto:78666679@qq.com>;"amd-=
gfx"<amd-gfx@lists.freedesktop.org><mailto:amd-gfx@lists.freedesktop.org>;
=B3=AD=CB=CD: "Deucher, Alexander"<Alexander.Deucher@amd.com><mailto:Alexan=
der.Deucher@amd.com>;
=D6=F7=CC=E2: Re: =BB=D8=B8=B4=A3=BA =BB=D8=B8=B4=A3=BA Bug: amdgpu drm dri=
ver cause process into Disk sleep state

This is just a GPU lock, please open up a bug report on freedesktop.org and=
 attach the full dmesg and which version of Mesa you are using.

Regards,
Christian.

Am 03.09.19 um 15:16 schrieb 78666679:
Yes, with dmesg|grep drm ,  I get following.

348571.880718] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring sdma1 timeou=
t, signaled seq=3D24423862, emitted seq=3D24423865


------------------ =D4=AD=CA=BC=D3=CA=BC=FE ------------------
=B7=A2=BC=FE=C8=CB: "Koenig, Christian"<Christian.Koenig@amd.com><mailto:Ch=
ristian.Koenig@amd.com>;
=B7=A2=CB=CD=CA=B1=BC=E4: 2019=C4=EA9=D4=C23=C8=D5(=D0=C7=C6=DA=B6=FE) =CD=
=ED=C9=CF9:07
=CA=D5=BC=FE=C8=CB: ""<78666679@qq.com><mailto:78666679@qq.com>;"amd-gfx"<a=
md-gfx@lists.freedesktop.org><mailto:amd-gfx@lists.freedesktop.org>;
=B3=AD=CB=CD: "Deucher, Alexander"<Alexander.Deucher@amd.com><mailto:Alexan=
der.Deucher@amd.com>;
=D6=F7=CC=E2: Re: =BB=D8=B8=B4=A3=BA Bug: amdgpu drm driver cause process i=
nto Disk sleep state

Well that looks like the hardware got stuck.

Do you get something in the locks about a timeout on the SDMA ring?

Regards,
Christian.

Am 03.09.19 um 14:50 schrieb 78666679:
Hi Christian,
       Sometimes the thread blocked  disk sleeping in call to amdgpu_sa_bo_=
new. following is the stack trace.  it seems the sa bo is used up ,  so  th=
e caller blocked waiting someone to free sa resources.

D 206833 227656 [surfaceflinger] <defunct> Binder:45_5
cat /proc/206833/task/227656/stack

[<0>] __switch_to+0x94/0xe8
[<0>] dma_fence_wait_any_timeout+0x234/0x2d0
[<0>] amdgpu_sa_bo_new+0x468/0x540 [amdgpu]
[<0>] amdgpu_ib_get+0x60/0xc8 [amdgpu]
[<0>] amdgpu_job_alloc_with_ib+0x70/0xb0 [amdgpu]
[<0>] amdgpu_vm_bo_update_mapping+0x2e0/0x3d8 [amdgpu]
[<0>] amdgpu_vm_bo_update+0x2a0/0x710 [amdgpu]
[<0>] amdgpu_gem_va_ioctl+0x46c/0x4c8 [amdgpu]
[<0>] drm_ioctl_kernel+0x94/0x118 [drm]
[<0>] drm_ioctl+0x1f0/0x438 [drm]
[<0>] amdgpu_drm_ioctl+0x58/0x90 [amdgpu]
[<0>] do_vfs_ioctl+0xc4/0x8c0
[<0>] ksys_ioctl+0x8c/0xa0
[<0>] __arm64_sys_ioctl+0x28/0x38
[<0>] el0_svc_common+0xa0/0x180
[<0>] el0_svc_handler+0x38/0x78
[<0>] el0_svc+0x8/0xc
[<0>] 0xffffffffffffffff


--------------------
YanHua

------------------ =D4=AD=CA=BC=D3=CA=BC=FE ------------------
=B7=A2=BC=FE=C8=CB: "Koenig, Christian"<Christian.Koenig@amd.com><mailto:Ch=
ristian.Koenig@amd.com>;
=B7=A2=CB=CD=CA=B1=BC=E4: 2019=C4=EA9=D4=C23=C8=D5(=D0=C7=C6=DA=B6=FE) =CF=
=C2=CE=E74:21
=CA=D5=BC=FE=C8=CB: ""<78666679@qq.com><mailto:78666679@qq.com>;"amd-gfx"<a=
md-gfx@lists.freedesktop.org><mailto:amd-gfx@lists.freedesktop.org>;
=B3=AD=CB=CD: "Deucher, Alexander"<Alexander.Deucher@amd.com><mailto:Alexan=
der.Deucher@amd.com>;
=D6=F7=CC=E2: Re: Bug: amdgpu drm driver cause process into Disk sleep stat=
e

Hi Yanhua,

please update your kernel first, cause that looks like a known issue
which was recently fixed by patch "drm/scheduler: use job count instead
of peek".

Probably best to try the latest bleeding edge kernel and if that doesn't
help please open up a bug report on https://bugs.freedesktop.org/.

Regards,
Christian.

Am 03.09.19 um 09:35 schrieb 78666679:
> Hi, Sirs:
>         I have a wx5100 amdgpu card, It randomly come into failure.  some=
times, it will cause processes into uninterruptible wait state.
>
>
> cps-new-ondemand-0587:~ # ps aux|grep -w D
> root      11268  0.0  0.0 260628  3516 ?        Ssl  8=D4=C226   0:00 /us=
r/sbin/gssproxy -D
> root     136482  0.0  0.0 212500   572 pts/0    S+   15:25   0:00 grep --=
color=3Dauto -w D
> root     370684  0.0  0.0  17972  7428 ?        Ss   9=D4=C202   0:04 /us=
r/sbin/sshd -D
> 10066    432951  0.0  0.0      0     0 ?        D    9=D4=C202   0:00 [Fa=
keFinalizerDa]
> root     496774  0.0  0.0      0     0 ?        D    9=D4=C202   0:17 [kw=
orker/8:1+eve]
> cps-new-ondemand-0587:~ # cat /proc/496774/stack
> [<0>] __switch_to+0x94/0xe8
> [<0>] drm_sched_entity_flush+0xf8/0x248 [gpu_sched]
> [<0>] amdgpu_ctx_mgr_entity_flush+0xac/0x148 [amdgpu]
> [<0>] amdgpu_flush+0x2c/0x50 [amdgpu]
> [<0>] filp_close+0x40/0xa0
> [<0>] put_files_struct+0x118/0x120
> [<0>] put_files_struct+0x30/0x68 [binder_linux]
> [<0>] binder_deferred_func+0x4d4/0x658 [binder_linux]
> [<0>] process_one_work+0x1b4/0x3f8
> [<0>] worker_thread+0x54/0x470
> [<0>] kthread+0x134/0x138
> [<0>] ret_from_fork+0x10/0x18
> [<0>] 0xffffffffffffffff
>
>
>
> This issue troubled me a long time.  looking eagerly to get help from you=
!
>
>
> -----
> Yanhua





--_000_badd9ea16f78abbcbdbee11271188524amdcom_
Content-Type: text/html; charset="GB18030"
Content-ID: <785C48D37DB0584AB60F9C220A74364E@namprd12.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DGB18030">
</head>
<body text=3D"#000000" bgcolor=3D"#FFFFFF">
<div class=3D"moz-cite-prefix">
<blockquote type=3D"cite">Are there anything I have missed ?</blockquote>
<br>
Yeah, unfortunately quite a bunch of things. The fact that arm64 doesn't su=
pport the PCIe NoSnoop TLP attribute is only the tip of the iceberg.<br>
<br>
You need a full &quot;recent&quot; driver stack, e.g. not older than a few =
month till a year, for this to work. And not only the kernel, but also rece=
nt userspace components.<br>
<br>
Maybe that's something you could first, e.g. install a recent version of Me=
sa and/or tell Mesa to not use the SDMA at all. But since you are running i=
nto an SDMA lockup with a kernel triggered page table update I see little c=
hance that this work.<br>
<br>
The only other alternative I can see is the DKMS package of the pro-driver.=
 With that one you might be able to compile the recent driver for an older =
kernel version.<br>
<br>
But I can't guarantee at all that this actually works on ARM64.<br>
<br>
Sorry that I don't have better news for you,<br>
Christian.<br>
<br>
Am 05.09.19 um 03:36 schrieb yanhua:<br>
</div>
<blockquote type=3D"cite" cite=3D"mid:tencent_20683D4D4999B2E0A746EA7D01D67=
7D6070A@qq.com">
<div>Hi, Christian,</div>
<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; I noticed that you said&nbs=
p; 'amdgpu is known to not work on arm64 until very recently'. &nbsp;&nbsp;=
 I found the CPU related commit with drm is &quot;drm: disable uncached DMA=
 optimization for ARM and arm64&quot;.&nbsp;
<br>
</div>
<div>@@ -47,6 &#43;47,24 @@ static inline bool drm_arch_can_wc_memory(void)=
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return false;<br>
&nbsp;#elif defined(CONFIG_MIPS) &amp;&amp; defined(CONFIG_CPU_LOONGSON3)<b=
r>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return false;<br>
&#43;#elif defined(CONFIG_ARM) || defined(CONFIG_ARM64)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * The DRM driver stack is d=
esigned to work with cache coherent devices<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * only, but permits an opti=
mization to be enabled in some cases, where<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * for some buffers, both th=
e CPU and the GPU use uncached mappings,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * removing the need for DMA=
 snooping and allocation in the CPU caches.<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * The use of uncached GPU m=
appings relies on the correct implementation<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * of the PCIe NoSnoop TLP a=
ttribute by the platform, otherwise the GPU<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * will use cached mappings =
nonetheless. On x86 platforms, this does not<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * seem to matter, as uncach=
ed CPU mappings will snoop the caches in any<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * case. However, on ARM and=
 arm64, enabling this optimization on a<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * platform where NoSnoop is=
 ignored results in loss of coherency, which<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * breaks correct operation =
of the device. Since we have no way of<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * detecting whether NoSnoop=
 works or not, just disable this<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * optimization entirely for=
 ARM and arm64.<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return false;<br>
&nbsp;#else<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return true;<br>
&nbsp;#endif<br>
<br>
</div>
<div>The real effect is to&nbsp; in amdgpu_object.c<br>
</div>
<div><br>
</div>
<div>&nbsp;&nbsp; if (!drm_arch_can_wc_memory())<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; bo-&gt;flags &amp;=3D ~AMDGPU_GEM_CREATE_CPU_GTT_USWC;<br>
</div>
<div><br>
</div>
<div><span style=3D"font-family: monospace;">And we have </span>AMDGPU_GEM_=
CREATE_CPU_GTT_USWC turned off in our 4.19.36 kernel, So I think this is no=
t&nbsp; the cause of my bug.&nbsp; Are there anything I have missed ?</div>
<div><br>
</div>
<div>I had suggest the machine supplier to use a more newer kernel such as =
5.2.2, But they failed to do so after some try.&nbsp; We also backport a se=
ries patches from newer kernel. But still we get the bad ring timeout.</div=
>
<div><br>
</div>
<div>We have dived into the amdgpu drm driver a long time, bu it is really =
difficult for me, especially the hardware related ring timeout.</div>
<div><br>
</div>
<div>------------------</div>
<div>Yanhua<br>
</div>
<div>
<div><br>
</div>
<div style=3D"font-size: 12px;font-family: Arial
          Narrow;padding:2px 0 2px 0;">
------------------&nbsp;=D4=AD=CA=BC=D3=CA=BC=FE&nbsp;------------------</d=
iv>
<div style=3D"font-size: 12px;background:#efefef;padding:8px;">
<div><b>=B7=A2=BC=FE=C8=CB:</b>&nbsp;&quot;Koenig, Christian&quot;<a class=
=3D"moz-txt-link-rfc2396E" href=3D"mailto:Christian.Koenig@amd.com">&lt;Chr=
istian.Koenig@amd.com&gt;</a>;</div>
<div><b>=B7=A2=CB=CD=CA=B1=BC=E4:</b>&nbsp;2019=C4=EA9=D4=C23=C8=D5(=D0=C7=
=C6=DA=B6=FE) =CD=ED=C9=CF9:19</div>
<div><b>=CA=D5=BC=FE=C8=CB:</b>&nbsp;&quot;yanhua&quot;<a class=3D"moz-txt-=
link-rfc2396E" href=3D"mailto:78666679@qq.com">&lt;78666679@qq.com&gt;</a>;=
&quot;amd-gfx&quot;<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:amd-gf=
x@lists.freedesktop.org">&lt;amd-gfx@lists.freedesktop.org&gt;</a>;<wbr></d=
iv>
<div><b>=B3=AD=CB=CD:</b>&nbsp;&quot;Deucher, Alexander&quot;<a class=3D"mo=
z-txt-link-rfc2396E" href=3D"mailto:Alexander.Deucher@amd.com">&lt;Alexande=
r.Deucher@amd.com&gt;</a>;<wbr></div>
<div><b>=D6=F7=CC=E2:</b>&nbsp;Re: =BB=D8=B8=B4=A3=BA =BB=D8=B8=B4=A3=BA Bu=
g: amdgpu drm driver cause process into Disk sleep state</div>
</div>
<div><br>
</div>
<div class=3D"moz-cite-prefix">This is just a GPU lock, please open up a bu=
g report on freedesktop.org and attach the full dmesg and which version of =
Mesa you are using.<br>
<br>
Regards,<br>
Christian.<br>
<br>
Am 03.09.19 um 15:16 schrieb 78666679:<br>
</div>
<blockquote type=3D"cite" cite=3D"mid:tencent_DFCD5A0853FDA639F81F91375F8DF=
55AF508@qq.com">
<div>Yes, with dmesg|grep drm ,&nbsp; I get following.</div>
<div><br>
</div>
<div>348571.880718] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring sdma1 t=
imeout, signaled seq=3D24423862, emitted seq=3D24423865</div>
<div>
<div><br>
</div>
<div><br>
</div>
<div style=3D"font-size: 12px;font-family: Arial
              Narrow;padding:2px 0 2px 0;">
------------------ =D4=AD=CA=BC=D3=CA=BC=FE ------------------</div>
<div style=3D"font-size: 12px;background:#efefef;padding:8px;">
<div><b>=B7=A2=BC=FE=C8=CB:</b>&nbsp;&quot;Koenig, Christian&quot;<a class=
=3D"moz-txt-link-rfc2396E" href=3D"mailto:Christian.Koenig@amd.com" moz-do-=
not-send=3D"true">&lt;Christian.Koenig@amd.com&gt;</a>;</div>
<div><b>=B7=A2=CB=CD=CA=B1=BC=E4:</b>&nbsp;2019=C4=EA9=D4=C23=C8=D5(=D0=C7=
=C6=DA=B6=FE) =CD=ED=C9=CF9:07</div>
<div><b>=CA=D5=BC=FE=C8=CB:</b>&nbsp;&quot;&quot;<a class=3D"moz-txt-link-r=
fc2396E" href=3D"mailto:78666679@qq.com" moz-do-not-send=3D"true">&lt;78666=
679@qq.com&gt;</a>;&quot;amd-gfx&quot;<a class=3D"moz-txt-link-rfc2396E" hr=
ef=3D"mailto:amd-gfx@lists.freedesktop.org" moz-do-not-send=3D"true">&lt;am=
d-gfx@lists.freedesktop.org&gt;</a>;<wbr></div>
<div><b>=B3=AD=CB=CD:</b>&nbsp;&quot;Deucher, Alexander&quot;<a class=3D"mo=
z-txt-link-rfc2396E" href=3D"mailto:Alexander.Deucher@amd.com" moz-do-not-s=
end=3D"true">&lt;Alexander.Deucher@amd.com&gt;</a>;<wbr></div>
<div><b>=D6=F7=CC=E2:</b>&nbsp;Re: =BB=D8=B8=B4=A3=BA Bug: amdgpu drm drive=
r cause process into Disk sleep state</div>
</div>
<div><br>
</div>
<div class=3D"moz-cite-prefix">Well that looks like the hardware got stuck.=
<br>
<br>
Do you get something in the locks about a timeout on the SDMA ring?<br>
<br>
Regards,<br>
Christian.<br>
<br>
Am 03.09.19 um 14:50 schrieb 78666679:<br>
</div>
<blockquote type=3D"cite" cite=3D"mid:tencent_7DC9F5195A4D538FA626F85991875=
FC5F508@qq.com">
<div>Hi Christian,</div>
<div>&nbsp;&nbsp; &nbsp; &nbsp; Sometimes the thread blocked&nbsp; disk sle=
eping in call to amdgpu_sa_bo_new. following is the stack trace.&nbsp; it s=
eems the sa bo is used up ,&nbsp; so&nbsp; the caller blocked waiting someo=
ne to free sa resources.
<br>
</div>
<div><br>
</div>
<div>D 206833 227656 [surfaceflinger] &lt;defunct&gt; Binder:45_5</div>
<div>cat /proc/206833/task/227656/stack</div>
<div><br>
</div>
<div>[&lt;0&gt;] __switch_to&#43;0x94/0xe8<br>
[&lt;0&gt;] dma_fence_wait_any_timeout&#43;0x234/0x2d0<br>
[&lt;0&gt;] amdgpu_sa_bo_new&#43;0x468/0x540 [amdgpu]<br>
[&lt;0&gt;] amdgpu_ib_get&#43;0x60/0xc8 [amdgpu]<br>
[&lt;0&gt;] amdgpu_job_alloc_with_ib&#43;0x70/0xb0 [amdgpu]<br>
[&lt;0&gt;] amdgpu_vm_bo_update_mapping&#43;0x2e0/0x3d8 [amdgpu]<br>
[&lt;0&gt;] amdgpu_vm_bo_update&#43;0x2a0/0x710 [amdgpu]<br>
[&lt;0&gt;] amdgpu_gem_va_ioctl&#43;0x46c/0x4c8 [amdgpu]<br>
[&lt;0&gt;] drm_ioctl_kernel&#43;0x94/0x118 [drm]<br>
[&lt;0&gt;] drm_ioctl&#43;0x1f0/0x438 [drm]<br>
[&lt;0&gt;] amdgpu_drm_ioctl&#43;0x58/0x90 [amdgpu]<br>
[&lt;0&gt;] do_vfs_ioctl&#43;0xc4/0x8c0<br>
[&lt;0&gt;] ksys_ioctl&#43;0x8c/0xa0<br>
[&lt;0&gt;] __arm64_sys_ioctl&#43;0x28/0x38<br>
[&lt;0&gt;] el0_svc_common&#43;0xa0/0x180<br>
[&lt;0&gt;] el0_svc_handler&#43;0x38/0x78<br>
[&lt;0&gt;] el0_svc&#43;0x8/0xc<br>
[&lt;0&gt;] 0xffffffffffffffff<br>
<br>
</div>
<div><br>
</div>
<div>
<div>--------------------</div>
<div>YanHua<br>
</div>
<div><br>
</div>
<div style=3D"font-size: 12px;font-family: Arial
                  Narrow;padding:2px 0 2px 0;">
------------------ =D4=AD=CA=BC=D3=CA=BC=FE ------------------</div>
<div style=3D"font-size:
                  12px;background:#efefef;padding:8px;">
<div><b>=B7=A2=BC=FE=C8=CB:</b>&nbsp;&quot;Koenig, Christian&quot;<a class=
=3D"moz-txt-link-rfc2396E" href=3D"mailto:Christian.Koenig@amd.com" moz-do-=
not-send=3D"true">&lt;Christian.Koenig@amd.com&gt;</a>;</div>
<div><b>=B7=A2=CB=CD=CA=B1=BC=E4:</b>&nbsp;2019=C4=EA9=D4=C23=C8=D5(=D0=C7=
=C6=DA=B6=FE) =CF=C2=CE=E74:21</div>
<div><b>=CA=D5=BC=FE=C8=CB:</b>&nbsp;&quot;&quot;<a class=3D"moz-txt-link-r=
fc2396E" href=3D"mailto:78666679@qq.com" moz-do-not-send=3D"true">&lt;78666=
679@qq.com&gt;</a>;&quot;amd-gfx&quot;<a class=3D"moz-txt-link-rfc2396E" hr=
ef=3D"mailto:amd-gfx@lists.freedesktop.org" moz-do-not-send=3D"true">&lt;am=
d-gfx@lists.freedesktop.org&gt;</a>;<wbr></div>
<div><b>=B3=AD=CB=CD:</b>&nbsp;&quot;Deucher, Alexander&quot;<a class=3D"mo=
z-txt-link-rfc2396E" href=3D"mailto:Alexander.Deucher@amd.com" moz-do-not-s=
end=3D"true">&lt;Alexander.Deucher@amd.com&gt;</a>;<wbr></div>
<div><b>=D6=F7=CC=E2:</b>&nbsp;Re: Bug: amdgpu drm driver cause process int=
o Disk sleep state</div>
</div>
<div><br>
</div>
Hi Yanhua,<br>
<br>
please update your kernel first, cause that looks like a known issue <br>
which was recently fixed by patch &quot;drm/scheduler: use job count instea=
d <br>
of peek&quot;.<br>
<br>
Probably best to try the latest bleeding edge kernel and if that doesn't <b=
r>
help please open up a bug report on <a class=3D"moz-txt-link-freetext" href=
=3D"https://bugs.freedesktop.org/" moz-do-not-send=3D"true">
https://bugs.freedesktop.org/</a>.<br>
<br>
Regards,<br>
Christian.<br>
<br>
Am 03.09.19 um 09:35 schrieb 78666679:<br>
&gt; Hi, Sirs:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; I have a wx5100 amdgpu card, It =
randomly come into failure.&nbsp; sometimes, it will cause processes into u=
ninterruptible wait state.<br>
&gt;<br>
&gt;<br>
&gt; cps-new-ondemand-0587:~ # ps aux|grep -w D<br>
&gt; root&nbsp; &nbsp; &nbsp; 11268&nbsp; 0.0&nbsp; 0.0 260628&nbsp; 3516 ?=
&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; Ssl&nbsp; 8=D4=C226 &nbsp; 0:00 /usr/sbin/=
gssproxy -D<br>
&gt; root &nbsp; &nbsp; 136482&nbsp; 0.0&nbsp; 0.0 212500 &nbsp; 572 pts/0&=
nbsp; &nbsp; S&#43; &nbsp; 15:25 &nbsp; 0:00 grep --color=3Dauto -w D<br>
&gt; root &nbsp; &nbsp; 370684&nbsp; 0.0&nbsp; 0.0&nbsp; 17972&nbsp; 7428 ?=
&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; Ss &nbsp; 9=D4=C202 &nbsp; 0:04 /usr/sbin/=
sshd -D<br>
&gt; 10066&nbsp; &nbsp; 432951&nbsp; 0.0&nbsp; 0.0&nbsp; &nbsp; &nbsp; 0 &n=
bsp; &nbsp; 0 ?&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; D&nbsp; &nbsp; 9=D4=C202 &n=
bsp; 0:00 [FakeFinalizerDa]<br>
&gt; root &nbsp; &nbsp; 496774&nbsp; 0.0&nbsp; 0.0&nbsp; &nbsp; &nbsp; 0 &n=
bsp; &nbsp; 0 ?&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; D&nbsp; &nbsp; 9=D4=C202 &n=
bsp; 0:17 [kworker/8:1&#43;eve]<br>
&gt; cps-new-ondemand-0587:~ # cat /proc/496774/stack<br>
&gt; [&lt;0&gt;] __switch_to&#43;0x94/0xe8<br>
&gt; [&lt;0&gt;] drm_sched_entity_flush&#43;0xf8/0x248 [gpu_sched]<br>
&gt; [&lt;0&gt;] amdgpu_ctx_mgr_entity_flush&#43;0xac/0x148 [amdgpu]<br>
&gt; [&lt;0&gt;] amdgpu_flush&#43;0x2c/0x50 [amdgpu]<br>
&gt; [&lt;0&gt;] filp_close&#43;0x40/0xa0<br>
&gt; [&lt;0&gt;] put_files_struct&#43;0x118/0x120<br>
&gt; [&lt;0&gt;] put_files_struct&#43;0x30/0x68 [binder_linux]<br>
&gt; [&lt;0&gt;] binder_deferred_func&#43;0x4d4/0x658 [binder_linux]<br>
&gt; [&lt;0&gt;] process_one_work&#43;0x1b4/0x3f8<br>
&gt; [&lt;0&gt;] worker_thread&#43;0x54/0x470<br>
&gt; [&lt;0&gt;] kthread&#43;0x134/0x138<br>
&gt; [&lt;0&gt;] ret_from_fork&#43;0x10/0x18<br>
&gt; [&lt;0&gt;] 0xffffffffffffffff<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; This issue troubled me a long time.&nbsp; looking eagerly to get help =
from you!<br>
&gt;<br>
&gt;<br>
&gt; -----<br>
&gt; Yanhua<br>
<br>
</div>
</blockquote>
<br>
</div>
</blockquote>
<br>
</div>
</blockquote>
<br>
</body>
</html>

--_000_badd9ea16f78abbcbdbee11271188524amdcom_--

--===============0792055804==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0792055804==--
