Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BF1183E7
	for <lists+amd-gfx@lfdr.de>; Thu,  9 May 2019 04:48:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62AE089973;
	Thu,  9 May 2019 02:48:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730060.outbound.protection.outlook.com [40.107.73.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EEBB89973
 for <amd-gfx@lists.freedesktop.org>; Thu,  9 May 2019 02:48:22 +0000 (UTC)
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1315.namprd12.prod.outlook.com (10.168.228.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.11; Thu, 9 May 2019 02:48:19 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::bc5b:de68:25b7:d853]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::bc5b:de68:25b7:d853%12]) with mapi id 15.20.1856.012; Thu, 9 May 2019
 02:48:19 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Lin, Amber" <Amber.Lin@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: Kernel crash at reloading amdgpu
Thread-Topic: Kernel crash at reloading amdgpu
Thread-Index: AQHVBeCJTb+V50ABekGYwdmvFZy8CKZiF3Xc
Date: Thu, 9 May 2019 02:48:18 +0000
Message-ID: <BN6PR12MB1809AAA827BDC68A79EBFF14F7330@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <235b28d2-5fe9-d62d-cef2-014c7ecfcb4e@amd.com>
In-Reply-To: <235b28d2-5fe9-d62d-cef2-014c7ecfcb4e@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [71.219.84.143]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 02f7a289-4e95-4f43-a749-08d6d428cb11
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(49563074)(7193020);
 SRVR:BN6PR12MB1315; 
x-ms-traffictypediagnostic: BN6PR12MB1315:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN6PR12MB13150E7EFB67A0DDBF0ADE5CF7330@BN6PR12MB1315.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 003245E729
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(376002)(346002)(136003)(39860400002)(366004)(51234002)(199004)(189003)(110136005)(99286004)(316002)(6506007)(26005)(53546011)(186003)(68736007)(11346002)(105004)(446003)(52536014)(76176011)(14444005)(5024004)(256004)(102836004)(7696005)(71190400001)(71200400001)(6436002)(73956011)(76116006)(99936001)(66946007)(66616009)(66476007)(66556008)(64756008)(66446008)(229853002)(81166006)(5660300002)(81156014)(8936002)(8676002)(55016002)(7736002)(66066001)(2501003)(6116002)(3846002)(19627405001)(53936002)(2906002)(6246003)(966005)(476003)(72206003)(86362001)(236005)(74316002)(6306002)(478600001)(9686003)(14454004)(54896002)(33656002)(486006)(25786009)(606006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1315;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: WBcy+7rrSzrHjnVf5zBajv4MdUBlEWBxHL/nYRJfJC9qORdu3dL+cVWnVl1fhfciUsdNAHjTrvTUk1pdJF0b/HLIizKWWpTMx4RNfM8s3p1SKuzRYsxWQGkhwXCQJ1ydx3s116aEKdAHgZIoszBibkzisOGQkZJPTdhnhQ99ifgXFAinyu8eRVGx4hPJfQySfL2cmPrSGKG+0pdl66Fawlp0v5CpyoY7SDNk4ujQMtP08ekxcYzPRtxb4E215g16jIW7pWSSPb+Ao3uSbohVoXKFxDc2Qdapu0NuyZvSqwDCvNhaq/cCwr3MoGflfNr3Ur7TiKD7ADG8Y6LyKC8HLhfhGytXeeDb8KUMpfJcjYP2SYLEk3gbuOnQvWEpHcLndNjYHJI58bEhLahyU7sMdQLq/ptBTJh41BxkEEfhJTs=
Content-Type: multipart/mixed;
 boundary="_004_BN6PR12MB1809AAA827BDC68A79EBFF14F7330BN6PR12MB1809namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02f7a289-4e95-4f43-a749-08d6d428cb11
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2019 02:48:18.9014 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1315
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4PfDKcfh3/iGMjjGm3Jo23DdX8TPb3uLTgZjISWlSkc=;
 b=VYExxvqzDLQ5dMlk0qPJrLaJwjljNsVmqo/lJg3geM31dXH/pLKKYuhMeatDjvJCFLi4MU9m32ekEVMV9WmcLVwzgCieXTGYeeA6M3pTHpjsnP6IfEOcIBkZm2s/tK1x/EKzxLAY39j6SU3uE8mKCjW9wJ3vMqIaMbl9gl88Cxw=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Alexander.Deucher@amd.com; 
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--_004_BN6PR12MB1809AAA827BDC68A79EBFF14F7330BN6PR12MB1809namp_
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB1809AAA827BDC68A79EBFF14F7330BN6PR12MB1809namp_"

--_000_BN6PR12MB1809AAA827BDC68A79EBFF14F7330BN6PR12MB1809namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

The attached patch should fix it.

Alex

________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Lin, Amb=
er <Amber.Lin@amd.com>
Sent: Wednesday, May 8, 2019 4:56 PM
To: amd-gfx@lists.freedesktop.org
Subject: Kernel crash at reloading amdgpu

[CAUTION: External Email]

Hi,

When I do "rmmod amdgpu; modprobe amdgpu", kernel crashed. This is
vega20. What happens is in amdgpu_device_init():


         /* check if we need to reset the asic
          *  E.g., driver was not cleanly unloaded previously, etc.
          */
         if (!amdgpu_sriov_vf(adev) &&
amdgpu_asic_need_reset_on_init(adev)) {
                 r =3D amdgpu_asic_reset(adev);
                 if (r) {
                         dev_err(adev->dev, "asic reset on init failed\n");
                         goto failed;
                 }
         }

amdgpu_asic_need_reset_on_init()/soc15_need_reset_on_init() returns true
and it goes to amdgpu_asic_reset()/soc15_asic_mode1_reset(), where it
calls psp_gpu_reset():

         int psp_gpu_reset(struct amdgpu_device *adev)
         {
             if (adev->firmware.load_type !=3D AMDGPU_FW_LOAD_PSP)
                     return 0;

             return psp_mode1_reset(&adev->psp);
         }

Here, however, psp_mode1_reset is NOT assigned as
psp_v11_0_mode1_reset() until amdgpu_device_ip_init(), which is after
amdgpu_asic_reset. This null function pointer causes the kernel crash
and I have to reboot my system.

Does anyone have an idea how to fix this properly?

BTW this is the log:

[  157.686303] PGD 0 P4D 0
[  157.688837] Oops: 0000 [#1] SMP PTI
[  157.692331] CPU: 0 PID: 1902 Comm: kworker/0:2 Tainted: G W
5.0.0-rc1-kfd+ #6
[  157.700760] Hardware name: ASUS All Series/X99-E WS, BIOS 1302 01/05/201=
6
[  157.707543] Workqueue: events work_for_cpu_fn
[  157.711976] RIP: 0010:psp_gpu_reset+0x18/0x30 [amdgpu]
[  157.717106] Code: ff ff ff 5b c3 b8 ea ff ff ff c3 0f 1f 80 00 00 00
00 0f 1f 44 00 00 83 bf c8 22 01 00 02 74 03 31 c0 c3 48 8b 87 c0 23 01
00 <48> 8b 40 50 48 85 c0 74 ed 48 81 c7 88 23 01 00 e9 03 3b 8d d6 0f
[  157.735852] RSP: 0018:ffffaa2544243ce0 EFLAGS: 00010246
[  157.741077] RAX: 0000000000000000 RBX: ffff97e946f60000 RCX:
0000000000000000
[  157.748202] RDX: 0000000000000027 RSI: ffffffff976655a0 RDI:
ffff97e946f60000
[  157.755326] RBP: 0000000000000000 R08: 0000000000000000 R09:
0000000000000002
[  157.762459] R10: ffffaa2544243ba0 R11: 38a79ac3ec19edd5 R12:
ffff97e946f75088
[  157.769608] R13: 000000000000000a R14: ffff97e946f75128 R15:
0000000000000001
[  157.776741] FS:  0000000000000000(0000) GS:ffff97e94f800000(0000)
knlGS:0000000000000000
[  157.784827] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  157.790564] CR2: 0000000000000050 CR3: 00000008083e6003 CR4:
00000000001606f0
[  157.797696] Call Trace:
[  157.800184]  soc15_asic_reset+0x81/0x1f0 [amdgpu]
[  157.804936]  amdgpu_device_init+0xcf1/0x1800 [amdgpu]
[  157.809993]  ? rcu_read_lock_sched_held+0x74/0x80
[  157.814734]  amdgpu_driver_load_kms+0x65/0x270 [amdgpu]

Thanks.

Regards,
Amber
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB1809AAA827BDC68A79EBFF14F7330BN6PR12MB1809namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
The attached patch should fix it.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Alex</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Lin, Amber &lt;Amber.Lin@amd.=
com&gt;<br>
<b>Sent:</b> Wednesday, May 8, 2019 4:56 PM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org<br>
<b>Subject:</b> Kernel crash at reloading amdgpu</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">[CAUTION: External Email]<br>
<br>
Hi,<br>
<br>
When I do &quot;rmmod amdgpu; modprobe amdgpu&quot;, kernel crashed. This i=
s<br>
vega20. What happens is in amdgpu_device_init():<br>
<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* check if we need to res=
et the asic<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *&nbsp; E.g., driver=
 was not cleanly unloaded previously, etc.<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!amdgpu_sriov_vf(adev)=
 &amp;&amp;<br>
amdgpu_asic_need_reset_on_init(adev)) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; r =3D amdgpu_asic_reset(adev);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; if (r) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_e=
rr(adev-&gt;dev, &quot;asic reset on init failed\n&quot;);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto =
failed;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
<br>
amdgpu_asic_need_reset_on_init()/soc15_need_reset_on_init() returns true<br=
>
and it goes to amdgpu_asic_reset()/soc15_asic_mode1_reset(), where it<br>
calls psp_gpu_reset():<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int psp_gpu_reset(struct a=
mdgpu_device *adev)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if=
 (adev-&gt;firmware.load_type !=3D AMDGPU_FW_LOAD_PSP)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; re=
turn psp_mode1_reset(&amp;adev-&gt;psp);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
<br>
Here, however, psp_mode1_reset is NOT assigned as<br>
psp_v11_0_mode1_reset() until amdgpu_device_ip_init(), which is after<br>
amdgpu_asic_reset. This null function pointer causes the kernel crash<br>
and I have to reboot my system.<br>
<br>
Does anyone have an idea how to fix this properly?<br>
<br>
BTW this is the log:<br>
<br>
[&nbsp; 157.686303] PGD 0 P4D 0<br>
[&nbsp; 157.688837] Oops: 0000 [#1] SMP PTI<br>
[&nbsp; 157.692331] CPU: 0 PID: 1902 Comm: kworker/0:2 Tainted: G W<br>
5.0.0-rc1-kfd&#43; #6<br>
[&nbsp; 157.700760] Hardware name: ASUS All Series/X99-E WS, BIOS 1302 01/0=
5/2016<br>
[&nbsp; 157.707543] Workqueue: events work_for_cpu_fn<br>
[&nbsp; 157.711976] RIP: 0010:psp_gpu_reset&#43;0x18/0x30 [amdgpu]<br>
[&nbsp; 157.717106] Code: ff ff ff 5b c3 b8 ea ff ff ff c3 0f 1f 80 00 00 0=
0<br>
00 0f 1f 44 00 00 83 bf c8 22 01 00 02 74 03 31 c0 c3 48 8b 87 c0 23 01<br>
00 &lt;48&gt; 8b 40 50 48 85 c0 74 ed 48 81 c7 88 23 01 00 e9 03 3b 8d d6 0=
f<br>
[&nbsp; 157.735852] RSP: 0018:ffffaa2544243ce0 EFLAGS: 00010246<br>
[&nbsp; 157.741077] RAX: 0000000000000000 RBX: ffff97e946f60000 RCX:<br>
0000000000000000<br>
[&nbsp; 157.748202] RDX: 0000000000000027 RSI: ffffffff976655a0 RDI:<br>
ffff97e946f60000<br>
[&nbsp; 157.755326] RBP: 0000000000000000 R08: 0000000000000000 R09:<br>
0000000000000002<br>
[&nbsp; 157.762459] R10: ffffaa2544243ba0 R11: 38a79ac3ec19edd5 R12:<br>
ffff97e946f75088<br>
[&nbsp; 157.769608] R13: 000000000000000a R14: ffff97e946f75128 R15:<br>
0000000000000001<br>
[&nbsp; 157.776741] FS:&nbsp; 0000000000000000(0000) GS:ffff97e94f800000(00=
00)<br>
knlGS:0000000000000000<br>
[&nbsp; 157.784827] CS:&nbsp; 0010 DS: 0000 ES: 0000 CR0: 0000000080050033<=
br>
[&nbsp; 157.790564] CR2: 0000000000000050 CR3: 00000008083e6003 CR4:<br>
00000000001606f0<br>
[&nbsp; 157.797696] Call Trace:<br>
[&nbsp; 157.800184]&nbsp; soc15_asic_reset&#43;0x81/0x1f0 [amdgpu]<br>
[&nbsp; 157.804936]&nbsp; amdgpu_device_init&#43;0xcf1/0x1800 [amdgpu]<br>
[&nbsp; 157.809993]&nbsp; ? rcu_read_lock_sched_held&#43;0x74/0x80<br>
[&nbsp; 157.814734]&nbsp; amdgpu_driver_load_kms&#43;0x65/0x270 [amdgpu]<br=
>
<br>
Thanks.<br>
<br>
Regards,<br>
Amber<br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a><br>
</div>
</span></font></div>
</body>
</html>

--_000_BN6PR12MB1809AAA827BDC68A79EBFF14F7330BN6PR12MB1809namp_--

--_004_BN6PR12MB1809AAA827BDC68A79EBFF14F7330BN6PR12MB1809namp_
Content-Type: text/x-patch;
	name="0001-drm-amdgpu-psp-move-psp-version-specific-function-po.patch"
Content-Description:  0001-drm-amdgpu-psp-move-psp-version-specific-function-po.patch
Content-Disposition: attachment;
	filename="0001-drm-amdgpu-psp-move-psp-version-specific-function-po.patch";
	size=1652; creation-date="Thu, 09 May 2019 02:48:13 GMT";
	modification-date="Thu, 09 May 2019 02:48:13 GMT"
Content-Transfer-Encoding: base64

RnJvbSBlMTZjYTE4M2FhMDRmY2ZiNDY4MjhkMDgyNDMzNmJjNTFjNGY0NGM4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5j
b20+CkRhdGU6IFdlZCwgOCBNYXkgMjAxOSAyMTo0NTowNiAtMDUwMApTdWJqZWN0OiBbUEFUQ0hd
IGRybS9hbWRncHUvcHNwOiBtb3ZlIHBzcCB2ZXJzaW9uIHNwZWNpZmljIGZ1bmN0aW9uIHBvaW50
ZXJzCiB0byBlYXJseV9pbml0CgpJbiBjYXNlIHdlIG5lZWQgdG8gdXNlIHRoZW0gZm9yIEdQVSBy
ZXNldCBwcmlvciBpbml0aWFsaXppbmcgdGhlCmFzaWMuICBGaXhlcyBhIGNyYXNoIGlmIHRoZSBk
cml2ZXIgYXR0ZW1wdHMgdG8gcmVzZXQgdGhlIEdQVSBhdCBkcml2ZXIKbG9hZCB0aW1lLgoKU2ln
bmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuYyB8IDE5ICsrKysrKysrKyst
LS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuYyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuYwppbmRleCA5MDVjY2UxODE0
ZjMuLjA1ODk3YjA1NzY2YiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3BzcC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3Au
YwpAQCAtMzgsMTggKzM4LDEwIEBAIHN0YXRpYyB2b2lkIHBzcF9zZXRfZnVuY3Moc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYpOwogc3RhdGljIGludCBwc3BfZWFybHlfaW5pdCh2b2lkICpoYW5k
bGUpCiB7CiAJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSAoc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKiloYW5kbGU7CisJc3RydWN0IHBzcF9jb250ZXh0ICpwc3AgPSAmYWRldi0+cHNwOwogCiAJ
cHNwX3NldF9mdW5jcyhhZGV2KTsKIAotCXJldHVybiAwOwotfQotCi1zdGF0aWMgaW50IHBzcF9z
d19pbml0KHZvaWQgKmhhbmRsZSkKLXsKLQlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IChz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqKWhhbmRsZTsKLQlzdHJ1Y3QgcHNwX2NvbnRleHQgKnBzcCA9
ICZhZGV2LT5wc3A7Ci0JaW50IHJldDsKLQogCXN3aXRjaCAoYWRldi0+YXNpY190eXBlKSB7CiAJ
Y2FzZSBDSElQX1ZFR0ExMDoKIAljYXNlIENISVBfVkVHQTEyOgpAQCAtNjcsNiArNTksMTUgQEAg
c3RhdGljIGludCBwc3Bfc3dfaW5pdCh2b2lkICpoYW5kbGUpCiAKIAlwc3AtPmFkZXYgPSBhZGV2
OwogCisJcmV0dXJuIDA7Cit9CisKK3N0YXRpYyBpbnQgcHNwX3N3X2luaXQodm9pZCAqaGFuZGxl
KQoreworCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gKHN0cnVjdCBhbWRncHVfZGV2aWNl
ICopaGFuZGxlOworCXN0cnVjdCBwc3BfY29udGV4dCAqcHNwID0gJmFkZXYtPnBzcDsKKwlpbnQg
cmV0OworCiAJcmV0ID0gcHNwX2luaXRfbWljcm9jb2RlKHBzcCk7CiAJaWYgKHJldCkgewogCQlE
Uk1fRVJST1IoIkZhaWxlZCB0byBsb2FkIHBzcCBmaXJtd2FyZSFcbiIpOwotLSAKMi4yMC4xCgo=

--_004_BN6PR12MB1809AAA827BDC68A79EBFF14F7330BN6PR12MB1809namp_
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--_004_BN6PR12MB1809AAA827BDC68A79EBFF14F7330BN6PR12MB1809namp_--
