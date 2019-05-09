Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B186318B92
	for <lists+amd-gfx@lfdr.de>; Thu,  9 May 2019 16:20:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C93889C6A;
	Thu,  9 May 2019 14:20:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800074.outbound.protection.outlook.com [40.107.80.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A7D289C6A
 for <amd-gfx@lists.freedesktop.org>; Thu,  9 May 2019 14:20:06 +0000 (UTC)
Received: from BN6PR12MB1364.namprd12.prod.outlook.com (10.168.228.22) by
 BN6PR12MB1426.namprd12.prod.outlook.com (10.168.230.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.12; Thu, 9 May 2019 14:20:02 +0000
Received: from BN6PR12MB1364.namprd12.prod.outlook.com
 ([fe80::304c:e454:c739:254a]) by BN6PR12MB1364.namprd12.prod.outlook.com
 ([fe80::304c:e454:c739:254a%11]) with mapi id 15.20.1878.022; Thu, 9 May 2019
 14:20:02 +0000
From: "Lin, Amber" <Amber.Lin@amd.com>
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: Kernel crash at reloading amdgpu
Thread-Topic: Kernel crash at reloading amdgpu
Thread-Index: AQHVBeCJTb+V50ABekGYwdmvFZy8CKZiF3XcgADBXAA=
Date: Thu, 9 May 2019 14:20:02 +0000
Message-ID: <0963a798-caaf-4356-08aa-447d22e84dc6@amd.com>
References: <235b28d2-5fe9-d62d-cef2-014c7ecfcb4e@amd.com>
 <BN6PR12MB1809AAA827BDC68A79EBFF14F7330@BN6PR12MB1809.namprd12.prod.outlook.com>
In-Reply-To: <BN6PR12MB1809AAA827BDC68A79EBFF14F7330@BN6PR12MB1809.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0053.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::30) To BN6PR12MB1364.namprd12.prod.outlook.com
 (2603:10b6:404:1e::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f5247895-a8d4-4765-f9f0-08d6d4896ce1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1426; 
x-ms-traffictypediagnostic: BN6PR12MB1426:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN6PR12MB14266EF7546BC13C22130AD1E1330@BN6PR12MB1426.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 003245E729
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(376002)(366004)(39860400002)(396003)(136003)(199004)(189003)(51234002)(52116002)(53936002)(478600001)(72206003)(25786009)(966005)(99286004)(6246003)(19627405001)(14454004)(73956011)(476003)(53546011)(316002)(102836004)(386003)(6506007)(71190400001)(71200400001)(5660300002)(66556008)(66946007)(66476007)(66446008)(64756008)(256004)(14444005)(5024004)(76176011)(446003)(11346002)(2616005)(66066001)(31686004)(486006)(86362001)(105004)(6116002)(2906002)(3846002)(81156014)(81166006)(8676002)(8936002)(236005)(6436002)(6512007)(54896002)(6306002)(229853002)(6486002)(110136005)(186003)(31696002)(2501003)(36756003)(7736002)(26005)(606006)(68736007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1426;
 H:BN6PR12MB1364.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: qXeNogqWK2/1ugpuihAv42yD9uiAzKsUU0529jog23ElAk5O1bXecmhrKDGWorsw+rFLzmlIv5m5qg8ciWP2TaI659dqVNPGYdr34h6dIO3FvPPc25pscgqoUibH2ifljQ9vZsL5+rAsXyfoIIAOJ3fcGJkzdkjoYKP1ov9Nfwe/lIdx1xzJz7DrPG6AkYj78OhaeMVziY0+2c2L2ZNTklfO8BH14wVBRQXn4HA3xnVRwUe7Z4nrI02IJAxfsJbyacPyQseIKpb9XIuZnDwMupQviFeSZgBhfaBZ2id13mMFQIpeELEbqjP+wymxOcDJ/AHBty/g4kqggYFSxb44XURdsH/TMFB93y8I1Ys/Vp5CWomR6Z3iyXuMfKEzVLbtWO0VBtZ1s+5HKSFLlqUlBv/IvVLSeoY2bVCnKVSR9G4=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5247895-a8d4-4765-f9f0-08d6d4896ce1
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2019 14:20:02.4513 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1426
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lv2SAyRUrXOGUXrR7psgimhrgwoB+MH+xam/yRi1fLs=;
 b=kc+WA08AlihxuA7FP10qe8iuZ4jQWqR4YFXsznTSp3j9sAcegMNrpwdVjYcbxSuyC7EEmLDjR9uQNS8bSjdvQTEKKWq/U8z/eAow1cvG0xav6BRLZOLn8MpxWihTEs0BZSrJhnDLIicEUIgVpi1/9vjqUauokFwgGyeUcrXhvZ0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Amber.Lin@amd.com; 
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
Content-Type: multipart/mixed; boundary="===============2053042946=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============2053042946==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_0963a798caaf435608aa447d22e84dc6amdcom_"

--_000_0963a798caaf435608aa447d22e84dc6amdcom_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Thank you Alex! It does fix the crash. (GPU post failed following that but =
at least it exits gracefully.)

Regards,
Amber

On 2019-05-08 10:48 p.m., Deucher, Alexander wrote:
The attached patch should fix it.

Alex

________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org><mailto:amd-gfx-bounce=
s@lists.freedesktop.org> on behalf of Lin, Amber <Amber.Lin@amd.com><mailto=
:Amber.Lin@amd.com>
Sent: Wednesday, May 8, 2019 4:56 PM
To: amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>
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
amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>
https://lists.freedesktop.org/mailman/listinfo/amd-gfx


--_000_0963a798caaf435608aa447d22e84dc6amdcom_
Content-Type: text/html; charset="Windows-1252"
Content-ID: <0DD4168CFDA1084BBF9D0592D6ACF36F@namprd12.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
</head>
<body text=3D"#000000" bgcolor=3D"#FFFFFF">
Thank you Alex! It does fix the crash. (GPU post failed following that but =
at least it exits gracefully.)<br>
<br>
Regards,<br>
Amber<br>
<br>
<div class=3D"moz-cite-prefix">On 2019-05-08 10:48 p.m., Deucher, Alexander=
 wrote:<br>
</div>
<blockquote type=3D"cite" cite=3D"mid:BN6PR12MB1809AAA827BDC68A79EBFF14F733=
0@BN6PR12MB1809.namprd12.prod.outlook.com">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
The attached patch should fix it.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
Alex</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font style=3D"font-size:11pt" face=
=3D"Calibri, sans-serif" color=3D"#000000"><b>From:</b> amd-gfx
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:amd-gfx-bounces@lists.fre=
edesktop.org">
&lt;amd-gfx-bounces@lists.freedesktop.org&gt;</a> on behalf of Lin, Amber <=
a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:Amber.Lin@amd.com">
&lt;Amber.Lin@amd.com&gt;</a><br>
<b>Sent:</b> Wednesday, May 8, 2019 4:56 PM<br>
<b>To:</b> <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:amd-gfx@lis=
ts.freedesktop.org">
amd-gfx@lists.freedesktop.org</a><br>
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
<a class=3D"moz-txt-link-abbreviated" href=3D"mailto:amd-gfx@lists.freedesk=
top.org">amd-gfx@lists.freedesktop.org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx" moz-do-n=
ot-send=3D"true">https://lists.freedesktop.org/mailman/listinfo/amd-gfx</a>=
<br>
</div>
</span></font></div>
</blockquote>
<br>
</body>
</html>

--_000_0963a798caaf435608aa447d22e84dc6amdcom_--

--===============2053042946==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============2053042946==--
