Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A9A6F99B
	for <lists+amd-gfx@lfdr.de>; Mon, 22 Jul 2019 08:42:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E04748996E;
	Mon, 22 Jul 2019 06:42:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800074.outbound.protection.outlook.com [40.107.80.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7433589954
 for <amd-gfx@lists.freedesktop.org>; Mon, 22 Jul 2019 06:42:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MzoSbcdRAx63GAvS+2KftUnUW8ou6u5zuISnz5HGp1/LEulYCor3ZKHzo5sW+dcVaXEybouUTcTREZGiVugoc4FiaEJnPs517VCIH1L2n1NnPJTL0+TH6zrHUT0HCI0fUd/w3aepk6lqXFvgW4DqD2JDUdx6vGAhnAqZ2KevGK78yC6Bdf8baMJn7MkidtOu4YwAHyK8TQ490dkaD3mCDGAmDPQBg+/g6d+VrJdMU2SmuY1V38vAflMNegtZxeNcHEWKqe1QkJdxCnbudAMONoTO0XLVZ7yEJcXYqXWr9HXE9BY5DyIAMh01KSacqVA8GY70Ul4HKejkKbEA+mLZxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kQTqTafJoJKU4IOL4XmkAvT/SWqGK4uxtJujlu19HOg=;
 b=MwTKkJR2HJhHXHk361EvFD/XwZEirjjlwO+yph4sq8DSW2jzs9IfNQcCnGZT3H9l5Zl+Qa8J9Ew92KdkyulIMyf5DKTvI9b5NMx0FFdNbpr3C6J6NgmJYnBiBiPcrUqQJqHQCKlkBboJ6C9FjeTN4m5RMgW7v06kOsJ/NaEY0q422R+AiZhCcrNx/c5D9Oe723bM/TtKatwJTRa3r84m1KlLPbeXZ6lDhO9RiHTh3Jl+cJhhBOOSZvC31gU6hDYowy6uuf+9fm+/c/OOy32iEqZdjBKCkUINfNb5zKwMRB1uktE7usilp/zu2UPClEjzskewQTFMzXQSOOjoWl1yYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB3216.namprd12.prod.outlook.com (20.179.82.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Mon, 22 Jul 2019 06:42:26 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::bd9b:19ce:ef42:ab26]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::bd9b:19ce:ef42:ab26%7]) with mapi id 15.20.2094.013; Mon, 22 Jul 2019
 06:42:26 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>, "Feng, Kenneth"
 <Kenneth.Feng@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 4/5] drm/amd/powerplay: correct Navi10 VCN powergate
 control
Thread-Topic: [PATCH 4/5] drm/amd/powerplay: correct Navi10 VCN powergate
 control
Thread-Index: AQHVQDvl9TkNJSi9GEetRpskjwYI/abWC2gAgAAThwCAABBzcA==
Date: Mon, 22 Jul 2019 06:42:26 +0000
Message-ID: <MN2PR12MB3344303C47BE91884B6D6293E4C40@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <20190722031531.23437-1-evan.quan@amd.com>
 <20190722031531.23437-5-evan.quan@amd.com>,
 <MN2PR12MB359851CA088A334EC52E36DE8EC40@MN2PR12MB3598.namprd12.prod.outlook.com>
 <MN2PR12MB3296FAF9BF4C2FBAF12C2496A2C40@MN2PR12MB3296.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB3296FAF9BF4C2FBAF12C2496A2C40@MN2PR12MB3296.namprd12.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 19931b34-e53b-4bd0-2e1a-08d70e6fc294
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3216; 
x-ms-traffictypediagnostic: MN2PR12MB3216:
x-ms-exchange-purlcount: 3
x-microsoft-antispam-prvs: <MN2PR12MB321676889C61DC8A1BEDD34DE4C40@MN2PR12MB3216.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-forefront-prvs: 01068D0A20
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39850400004)(396003)(346002)(376002)(366004)(136003)(13464003)(199004)(189003)(99286004)(33656002)(66066001)(14454004)(606006)(9686003)(236005)(54896002)(81156014)(186003)(81166006)(6306002)(6436002)(74316002)(55016002)(110136005)(53936002)(4326008)(7696005)(6506007)(53546011)(102836004)(76176011)(316002)(6246003)(26005)(486006)(8936002)(8676002)(476003)(478600001)(11346002)(6116002)(790700001)(68736007)(3846002)(966005)(2906002)(256004)(14444005)(7736002)(25786009)(446003)(66946007)(2501003)(76116006)(64756008)(66476007)(66556008)(66446008)(71200400001)(71190400001)(52536014)(86362001)(229853002)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3216;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: VJkoX54S5RRg71NY/gdyJb988KDTp9L12j80eP86cDESKhNFClJE9uWeF9N3oc5RaBccaEXlEHZ1//ALd8rwHtDhbyOGXbwc1MOdYN9xEc1HW+TpVo1ZhqnmsuQ9nMeLij19+vPQZ8mJUaPpxLLeMbmVidsRnYTnbjYY3dvpPiNZUYYg9WhnyaLqOz1OBSFAdaTHp8fE/EGS3yP2/ZAeiNeI1198qUITdpLdtErW+n2IetU1+e9C6yX5A1LIcSJbYr5VquaYYBlnRxt8FVFWQ9+Pl+wvMtyRDX18k1HJNHoaBeXOvpHfNxpTQC3phw1lrbNOQ+kagorp8Y7ponZxUgEuPi7dDwq65dgk1nO++LZLpIwrm0F8nRQSkiB0UQtFe3W+2un0kal93yKX3F6GOuQnRu4GvMMNMIdqarSzYH8=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19931b34-e53b-4bd0-2e1a-08d70e6fc294
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2019 06:42:26.3055 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: equan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3216
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kQTqTafJoJKU4IOL4XmkAvT/SWqGK4uxtJujlu19HOg=;
 b=yh9eS3m8zpMU7t0ZECOlFWvGQBM62lmeuhyXW+a7GH98YHtsvOJOGvTwYUAdlfhOBpfH/warWb31uLzcHPSmuxfryWeWe7SXBfAaoL/I2xa9vwnkH6Vqi4EA/fffgPMGZ0QyKpMh6tub5lT7QIjUuPcFDxUTW/zBkogPw5s7dKk=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Evan.Quan@amd.com; 
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
Content-Type: multipart/mixed; boundary="===============1511240746=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1511240746==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB3344303C47BE91884B6D6293E4C40MN2PR12MB3344namp_"

--_000_MN2PR12MB3344303C47BE91884B6D6293E4C40MN2PR12MB3344namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

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

--_000_MN2PR12MB3344303C47BE91884B6D6293E4C40MN2PR12MB3344namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Segoe UI";
	panose-1:2 11 5 2 4 2 4 2 2 3;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle20
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.25in 1.0in 1.25in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">That does not really matters. The API will still ret=
urn success even on
<span style=3D"font-family:&quot;Segoe UI&quot;,sans-serif;color:#212121">s=
mu_feature_set_enabled failure. It does not care about smu_feature_set_enab=
led failure.</span><o:p></o:p></p>
<p class=3D"MsoNormal">But it helps me find another issue(about the naming =
smu_feature_set_enabled). I just sent out a patch to address that.<o:p></o:=
p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Evan<o:p></o:p></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b>From:</b> Wang, Kevin(Yang) &lt;Kevin1.Wang@amd.c=
om&gt; <br>
<b>Sent:</b> Monday, July 22, 2019 1:39 PM<br>
<b>To:</b> Feng, Kenneth &lt;Kenneth.Feng@amd.com&gt;; Quan, Evan &lt;Evan.=
Quan@amd.com&gt;; amd-gfx@lists.freedesktop.org<br>
<b>Cc:</b> Deucher, Alexander &lt;Alexander.Deucher@amd.com&gt;<br>
<b>Subject:</b> Re: [PATCH 4/5] drm/amd/powerplay: correct Navi10 VCN power=
gate control<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div id=3D"divtagdefaultwrapper">
<p><span style=3D"font-size:12.0pt;color:black">you should check return val=
ue in smu anytime.<o:p></o:p></span></p>
<p><span style=3D"font-size:12.0pt;color:black"><o:p>&nbsp;</o:p></span></p=
>
<p><span style=3D"font-family:&quot;Segoe UI&quot;,sans-serif;color:#212121=
">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smu_feature_set_enabled(smu, SM=
U_FEATURE_VCN_PG_BIT, enable);<br>
&#43;</span><span style=3D"font-size:12.0pt;color:black"><o:p></o:p></span>=
</p>
<p><span style=3D"font-size:12.0pt;color:black"><o:p>&nbsp;</o:p></span></p=
>
<p><span style=3D"font-size:12.0pt;color:black">Reviewed-by: Kevin Wang &lt=
;<a href=3D"mailto:kevin1.wang@amd.com">kevin1.wang@amd.com</a>&gt;<o:p></o=
:p></span></p>
<p><span style=3D"font-size:12.0pt;color:black"><o:p>&nbsp;</o:p></span></p=
>
<p><span style=3D"font-size:12.0pt;color:black">Best Regards,<br>
kevin<o:p></o:p></span></p>
</div>
<div class=3D"MsoNormal" align=3D"center" style=3D"text-align:center">
<hr size=3D"2" width=3D"98%" align=3D"center">
</div>
<div id=3D"divRplyFwdMsg">
<p class=3D"MsoNormal"><b><span style=3D"color:black">From:</span></b><span=
 style=3D"color:black"> amd-gfx &lt;<a href=3D"mailto:amd-gfx-bounces@lists=
.freedesktop.org">amd-gfx-bounces@lists.freedesktop.org</a>&gt; on behalf o=
f Feng, Kenneth &lt;<a href=3D"mailto:Kenneth.Feng@amd.com">Kenneth.Feng@am=
d.com</a>&gt;<br>
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
<o:p></o:p></p>
<div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
</div>
<div>
<div>
<p class=3D"MsoNormal">Reviewed-by: Kenneth Feng &lt;<a href=3D"mailto:kenn=
eth.feng@amd.com">kenneth.feng@amd.com</a>&gt;<br>
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
lists.freedesktop.org/mailman/listinfo/amd-gfx</a><o:p></o:p></p>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_MN2PR12MB3344303C47BE91884B6D6293E4C40MN2PR12MB3344namp_--

--===============1511240746==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1511240746==--
