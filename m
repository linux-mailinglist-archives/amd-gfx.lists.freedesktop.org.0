Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C81AD1501
	for <lists+amd-gfx@lfdr.de>; Wed,  9 Oct 2019 19:11:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB6F06E116;
	Wed,  9 Oct 2019 17:11:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820051.outbound.protection.outlook.com [40.107.82.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 334746E116
 for <amd-gfx@lists.freedesktop.org>; Wed,  9 Oct 2019 17:11:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XiicUtTVPtEn9N67mpVY2R1elXgXeBxjp5SPC8U5sGI+9cwvXMqRQteOJU9xTE6f75NeFFL588iUmin3qjvKNnykf5PPc0bcSwLiSF+nZd80bQLWENHq8y6bM9foheby5wKxOAynHyqEH8oJMzuXsS6qUL9th+M1oCYS7qBqbLnqmz6BBq9HblA9SyJ0WeBCD44PQphrt4vGmCi4qZwD1IAjTv6AXwQ20jME5L8XNIpgJyx4yuBANgyswX83YNvURY6Zk9TOYKwMKk/Wwz2Sfcm9jgtjdaeVPE/avDKGwRlAGLgkhYIAiP7LSPBnjfVfdMK4RyOmu8cH6REVxGoqFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k0NYpHy70JSl7RPUfIb/7yiRRUTX9ptPgPTJDA7+5nI=;
 b=FYTFJJ0xwLZZ+YIIaKrLW6EjESNO5u36y1fTfEpQA4rY5g3frdvHV3LUTZPviHJzcM13V0J/dWJI7ofa49MGHnnzARzb/UP7wtuTSa5VfZDQmKtmirWUC13UcQcP7soH924dpu1DDPWvOwCARjGtMH81PZyujmtWI0xkMdlE7Fc9yuXeaghmyqMVKtYocSPxKeUrt0ZJFv00E7PYZ1E/sT0jxSJafSJMn9IiFK3oJXpRgyFNKlgk5xmq+S+Zdqfw86TaUbNBwNOgTysz38MEvEa/r5zw85nKOBEiCcouqjCEORo/k3xnD4nadx8Yg6DsqBWJn66iYe8NCTJaEXFedg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1820.namprd12.prod.outlook.com (10.175.88.143) by
 DM5PR12MB1690.namprd12.prod.outlook.com (10.172.40.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.23; Wed, 9 Oct 2019 17:11:03 +0000
Received: from DM5PR12MB1820.namprd12.prod.outlook.com
 ([fe80::cdcf:e46c:3b50:5e68]) by DM5PR12MB1820.namprd12.prod.outlook.com
 ([fe80::cdcf:e46c:3b50:5e68%5]) with mapi id 15.20.2305.023; Wed, 9 Oct 2019
 17:11:03 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu/sdma5: fix mask value of POLL_REGMEM packet
 for pipe sync
Thread-Topic: [PATCH] drm/amdgpu/sdma5: fix mask value of POLL_REGMEM packet
 for pipe sync
Thread-Index: AQHVfsRas4mauYmmH0ePetGizjISX6dSi3Qy
Date: Wed, 9 Oct 2019 17:11:03 +0000
Message-ID: <DM5PR12MB18207AE8E0DD7CCE9FB23E41F7950@DM5PR12MB1820.namprd12.prod.outlook.com>
References: <20191009170923.15479-1-xiaojie.yuan@amd.com>
In-Reply-To: <20191009170923.15479-1-xiaojie.yuan@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.51.171.205]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 13ee402a-4dd5-4cce-bfb9-08d74cdbaa7b
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM5PR12MB1690:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB169082AAC4FE8E795E332C8DF7950@DM5PR12MB1690.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2449;
x-forefront-prvs: 018577E36E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(396003)(376002)(346002)(366004)(189003)(199004)(110136005)(71190400001)(14444005)(4326008)(6436002)(256004)(14454004)(53546011)(6116002)(3846002)(6506007)(76176011)(7696005)(606006)(966005)(71200400001)(54906003)(316002)(478600001)(25786009)(2906002)(64756008)(66476007)(66556008)(19627405001)(86362001)(8676002)(81156014)(81166006)(54896002)(66446008)(8936002)(186003)(52536014)(55016002)(7736002)(2501003)(229853002)(66066001)(6246003)(99286004)(102836004)(26005)(11346002)(446003)(105004)(486006)(476003)(236005)(6306002)(74316002)(5660300002)(33656002)(9686003)(76116006)(66946007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1690;
 H:DM5PR12MB1820.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: US6jwtsDtSE2M80L+MCV7HtEim1Eh/b/uSTL/0SbPDo6uMi53X8WPSEloT4J+t7D4OCKkZXDDVsUYaV/o8J5F9KwO5zdaT8QCNlBKXF4XbFz1AZ4Q82wwntnY/rZZBFI0mSzxzVHefgSNEVreC8NrNqVka/2Fk3V52i54/5SA26AWgQEOYgo/GqjXpkOHXZyLESJGSqFLbXq+nndYfJ2HQ+nBY6Vu2WSx3M5SfhJrpiktIl0f6Eyh/XBExXcczr/1y2lSSQ3ySsUTnKPqvppzyQ1fYYRVa/Nl0KpgMrk5OVhIBbQiFyS/eObnMdeknnC3aVszII72/f2KJAbFfCB5/i7Tp53u4ZMSpLk8kRtrLwwaBlxLhjTz1U5a7gJ+w5L9OKPxPNmaT5fN3nGela/gWafDS/XcVS1QWQN0BF/TYIDB1LV81iOEAPqh91yWPeYmrnBtFS4hSIVGYkwsECtiA==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13ee402a-4dd5-4cce-bfb9-08d74cdbaa7b
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2019 17:11:03.7540 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5xijQ20GRImQKPw2AbnlWpBP0vcKWh/dN7V7rjmC0rMwZ3KoQzdgZGuHom8k7dqx5blZWejWflc31Mlxthvk1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1690
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k0NYpHy70JSl7RPUfIb/7yiRRUTX9ptPgPTJDA7+5nI=;
 b=AGy5tFBMg/r5eRiYSa1dGsUOkYTlWvfhoyltsaBkflJrRSco1TG/ysYUiLFyJ7UaujRarXz5MldB5TMB576kz8xUQwcDojIBdLXgI2hKK2PZLfu2edmiQwWVq1HlvKabX52VEsGhtpl5q6LbIU/tcQNn70GNzn6BlrVutJZUHWQ=
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
Cc: "Xiao, Jack" <Jack.Xiao@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Content-Type: multipart/mixed; boundary="===============0385605920=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0385605920==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DM5PR12MB18207AE8E0DD7CCE9FB23E41F7950DM5PR12MB1820namp_"

--_000_DM5PR12MB18207AE8E0DD7CCE9FB23E41F7950DM5PR12MB1820namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Yuan, Xi=
aojie <Xiaojie.Yuan@amd.com>
Sent: Wednesday, October 9, 2019 1:09 PM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Cc: Xiao, Jack <Jack.Xiao@amd.com>; Yuan, Xiaojie <Xiaojie.Yuan@amd.com>; Z=
hang, Hawking <Hawking.Zhang@amd.com>
Subject: [PATCH] drm/amdgpu/sdma5: fix mask value of POLL_REGMEM packet for=
 pipe sync

sdma will hang once sequence number to be polled reaches 0x1000_0000

Signed-off-by: Xiaojie Yuan <xiaojie.yuan@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c b/drivers/gpu/drm/amd/a=
mdgpu/sdma_v5_0.c
index ad5c3566337c..3460c00f3eaa 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
@@ -1126,7 +1126,7 @@ static void sdma_v5_0_ring_emit_pipeline_sync(struct =
amdgpu_ring *ring)
         amdgpu_ring_write(ring, addr & 0xfffffffc);
         amdgpu_ring_write(ring, upper_32_bits(addr) & 0xffffffff);
         amdgpu_ring_write(ring, seq); /* reference */
-       amdgpu_ring_write(ring, 0xfffffff); /* mask */
+       amdgpu_ring_write(ring, 0xffffffff); /* mask */
         amdgpu_ring_write(ring, SDMA_PKT_POLL_REGMEM_DW5_RETRY_COUNT(0xfff=
) |
                           SDMA_PKT_POLL_REGMEM_DW5_INTERVAL(4)); /* retry =
count, poll interval */
 }
--
2.20.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_DM5PR12MB18207AE8E0DD7CCE9FB23E41F7950DM5PR12MB1820namp_
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
ounces@lists.freedesktop.org&gt; on behalf of Yuan, Xiaojie &lt;Xiaojie.Yua=
n@amd.com&gt;<br>
<b>Sent:</b> Wednesday, October 9, 2019 1:09 PM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> Xiao, Jack &lt;Jack.Xiao@amd.com&gt;; Yuan, Xiaojie &lt;Xiaojie.=
Yuan@amd.com&gt;; Zhang, Hawking &lt;Hawking.Zhang@amd.com&gt;<br>
<b>Subject:</b> [PATCH] drm/amdgpu/sdma5: fix mask value of POLL_REGMEM pac=
ket for pipe sync</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">sdma will hang once sequence number to be polled r=
eaches 0x1000_0000<br>
<br>
Signed-off-by: Xiaojie Yuan &lt;xiaojie.yuan@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c | 2 &#43;-<br>
&nbsp;1 file changed, 1 insertion(&#43;), 1 deletion(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c b/drivers/gpu/drm/amd/a=
mdgpu/sdma_v5_0.c<br>
index ad5c3566337c..3460c00f3eaa 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c<br>
@@ -1126,7 &#43;1126,7 @@ static void sdma_v5_0_ring_emit_pipeline_sync(str=
uct amdgpu_ring *ring)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ring_write(ring, ad=
dr &amp; 0xfffffffc);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ring_write(ring, up=
per_32_bits(addr) &amp; 0xffffffff);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ring_write(ring, se=
q); /* reference */<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ring_write(ring, 0xfffffff); /=
* mask */<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ring_write(ring, 0xfffffff=
f); /* mask */<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ring_write(ring, SD=
MA_PKT_POLL_REGMEM_DW5_RETRY_COUNT(0xfff) |<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; SDMA_PKT_POLL_REGMEM_DW5_INTERVAL(4)); /* retry count, poll interval=
 */<br>
&nbsp;}<br>
-- <br>
2.20.1<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a></div>
</span></font></div>
</body>
</html>

--_000_DM5PR12MB18207AE8E0DD7CCE9FB23E41F7950DM5PR12MB1820namp_--

--===============0385605920==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0385605920==--
