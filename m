Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 060BEA0868
	for <lists+amd-gfx@lfdr.de>; Wed, 28 Aug 2019 19:29:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D41A89DFA;
	Wed, 28 Aug 2019 17:29:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810059.outbound.protection.outlook.com [40.107.81.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB29989DFA
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Aug 2019 17:29:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cbgQ/EtW54Ui34UlItuauJppYwyVSaPu4MCHLnQ9zys1s5FRD0z7XRKz8pKkN7cOznBw7+6z1e3zZGoOTc5e89gujKLSNeqDOYuRQsidGuuyRZK7N6WpGHXBO2J2lWpfFlXZAaTpDnSX55qlG9Wc4BIq8+TKTeZDNmFyOXv3GnG5mf6xklUqralIpArYzYMOiEcry6Dhy/IdCSzX3ezfvVay3PZoX0PjEFZUGLHU1R6lGyYTitqw7BJZyVfvO2JsNlLRj/e4Gq9kOPewlO2Kd1WtukVfAeA7KXNck4flYhMuQqsklHM5B1O82hNQTh8wWAaWnnUgE1IhxtlubOFx0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SUbgj+c2SUwsq7vgS3d5j4vLtjn98IGzYPqGSgMndH0=;
 b=NuZCerAJpqt1noyPyeFJ0/crh0MkuNrxmWio91rB9YNpDtahi8fl8+tFNWTNwVZeb1GP8RodsJOW623DGq/sKP+6g4Ivatr2j+F4bp0mUsA/4CQ2E8rlsfRnJWiqL2akNdfhCutjHT99QSVvBIND1vJg97X+BUb3sIZj1WeKKIbl7DRdo37i4Of58sFB+ZPIC97EIhOo68sKk2+UwyYP7dbNNuC/82p845lrk4Lw2pg4R1vNZ4vzczw5Evxbozb74XI7lB+I12ucn5vF8vX8VzlpEm9peqJ5qxkSUSiHgWCSfUJEnJ/s2bGWDMyQChSm/tkbpFFwylH4Ik31hoYRfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1588.namprd12.prod.outlook.com (10.172.19.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.18; Wed, 28 Aug 2019 17:29:17 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::8542:935:262c:53d1]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::8542:935:262c:53d1%10]) with mapi id 15.20.2178.023; Wed, 28 Aug 2019
 17:29:17 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Zhang, Hawking" <Hawking.Zhang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Zhou1, Tao" <Tao.Zhou1@amd.com>
Subject: Re: [PATCH 7/7] drm/amdgpu: switch to ras_late_init callback for nbio
 v7_4
Thread-Topic: [PATCH 7/7] drm/amdgpu: switch to ras_late_init callback for
 nbio v7_4
Thread-Index: AQHVXaEcOmBuPOVN20CzfNnvibJNLqcQ0N3u
Date: Wed, 28 Aug 2019 17:29:16 +0000
Message-ID: <BN6PR12MB18096E343DD1229240C24BF1F7A30@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <1566997395-7185-1-git-send-email-Hawking.Zhang@amd.com>,
 <1566997395-7185-7-git-send-email-Hawking.Zhang@amd.com>
In-Reply-To: <1566997395-7185-7-git-send-email-Hawking.Zhang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.219.73.178]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f225fd5d-8617-4d33-e755-08d72bdd40c7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1588; 
x-ms-traffictypediagnostic: BN6PR12MB1588:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB1588DEB42EF97C07D909EE6BF7A30@BN6PR12MB1588.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:506;
x-forefront-prvs: 014304E855
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(396003)(346002)(39860400002)(136003)(189003)(199004)(66066001)(486006)(9686003)(256004)(54896002)(7696005)(7736002)(14444005)(74316002)(11346002)(6636002)(476003)(446003)(76176011)(55016002)(52536014)(66446008)(76116006)(66476007)(6436002)(316002)(6246003)(2906002)(66556008)(64756008)(66946007)(5660300002)(478600001)(33656002)(2501003)(71190400001)(99286004)(6116002)(19627405001)(229853002)(8936002)(14454004)(81166006)(53936002)(81156014)(102836004)(8676002)(186003)(71200400001)(105004)(25786009)(110136005)(53546011)(6506007)(26005)(86362001)(3846002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1588;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 8OkcUUJx7MZxFgx6V/Vd+LY7HJSoDwzckIa8Ye0CLfmn31CmtuGgi9sAH5noSPxVXry2K3eRz3vVJAmsIsM+cw5Ylc/xJlzOfsTHqdLK8kt+04RxhV3y9S6fPsT3Nx0PDllnTUb0BKdCUuqqWDckQuyakWMKewIWrKn41b9MexObCFfKyR9SrP7Wj1rGlin8OP+vN0dHziSgvTfr4GS4MbSCA4G6gF8+a/w3XS4e4C0Nf0ejDsn49TMN7Dd6MiAGkPolZer+p/L9JqqxdeghArrBGLjxpWAT76cjUlS3QWTlnPKX5OA6b8C4zrXFnAl+JkVDbF0qxeKA1gu3quzXDthLC/aaWF7TqIw+NJ8dQHEvKM2N7yh/V9Zvyfue2xNCKbOnUJ4q1H4cygjAH7+hGUSOg0fCNxePDxnokUKj3Bs=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f225fd5d-8617-4d33-e755-08d72bdd40c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2019 17:29:16.9454 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z0JCeTBQ5uvFMe8R5nnRx8kDiEVZ4kcrx+iocgNh4rBbiiKD9fO53qOvy7mj1wyk9BwRPF97GKSCbtwKS9mnpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1588
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SUbgj+c2SUwsq7vgS3d5j4vLtjn98IGzYPqGSgMndH0=;
 b=oU1QMOLExgkqDBSTeQYk2skLtu0p7J1P4TylLdX/SfuGo/YePuwL9oAsbppcoZNaTVDZPzoS1pkmzulxjGsCctAYujMXfgrehfMo7ekTwMvmJZwe3ymv1DAnrGlIs//xEme+4AJAtJJ4ybZ6B9IvdC/hbMPtqapjPxx5hz5WsCM=
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
Content-Type: multipart/mixed; boundary="===============1886288912=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1886288912==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB18096E343DD1229240C24BF1F7A30BN6PR12MB1809namp_"

--_000_BN6PR12MB18096E343DD1229240C24BF1F7A30BN6PR12MB1809namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Nice clean up.  Series is:
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
________________________________
From: Hawking Zhang <Hawking.Zhang@amd.com>
Sent: Wednesday, August 28, 2019 9:03 AM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>; Zhou1, T=
ao <Tao.Zhou1@amd.com>; Deucher, Alexander <Alexander.Deucher@amd.com>
Cc: Zhang, Hawking <Hawking.Zhang@amd.com>
Subject: [PATCH 7/7] drm/amdgpu: switch to ras_late_init callback for nbio =
v7_4

invoke nbio ras_late_init callback function to do nbio ras init

Signed-off-by: Hawking Zhang <Hawking.Zhang@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/soc15.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/soc15.c b/drivers/gpu/drm/amd/amdgp=
u/soc15.c
index e7f2539..f53bd59 100644
--- a/drivers/gpu/drm/amd/amdgpu/soc15.c
+++ b/drivers/gpu/drm/amd/amdgpu/soc15.c
@@ -1206,11 +1206,15 @@ static int soc15_common_early_init(void *handle)
 static int soc15_common_late_init(void *handle)
 {
         struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
+       int r;

         if (amdgpu_sriov_vf(adev))
                 xgpu_ai_mailbox_get_irq(adev);

-       return 0;
+       if (adev->nbio.funcs->ras_late_init)
+               r =3D adev->nbio.funcs->ras_late_init(adev);
+
+       return r;
 }

 static int soc15_common_sw_init(void *handle)
@@ -1287,6 +1291,13 @@ static int soc15_common_hw_fini(void *handle)
         if (amdgpu_sriov_vf(adev))
                 xgpu_ai_mailbox_put_irq(adev);

+       if (amdgpu_ras_is_supported(adev, adev->nbio.ras_if->block)) {
+               if (adev->nbio.funcs->init_ras_controller_interrupt)
+                       amdgpu_irq_put(adev, &adev->nbio.ras_controller_irq=
, 0);
+               if (adev->nbio.funcs->init_ras_err_event_athub_interrupt)
+                       amdgpu_irq_put(adev, &adev->nbio.ras_err_event_athu=
b_irq, 0);
+       }
+
         return 0;
 }

--
2.7.4


--_000_BN6PR12MB18096E343DD1229240C24BF1F7A30BN6PR12MB1809namp_
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
Nice clean up.&nbsp; Series is:</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Reviewed-by: Alex Deucher &lt;alexander.deucher@amd.com&gt;<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Hawking Zhang &lt;Haw=
king.Zhang@amd.com&gt;<br>
<b>Sent:</b> Wednesday, August 28, 2019 9:03 AM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;; Zhou1, Tao &lt;Tao.Zhou1@amd.com&gt;; Deucher, Alexander &lt;Alexander=
.Deucher@amd.com&gt;<br>
<b>Cc:</b> Zhang, Hawking &lt;Hawking.Zhang@amd.com&gt;<br>
<b>Subject:</b> [PATCH 7/7] drm/amdgpu: switch to ras_late_init callback fo=
r nbio v7_4</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">invoke nbio ras_late_init callback function to do =
nbio ras init<br>
<br>
Signed-off-by: Hawking Zhang &lt;Hawking.Zhang@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/soc15.c | 13 &#43;&#43;&#43;&#43;&#43;&#43=
;&#43;&#43;&#43;&#43;&#43;&#43;-<br>
&nbsp;1 file changed, 12 insertions(&#43;), 1 deletion(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/soc15.c b/drivers/gpu/drm/amd/amdgp=
u/soc15.c<br>
index e7f2539..f53bd59 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/soc15.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/soc15.c<br>
@@ -1206,11 &#43;1206,15 @@ static int soc15_common_early_init(void *handle=
)<br>
&nbsp;static int soc15_common_late_init(void *handle)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_device *adev=
 =3D (struct amdgpu_device *)handle;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int r;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (amdgpu_sriov_vf(adev))=
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; xgpu_ai_mailbox_get_irq(adev);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;nbio.funcs-&gt;ras_l=
ate_init)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; r =3D adev-&gt;nbio.funcs-&gt;ras_late_init(adev);<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return r;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;static int soc15_common_sw_init(void *handle)<br>
@@ -1287,6 &#43;1291,13 @@ static int soc15_common_hw_fini(void *handle)<br=
>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (amdgpu_sriov_vf(adev))=
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; xgpu_ai_mailbox_put_irq(adev);<br>
&nbsp;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (amdgpu_ras_is_supported(adev,=
 adev-&gt;nbio.ras_if-&gt;block)) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (adev-&gt;nbio.funcs-&gt;init_ras_controller_interrupt)<b=
r>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_irq_p=
ut(adev, &amp;adev-&gt;nbio.ras_controller_irq, 0);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (adev-&gt;nbio.funcs-&gt;init_ras_err_event_athub_interru=
pt)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_irq_p=
ut(adev, &amp;adev-&gt;nbio.ras_err_event_athub_irq, 0);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&nbsp;}<br>
&nbsp;<br>
-- <br>
2.7.4<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_BN6PR12MB18096E343DD1229240C24BF1F7A30BN6PR12MB1809namp_--

--===============1886288912==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1886288912==--
