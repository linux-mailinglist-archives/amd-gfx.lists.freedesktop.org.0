Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4579F8AD
	for <lists+amd-gfx@lfdr.de>; Wed, 28 Aug 2019 05:20:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC0558997A;
	Wed, 28 Aug 2019 03:20:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820054.outbound.protection.outlook.com [40.107.82.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76ACB8997A
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Aug 2019 03:20:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hecjLRXNi0mDCQXczLc/nb1IJ9mD8BQ1DXp8h8fXJZcu5NVOF54OUCtxaA2o4tOjdrhB753Xyhg47C244gO95mqLSiKNnGucToPa+4cYLB3V38yaCc2PABMHkOCevENYMTLIA7WacttIa4tKVcTsWKUXt+I8LvMkFJaXXV+6xGcubKZm9kUpxBBqLtydhgsA8vw7E5Fw0MiNvo++RlOFhNS9gz6jecsK7rS1Ujh6OV9ZAWph0eXVkwD/4kSnOCI3OAYeWDItt588uN8TQLc9PgojhgjzP+Nkqzjt2RdDyezszZ6SkETDQ5z1vjZ1NcRbwUJmhw4SSZCbOLEYssoXBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D6NTksY0ZoNY9dFnfGFLi2wUtMYLp1aDlhDFQqzIlE8=;
 b=RK9hptyhEG5JinbyPubSW1qSrXcp8k1y1YIPqj8Ue+tWBMApll8c2MqUKaDjqJ15jEsO4YxLBHUr4nSYOKVqPq8AuSyxtD3qe0pjTjW1ybpgHK2rFFqXt1MI/5Fq1yfB7UwmqBXiI4SG4a0C3rkOCLqjzp4NLXB9F5atpXx7vIyKor7EJsG7mEBVJLI3TBRIwZedpHrrS9LaeASxRkue+Ek+bvOLMLOP/ElVAqW2nD0ioVDetwur0plBQk23kvKKQOx4N2I/M+JbKBxF09DFUG3Vd6HQkAYQ2RiND/eWJZV7TGFH+J6B5xJXnUmcDpB/xrtOi385R+opLOUKOcXnVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3933.namprd12.prod.outlook.com (10.255.238.94) by
 MN2PR12MB3725.namprd12.prod.outlook.com (10.255.236.78) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Wed, 28 Aug 2019 03:20:33 +0000
Received: from MN2PR12MB3933.namprd12.prod.outlook.com
 ([fe80::a97f:16f2:ddb4:87f9]) by MN2PR12MB3933.namprd12.prod.outlook.com
 ([fe80::a97f:16f2:ddb4:87f9%6]) with mapi id 15.20.2199.021; Wed, 28 Aug 2019
 03:20:33 +0000
From: "Liu, Monk" <Monk.Liu@amd.com>
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: introduce vram lost for reset
Thread-Topic: [PATCH] drm/amdgpu: introduce vram lost for reset
Thread-Index: AQHVXLJGPronJ5wEIUa1qeMifhLYiacO8cgAgADz6eA=
Date: Wed, 28 Aug 2019 03:20:33 +0000
Message-ID: <MN2PR12MB3933D4FDF94F67E35E00CCDD84A30@MN2PR12MB3933.namprd12.prod.outlook.com>
References: <1566894873-11178-1-git-send-email-Monk.Liu@amd.com>
 <BN6PR12MB18091D1C62C178D7D984C8BEF7A00@BN6PR12MB1809.namprd12.prod.outlook.com>
In-Reply-To: <BN6PR12MB18091D1C62C178D7D984C8BEF7A00@BN6PR12MB1809.namprd12.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 92f977dd-faa7-4fd0-7ce9-08d72b66afca
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(49563074)(7193020);
 SRVR:MN2PR12MB3725; 
x-ms-traffictypediagnostic: MN2PR12MB3725:
x-ms-exchange-purlcount: 3
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB372552D82DB2A599FC47457C84A30@MN2PR12MB3725.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 014304E855
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(366004)(396003)(346002)(376002)(199004)(189003)(6246003)(11346002)(76176011)(6306002)(446003)(6436002)(5660300002)(99936001)(52536014)(99286004)(33656002)(486006)(316002)(6506007)(25786009)(9686003)(236005)(14444005)(256004)(2501003)(606006)(2906002)(54896002)(54556002)(7696005)(53936002)(476003)(66066001)(102836004)(81166006)(229853002)(186003)(478600001)(966005)(8676002)(110136005)(81156014)(733005)(86362001)(71190400001)(76116006)(26005)(66446008)(64756008)(66556008)(66476007)(66616009)(6116002)(14454004)(790700001)(3846002)(74316002)(7736002)(8936002)(66946007)(71200400001)(55016002)(53546011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3725;
 H:MN2PR12MB3933.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: hBFX7xA2Oja8jSJpEMjXwE5AGNncKpIFEhAYzM+cHkyWI4kcioVTZxSIFFwASoFqw7Kd8VxhQrxc7p9SRE8+rFrg8V2jgnnnEUpKgyaM/2xxEHhcpTzBSOSZktjka1how8NcY9rsc7YFK8W6T1KaNnNsHikUYqbdnFlATE1uoOg8fxPG1IlqNm69NWipY/Cw+I7HEOMYashbZu7+S1UuLItIJ9Gk3YbIIU2sOhN+EpUM4yeOYMg2okQ3lB5dG3U+C3DYe1JytqX85QhsIFg6FX16OZEqlyoJoEQRhs+QX2NYHROZKb/mCmH6TpFylZe3AwGSBJUMJwxCkj/1pokuCPesOyep7aTIdugvzJ6BEs5kRt69A9Jz1BJepZAKRyNuuVEabUcDg6D0Y7yjkpQKE1zpHNS010K8Ge1cSZmKMSA=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92f977dd-faa7-4fd0-7ce9-08d72b66afca
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2019 03:20:33.0397 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4h91Nu8pj1WQ6Zs5ZqOmPvrPe7ipMo+AXXZ2kCcdhBvfNtkwNcbC969rlYuzHQyq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3725
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D6NTksY0ZoNY9dFnfGFLi2wUtMYLp1aDlhDFQqzIlE8=;
 b=wpag10cKIuFT+Qv0Lxfig5I5UPELYXZIi1YF0fG8B+i7OLUWi16GGPetOmi2gDPaKR5G485ZBBib0BCURgLQvzEPy+HEp6c70NNUJaZC7GsPsOJQCTvGd8FvLva6OP6tJmXVknBGFF2n4TPjBaThxktzy4gkjn+WGo8s6XCACqY=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Monk.Liu@amd.com; 
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
Content-Type: multipart/mixed; boundary="===============0184043760=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0184043760==
Content-Language: en-US
Content-Type: multipart/related;
	boundary="_004_MN2PR12MB3933D4FDF94F67E35E00CCDD84A30MN2PR12MB3933namp_";
	type="multipart/alternative"

--_004_MN2PR12MB3933D4FDF94F67E35E00CCDD84A30MN2PR12MB3933namp_
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB3933D4FDF94F67E35E00CCDD84A30MN2PR12MB3933namp_"

--_000_MN2PR12MB3933D4FDF94F67E35E00CCDD84A30MN2PR12MB3933namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

sure

_____________________________________
Monk Liu|GPU Virtualization Team |AMD
[sig-cloud-gpu]

From: Deucher, Alexander <Alexander.Deucher@amd.com>
Sent: Tuesday, August 27, 2019 8:48 PM
To: Liu, Monk <Monk.Liu@amd.com>; amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH] drm/amdgpu: introduce vram lost for reset

Can you update nv.c as well?  With that fixed,
Reviewed-by: Alex Deucher <alexander.deucher@amd.com<mailto:alexander.deuch=
er@amd.com>>

________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org<mailto:amd-gfx-bounces=
@lists.freedesktop.org>> on behalf of Monk Liu <Monk.Liu@amd.com<mailto:Mon=
k.Liu@amd.com>>
Sent: Tuesday, August 27, 2019 4:34 AM
To: amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org> <am=
d-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>>
Cc: Liu, Monk <Monk.Liu@amd.com<mailto:Monk.Liu@amd.com>>
Subject: [PATCH] drm/amdgpu: introduce vram lost for reset

for SOC15/vega10 the BACO reset & mode1 would introduce vram lost
in high end address range, current kmd's vram lost checking cannot
catch it since it only check very ahead visible frame buffer

Signed-off-by: Monk Liu <Monk.Liu@amd.com<mailto:Monk.Liu@amd.com>>
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
amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_MN2PR12MB3933D4FDF94F67E35E00CCDD84A30MN2PR12MB3933namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle20
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.25in 1.0in 1.25in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">sure<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal">_____________________________________<o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black;backgrou=
nd:white">Monk Liu|GPU Virtualization Team |</span><span style=3D"font-size=
:12.0pt;color:#C82613;border:none windowtext 1.0pt;padding:0in;background:w=
hite">AMD<o:p></o:p></span></p>
<p class=3D"MsoNormal"><img width=3D"80" height=3D"80" style=3D"width:.8333=
in;height:.8333in" id=3D"Picture_x0020_1" src=3D"cid:image001.png@01D55D92.=
9A07ABA0" alt=3D"sig-cloud-gpu"><o:p></o:p></p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b>From:</b> Deucher, Alexander &lt;Alexander.Deuche=
r@amd.com&gt; <br>
<b>Sent:</b> Tuesday, August 27, 2019 8:48 PM<br>
<b>To:</b> Liu, Monk &lt;Monk.Liu@amd.com&gt;; amd-gfx@lists.freedesktop.or=
g<br>
<b>Subject:</b> Re: [PATCH] drm/amdgpu: introduce vram lost for reset<o:p><=
/o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">Can you=
 update nv.c as well?&nbsp; With that fixed,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">Reviewe=
d-by: Alex Deucher &lt;<a href=3D"mailto:alexander.deucher@amd.com">alexand=
er.deucher@amd.com</a>&gt;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
</div>
<div class=3D"MsoNormal" align=3D"center" style=3D"text-align:center">
<hr size=3D"3" width=3D"98%" align=3D"center">
</div>
<div id=3D"divRplyFwdMsg">
<p class=3D"MsoNormal"><b><span style=3D"color:black">From:</span></b><span=
 style=3D"color:black"> amd-gfx &lt;<a href=3D"mailto:amd-gfx-bounces@lists=
.freedesktop.org">amd-gfx-bounces@lists.freedesktop.org</a>&gt; on behalf o=
f Monk Liu &lt;<a href=3D"mailto:Monk.Liu@amd.com">Monk.Liu@amd.com</a>&gt;=
<br>
<b>Sent:</b> Tuesday, August 27, 2019 4:34 AM<br>
<b>To:</b> <a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.f=
reedesktop.org</a> &lt;<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd=
-gfx@lists.freedesktop.org</a>&gt;<br>
<b>Cc:</b> Liu, Monk &lt;<a href=3D"mailto:Monk.Liu@amd.com">Monk.Liu@amd.c=
om</a>&gt;<br>
<b>Subject:</b> [PATCH] drm/amdgpu: introduce vram lost for reset</span> <o=
:p></o:p></p>
<div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
</div>
<div>
<div>
<p class=3D"MsoNormal">for SOC15/vega10 the BACO reset &amp; mode1 would in=
troduce vram lost<br>
in high end address range, current kmd's vram lost checking cannot<br>
catch it since it only check very ahead visible frame buffer<br>
<br>
Signed-off-by: Monk Liu &lt;<a href=3D"mailto:Monk.Liu@amd.com">Monk.Liu@am=
d.com</a>&gt;<br>
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
<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.=
org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a><o:p></o:p></p>
</div>
</div>
</div>
</body>
</html>

--_000_MN2PR12MB3933D4FDF94F67E35E00CCDD84A30MN2PR12MB3933namp_--

--_004_MN2PR12MB3933D4FDF94F67E35E00CCDD84A30MN2PR12MB3933namp_
Content-Type: image/png; name="image001.png"
Content-Description: image001.png
Content-Disposition: inline; filename="image001.png"; size=12243;
	creation-date="Wed, 28 Aug 2019 03:20:32 GMT";
	modification-date="Wed, 28 Aug 2019 03:20:32 GMT"
Content-ID: <image001.png@01D55D92.9A07ABA0>
Content-Transfer-Encoding: base64

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

--_004_MN2PR12MB3933D4FDF94F67E35E00CCDD84A30MN2PR12MB3933namp_--

--===============0184043760==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0184043760==--
