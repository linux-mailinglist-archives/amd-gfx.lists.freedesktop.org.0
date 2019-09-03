Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCB0A6958
	for <lists+amd-gfx@lfdr.de>; Tue,  3 Sep 2019 15:07:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9063689449;
	Tue,  3 Sep 2019 13:07:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680069.outbound.protection.outlook.com [40.107.68.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1797889449
 for <amd-gfx@lists.freedesktop.org>; Tue,  3 Sep 2019 13:07:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i9WbXKB4OKRccgcwd6mByNOPNZi3sHPY3hJ1c5qJ0rj72Bk2HjxHsOdGjzmva4MussInOwMbF8yVri8pHksQFbeHFj9dxlBwZRb2LsWAvWu83y4PqkR7JDpjeKjCFp2w9yfLYJOCU0/b3uZF2xqGeY/D3BjuVo6RRmZhRLVDSzI9XRj30X+MZoNrzVjI58Yx4nAJzSSceUyHQO1UhcKZncO7MJ51DpTBH7AjT+xnzpxlD+S812/oDumBrw9ebQ945y060T/V0vuYQCTncNrNLgiUpHcvrcy4sijhQEADrV2OOfILPjCDDXR28JXT9ihOgnAELsCY9p7naFeV+BXiJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jT1VefNlFFSmETLpbEWxOSi4sFbtxqGzavq7S3yZuzQ=;
 b=MAld56ErSGuZkb5NULvsAhG5MN96orKqBGb2RjHpseIhqMD1z3B7rWNPXUkQo7DyGIfHaner7272hzCWsvW36H/OSefY5rPxW56BP/xw+IDsPoveW7dyRP080Aw3ndO+1SXyuTQiGrtivcgIpRMPXLw+a19/rZRpGIZTOWXS/71kR+4dhLFoc2gjcKxTI072tL6i2m2pzuuRwNDyuyqEnqbNzGsNnChRfSMmy7niolunnC6vekQt20PhKg0LFHvG4fKuEs6eppJxLMdOpCqwaSCG5eqjCiKSwSEKFriSxNvljfDFYvRJ3kAfqGxrYIQqZfKcf4pW+AdV4Q7TUsl8PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1244.namprd12.prod.outlook.com (10.168.236.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.20; Tue, 3 Sep 2019 13:07:27 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::9d43:b3d4:9ef:29fc]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::9d43:b3d4:9ef:29fc%8]) with mapi id 15.20.2220.022; Tue, 3 Sep 2019
 13:07:27 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: 78666679 <78666679@qq.com>, amd-gfx <amd-gfx@lists.freedesktop.org>
Subject: =?GB18030?B?UmU6ILvYuLSjuiBCdWc6IGFtZGdwdSBkcm0gZHJpdmVyIGNhdXNlIHByb2Nl?=
 =?GB18030?B?c3MgaW50byBEaXNrIHNsZWVwIHN0YXRl?=
Thread-Topic: =?GB18030?B?u9i4tKO6IEJ1ZzogYW1kZ3B1IGRybSBkcml2ZXIgY2F1c2UgcHJvY2VzcyBp?=
 =?GB18030?B?bnRvIERpc2sgc2xlZXAgc3RhdGU=?=
Thread-Index: AQHVYior7LFqNiJ5HU6M6kt7SCAvu6cZnOyAgABLCoCAAATAgA==
Date: Tue, 3 Sep 2019 13:07:27 +0000
Message-ID: <2162676e-dbfa-a67d-248c-98e9eb2099c2@amd.com>
References: <tencent_4DEABBEB3BB4C6A6D84CA9F0DB225FBF5809@qq.com>
 <f761fec0-c0cc-426c-6bcb-c3fd23808888@amd.com>
 <tencent_7DC9F5195A4D538FA626F85991875FC5F508@qq.com>
In-Reply-To: <tencent_7DC9F5195A4D538FA626F85991875FC5F508@qq.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0001.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::13)
 To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 30a58737-90a2-4f13-8dda-08d7306fab36
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1244; 
x-ms-traffictypediagnostic: DM5PR12MB1244:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB12446C548E4D3AF6335D850583B90@DM5PR12MB1244.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01494FA7F7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(39860400002)(366004)(396003)(376002)(189003)(199004)(71200400001)(316002)(71190400001)(46003)(6246003)(6436002)(76176011)(2906002)(31696002)(6306002)(54896002)(25786009)(52116002)(102836004)(66556008)(66946007)(66446008)(66476007)(6512007)(64756008)(386003)(236005)(86362001)(110136005)(58126008)(6506007)(53936002)(36756003)(6116002)(186003)(99286004)(476003)(8936002)(606006)(966005)(31686004)(65956001)(65806001)(486006)(7736002)(14444005)(81156014)(5660300002)(81166006)(224303003)(446003)(478600001)(229853002)(11346002)(4326008)(14454004)(256004)(6486002)(2616005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1244;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 1Y50Ca3o5lMc20F5HewHPjP8Lm7ysQvVc2RgVDJac2euV6e93kr2y+VOW7G3v5E4AkahIvZnb3qeNKagsXXslSHBFPtRLvGT93CPVpinCMwlERUm2KQQkvoImNP13WSSA+I7vkgnPmL5NnFnSMulAImfPSL7r8YkydwLvc55iYXuAMdPZpXMqPyc6oiqALRz/LciKH163BDXrRIFW6XIY72D5epitbElr/mF9LQ/M24zJ9pmoFX1VJbbC+KNqBAs92DB+bS7XRFgUhQp5hoYaENY091jTab2nBCv8CJ09fl31+2F4wPs+YvSxTAS7RMUGBY+stPJRxqrDOG7gCRKpImUotF2mZbhtdpYznOzFBFc64PM2mUtvcVnSlyCxdfgUNYzNSmKLc1vbK+ECaLoVHGGGQrIfs2+lNgY5+wEwFE=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30a58737-90a2-4f13-8dda-08d7306fab36
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2019 13:07:27.0885 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yDmiw7xxBA+Y4W0+UxvylnHvma5R8enZ5pkm6FunSgTX2hEw0RFwS2dj8EKhqI+y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1244
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jT1VefNlFFSmETLpbEWxOSi4sFbtxqGzavq7S3yZuzQ=;
 b=hwzwXFLD4hM1lifNhh9NK0QYHzMwlbacf2mgQEweKSJOBVqJ1g/EdFyTWvBNFZ6a3nbxa/f9JNeZkecYn17lpCibDceBYXrP1N68xSj1SU7HMtLl+O3c71LLLjzbCah9lXSGgq2+jxo0p7Nqf7TKrGWsqjdjx5NHdCd+vGofNTQ=
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
Content-Type: multipart/mixed; boundary="===============1386558522=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1386558522==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_2162676edbfaa67d248c98e9eb2099c2amdcom_"

--_000_2162676edbfaa67d248c98e9eb2099c2amdcom_
Content-Type: text/plain; charset="GB18030"
Content-Transfer-Encoding: quoted-printable

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



--_000_2162676edbfaa67d248c98e9eb2099c2amdcom_
Content-Type: text/html; charset="GB18030"
Content-ID: <C3646AD8AADB734C9852A11123ED6993@namprd12.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DGB18030">
</head>
<body text=3D"#000000" bgcolor=3D"#FFFFFF">
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
<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Sometimes the thread blocked&nbsp=
; disk sleeping in call to amdgpu_sa_bo_new. following is the stack trace.&=
nbsp; it seems the sa bo is used up ,&nbsp; so&nbsp; the caller blocked wai=
ting someone to free sa resources.
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
------------------&nbsp;=D4=AD=CA=BC=D3=CA=BC=FE&nbsp;------------------</d=
iv>
<div style=3D"font-size: 12px;background:#efefef;padding:8px;">
<div><b>=B7=A2=BC=FE=C8=CB:</b>&nbsp;&quot;Koenig, Christian&quot;<a class=
=3D"moz-txt-link-rfc2396E" href=3D"mailto:Christian.Koenig@amd.com">&lt;Chr=
istian.Koenig@amd.com&gt;</a>;</div>
<div><b>=B7=A2=CB=CD=CA=B1=BC=E4:</b>&nbsp;2019=C4=EA9=D4=C23=C8=D5(=D0=C7=
=C6=DA=B6=FE) =CF=C2=CE=E74:21</div>
<div><b>=CA=D5=BC=FE=C8=CB:</b>&nbsp;&quot;&quot;<a class=3D"moz-txt-link-r=
fc2396E" href=3D"mailto:78666679@qq.com">&lt;78666679@qq.com&gt;</a>;&quot;=
amd-gfx&quot;<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:amd-gfx@list=
s.freedesktop.org">&lt;amd-gfx@lists.freedesktop.org&gt;</a>;<wbr></div>
<div><b>=B3=AD=CB=CD:</b>&nbsp;&quot;Deucher, Alexander&quot;<a class=3D"mo=
z-txt-link-rfc2396E" href=3D"mailto:Alexander.Deucher@amd.com">&lt;Alexande=
r.Deucher@amd.com&gt;</a>;<wbr></div>
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
=3D"https://bugs.freedesktop.org/">
https://bugs.freedesktop.org/</a>.<br>
<br>
Regards,<br>
Christian.<br>
<br>
Am 03.09.19 um 09:35 schrieb 78666679:<br>
&gt; Hi, Sirs:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; I have a wx5100 amdgpu=
 card, It randomly come into failure.&nbsp; sometimes, it will cause proces=
ses into uninterruptible wait state.<br>
&gt;<br>
&gt;<br>
&gt; cps-new-ondemand-0587:~ # ps aux|grep -w D<br>
&gt; root&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 11268&nbsp; 0.0&nbsp; 0.0 260628&nb=
sp; 3516 ?&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Ssl&nbsp; 8=D4=C226&nb=
sp;&nbsp; 0:00 /usr/sbin/gssproxy -D<br>
&gt; root&nbsp;&nbsp;&nbsp;&nbsp; 136482&nbsp; 0.0&nbsp; 0.0 212500&nbsp;&n=
bsp; 572 pts/0&nbsp;&nbsp;&nbsp; S&#43;&nbsp;&nbsp; 15:25&nbsp;&nbsp; 0:00 =
grep --color=3Dauto -w D<br>
&gt; root&nbsp;&nbsp;&nbsp;&nbsp; 370684&nbsp; 0.0&nbsp; 0.0&nbsp; 17972&nb=
sp; 7428 ?&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Ss&nbsp;&nbsp; 9=D4=C2=
02&nbsp;&nbsp; 0:04 /usr/sbin/sshd -D<br>
&gt; 10066&nbsp;&nbsp;&nbsp; 432951&nbsp; 0.0&nbsp; 0.0&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp; 0 ?&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; D&nbsp;&nbsp;&nbsp; 9=D4=C202&nbsp;&nbsp; 0:00 [FakeFinalizerDa]<br=
>
&gt; root&nbsp;&nbsp;&nbsp;&nbsp; 496774&nbsp; 0.0&nbsp; 0.0&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp; 0 ?&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; D&nbsp;&nbsp;&nbsp; 9=D4=C202&nbsp;&nbsp; 0:17 [kworker/8:1&#4=
3;eve]<br>
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
</body>
</html>

--_000_2162676edbfaa67d248c98e9eb2099c2amdcom_--

--===============1386558522==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1386558522==--
