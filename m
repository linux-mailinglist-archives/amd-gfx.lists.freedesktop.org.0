Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8083C9E84C
	for <lists+amd-gfx@lfdr.de>; Tue, 27 Aug 2019 14:47:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D33089A6D;
	Tue, 27 Aug 2019 12:47:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam03on062e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe49::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1BC789A6D
 for <amd-gfx@lists.freedesktop.org>; Tue, 27 Aug 2019 12:47:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cQRCHaWF69AwkbT2npmRUhm5Jb+bveuDsD1mXiR1OECX/hzeTRmJKURy3PfRgvbl3uNzQ/TWNQIM0zWZAvfXv+JV+nisYe8GjR+iqjIcyHeNgd2L8CCXWo00PDkX8H7qSiPboXaoauLcgxNteO5+jNA0yhLzmuEO1cL5HhGTF2fLf6lDwP6o+CEovQdObx02lW9/pMsWAmkCL5t3J2E9p/AliZP+NXC9qM0EM+Wn8qSbDbhuHKYpQXM9hOHk3BhtH/ethZs7jsh0lJGj7QlaDM+RKUa1It7iba4aGcZ06ZaWu37fRB86xXzvR3ShRTvlHBfz1pmMWw9Yv97yjtZSSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=54m9QOjARieIlUZ4+LZxtZEatxSDp3fC3wzJls0tTrU=;
 b=jQfknGEjGAlTH72hiayFiW1Ckz+fOIpEE3MkDK40RE13D5VD+omh5PH1Y41KQhhJM2H+3VCzpKBPPzARZ7SosUIjlxfvBqg8gom0ldqoMcD/MYxK5w7xIP434JBu93cIqL3+Dfxc7d43U3Sa65SiHj2WDd0cUdeaJMcjMdyesVvwjlB2RYJ1Bo2yrXnmm0sEW6wYgEBKYxb9ulQje0ksjpgf2EcJOHNi5NWpT/fVaIXZbCWE2/ysVJJNXWTM1ftabIUMJL0A+MvugXIJ/28Wx3fSCwsgh5s1VaWratm+Y4stcn66XlBmzEgfw/JDQ84+1Fyptyj9sOu7hvoKUCg1Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1699.namprd12.prod.outlook.com (10.175.97.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.20; Tue, 27 Aug 2019 12:47:30 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::8542:935:262c:53d1]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::8542:935:262c:53d1%10]) with mapi id 15.20.2178.022; Tue, 27 Aug 2019
 12:47:30 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Liu, Monk" <Monk.Liu@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: introduce vram lost for reset
Thread-Topic: [PATCH] drm/amdgpu: introduce vram lost for reset
Thread-Index: AQHVXLJHRNoayxxLSkCJctOWinD/z6cO8WLb
Date: Tue, 27 Aug 2019 12:47:30 +0000
Message-ID: <BN6PR12MB18091D1C62C178D7D984C8BEF7A00@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <1566894873-11178-1-git-send-email-Monk.Liu@amd.com>
In-Reply-To: <1566894873-11178-1-git-send-email-Monk.Liu@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.219.73.178]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9f3f4f18-b2e3-4f0c-84dd-08d72aecb963
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1699; 
x-ms-traffictypediagnostic: BN6PR12MB1699:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB16993510DEFC1C04E6640E14F7A00@BN6PR12MB1699.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0142F22657
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(366004)(396003)(136003)(39860400002)(376002)(199004)(189003)(7696005)(76176011)(66946007)(66476007)(76116006)(64756008)(66446008)(66556008)(52536014)(8676002)(74316002)(5660300002)(316002)(110136005)(8936002)(6246003)(6306002)(54896002)(26005)(33656002)(2906002)(55016002)(53936002)(9686003)(966005)(71190400001)(478600001)(71200400001)(19627405001)(6436002)(236005)(6506007)(53546011)(102836004)(14454004)(11346002)(446003)(186003)(486006)(606006)(66066001)(476003)(81166006)(7736002)(81156014)(105004)(2501003)(6116002)(3846002)(86362001)(229853002)(25786009)(99286004)(14444005)(256004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1699;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: pB03xRnB/LW+XIshjvyvrw1hmKzl8cDh0P6wCzSA0lYakavvpJPm9h61rR6GVbycYz66caCRTOcCDROerDfu57VInv3Wl8Ny9lWx1fQXmwLWR7UPownYzWjDB+K6+aIg0K5PVqBhr1lN4hN3XrfABwuqBy4yYvAye4u+F4CevgyTs9yN4d2hDTl79VAb9w8tQt0zc/WGgTSvPQuk+OZrybNv5bZ+g4Y5Hj/ViHQh2zRT6h8aZR9+DkxDj8V2cqZ43tKBQtWEshjGRKej4J8/4sTaNK5t1p+JXohHtdeloszOQsfhB6RUz13Gfcy6R1IBSNBr0h1G709DEP0ePlmoIxSejgCqsesJ4LuG9j049j2vxrXfZAnCj7SmpSyXEy18EbOcp6jN89kCzNwLqcGogLRd7hW5STwB6XGjR9vEtSA=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f3f4f18-b2e3-4f0c-84dd-08d72aecb963
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2019 12:47:30.5330 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 85mrfvyZ4f+pVK5vcLgTKdv9liDqbURX6XVhOUJntBOEPSsGchIdlPYBBylHod/MKVjb0M5U0l0Mlens+35zrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1699
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=54m9QOjARieIlUZ4+LZxtZEatxSDp3fC3wzJls0tTrU=;
 b=qwu21w/pR8EuHNwnUK8nilj6KXz9/YQTA4Kpr1hIJ/27ZDwdv6v4FYnaYpgzpK27r83dEk3vPJ61j4umyr+znBmA4HLqF8Y1GtaE49US3EDGIbS9uEUsTwr7gWnjYq72RKr2/1pmMnT9bJiYUk6u18yJex/VnrXFcLc2AisOdeA=
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
Content-Type: multipart/mixed; boundary="===============0596583151=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0596583151==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB18091D1C62C178D7D984C8BEF7A00BN6PR12MB1809namp_"

--_000_BN6PR12MB18091D1C62C178D7D984C8BEF7A00BN6PR12MB1809namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Can you update nv.c as well?  With that fixed,
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Monk Liu=
 <Monk.Liu@amd.com>
Sent: Tuesday, August 27, 2019 4:34 AM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Cc: Liu, Monk <Monk.Liu@amd.com>
Subject: [PATCH] drm/amdgpu: introduce vram lost for reset

for SOC15/vega10 the BACO reset & mode1 would introduce vram lost
in high end address range, current kmd's vram lost checking cannot
catch it since it only check very ahead visible frame buffer

Signed-off-by: Monk Liu <Monk.Liu@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h        | 1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 4 ++--
 drivers/gpu/drm/amd/amdgpu/soc15.c         | 2 ++
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdg=
pu/amdgpu.h
index f6ae565..11e0fc0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1155,6 +1155,7 @@ int emu_soc_asic_init(struct amdgpu_device *adev);
 #define amdgpu_asic_get_pcie_usage(adev, cnt0, cnt1) ((adev)->asic_funcs->=
get_pcie_usage((adev), (cnt0), (cnt1)))
 #define amdgpu_asic_need_reset_on_init(adev) (adev)->asic_funcs->need_rese=
t_on_init((adev))
 #define amdgpu_asic_get_pcie_replay_count(adev) ((adev)->asic_funcs->get_p=
cie_replay_count((adev)))
+#define amdgpu_inc_vram_lost(adev) atomic_inc(&((adev)->vram_lost_counter)=
);

 /* Common functions */
 bool amdgpu_device_should_recover_gpu(struct amdgpu_device *adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_device.c
index 02b3e7d..31690e9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3482,7 +3482,7 @@ static int amdgpu_device_reset_sriov(struct amdgpu_de=
vice *adev,
         amdgpu_virt_init_data_exchange(adev);
         amdgpu_virt_release_full_gpu(adev, true);
         if (!r && adev->virt.gim_feature & AMDGIM_FEATURE_GIM_FLR_VRAMLOST=
) {
-               atomic_inc(&adev->vram_lost_counter);
+               amdgpu_inc_vram_lost(adev);
                 r =3D amdgpu_device_recover_vram(adev);
         }

@@ -3648,7 +3648,7 @@ static int amdgpu_do_asic_reset(struct amdgpu_hive_in=
fo *hive,
                                 vram_lost =3D amdgpu_device_check_vram_los=
t(tmp_adev);
                                 if (vram_lost) {
                                         DRM_INFO("VRAM is lost due to GPU =
reset!\n");
-                                       atomic_inc(&tmp_adev->vram_lost_cou=
nter);
+                                       amdgpu_inc_vram_lost(tmp_adev);
                                 }

                                 r =3D amdgpu_gtt_mgr_recover(
diff --git a/drivers/gpu/drm/amd/amdgpu/soc15.c b/drivers/gpu/drm/amd/amdgp=
u/soc15.c
index fe2212df..8af7501 100644
--- a/drivers/gpu/drm/amd/amdgpu/soc15.c
+++ b/drivers/gpu/drm/amd/amdgpu/soc15.c
@@ -557,10 +557,12 @@ static int soc15_asic_reset(struct amdgpu_device *ade=
v)
 {
         switch (soc15_asic_reset_method(adev)) {
                 case AMD_RESET_METHOD_BACO:
+                       amdgpu_inc_vram_lost(adev);
                         return soc15_asic_baco_reset(adev);
                 case AMD_RESET_METHOD_MODE2:
                         return soc15_mode2_reset(adev);
                 default:
+                       amdgpu_inc_vram_lost(adev);
                         return soc15_asic_mode1_reset(adev);
         }
 }
--
2.7.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB18091D1C62C178D7D984C8BEF7A00BN6PR12MB1809namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Can you update nv.c as well?&nbsp; With that fixed,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Reviewed-by: Alex Deucher &lt;alexander.deucher@amd.com&gt;<br>
</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font style=3D"font-size:11pt" face=
=3D"Calibri, sans-serif" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx=
-bounces@lists.freedesktop.org&gt; on behalf of Monk Liu &lt;Monk.Liu@amd.c=
om&gt;<br>
<b>Sent:</b> Tuesday, August 27, 2019 4:34 AM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> Liu, Monk &lt;Monk.Liu@amd.com&gt;<br>
<b>Subject:</b> [PATCH] drm/amdgpu: introduce vram lost for reset</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">for SOC15/vega10 the BACO reset &amp; mode1 would =
introduce vram lost<br>
in high end address range, current kmd's vram lost checking cannot<br>
catch it since it only check very ahead visible frame buffer<br>
<br>
Signed-off-by: Monk Liu &lt;Monk.Liu@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; | 1 &#43;<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 4 &#43;&#43;--<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/soc15.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; | 2 &#43;&#43;<br>
&nbsp;3 files changed, 5 insertions(&#43;), 2 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdg=
pu/amdgpu.h<br>
index f6ae565..11e0fc0 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu.h<br>
@@ -1155,6 &#43;1155,7 @@ int emu_soc_asic_init(struct amdgpu_device *adev)=
;<br>
&nbsp;#define amdgpu_asic_get_pcie_usage(adev, cnt0, cnt1) ((adev)-&gt;asic=
_funcs-&gt;get_pcie_usage((adev), (cnt0), (cnt1)))<br>
&nbsp;#define amdgpu_asic_need_reset_on_init(adev) (adev)-&gt;asic_funcs-&g=
t;need_reset_on_init((adev))<br>
&nbsp;#define amdgpu_asic_get_pcie_replay_count(adev) ((adev)-&gt;asic_func=
s-&gt;get_pcie_replay_count((adev)))<br>
&#43;#define amdgpu_inc_vram_lost(adev) atomic_inc(&amp;((adev)-&gt;vram_lo=
st_counter));<br>
&nbsp;<br>
&nbsp;/* Common functions */<br>
&nbsp;bool amdgpu_device_should_recover_gpu(struct amdgpu_device *adev);<br=
>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_device.c<br>
index 02b3e7d..31690e9 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<br>
@@ -3482,7 &#43;3482,7 @@ static int amdgpu_device_reset_sriov(struct amdgp=
u_device *adev,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_virt_init_data_exch=
ange(adev);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_virt_release_full_g=
pu(adev, true);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!r &amp;&amp; adev-&gt=
;virt.gim_feature &amp; AMDGIM_FEATURE_GIM_FLR_VRAMLOST) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; atomic_inc(&amp;adev-&gt;vram_lost_counter);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; amdgpu_inc_vram_lost(adev);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; r =3D amdgpu_device_recover_vram(adev);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
@@ -3648,7 &#43;3648,7 @@ static int amdgpu_do_asic_reset(struct amdgpu_hiv=
e_info *hive,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vram_lost =3D amdgpu_device_chec=
k_vram_lost(tmp_adev);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (vram_lost) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; DRM_INFO(&quot;VRAM is lost due to GPU reset!\n&quot;);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; atomic_inc(&amp;tmp_adev-&gt;vram_lost_counter);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; amdgpu_inc_vram_lost(tmp_adev);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r =3D amdgpu_gtt_mgr_recover(<br=
>
diff --git a/drivers/gpu/drm/amd/amdgpu/soc15.c b/drivers/gpu/drm/amd/amdgp=
u/soc15.c<br>
index fe2212df..8af7501 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/soc15.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/soc15.c<br>
@@ -557,10 &#43;557,12 @@ static int soc15_asic_reset(struct amdgpu_device =
*adev)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switch (soc15_asic_reset_m=
ethod(adev)) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; case AMD_RESET_METHOD_BACO:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_inc_v=
ram_lost(adev);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; retur=
n soc15_asic_baco_reset(adev);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; case AMD_RESET_METHOD_MODE2:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; retur=
n soc15_mode2_reset(adev);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; default:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_inc_v=
ram_lost(adev);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; retur=
n soc15_asic_mode1_reset(adev);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;}<br>
-- <br>
2.7.4<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a></div>
</span></font></div>
</body>
</html>

--_000_BN6PR12MB18091D1C62C178D7D984C8BEF7A00BN6PR12MB1809namp_--

--===============0596583151==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0596583151==--
