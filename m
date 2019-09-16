Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15AA6B3F89
	for <lists+amd-gfx@lfdr.de>; Mon, 16 Sep 2019 19:18:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91DCF6EA0D;
	Mon, 16 Sep 2019 17:18:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710084.outbound.protection.outlook.com [40.107.71.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 386116EA0A
 for <amd-gfx@lists.freedesktop.org>; Mon, 16 Sep 2019 17:18:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EGDwNsCF7j5U1auref8/84LpzRaaOC7xNgqy8be576bgQY+edZyENSinMzMfRibvSJATeHJJZ6sIP7r0WBtp/JS9fJvLD5UlU4df/05wRN7nYsVdb10IGZckmLg3aDnPYxcoHAioszYBE0A81traNDFkaxJewg6wsGIeGicAvxWty23MJO7qZAU50/temeM4/8jy/hDT3cD0xrRJZ+Jfuaxppir8OVOz83uCls0iyunS4LcLopmhEG8Ci49A5oBWtcRiA/jAu2CSmB1euymm89z1C8jldWce0f+iz9Nd331I7TcrWTmDbB5um16mLtpria0FugKwoq+PwXxgtkB8/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Xi5sy+FP+ZEUN+0NoDjgAvRubYoadoe4odj4wm17Os=;
 b=X005ZmW0VO+ZfMhS1ntp0iXcwMJW6XZ89FI+gB06l4zIeh/MtgPT5Da2nKW0su/knN4lTAJmhopBaKoljUVl3M4LzsfEOTKORUT3eOW5iYHmieO0MyCfJQkirC1WDi1UemMgCCdNpcXpQrMRVJAixbrOaigNQyF8PEiD5bXHLuGDTGYUC4HA9lw99OLvUPjnSnqyfs1Be7fMavMm0yTYm2GcfVjNiwz1pj0JrXAgqoQsKS5KWFNsdeHIyiDDW6dxDT5aadQqdYNDZ1nePG7uZlT+h76aLiqtxSbQdRtavHOUePncWGk7d7buXFrH3j/cX//cDqMgYIO6UZV/Hj0Esg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1380.namprd12.prod.outlook.com (10.168.228.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.17; Mon, 16 Sep 2019 17:17:59 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::a930:a648:d4d2:d25c]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::a930:a648:d4d2:d25c%12]) with mapi id 15.20.2263.023; Mon, 16 Sep
 2019 17:17:59 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Zhao, Yong" <Yong.Zhao@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdkfd: Delete unused KFD_IS_* macro
Thread-Topic: [PATCH] drm/amdkfd: Delete unused KFD_IS_* macro
Thread-Index: AQHVbKxqAZyQIFcNBEuqzE/XNaiBQ6cui/iV
Date: Mon, 16 Sep 2019 17:17:59 +0000
Message-ID: <BN6PR12MB180907451FEEBA228184C0A0F78C0@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <20190916163252.23684-1-Yong.Zhao@amd.com>
In-Reply-To: <20190916163252.23684-1-Yong.Zhao@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.56.28.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 366a1989-af1d-4d25-8f3f-08d73ac9d2bd
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1380; 
x-ms-traffictypediagnostic: BN6PR12MB1380:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB13806D46DB3D3E75CF643045F78C0@BN6PR12MB1380.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:178;
x-forefront-prvs: 0162ACCC24
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(376002)(136003)(346002)(396003)(189003)(199004)(66476007)(66556008)(14454004)(966005)(606006)(11346002)(446003)(102836004)(476003)(486006)(2501003)(33656002)(99286004)(186003)(71200400001)(71190400001)(26005)(105004)(478600001)(2906002)(86362001)(7696005)(256004)(5660300002)(25786009)(76176011)(14444005)(6116002)(3846002)(6436002)(6506007)(53936002)(74316002)(110136005)(53546011)(19627405001)(6246003)(55016002)(229853002)(66066001)(316002)(7736002)(9686003)(54896002)(6306002)(236005)(8676002)(81156014)(81166006)(8936002)(52536014)(66946007)(76116006)(64756008)(66446008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1380;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: wXUUovwuLt45quISTP9nIwepX6Y3ySOmLpGuQhjE5TsF3iKdoCDvDPdJ9OpFatBh3IVMRrvjXhEVPoEOgN9MzYk4vQExWMrckQJY4n6YWJDwrtyIe93AU3v9hYIdZwt5XFT84xTWZFI5D6uoButjBbcuYHQKW9yl1ewqhyTLgCMH98C1g17z1VVXv5h+oVB8ZG044TfumZKeyh0wmnfmSPvyx7uB35rGThdZ8I1fN17jZfQXJmrb2F5u51gpk6rnCgtIlRsYLnVaYbg06MiDLlPzZFSzQYQedOm9vW+fc0Pq/Muve+/Vr3Ul4gHBvywJy9DykcKWRACIohlc/MIfuZiVIuwQbjvAnzTpGIiqkhFFeEp4L63tHfVxi4BDXSiqRN67H9XgOAyjI2hVmz683RBmFzrxJyQ0EGYAgi1ULMs=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 366a1989-af1d-4d25-8f3f-08d73ac9d2bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2019 17:17:59.3590 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aqUL1z6zc/ZtxFIPAdZLJY8JgAnO3xVbFx0kuwe2sH2OgBlxuycRByDtyh/jQSh3rEQmEzodhKb4ji/f7V2Ctw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1380
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Xi5sy+FP+ZEUN+0NoDjgAvRubYoadoe4odj4wm17Os=;
 b=T/Hd1Knpl31OllwdO32CXfVZX323nmK1vX/sU28AtxcZM9b0mxikP420TGHCwOU3R3pPXn1E9URMZg/SVwt+tufsfkajPyBEbqvhKX7tPq4VxWT0YMgHTyMR/53M3Fbbmot3o6UJTyT8bu4TNKl8A5lQmip52+IHZJnczSdGRh0=
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
Content-Type: multipart/mixed; boundary="===============0433028402=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0433028402==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB180907451FEEBA228184C0A0F78C0BN6PR12MB1809namp_"

--_000_BN6PR12MB180907451FEEBA228184C0A0F78C0BN6PR12MB1809namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Alex Deucher <alexander.deucher@amd.com>
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Zhao, Yo=
ng <Yong.Zhao@amd.com>
Sent: Monday, September 16, 2019 12:33 PM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Cc: Zhao, Yong <Yong.Zhao@amd.com>
Subject: [PATCH] drm/amdkfd: Delete unused KFD_IS_* macro

These were deleted before, but somehow showed up again. Delete them again.

Change-Id: I19b3063932380cb74a01d505e8e92f897a2c2cb7
Signed-off-by: Yong Zhao <Yong.Zhao@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/am=
dkfd/kfd_priv.h
index 06bb2d7a9b39..0773dc4df4ff 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -179,10 +179,6 @@ enum cache_policy {
         cache_policy_noncoherent
 };

-#define KFD_IS_VI(chip) ((chip) >=3D CHIP_CARRIZO && (chip) <=3D CHIP_POLA=
RIS11)
-#define KFD_IS_DGPU(chip) (((chip) >=3D CHIP_TONGA && \
-                          (chip) <=3D CHIP_NAVI10) || \
-                          (chip) =3D=3D CHIP_HAWAII)
 #define KFD_IS_SOC15(chip) ((chip) >=3D CHIP_VEGA10)

 struct kfd_event_interrupt_class {
--
2.17.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB180907451FEEBA228184C0A0F78C0BN6PR12MB1809namp_
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
Acked-by: Alex Deucher &lt;alexander.deucher@amd.com&gt;<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Zhao, Yong &lt;Yong.Zhao@amd.=
com&gt;<br>
<b>Sent:</b> Monday, September 16, 2019 12:33 PM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> Zhao, Yong &lt;Yong.Zhao@amd.com&gt;<br>
<b>Subject:</b> [PATCH] drm/amdkfd: Delete unused KFD_IS_* macro</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">These were deleted before, but somehow showed up a=
gain. Delete them again.<br>
<br>
Change-Id: I19b3063932380cb74a01d505e8e92f897a2c2cb7<br>
Signed-off-by: Yong Zhao &lt;Yong.Zhao@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdkfd/kfd_priv.h | 4 ----<br>
&nbsp;1 file changed, 4 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/am=
dkfd/kfd_priv.h<br>
index 06bb2d7a9b39..0773dc4df4ff 100644<br>
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h<br>
@@ -179,10 &#43;179,6 @@ enum cache_policy {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cache_policy_noncoherent<b=
r>
&nbsp;};<br>
&nbsp;<br>
-#define KFD_IS_VI(chip) ((chip) &gt;=3D CHIP_CARRIZO &amp;&amp; (chip) &lt=
;=3D CHIP_POLARIS11)<br>
-#define KFD_IS_DGPU(chip) (((chip) &gt;=3D CHIP_TONGA &amp;&amp; \<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; (chip) &lt;=3D CHIP_NAVI10) || \<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; (chip) =3D=3D CHIP_HAWAII)<br>
&nbsp;#define KFD_IS_SOC15(chip) ((chip) &gt;=3D CHIP_VEGA10)<br>
&nbsp;<br>
&nbsp;struct kfd_event_interrupt_class {<br>
-- <br>
2.17.1<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a></div>
</span></font></div>
</body>
</html>

--_000_BN6PR12MB180907451FEEBA228184C0A0F78C0BN6PR12MB1809namp_--

--===============0433028402==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0433028402==--
