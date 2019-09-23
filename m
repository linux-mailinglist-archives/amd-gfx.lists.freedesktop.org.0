Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF09BB412
	for <lists+amd-gfx@lfdr.de>; Mon, 23 Sep 2019 14:44:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 136FC6E8A2;
	Mon, 23 Sep 2019 12:44:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770048.outbound.protection.outlook.com [40.107.77.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D19186E8A2
 for <amd-gfx@lists.freedesktop.org>; Mon, 23 Sep 2019 12:44:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GR57GQ7ArEOaBAABXz97Jy5WNketN8IdGL+SdZMJQ9llQ9NoiNG++TbTqZcx03kxfTmZvdJy7bjAhuyjhTpgbX/46jkLSe2APbv9fKFO/zlB5F0Q9KhN+hNSE6l52vADG0sxIp6H3wzRVXcTTQ/rUtCpoKwewePoaRqKTUEYw1/bdOTLbVRae1IMuTLV6ZXMvRCPHgdHnG6txAyA3uaPLEfERWQoVJnORRe5ponfYy3aQmVqfKvBeqYug3DaApF/w19In9xw5Rio/4MTqhtXBXpvgL99P7o2Z/r9OBOBG5sCUBCCryyIaE/03HxLLwTqCw7CmHMsPidg9nRZpDdsPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/zn+SDPG7G+QlVUofnRywpHajT9ZsP0lQGa4dAWb64I=;
 b=FMI1sOBMQNgmpAO2tG0TWuYj+85T96b62TwENATo7PGLI1rL+iIB2rDDwT7cacs/2HyTM2Yoce1ixYXUbh2K07oQjG/y65MDTvLRsvHpvk/G1g6Y3nqpvJuMZCAqOfHpfRhtrzJg74TeUOhk/6g+iOP9LkbtyGkGiNsBDUE/zvNKiZYJGMuwBVcG8QxMlTfhE9jii1LwjEkJzpFAClGqBVuAo9PRwzd7bfVlDmTmJl9N/v20aOXkHCe98FT9cBmS2jon66n1AszKTSgR6KFn9zFFJu2HnqDiwYZ508Oz1DzkJM8loak88vNnWJ+d0H8yd8B/yp480AyVB2WPJGNW6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1841.namprd12.prod.outlook.com (10.175.99.135) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Mon, 23 Sep 2019 12:44:17 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::a930:a648:d4d2:d25c]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::a930:a648:d4d2:d25c%12]) with mapi id 15.20.2263.030; Mon, 23 Sep
 2019 12:44:17 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Zhao, Yong" <Yong.Zhao@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 3/3] drm/amdkfd: Remove unnecessary pm_init() for non HWS
 mode
Thread-Topic: [PATCH 3/3] drm/amdkfd: Remove unnecessary pm_init() for non HWS
 mode
Thread-Index: AQHVcceUia/zHS/1yEGAJhj5TEOFmqc5NZLF
Date: Mon, 23 Sep 2019 12:44:17 +0000
Message-ID: <BN6PR12MB18091E46A4C2172BFC14E2ADF7850@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <20190923042944.15314-1-Yong.Zhao@amd.com>,
 <20190923042944.15314-3-Yong.Zhao@amd.com>
In-Reply-To: <20190923042944.15314-3-Yong.Zhao@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.219.73.178]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 84b8f136-ef8f-4579-67d9-08d74023bf77
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BN6PR12MB1841; 
x-ms-traffictypediagnostic: BN6PR12MB1841:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB18417A1C489277C1ED11BE0FF7850@BN6PR12MB1841.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1265;
x-forefront-prvs: 0169092318
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(376002)(39860400002)(136003)(366004)(199004)(189003)(966005)(606006)(14454004)(2501003)(478600001)(6506007)(99286004)(229853002)(7696005)(33656002)(8936002)(186003)(76176011)(105004)(26005)(5660300002)(6116002)(53546011)(102836004)(19627405001)(76116006)(316002)(66946007)(66476007)(66556008)(64756008)(66446008)(110136005)(446003)(25786009)(74316002)(9686003)(476003)(236005)(55016002)(6306002)(8676002)(256004)(6436002)(486006)(86362001)(11346002)(66066001)(71190400001)(71200400001)(2906002)(3846002)(6246003)(7736002)(52536014)(81166006)(54896002)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1841;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: y+0Srj0RbvvQwJAcMvVASSgWQ+qSSMw3MfTAakSZcx/+Uzj7V642Em/nlJags65+oi8TbzfBrwRHKxYCMPnP6//rWkWgng4e6Jt1jqcNhi2BCNE85L2WIXE4tb4ZAKS1d+atkUP48xbx31LLEtjrubZmZPd9trb+LlyhIVs++uVO5A9M3qQ2vOr0qHQbsd2Zbpy+tRF4x7jyEu6VKNLgJtUe2EAOZ9lhEzfoXigkm8RVz+mJK385odDr5kILLaq/YJ/bgrdvzlfTajPqpdqQev53XhHvVYbmW27falPE09jDIiALmPyOoOfm1Dl0NYs6dSHf0A1wGxGLll3ROAw4Ek/8Zv4NO4FzwZJKp7Cchh1FZGi7fhFaXoOQAfM3pmIcgRxMrB1MGZfB1k8knuQRljoTiefEVsss6Nm5L5t9is0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84b8f136-ef8f-4579-67d9-08d74023bf77
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2019 12:44:17.5311 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ohDbQo5KKivtcdayGV8mvdovbl37TaMkSDOFIsK2XhDp2YTAvSrI1alqbgGBmY3pdO7ca+bkL/Di2/ZiY3bqZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1841
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/zn+SDPG7G+QlVUofnRywpHajT9ZsP0lQGa4dAWb64I=;
 b=zXfdzXVZhEW5wTrfKJ4HHm+bvA8SKis3qY4G6oVj5HOGzSxXXmLFJ7zrqAKXW5ibhMqjefHOdL5ZesL0LS+R471/QGVDQFrIoVuv+qWCDDmmMNmFafKHjZ9hlljkNAxRsG8fKiB2Coo53gX+QH5I9wWdMzeXkSQbnDkeRJ/w3Bw=
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
Content-Type: multipart/mixed; boundary="===============1926227398=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1926227398==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB18091E46A4C2172BFC14E2ADF7850BN6PR12MB1809namp_"

--_000_BN6PR12MB18091E46A4C2172BFC14E2ADF7850BN6PR12MB1809namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Series is:
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Zhao, Yo=
ng <Yong.Zhao@amd.com>
Sent: Monday, September 23, 2019 12:30 AM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Cc: Zhao, Yong <Yong.Zhao@amd.com>
Subject: [PATCH 3/3] drm/amdkfd: Remove unnecessary pm_init() for non HWS m=
ode

The packet manager is not needed for non HWS mode except Hawaii, so only
initialize it for Hawaii under non HWS mode. This will simplify debugging
under non HWS mode for all new asics, because it eliminates one variable
out of the equation in non HWS mode

Change-Id: Ie2b61b546299a50366b9ab97900f4bb13de33d5b
Signed-off-by: Yong Zhao <Yong.Zhao@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/driver=
s/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
index c47b88987c87..c826634938d2 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
@@ -902,12 +902,18 @@ static void uninitialize(struct device_queue_manager =
*dqm)
 static int start_nocpsch(struct device_queue_manager *dqm)
 {
         init_interrupts(dqm);
-       return pm_init(&dqm->packets, dqm);
+
+       if (dqm->dev->device_info->asic_family =3D=3D CHIP_HAWAII)
+               return pm_init(&dqm->packets, dqm);
+
+       return 0;
 }

 static int stop_nocpsch(struct device_queue_manager *dqm)
 {
-       pm_uninit(&dqm->packets);
+       if (dqm->dev->device_info->asic_family =3D=3D CHIP_HAWAII)
+               pm_uninit(&dqm->packets);
+
         return 0;
 }

--
2.17.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB18091E46A4C2172BFC14E2ADF7850BN6PR12MB1809namp_
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
Series is:</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Reviewed-by: Alex Deucher &lt;alexander.deucher@amd.com&gt;<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Zhao, Yong &lt;Yong.Zhao@amd.=
com&gt;<br>
<b>Sent:</b> Monday, September 23, 2019 12:30 AM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> Zhao, Yong &lt;Yong.Zhao@amd.com&gt;<br>
<b>Subject:</b> [PATCH 3/3] drm/amdkfd: Remove unnecessary pm_init() for no=
n HWS mode</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">The packet manager is not needed for non HWS mode =
except Hawaii, so only<br>
initialize it for Hawaii under non HWS mode. This will simplify debugging<b=
r>
under non HWS mode for all new asics, because it eliminates one variable<br=
>
out of the equation in non HWS mode<br>
<br>
Change-Id: Ie2b61b546299a50366b9ab97900f4bb13de33d5b<br>
Signed-off-by: Yong Zhao &lt;Yong.Zhao@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c | 10 &#43;&#43;=
&#43;&#43;&#43;&#43;&#43;&#43;--<br>
&nbsp;1 file changed, 8 insertions(&#43;), 2 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/driver=
s/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c<br>
index c47b88987c87..c826634938d2 100644<br>
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c<br>
@@ -902,12 &#43;902,18 @@ static void uninitialize(struct device_queue_mana=
ger *dqm)<br>
&nbsp;static int start_nocpsch(struct device_queue_manager *dqm)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; init_interrupts(dqm);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return pm_init(&amp;dqm-&gt;packets, =
dqm);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (dqm-&gt;dev-&gt;device_info-&=
gt;asic_family =3D=3D CHIP_HAWAII)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; return pm_init(&amp;dqm-&gt;packets, dqm);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;static int stop_nocpsch(struct device_queue_manager *dqm)<br>
&nbsp;{<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pm_uninit(&amp;dqm-&gt;packets);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (dqm-&gt;dev-&gt;device_info-&=
gt;asic_family =3D=3D CHIP_HAWAII)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; pm_uninit(&amp;dqm-&gt;packets);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&nbsp;}<br>
&nbsp;<br>
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

--_000_BN6PR12MB18091E46A4C2172BFC14E2ADF7850BN6PR12MB1809namp_--

--===============1926227398==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1926227398==--
