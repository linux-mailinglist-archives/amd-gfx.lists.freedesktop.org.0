Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB758FBC7
	for <lists+amd-gfx@lfdr.de>; Fri, 16 Aug 2019 09:12:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F41E6EAF0;
	Fri, 16 Aug 2019 07:12:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790047.outbound.protection.outlook.com [40.107.79.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A830D6EAF0
 for <amd-gfx@lists.freedesktop.org>; Fri, 16 Aug 2019 07:12:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QTfw4ReRzNpnvt3N/DJjH7e3LJmwe4KdBqkw136kuD1JcajJQzgowr+S9RvG2PBGi4cWpjPAgm362JIwRy+QzNFUI0dfdak+52zV4UfbXxpTnICwcxAw/2UHZQJ9+h+ush9BYVeF32PWpBQudP6tnE1tj6Ra1uio/FFsMhu2clDWN8kqYlXEX3WNY/l07aNU7w13QLXKYp2FDZAcqBJzQZBIllsRDBSvMxBcwS/DYqQjVt3ZpWWDsSAzHvhsm6mAp6oyepOIj79XVp925W28cAneCCs1Oqr8SeZnp4AZYw1X4UwwQbDs7D6LJlM929jEWGV6jrBu5U7HB3rb7wJ1rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eju7HRwz4UvyJlM7PTz+67E616g9tJ683PvJlONpalc=;
 b=QS3L6vKy3TXcQDm1hgUGN2kpx1xaId8NGKI003Vu3Ll9Qo93KbZsrmT4OGjE5TFxV8xATZIETD1Eo0bQBpCWkj0z/2ibfAjyKZez0eEZQjZsEA7sqpKDiTTVRW9nFMc4NkhH04E5kPP+FYqSPCjcoh4r+J7wgk8QbuAu+FrBkalXSWCf37alGrHoNCmL5Gqvfgrb7K025jAdLzQX6/tCnIdXrm3Ju/eRtaPsSYpExUEOnlSLia2++6ReQPrsKa4hUkILyENLbhyyQ9CoJFtP/YNsFxtVr3YZVBM2oKGz9f1ppzGud2/NNu1JKdAkD+h+t9KxkCOYVLixLTDLY3d79A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB3117.namprd12.prod.outlook.com (20.178.244.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.16; Fri, 16 Aug 2019 07:12:03 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::7490:549a:479d:f716]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::7490:549a:479d:f716%6]) with mapi id 15.20.2178.016; Fri, 16 Aug 2019
 07:12:03 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 4/4] drm/amd/powerplay: set Arcturus default fclk as
 bootup value on dpm disabled
Thread-Topic: [PATCH 4/4] drm/amd/powerplay: set Arcturus default fclk as
 bootup value on dpm disabled
Thread-Index: AQHVU/kJa2N/1dmPRkS4DjUijaWY5ab9W7sE
Date: Fri, 16 Aug 2019 07:12:03 +0000
Message-ID: <MN2PR12MB32961121DFBDF91E07B31282A2AF0@MN2PR12MB3296.namprd12.prod.outlook.com>
References: <20190816060807.11922-1-evan.quan@amd.com>,
 <20190816060807.11922-4-evan.quan@amd.com>
In-Reply-To: <20190816060807.11922-4-evan.quan@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3dede5e4-d008-485c-e0c1-08d7221909fa
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3117; 
x-ms-traffictypediagnostic: MN2PR12MB3117:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3117F2866B157ACFEB45D962A2AF0@MN2PR12MB3117.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1227;
x-forefront-prvs: 0131D22242
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(366004)(39860400002)(346002)(396003)(189003)(199004)(6436002)(86362001)(55016002)(52536014)(486006)(66066001)(8676002)(966005)(6246003)(71200400001)(71190400001)(476003)(9686003)(229853002)(256004)(316002)(105004)(606006)(6306002)(2501003)(236005)(14444005)(110136005)(53936002)(54896002)(11346002)(99286004)(446003)(81166006)(53546011)(81156014)(6506007)(6116002)(33656002)(7696005)(478600001)(3846002)(76176011)(19627405001)(91956017)(186003)(64756008)(102836004)(66446008)(5660300002)(76116006)(2906002)(66946007)(66556008)(74316002)(66476007)(14454004)(25786009)(8936002)(26005)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3117;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 8uzGf6VTjmS50LOYyMVB3sdd6dKaI4HbugXOVY3RMsSBZIWALjWdMfdVMUQDCuJZBprWZy5SezZ0CD/VQHehuIpdNKPU9CFp2BG50aRhulLSt7AXr3wBlSZDYviKkBmXJLmGTjEOpItNWV6Dt4ICTFxBSPHCjFg51wugkRqyVw+WD2ldu9azD2wrSi4mC/YD6FBIaIQuxFTYyiX4w8uJ/iLAYWS68k1kXHpWh7uMHsJE+KmjXAckEoPUInvcFrT0lFzQrbp7Eg4tbz88sg3GSjlVSDaDh3SABIMm8qEslkMkXPs7pfoN/cXVLcgi1bHDvH/fitsi10SSXTLteC4+fKCLHuXx4HUFt92oa5nBt4xzX8o5+Z+d4oolK6WjdfFn6/S0kDK48GoSfSLhLvaqX+aEKaORVqAuq+l55vDIB+w=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dede5e4-d008-485c-e0c1-08d7221909fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2019 07:12:03.2438 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YPnERjB55hlyueCyp9CiiGkbZvaNFIbpyVHJStyomthzowzKqDgKJMDDyFzmZ3Lz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3117
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eju7HRwz4UvyJlM7PTz+67E616g9tJ683PvJlONpalc=;
 b=JPvo5O9fSBDysoxsl2la4Y1iPUNAwi/ysYfAKwZhSWx1bM3PhjKV9zy9/5ddF6H9Kzg77lZj+9lkpilsKFOgLabPjreba9RO+a20O1k65nAJ229uacEQYWwyPuU61F57jF8v5WCngauefp7U38J3f27EjMw9zROI7Dpe6X8k/Lw=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kevin1.Wang@amd.com; 
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
Content-Type: multipart/mixed; boundary="===============1137212659=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1137212659==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB32961121DFBDF91E07B31282A2AF0MN2PR12MB3296namp_"

--_000_MN2PR12MB32961121DFBDF91E07B31282A2AF0MN2PR12MB3296namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Kevin Wang <kevin1.wang@amd.com>

Best Regards,
Kevin
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Evan Qua=
n <evan.quan@amd.com>
Sent: Friday, August 16, 2019 2:08 PM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Cc: Quan, Evan <Evan.Quan@amd.com>
Subject: [PATCH 4/4] drm/amd/powerplay: set Arcturus default fclk as bootup=
 value on dpm disabled

On fclk dpm disabled, the default dpm table will be setup with only one
level and clock frequency as bootup value.

Change-Id: Iecf74aa5bd10c9aa7839bc32877cfa99bcbef4b3
Signed-off-by: Evan Quan <evan.quan@amd.com>
---
 drivers/gpu/drm/amd/powerplay/arcturus_ppt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c b/drivers/gpu/drm=
/amd/powerplay/arcturus_ppt.c
index 9107beba6790..db8be6d8d903 100644
--- a/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c
@@ -463,7 +463,8 @@ static int arcturus_set_default_dpm_table(struct smu_co=
ntext *smu)
                         return ret;
                 }
         } else {
-               single_dpm_table->count =3D 0;
+               single_dpm_table->count =3D 1;
+               single_dpm_table->dpm_levels[0].value =3D smu->smu_table.bo=
ot_values.fclk / 100;
         }
         arcturus_init_single_dpm_state(&(single_dpm_table->dpm_state));

--
2.22.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_MN2PR12MB32961121DFBDF91E07B31282A2AF0MN2PR12MB3296namp_
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
Reviewed-by: Kevin Wang &lt;kevin1.wang@amd.com&gt;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Best Regards,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Kevin</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Evan Quan &lt;evan.quan@amd.c=
om&gt;<br>
<b>Sent:</b> Friday, August 16, 2019 2:08 PM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> Quan, Evan &lt;Evan.Quan@amd.com&gt;<br>
<b>Subject:</b> [PATCH 4/4] drm/amd/powerplay: set Arcturus default fclk as=
 bootup value on dpm disabled</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On fclk dpm disabled, the default dpm table will b=
e setup with only one<br>
level and clock frequency as bootup value.<br>
<br>
Change-Id: Iecf74aa5bd10c9aa7839bc32877cfa99bcbef4b3<br>
Signed-off-by: Evan Quan &lt;evan.quan@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/powerplay/arcturus_ppt.c | 3 &#43;&#43;-<br>
&nbsp;1 file changed, 2 insertions(&#43;), 1 deletion(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c b/drivers/gpu/drm=
/amd/powerplay/arcturus_ppt.c<br>
index 9107beba6790..db8be6d8d903 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c<br>
@@ -463,7 &#43;463,8 @@ static int arcturus_set_default_dpm_table(struct sm=
u_context *smu)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; retur=
n ret;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; single_dpm_table-&gt;count =3D 0;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; single_dpm_table-&gt;count =3D 1;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; single_dpm_table-&gt;dpm_levels[0].value =3D smu-&gt;smu_tab=
le.boot_values.fclk / 100;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; arcturus_init_single_dpm_s=
tate(&amp;(single_dpm_table-&gt;dpm_state));<br>
&nbsp;<br>
-- <br>
2.22.0<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a></div>
</span></font></div>
</body>
</html>

--_000_MN2PR12MB32961121DFBDF91E07B31282A2AF0MN2PR12MB3296namp_--

--===============1137212659==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1137212659==--
