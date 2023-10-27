Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D50007D9AD2
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Oct 2023 16:08:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5288F10E9AE;
	Fri, 27 Oct 2023 14:08:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2080.outbound.protection.outlook.com [40.107.92.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A1C810E9AE
 for <amd-gfx@lists.freedesktop.org>; Fri, 27 Oct 2023 14:08:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=brZ5c2Y2tq8RLqpZpAYsIR8lycxbjefT/1Wo/3AWRAnVDxfBFylBBnFm0QtPU4BKfFuenJKM7lr2F1OgPLSauxXOr2blMf8SiPDZnXLMKbS4kKCLv/u2+rRy/sVZKupUCgqqqH7BCEb3PLFVHVHPgbYkZqNWS++0j3HCTLRbJUpfqluZMVam9N8TqUUlXMjBDVuyDfSOlvRUj0RxMyLGOzy8OBoK/dBmB1Gcv1xx/cRhKr10kYxBL4HvWoa5aOhomGONCTWBoPnP6jpD/Xr1wUY3Ua4mPH2RkKIN7XaBqbNhyjzT6pgu3aoc5+oCqJT05RORIOyHHHYJ7RlCR4Cs4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2in1indJrdOvV4hhApf+YeenGBOj2H7L7oUwd2uIW7Y=;
 b=WmU7JU+JK9b/CuGmUoBoKJ5Wmb2DGnVw/ppNhVksQm7ygt4wyhKZZMaHulnHB5na+p9J+ubnR2YcNRAU6w2OaBfRvc7IlAm4pA3xvYnHaUW/gKk9IbPpiNtLQGYWz9OA9rQp5CVsA8FOnBUXw6pe+XYkd8TFkkJNhrsriK/meY+5r3MsTxFB0cL+F3BBpkIcizOuEfGuQfeNn+x82BbIQUQDRxDw+0J2fLB0dynoOfIVxJOe+Iv6H81R38nga/9K1aWYdqLwHwuX+SFTvzFhBv7xevOq4iW9lgyjCRif3IB7f7mFwKtbemcIt8Q5uAlbwPGo5nVRMvSO693pUDwzmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2in1indJrdOvV4hhApf+YeenGBOj2H7L7oUwd2uIW7Y=;
 b=Dycd3ULOCCjlwTSvx9139lVNhvifLJoo6278PVyxK3TxumJA0ohjM4thYIDhqB+G2nO2nnCT4bJa8MJacRO8bB6Zq3vwPEQiamNB4L2RNrcniyfyhOWDvgdXZqJ62hFcgnWc+/KXJ8aGT8r5NKO1xdwebwbe0Gwzug3C5H0y0uo=
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by CH3PR12MB9252.namprd12.prod.outlook.com (2603:10b6:610:1ba::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.19; Fri, 27 Oct
 2023 14:08:08 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::f081:16c7:9129:c010]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::f081:16c7:9129:c010%3]) with mapi id 15.20.6933.024; Fri, 27 Oct 2023
 14:08:08 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Liu01, Tong (Esther)" <Tong.Liu01@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: add unmap latency when gfx11 set kiq resources
Thread-Topic: [PATCH] drm/amdgpu: add unmap latency when gfx11 set kiq
 resources
Thread-Index: AQHaCId4IZsD8BVbKUy/2Wl60gBdd7BdrOXA
Date: Fri, 27 Oct 2023 14:08:08 +0000
Message-ID: <BL1PR12MB5144BE624DB7B78BCF056301F7DCA@BL1PR12MB5144.namprd12.prod.outlook.com>
References: <20231027034111.319751-1-Tong.Liu01@amd.com>
In-Reply-To: <20231027034111.319751-1-Tong.Liu01@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=True;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2023-10-27T14:08:08.125Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged; 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5144:EE_|CH3PR12MB9252:EE_
x-ms-office365-filtering-correlation-id: 816d6ce2-1be9-424a-1307-08dbd6f625da
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: p/3s6dpsI7/T655WwxIM28AXdlgmW1TAYlAZu6iXxq03YtAo6WhxFfQdyAaX6Jg3i9eSPq4LEH111ahCa2qTReYeGGdCxV1ZdMR/7g8i0Kh2qiCJh1IJRvH0z+PerHMju9ALFzFtGcsol8zr3qOpkPk/FdWgnOUTXO3G9LjyPmfUK9zIpfHH0+V8eXKPFlcV18qNe160qYQ5qgcQjKVVkYbgiTTadeJYI4YPOywMXTpfxiLCTpFxAKAsOIbHaVHDFGSiPJ32zdOIAPMhONi5ab0SMkt59Qh0ASveZLRldzUwzPuDuwboeWSCJ/P73dqxwC0V9cisrkLVpqb0tmRenmkfZlb0Tj3jS7R2DHhMPY1soww3wm/vZ/rI/Gm06YVK28Z0T5ak4rq4dXhOKFyM8AFfXoElOwpltlMsi7B1EpONFtHeT/ne8eAvH7LfDytetq41usosDQNZ2lKEJVg7jsDLqbNbFrm+yD7pHLfARXJAP3Uu/uaoakbzZ4un7crUAOBwEyl23XVyxJKJsbhYGUfRq1/8/Z4SCZEk/ATD48jUTq3MpPMfJNhwWvnJ8/muCzkZ3AC5/CXWDUe1ddymXk6elcLlGZFwEZ0+IqiRGiX8ol8Cc0STXdL3Uf5d1TCQ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(396003)(366004)(39860400002)(136003)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(66476007)(2906002)(19627405001)(5660300002)(41300700001)(52536014)(55016003)(4326008)(8676002)(8936002)(83380400001)(122000001)(76116006)(7696005)(38070700009)(38100700002)(66946007)(54906003)(66446008)(316002)(66556008)(64756008)(9686003)(53546011)(26005)(33656002)(71200400001)(6506007)(86362001)(110136005)(478600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?nCIBfV8wPTaedqxj54MUp8J+43qhc+y5LDjb28MN2WE9fAqMNe6mNSD1izdk?=
 =?us-ascii?Q?5isxtva30etQ1nNOtVrRk/Tf4eSRBaPhQOu4xtgkGl5TVis53la6OoVaFREU?=
 =?us-ascii?Q?jaqJs8N1pgC1iVHp3F4oaI4y7cTLT0Ds/0kA/4l18rpMY8lTo/vOXewDm5dk?=
 =?us-ascii?Q?pcmwtizgdIy4fd6WrfU5ic3VIsEu6IZf0rChZBt2CbZj2e7ZCWE4doJAC8UT?=
 =?us-ascii?Q?Q2Wjl+e3jVwb4bd+xxuFXwyNbk1p9lpixDhCwjsiHwYim4dwvnceupbBfHCy?=
 =?us-ascii?Q?RC0fMBfWfiWzpDdcp+nREohnZtIVyygo85+obpRpMbiLhFDxkZiFYbg0RzJ9?=
 =?us-ascii?Q?WMm99dllFSz5vM5vETLEf6wvKw5Ow/YHTQJMeCr/F6QPjgfUfxaWfdq/l7wd?=
 =?us-ascii?Q?OtEbH42LrW76I8CePCtoRJc/+nq5NvV7r6fs+1lqrte3G4pql7uIbJl9fkCR?=
 =?us-ascii?Q?Xq7HErrve3VyMnU8yZPNhIVOL5NGTeqNUOmuUnyUfFv6+4DIJVgxGd3TNX9L?=
 =?us-ascii?Q?IhtYNpDM43dHtvTl6zSjNpBMYviZHJmdaV+zhpOw+PZA3unpEaf+jA9HNK0i?=
 =?us-ascii?Q?UiISsAkV/DLQ6R2x8kH6Eia0w+HaQJd6+xkHemN86NvWNJcARSrrhuWDzbAy?=
 =?us-ascii?Q?Ha6+L67bPIXSunvNuH7+PzmyB2saL/f6HKcbYxN77sp/xa+ZsNVskZbscduX?=
 =?us-ascii?Q?E9xB03gs8iENAwxyQ/VY4w789lVgguIyMLgTrh/RN/0qDl1AeBoOjSBc3H9C?=
 =?us-ascii?Q?a5/iXl9JTIhL22CEOsONfLWk4P29kumYxDQiODaAALFP9yt7Nf8K/C7op9Gv?=
 =?us-ascii?Q?aRLRldGXP1LvwU72qaGoaa0CvfPn/ssEO2qC4HIJlwz/wqXdI1S4Pitme9aL?=
 =?us-ascii?Q?7nepppAdyLeSj1HBb2qAkSh5QI8VNEua6xfK2nZCGEsCAmQm9K0atRm6GMdO?=
 =?us-ascii?Q?2WN+Mok05DHHkBNadOhriDU40nADI0DHesdvULawvTnGK7aTiN5dLFhFsVV/?=
 =?us-ascii?Q?N1SRLKtzl+4Sslvn1o1brk6suHrFWjpA8zmB7ke/TXBgPrgjRf3DSvXowPuV?=
 =?us-ascii?Q?t9IgEESK1zC3i0TAWxI014SeRV12r83wSoDlNt/AI2srg0voDpf+3tQLT/nL?=
 =?us-ascii?Q?gm1rdLw/tSe06wt62jrGNaRUqqUZGsj10CAhCA3oF6lbGvHmHVMSDHiVXcCj?=
 =?us-ascii?Q?mU3uxrKrD8qnKLOBbe1UqUUTr/1heqpjH6soZgmB+/itLcvJamuWL1hc1N8k?=
 =?us-ascii?Q?qR9fFxjJq5aMOX1kX+jcRgzLdVQMH8j3kGnMbOq/f4N6I7Dyr0QghuX7SpHm?=
 =?us-ascii?Q?gZksGycYN56A5fDAJ/Ki2YteFskVOGZEjEVo/ijcykqVf48DRNcVoYldV4+A?=
 =?us-ascii?Q?PIfT4zqeTHhk67Eu87T36493zFADC8JIxHmutf3kShZWQ/kL8itnSQYgnd7v?=
 =?us-ascii?Q?hUa4+fvoXzlQu+TJMz2WA7xtwIvxdr7NDq5uqWWvL3eKZlewLVSQIi3/WBnk?=
 =?us-ascii?Q?Q75ahVR7KQMXvuo7xjpj5xiq1rW/I/rhZW8y97Ya5jJeHq7jFhgILbx91FgY?=
 =?us-ascii?Q?3/iUQ6gMcaxl2aglc4o=3D?=
Content-Type: multipart/alternative;
 boundary="_000_BL1PR12MB5144BE624DB7B78BCF056301F7DCABL1PR12MB5144namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 816d6ce2-1be9-424a-1307-08dbd6f625da
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2023 14:08:08.8140 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h6rH1rhtZaFMUr6X5z52JfDDMjaOMouavaa2MQ2VpmMaJE9YH4pMyC33Ua3ek5oWgccyUbHskiUMjwT59lGd+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9252
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: "Xiao, Jack" <Jack.Xiao@amd.com>, "Xu,
 Feifei" <Feifei.Xu@amd.com>, "Chen, Horace" <Horace.Chen@amd.com>, "Chang,
 HaiJun" <HaiJun.Chang@amd.com>, "Tuikov, Luben" <Luben.Tuikov@amd.com>,
 Evan Quan <Evan.Quan@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Liu, Monk" <Monk.Liu@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--_000_BL1PR12MB5144BE624DB7B78BCF056301F7DCABL1PR12MB5144namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[Public]

Acked-by: Alex Deucher <alexander.deucher@amd.com>
________________________________
From: Tong Liu01 <Tong.Liu01@amd.com>
Sent: Thursday, October 26, 2023 11:41 PM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Cc: Evan Quan <Evan.Quan@amd.com>; Chen, Horace <Horace.Chen@amd.com>; Tuik=
ov, Luben <Luben.Tuikov@amd.com>; Koenig, Christian <Christian.Koenig@amd.c=
om>; Deucher, Alexander <Alexander.Deucher@amd.com>; Xiao, Jack <Jack.Xiao@=
amd.com>; Zhang, Hawking <Hawking.Zhang@amd.com>; Liu, Monk <Monk.Liu@amd.c=
om>; Xu, Feifei <Feifei.Xu@amd.com>; Chang, HaiJun <HaiJun.Chang@amd.com>; =
Liu01, Tong (Esther) <Tong.Liu01@amd.com>
Subject: [PATCH] drm/amdgpu: add unmap latency when gfx11 set kiq resources

[why]
If driver does not set unmap latency for KIQ, the default value of KIQ
unmap latency is zero. When do unmap queue, KIQ will return that almost
immediately after receiving unmap command. So, the queue status will be
saved to MQD incorrectly or lost in some chance.

[how]
Set unmap latency when do kiq set resources. The unmap latency is set to
be 1 second that is synchronized with Windows driver.

Signed-off-by: Tong Liu01 <Tong.Liu01@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c b/drivers/gpu/drm/amd/a=
mdgpu/gfx_v11_0.c
index fd22943685f7..7aef7a3a340f 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
@@ -155,6 +155,7 @@ static void gfx11_kiq_set_resources(struct amdgpu_ring =
*kiq_ring, uint64_t queue
 {
         amdgpu_ring_write(kiq_ring, PACKET3(PACKET3_SET_RESOURCES, 6));
         amdgpu_ring_write(kiq_ring, PACKET3_SET_RESOURCES_VMID_MASK(0) |
+                         PACKET3_SET_RESOURCES_UNMAP_LATENTY(0xa) | /* unm=
ap_latency: 0xa (~ 1s) */
                           PACKET3_SET_RESOURCES_QUEUE_TYPE(0));  /* vmid_m=
ask:0 queue_type:0 (KIQ) */
         amdgpu_ring_write(kiq_ring, lower_32_bits(queue_mask)); /* queue m=
ask lo */
         amdgpu_ring_write(kiq_ring, upper_32_bits(queue_mask)); /* queue m=
ask hi */
--
2.34.1


--_000_BL1PR12MB5144BE624DB7B78BCF056301F7DCABL1PR12MB5144namp_
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
<p style=3D"font-family:Arial;font-size:10pt;color:#008000;margin:15pt;font=
-style:normal;font-weight:normal;text-decoration:none;" align=3D"Left">
[Public]<br>
</p>
<br>
<div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Acked-by: Alex Deucher &lt;alexander.deucher@amd.com&gt;<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Tong Liu01 &lt;Tong.L=
iu01@amd.com&gt;<br>
<b>Sent:</b> Thursday, October 26, 2023 11:41 PM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> Evan Quan &lt;Evan.Quan@amd.com&gt;; Chen, Horace &lt;Horace.Che=
n@amd.com&gt;; Tuikov, Luben &lt;Luben.Tuikov@amd.com&gt;; Koenig, Christia=
n &lt;Christian.Koenig@amd.com&gt;; Deucher, Alexander &lt;Alexander.Deuche=
r@amd.com&gt;; Xiao, Jack &lt;Jack.Xiao@amd.com&gt;; Zhang, Hawking
 &lt;Hawking.Zhang@amd.com&gt;; Liu, Monk &lt;Monk.Liu@amd.com&gt;; Xu, Fei=
fei &lt;Feifei.Xu@amd.com&gt;; Chang, HaiJun &lt;HaiJun.Chang@amd.com&gt;; =
Liu01, Tong (Esther) &lt;Tong.Liu01@amd.com&gt;<br>
<b>Subject:</b> [PATCH] drm/amdgpu: add unmap latency when gfx11 set kiq re=
sources</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">[why]<br>
If driver does not set unmap latency for KIQ, the default value of KIQ<br>
unmap latency is zero. When do unmap queue, KIQ will return that almost<br>
immediately after receiving unmap command. So, the queue status will be<br>
saved to MQD incorrectly or lost in some chance.<br>
<br>
[how]<br>
Set unmap latency when do kiq set resources. The unmap latency is set to<br=
>
be 1 second that is synchronized with Windows driver.<br>
<br>
Signed-off-by: Tong Liu01 &lt;Tong.Liu01@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c | 1 +<br>
&nbsp;1 file changed, 1 insertion(+)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c b/drivers/gpu/drm/amd/a=
mdgpu/gfx_v11_0.c<br>
index fd22943685f7..7aef7a3a340f 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c<br>
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c<br>
@@ -155,6 +155,7 @@ static void gfx11_kiq_set_resources(struct amdgpu_ring =
*kiq_ring, uint64_t queue<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ring_write(kiq_ring=
, PACKET3(PACKET3_SET_RESOURCES, 6));<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ring_write(kiq_ring=
, PACKET3_SET_RESOURCES_VMID_MASK(0) |<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PACK=
ET3_SET_RESOURCES_UNMAP_LATENTY(0xa) | /* unmap_latency: 0xa (~ 1s) */<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; PACKET3_SET_RESOURCES_QUEUE_TYPE(0));&nbsp; /* vmid_mask:0 queue_typ=
e:0 (KIQ) */<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ring_write(kiq_ring=
, lower_32_bits(queue_mask)); /* queue mask lo */<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ring_write(kiq_ring=
, upper_32_bits(queue_mask)); /* queue mask hi */<br>
-- <br>
2.34.1<br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_BL1PR12MB5144BE624DB7B78BCF056301F7DCABL1PR12MB5144namp_--
