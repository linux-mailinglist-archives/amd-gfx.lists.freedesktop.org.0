Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2734610D05
	for <lists+amd-gfx@lfdr.de>; Wed,  1 May 2019 21:08:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B5F589254;
	Wed,  1 May 2019 19:08:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730078.outbound.protection.outlook.com [40.107.73.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5183889254
 for <amd-gfx@lists.freedesktop.org>; Wed,  1 May 2019 19:08:31 +0000 (UTC)
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1779.namprd12.prod.outlook.com (10.175.102.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.10; Wed, 1 May 2019 19:08:29 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::bc5b:de68:25b7:d853]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::bc5b:de68:25b7:d853%12]) with mapi id 15.20.1835.018; Wed, 1 May 2019
 19:08:29 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Huang, Trigger" <Trigger.Huang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: Add IDH_QUERY_ALIVE event for SR-IOV
Thread-Topic: [PATCH] drm/amdgpu: Add IDH_QUERY_ALIVE event for SR-IOV
Thread-Index: AQHU/y756D1lSQG0T0+EaMmo37+I06ZWpBbP
Date: Wed, 1 May 2019 19:08:29 +0000
Message-ID: <BN6PR12MB1809B40A04849DBFD778D161F73B0@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <1556613013-8586-1-git-send-email-Trigger.Huang@amd.com>
In-Reply-To: <1556613013-8586-1-git-send-email-Trigger.Huang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.219.84.143]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 39e5f3a1-3a22-4b67-c2e9-08d6ce686587
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1779; 
x-ms-traffictypediagnostic: BN6PR12MB1779:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN6PR12MB17797C9E94F526885F76BBFDF73B0@BN6PR12MB1779.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2733;
x-forefront-prvs: 00246AB517
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(136003)(376002)(39860400002)(396003)(346002)(199004)(189003)(486006)(66066001)(446003)(6246003)(9686003)(229853002)(8936002)(86362001)(53546011)(68736007)(476003)(11346002)(74316002)(33656002)(81156014)(256004)(6306002)(6506007)(81166006)(606006)(8676002)(26005)(73956011)(53936002)(25786009)(236005)(102836004)(14444005)(76116006)(5660300002)(110136005)(55016002)(66476007)(7696005)(316002)(186003)(966005)(64756008)(54896002)(66446008)(66556008)(105004)(66946007)(6116002)(3846002)(52536014)(19627405001)(2501003)(2906002)(99286004)(478600001)(72206003)(14454004)(76176011)(71200400001)(6436002)(71190400001)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1779;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +j2r96UP7BLxWvOnK8YNF/YrP6/gfjYFqj2egcm3BVnOoAETSqYukt09Uuu59C5Fv9AH9d/ZfyqSO0ds4/9MHgkQ/x7dIGZIq8GheoGipogyK1iD753p26Wk8SZSZiHfRJCqfvFLZHA8rbcsQjlTK9cFSACIRRmdETNbXU0wguMTpcT1HhWTwCv3vwmJVuhy+b7gL7IthIUuQCHJkyqcSCpXD2mmMBlqWzhX4+qSljtxyiapIBpD9Td+r2EcwOFr5F0GiwBJDwKk9kOGhzqXFEge7nH/EA3M0httC7PwDmKT2i1hP5T3kS2zpG+JDXJW2in8WTHsORqo+WKT4S0PLMEyux5nWN+JCLdDsQkxVGnDV8/LJrGQ3nR98qizIC0d9Sy/sIu7PD6PhM8mURx46zKsZ/H4ZsBG1e/IX8TqWkY=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39e5f3a1-3a22-4b67-c2e9-08d6ce686587
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 May 2019 19:08:29.3779 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1779
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NdgqISkKuigztleegdEOtbWQySF56U9cWc98xgnjkGU=;
 b=o8h55JJZvkStrSa9G8TrTvg7d3lvXse/jEEZpLxh8zGLnS7qEBM1Asto5NPi8sff9XwXEU9JzfRO8tkDPJsIF3LLVYqNjPAPRK0Lb9dXGkRlBlpko4j3q+wTUf51hYEYwtkLE7IDjDch6I5QeyoJu0kazBzRkUn9EY1pVpuJYnA=
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
Content-Type: multipart/mixed; boundary="===============0986914697=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0986914697==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB1809B40A04849DBFD778D161F73B0BN6PR12MB1809namp_"

--_000_BN6PR12MB1809B40A04849DBFD778D161F73B0BN6PR12MB1809namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Alex Deucher <alexander.deucher@amd.com>
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Trigger =
Huang <Trigger.Huang@amd.com>
Sent: Tuesday, April 30, 2019 4:30 AM
To: amd-gfx@lists.freedesktop.org
Cc: Huang, Trigger
Subject: [PATCH] drm/amdgpu: Add IDH_QUERY_ALIVE event for SR-IOV

[CAUTION: External Email]

SR-IOV host side will send IDH_QUERY_ALIVE to guest VM to check
if this guest VM is still alive (not destroyed). The only thing
guest KMD need to do is to send ACK back to host.

Signed-off-by: Trigger Huang <Trigger.Huang@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c | 3 +++
 drivers/gpu/drm/amd/amdgpu/mxgpu_ai.h | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c b/drivers/gpu/drm/amd/am=
dgpu/mxgpu_ai.c
index 8dbad49..2471e7c 100644
--- a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
+++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
@@ -372,6 +372,9 @@ static int xgpu_ai_mailbox_rcv_irq(struct amdgpu_device=
 *adev,
                if (amdgpu_sriov_runtime(adev))
                        schedule_work(&adev->virt.flr_work);
                break;
+               case IDH_QUERY_ALIVE:
+                       xgpu_ai_mailbox_send_ack(adev);
+                       break;
                /* READY_TO_ACCESS_GPU is fetched by kernel polling, IRQ ca=
n ignore
                 * it byfar since that polling thread will handle it,
                 * other msg like flr complete is not handled here.
diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.h b/drivers/gpu/drm/amd/am=
dgpu/mxgpu_ai.h
index 39d151b..077e91a 100644
--- a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.h
+++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.h
@@ -49,6 +49,7 @@ enum idh_event {
        IDH_FLR_NOTIFICATION_CMPL,
        IDH_SUCCESS,
        IDH_FAIL,
+       IDH_QUERY_ALIVE,
        IDH_EVENT_MAX
 };

--
2.7.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB1809B40A04849DBFD778D161F73B0BN6PR12MB1809namp_
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
ounces@lists.freedesktop.org&gt; on behalf of Trigger Huang &lt;Trigger.Hua=
ng@amd.com&gt;<br>
<b>Sent:</b> Tuesday, April 30, 2019 4:30 AM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org<br>
<b>Cc:</b> Huang, Trigger<br>
<b>Subject:</b> [PATCH] drm/amdgpu: Add IDH_QUERY_ALIVE event for SR-IOV</f=
ont>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">[CAUTION: External Email]<br>
<br>
SR-IOV host side will send IDH_QUERY_ALIVE to guest VM to check<br>
if this guest VM is still alive (not destroyed). The only thing<br>
guest KMD need to do is to send ACK back to host.<br>
<br>
Signed-off-by: Trigger Huang &lt;Trigger.Huang@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c | 3 &#43;&#43;&#43;<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/mxgpu_ai.h | 1 &#43;<br>
&nbsp;2 files changed, 4 insertions(&#43;)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c b/drivers/gpu/drm/amd/am=
dgpu/mxgpu_ai.c<br>
index 8dbad49..2471e7c 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c<br>
@@ -372,6 &#43;372,9 @@ static int xgpu_ai_mailbox_rcv_irq(struct amdgpu_de=
vice *adev,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; if (amdgpu_sriov_runtime(adev))<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; schedule_wo=
rk(&amp;adev-&gt;virt.flr_work);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; break;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; case IDH_QUERY_ALIVE:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xgpu_ai_mail=
box_send_ack(adev);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; /* READY_TO_ACCESS_GPU is fetched by kernel polling, IRQ ca=
n ignore<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; * it byfar since that polling thread will handle it,<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; * other msg like flr complete is not handled here.<br=
>
diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.h b/drivers/gpu/drm/amd/am=
dgpu/mxgpu_ai.h<br>
index 39d151b..077e91a 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.h<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.h<br>
@@ -49,6 &#43;49,7 @@ enum idh_event {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; IDH_FLR_NOTIFICATION_CMPL,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; IDH_SUCCESS,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; IDH_FAIL,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; IDH_QUERY_ALIVE,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; IDH_EVENT_MAX<br>
&nbsp;};<br>
<br>
--<br>
2.7.4<br>
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

--_000_BN6PR12MB1809B40A04849DBFD778D161F73B0BN6PR12MB1809namp_--

--===============0986914697==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0986914697==--
