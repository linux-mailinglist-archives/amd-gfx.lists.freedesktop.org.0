Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A912BBEB8E
	for <lists+amd-gfx@lfdr.de>; Thu, 26 Sep 2019 07:15:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33B7E6EC25;
	Thu, 26 Sep 2019 05:15:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770072.outbound.protection.outlook.com [40.107.77.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D0BF6EC25
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Sep 2019 05:15:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hlPehYiIH2dBCoqq4SxvAud/9VKE17LC9ijRF0NCHNChCBMnYkqPtUGoY7ht3Ek5yAb/7PYGl/hLriA2iW689J2nb+xBJqaxR85WZDolJtXI7BzuYOZ9OwZvlUgTocSBgg8JD+zB6karFeCtwMm0gkyJZa3HBT8SLLbI6lHCgpHvMVHG9KVAWAcAlWKUb0t3z+gRxd9zYCLwJapej1x+AyBCWvxRYy1AfjifqsxX7PwCil95ab3HLDR7lC0TPGQfz6RDEw/Np30znRiCSO1oZH4mGFPNfUC9C1LLmxyJ3YjtkV7xtkACUu9eYuNa8RQAYhkN6q96mr7Dy7MJUiN9Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qLHqZOBsPi8h85KlqiESf8NOY7JniO19It7cQgOX+Zk=;
 b=a3UhXBSQf/L0CNXsHrIWSVfSCgd+a0fjf5RupGwAz1kn5pQjBwX6f/5Avwx+H6fA7YHzMn2Vkja7g/XawGikNNYSQh7tiLbe0/u6WkrwtPRRQlJO79BTTje95u6bvvwYBRXed9lWklF7KbsMRxX/6qxBTejqBfc8DYCU9LB4+FNLLI4Kw7VSHd5Y94F4Bm3GFcVb4F+vmAfxM3ROugjlSa6jI3AzFND2tU2kGC5O0gswEAFHO1uJlD9HmBeQG9jhtZHfklmIBeypQSH6LC2O2EBUBwHWohNSkCBc2R1NHEuAAT5NAKunBkdbYtHbroxKiVXsQudSVPEq2gO9/cvYDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB4030.namprd12.prod.outlook.com (10.255.86.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.17; Thu, 26 Sep 2019 05:15:16 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::9929:92fb:f329:a911]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::9929:92fb:f329:a911%7]) with mapi id 15.20.2284.028; Thu, 26 Sep 2019
 05:15:16 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "Liang, Prike" <Prike.Liang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 1/8] drm/amd/powerplay: bypass dpm_context null pointer
 check guard for some smu series
Thread-Topic: [PATCH 1/8] drm/amd/powerplay: bypass dpm_context null pointer
 check guard for some smu series
Thread-Index: AQHVdB15isSZ3/dIYUW43+FascG2Rac9aclI
Date: Thu, 26 Sep 2019 05:15:16 +0000
Message-ID: <MN2PR12MB3296E9B2628C3354FB53DABEA2860@MN2PR12MB3296.namprd12.prod.outlook.com>
References: <1569469774-16813-1-git-send-email-Prike.Liang@amd.com>
In-Reply-To: <1569469774-16813-1-git-send-email-Prike.Liang@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6c7cdff7-9e04-4e96-fd20-08d742408464
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: MN2PR12MB4030:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB40301662ABFD975832476F74A2860@MN2PR12MB4030.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1051;
x-forefront-prvs: 0172F0EF77
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(396003)(376002)(39860400002)(346002)(189003)(199004)(105004)(99286004)(446003)(11346002)(3846002)(9686003)(76176011)(54896002)(236005)(33656002)(6246003)(476003)(7696005)(486006)(2501003)(52536014)(71190400001)(229853002)(5660300002)(71200400001)(186003)(81166006)(81156014)(6116002)(25786009)(8676002)(14444005)(26005)(53546011)(6506007)(256004)(102836004)(8936002)(76116006)(66946007)(91956017)(7736002)(110136005)(606006)(6436002)(64756008)(66556008)(66476007)(66446008)(86362001)(2906002)(6306002)(966005)(478600001)(54906003)(316002)(19627405001)(4326008)(55016002)(14454004)(66066001)(74316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4030;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oGazl2ydNrCD0YskBdQLXaEGStpKiW357Y68Zr85PY9qHA4xjYcstfE0fNjc4HpUfKr54qnKgic52bpjvXK7qK6JtLOwKYCDRphtan9VSfCndasLrGtqZwX99+7FZ1VqBHUgJbdRsL2pCMRQgPzwLXAuZsOUF+lk2WymB1YximUl9tDfETY+KjwEvz+Ho3d0z36HjToNL9OTAjjO/CgXMm1RidqzwvsVy5RW6wtmq79YSiIcBiF5AXzy0vPrh3QjJVJWT1Nqe/ktV4HUU1Hhof0YMCtbAJc6FbjMQVaAxA8c9rypszpbFWwAPKZ6OW40J9qbY2+F5QHqptwfkVUrfNSTHrBBfV73b3QxJYIEIHfSXIP09JzzcpoCRoh2TBz4vYH9UppGuvqrO7c/Rx4TDYQojrp1LPzyehnLD73vxjYqP7NSxSZa9WBaUDQZKtctbqje09TPPIAwEgVfODwpdQ==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c7cdff7-9e04-4e96-fd20-08d742408464
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2019 05:15:16.0946 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VSgKA7DN+6iGdS0V5ah5uJ3qXEj/7lmnc76f/U76Y4ykq746GinxhZw3FJvsqE6n
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4030
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qLHqZOBsPi8h85KlqiESf8NOY7JniO19It7cQgOX+Zk=;
 b=1nxs4Zdt2hYGJXDd8AMW+a+8/dj+cXdUccLc43t960heoC6+jqQ8Ps6Hov0BABsKiuBSPM8sCT6DO136pea+1xClFQRPok9WulbWkKuzn1YGpVs+hgk/DyccrnW+HaMDRNC3P8s7pyRyi9LbFCTXbpIeLYjrY1EWxVDm9D1rhSg=
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
Cc: "Quan, Evan" <Evan.Quan@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
 "keneth.feng@amd.com" <keneth.feng@amd.com>
Content-Type: multipart/mixed; boundary="===============1873584874=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1873584874==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB3296E9B2628C3354FB53DABEA2860MN2PR12MB3296namp_"

--_000_MN2PR12MB3296E9B2628C3354FB53DABEA2860MN2PR12MB3296namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

comment inline.
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Liang, P=
rike <Prike.Liang@amd.com>
Sent: Thursday, September 26, 2019 11:50 AM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Cc: Liang, Prike <Prike.Liang@amd.com>; Quan, Evan <Evan.Quan@amd.com>; Hua=
ng, Ray <Ray.Huang@amd.com>; keneth.feng@amd.com <keneth.feng@amd.com>
Subject: [PATCH 1/8] drm/amd/powerplay: bypass dpm_context null pointer che=
ck guard for some smu series

For now APU has no smu_dpm_context structure for containing default/current=
 related dpm tables,
thus will needn't initialize smu_dpm_context to aviod APU null pointer issu=
e.

Signed-off-by: Prike Liang <Prike.Liang@amd.com>
---
 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c     | 7 ++++---
 drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h | 1 +
 drivers/gpu/drm/amd/powerplay/renoir_ppt.c     | 1 +
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c b/drivers/gpu/drm/a=
md/powerplay/amdgpu_smu.c
index 23293e1..ae4a82e 100644
--- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
@@ -1557,7 +1557,8 @@ static int smu_enable_umd_pstate(void *handle,

         struct smu_context *smu =3D (struct smu_context*)(handle);
         struct smu_dpm_context *smu_dpm_ctx =3D &(smu->smu_dpm);
-       if (!smu->pm_enabled || !smu_dpm_ctx->dpm_context)
+
+       if (!smu->is_apu && (!smu->pm_enabled || !smu_dpm_ctx->dpm_context)=
)
                 return -EINVAL;

         if (!(smu_dpm_ctx->dpm_level & profile_mode_mask)) {
@@ -1755,7 +1756,7 @@ enum amd_dpm_forced_level smu_get_performance_level(s=
truct smu_context *smu)
         struct smu_dpm_context *smu_dpm_ctx =3D &(smu->smu_dpm);
         enum amd_dpm_forced_level level;

-       if (!smu_dpm_ctx->dpm_context)
+       if (!smu->is_apu && !smu_dpm_ctx->dpm_context)
                 return -EINVAL;

         mutex_lock(&(smu->mutex));
@@ -1770,7 +1771,7 @@ int smu_force_performance_level(struct smu_context *s=
mu, enum amd_dpm_forced_lev
         struct smu_dpm_context *smu_dpm_ctx =3D &(smu->smu_dpm);
         int ret =3D 0;

-       if (!smu_dpm_ctx->dpm_context)
+       if (!smu->is_apu && !smu_dpm_ctx->dpm_context)
                 return -EINVAL;

         ret =3D smu_enable_umd_pstate(smu, &level);
diff --git a/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h b/drivers/gpu/d=
rm/amd/powerplay/inc/amdgpu_smu.h
index 5c89844..bd1e621 100644
--- a/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h
+++ b/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h
@@ -387,6 +387,7 @@ struct smu_context
         uint32_t power_profile_mode;
         uint32_t default_power_profile_mode;
         bool pm_enabled;
+       bool is_apu;

         uint32_t smc_if_version;

diff --git a/drivers/gpu/drm/amd/powerplay/renoir_ppt.c b/drivers/gpu/drm/a=
md/powerplay/renoir_ppt.c
index 9311b6a..a4e44d3 100644
--- a/drivers/gpu/drm/amd/powerplay/renoir_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/renoir_ppt.c
@@ -141,6 +141,7 @@ static int renoir_get_smu_table_index(struct smu_contex=
t *smc, uint32_t index)
 static int renoir_tables_init(struct smu_context *smu, struct smu_table *t=
ables)
 {
         struct smu_table_context *smu_table =3D &smu->smu_table;
+       smu->is_apu =3D true;
[keivn]:
i'd like move this into function of "renoir_set_ppt_funcs".
and this member should be set default value in amdgpu_smu.c

after fixed:
Reviewed-by: Kevin Wang <kevin1.wang@amd.com>

         SMU_TABLE_INIT(tables, SMU_TABLE_WATERMARKS, sizeof(Watermarks_t),
                 PAGE_SIZE, AMDGPU_GEM_DOMAIN_VRAM);
--
2.7.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_MN2PR12MB3296E9B2628C3354FB53DABEA2860MN2PR12MB3296namp_
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
comment inline.</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Liang, Prike &lt;Prike.Liang@=
amd.com&gt;<br>
<b>Sent:</b> Thursday, September 26, 2019 11:50 AM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> Liang, Prike &lt;Prike.Liang@amd.com&gt;; Quan, Evan &lt;Evan.Qu=
an@amd.com&gt;; Huang, Ray &lt;Ray.Huang@amd.com&gt;; keneth.feng@amd.com &=
lt;keneth.feng@amd.com&gt;<br>
<b>Subject:</b> [PATCH 1/8] drm/amd/powerplay: bypass dpm_context null poin=
ter check guard for some smu series</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">For now APU has no smu_dpm_context structure for c=
ontaining default/current related dpm tables,<br>
thus will needn't initialize smu_dpm_context to aviod APU null pointer issu=
e.<br>
<br>
Signed-off-by: Prike Liang &lt;Prike.Liang@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/powerplay/amdgpu_smu.c&nbsp;&nbsp;&nbsp;&nbsp; | =
7 &#43;&#43;&#43;&#43;---<br>
&nbsp;drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h | 1 &#43;<br>
&nbsp;drivers/gpu/drm/amd/powerplay/renoir_ppt.c&nbsp;&nbsp;&nbsp;&nbsp; | =
1 &#43;<br>
&nbsp;3 files changed, 6 insertions(&#43;), 3 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c b/drivers/gpu/drm/a=
md/powerplay/amdgpu_smu.c<br>
index 23293e1..ae4a82e 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c<br>
@@ -1557,7 &#43;1557,8 @@ static int smu_enable_umd_pstate(void *handle,<br=
>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct smu_context *smu =
=3D (struct smu_context*)(handle);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct smu_dpm_context *sm=
u_dpm_ctx =3D &amp;(smu-&gt;smu_dpm);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!smu-&gt;pm_enabled || !smu_dpm_c=
tx-&gt;dpm_context)<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!smu-&gt;is_apu &amp;&amp; (!=
smu-&gt;pm_enabled || !smu_dpm_ctx-&gt;dpm_context))<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return -EINVAL;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!(smu_dpm_ctx-&gt;dpm_=
level &amp; profile_mode_mask)) {<br>
@@ -1755,7 &#43;1756,7 @@ enum amd_dpm_forced_level smu_get_performance_lev=
el(struct smu_context *smu)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct smu_dpm_context *sm=
u_dpm_ctx =3D &amp;(smu-&gt;smu_dpm);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enum amd_dpm_forced_level =
level;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!smu_dpm_ctx-&gt;dpm_context)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!smu-&gt;is_apu &amp;&amp; !s=
mu_dpm_ctx-&gt;dpm_context)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return -EINVAL;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mutex_lock(&amp;(smu-&gt;m=
utex));<br>
@@ -1770,7 &#43;1771,7 @@ int smu_force_performance_level(struct smu_contex=
t *smu, enum amd_dpm_forced_lev<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct smu_dpm_context *sm=
u_dpm_ctx =3D &amp;(smu-&gt;smu_dpm);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret =3D 0;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!smu_dpm_ctx-&gt;dpm_context)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!smu-&gt;is_apu &amp;&amp; !s=
mu_dpm_ctx-&gt;dpm_context)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return -EINVAL;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D smu_enable_umd_pst=
ate(smu, &amp;level);<br>
diff --git a/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h b/drivers/gpu/d=
rm/amd/powerplay/inc/amdgpu_smu.h<br>
index 5c89844..bd1e621 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h<br>
@@ -387,6 &#43;387,7 @@ struct smu_context<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t power_profile_mod=
e;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t default_power_pro=
file_mode;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool pm_enabled;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool is_apu;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t smc_if_version;<b=
r>
&nbsp;<br>
diff --git a/drivers/gpu/drm/amd/powerplay/renoir_ppt.c b/drivers/gpu/drm/a=
md/powerplay/renoir_ppt.c<br>
index 9311b6a..a4e44d3 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/renoir_ppt.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/renoir_ppt.c<br>
@@ -141,6 &#43;141,7 @@ static int renoir_get_smu_table_index(struct smu_co=
ntext *smc, uint32_t index)<br>
&nbsp;static int renoir_tables_init(struct smu_context *smu, struct smu_tab=
le *tables)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct smu_table_context *=
smu_table =3D &amp;smu-&gt;smu_table;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smu-&gt;is_apu =3D true;</div>
<div class=3D"PlainText">[keivn]:</div>
<div class=3D"PlainText">i'd like move this into function of &quot;renoir_s=
et_ppt_funcs&quot;.</div>
<div class=3D"PlainText">and this member should be set default value in amd=
gpu_smu.c</div>
<div class=3D"PlainText"><br>
</div>
<div class=3D"PlainText">after fixed:</div>
<div class=3D"PlainText">Reviewed-by: Kevin Wang &lt;kevin1.wang@amd.com&gt=
;</div>
<div class=3D"PlainText">&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SMU_TABLE_INIT(tables, SMU=
_TABLE_WATERMARKS, sizeof(Watermarks_t),<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; PAGE_SIZE, AMDGPU_GEM_DOMAIN_VRAM);<br>
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

--_000_MN2PR12MB3296E9B2628C3354FB53DABEA2860MN2PR12MB3296namp_--

--===============1873584874==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1873584874==--
