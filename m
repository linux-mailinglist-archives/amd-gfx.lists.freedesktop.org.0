Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4096BEB4
	for <lists+amd-gfx@lfdr.de>; Wed, 17 Jul 2019 17:02:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A40836E0C2;
	Wed, 17 Jul 2019 15:02:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760080.outbound.protection.outlook.com [40.107.76.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 889066E0C2
 for <amd-gfx@lists.freedesktop.org>; Wed, 17 Jul 2019 15:02:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lv42apfPS9ti2xARYWO/NjNKoXynra4Mr2KY5oZcJXF4relLIH3eNwA5fXnjPe+KKwr2CYr7pkuX0YvBogTZkvm8j525oqMzL1biUc+o/VO0N3q+rRS73941EJo06wVBJ0+OHap4Gdjmdw9+ZKd3FQ/qXPlxlc/kmmDFhDTA14Ir+KvCruweMDzj+dGRBlWc7ISJsryWYGHcqkVjUkXX/JpsDXutBwz0IgOjZ/5L4MyOH7dZM4D/bb2x5hKy3kEg6FbBFtc2nRB/WMA4Hjm8KXxM5hhsIKx/UIsMPrv89gdCZqECjSP7lo9DDxH26IVLyASQml+tW9pj7eHvsuSZJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4i8fM16nxqkXPjGVPilOH+DAZdSX4l6XimOWqH6LJms=;
 b=LOTf3ZkMev5aKODLMCNdW1BiDXyNOdnHMs1+qATYCJWhogimRSIprpaX5xC/Bhqq+s2SnvsilhGJFez23kiQDmCFfck3N8vL4Q/ZR84M1RmEnuRs4Jd+raLT0YEl8SZKX+qn6i18hDtd2NW5jZpULRWjqpdSBlwnYBsP7xPeQzCZGYnr9WMivVPKDjIAGe3Ps64Ma9+8rKbSdApe3zQVO0iT2TW4CU++Q83yNCvca/frWt87rz3Xwnk7Q5vgCs1qtJiqk40RNwBCn4ceuiiH7UuZpqmP7l3rr5mLaiAPELRJhe3SYV0rQlxqU2ehklsDWgOTjIbPGBNp7GNlIaOUYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1281.namprd12.prod.outlook.com (10.168.226.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Wed, 17 Jul 2019 15:02:12 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::689d:2dcb:e0f7:bd8c]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::689d:2dcb:e0f7:bd8c%4]) with mapi id 15.20.2073.012; Wed, 17 Jul 2019
 15:02:12 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Greathouse, Joseph" <Joseph.Greathouse@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdkfd: Remove GWS from process during uninit
Thread-Topic: [PATCH] drm/amdkfd: Remove GWS from process during uninit
Thread-Index: AQHVPLAo//Ju2ecqbU6HA1LmDKhu16bO56xI
Date: Wed, 17 Jul 2019 15:02:12 +0000
Message-ID: <BN6PR12MB1809B7289753A4D44644CABDF7C90@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <20190717145830.9004-1-Joseph.Greathouse@amd.com>
In-Reply-To: <20190717145830.9004-1-Joseph.Greathouse@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.219.21.119]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2e9cf73d-841c-49be-3c82-08d70ac7bfc1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BN6PR12MB1281; 
x-ms-traffictypediagnostic: BN6PR12MB1281:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN6PR12MB1281658123DDB14CE5B178ECF7C90@BN6PR12MB1281.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-forefront-prvs: 01018CB5B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(366004)(39860400002)(396003)(376002)(189003)(199004)(76116006)(6246003)(66556008)(66476007)(66946007)(236005)(7696005)(14454004)(6116002)(66446008)(52536014)(3846002)(64756008)(229853002)(55016002)(71190400001)(476003)(74316002)(8936002)(2501003)(71200400001)(76176011)(6436002)(54896002)(9686003)(606006)(86362001)(2906002)(6306002)(11346002)(99286004)(81166006)(25786009)(8676002)(186003)(33656002)(105004)(66066001)(6506007)(53546011)(68736007)(7736002)(53936002)(110136005)(486006)(5660300002)(446003)(256004)(966005)(26005)(478600001)(19627405001)(316002)(81156014)(102836004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1281;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: H1V/gNia/mwApQ+zeCkiXMbRP+0xGXgt4aFGjWhwQMGP6Ym45257atUE2+W7xrwUjBSo7BCE9J9Ckyih16rIhLrsXii6vtyenTR9kLZ9F7U0R0WVjtcMMVT0M5xuhtvwst4KxbY7rmwRgQ9p2TUShZZNO3Ca0jLNXp4qTHfQmOELIWgw8+RZrL56r+Bv3kk/TroptR6pUA2nnMw/HJ8YdlyHYwlDZy3+aeAR+3z3H20CpqrMlprvtqXLp9mfJMr3n2Rwe6x+SkI2YslfJD+F2xsm2fZKx+2GZwDtBphRJ7y4M5n2O6bYEljwq5D/flHWok+RzsddIVeOYlNtjvAeLJBHzQ8RzCcyxkyigoLpkrr+E6sBNKURFtiT/Hn81tm6lFnLsJdBRxZ9gsw+D4o//WFVoQT6xN5pbK7TmZ8YnfE=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e9cf73d-841c-49be-3c82-08d70ac7bfc1
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2019 15:02:12.5277 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: adeucher@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1281
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4i8fM16nxqkXPjGVPilOH+DAZdSX4l6XimOWqH6LJms=;
 b=qw+8TcXTKHonnUUhB1oQUQq66CsYs47gscLzXFkl2ltM0C3u2/db4IEUPLh6v3+vyGELZmGj/bIt6yHAexpNoYnvJLfTxRDaubXrQynSC0eFkIJH/kGSmvTJZMzsJiYZHTSgcjIagURVQUEnfoWw+3U7nA0RGc8Qr1i7ix2AC+8=
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
Content-Type: multipart/mixed; boundary="===============1860698999=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1860698999==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB1809B7289753A4D44644CABDF7C90BN6PR12MB1809namp_"

--_000_BN6PR12MB1809B7289753A4D44644CABDF7C90BN6PR12MB1809namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Alex Deucher <alexander.deucher@amd.com>
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Greathou=
se, Joseph <Joseph.Greathouse@amd.com>
Sent: Wednesday, July 17, 2019 10:58 AM
To: amd-gfx@lists.freedesktop.org
Cc: Greathouse, Joseph
Subject: [PATCH] drm/amdkfd: Remove GWS from process during uninit

If we shut down a process without having destroyed its GWS-using
queues, it is possible that GWS BO will still be in the process
BO list during the gpuvm destruction. This list should be empty
at that time, so we should remove the GWS allocation at the
process uninit point if it is still around.

Change-Id: I098e7b315070dd5b0165bb7905aef643450f27f2
Signed-off-by: Joseph Greathouse <Joseph.Greathouse@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c b/drive=
rs/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
index da0958625861..7e6c3ee82f5b 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
@@ -150,6 +150,9 @@ void pqm_uninit(struct process_queue_manager *pqm)
         struct process_queue_node *pqn, *next;

         list_for_each_entry_safe(pqn, next, &pqm->queues, process_queue_li=
st) {
+               if (pqn->q && pqn->q->gws)
+                       amdgpu_amdkfd_remove_gws_from_process(pqm->process-=
>kgd_process_info,
+                               pqn->q->gws);
                 uninit_queue(pqn->q);
                 list_del(&pqn->process_queue_list);
                 kfree(pqn);
--
2.19.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB1809B7289753A4D44644CABDF7C90BN6PR12MB1809namp_
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
Acked-by: Alex Deucher &lt;alexander.deucher@amd.com&gt;<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Greathouse, Joseph &lt;Joseph=
.Greathouse@amd.com&gt;<br>
<b>Sent:</b> Wednesday, July 17, 2019 10:58 AM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org<br>
<b>Cc:</b> Greathouse, Joseph<br>
<b>Subject:</b> [PATCH] drm/amdkfd: Remove GWS from process during uninit</=
font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">If we shut down a process without having destroyed=
 its GWS-using<br>
queues, it is possible that GWS BO will still be in the process<br>
BO list during the gpuvm destruction. This list should be empty<br>
at that time, so we should remove the GWS allocation at the<br>
process uninit point if it is still around.<br>
<br>
Change-Id: I098e7b315070dd5b0165bb7905aef643450f27f2<br>
Signed-off-by: Joseph Greathouse &lt;Joseph.Greathouse@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c | 3 &#43;&#43;=
&#43;<br>
&nbsp;1 file changed, 3 insertions(&#43;)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c b/drive=
rs/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c<br>
index da0958625861..7e6c3ee82f5b 100644<br>
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c<br=
>
@@ -150,6 &#43;150,9 @@ void pqm_uninit(struct process_queue_manager *pqm)<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct process_queue_node =
*pqn, *next;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; list_for_each_entry_safe(p=
qn, next, &amp;pqm-&gt;queues, process_queue_list) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (pqn-&gt;q &amp;&amp; pqn-&gt;q-&gt;gws)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_amdkf=
d_remove_gws_from_process(pqm-&gt;process-&gt;kgd_process_info,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pqn-&gt;q-&gt;gws);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; uninit_queue(pqn-&gt;q);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; list_del(&amp;pqn-&gt;process_queue_list);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; kfree(pqn);<br>
-- <br>
2.19.1<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a></div>
</span></font></div>
</body>
</html>

--_000_BN6PR12MB1809B7289753A4D44644CABDF7C90BN6PR12MB1809namp_--

--===============1860698999==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1860698999==--
