Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 184CFC9F1E
	for <lists+amd-gfx@lfdr.de>; Thu,  3 Oct 2019 15:12:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4839B6E9C1;
	Thu,  3 Oct 2019 13:12:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690081.outbound.protection.outlook.com [40.107.69.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6032F6E9C1
 for <amd-gfx@lists.freedesktop.org>; Thu,  3 Oct 2019 13:12:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BHlBZxEDvZ61XYg+Al63GabbcJATzacULna+bd5mVVSqTdOlstNTyQ3q6sDDiJPLXD++V3+M6miCEA3ZM6WCLbDUw/hgZs5xF00bPtnZjCfwapYPWcbYkOZ3SXrlQIQtFrx35uFsNm5oRLZfAhvdu3SdnDDlB17Ul+lcrzT9kKOe1oTQS2uCG9/tRgi/Z9jVJ7xetH6Y7mUdvkhTjUrXKYFdqbz7fWCYP0GX2o84kF1nwnjA2hgJDgpUkY8msy3XCCjG1ISZUcVXaCXP/tDF8Qedwqu4VmNkiOjoTh/Bbo6uoW5+Ly88JZ4QogrDlCX5EZkJ6XKT494OMRXVPko6sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DBNI34EfUvozN3XqTg2vs9KpFU/fR2wWfw5Mn32kVu4=;
 b=fVqsVla63cdPw7FvXEikCkWtUmUeD1n/QdZfjLX2+2l+1qXgG9yxuCE1A8arnnZt3IxTW2QGP6LInDZFcVPZtFBw3vHki6HCj4x6Z51aSkxUpX8J2A/A7DOCfmr8SOFTaTS+gTcavb7wLbpB/pkM8jskj2FAqwb7n2yV6/Zh2BwXpmNGx/VZMKY961TJ/ZQSJFKE5uiFLFV3OQXYhFGAAaje49zByrd7pqwQgbPkHQmkcDsU3g8NI2x2Asvnan5feV3+KEYXTLMqVey1sF7RMR4V8uFEBreClLUs0bHCyJSLqLD59EHi2RFkacFX7T6N6bY/EWmUWe8rHa+2y1VQsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1505.namprd12.prod.outlook.com (10.172.18.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Thu, 3 Oct 2019 13:12:01 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::418d:e764:3c12:f961]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::418d:e764:3c12:f961%10]) with mapi id 15.20.2305.023; Thu, 3 Oct 2019
 13:12:01 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Pelloux-prayer, Pierre-eric" <Pierre-eric.Pelloux-prayer@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: do not execute 0-sized IBs
Thread-Topic: [PATCH] drm/amdgpu: do not execute 0-sized IBs
Thread-Index: AQHVecESlri34d569kWl8OF1vO+U7KdIkEmAgAAEZACAAFAAFA==
Date: Thu, 3 Oct 2019 13:12:01 +0000
Message-ID: <BN6PR12MB1809256856DE153A35FD7EF6F79F0@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <20191003080306.3514-1-pierre-eric.pelloux-prayer@amd.com>
 <12e0b546-faaf-38c3-c0fc-1e713348b62e@gmail.com>,
 <a8d4871c-4b00-3a72-1cff-50878e1d8818@amd.com>
In-Reply-To: <a8d4871c-4b00-3a72-1cff-50878e1d8818@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.219.73.178]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 113b7e6a-2db0-4d9c-7362-08d74803477c
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: BN6PR12MB1505:
x-ms-exchange-purlcount: 3
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB1505112E728023AA89A2BEECF79F0@BN6PR12MB1505.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01792087B6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(136003)(396003)(39860400002)(346002)(376002)(366004)(199004)(189003)(446003)(14454004)(52536014)(478600001)(86362001)(8676002)(8936002)(966005)(76116006)(66946007)(81156014)(110136005)(316002)(66556008)(64756008)(66446008)(66476007)(66066001)(81166006)(19627405001)(9686003)(54896002)(55016002)(6306002)(236005)(71190400001)(71200400001)(2906002)(33656002)(606006)(25786009)(256004)(6246003)(229853002)(102836004)(53546011)(6506007)(74316002)(186003)(76176011)(7736002)(26005)(7696005)(2501003)(6116002)(5660300002)(6436002)(3846002)(105004)(476003)(11346002)(486006)(99286004)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1505;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: E4Bpo6R9zyp0q9YYRt244zhxaBw2pyGE0+d/IulKI2qOvaOxbdmEne40IZo2F50sNhj1ZxNP8+rdyMyaDNZVkna9wm1lq9pB9q11IrhjG5xLqZa+dbyFeY6SSKMlzJHi4dQ2FzgGlcKxD227ceaEV98EKfzf5r0b7wjhS2rQMsC6tg27t3Z9m626nRQOqNddGMRh1TQcpYAfuWVlsYIocl6+l5VRnQX+rt0Kv+edXDMSOw7AkVLXW+1FBxO2YXrHEyey8tDex27+/W8L5sfYSnJjp7dIo2qBc2a8/ERoXY0pyjZVI76IW6AdE4j4/dWxNUx2ktJIJscxyJhDLuoosQg0cIO5e4g47JMTYf+o2/DA+dacYMlggk3ttVg8aXyBvO2CiwdOadjCblCK4B/XK1qBjtWgOv2hSRMQV0hMtV4Lt5JmM98FO7Z2EHR63C+inWLfRZXNqkXiD++i3mGY1Q==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 113b7e6a-2db0-4d9c-7362-08d74803477c
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2019 13:12:01.5215 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5+F2zdhZBp8iXPgZK4mWtNWOw/xivTeY/L4OdJMatKeffPFWCxi/V0fLY6kTUEI0+Y2EONWCawjJWnZDS8jcqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1505
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DBNI34EfUvozN3XqTg2vs9KpFU/fR2wWfw5Mn32kVu4=;
 b=FnRFO37F9sHRpWE7yQI2MixHIUm2qBk8yo8QojVGqobSngsrPwjfLoske3lozugUK5M65nz9ElNj0QA4ZTJmxc36SFjDb33ZVMCfMzBiWcbf997i3u6KbRDeJP6Y1+2QDI4UAs2na+z7t8DTdKMlbdfG1pFH2vVij+GNSfyHVtA=
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
Content-Type: multipart/mixed; boundary="===============2082011708=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============2082011708==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB1809256856DE153A35FD7EF6F79F0BN6PR12MB1809namp_"

--_000_BN6PR12MB1809256856DE153A35FD7EF6F79F0BN6PR12MB1809namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Does some variant of the patch on this thread help?
https://patchwork.freedesktop.org/patch/333068/

Alex

________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Pelloux-=
prayer, Pierre-eric <Pierre-eric.Pelloux-prayer@amd.com>
Sent: Thursday, October 3, 2019 4:25 AM
To: Koenig, Christian <Christian.Koenig@amd.com>; amd-gfx@lists.freedesktop=
.org <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: do not execute 0-sized IBs


On 03/10/2019 10:09, Christian K=F6nig wrote:
> Am 03.10.19 um 10:03 schrieb Pelloux-prayer, Pierre-eric:
>> This can be safely skipped entirely.
>> This seems to help with https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11481.
>
> NAK, please instead fix gmc_v10_0_flush_gpu_tlb to include at least some =
NOP in the submitted IBs.

Is there any interest in executing an empty (or only filled with NOPs) IB?

Anyway I can modify the patch to do this.

Thanks,
Pierre-Eric

>
> Christian.
>
>>
>> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@am=
d.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_ib.c
>> index 60655834d649..aa163e679f1f 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c
>> @@ -227,6 +227,11 @@ int amdgpu_ib_schedule(struct amdgpu_ring *ring, un=
signed num_ibs,
>>               !amdgpu_sriov_vf(adev)) /* for SRIOV preemption, Preamble =
CE ib must be inserted anyway */
>>               continue;
>>   +        if (ib->length_dw =3D=3D 0) {
>> +            /* On Navi gmc_v10_0_flush_gpu_tlb emits 0 sized IB */
>> +            continue;
>> +        }
>> +
>>           amdgpu_ring_emit_ib(ring, job, ib, status);
>>           status &=3D ~AMDGPU_HAVE_CTX_SWITCH;
>>       }
>
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB1809256856DE153A35FD7EF6F79F0BN6PR12MB1809namp_
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
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Does some variant of the patch on this thread help?</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<a href=3D"https://patchwork.freedesktop.org/patch/333068/" id=3D"LPlnk1082=
71">https://patchwork.freedesktop.org/patch/333068/</a></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Alex<br>
</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font style=3D"font-size:11pt" face=
=3D"Calibri, sans-serif" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx=
-bounces@lists.freedesktop.org&gt; on behalf of Pelloux-prayer, Pierre-eric=
 &lt;Pierre-eric.Pelloux-prayer@amd.com&gt;<br>
<b>Sent:</b> Thursday, October 3, 2019 4:25 AM<br>
<b>To:</b> Koenig, Christian &lt;Christian.Koenig@amd.com&gt;; amd-gfx@list=
s.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&gt;<br>
<b>Subject:</b> Re: [PATCH] drm/amdgpu: do not execute 0-sized IBs</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText"><br>
On 03/10/2019 10:09, Christian K=F6nig wrote:<br>
&gt; Am 03.10.19 um 10:03 schrieb Pelloux-prayer, Pierre-eric:<br>
&gt;&gt; This can be safely skipped entirely.<br>
&gt;&gt; This seems to help with <a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D111481">
https://bugs.freedesktop.org/show_bug.cgi?id=3D111481</a>.<br>
&gt; <br>
&gt; NAK, please instead fix gmc_v10_0_flush_gpu_tlb to include at least so=
me NOP in the submitted IBs.<br>
<br>
Is there any interest in executing an empty (or only filled with NOPs) IB?<=
br>
<br>
Anyway I can modify the patch to do this.<br>
<br>
Thanks,<br>
Pierre-Eric<br>
<br>
&gt; <br>
&gt; Christian.<br>
&gt; <br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Pierre-Eric Pelloux-Prayer &lt;pierre-eric.pelloux-=
prayer@amd.com&gt;<br>
&gt;&gt; ---<br>
&gt;&gt; &nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c | 5 &#43;&#43;&#43;&=
#43;&#43;<br>
&gt;&gt; &nbsp; 1 file changed, 5 insertions(&#43;)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c b/drivers/gpu/=
drm/amd/amdgpu/amdgpu_ib.c<br>
&gt;&gt; index 60655834d649..aa163e679f1f 100644<br>
&gt;&gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c<br>
&gt;&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c<br>
&gt;&gt; @@ -227,6 &#43;227,11 @@ int amdgpu_ib_schedule(struct amdgpu_ring=
 *ring, unsigned num_ibs,<br>
&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; !amdgpu_sriov_vf(adev)) /* for SRIOV preemption, Preamble CE i=
b must be inserted anyway */<br>
&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; continue;<br>
&gt;&gt; &nbsp; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ib-&gt;=
length_dw =3D=3D 0) {<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; /* On Navi gmc_v10_0_flush_gpu_tlb emits 0 sized IB */<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; continue;<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&gt; &#43;<br>
&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ring=
_emit_ib(ring, job, ib, status);<br>
&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; status &amp=
;=3D ~AMDGPU_HAVE_CTX_SWITCH;<br>
&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; <br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a></div>
</span></font></div>
</body>
</html>

--_000_BN6PR12MB1809256856DE153A35FD7EF6F79F0BN6PR12MB1809namp_--

--===============2082011708==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============2082011708==--
