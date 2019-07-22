Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE40B6F8EF
	for <lists+amd-gfx@lfdr.de>; Mon, 22 Jul 2019 07:38:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE73689ADC;
	Mon, 22 Jul 2019 05:38:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710089.outbound.protection.outlook.com [40.107.71.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B63B89ADC
 for <amd-gfx@lists.freedesktop.org>; Mon, 22 Jul 2019 05:38:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IjwzFizTNlmHYHMPus3Ga2nV2cDzFxaQWuGNpWJxcII4qvX68heW8iDXO6XZEdDBdd6e8SyXvP++smENFYUEr7yGMvBt2kkhxBsxErblZ7vgnamnKRgFjTfqWtTaZA25TGh/skQXPf47rdee2SHDAAPNYrtxx5q3CwVM3ds/2YVEQEHNMGEf09APWIHBrp0mVUKzGV/LwCMthoHa0SxE9krWDfpue+SiHck79w7/OR5ldfp0dKXuQfpXZtUvW3FmY2md/N/k9uzW4w9ZRO3yq04szdNIsCZU+RcOcUoter/gORiTz5hlWlpdtPxQwXv22CwK9JOnMD3F9BEuFCdFHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ORD7CgDwxPoDi9amk1iyr0hxtKmEpv0h0UD4kBthPMY=;
 b=guWqfzK3zYBGjQXON9EwgzX/Ldmv2ako8ORAj93y/STCqby664JQBIBbc8kY6mCQwcYblvRN2xHsMcdBzQiXO7u+/9ug/7v6XoBIl8X6nlIkXIBVUEb/vEtGqa94e6OnmpZt8IBHFK5izF51Jtq25D3vjmQkXQVNbLUvn27D/zZO/Ttcia/Bs5pO7MnG3kJSk6zm8q0spappiAUn2YRiyk+EkVg6HPvt2i5coim4M1/1Jl3CeCzMct94QXqNGUUQMW5WzWazP2J7OhP7iCkEKrJDjSpDqYeeJj+7m/TAFGPWmkeBmACYo99GjBgtw2DYv00XhbmzcvKxkAuFA5cFwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB2895.namprd12.prod.outlook.com (20.179.82.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Mon, 22 Jul 2019 05:38:34 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::ad59:f055:2417:660f]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::ad59:f055:2417:660f%6]) with mapi id 15.20.2094.013; Mon, 22 Jul 2019
 05:38:34 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "Feng, Kenneth" <Kenneth.Feng@amd.com>, "Quan, Evan" <Evan.Quan@amd.com>, 
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 4/5] drm/amd/powerplay: correct Navi10 VCN powergate
 control
Thread-Topic: [PATCH 4/5] drm/amd/powerplay: correct Navi10 VCN powergate
 control
Thread-Index: AQHVQDvUVJFTAN8Ka0iVBI04I9wOlabWC2gAgAATFL8=
Date: Mon, 22 Jul 2019 05:38:34 +0000
Message-ID: <MN2PR12MB3296FAF9BF4C2FBAF12C2496A2C40@MN2PR12MB3296.namprd12.prod.outlook.com>
References: <20190722031531.23437-1-evan.quan@amd.com>
 <20190722031531.23437-5-evan.quan@amd.com>,
 <MN2PR12MB359851CA088A334EC52E36DE8EC40@MN2PR12MB3598.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB359851CA088A334EC52E36DE8EC40@MN2PR12MB3598.namprd12.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 299620c6-1764-43c9-b70c-08d70e66d6c4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB2895; 
x-ms-traffictypediagnostic: MN2PR12MB2895:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB289591F3AA928A4284884169A2C40@MN2PR12MB2895.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:651;
x-forefront-prvs: 01068D0A20
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(346002)(396003)(136003)(376002)(199004)(189003)(13464003)(66066001)(110136005)(316002)(2906002)(256004)(7736002)(74316002)(6436002)(2501003)(86362001)(229853002)(102836004)(966005)(76176011)(19627405001)(7696005)(26005)(486006)(99286004)(186003)(478600001)(6506007)(53546011)(6606003)(476003)(25786009)(33656002)(11346002)(446003)(6116002)(55016002)(8676002)(66446008)(3846002)(64756008)(606006)(14454004)(66476007)(8936002)(4326008)(76116006)(66556008)(66946007)(81166006)(81156014)(5660300002)(52536014)(53936002)(236005)(68736007)(71200400001)(9686003)(6246003)(71190400001)(54896002)(6306002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2895;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: wJ2kid84XRGxVI2mxiZ2aJhXYsf6oE7dFQhidf8s9x9R78fBqRwpL7cW+7HMwI+Gbof96V2g/fJcw80aYjP5gVbJdi/AyJfqARJbCKEPC6iEG+pW523Fq8rNEClOja9X7tN8qu7/jOTpwK5qZJouwHROO3G8lH1BESHIPyJdpfPSljuqqVszMI/nSfjvogrwilDd6ADZOYJkJ1bZAhUdXsOBh57EbDJ+ebk0FsXrD/henz9nvXClgqLMnqYDpaODn5LcKOsMPrsmT7ACwIVv9FJ4ezganVmSmPwPy+IF42Y9jB/0lFlAmiF5m6OMyR5q0sbdIDt2kT3q54aVQ+60zBy/Z+AujjiOsKEexLOEQya5UudGLlB1KqbR1KAvQFwzJ9C5YGcbY1gLwI2IwHp70crPEnxZ3KruWBoMw87YdZ4=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 299620c6-1764-43c9-b70c-08d70e66d6c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2019 05:38:34.4626 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kevwa@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2895
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ORD7CgDwxPoDi9amk1iyr0hxtKmEpv0h0UD4kBthPMY=;
 b=vmycOl/+BRRbOeY5UaUwy8Mas4gSPo6LrbETeTINd/5monOPt36krbigR12pXWv14gLiOkuahqb32asLUUOYaVUjYDGUQSRBxZc2874AowdQiG9hE7ZbFqlR6isCUamMvf6QcfAbKrLZLJQGkH16Zar4X6BObTB8+DrZMWBw2S4=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Content-Type: multipart/mixed; boundary="===============0355109316=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0355109316==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB3296FAF9BF4C2FBAF12C2496A2C40MN2PR12MB3296namp_"

--_000_MN2PR12MB3296FAF9BF4C2FBAF12C2496A2C40MN2PR12MB3296namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

you should check return value in smu anytime.


+       smu_feature_set_enabled(smu, SMU_FEATURE_VCN_PG_BIT, enable);
+


Reviewed-by: Kevin Wang <kevin1.wang@amd.com>


Best Regards,
kevin

________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Feng, Ke=
nneth <Kenneth.Feng@amd.com>
Sent: Monday, July 22, 2019 12:28:40 PM
To: Quan, Evan <Evan.Quan@amd.com>; amd-gfx@lists.freedesktop.org <amd-gfx@=
lists.freedesktop.org>
Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Quan, Evan <Evan.Quan@a=
md.com>
Subject: RE: [PATCH 4/5] drm/amd/powerplay: correct Navi10 VCN powergate co=
ntrol

Reviewed-by: Kenneth Feng <kenneth.feng@amd.com>


-----Original Message-----
From: amd-gfx [mailto:amd-gfx-bounces@lists.freedesktop.org] On Behalf Of E=
van Quan
Sent: Monday, July 22, 2019 11:16 AM
To: amd-gfx@lists.freedesktop.org
Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Quan, Evan <Evan.Quan@a=
md.com>
Subject: [PATCH 4/5] drm/amd/powerplay: correct Navi10 VCN powergate contro=
l

[CAUTION: External Email]

No VCN DPM bit check as that's different from VCN PG. Also no extra check f=
or possible double enablement/disablement as that's already done by VCN.

Change-Id: I59c63829cf4dcb8093fde1ca8245b613ab2d90df
Signed-off-by: Evan Quan <evan.quan@amd.com>
---
 drivers/gpu/drm/amd/powerplay/navi10_ppt.c | 26 ++++++++--------------
 1 file changed, 9 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c b/drivers/gpu/drm/a=
md/powerplay/navi10_ppt.c
index c8ce9bbae276..2198d373d38c 100644
--- a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
@@ -591,27 +591,19 @@ static int navi10_set_default_dpm_table(struct smu_co=
ntext *smu)  static int navi10_dpm_set_uvd_enable(struct smu_context *smu, =
bool enable)  {
        int ret =3D 0;
-       struct smu_power_context *smu_power =3D &smu->smu_power;
-       struct smu_power_gate *power_gate =3D &smu_power->power_gate;

-       if (enable && power_gate->uvd_gated) {
-               if (smu_feature_is_enabled(smu, SMU_FEATURE_DPM_UVD_BIT)) {
-                       ret =3D smu_send_smc_msg_with_param(smu, SMU_MSG_Po=
werUpVcn, 1);
-                       if (ret)
-                               return ret;
-               }
-               power_gate->uvd_gated =3D false;
+       if (enable) {
+               ret =3D smu_send_smc_msg_with_param(smu, SMU_MSG_PowerUpVcn=
, 1);
+               if (ret)
+                       return ret;
        } else {
-               if (!enable && !power_gate->uvd_gated) {
-                       if (smu_feature_is_enabled(smu, SMU_FEATURE_DPM_UVD=
_BIT)) {
-                               ret =3D smu_send_smc_msg(smu, SMU_MSG_Power=
DownVcn);
-                               if (ret)
-                                       return ret;
-                       }
-                       power_gate->uvd_gated =3D true;
-               }
+               ret =3D smu_send_smc_msg(smu, SMU_MSG_PowerDownVcn);
+               if (ret)
+                       return ret;
        }

+       smu_feature_set_enabled(smu, SMU_FEATURE_VCN_PG_BIT, enable);
+
        return 0;
 }

--
2.22.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_MN2PR12MB3296FAF9BF4C2FBAF12C2496A2C40MN2PR12MB3296namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt;color:#000000;font=
-family:Calibri,Helvetica,sans-serif;" dir=3D"ltr">
<p style=3D"margin-top:0;margin-bottom:0">you should check return value in =
smu anytime.</p>
<p style=3D"margin-top:0;margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0;margin-bottom:0"><span style=3D"color: rgb(33, 33,=
 33); font-family: wf_segoe-ui_normal, &quot;Segoe UI&quot;, &quot;Segoe WP=
&quot;, Tahoma, Arial, sans-serif, serif, EmojiFont; font-size: 14.6667px;"=
>&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smu_feature_set_enabled(smu, SMU=
_FEATURE_VCN_PG_BIT,
 enable);</span><br style=3D"color: rgb(33, 33, 33); font-family: wf_segoe-=
ui_normal, &quot;Segoe UI&quot;, &quot;Segoe WP&quot;, Tahoma, Arial, sans-=
serif, serif, EmojiFont; font-size: 14.6667px;">
<span style=3D"color: rgb(33, 33, 33); font-family: wf_segoe-ui_normal, &qu=
ot;Segoe UI&quot;, &quot;Segoe WP&quot;, Tahoma, Arial, sans-serif, serif, =
EmojiFont; font-size: 14.6667px;">&#43;</span><br>
</p>
<p style=3D"margin-top:0;margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0;margin-bottom:0">Reviewed-by: Kevin Wang &lt;kevin=
1.wang@amd.com&gt;</p>
<p style=3D"margin-top:0;margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0;margin-bottom:0">Best Regards,<br>
kevin</p>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Feng, Kenneth &lt;Kenneth.Fen=
g@amd.com&gt;<br>
<b>Sent:</b> Monday, July 22, 2019 12:28:40 PM<br>
<b>To:</b> Quan, Evan &lt;Evan.Quan@amd.com&gt;; amd-gfx@lists.freedesktop.=
org &lt;amd-gfx@lists.freedesktop.org&gt;<br>
<b>Cc:</b> Deucher, Alexander &lt;Alexander.Deucher@amd.com&gt;; Quan, Evan=
 &lt;Evan.Quan@amd.com&gt;<br>
<b>Subject:</b> RE: [PATCH 4/5] drm/amd/powerplay: correct Navi10 VCN power=
gate control</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Reviewed-by: Kenneth Feng &lt;kenneth.feng@amd.com=
&gt;<br>
<br>
<br>
-----Original Message-----<br>
From: amd-gfx [<a href=3D"mailto:amd-gfx-bounces@lists.freedesktop.org">mai=
lto:amd-gfx-bounces@lists.freedesktop.org</a>] On Behalf Of Evan Quan<br>
Sent: Monday, July 22, 2019 11:16 AM<br>
To: amd-gfx@lists.freedesktop.org<br>
Cc: Deucher, Alexander &lt;Alexander.Deucher@amd.com&gt;; Quan, Evan &lt;Ev=
an.Quan@amd.com&gt;<br>
Subject: [PATCH 4/5] drm/amd/powerplay: correct Navi10 VCN powergate contro=
l<br>
<br>
[CAUTION: External Email]<br>
<br>
No VCN DPM bit check as that's different from VCN PG. Also no extra check f=
or possible double enablement/disablement as that's already done by VCN.<br=
>
<br>
Change-Id: I59c63829cf4dcb8093fde1ca8245b613ab2d90df<br>
Signed-off-by: Evan Quan &lt;evan.quan@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/powerplay/navi10_ppt.c | 26 &#43;&#43;&#43;&#43;&=
#43;&#43;&#43;&#43;--------------<br>
&nbsp;1 file changed, 9 insertions(&#43;), 17 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c b/drivers/gpu/drm/a=
md/powerplay/navi10_ppt.c<br>
index c8ce9bbae276..2198d373d38c 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c<br>
@@ -591,27 &#43;591,19 @@ static int navi10_set_default_dpm_table(struct sm=
u_context *smu)&nbsp; static int navi10_dpm_set_uvd_enable(struct smu_conte=
xt *smu, bool enable)&nbsp; {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret =3D 0;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct smu_power_context *smu_power =
=3D &amp;smu-&gt;smu_power;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct smu_power_gate *power_gate =3D=
 &amp;smu_power-&gt;power_gate;<br>
<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (enable &amp;&amp; power_gate-&gt;=
uvd_gated) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (smu_feature_is_enabled(smu, SMU_FEATURE_DPM_UVD_BIT)) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D smu_send=
_smc_msg_with_param(smu, SMU_MSG_PowerUpVcn, 1);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; }<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; power_gate-&gt;uvd_gated =3D false;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (enable) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; ret =3D smu_send_smc_msg_with_param(smu, SMU_MSG_PowerUpVcn,=
 1);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (ret)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (!enable &amp;&amp; !power_gate-&gt;uvd_gated) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (smu_feature_=
is_enabled(smu, SMU_FEATURE_DPM_UVD_BIT)) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D smu_send_smc_msg(smu, SMU_MSG_Power=
DownVcn);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; return ret;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; power_gate-&gt;u=
vd_gated =3D true;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; }<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; ret =3D smu_send_smc_msg(smu, SMU_MSG_PowerDownVcn);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (ret)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smu_feature_set_enabled(smu, SMU_=
FEATURE_VCN_PG_BIT, enable);<br>
&#43;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&nbsp;}<br>
<br>
--<br>
2.22.0<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a><br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a></div>
</span></font></div>
</body>
</html>

--_000_MN2PR12MB3296FAF9BF4C2FBAF12C2496A2C40MN2PR12MB3296namp_--

--===============0355109316==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0355109316==--
