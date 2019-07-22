Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF156F99D
	for <lists+amd-gfx@lfdr.de>; Mon, 22 Jul 2019 08:45:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2938A89AA6;
	Mon, 22 Jul 2019 06:45:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730041.outbound.protection.outlook.com [40.107.73.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 409BF89AA6
 for <amd-gfx@lists.freedesktop.org>; Mon, 22 Jul 2019 06:45:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BMVUjWF53cApCcqTMSur61eOMqd8HXFWd0XRFkAvu45L6VwgSvV6kUSBMVeLdCbU0UiA1H7e29hlNqsXURZmc8gJRLB0IlRFJpDew7TMaVxpbR2btHA8YnqwCRawwiIS6mGwSNE2j6gTAw0M5bUHOSLqGQoFdYs2/eaYEred8GhJpNnDqOzV9JWXXCc424q/azPuQS6tOWSCE+6bIqx1OwDf9ZcUMqxhqn+ll7pAJhhYFn2bsdgZBEZctTpHj8BEzSUYy1B3ki+RTWNJfIfPVry03VjfaNyHuOjg4WlGk9rxhRnUdXhTpSBxiq/Z+Ccas5cgE6oak1/u+MCnlrNkBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7APJG9Jq1ptlOOGM/7cFx6OK028torAVqhcqsAhLNdI=;
 b=OsqBwrRvAV13HOoc8GHaibxrZib8xT4jmOILiYzfoAO7a30mFKsfzggjBqdvrRMrndcizb/0ixJ7sXokE9bTW9S5DnniRUljTs9xT3WVawuM1u8TWN3DOLDom5Z6NEyAq57E3YWaTkeGct5ALoYXDQwxIEwqMRNPW/L0IR5gXJDQIorb4EHuVz7OZxWjrcjQUqK1F0W3Y7f2S3e64crepugO8635FvkTCHiQNxTgu1ugIfpUjvPBBLAwwedvfzYS6/R8vGE2yMb3wG/adIU5FfBU31Jfx4GFIdR0LzWWRqVxjbZl9I5NJ4ja7LRsmmUZY9b/1EiOdV2FoOtzKdJMQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB4016.namprd12.prod.outlook.com (10.255.239.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Mon, 22 Jul 2019 06:45:50 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::ad59:f055:2417:660f]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::ad59:f055:2417:660f%6]) with mapi id 15.20.2094.013; Mon, 22 Jul 2019
 06:45:50 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, "Feng, Kenneth" <Kenneth.Feng@amd.com>, 
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 4/5] drm/amd/powerplay: correct Navi10 VCN powergate
 control
Thread-Topic: [PATCH 4/5] drm/amd/powerplay: correct Navi10 VCN powergate
 control
Thread-Index: AQHVQDvUVJFTAN8Ka0iVBI04I9wOlabWC2gAgAATFL+AABJLAIAAADRf
Date: Mon, 22 Jul 2019 06:45:50 +0000
Message-ID: <MN2PR12MB3296E38CE149D8E63334B573A2C40@MN2PR12MB3296.namprd12.prod.outlook.com>
References: <20190722031531.23437-1-evan.quan@amd.com>
 <20190722031531.23437-5-evan.quan@amd.com>,
 <MN2PR12MB359851CA088A334EC52E36DE8EC40@MN2PR12MB3598.namprd12.prod.outlook.com>
 <MN2PR12MB3296FAF9BF4C2FBAF12C2496A2C40@MN2PR12MB3296.namprd12.prod.outlook.com>,
 <MN2PR12MB3344303C47BE91884B6D6293E4C40@MN2PR12MB3344.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB3344303C47BE91884B6D6293E4C40@MN2PR12MB3344.namprd12.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ffec9163-494b-4b37-2b25-08d70e703c2d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB4016; 
x-ms-traffictypediagnostic: MN2PR12MB4016:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB4016D909958BD8A27B2A0C82A2C40@MN2PR12MB4016.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 01068D0A20
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39850400004)(396003)(136003)(346002)(376002)(199004)(189003)(13464003)(486006)(6436002)(3846002)(110136005)(478600001)(316002)(76176011)(6116002)(86362001)(25786009)(4326008)(2501003)(71190400001)(71200400001)(7696005)(14454004)(68736007)(74316002)(6506007)(8676002)(53546011)(476003)(81156014)(81166006)(2906002)(102836004)(26005)(7736002)(6606003)(19627235002)(5660300002)(8936002)(186003)(66066001)(6246003)(76116006)(6306002)(966005)(53936002)(66476007)(66556008)(229853002)(66946007)(52536014)(19627405001)(236005)(55016002)(33656002)(64756008)(66446008)(446003)(11346002)(54896002)(9686003)(99286004)(256004)(14444005)(606006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4016;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 5XXLm5RDArhlfgpooZq1lKxaAkJ1Pu3kKitBfc4cuB0PSIerYqhz+HQ1Fj5t358uyQwarMjbpvAOcCYmXP2cgvQOFbcndjVuaKll36YdWY/8y/g4MBfyrRUcelQAUDH4Mp8Z6hgVLJ/3r3Uu0sTSxgrmBspaURS/UZbu9Rm8CWwxO3THZiBOU/7zuauvRvPFcj/o8+9YOvrekQE25cMNIS+ZiiJwaHHqUCbnT8/RH02ex+5T5NT15jJhqbwrT/WTwLq6tDPj41BhiHIpv74GX2CNX0wVaW6gM88UrBzQ92mxj+QVYljwa0ZnsTaT6fbvBPcL/RiuMHiIA1m7dqLUZ+TRactJ3wzH1K/n5YSoi+a53ouIP4fxf2qMZS1aXbrWwkQokd6FkzCZp2d1TPppEzUS/XGFTlhOfrjY7FH7Deo=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffec9163-494b-4b37-2b25-08d70e703c2d
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2019 06:45:50.3704 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kevwa@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4016
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7APJG9Jq1ptlOOGM/7cFx6OK028torAVqhcqsAhLNdI=;
 b=eZ1Na17jM2T5Mmm47zs1jncXEXATat/4e65u4JjTO8oLZRCCZeCr+7z1toP97tZjbt1KDWnoMkVPEtCQDoKlBunE/JM7jQp9zqKEUqVei+q+srxtbZr2GmYsk0tU55swrVjyyhG9PdBFV28asI4cNuXWotaNElvFAkWtCk7zNLI=
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
Content-Type: multipart/mixed; boundary="===============1066937906=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1066937906==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB3296E38CE149D8E63334B573A2C40MN2PR12MB3296namp_"

--_000_MN2PR12MB3296E38CE149D8E63334B573A2C40MN2PR12MB3296namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

It's not necessary in the current code,
but if you update the implementation of the API one day,
your code won't look so strong.
I don't recommend it.

Best Regards,
Kevin


________________________________
From: Quan, Evan <Evan.Quan@amd.com>
Sent: Monday, July 22, 2019 2:42:26 PM
To: Wang, Kevin(Yang) <Kevin1.Wang@amd.com>; Feng, Kenneth <Kenneth.Feng@am=
d.com>; amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Cc: Deucher, Alexander <Alexander.Deucher@amd.com>
Subject: RE: [PATCH 4/5] drm/amd/powerplay: correct Navi10 VCN powergate co=
ntrol


That does not really matters. The API will still return success even on smu=
_feature_set_enabled failure. It does not care about smu_feature_set_enable=
d failure.

But it helps me find another issue(about the naming smu_feature_set_enabled=
). I just sent out a patch to address that.



Regards,

Evan

From: Wang, Kevin(Yang) <Kevin1.Wang@amd.com>
Sent: Monday, July 22, 2019 1:39 PM
To: Feng, Kenneth <Kenneth.Feng@amd.com>; Quan, Evan <Evan.Quan@amd.com>; a=
md-gfx@lists.freedesktop.org
Cc: Deucher, Alexander <Alexander.Deucher@amd.com>
Subject: Re: [PATCH 4/5] drm/amd/powerplay: correct Navi10 VCN powergate co=
ntrol



you should check return value in smu anytime.



+       smu_feature_set_enabled(smu, SMU_FEATURE_VCN_PG_BIT, enable);
+



Reviewed-by: Kevin Wang <kevin1.wang@amd.com<mailto:kevin1.wang@amd.com>>



Best Regards,
kevin

________________________________

From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org<mailto:amd-gfx-bounces=
@lists.freedesktop.org>> on behalf of Feng, Kenneth <Kenneth.Feng@amd.com<m=
ailto:Kenneth.Feng@amd.com>>
Sent: Monday, July 22, 2019 12:28:40 PM
To: Quan, Evan <Evan.Quan@amd.com<mailto:Evan.Quan@amd.com>>; amd-gfx@lists=
.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org> <amd-gfx@lists.freed=
esktop.org<mailto:amd-gfx@lists.freedesktop.org>>
Cc: Deucher, Alexander <Alexander.Deucher@amd.com<mailto:Alexander.Deucher@=
amd.com>>; Quan, Evan <Evan.Quan@amd.com<mailto:Evan.Quan@amd.com>>
Subject: RE: [PATCH 4/5] drm/amd/powerplay: correct Navi10 VCN powergate co=
ntrol



Reviewed-by: Kenneth Feng <kenneth.feng@amd.com<mailto:kenneth.feng@amd.com=
>>


-----Original Message-----
From: amd-gfx [mailto:amd-gfx-bounces@lists.freedesktop.org] On Behalf Of E=
van Quan
Sent: Monday, July 22, 2019 11:16 AM
To: amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>
Cc: Deucher, Alexander <Alexander.Deucher@amd.com<mailto:Alexander.Deucher@=
amd.com>>; Quan, Evan <Evan.Quan@amd.com<mailto:Evan.Quan@amd.com>>
Subject: [PATCH 4/5] drm/amd/powerplay: correct Navi10 VCN powergate contro=
l

[CAUTION: External Email]

No VCN DPM bit check as that's different from VCN PG. Also no extra check f=
or possible double enablement/disablement as that's already done by VCN.

Change-Id: I59c63829cf4dcb8093fde1ca8245b613ab2d90df
Signed-off-by: Evan Quan <evan.quan@amd.com<mailto:evan.quan@amd.com>>
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
amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_MN2PR12MB3296E38CE149D8E63334B573A2C40MN2PR12MB3296namp_
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
<p style=3D"margin-top:0;margin-bottom:0"></p>
<div>It's not necessary in the current code,&nbsp;</div>
<div>but if you update the implementation of the API one day,&nbsp;</div>
<div>your code won't look so strong.&nbsp;
<div>I don't recommend it.</div>
</div>
<div><br>
</div>
<div>Best Regards,<br>
Kevin</div>
<br>
<p></p>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Quan, Evan &lt;Evan.Q=
uan@amd.com&gt;<br>
<b>Sent:</b> Monday, July 22, 2019 2:42:26 PM<br>
<b>To:</b> Wang, Kevin(Yang) &lt;Kevin1.Wang@amd.com&gt;; Feng, Kenneth &lt=
;Kenneth.Feng@amd.com&gt;; amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.=
freedesktop.org&gt;<br>
<b>Cc:</b> Deucher, Alexander &lt;Alexander.Deucher@amd.com&gt;<br>
<b>Subject:</b> RE: [PATCH 4/5] drm/amd/powerplay: correct Navi10 VCN power=
gate control</font>
<div>&nbsp;</div>
</div>
<style>
<!--
@font-face
	{font-family:SimSun}
@font-face
	{font-family:"Cambria Math"}
@font-face
	{font-family:Calibri}
@font-face
	{font-family:SimSun}
@font-face
	{font-family:"Segoe UI"}
p.x_MsoNormal, li.x_MsoNormal, div.x_MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif}
a:link, span.x_MsoHyperlink
	{color:blue;
	text-decoration:underline}
a:visited, span.x_MsoHyperlinkFollowed
	{color:purple;
	text-decoration:underline}
p.x_msonormal0, li.x_msonormal0, div.x_msonormal0
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif}
span.x_EmailStyle20
	{font-family:"Calibri",sans-serif;
	color:windowtext}
.x_MsoChpDefault
	{font-size:10.0pt}
@page WordSection1
	{margin:1.0in 1.25in 1.0in 1.25in}
div.x_WordSection1
	{}
-->
</style>
<div lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"x_WordSection1">
<p class=3D"x_MsoNormal">That does not really matters. The API will still r=
eturn success even on
<span style=3D"font-family:&quot;Segoe UI&quot;,sans-serif; color:#212121">=
smu_feature_set_enabled failure. It does not care about smu_feature_set_ena=
bled failure.</span></p>
<p class=3D"x_MsoNormal">But it helps me find another issue(about the namin=
g smu_feature_set_enabled). I just sent out a patch to address that.</p>
<p class=3D"x_MsoNormal">&nbsp;</p>
<p class=3D"x_MsoNormal">Regards,</p>
<p class=3D"x_MsoNormal">Evan</p>
<div style=3D"border:none; border-left:solid blue 1.5pt; padding:0in 0in 0i=
n 4.0pt">
<div>
<div style=3D"border:none; border-top:solid #E1E1E1 1.0pt; padding:3.0pt 0i=
n 0in 0in">
<p class=3D"x_MsoNormal"><b>From:</b> Wang, Kevin(Yang) &lt;Kevin1.Wang@amd=
.com&gt; <br>
<b>Sent:</b> Monday, July 22, 2019 1:39 PM<br>
<b>To:</b> Feng, Kenneth &lt;Kenneth.Feng@amd.com&gt;; Quan, Evan &lt;Evan.=
Quan@amd.com&gt;; amd-gfx@lists.freedesktop.org<br>
<b>Cc:</b> Deucher, Alexander &lt;Alexander.Deucher@amd.com&gt;<br>
<b>Subject:</b> Re: [PATCH 4/5] drm/amd/powerplay: correct Navi10 VCN power=
gate control</p>
</div>
</div>
<p class=3D"x_MsoNormal">&nbsp;</p>
<div id=3D"x_divtagdefaultwrapper">
<p><span style=3D"font-size:12.0pt; color:black">you should check return va=
lue in smu anytime.</span></p>
<p><span style=3D"font-size:12.0pt; color:black">&nbsp;</span></p>
<p><span style=3D"font-family:&quot;Segoe UI&quot;,sans-serif; color:#21212=
1">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smu_feature_set_enabled(smu, S=
MU_FEATURE_VCN_PG_BIT, enable);<br>
&#43;</span><span style=3D"font-size:12.0pt; color:black"></span></p>
<p><span style=3D"font-size:12.0pt; color:black">&nbsp;</span></p>
<p><span style=3D"font-size:12.0pt; color:black">Reviewed-by: Kevin Wang &l=
t;<a href=3D"mailto:kevin1.wang@amd.com">kevin1.wang@amd.com</a>&gt;</span>=
</p>
<p><span style=3D"font-size:12.0pt; color:black">&nbsp;</span></p>
<p><span style=3D"font-size:12.0pt; color:black">Best Regards,<br>
kevin</span></p>
</div>
<div class=3D"x_MsoNormal" align=3D"center" style=3D"text-align:center">
<hr size=3D"2" width=3D"98%" align=3D"center">
</div>
<div id=3D"x_divRplyFwdMsg">
<p class=3D"x_MsoNormal"><b><span style=3D"color:black">From:</span></b><sp=
an style=3D"color:black"> amd-gfx &lt;<a href=3D"mailto:amd-gfx-bounces@lis=
ts.freedesktop.org">amd-gfx-bounces@lists.freedesktop.org</a>&gt; on behalf=
 of Feng, Kenneth &lt;<a href=3D"mailto:Kenneth.Feng@amd.com">Kenneth.Feng@=
amd.com</a>&gt;<br>
<b>Sent:</b> Monday, July 22, 2019 12:28:40 PM<br>
<b>To:</b> Quan, Evan &lt;<a href=3D"mailto:Evan.Quan@amd.com">Evan.Quan@am=
d.com</a>&gt;;
<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.=
org</a> &lt;<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.=
freedesktop.org</a>&gt;<br>
<b>Cc:</b> Deucher, Alexander &lt;<a href=3D"mailto:Alexander.Deucher@amd.c=
om">Alexander.Deucher@amd.com</a>&gt;; Quan, Evan &lt;<a href=3D"mailto:Eva=
n.Quan@amd.com">Evan.Quan@amd.com</a>&gt;<br>
<b>Subject:</b> RE: [PATCH 4/5] drm/amd/powerplay: correct Navi10 VCN power=
gate control</span>
</p>
<div>
<p class=3D"x_MsoNormal">&nbsp;</p>
</div>
</div>
<div>
<div>
<p class=3D"x_MsoNormal">Reviewed-by: Kenneth Feng &lt;<a href=3D"mailto:ke=
nneth.feng@amd.com">kenneth.feng@amd.com</a>&gt;<br>
<br>
<br>
-----Original Message-----<br>
From: amd-gfx [<a href=3D"mailto:amd-gfx-bounces@lists.freedesktop.org">mai=
lto:amd-gfx-bounces@lists.freedesktop.org</a>] On Behalf Of Evan Quan<br>
Sent: Monday, July 22, 2019 11:16 AM<br>
To: <a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesk=
top.org</a><br>
Cc: Deucher, Alexander &lt;<a href=3D"mailto:Alexander.Deucher@amd.com">Ale=
xander.Deucher@amd.com</a>&gt;; Quan, Evan &lt;<a href=3D"mailto:Evan.Quan@=
amd.com">Evan.Quan@amd.com</a>&gt;<br>
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
Signed-off-by: Evan Quan &lt;<a href=3D"mailto:evan.quan@amd.com">evan.quan=
@amd.com</a>&gt;<br>
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
<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.=
org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a><br>
_______________________________________________<br>
amd-gfx mailing list<br>
<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.=
org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a></p>
</div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_MN2PR12MB3296E38CE149D8E63334B573A2C40MN2PR12MB3296namp_--

--===============1066937906==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1066937906==--
