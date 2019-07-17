Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0856BD8B
	for <lists+amd-gfx@lfdr.de>; Wed, 17 Jul 2019 15:45:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4155B6E188;
	Wed, 17 Jul 2019 13:45:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810082.outbound.protection.outlook.com [40.107.81.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEDF06E188
 for <amd-gfx@lists.freedesktop.org>; Wed, 17 Jul 2019 13:45:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V4L3WQ29FOqLoxXzFlb01y+zj38EBhMmLnoxo1z8Lh+D85vjxv+eqsbCQ8pk5QVdNF4jitEkziPAN0HdKzZUslGRXTgLb4LxdWe8OLnZGPBGfMuQfmQN57KaqZPDy8ZZLCKoxKZcJpxLwYuU4ifRja6MB2C08piu9MUL+IJuwF0+sUEQWua6HN+R2T5K2tANURwqEAZi1N0Yn8LizFRyeKaMKxXSJPoqj19+Mo3X3X7uylhxVfsICymm9APkVxwhE8pD34VWgkXdIYxrXqw67qqq2sXvAwTfVsReiaeZut/yrr4pFWTOCaQhOczIwWp90z44B+22YndYMS4FnyjFmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ngQLx6E8+6IpIIwqniJQEzY0iYEO1RYOtJ5DxHqFX9s=;
 b=ep5ANnqztTozkS4wT/j+msQ4F/MJfmk9tgu3dQUG1MAdnJjUKKjt3yAdRIwPMb6CCWhlKMuFbGq+lc3ucYVjZ69ZpowqoeBsSB+jxYf21kqRjX6BNsZcGSKmmJ0Qr1SGLPerP3QczhTXrJMIm3bgsCZvPj9EL58gJCh5rJr7JzhLXBll5mKGzwUnSyRA8Dpw/faw0/T18lUhFTCHz8bf15zpcApsuBdEdbSrDFvoSF5ee0hw9VEfxmvG4AkwK/7/HMKzwMEbAIB27carCpmYva/FOvbDb2JKMGTbXxhnwV4W+8y3/t2R/w2UOhrC1sdh4v2c16fd45vUfHTw0+MNJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1441.namprd12.prod.outlook.com (10.172.24.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Wed, 17 Jul 2019 13:45:18 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::689d:2dcb:e0f7:bd8c]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::689d:2dcb:e0f7:bd8c%4]) with mapi id 15.20.2073.012; Wed, 17 Jul 2019
 13:45:18 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amd/powerplay: report bootup clock as max supported
 on dpm disabled
Thread-Topic: [PATCH] drm/amd/powerplay: report bootup clock as max supported
 on dpm disabled
Thread-Index: AQHVPILh3Y/Yf0sVsUaJdQayKPJuyabO0qby
Date: Wed, 17 Jul 2019 13:45:18 +0000
Message-ID: <BN6PR12MB1809CC0C9C60FD724B9CC227F7C90@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <20190717093432.25165-1-evan.quan@amd.com>
In-Reply-To: <20190717093432.25165-1-evan.quan@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.219.21.119]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1e12fbc6-e4db-40f0-e2ce-08d70abd0152
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1441; 
x-ms-traffictypediagnostic: BN6PR12MB1441:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN6PR12MB1441320ADB6213F7045A0763F7C90@BN6PR12MB1441.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2043;
x-forefront-prvs: 01018CB5B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(346002)(396003)(39860400002)(136003)(199004)(189003)(71200400001)(316002)(2501003)(64756008)(86362001)(476003)(606006)(66556008)(81166006)(446003)(11346002)(66946007)(66476007)(66446008)(26005)(71190400001)(102836004)(52536014)(53546011)(54906003)(105004)(110136005)(81156014)(76116006)(6506007)(256004)(5660300002)(14444005)(8936002)(229853002)(4326008)(7696005)(99286004)(76176011)(25786009)(68736007)(74316002)(8676002)(14454004)(7736002)(966005)(478600001)(9686003)(6116002)(236005)(3846002)(33656002)(54896002)(53936002)(6306002)(6246003)(55016002)(486006)(66066001)(186003)(19627405001)(2906002)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1441;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: WoMa5wxHlZwSrYdo8cuqdT+/iRGxbMtLVqwNNzFAJ8EAq8M4gZswT6+fRG3wh+3TNVn793UCRGY2JSbzrWeynVIXLG+aap5sEhgOHs7w3LEJ+tjnKLCgZ5kXxm0D4JYIPPLO56zGUh92or4pfAnjZaYreLskdTiNFECOtrMGwwQtPUF0FQEmHF6hTcQ2jIDZFx4EWV947XTMRucajApii0qBdou4rqqp44A1lr7KCJyjcKsNzpiiB9qfi5Ozd6i4Gpc41199CMkghY/le6Z4P3O03q7C/SA/n0rBzrKUqtw4likrRvDhAF6Ska+PdJ5JPGGf1PRKVJZz8PaAElHDhl4VDbQt0NNu1eFX67nE3YnULG7HS1sZwq3BpopGfxOqTqvAXd+4h+JK+y1OqllV2smYvSkCCahLIMjF156lm/Q=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e12fbc6-e4db-40f0-e2ce-08d70abd0152
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2019 13:45:18.1001 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: adeucher@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1441
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ngQLx6E8+6IpIIwqniJQEzY0iYEO1RYOtJ5DxHqFX9s=;
 b=RBmdDxjHYMIfQ0rjUT0qxt/mpd8WcBg8sg4Fsv7KQ064gIyxvZR+hzkk5/8oaM8rx7jV83w2OdToDWsl/JFwvHK9HiSNJWCq19L1lbkm7/flBR31Q+vW6g3V1fi2qZZXnIqbLMv7hAttPJaZEzT2GGCfLqebXNDoihAXopS0RM4=
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
Cc: "Xu, Feifei" <Feifei.Xu@amd.com>, "Ma, Le" <Le.Ma@amd.com>
Content-Type: multipart/mixed; boundary="===============1221701069=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1221701069==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB1809CC0C9C60FD724B9CC227F7C90BN6PR12MB1809namp_"

--_000_BN6PR12MB1809CC0C9C60FD724B9CC227F7C90BN6PR12MB1809namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Evan Qua=
n <evan.quan@amd.com>
Sent: Wednesday, July 17, 2019 5:34 AM
To: amd-gfx@lists.freedesktop.org
Cc: Deucher, Alexander; Xu, Feifei; Quan, Evan; Ma, Le
Subject: [PATCH] drm/amd/powerplay: report bootup clock as max supported on=
 dpm disabled

With gfxclk or uclk dpm disabled, it's reasonable to report bootup clock
as the max supported.

Change-Id: If8aa7a912e8a34414b0e9c2b46de9b6e316fd9d7
Signed-off-by: Evan Quan <evan.quan@amd.com>
---
 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c | 27 ++++++++++++++++++++++++++=
-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c b/drivers/gpu/drm/a=
md/powerplay/amdgpu_smu.c
index 5d5664f..d370b09 100644
--- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
@@ -137,12 +137,37 @@ int smu_get_dpm_freq_range(struct smu_context *smu, e=
num smu_clk_type clk_type,
 {
         int ret =3D 0, clk_id =3D 0;
         uint32_t param =3D 0;
+       uint32_t clock_limit;

         if (!min && !max)
                 return -EINVAL;

-       if (!smu_clk_dpm_is_enabled(smu, clk_type))
+       if (!smu_clk_dpm_is_enabled(smu, clk_type)) {
+               switch (clk_type) {
+               case SMU_MCLK:
+               case SMU_UCLK:
+                       clock_limit =3D smu->smu_table.boot_values.uclk;
+                       break;
+               case SMU_GFXCLK:
+               case SMU_SCLK:
+                       clock_limit =3D smu->smu_table.boot_values.gfxclk;
+                       break;
+               case SMU_SOCCLK:
+                       clock_limit =3D smu->smu_table.boot_values.socclk;
+                       break;
+               default:
+                       clock_limit =3D 0;
+                       break;
+               }
+
+               /* clock in Mhz unit */
+               if (min)
+                       *min =3D clock_limit / 100;
+               if (max)
+                       *max =3D clock_limit / 100;
+
                 return 0;
+       }

         mutex_lock(&smu->mutex);
         clk_id =3D smu_clk_get_index(smu, clk_type);
--
2.7.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB1809CC0C9C60FD724B9CC227F7C90BN6PR12MB1809namp_
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
ounces@lists.freedesktop.org&gt; on behalf of Evan Quan &lt;evan.quan@amd.c=
om&gt;<br>
<b>Sent:</b> Wednesday, July 17, 2019 5:34 AM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org<br>
<b>Cc:</b> Deucher, Alexander; Xu, Feifei; Quan, Evan; Ma, Le<br>
<b>Subject:</b> [PATCH] drm/amd/powerplay: report bootup clock as max suppo=
rted on dpm disabled</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">With gfxclk or uclk dpm disabled, it's reasonable =
to report bootup clock<br>
as the max supported.<br>
<br>
Change-Id: If8aa7a912e8a34414b0e9c2b46de9b6e316fd9d7<br>
Signed-off-by: Evan Quan &lt;evan.quan@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/powerplay/amdgpu_smu.c | 27 &#43;&#43;&#43;&#43;&=
#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&=
#43;&#43;&#43;&#43;&#43;&#43;&#43;-<br>
&nbsp;1 file changed, 26 insertions(&#43;), 1 deletion(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c b/drivers/gpu/drm/a=
md/powerplay/amdgpu_smu.c<br>
index 5d5664f..d370b09 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c<br>
@@ -137,12 &#43;137,37 @@ int smu_get_dpm_freq_range(struct smu_context *sm=
u, enum smu_clk_type clk_type,<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret =3D 0, clk_id =3D =
0;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t param =3D 0;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t clock_limit;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!min &amp;&amp; !max)<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return -EINVAL;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!smu_clk_dpm_is_enabled(smu, clk_=
type))<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!smu_clk_dpm_is_enabled(smu, =
clk_type)) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; switch (clk_type) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; case SMU_MCLK:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; case SMU_UCLK:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; clock_limit =
=3D smu-&gt;smu_table.boot_values.uclk;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; case SMU_GFXCLK:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; case SMU_SCLK:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; clock_limit =
=3D smu-&gt;smu_table.boot_values.gfxclk;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; case SMU_SOCCLK:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; clock_limit =
=3D smu-&gt;smu_table.boot_values.socclk;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; default:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; clock_limit =
=3D 0;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; }<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; /* clock in Mhz unit */<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (min)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *min =3D clo=
ck_limit / 100;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (max)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *max =3D clo=
ck_limit / 100;<br>
&#43;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return 0;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mutex_lock(&amp;smu-&gt;mu=
tex);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; clk_id =3D smu_clk_get_ind=
ex(smu, clk_type);<br>
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

--_000_BN6PR12MB1809CC0C9C60FD724B9CC227F7C90BN6PR12MB1809namp_--

--===============1221701069==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1221701069==--
