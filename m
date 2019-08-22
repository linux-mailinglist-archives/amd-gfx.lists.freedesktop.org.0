Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A437D9944A
	for <lists+amd-gfx@lfdr.de>; Thu, 22 Aug 2019 14:54:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F31896E4C7;
	Thu, 22 Aug 2019 12:54:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770085.outbound.protection.outlook.com [40.107.77.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEA146E4C7
 for <amd-gfx@lists.freedesktop.org>; Thu, 22 Aug 2019 12:53:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lxE9P5SK8BSlyZW7UUjJ7WFAbE8/kyC6JWPrxxoEyMxDQ1Y5KLFcq3T/VcNpSvCcRHTJjrzwkU3yC33VFrj6cuoWUyGEY/mmxZQvgVe6VqK8dAhNgVF4uTxOT9yx1V0Xt8IUaPsceqvA3CvAgCPkzKMW5Yqr6KYZaZ4MUVfO17k0OatbIdYZC7wT3JyxJewjKb8zpbAObXAiYm9zH7vaaVr6jjiFM9qqsAkyJKTUqtOQ7BbAahGIIA9gQo+q1k7xL/wLHXH3p4pxR3bJozsNYVB37Cigqk1UK0Wa5fJ6nTRQIH78xlVYcMr0SjSgGXNjZQtnmDGjl7h8cn1LzwP44g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=va20XNfn3m5M7YGsLgzZ9oA1cPkiPlQqXyBstj9GV6Y=;
 b=GFwIaVMZE06EBtgBEJDQaylrrmRxcOPBUX0wIXeFo39/3D+E97khIlLEqocJbDLbK2aFlxW2r+DVq7tI/8huIrQFbO6Z1fWq1iXPNTgbNXgyN1dq8slZXgWJ31CM2IXcGRI0bbbX8Lp99WBvME3nmZrVu+C3PiyOVQRuAQEcBVWOBEGllhmEW9puFA2HBhSPsMiH8BYj6Agme6pB3xhzvg/tiC3ZmTved/mKjjukSYfqpc7eght61uagyj4pHURUJc0iuMPXsZBuitx5C5f/ZsO/j9fBuS+u54JD84fBZXcOJ2yoWZ0G9pQkVIThREe3/HB5fiX1xeDCUXIRALOL2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1746.namprd12.prod.outlook.com (10.175.100.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Thu, 22 Aug 2019 12:53:58 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::8542:935:262c:53d1]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::8542:935:262c:53d1%10]) with mapi id 15.20.2178.020; Thu, 22 Aug 2019
 12:53:58 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Russell, Kent" <Kent.Russell@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: Fix Vega20 Average Power value
Thread-Topic: [PATCH] drm/amdgpu: Fix Vega20 Average Power value
Thread-Index: AQHVWOPefElQedQbPkSP96p3P9pH+KcHHz4V
Date: Thu, 22 Aug 2019 12:53:58 +0000
Message-ID: <BN6PR12MB1809FB98DA053EC712C6375CF7A50@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <20190822121927.32609-1-kent.russell@amd.com>
In-Reply-To: <20190822121927.32609-1-kent.russell@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.219.73.178]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c02171f2-e790-420f-8348-08d726ffcc46
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BN6PR12MB1746; 
x-ms-traffictypediagnostic: BN6PR12MB1746:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB174674D6B29A16186A6397BEF7A50@BN6PR12MB1746.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1247;
x-forefront-prvs: 01371B902F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(136003)(346002)(396003)(376002)(199004)(189003)(76116006)(6436002)(6246003)(66946007)(25786009)(14454004)(229853002)(81166006)(81156014)(8676002)(5660300002)(64756008)(66446008)(66556008)(105004)(52536014)(9686003)(256004)(66476007)(6506007)(76176011)(7696005)(53546011)(236005)(486006)(966005)(478600001)(8936002)(99286004)(2906002)(11346002)(446003)(3846002)(74316002)(26005)(102836004)(110136005)(6116002)(71200400001)(33656002)(66066001)(2501003)(7736002)(19627405001)(71190400001)(53936002)(6306002)(54896002)(86362001)(186003)(55016002)(476003)(606006)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1746;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: y7znVW0zcQMFuw4ij2yrO3R0TP0IG8EELFuCeRDKEk3y34DQxh6z6bNkRQkJT//k0/I0JkKVgdSrvKo0o87uUhlnB+xTrYlv42Uyp2ED9S2zyLFyfVtEWkbSEQlcaiJ3B8wFR/G5x+AoLBISpkbM+GkVG6QTk49jToPmum/n621a8KkW0kNIyOwV0OWkzrnZe+1lqJYumOSMsK7WhL0OwoGhPnJJLAZonMOtaSNtjZR0FTG2cKsGuDEhRX2q2s3OQ5B0lwDAhpi6nX/jNL+6YW0YV4UVBXODY9UTVjJoBh8HVbQYexg5wdZR+KMcjbkkQCMVi0sXEKISlBz9xziRxL9dATg2WL6UzUUY7f2CyJmXjuFjsYkboAz6wcVDStfmF20HdtliKrdRK/Ww8RlCHpM6mtIDmB+17xYzbOYHfVE=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c02171f2-e790-420f-8348-08d726ffcc46
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2019 12:53:58.0934 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h0znXe0KVWWQQUH1pZ651fg3dTJ9kgt7dKMOl8MGMxJ3MlrLj+VGsimWz4NIRqP5F5HV+ekW+o0vDW33g5Zb6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1746
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=va20XNfn3m5M7YGsLgzZ9oA1cPkiPlQqXyBstj9GV6Y=;
 b=3BXBJGo8MhpwBLzxKGXa2z927yt74WHqhnD8oV4CUEAS/gy2PWYL7cofQ99nFhGfW2J8JlszJbca1FTdetRojWq3Pg+E6ZonUE3RZPGWMMz5wPNAcDTTs64ycoQqv5LrbuKqaJHKMwOdU/tBVwbjCHINZzNe6ePta745qNgcv8E=
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
Content-Type: multipart/mixed; boundary="===============0518382446=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0518382446==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB1809FB98DA053EC712C6375CF7A50BN6PR12MB1809namp_"

--_000_BN6PR12MB1809FB98DA053EC712C6375CF7A50BN6PR12MB1809namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Do we need an smu version check?  Will AverageSocketPower report correctly =
on older versions of smu firmware?  Assuming that is ok, patch is:
Acked-by: Alex Deucher <alexander.deucher@amd.com>
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Russell,=
 Kent <Kent.Russell@amd.com>
Sent: Thursday, August 22, 2019 8:19 AM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Cc: Russell, Kent <Kent.Russell@amd.com>
Subject: [PATCH] drm/amdgpu: Fix Vega20 Average Power value

The SMU changed reading from CurrSocketPower to AverageSocketPower, so
reflect this accordingly. This fixes the issue where Average Power
Consumption was being reported as 0 from SMU 40.46-onward

Change-Id: I471f93316820f1401cb497eefe29da68376a4bb9
Signed-off-by: Kent Russell <kent.russell@amd.com>
---
 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c | 2 +-
 drivers/gpu/drm/amd/powerplay/vega20_ppt.c         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c b/drivers/g=
pu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c
index 0516c294b377..1820133f0ceb 100644
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c
+++ b/drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c
@@ -2101,7 +2101,7 @@ static int vega20_get_gpu_power(struct pp_hwmgr *hwmg=
r,
         if (ret)
                 return ret;

-       *query =3D metrics_table.CurrSocketPower << 8;
+       *query =3D metrics_table.AverageSocketPower << 8;

         return ret;
 }
diff --git a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c b/drivers/gpu/drm/a=
md/powerplay/vega20_ppt.c
index e14363182691..17af12ee9e78 100644
--- a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/vega20_ppt.c
@@ -2927,7 +2927,7 @@ static int vega20_get_gpu_power(struct smu_context *s=
mu, uint32_t *value)
         if (ret)
                 return ret;

-       *value =3D metrics.CurrSocketPower << 8;
+       *value =3D metrics.AverageSocketPower << 8;

         return 0;
 }
--
2.17.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB1809FB98DA053EC712C6375CF7A50BN6PR12MB1809namp_
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
Do we need an smu version check?&nbsp; Will <font size=3D"2"><span style=3D=
"font-size:11pt">AverageSocketPower</span></font> report correctly on older=
 versions of smu firmware?&nbsp; Assuming that is ok, patch is:</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Acked-by: Alex Deucher &lt;alexander.deucher@amd.com&gt;<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Russell, Kent &lt;Kent.Russel=
l@amd.com&gt;<br>
<b>Sent:</b> Thursday, August 22, 2019 8:19 AM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> Russell, Kent &lt;Kent.Russell@amd.com&gt;<br>
<b>Subject:</b> [PATCH] drm/amdgpu: Fix Vega20 Average Power value</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">The SMU changed reading from CurrSocketPower to Av=
erageSocketPower, so<br>
reflect this accordingly. This fixes the issue where Average Power<br>
Consumption was being reported as 0 from SMU 40.46-onward<br>
<br>
Change-Id: I471f93316820f1401cb497eefe29da68376a4bb9<br>
Signed-off-by: Kent Russell &lt;kent.russell@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c | 2 &#43;-<br>
&nbsp;drivers/gpu/drm/amd/powerplay/vega20_ppt.c&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; | 2 &#43;-<br>
&nbsp;2 files changed, 2 insertions(&#43;), 2 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c b/drivers/g=
pu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c<br>
index 0516c294b377..1820133f0ceb 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c<br>
@@ -2101,7 &#43;2101,7 @@ static int vega20_get_gpu_power(struct pp_hwmgr *=
hwmgr,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *query =3D metrics_table.CurrSocketPo=
wer &lt;&lt; 8;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *query =3D metrics_table.AverageS=
ocketPower &lt;&lt; 8;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
diff --git a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c b/drivers/gpu/drm/a=
md/powerplay/vega20_ppt.c<br>
index e14363182691..17af12ee9e78 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/vega20_ppt.c<br>
@@ -2927,7 &#43;2927,7 @@ static int vega20_get_gpu_power(struct smu_contex=
t *smu, uint32_t *value)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *value =3D metrics.CurrSocketPower &l=
t;&lt; 8;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *value =3D metrics.AverageSocketP=
ower &lt;&lt; 8;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&nbsp;}<br>
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

--_000_BN6PR12MB1809FB98DA053EC712C6375CF7A50BN6PR12MB1809namp_--

--===============0518382446==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0518382446==--
