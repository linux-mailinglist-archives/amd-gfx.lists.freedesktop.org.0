Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E9512004
	for <lists+amd-gfx@lfdr.de>; Thu,  2 May 2019 18:22:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA47B89709;
	Thu,  2 May 2019 16:22:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770059.outbound.protection.outlook.com [40.107.77.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8253B8970B
 for <amd-gfx@lists.freedesktop.org>; Thu,  2 May 2019 16:22:08 +0000 (UTC)
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1299.namprd12.prod.outlook.com (10.168.227.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.11; Thu, 2 May 2019 16:22:07 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::bc5b:de68:25b7:d853]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::bc5b:de68:25b7:d853%12]) with mapi id 15.20.1856.012; Thu, 2 May 2019
 16:22:07 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "StDenis, Tom" <Tom.StDenis@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amd/amdgpu: Add MEM_LOAD to amdgpu_pm_info debugfs
 file
Thread-Topic: [PATCH] drm/amd/amdgpu: Add MEM_LOAD to amdgpu_pm_info debugfs
 file
Thread-Index: AQHVAPKFFI/V0ZP6BEeAQBURfoIth6ZYBGaz
Date: Thu, 2 May 2019 16:22:06 +0000
Message-ID: <BN6PR12MB1809FEF89618A0D8DCC656E8F7340@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <20190502142239.22322-1-tom.stdenis@amd.com>
In-Reply-To: <20190502142239.22322-1-tom.stdenis@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.219.84.143]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b6e0d46d-9de6-4a45-6413-08d6cf1a51f2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1299; 
x-ms-traffictypediagnostic: BN6PR12MB1299:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN6PR12MB1299C9BDB789CC83168EAA62F7340@BN6PR12MB1299.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:79;
x-forefront-prvs: 0025434D2D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(136003)(346002)(376002)(396003)(366004)(199004)(189003)(55016002)(6506007)(53546011)(26005)(186003)(33656002)(102836004)(105004)(229853002)(74316002)(25786009)(316002)(6436002)(8676002)(3846002)(64756008)(73956011)(66946007)(66446008)(6116002)(8936002)(66476007)(66556008)(76116006)(81156014)(81166006)(5660300002)(2501003)(2906002)(6246003)(606006)(446003)(11346002)(9686003)(6306002)(486006)(236005)(19627405001)(54896002)(86362001)(476003)(52536014)(71200400001)(71190400001)(478600001)(76176011)(7696005)(7736002)(72206003)(966005)(110136005)(14454004)(99286004)(68736007)(53936002)(66066001)(256004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1299;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: i1C+rGrnr0hRVfhOAG0Bzf8kGK1C7xsmO7Uwa/WFB6tNCQUWhNwJJLc3E0hk9PVnu1k/jqd7E+X9ii+KHE0zeQIWk6WCBLG4E53D5KgKhG5Gq0n1M9ZwVBQRUC/m2p6Tj0skzc2ox0EPMCpOaTOTftpWtx0U5jdYhTCnPNqiCrrDwbP9pzXpX4+B17kWJc+Q8RrGzSI3ykGeQmBHQFASZX9DicQTr6pAiYMXGVk558nysKb32qfCQ71W8icBHwrsu2ku0fYw/M+iybHmx+r82CA7WKY8WTXzjUTSPESPOBPLJnkx/E4HaRsMqwVzUfRlcZoZdIqYxE210K1O7MA87SwdG+BrzP1Nnuq6WU9/l9Pf5Zrzp+0s43mHwwQDZpP5na4326fqfzZ+pdKQR+F9bBT3b8IZUpt0uq3THP0FG7U=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6e0d46d-9de6-4a45-6413-08d6cf1a51f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 May 2019 16:22:06.8381 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1299
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=paafWaNYuK7+qpPGeJZZKfUCfdvmlv+5YQ4ERDzM7/U=;
 b=qc8rVOtERrQKmOah/z6cRB+cPRxxRQXwVKinw6DWAWlmKOZfvL3Ylukjh9aRIV23ujC8HR+fo/2nV34z+eRSiJojLMCLB5bxxTbO4COnOxWckFYsBzcMudu4u3Nt7GyLu6Mqtb53J5NzD8TOIAFoGSatxoILuRvqkj+KyjpvXkk=
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
Content-Type: multipart/mixed; boundary="===============0956764291=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0956764291==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB1809FEF89618A0D8DCC656E8F7340BN6PR12MB1809namp_"

--_000_BN6PR12MB1809FEF89618A0D8DCC656E8F7340BN6PR12MB1809namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of StDenis,=
 Tom <Tom.StDenis@amd.com>
Sent: Thursday, May 2, 2019 10:22 AM
To: amd-gfx@lists.freedesktop.org
Cc: StDenis, Tom
Subject: [PATCH] drm/amd/amdgpu: Add MEM_LOAD to amdgpu_pm_info debugfs fil=
e

[CAUTION: External Email]

Signed-off-by: Tom St Denis <tom.stdenis@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c b/drivers/gpu/drm/amd/a=
mdgpu/amdgpu_pm.c
index 5e2d039e09ad..e0789f0f2670 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
@@ -2955,6 +2955,10 @@ static int amdgpu_debugfs_pm_info_pp(struct seq_file=
 *m, struct amdgpu_device *a
        /* GPU Load */
        if (!amdgpu_dpm_read_sensor(adev, AMDGPU_PP_SENSOR_GPU_LOAD, (void =
*)&value, &size))
                seq_printf(m, "GPU Load: %u %%\n", value);
+       /* MEM Load */
+       if (!amdgpu_dpm_read_sensor(adev, AMDGPU_PP_SENSOR_MEM_LOAD, (void =
*)&value, &size))
+               seq_printf(m, "MEM Load: %u %%\n", value);
+
        seq_printf(m, "\n");

        /* SMC feature mask */
--
2.20.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB1809FEF89618A0D8DCC656E8F7340BN6PR12MB1809namp_
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
ounces@lists.freedesktop.org&gt; on behalf of StDenis, Tom &lt;Tom.StDenis@=
amd.com&gt;<br>
<b>Sent:</b> Thursday, May 2, 2019 10:22 AM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org<br>
<b>Cc:</b> StDenis, Tom<br>
<b>Subject:</b> [PATCH] drm/amd/amdgpu: Add MEM_LOAD to amdgpu_pm_info debu=
gfs file</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">[CAUTION: External Email]<br>
<br>
Signed-off-by: Tom St Denis &lt;tom.stdenis@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c | 4 &#43;&#43;&#43;&#43;<br>
&nbsp;1 file changed, 4 insertions(&#43;)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c b/drivers/gpu/drm/amd/a=
mdgpu/amdgpu_pm.c<br>
index 5e2d039e09ad..e0789f0f2670 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c<br>
@@ -2955,6 &#43;2955,10 @@ static int amdgpu_debugfs_pm_info_pp(struct seq_=
file *m, struct amdgpu_device *a<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* GPU Load */<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!amdgpu_dpm_read_sensor(adev=
, AMDGPU_PP_SENSOR_GPU_LOAD, (void *)&amp;value, &amp;size))<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; seq_printf(m, &quot;GPU Load: %u %%\n&quot;, value);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* MEM Load */<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!amdgpu_dpm_read_sensor(adev,=
 AMDGPU_PP_SENSOR_MEM_LOAD, (void *)&amp;value, &amp;size))<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; seq_printf(m, &quot;MEM Load: %u %%\n&quot;, value);<br>
&#43;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; seq_printf(m, &quot;\n&quot;);<b=
r>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* SMC feature mask */<br>
--<br>
2.20.1<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a><br>
</div>
</span></font></div>
</body>
</html>

--_000_BN6PR12MB1809FEF89618A0D8DCC656E8F7340BN6PR12MB1809namp_--

--===============0956764291==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0956764291==--
