Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB181CA08
	for <lists+amd-gfx@lfdr.de>; Tue, 14 May 2019 16:06:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B765891B7;
	Tue, 14 May 2019 14:06:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760087.outbound.protection.outlook.com [40.107.76.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F221891B7
 for <amd-gfx@lists.freedesktop.org>; Tue, 14 May 2019 14:06:39 +0000 (UTC)
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1459.namprd12.prod.outlook.com (10.172.23.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.20; Tue, 14 May 2019 14:06:37 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::bc5b:de68:25b7:d853]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::bc5b:de68:25b7:d853%12]) with mapi id 15.20.1878.024; Tue, 14 May
 2019 14:06:37 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Zhou, Tiecheng" <Tiecheng.Zhou@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu/sriov: Need to initialize the
 HDP_NONSURFACE_BAStE
Thread-Topic: [PATCH] drm/amdgpu/sriov: Need to initialize the
 HDP_NONSURFACE_BAStE
Thread-Index: AQHVCgYUjtTYwFvmmUK6KdGGzSmlJaZqqFGM
Date: Tue, 14 May 2019 14:06:37 +0000
Message-ID: <BN6PR12MB1809481DE2A96AEBDC292167F7080@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <1557804896-4032-1-git-send-email-Tiecheng.Zhou@amd.com>
In-Reply-To: <1557804896-4032-1-git-send-email-Tiecheng.Zhou@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.219.84.143]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: baefb34a-3c00-477e-4a75-08d6d8756148
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1459; 
x-ms-traffictypediagnostic: BN6PR12MB1459:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN6PR12MB145936D28BF89C0441286F2AF7080@BN6PR12MB1459.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-forefront-prvs: 0037FD6480
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(366004)(136003)(346002)(376002)(396003)(199004)(189003)(476003)(11346002)(478600001)(256004)(5660300002)(71190400001)(52536014)(68736007)(66446008)(66946007)(4326008)(25786009)(486006)(71200400001)(64756008)(66476007)(66556008)(105004)(14454004)(110136005)(8936002)(186003)(316002)(6306002)(54896002)(76116006)(74316002)(73956011)(966005)(55016002)(81156014)(446003)(72206003)(6246003)(81166006)(7736002)(26005)(53936002)(8676002)(9686003)(236005)(7696005)(3846002)(6506007)(6436002)(229853002)(53546011)(86362001)(19627405001)(66066001)(6116002)(76176011)(99286004)(2501003)(2906002)(33656002)(606006)(102836004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1459;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: oIKVZq9lY6oDfA0G5y58g4rtQwIungjbkKPY6OKfZfj/Cgd0UfV8RcgzR+PFpTF0qU+M0g4cvCUpNiA0WybJoD1gSRkazu4PJyv82bI/UU/g6c0VhMtF2X3u0bH3rgO/pu14uLjCNV18ri1be1p6k/mJt62UiR9F30T6JkttSl4IZs7X4D2fs45LzMmsXsMFcEUDECrKh5P6gL0tAmt6N1HkD/cBvLcoXKVaodIj1H5C099puyxsqS/DuLLyp7VyIkkgW2j91MtscN+JQSN5NRTLpFhIwijCF2lqF40zOaqSmuXJ6upO/20KdHRdU4cu8roptd84BS8lDEjPK7Fdngs+x6lUezY2iZqfZWMBWw479iDoJjUvU8sbkdn3oT6oTcjpZOdgm7RW+fGY7su8r5ldtF3f9iS1RCx8RljNjmk=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: baefb34a-3c00-477e-4a75-08d6d8756148
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2019 14:06:37.2723 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1459
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G0Ti1vL5on1x8UebfwVulcWGWiQS7QU43RzjQPQ8SL0=;
 b=oJh9jbuNlrpPXd9iTQ9YIc9GTiIrMIEs6sh8pHiyp45aL2gbcd3MGpdEjWJd4DvXYcZt3QX/9mMdF4vu0Ha/89JQtXKaCTVpPZ1Q1AV1/N397aHUmq5iXhVPCGSM3S2YuKuGJI3BrsO15ANsCdIxycszyF0e3iwvmBg7QdukQ9k=
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
Cc: "Deng, Emily" <Emily.Deng@amd.com>
Content-Type: multipart/mixed; boundary="===============1173365142=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1173365142==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB1809481DE2A96AEBDC292167F7080BN6PR12MB1809namp_"

--_000_BN6PR12MB1809481DE2A96AEBDC292167F7080BN6PR12MB1809namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Tiecheng=
 Zhou <Tiecheng.Zhou@amd.com>
Sent: Monday, May 13, 2019 11:34 PM
To: amd-gfx@lists.freedesktop.org
Cc: Zhou, Tiecheng; Deng, Emily
Subject: [PATCH] drm/amdgpu/sriov: Need to initialize the HDP_NONSURFACE_BA=
StE

[CAUTION: External Email]

it requires to initialize HDP_NONSURFACE_BASE, so as to avoid
using the value left by a previous VM under sriov scenario.

Signed-off-by: Emily Deng <Emily.Deng@amd.com>
Signed-off-by: Tiecheng Zhou <Tiecheng.Zhou@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c b/drivers/gpu/drm/amd/am=
dgpu/gmc_v9_0.c
index be729e7..e96684e 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
@@ -1181,6 +1181,11 @@ static int gmc_v9_0_gart_enable(struct amdgpu_device=
 *adev)
        tmp =3D RREG32_SOC15(HDP, 0, mmHDP_HOST_PATH_CNTL);
        WREG32_SOC15(HDP, 0, mmHDP_HOST_PATH_CNTL, tmp);

+       if (amdgpu_sriov_vf(adev)) {
+               WREG32_SOC15(HDP, 0, mmHDP_NONSURFACE_BASE, (adev->gmc.vram=
_start >> 8));
+               WREG32_SOC15(HDP, 0, mmHDP_NONSURFACE_BASE_HI, (adev->gmc.v=
ram_start >> 40));
+       }
+
        /* After HDP is initialized, flush HDP.*/
        adev->nbio_funcs->hdp_flush(adev, NULL);

--
2.7.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB1809481DE2A96AEBDC292167F7080BN6PR12MB1809namp_
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
Reviewed-by: Alex Deucher &lt;alexander.deucher@amd.com&gt;<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Tiecheng Zhou &lt;Tiecheng.Zh=
ou@amd.com&gt;<br>
<b>Sent:</b> Monday, May 13, 2019 11:34 PM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org<br>
<b>Cc:</b> Zhou, Tiecheng; Deng, Emily<br>
<b>Subject:</b> [PATCH] drm/amdgpu/sriov: Need to initialize the HDP_NONSUR=
FACE_BAStE</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">[CAUTION: External Email]<br>
<br>
it requires to initialize HDP_NONSURFACE_BASE, so as to avoid<br>
using the value left by a previous VM under sriov scenario.<br>
<br>
Signed-off-by: Emily Deng &lt;Emily.Deng@amd.com&gt;<br>
Signed-off-by: Tiecheng Zhou &lt;Tiecheng.Zhou@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c | 5 &#43;&#43;&#43;&#43;&#43;<b=
r>
&nbsp;1 file changed, 5 insertions(&#43;)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c b/drivers/gpu/drm/amd/am=
dgpu/gmc_v9_0.c<br>
index be729e7..e96684e 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c<br>
@@ -1181,6 &#43;1181,11 @@ static int gmc_v9_0_gart_enable(struct amdgpu_de=
vice *adev)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tmp =3D RREG32_SOC15(HDP, 0, mmH=
DP_HOST_PATH_CNTL);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WREG32_SOC15(HDP, 0, mmHDP_HOST_=
PATH_CNTL, tmp);<br>
<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (amdgpu_sriov_vf(adev)) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; WREG32_SOC15(HDP, 0, mmHDP_NONSURFACE_BASE, (adev-&gt;gmc.vr=
am_start &gt;&gt; 8));<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; WREG32_SOC15(HDP, 0, mmHDP_NONSURFACE_BASE_HI, (adev-&gt;gmc=
.vram_start &gt;&gt; 40));<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* After HDP is initialized, flu=
sh HDP.*/<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;nbio_funcs-&gt;hdp_flus=
h(adev, NULL);<br>
<br>
--<br>
2.7.4<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a><br>
</div>
</span></font></div>
</body>
</html>

--_000_BN6PR12MB1809481DE2A96AEBDC292167F7080BN6PR12MB1809namp_--

--===============1173365142==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1173365142==--
