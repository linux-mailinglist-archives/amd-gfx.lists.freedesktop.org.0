Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0179E85A
	for <lists+amd-gfx@lfdr.de>; Tue, 27 Aug 2019 14:50:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BD1789A59;
	Tue, 27 Aug 2019 12:50:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740082.outbound.protection.outlook.com [40.107.74.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D153589A59
 for <amd-gfx@lists.freedesktop.org>; Tue, 27 Aug 2019 12:50:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f/7TcqPgicIWxJujMEjOmLm4H3D+j82NkZgkSxRs4BwxhrL8Ie+LieO+v0/nWcA/AjfsAN3M6V6jAjx1KhojO9lYF3OpaLmKRI8GdIDIqUT+Z86d6gjMAVd4EYoulK7mk/3QgHZsCo311wSghX5aD9lme6g+DH7OlUQsK+fU0SdFwGgr6A/h+JIyOagP3iyVAoKgnoXiDOx3HwjbtNMyCFvgi1an9akXxKCXQCXT0HFgShB8BqQ8dhEpxvisoIhxE49lvWNAq+c98E5gxw488gcY2OWkWgQeI3liqTo/vvpl0wOcbK7b29aiLj2qDc014p6Ut4llIw6bnlY4rv936A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u/PJLyJDco+KQ8Q9DWc2f2Q6o4lYqtiHX5wdIFvZg0k=;
 b=RNZJ9wGW/8NmdF4suz//t8HSkTwkt5qxfyYWqecFWFhjPn1eTh4lZYnIdVp2rpXy9aYAMFlpx5WUi6Aq6TVF3WzNB5KQ79mYN3ZH9UwY++U3nMRJBModAr7GM+zIbQkyf2JfdDp05UZ4d6pzd1CAoLoVLrGqGShsv5NzmrKwdGpOZ8LexCL9SGZwx7sWGWYlF/gJicir+8801mSoID1IZRT9Qc1aodR73V9bahez1w6flh84J/1rtxVb0fjew/G/cLOMO3fiYD1HzlXAJ5S9Lt5b9j2sHMozrrO7tRgBO2PrqBTCtmKpkNI8Z9rdxZhLKiksb+ODWftPoDcujX0BCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1300.namprd12.prod.outlook.com (10.168.226.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Tue, 27 Aug 2019 12:50:47 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::8542:935:262c:53d1]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::8542:935:262c:53d1%10]) with mapi id 15.20.2178.022; Tue, 27 Aug 2019
 12:50:47 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Zhang, Hawking" <Hawking.Zhang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: correct in_suspend setting for navi series
Thread-Topic: [PATCH] drm/amdgpu: correct in_suspend setting for navi series
Thread-Index: AQHVXLihTU7vZfXuNUGVo3rWx2QJoKcO8pj5
Date: Tue, 27 Aug 2019 12:50:47 +0000
Message-ID: <BN6PR12MB18094180CE418090E95AF864F7A00@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <1566897593-2630-1-git-send-email-Hawking.Zhang@amd.com>
In-Reply-To: <1566897593-2630-1-git-send-email-Hawking.Zhang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.219.73.178]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4812ee90-a9f5-41a6-2924-08d72aed2e86
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1300; 
x-ms-traffictypediagnostic: BN6PR12MB1300:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB13007678F20ED2F215054107F7A00@BN6PR12MB1300.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:644;
x-forefront-prvs: 0142F22657
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(396003)(366004)(136003)(376002)(189003)(199004)(99286004)(8936002)(66066001)(53936002)(110136005)(316002)(86362001)(33656002)(6436002)(52536014)(8676002)(81156014)(81166006)(7736002)(74316002)(76116006)(5660300002)(486006)(11346002)(476003)(2906002)(446003)(6506007)(53546011)(186003)(6116002)(478600001)(14454004)(3846002)(66446008)(26005)(14444005)(105004)(76176011)(7696005)(256004)(229853002)(64756008)(66556008)(236005)(54896002)(55016002)(25786009)(9686003)(6306002)(19627405001)(2501003)(71190400001)(71200400001)(6246003)(102836004)(66946007)(66476007)(966005)(606006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1300;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: KdDMddW0F0IMMteHLlkI8DRBvBOxHHcMW69HGr/fRHB0KT7NKrEQGGOCka3mVCStn+2A923pXoQ49e+VwhkwtwYV2zNrGZMiyzvdhJvwP26bzXk18D8M2OXZKJ2WtCza0Vdgo34q/81r3ruiUtPTTWp/3ljHMpKdkogcCuGOTMtsLspwxWA1BpEunkS3bL3/NXJx+6MCcs+QNR5y2C0gnOGy16bsIy08PDu7qoXGEM/l4E5nE9hgJFyUhdimnIS3U3wl3hXCMhKbObbRJc7BHsbhhw04Lv75B75g6x08Lxonxih8Aqt+bucpbgVuKkZGWTprhk9oL6t0CmJNNwW+ZufxfCGsCmYPX9BOVIQYLQNwuatmrQ5HmHIzDQZkc62atxO6ZjDCa83lbOLIoou2Q63EgDVFDhEm0M1SAZImw3Y=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4812ee90-a9f5-41a6-2924-08d72aed2e86
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2019 12:50:47.0695 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6p7n9ihpvtmwpSTeOzKTxxQE2u1e7/zR4Tst3fo8u7XxXvYg/JR2nyVM8SyFWFC09UVhwT2HdZNBTZ+UudS06A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1300
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u/PJLyJDco+KQ8Q9DWc2f2Q6o4lYqtiHX5wdIFvZg0k=;
 b=MY+SWMvgbjkw/ZHxm+h0zHF0ykBXA+QNzFKHRTe7fpoxVbVyhdXKeMnPmyy7PWAQK9O1DohZ4wc3ZQKJGUuEMS6hYExlDlLaa1IKhBxbc3K3HNlXP323R7yDzqcfveWtAgc4MemMl3lNmVoJoXWG3h/QoACkcvPXozrHu9vf/wM=
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
Content-Type: multipart/mixed; boundary="===============0676882736=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0676882736==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB18094180CE418090E95AF864F7A00BN6PR12MB1809namp_"

--_000_BN6PR12MB18094180CE418090E95AF864F7A00BN6PR12MB1809namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Hawking =
Zhang <Hawking.Zhang@amd.com>
Sent: Tuesday, August 27, 2019 5:19 AM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Cc: Zhang, Hawking <Hawking.Zhang@amd.com>
Subject: [PATCH] drm/amdgpu: correct in_suspend setting for navi series

in_suspend flag should be set in amdgpu_device_suspend/resume in pairs,
instead of gfx10 ip suspend/resume function.

Signed-off-by: Hawking Zhang <Hawking.Zhang@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/a=
mdgpu/gfx_v10_0.c
index f708912..a2f4ff1 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
@@ -3768,20 +3768,12 @@ static int gfx_v10_0_hw_fini(void *handle)

 static int gfx_v10_0_suspend(void *handle)
 {
-       struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
-
-       adev->in_suspend =3D true;
-       return gfx_v10_0_hw_fini(adev);
+       return gfx_v10_0_hw_fini(handle);
 }

 static int gfx_v10_0_resume(void *handle)
 {
-       struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
-       int r;
-
-       r =3D gfx_v10_0_hw_init(adev);
-       adev->in_suspend =3D false;
-       return r;
+       return gfx_v10_0_hw_init(handle);
 }

 static bool gfx_v10_0_is_idle(void *handle)
--
2.7.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB18094180CE418090E95AF864F7A00BN6PR12MB1809namp_
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
ounces@lists.freedesktop.org&gt; on behalf of Hawking Zhang &lt;Hawking.Zha=
ng@amd.com&gt;<br>
<b>Sent:</b> Tuesday, August 27, 2019 5:19 AM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> Zhang, Hawking &lt;Hawking.Zhang@amd.com&gt;<br>
<b>Subject:</b> [PATCH] drm/amdgpu: correct in_suspend setting for navi ser=
ies</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">in_suspend flag should be set in amdgpu_device_sus=
pend/resume in pairs,<br>
instead of gfx10 ip suspend/resume function.<br>
<br>
Signed-off-by: Hawking Zhang &lt;Hawking.Zhang@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 12 &#43;&#43;----------<br>
&nbsp;1 file changed, 2 insertions(&#43;), 10 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/a=
mdgpu/gfx_v10_0.c<br>
index f708912..a2f4ff1 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c<br>
@@ -3768,20 &#43;3768,12 @@ static int gfx_v10_0_hw_fini(void *handle)<br>
&nbsp;<br>
&nbsp;static int gfx_v10_0_suspend(void *handle)<br>
&nbsp;{<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_device *adev =3D (struc=
t amdgpu_device *)handle;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;in_suspend =3D true;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return gfx_v10_0_hw_fini(adev);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return gfx_v10_0_hw_fini(handle);=
<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;static int gfx_v10_0_resume(void *handle)<br>
&nbsp;{<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_device *adev =3D (struc=
t amdgpu_device *)handle;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int r;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r =3D gfx_v10_0_hw_init(adev);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;in_suspend =3D false;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return r;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return gfx_v10_0_hw_init(handle);=
<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;static bool gfx_v10_0_is_idle(void *handle)<br>
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

--_000_BN6PR12MB18094180CE418090E95AF864F7A00BN6PR12MB1809namp_--

--===============0676882736==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0676882736==--
