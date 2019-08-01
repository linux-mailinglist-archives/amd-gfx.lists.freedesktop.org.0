Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 507147DF97
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 17:59:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD03F89141;
	Thu,  1 Aug 2019 15:59:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810089.outbound.protection.outlook.com [40.107.81.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA52E890FF
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Aug 2019 15:59:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IwQfwAlnKXytTNV9lsyc+7/sYX38/lP9V1RLxxY7lt16+G8nAFRUbVedOhoL/JT0DZl1s/lp9I0l6LE0CFntKdfRtHU4HmlMtThvL7f1FPpbhqnnosUXFqNrXuMeWeaKFuuKbFDvb3+pETTBePUwySp8Vei8n0vaUBS5/gHQJy9lNZkwnFYR6p7K+SRe+OPo3pNCLEqLgcbeb+10cokaoJQoQSLGVr/oI/oJLmdS06/mkzKV44dl1Y1suhO9A27L96vah0lV2FJMd+ITEdmDMkAtfNEBTqCpebYq/rq2hXsNYff/aP1GVOO5uZRjhGM0UE5r78SMIvYRbhZnL2CLvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z+u9uiYX2qv6hzsc9S8XGfCKmZLOBDuhaUSMAT3DezY=;
 b=gVwHJkh3rHE2o2EaA6InFVN9Oizhl4h3o3u+NdOi00+ywiHDpy28h0O5KbGq9ylg4PTJSv4cpvSJVVXH+XhP1QtRN8lrFfvSfIGk/dc0vY6KM1PyNArU52Tp4vzgmsxa+jClu5DmE5UPD08+nL7S0v351Jg4o9dzBNFyR2khPoyzPFX77fiOX9LncwHdAbJ87GuACe4M4qV/Wc+lWLER0DEnlm/l0J038rTTbm3g8wXuj8S8tSGMNhz5kJGgkko3+zQ6KivGbit4Tj0vKyzFNZc9YFdkNxdXktA3N0op8aHrJbRP2O+r5X3J/jOyGNLDk6Xi9wu9NdhzjopYRafK6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1219.namprd12.prod.outlook.com (10.168.227.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.15; Thu, 1 Aug 2019 15:59:22 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::b90e:dd82:7384:5b7b]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::b90e:dd82:7384:5b7b%11]) with mapi id 15.20.2094.017; Thu, 1 Aug 2019
 15:59:22 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: Add amdgpu_asic_funcs.reset_method for Vega20
Thread-Topic: [PATCH] drm/amdgpu: Add amdgpu_asic_funcs.reset_method for Vega20
Thread-Index: AQHVSIBsJDodYYEu9E2W5+oBSwthpabmcxbK
Date: Thu, 1 Aug 2019 15:59:22 +0000
Message-ID: <BN6PR12MB18093A43BFCFF3D34D5B29E2F7DE0@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <1564674424-32642-1-git-send-email-andrey.grodzovsky@amd.com>
In-Reply-To: <1564674424-32642-1-git-send-email-andrey.grodzovsky@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.219.6.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1cf3dce0-b32d-476b-33a2-08d71699382f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1219; 
x-ms-traffictypediagnostic: BN6PR12MB1219:
x-microsoft-antispam-prvs: <BN6PR12MB12190F46BDC421143841F65AF7DE0@BN6PR12MB1219.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:428;
x-forefront-prvs: 01165471DB
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(396003)(366004)(346002)(136003)(199004)(189003)(66556008)(66446008)(54896002)(64756008)(86362001)(256004)(66946007)(99286004)(74316002)(486006)(6506007)(71200400001)(66066001)(7736002)(53936002)(55016002)(11346002)(76176011)(76116006)(446003)(52536014)(2906002)(476003)(105004)(66476007)(9686003)(68736007)(14454004)(8676002)(6246003)(81156014)(6116002)(25786009)(316002)(478600001)(71190400001)(8936002)(6436002)(186003)(53546011)(3846002)(229853002)(2501003)(81166006)(5660300002)(33656002)(110136005)(26005)(7696005)(102836004)(19627405001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1219;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: MZJX7/63D/prOha2LC3U4osNQFAfVoD3P1d1ZV8MazTsBFGkPW4Ns9qlT3zdRcspcR1pdCagABQCVvEtInydpe6P5FyufMQDE6/uW73GUi7/sm+zdAb+b37fcq/9DEvBp3/1sSKpeIS7DLLhPjboC7JCosEV+9Vw1fhq3zuDNNXB+c60NAZSiHeJWyd1jAh+c0pCpOLWV1Iqhp0SlPmbvyxZmMNvOXBEqOzMyVxt8Hs34sstVTeZReMCJwyDqiuVs1xWItpWD+QSxLcBsr6sbOhMvnEprmrz6vkuCOqgd0URq6MX1WLxrNaTOYQKzy7t0zdEBpWZU0nZ3fis6+mxh1NpklYycs2ouevGwqxF6Xy6aYNnx0SwLIGe7RZb4kCfm8KWgU5RkY1bawQVcgpiJJND8JC/2agBFlr4RE1EJ5E=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cf3dce0-b32d-476b-33a2-08d71699382f
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2019 15:59:22.3080 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: adeucher@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1219
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z+u9uiYX2qv6hzsc9S8XGfCKmZLOBDuhaUSMAT3DezY=;
 b=wx6R21oobI/XlezmURiK58VAOECK1NcC2gtu9tO6AUZXZhleB3/mYRKWzX7SQ2WUbRUP2ZOz6q9qokF2LRGOMJXuXPb2lNlBlX6+kDr85/gC0GLA2sW7NokEOA5tuIsf8v4nU+PUbOqHte3+lJDayTyMsr3+iZT0n9xGdXVsdXE=
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
Content-Type: multipart/mixed; boundary="===============0851651407=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0851651407==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB18093A43BFCFF3D34D5B29E2F7DE0BN6PR12MB1809namp_"

--_000_BN6PR12MB18093A43BFCFF3D34D5B29E2F7DE0BN6PR12MB1809namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
________________________________
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Sent: Thursday, August 1, 2019 11:47 AM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Grodzovsky, Andrey <And=
rey.Grodzovsky@amd.com>
Subject: [PATCH] drm/amdgpu: Add amdgpu_asic_funcs.reset_method for Vega20

Fixes GPU reset crash.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/soc15.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/soc15.c b/drivers/gpu/drm/amd/amdgp=
u/soc15.c
index 4405b98..f760fba 100644
--- a/drivers/gpu/drm/amd/amdgpu/soc15.c
+++ b/drivers/gpu/drm/amd/amdgpu/soc15.c
@@ -851,6 +851,7 @@ static const struct amdgpu_asic_funcs vega20_asic_funcs=
 =3D
         .get_pcie_usage =3D &soc15_get_pcie_usage,
         .need_reset_on_init =3D &soc15_need_reset_on_init,
         .get_pcie_replay_count =3D &soc15_get_pcie_replay_count,
+       .reset_method =3D &soc15_asic_reset_method
 };

 static int soc15_common_early_init(void *handle)
--
2.7.4


--_000_BN6PR12MB18093A43BFCFF3D34D5B29E2F7DE0BN6PR12MB1809namp_
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
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Andrey Grodzovsky &lt=
;andrey.grodzovsky@amd.com&gt;<br>
<b>Sent:</b> Thursday, August 1, 2019 11:47 AM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> Deucher, Alexander &lt;Alexander.Deucher@amd.com&gt;; Grodzovsky=
, Andrey &lt;Andrey.Grodzovsky@amd.com&gt;<br>
<b>Subject:</b> [PATCH] drm/amdgpu: Add amdgpu_asic_funcs.reset_method for =
Vega20</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Fixes GPU reset crash.<br>
<br>
Signed-off-by: Andrey Grodzovsky &lt;andrey.grodzovsky@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/soc15.c | 1 &#43;<br>
&nbsp;1 file changed, 1 insertion(&#43;)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/soc15.c b/drivers/gpu/drm/amd/amdgp=
u/soc15.c<br>
index 4405b98..f760fba 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/soc15.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/soc15.c<br>
@@ -851,6 &#43;851,7 @@ static const struct amdgpu_asic_funcs vega20_asic_f=
uncs =3D<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .get_pcie_usage =3D &amp;s=
oc15_get_pcie_usage,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .need_reset_on_init =3D &a=
mp;soc15_need_reset_on_init,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .get_pcie_replay_count =3D=
 &amp;soc15_get_pcie_replay_count,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .reset_method =3D &amp;soc15_asic=
_reset_method<br>
&nbsp;};<br>
&nbsp;<br>
&nbsp;static int soc15_common_early_init(void *handle)<br>
-- <br>
2.7.4<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_BN6PR12MB18093A43BFCFF3D34D5B29E2F7DE0BN6PR12MB1809namp_--

--===============0851651407==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0851651407==--
