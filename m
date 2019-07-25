Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E693674ED1
	for <lists+amd-gfx@lfdr.de>; Thu, 25 Jul 2019 15:08:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73E346E748;
	Thu, 25 Jul 2019 13:08:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720082.outbound.protection.outlook.com [40.107.72.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC9916E748
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Jul 2019 13:08:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UqF/v7DEa9RPqe98gpp/Gvf0ufYhzwpaMZFF/EksuJosMT4g07nnkAA4LrTQUy5Stne4pZLud7mI42QMQP88lBasx4Ogv1cgUGkDQa3+gzZp+yTSJ6Dv4AUlgUKMLTWpjH1+Aw3An454YQWuvOtndtnlTmyfYX9I6yAqdiRqZy+tLMAdDHJe7rkoW807/rnEntS1REvNiv4XGMGjtdpo0oMXgglaH99n3L60gIRDRzSV+voB6071ITweTmCeYlO2LKKWgvBtnqYN/SMziCQWr1KhrhrbXJB0JsdYTGZqxWEn0YmX8qVPaz4Jq9KM4reJbm2fKIaM0tC4qOWIT13euA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yLC4v/TqvQf/gTY8tkyeqQPufYctwTJRhWPO+0i2msA=;
 b=lAGiWpgSakO+SxoGhAeAYhhWQCMdqiHZdKkOnLBC326WRn5dpPkpwzLHbdzBburIKILgFzq6cXsuX5+wiGtKbSkDwyh/TtBGrYGQE7wTi63wlUhK81syRBlTQF1hsi3h8PkYwADknR/D9XvnB3bQsFaHHDsW4Ca4qG040QQS1BNtAzrAyapj8ZK6Gw1hpARkH96Xe0u4k9m+5AiwFg80dtkVJ8AFxa0w2oP22sb819nSpOfONfE3V9zxMPY3bRj2CBRWnIlluSnKfXJngQPscanVEQnXZnuGZG7jBn2uPsBzgdyiKLul9TDM/+BQ0eoyh8MuH9ulOkYJYE2TcbeV/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB3279.namprd12.prod.outlook.com (20.179.83.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Thu, 25 Jul 2019 13:08:23 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::ad59:f055:2417:660f]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::ad59:f055:2417:660f%6]) with mapi id 15.20.2094.013; Thu, 25 Jul 2019
 13:08:23 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/amd/powerplay: enable SW SMU reset functionality
Thread-Topic: [PATCH 2/2] drm/amd/powerplay: enable SW SMU reset functionality
Thread-Index: AQHVQpI92G4YiNI/6E21hHOGr2dgvqbbTUfF
Date: Thu, 25 Jul 2019 13:08:23 +0000
Message-ID: <MN2PR12MB3296605E0E8E85F415368D46A2C10@MN2PR12MB3296.namprd12.prod.outlook.com>
References: <20190725023930.22521-1-evan.quan@amd.com>,
 <20190725023930.22521-2-evan.quan@amd.com>
In-Reply-To: <20190725023930.22521-2-evan.quan@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [58.246.140.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6dd21241-3699-4ce1-9f41-08d711012c69
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3279; 
x-ms-traffictypediagnostic: MN2PR12MB3279:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB327972EA97517CA77AAF0889A2C10@MN2PR12MB3279.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0109D382B0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(136003)(366004)(346002)(396003)(199004)(189003)(81166006)(236005)(606006)(478600001)(2501003)(9686003)(26005)(6306002)(52536014)(55016002)(25786009)(53936002)(14454004)(7696005)(486006)(99286004)(6436002)(66066001)(54896002)(476003)(86362001)(66446008)(66556008)(229853002)(5660300002)(66476007)(6246003)(66946007)(76116006)(316002)(7736002)(2906002)(33656002)(102836004)(966005)(186003)(74316002)(64756008)(110136005)(71190400001)(71200400001)(8676002)(6506007)(6116002)(256004)(3846002)(105004)(68736007)(81156014)(446003)(11346002)(8936002)(19627405001)(76176011)(53546011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3279;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ouCS8jiqUgAk5sSsdhTBWZAdZfeKqsvIQBxcYNDSf8L5dg//J1Jcuxq+4UfGw7aj/fT7gDMaQ13YcjAtpu8ESRQioWYx0P8axbtl7NQAjZTAJekG1lrBkypPkuC2Zfq4SpehJ52HL63X/d0Z9fBc3XJD3wJaBb40HN/7f0R+FJoaplULXs9MweuhSN7SqTmRywgbBnEvS9vPTQHl2cfYL4yzKmGovEXRRU1544oHhT9IydxzvwtIA2vtvQdsco6Ee3Gc1MfqQ/tRDoG7qDlUd3p0mUtqZuKSknpUpB3mrViaB9zMR3tHIevaiFgOYFpER4RH5gsHiFxtTcGQ6q0R7o8Hu764VEeHOO4opfOJkrF4NP8Ut7SLAvlNaQfHGQcN8VRRF6n1X8sTLaTWUOtL3dTx8Lx4TDKuQxJkbONdL8I=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dd21241-3699-4ce1-9f41-08d711012c69
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2019 13:08:23.0865 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kevwa@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3279
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yLC4v/TqvQf/gTY8tkyeqQPufYctwTJRhWPO+0i2msA=;
 b=yC8kXrPRLZtpmvOVHmUIyqlNVDyhhl6dgaJzuV/1UOnDIOZN9133cb2JrsUESYLLITatfGgtZ4HVkjacDjVnMMCSenn7relZyGJscXDwmlUGWnxtZinpOxG7ek4TkeSWxVwC0BV8tDUsTecu7c4H7yDkI9QknoaefAm4DlM5Z80=
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
Content-Type: multipart/mixed; boundary="===============1901860991=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1901860991==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB3296605E0E8E85F415368D46A2C10MN2PR12MB3296namp_"

--_000_MN2PR12MB3296605E0E8E85F415368D46A2C10MN2PR12MB3296namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I don't recommend that, because obviously this is a hardware operation, so =
why need to move it  into sw init?
Is this a workaround solution, or is it specific to which asic?
and set pptable from sysfs and do baco reset operation need to call these f=
unctions, have you test it?
the function in amdgpu_smu.c and smu_v11_0.c need work correctly in all asi=
c,
it needs to be done carefully, unless there is a good reason.

Best Regards,
Kevin

________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Evan Qua=
n <evan.quan@amd.com>
Sent: Thursday, July 25, 2019 10:39 AM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Cc: Quan, Evan <Evan.Quan@amd.com>
Subject: [PATCH 2/2] drm/amd/powerplay: enable SW SMU reset functionality

Move SMU irq handler register to sw_init as that's totally
software related. Otherwise, it will prevent SMU reset working.

Change-Id: Ibd3e48ae9a90ab57f42b3f2ddbb736deeebc8715
Signed-off-by: Evan Quan <evan.quan@amd.com>
---
 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c b/drivers/gpu/drm/a=
md/powerplay/amdgpu_smu.c
index 6935a00cd389..a5079b93caa3 100644
--- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
@@ -741,6 +741,12 @@ static int smu_sw_init(void *handle)
                 return ret;
         }

+       ret =3D smu_register_irq_handler(smu);
+       if (ret) {
+               pr_err("Failed to register smc irq handler!\n");
+               return ret;
+       }
+
         return 0;
 }

@@ -750,6 +756,9 @@ static int smu_sw_fini(void *handle)
         struct smu_context *smu =3D &adev->smu;
         int ret;

+       kfree(smu->irq_source);
+       smu->irq_source =3D NULL;
+
         ret =3D smu_smc_table_sw_fini(smu);
         if (ret) {
                 pr_err("Failed to sw fini smc table!\n");
@@ -1061,10 +1070,6 @@ static int smu_hw_init(void *handle)
         if (ret)
                 goto failed;

-       ret =3D smu_register_irq_handler(smu);
-       if (ret)
-               goto failed;
-
         if (!smu->pm_enabled)
                 adev->pm.dpm_enabled =3D false;
         else
@@ -1094,9 +1099,6 @@ static int smu_hw_fini(void *handle)
         kfree(table_context->overdrive_table);
         table_context->overdrive_table =3D NULL;

-       kfree(smu->irq_source);
-       smu->irq_source =3D NULL;
-
         ret =3D smu_fini_fb_allocations(smu);
         if (ret)
                 return ret;
--
2.22.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_MN2PR12MB3296605E0E8E85F415368D46A2C10MN2PR12MB3296namp_
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
<div id=3D"appendonsend" style=3D"font-family: Calibri, Arial, Helvetica, s=
ans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
I don't recommend that, because obviously this is a <b>hardware</b> <b>oper=
ation</b>, so why need to move it&nbsp; into
<b>sw</b> <b>init</b>?<br>
<div>Is this a workaround solution, or is it specific to which asic?<br>
</div>
</div>
<div id=3D"appendonsend" style=3D"font-family: Calibri, Arial, Helvetica, s=
ans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt;">and set pptable from sysfs and do baco reset=
 operation need to call these functions, have you test it?</span><br>
</div>
<div id=3D"appendonsend" style=3D"font-family: Calibri, Arial, Helvetica, s=
ans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
the function in amdgpu_smu.c and smu_v11_0.c need work correctly in all asi=
c,</div>
<div id=3D"appendonsend" style=3D"font-family: Calibri, Arial, Helvetica, s=
ans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<span>it needs to be done carefully, unless there is a good reason.<br>
</span>
<div><br>
</div>
</div>
<div id=3D"appendonsend" style=3D"font-family: Calibri, Arial, Helvetica, s=
ans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<span>Best Regards,<br>
Kevin</span></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Evan Quan &lt;evan.quan@amd.c=
om&gt;<br>
<b>Sent:</b> Thursday, July 25, 2019 10:39 AM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> Quan, Evan &lt;Evan.Quan@amd.com&gt;<br>
<b>Subject:</b> [PATCH 2/2] drm/amd/powerplay: enable SW SMU reset function=
ality</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">Move SMU irq handler register to sw_init as that's=
 totally<br>
software related. Otherwise, it will prevent SMU reset working.<br>
<br>
Change-Id: Ibd3e48ae9a90ab57f42b3f2ddbb736deeebc8715<br>
Signed-off-by: Evan Quan &lt;evan.quan@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/powerplay/amdgpu_smu.c | 16 &#43;&#43;&#43;&#43;&=
#43;&#43;&#43;&#43;&#43;-------<br>
&nbsp;1 file changed, 9 insertions(&#43;), 7 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c b/drivers/gpu/drm/a=
md/powerplay/amdgpu_smu.c<br>
index 6935a00cd389..a5079b93caa3 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c<br>
@@ -741,6 &#43;741,12 @@ static int smu_sw_init(void *handle)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D smu_register_irq_handler(=
smu);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; pr_err(&quot;Failed to register smc irq handler!\n&quot;);<b=
r>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; return ret;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&nbsp;}<br>
&nbsp;<br>
@@ -750,6 &#43;756,9 @@ static int smu_sw_fini(void *handle)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct smu_context *smu =
=3D &amp;adev-&gt;smu;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret;<br>
&nbsp;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kfree(smu-&gt;irq_source);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smu-&gt;irq_source =3D NULL;<br>
&#43;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D smu_smc_table_sw_f=
ini(smu);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; pr_err(&quot;Failed to sw fini smc table!\n&quot;);<b=
r>
@@ -1061,10 &#43;1070,6 @@ static int smu_hw_init(void *handle)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; goto failed;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D smu_register_irq_handler(smu)=
;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; goto failed;<br>
-<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!smu-&gt;pm_enabled)<b=
r>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; adev-&gt;pm.dpm_enabled =3D false;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
@@ -1094,9 &#43;1099,6 @@ static int smu_hw_fini(void *handle)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kfree(table_context-&gt;ov=
erdrive_table);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; table_context-&gt;overdriv=
e_table =3D NULL;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kfree(smu-&gt;irq_source);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smu-&gt;irq_source =3D NULL;<br>
-<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D smu_fini_fb_alloca=
tions(smu);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return ret;<br>
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

--_000_MN2PR12MB3296605E0E8E85F415368D46A2C10MN2PR12MB3296namp_--

--===============1901860991==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1901860991==--
