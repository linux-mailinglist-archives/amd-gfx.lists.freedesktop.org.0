Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D1DBB14B
	for <lists+amd-gfx@lfdr.de>; Mon, 23 Sep 2019 11:21:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69C4E6E25B;
	Mon, 23 Sep 2019 09:21:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-bn3nam04on0620.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe4e::620])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9808B6E25B
 for <amd-gfx@lists.freedesktop.org>; Mon, 23 Sep 2019 09:21:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JeQaxefMc5ktIOLfgXpD6ckY49OjP9I7HOSfWY4jUU6AXSdpCbjmhJcCvIdVrbftBgmFFyS/GJmf1CTX+UGjOBhSk8/FjI3TPhZ+fzs1UReR4TYwsc7OGfQvbWar6OR4F1jzPo7z+1bWbXtRbmzMzh4ynl1kncHuhpsShs+fLeyrgv1okMKAfvzYDXMlvpnmcH86F+ZtiGmjCu2y35e2aktTYtZVcpg9CiWUfhqSlH6CofSx2FfrO9s7ltApgTQspwgIu1ZrZl/muJCcXyU9+/cHtEGyWAvkFVXzeyfyPGqbZWl376gryloxtEKnPwLg71377DZLiBJ4OPXM8iNezg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Sk0Pdj2+4RzqeTxoAlx+WxdpQKNT4Vv37hPEY5BJ/0=;
 b=LXRB6+58RfsvU3/gwC1MmJLMUQeGNJNTEaR5gwrCOpsU1f3zlCKG4UQfADJZiTje5jS7qpPT5utxNl2cn9a3F1hWq7QFStII6mbUgjzRThlJ+aygTuRUlzCk7hMZx5A86aSeNgnJIgrv2ePAd7aRaE5FCF35JcLqKGCxsko//yU4hYrj7aZkjkpzZ0TbeD+VCTB0Oz2pFIOweCiINKfD+n49RrpfUCfVR86Exn68tbds+vvJWJrhYOcAPhGBr/+FtJLK9pWSno4PnXpnrlVimQjxcr/PPkSxeMI2LOfV5K9lCSbNWHQwNCw3aMB98Fo0QAPw52IpwmjAmjt1E0kamg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB2864.namprd12.prod.outlook.com (20.179.81.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.19; Mon, 23 Sep 2019 09:21:46 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::9929:92fb:f329:a911]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::9929:92fb:f329:a911%7]) with mapi id 15.20.2284.023; Mon, 23 Sep 2019
 09:21:46 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "Liang, Prike" <Prike.Liang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 1/5] drm/amd/powerplay: bypass dpm_context null pointer
 check guard for some smu series
Thread-Topic: [PATCH 1/5] drm/amd/powerplay: bypass dpm_context null pointer
 check guard for some smu series
Thread-Index: AQHVcerrubVMsKv0tUiXUT/VZyJqC6c4/GsX
Date: Mon, 23 Sep 2019 09:21:45 +0000
Message-ID: <MN2PR12MB3296B10F5F4A601EC54B405BA2850@MN2PR12MB3296.namprd12.prod.outlook.com>
References: <1569228167-3120-1-git-send-email-Prike.Liang@amd.com>
In-Reply-To: <1569228167-3120-1-git-send-email-Prike.Liang@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 51436573-736f-4155-43c8-08d74007748b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB2864; 
x-ms-traffictypediagnostic: MN2PR12MB2864:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB2864480573D92316B6223982A2850@MN2PR12MB2864.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:655;
x-forefront-prvs: 0169092318
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(366004)(396003)(376002)(346002)(199004)(189003)(3846002)(26005)(6436002)(236005)(53546011)(6506007)(52536014)(8936002)(99286004)(25786009)(76176011)(7696005)(5660300002)(478600001)(229853002)(486006)(14454004)(19627405001)(476003)(81166006)(8676002)(81156014)(102836004)(446003)(11346002)(2906002)(186003)(33656002)(66066001)(54906003)(66556008)(110136005)(316002)(66476007)(6246003)(64756008)(66446008)(2501003)(966005)(4326008)(74316002)(7736002)(14444005)(256004)(86362001)(76116006)(105004)(71190400001)(9686003)(91956017)(71200400001)(6306002)(6116002)(66946007)(55016002)(54896002)(606006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2864;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: oN2LzUWozZvrTF4BUmYe5CZJrPuU1htY/jA1hJTXfVmt19+ZKwFVsqugd3H6kOY6IRLH63luHlnElDpZvDGlB4Kwlu9LkHPmIunGygSF+MKWUAMyQso9pw8WhpIL1p11/KgjuODlQ5XYGbpcSZq/sbX7t7wHKpnfdKBPXadougoQHmzunnLWFoZSZJ0gRuFKLDnc3bsr7wNbBnkdNsmalM0dXD3GE+vOM8rJVPvCs69H1yNATifDDTXTW0pGXkY2tD9Sls/JLXdK5RrCYIwMLWYXXPkHlz02JRx0XtpEsm/hqB+8LyEDifYzpQ/xFsWuY4wQuSe0rmPT9Ei729c3P1hxk3RPvJF5kb+zXN37ijcMr5dV6RYPT8d0fbfDDvZteEim9tt32DRcsiZBDykyhcCvFsNons8alCyiA/8T92c=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51436573-736f-4155-43c8-08d74007748b
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2019 09:21:45.9117 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7PcKD2r7hsUaRdR8FvE/XaBLAsTAzamodKooNEeGC20vBS4vW6+SL5jQ9NAGCmu2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2864
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Sk0Pdj2+4RzqeTxoAlx+WxdpQKNT4Vv37hPEY5BJ/0=;
 b=AUT1Sm6v9qkB7WvpZQwt6JRMaEDa1w5YUuFWEAmBzqtSQWeKinhcq2v5yMOnujExfUEkH+/9FOBYNaqBc2QvP+BiTDBNnRvONx8/RjobUttafSJZsGl4rvLgK7lltF5my/nECa1vtlHj4EbvGshjpf7pLmpF7lChJzsYNoZOFt0=
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
Cc: "arron.liu@amd.com" <arron.liu@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
 "Feng, Kenneth" <Kenneth.Feng@amd.com>, "Quan, Evan" <Evan.Quan@amd.com>
Content-Type: multipart/mixed; boundary="===============1660868938=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1660868938==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB3296B10F5F4A601EC54B405BA2850MN2PR12MB3296namp_"

--_000_MN2PR12MB3296B10F5F4A601EC54B405BA2850MN2PR12MB3296namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

the smu driver many place will use AMD_IS_APU flags,
i think we'd better add a new member "is_apu" in smu_context"

Best Regards,
kevin

________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Liang, P=
rike <Prike.Liang@amd.com>
Sent: Monday, September 23, 2019 4:43 PM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Cc: arron.liu@amd.com <arron.liu@amd.com>; Huang, Ray <Ray.Huang@amd.com>; =
Liang, Prike <Prike.Liang@amd.com>; Quan, Evan <Evan.Quan@amd.com>; Feng, K=
enneth <Kenneth.Feng@amd.com>
Subject: [PATCH 1/5] drm/amd/powerplay: bypass dpm_context null pointer che=
ck guard for some smu series

For now APU has no smu_dpm_context structure for containing default/current=
 related dpm table,
thus will not initialize smu_dpm_context and aviod null pointer check guard=
 for APU.

Signed-off-by: Prike Liang <Prike.Liang@amd.com>
---
 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c b/drivers/gpu/drm/a=
md/powerplay/amdgpu_smu.c
index 90fa444..3afd2cd 100644
--- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
@@ -1554,7 +1554,9 @@ static int smu_enable_umd_pstate(void *handle,

         struct smu_context *smu =3D (struct smu_context*)(handle);
         struct smu_dpm_context *smu_dpm_ctx =3D &(smu->smu_dpm);
-       if (!smu->pm_enabled || !smu_dpm_ctx->dpm_context)
+       struct amdgpu_device *adev =3D smu->adev;
+
+       if (!(adev->flags & AMD_IS_APU) && (!smu->pm_enabled || !smu_dpm_ct=
x->dpm_context))
                 return -EINVAL;

         if (!(smu_dpm_ctx->dpm_level & profile_mode_mask)) {
@@ -1751,8 +1753,9 @@ enum amd_dpm_forced_level smu_get_performance_level(s=
truct smu_context *smu)
 {
         struct smu_dpm_context *smu_dpm_ctx =3D &(smu->smu_dpm);
         enum amd_dpm_forced_level level;
+       struct amdgpu_device *adev =3D smu->adev;

-       if (!smu_dpm_ctx->dpm_context)
+       if (!(adev->flags & AMD_IS_APU) && !smu_dpm_ctx->dpm_context)
                 return -EINVAL;

         mutex_lock(&(smu->mutex));
@@ -1766,8 +1769,9 @@ int smu_force_performance_level(struct smu_context *s=
mu, enum amd_dpm_forced_lev
 {
         struct smu_dpm_context *smu_dpm_ctx =3D &(smu->smu_dpm);
         int ret =3D 0;
+       struct amdgpu_device *adev =3D smu->adev;

-       if (!smu_dpm_ctx->dpm_context)
+       if (!(adev->flags & AMD_IS_APU) && !smu_dpm_ctx->dpm_context)
                 return -EINVAL;

         ret =3D smu_enable_umd_pstate(smu, &level);
--
2.7.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_MN2PR12MB3296B10F5F4A601EC54B405BA2850MN2PR12MB3296namp_
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
the smu driver many place will use AMD_IS_APU flags,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
i think we'd better add a new member &quot;is_apu&quot; in smu_context&quot=
;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Best Regards,<br>
kevin</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Liang, Prike &lt;Prike.Liang@=
amd.com&gt;<br>
<b>Sent:</b> Monday, September 23, 2019 4:43 PM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> arron.liu@amd.com &lt;arron.liu@amd.com&gt;; Huang, Ray &lt;Ray.=
Huang@amd.com&gt;; Liang, Prike &lt;Prike.Liang@amd.com&gt;; Quan, Evan &lt=
;Evan.Quan@amd.com&gt;; Feng, Kenneth &lt;Kenneth.Feng@amd.com&gt;<br>
<b>Subject:</b> [PATCH 1/5] drm/amd/powerplay: bypass dpm_context null poin=
ter check guard for some smu series</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">For now APU has no smu_dpm_context structure for c=
ontaining default/current related dpm table,<br>
thus will not initialize smu_dpm_context and aviod null pointer check guard=
 for APU.<br>
<br>
Signed-off-by: Prike Liang &lt;Prike.Liang@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/powerplay/amdgpu_smu.c | 10 &#43;&#43;&#43;&#43;&=
#43;&#43;&#43;---<br>
&nbsp;1 file changed, 7 insertions(&#43;), 3 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c b/drivers/gpu/drm/a=
md/powerplay/amdgpu_smu.c<br>
index 90fa444..3afd2cd 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c<br>
@@ -1554,7 &#43;1554,9 @@ static int smu_enable_umd_pstate(void *handle,<br=
>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct smu_context *smu =
=3D (struct smu_context*)(handle);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct smu_dpm_context *sm=
u_dpm_ctx =3D &amp;(smu-&gt;smu_dpm);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!smu-&gt;pm_enabled || !smu_dpm_c=
tx-&gt;dpm_context)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_device *adev =3D sm=
u-&gt;adev;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!(adev-&gt;flags &amp; AMD_IS=
_APU) &amp;&amp; (!smu-&gt;pm_enabled || !smu_dpm_ctx-&gt;dpm_context))<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return -EINVAL;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!(smu_dpm_ctx-&gt;dpm_=
level &amp; profile_mode_mask)) {<br>
@@ -1751,8 &#43;1753,9 @@ enum amd_dpm_forced_level smu_get_performance_lev=
el(struct smu_context *smu)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct smu_dpm_context *sm=
u_dpm_ctx =3D &amp;(smu-&gt;smu_dpm);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enum amd_dpm_forced_level =
level;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_device *adev =3D sm=
u-&gt;adev;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!smu_dpm_ctx-&gt;dpm_context)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!(adev-&gt;flags &amp; AMD_IS=
_APU) &amp;&amp; !smu_dpm_ctx-&gt;dpm_context)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return -EINVAL;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mutex_lock(&amp;(smu-&gt;m=
utex));<br>
@@ -1766,8 &#43;1769,9 @@ int smu_force_performance_level(struct smu_contex=
t *smu, enum amd_dpm_forced_lev<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct smu_dpm_context *sm=
u_dpm_ctx =3D &amp;(smu-&gt;smu_dpm);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret =3D 0;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_device *adev =3D sm=
u-&gt;adev;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!smu_dpm_ctx-&gt;dpm_context)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!(adev-&gt;flags &amp; AMD_IS=
_APU) &amp;&amp; !smu_dpm_ctx-&gt;dpm_context)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return -EINVAL;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D smu_enable_umd_pst=
ate(smu, &amp;level);<br>
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

--_000_MN2PR12MB3296B10F5F4A601EC54B405BA2850MN2PR12MB3296namp_--

--===============1660868938==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1660868938==--
