Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E514761B5
	for <lists+amd-gfx@lfdr.de>; Wed, 15 Dec 2021 20:27:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19EFD10F86E;
	Wed, 15 Dec 2021 19:27:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2059.outbound.protection.outlook.com [40.107.237.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DFDF10F868
 for <amd-gfx@lists.freedesktop.org>; Wed, 15 Dec 2021 19:27:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fZpnk85e6V3jmDcMx7Lg0oUkukuI+rnd2y3VdVl4sVkDM+MgG484mEZoz/hBoiZWe/TCSFkcXGRoYrFWeI6p8qUUY1IqG36n7otHfsq5DtD4DTLNS4yGeKuhxrYyvZa5irV86XvXEHVxm1LvEkfkEiJkgj9l3/aEEPordBd1PjlcwvXQMyiJMdXtmLNlIYHoSzB3LedRaso6V3E1Yif23WWuQu+jx9FBxpXASL6pa+2w3Vp6hDzu2m7lI1739X356NseA4SIHPSXLrLx5LGwhJryYH3N1ba+o0eey5rNtKTkBxcAWAxKtZXqjAGAoJ689Yw3+4tHOAEoX8cMR0iTLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=djSNd/HNRCFksAlem+cPu2DsFCiTFvIcVtUL+vCIL6M=;
 b=Or6uAQIdXxx7Pe++MKUmJpmTEF+eKJnRqNlZfUB3fhfAGYjxkxXDHyEA8AOpmtdUkbnJPOqYtj3pE462ZSYu2Uk4xKKNnpoXIdb6H3v1HZZh1G2nxPiWn9wpo9G6yp7EingSWbB80vGJBdgNhh527ZzRR39C7SmyCzLdt7QQFMcvaK5o2L+G6jaVt1wzgdWc1utu99/iNn/G4qVkr8CTAUi2IvMEZAaCRr005eOT19HuRS5h/q+ozx7Xd0m7z5lQ/HoDMcFmWrMESR9DQhI2imkc+mTFgVgIhpwfLTbth6jxzCeKfrCIHEzsq8yFdH5UcankHvXie+JzJusfkCL9Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=djSNd/HNRCFksAlem+cPu2DsFCiTFvIcVtUL+vCIL6M=;
 b=VBpFlmjYITYoXf1dU0SUYRa2q/OEjic22r8hlt9KWaXRWkZf+bBTC+i8Iu9How9QSecAz7i9tTmI/PV8DGKEBATtNa4MEkmaO3wgGV48K4mYZPyWNt3dqJZ7vNtE4s1KJyRxpiug5HlJpyHplOyCtotTFpwVYWnF77m7duUb8qA=
Received: from BYAPR12MB2840.namprd12.prod.outlook.com (2603:10b6:a03:62::32)
 by BYAPR12MB3605.namprd12.prod.outlook.com (2603:10b6:a03:ae::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.16; Wed, 15 Dec
 2021 19:27:30 +0000
Received: from BYAPR12MB2840.namprd12.prod.outlook.com
 ([fe80::5425:7b82:3787:d5fa]) by BYAPR12MB2840.namprd12.prod.outlook.com
 ([fe80::5425:7b82:3787:d5fa%5]) with mapi id 15.20.4778.018; Wed, 15 Dec 2021
 19:27:30 +0000
From: "Nieto, David M" <David.Nieto@amd.com>
To: "Skvortsov, Victor" <Victor.Skvortsov@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deng,
 Emily" <Emily.Deng@amd.com>, "Liu, Monk" <Monk.Liu@amd.com>, "Ming, Davis"
 <Davis.Ming@amd.com>, "Liu, Shaoyun" <Shaoyun.Liu@amd.com>, "Zhou, Peng Ju"
 <PengJu.Zhou@amd.com>, "Chen, JingWen" <JingWen.Chen2@amd.com>, "Chen,
 Horace" <Horace.Chen@amd.com>
Subject: Re: [PATCH 5/5] drm/amdgpu: Modify indirect register access for gfx9
 sriov
Thread-Topic: [PATCH 5/5] drm/amdgpu: Modify indirect register access for gfx9
 sriov
Thread-Index: AQHX8eVYqkrz5GuZGEuqCdtGaPXlTKwz7Ac/gAABSQCAAAHMfQ==
Date: Wed, 15 Dec 2021 19:27:30 +0000
Message-ID: <BYAPR12MB28406D8BFF2ED8B49D44AD51F4769@BYAPR12MB2840.namprd12.prod.outlook.com>
References: <20211215185510.15134-1-victor.skvortsov@amd.com>
 <20211215185510.15134-6-victor.skvortsov@amd.com>
 <BYAPR12MB2840F2BD83E7E075F7EF40D0F4769@BYAPR12MB2840.namprd12.prod.outlook.com>
 <BN9PR12MB5324E5F73B6CD4829091DE6E8B769@BN9PR12MB5324.namprd12.prod.outlook.com>
In-Reply-To: <BN9PR12MB5324E5F73B6CD4829091DE6E8B769@BN9PR12MB5324.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=True;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2021-12-15T19:27:29.580Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged; 
suggested_attachment_session_id: e6a97029-db88-0736-7600-daa129a8266a
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6bc8f08d-adc9-4608-baac-08d9c000efb5
x-ms-traffictypediagnostic: BYAPR12MB3605:EE_
x-microsoft-antispam-prvs: <BYAPR12MB36058ECBF14ABCF12F5BC0F6F4769@BYAPR12MB3605.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FK0hxPHJQcQHjfji9gdhoFcGG16Ee51qJoGLHiMP46LxxxqfV5U36rycoJGzIf1Flqq7fO/okyAbQb6dyXkasp63Zlu0NWfmg7tHIBB+NdnMa1JAePnaOhpsla+3X7dDd8uqbkVpwbgSk8ed/KgA4pqddzqw0xwsmlOS2/0v6lNgt3QPOWE0US1DwnJei88yxQvO6jl4hSFzgnFZJDzeGFMYAyLAgSalSsgs9lHuaaElrfp5aLh81t4CZ490RZ02LWh75uY+yl+QTtnofvUi3RM1OTMuf39+TOjHuxA/9Kx+dNoraQOx9dNLk/2cBvwxMac4alSQTk7UzCqEN1tYkz/QeWdYOhlMoZUEcDbPtu7RvCxMMyk4O48EJ+CJ7jszYxOROK0B0jue55kN8HFBFWdSSCz/bucEDw88i4XEGJeXKglELct6K72KKxRAgyRdNzY3FUA8PQ0V3xN8/gZsLKy9HR1PWr4hLPJLZKMFnjijHaCxSOCkraJBr4I6cD9//mA1Y2fI1wx0fUetEqSaWQuYR55D0qBWpvGFmduRfACG8xw/gWmVYfFwGlxB90aZor9ZpoRNkmhdG8duC8jqo+OE6u3ilQdXyLTrBICTlSIKWQg/ORyq8Pre0ibuz3SPtzApHK3sn2F1HVBn5bCqkJCMF/leAzak2YOTCGNoIGDHPhJ0bKNLL7WahPMVWMBFfXIl1DJFGSwNVF1hb/8wQ4xKmuz6IyjP1RCpE1t/Lgw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB2840.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(55016003)(38070700005)(5660300002)(9686003)(508600001)(19627405001)(38100700002)(33656002)(316002)(30864003)(71200400001)(122000001)(110136005)(7696005)(6636002)(53546011)(8676002)(52536014)(921005)(66476007)(64756008)(66446008)(83380400001)(66556008)(19627235002)(2906002)(6506007)(76116006)(8936002)(66946007)(86362001)(186003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hT9vdZ4HHtWFM11y8KuvSVqSGnLZNlTihsVGI9bpFpUOuNLlEP+XHZfhH1WT?=
 =?us-ascii?Q?fxAiCnSPFesDqbzKMPrap5NvjZ6x9qWFD4mXRTuyYyyAA+qX/BZ36JMhJvlM?=
 =?us-ascii?Q?hW8IrcG3Saj1j05UkEPjGxQ7JDtyXS0d9fWTS+uCvwJm+L/wSLH1OvZu0K1j?=
 =?us-ascii?Q?CNyZINtFjuGiTYEaUamQ3qy2hNM+mKMAYi4m49KC1vfspqRXj3G6ZDyOCuNy?=
 =?us-ascii?Q?9XO+vhR8R6avqcn4vBYr6BM/zTh6gDxTDUP9KP3kYJPiqXnXuN83FuuQjN7Q?=
 =?us-ascii?Q?sH0oQWb1pNE/jJziiitRkLyq9PPwGHVx/9A5A9CupIU1TM8g9RJomtCx0BPO?=
 =?us-ascii?Q?AHCP4w55SrBCUwHtz9vfHaOD7RrdUTNXVXVjoTHLgDa4BFcsTtRa7FmExIxP?=
 =?us-ascii?Q?d2TgBo4lfAF3y+UZGsK9z7O5f0R/obrqRGZOU8GJGaRHQCD9xQdtCXBw7/qT?=
 =?us-ascii?Q?QYuCAFYQxHMa2Icxu5nUnbvo3ZJisU3RV/0dCkaZrd3FhkAU7hNYbJVUUuI4?=
 =?us-ascii?Q?OZQpcb/+Rbt4tpMMGFyYSTJlkwlSwoMm18SDSPNYlZLt0A42fQeoQ0PRKhnO?=
 =?us-ascii?Q?XImpOKvBa2pKzNLhTQCXOQC+OGM3YhcL/wZcIAAaNEun/GuoN+c+X/6r210K?=
 =?us-ascii?Q?Y1y8/komdrwkoHh9lOIcIx2Y5q4NmKtqXuqo5QMjpF+gYUAU+vPjuH/GLatn?=
 =?us-ascii?Q?OfODaw8loO2imOR44Q4/hKyHN7HHdSk0myTfyt62TMJ9XAckrUCoOj9CLybG?=
 =?us-ascii?Q?AV2BsrC+o623kmqc6s/QC1Sh5oIBS+n1zZyZ9fGqQWjiZ3z+l+rqM+0Jdlu+?=
 =?us-ascii?Q?aP7Vy5DayNYqkwXzyNJQA7iXs2QVxLztsfXHquS4asIGAKdCEhnBYdGzGtzw?=
 =?us-ascii?Q?BS6OkEwmGTrhV4t/21tddl9aRe8B6AC664aWXXgVGl1ZE/NS0wHsHyPfkLtl?=
 =?us-ascii?Q?sgbtsoaiXPqM7MpxJzR+aRPukU2v70d3it7BY1mO31IqSas7UOhA67EezNCH?=
 =?us-ascii?Q?NXjTJg8H7yyQN9DOCvBwCSFq2xfEvtgw3pEdK6GyzAyalW1PYthHeXLzmcXW?=
 =?us-ascii?Q?fnOm8bA6+FH6gT36Dmb4irE7jtGWLFFEG28q9r78NWEUs4gZq8cxinUHGNsF?=
 =?us-ascii?Q?JL7vRvDV6BbkkRk+af+vIIA9+DrlSVZLe+E4r1+ZsSgtYcc9/8oIlC0ysC3T?=
 =?us-ascii?Q?bMa3f5h7VdF6DiV9WlYocu61xFqC6W7ry65nOFQ/rlEgHt0t6XgDt/hIi3II?=
 =?us-ascii?Q?t9N0BQx7uu+eps/A+fbJqtw9XCcdC+mcCaVrY79gLmoe52zD336e8Z1dzwFX?=
 =?us-ascii?Q?+PEnbq5ENbbPkOFI4ijsE2QPZOZAb5p2CUzg/6HxRvaYU9zMJf6eoy+mRh1s?=
 =?us-ascii?Q?jyQ3d46tHmr2Zn6hJXDS0Ckw+UZvQJ0hQnpbx7G48g8d8SJtfXy6C5UK03PT?=
 =?us-ascii?Q?DmxV4NuvVvb/FVDbRvo6cI3EI9GPq/ayltQkD/8uTFuEx1ulnupFx5MS/JZY?=
 =?us-ascii?Q?Hb97+Op15fL5UmRq7RamRDTO3wy0ZpR5lg6Vgjcxegj+hBhN/nD/G36UeQMP?=
 =?us-ascii?Q?+rQWwjmBSGaZq6vII9OenIPfFfia1O92fJyY2NOM?=
Content-Type: multipart/alternative;
 boundary="_000_BYAPR12MB28406D8BFF2ED8B49D44AD51F4769BYAPR12MB2840namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2840.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bc8f08d-adc9-4608-baac-08d9c000efb5
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2021 19:27:30.3273 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YY8KWV4Yd6pWS6BMgB3ltlnCnSuqsj05CiTBx8+JD9r6/kzzaZqnfvDu9T2qN4mp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3605
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--_000_BYAPR12MB28406D8BFF2ED8B49D44AD51F4769BYAPR12MB2840namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[Public]

Gotcha,

Can you add prior to the implementation a small description on how the inte=
rface and the different scratch registers work? It may be easier to review =
with a clear idea of the operation. I know the earlier implementation did n=
ot include it, but now that we are modifying it, it would be good to docume=
nt it.


________________________________
From: Skvortsov, Victor <Victor.Skvortsov@amd.com>
Sent: Wednesday, December 15, 2021 11:18 AM
To: Nieto, David M <David.Nieto@amd.com>; amd-gfx@lists.freedesktop.org <am=
d-gfx@lists.freedesktop.org>; Deng, Emily <Emily.Deng@amd.com>; Liu, Monk <=
Monk.Liu@amd.com>; Ming, Davis <Davis.Ming@amd.com>; Liu, Shaoyun <Shaoyun.=
Liu@amd.com>; Zhou, Peng Ju <PengJu.Zhou@amd.com>; Chen, JingWen <JingWen.C=
hen2@amd.com>; Chen, Horace <Horace.Chen@amd.com>
Subject: RE: [PATCH 5/5] drm/amdgpu: Modify indirect register access for gf=
x9 sriov


[AMD Official Use Only]



This was a bug in the original definition, but it functionally it makes no =
difference (in both cases the macros resolve to the same value).



From: Nieto, David M <David.Nieto@amd.com>
Sent: Wednesday, December 15, 2021 2:16 PM
To: Skvortsov, Victor <Victor.Skvortsov@amd.com>; amd-gfx@lists.freedesktop=
.org; Deng, Emily <Emily.Deng@amd.com>; Liu, Monk <Monk.Liu@amd.com>; Ming,=
 Davis <Davis.Ming@amd.com>; Liu, Shaoyun <Shaoyun.Liu@amd.com>; Zhou, Peng=
 Ju <PengJu.Zhou@amd.com>; Chen, JingWen <JingWen.Chen2@amd.com>; Chen, Hor=
ace <Horace.Chen@amd.com>
Subject: Re: [PATCH 5/5] drm/amdgpu: Modify indirect register access for gf=
x9 sriov



[AMD Official Use Only]



         scratch_reg0 =3D adev->rmmio + (adev->reg_offset[GC_HWIP][0][mmSCR=
ATCH_REG0_BASE_IDX] + mmSCRATCH_REG0)*4;
         scratch_reg1 =3D adev->rmmio + (adev->reg_offset[GC_HWIP][0][mmSCR=
ATCH_REG1_BASE_IDX] + mmSCRATCH_REG1)*4;
-       scratch_reg2 =3D adev->rmmio + (adev->reg_offset[GC_HWIP][0][mmSCRA=
TCH_REG1_BASE_IDX] + mmSCRATCH_REG2)*4;
-       scratch_reg3 =3D adev->rmmio + (adev->reg_offset[GC_HWIP][0][mmSCRA=
TCH_REG1_BASE_IDX] + mmSCRATCH_REG3)*4;
+       scratch_reg2 =3D adev->rmmio + (adev->reg_offset[GC_HWIP][0][mmSCRA=
TCH_REG2_BASE_IDX] + mmSCRATCH_REG2)*4;
+       scratch_reg3 =3D adev->rmmio + (adev->reg_offset[GC_HWIP][0][mmSCRA=
TCH_REG3_BASE_IDX] + mmSCRATCH_REG3)*4;
         spare_int =3D adev->rmmio + (adev->reg_offset[GC_HWIP][0][mmRLC_SP=
ARE_INT_BASE_IDX] + mmRLC_SPARE_INT)*4;



the definition of scratch_reg2 and 3 has here.... will this be backwards co=
mpatible? Was it a bug in the definition?

________________________________

From: Skvortsov, Victor <Victor.Skvortsov@amd.com<mailto:Victor.Skvortsov@a=
md.com>>
Sent: Wednesday, December 15, 2021 10:55 AM
To: amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org> <am=
d-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>>; Deng, E=
mily <Emily.Deng@amd.com<mailto:Emily.Deng@amd.com>>; Liu, Monk <Monk.Liu@a=
md.com<mailto:Monk.Liu@amd.com>>; Ming, Davis <Davis.Ming@amd.com<mailto:Da=
vis.Ming@amd.com>>; Liu, Shaoyun <Shaoyun.Liu@amd.com<mailto:Shaoyun.Liu@am=
d.com>>; Zhou, Peng Ju <PengJu.Zhou@amd.com<mailto:PengJu.Zhou@amd.com>>; C=
hen, JingWen <JingWen.Chen2@amd.com<mailto:JingWen.Chen2@amd.com>>; Chen, H=
orace <Horace.Chen@amd.com<mailto:Horace.Chen@amd.com>>; Nieto, David M <Da=
vid.Nieto@amd.com<mailto:David.Nieto@amd.com>>
Cc: Skvortsov, Victor <Victor.Skvortsov@amd.com<mailto:Victor.Skvortsov@amd=
.com>>
Subject: [PATCH 5/5] drm/amdgpu: Modify indirect register access for gfx9 s=
riov



Expand RLCG interface for new GC read & write commands.
New interface will only be used if the PF enables the flag in pf2vf msg.

Signed-off-by: Victor Skvortsov <victor.skvortsov@amd.com<mailto:victor.skv=
ortsov@amd.com>>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c | 111 +++++++++++++++++++-------
 1 file changed, 83 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/am=
dgpu/gfx_v9_0.c
index d252b06efa43..bce6ab52cae0 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
@@ -63,6 +63,13 @@
 #define mmGCEA_PROBE_MAP                        0x070c
 #define mmGCEA_PROBE_MAP_BASE_IDX               0

+#define GFX9_RLCG_GC_WRITE_OLD                 (0x8 << 28)
+#define GFX9_RLCG_GC_WRITE                     (0x0 << 28)
+#define GFX9_RLCG_GC_READ                      (0x1 << 28)
+#define GFX9_RLCG_VFGATE_DISABLED              0x4000000
+#define GFX9_RLCG_WRONG_OPERATION_TYPE         0x2000000
+#define GFX9_RLCG_NOT_IN_RANGE                 0x1000000
+
 MODULE_FIRMWARE("amdgpu/vega10_ce.bin");
 MODULE_FIRMWARE("amdgpu/vega10_pfp.bin");
 MODULE_FIRMWARE("amdgpu/vega10_me.bin");
@@ -739,7 +746,7 @@ static const u32 GFX_RLC_SRM_INDEX_CNTL_DATA_OFFSETS[] =
=3D
         mmRLC_SRM_INDEX_CNTL_DATA_7 - mmRLC_SRM_INDEX_CNTL_DATA_0,
 };

-static void gfx_v9_0_rlcg_w(struct amdgpu_device *adev, u32 offset, u32 v,=
 u32 flag)
+static u32 gfx_v9_0_rlcg_rw(struct amdgpu_device *adev, u32 offset, u32 v,=
 uint32_t flag)
 {
         static void *scratch_reg0;
         static void *scratch_reg1;
@@ -748,21 +755,20 @@ static void gfx_v9_0_rlcg_w(struct amdgpu_device *ade=
v, u32 offset, u32 v, u32 f
         static void *spare_int;
         static uint32_t grbm_cntl;
         static uint32_t grbm_idx;
+       uint32_t i =3D 0;
+       uint32_t retries =3D 50000;
+       u32 ret =3D 0;
+       u32 tmp;

         scratch_reg0 =3D adev->rmmio + (adev->reg_offset[GC_HWIP][0][mmSCR=
ATCH_REG0_BASE_IDX] + mmSCRATCH_REG0)*4;
         scratch_reg1 =3D adev->rmmio + (adev->reg_offset[GC_HWIP][0][mmSCR=
ATCH_REG1_BASE_IDX] + mmSCRATCH_REG1)*4;
-       scratch_reg2 =3D adev->rmmio + (adev->reg_offset[GC_HWIP][0][mmSCRA=
TCH_REG1_BASE_IDX] + mmSCRATCH_REG2)*4;
-       scratch_reg3 =3D adev->rmmio + (adev->reg_offset[GC_HWIP][0][mmSCRA=
TCH_REG1_BASE_IDX] + mmSCRATCH_REG3)*4;
+       scratch_reg2 =3D adev->rmmio + (adev->reg_offset[GC_HWIP][0][mmSCRA=
TCH_REG2_BASE_IDX] + mmSCRATCH_REG2)*4;
+       scratch_reg3 =3D adev->rmmio + (adev->reg_offset[GC_HWIP][0][mmSCRA=
TCH_REG3_BASE_IDX] + mmSCRATCH_REG3)*4;
         spare_int =3D adev->rmmio + (adev->reg_offset[GC_HWIP][0][mmRLC_SP=
ARE_INT_BASE_IDX] + mmRLC_SPARE_INT)*4;

         grbm_cntl =3D adev->reg_offset[GC_HWIP][0][mmGRBM_GFX_CNTL_BASE_ID=
X] + mmGRBM_GFX_CNTL;
         grbm_idx =3D adev->reg_offset[GC_HWIP][0][mmGRBM_GFX_INDEX_BASE_ID=
X] + mmGRBM_GFX_INDEX;

-       if (amdgpu_sriov_runtime(adev)) {
-               pr_err("shouldn't call rlcg write register during runtime\n=
");
-               return;
-       }
-
         if (offset =3D=3D grbm_cntl || offset =3D=3D grbm_idx) {
                 if (offset  =3D=3D grbm_cntl)
                         writel(v, scratch_reg2);
@@ -771,41 +777,89 @@ static void gfx_v9_0_rlcg_w(struct amdgpu_device *ade=
v, u32 offset, u32 v, u32 f

                 writel(v, ((void __iomem *)adev->rmmio) + (offset * 4));
         } else {
-               uint32_t i =3D 0;
-               uint32_t retries =3D 50000;
-
                 writel(v, scratch_reg0);
-               writel(offset | 0x80000000, scratch_reg1);
+               writel(offset | flag, scratch_reg1);
                 writel(1, spare_int);
-               for (i =3D 0; i < retries; i++) {
-                       u32 tmp;

+               for (i =3D 0; i < retries; i++) {
                         tmp =3D readl(scratch_reg1);
-                       if (!(tmp & 0x80000000))
+                       if (!(tmp & flag))
                                 break;

                         udelay(10);
                 }
-               if (i >=3D retries)
-                       pr_err("timeout: rlcg program reg:0x%05x failed !\n=
", offset);
+
+               if (i >=3D retries) {
+                       if (amdgpu_sriov_reg_indirect_gc(adev)) {
+                               if (tmp & GFX9_RLCG_VFGATE_DISABLED)
+                                       pr_err("The vfgate is disabled, pro=
gram reg:0x%05x failed!\n", offset);
+                               else if (tmp & GFX9_RLCG_WRONG_OPERATION_TY=
PE)
+                                       pr_err("Wrong operation type, progr=
am reg:0x%05x failed!\n", offset);
+                               else if (tmp & GFX9_RLCG_NOT_IN_RANGE)
+                                       pr_err("The register is not in rang=
e, program reg:0x%05x failed!\n", offset);
+                               else
+                                       pr_err("Unknown error type, program=
 reg:0x%05x failed!\n", offset);
+                       } else
+                               pr_err("timeout: rlcg program reg:0x%05x fa=
iled!\n", offset);
+               }
+       }
+
+       ret =3D readl(scratch_reg0);
+
+       return ret;
+}
+
+static bool gfx_v9_0_get_rlcg_flag(struct amdgpu_device *adev, u32 acc_fla=
gs, u32 hwip,
+                               int write, u32 *rlcg_flag)
+{
+
+       switch (hwip) {
+       case GC_HWIP:
+               if (amdgpu_sriov_reg_indirect_gc(adev)) {
+                       *rlcg_flag =3D write ? GFX9_RLCG_GC_WRITE : GFX9_RL=
CG_GC_READ;
+
+                       return true;
+               /* only in new version, AMDGPU_REGS_NO_KIQ and AMDGPU_REGS_=
RLC enabled simultaneously */
+               } else if ((acc_flags & AMDGPU_REGS_RLC) && !(acc_flags & A=
MDGPU_REGS_NO_KIQ) && write) {
+                       *rlcg_flag =3D GFX9_RLCG_GC_WRITE_OLD;
+                       return true;
+               }
+
+               break;
+       default:
+               return false;
         }

+       return false;
+}
+
+static u32 gfx_v9_0_sriov_rreg(struct amdgpu_device *adev, u32 offset, u32=
 acc_flags, u32 hwip)
+{
+       u32 rlcg_flag;
+
+       if (!amdgpu_sriov_runtime(adev) && gfx_v9_0_get_rlcg_flag(adev, acc=
_flags, hwip, 0, &rlcg_flag))
+               return gfx_v9_0_rlcg_rw(adev, offset, 0, rlcg_flag);
+
+       if (acc_flags & AMDGPU_REGS_NO_KIQ)
+               return RREG32_NO_KIQ(offset);
+       else
+               return RREG32(offset);
 }

 static void gfx_v9_0_sriov_wreg(struct amdgpu_device *adev, u32 offset,
-                              u32 v, u32 acc_flags, u32 hwip)
+                              u32 value, u32 acc_flags, u32 hwip)
 {
-       if ((acc_flags & AMDGPU_REGS_RLC) &&
-           amdgpu_sriov_fullaccess(adev)) {
-               gfx_v9_0_rlcg_w(adev, offset, v, acc_flags);
+       u32 rlcg_flag;

+       if (!amdgpu_sriov_runtime(adev) && gfx_v9_0_get_rlcg_flag(adev, acc=
_flags, hwip, 1, &rlcg_flag)) {
+               gfx_v9_0_rlcg_rw(adev, offset, value, rlcg_flag);
                 return;
         }

         if (acc_flags & AMDGPU_REGS_NO_KIQ)
-               WREG32_NO_KIQ(offset, v);
+               WREG32_NO_KIQ(offset, value);
         else
-               WREG32(offset, v);
+               WREG32(offset, value);
 }

 #define VEGA10_GB_ADDR_CONFIG_GOLDEN 0x2a114042
@@ -5134,7 +5188,7 @@ static void gfx_v9_0_update_spm_vmid(struct amdgpu_de=
vice *adev, unsigned vmid)
         if (amdgpu_sriov_is_pp_one_vf(adev))
                 data =3D RREG32_NO_KIQ(reg);
         else
-               data =3D RREG32(reg);
+               data =3D RREG32_SOC15(GC, 0, mmRLC_SPM_MC_CNTL);

         data &=3D ~RLC_SPM_MC_CNTL__RLC_SPM_VMID_MASK;
         data |=3D (vmid & RLC_SPM_MC_CNTL__RLC_SPM_VMID_MASK) << RLC_SPM_M=
C_CNTL__RLC_SPM_VMID__SHIFT;
@@ -5190,6 +5244,7 @@ static const struct amdgpu_rlc_funcs gfx_v9_0_rlc_fun=
cs =3D {
         .start =3D gfx_v9_0_rlc_start,
         .update_spm_vmid =3D gfx_v9_0_update_spm_vmid,
         .sriov_wreg =3D gfx_v9_0_sriov_wreg,
+       .sriov_rreg =3D gfx_v9_0_sriov_rreg,
         .is_rlcg_access_range =3D gfx_v9_0_is_rlcg_access_range,
 };

@@ -5795,16 +5850,16 @@ static void gfx_v9_0_set_compute_eop_interrupt_stat=
e(struct amdgpu_device *adev,

         switch (state) {
         case AMDGPU_IRQ_STATE_DISABLE:
-               mec_int_cntl =3D RREG32(mec_int_cntl_reg);
+               mec_int_cntl =3D RREG32_SOC15_IP(GC,mec_int_cntl_reg);
                 mec_int_cntl =3D REG_SET_FIELD(mec_int_cntl, CP_ME1_PIPE0_=
INT_CNTL,
                                              TIME_STAMP_INT_ENABLE, 0);
-               WREG32(mec_int_cntl_reg, mec_int_cntl);
+               WREG32_SOC15_IP(GC, mec_int_cntl_reg, mec_int_cntl);
                 break;
         case AMDGPU_IRQ_STATE_ENABLE:
-               mec_int_cntl =3D RREG32(mec_int_cntl_reg);
+               mec_int_cntl =3D RREG32_SOC15_IP(GC, mec_int_cntl_reg);
                 mec_int_cntl =3D REG_SET_FIELD(mec_int_cntl, CP_ME1_PIPE0_=
INT_CNTL,
                                              TIME_STAMP_INT_ENABLE, 1);
-               WREG32(mec_int_cntl_reg, mec_int_cntl);
+               WREG32_SOC15_IP(GC, mec_int_cntl_reg, mec_int_cntl);
                 break;
         default:
                 break;
--
2.25.1

--_000_BYAPR12MB28406D8BFF2ED8B49D44AD51F4769BYAPR12MB2840namp_
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
<p style=3D"font-family:Arial;font-size:10pt;color:#008000;margin:15pt;" al=
ign=3D"Left">
[Public]<br>
</p>
<br>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
Gotcha,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
Can you add prior to the implementation a small description on how the inte=
rface and the different scratch registers work? It may be easier to review =
with a clear idea of the operation. I know the earlier implementation did n=
ot include it, but now that we are
 modifying it, it would be good to document it.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Skvortsov, Victor &lt=
;Victor.Skvortsov@amd.com&gt;<br>
<b>Sent:</b> Wednesday, December 15, 2021 11:18 AM<br>
<b>To:</b> Nieto, David M &lt;David.Nieto@amd.com&gt;; amd-gfx@lists.freede=
sktop.org &lt;amd-gfx@lists.freedesktop.org&gt;; Deng, Emily &lt;Emily.Deng=
@amd.com&gt;; Liu, Monk &lt;Monk.Liu@amd.com&gt;; Ming, Davis &lt;Davis.Min=
g@amd.com&gt;; Liu, Shaoyun &lt;Shaoyun.Liu@amd.com&gt;; Zhou, Peng
 Ju &lt;PengJu.Zhou@amd.com&gt;; Chen, JingWen &lt;JingWen.Chen2@amd.com&gt=
;; Chen, Horace &lt;Horace.Chen@amd.com&gt;<br>
<b>Subject:</b> RE: [PATCH 5/5] drm/amdgpu: Modify indirect register access=
 for gfx9 sriov</font>
<div>&nbsp;</div>
</div>
<style>
<!--
@font-face
	{font-family:"Cambria Math"}
@font-face
	{font-family:Calibri}
@font-face
	{font-family:"Segoe UI"}
p.x_MsoNormal, li.x_MsoNormal, div.x_MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif}
a:link, span.x_MsoHyperlink
	{color:#0563C1;
	text-decoration:underline}
span.x_EmailStyle18
	{font-family:"Calibri",sans-serif;
	color:windowtext}
p.x_msipheadera4477989, li.x_msipheadera4477989, div.x_msipheadera4477989
	{margin-right:0in;
	margin-left:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif}
.x_MsoChpDefault
	{font-size:10.0pt}
@page WordSection1
	{margin:1.0in 1.0in 1.0in 1.0in}
div.x_WordSection1
	{}
-->
</style>
<div lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:b=
reak-word">
<div class=3D"x_WordSection1">
<p class=3D"x_msipheadera4477989" style=3D"margin:0in"><span style=3D"font-=
size:10.0pt; font-family:&quot;Arial&quot;,sans-serif; color:blue">[AMD Off=
icial Use Only]</span></p>
<p class=3D"x_MsoNormal">&nbsp;</p>
<p class=3D"x_MsoNormal">This was a bug in the original definition, but it =
functionally it makes no difference (in both cases the macros resolve to th=
e same value).</p>
<p class=3D"x_MsoNormal">&nbsp;</p>
<div>
<div style=3D"border:none; border-top:solid #E1E1E1 1.0pt; padding:3.0pt 0i=
n 0in 0in">
<p class=3D"x_MsoNormal"><b>From:</b> Nieto, David M &lt;David.Nieto@amd.co=
m&gt; <br>
<b>Sent:</b> Wednesday, December 15, 2021 2:16 PM<br>
<b>To:</b> Skvortsov, Victor &lt;Victor.Skvortsov@amd.com&gt;; amd-gfx@list=
s.freedesktop.org; Deng, Emily &lt;Emily.Deng@amd.com&gt;; Liu, Monk &lt;Mo=
nk.Liu@amd.com&gt;; Ming, Davis &lt;Davis.Ming@amd.com&gt;; Liu, Shaoyun &l=
t;Shaoyun.Liu@amd.com&gt;; Zhou, Peng Ju &lt;PengJu.Zhou@amd.com&gt;;
 Chen, JingWen &lt;JingWen.Chen2@amd.com&gt;; Chen, Horace &lt;Horace.Chen@=
amd.com&gt;<br>
<b>Subject:</b> Re: [PATCH 5/5] drm/amdgpu: Modify indirect register access=
 for gfx9 sriov</p>
</div>
</div>
<p class=3D"x_MsoNormal">&nbsp;</p>
<p style=3D"margin:5.0pt"><span style=3D"font-size:10.0pt; font-family:&quo=
t;Arial&quot;,sans-serif; color:blue">[AMD Official Use Only]</span></p>
<p class=3D"x_MsoNormal">&nbsp;</p>
<div>
<div>
<p class=3D"x_MsoNormal" style=3D"background:white"><span style=3D"font-fam=
ily:&quot;Segoe UI&quot;,sans-serif; color:black; background:white">&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; scratch_reg0 =3D adev-&gt;rmmio +=
 (adev-&gt;reg_offset[GC_HWIP][0][mmSCRATCH_REG0_BASE_IDX] + mmSCRATCH_REG0=
)*4;</span><span style=3D"font-size:12.0pt; color:black"><br>
</span><span style=3D"font-family:&quot;Segoe UI&quot;,sans-serif; color:bl=
ack; background:white">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; scr=
atch_reg1 =3D adev-&gt;rmmio + (adev-&gt;reg_offset[GC_HWIP][0][mmSCRATCH_R=
EG1_BASE_IDX] + mmSCRATCH_REG1)*4;</span><span style=3D"font-family:&quot;S=
egoe UI&quot;,sans-serif; color:black"><br>
<span style=3D"background:white">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; scra=
tch_reg2 =3D adev-&gt;rmmio + (adev-&gt;reg_offset[GC_HWIP][0][mmSCRATCH_RE=
G1_BASE_IDX] + mmSCRATCH_REG2)*4;</span><br>
<span style=3D"background:white">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; scra=
tch_reg3 =3D adev-&gt;rmmio + (adev-&gt;reg_offset[GC_HWIP][0][mmSCRATCH_RE=
G1_BASE_IDX] + mmSCRATCH_REG3)*4;</span><br>
<span style=3D"background:white">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; scra=
tch_reg2 =3D adev-&gt;rmmio + (adev-&gt;reg_offset[GC_HWIP][0][mmSCRATCH_RE=
G2_BASE_IDX] + mmSCRATCH_REG2)*4;</span><br>
<span style=3D"background:white">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; scra=
tch_reg3 =3D adev-&gt;rmmio + (adev-&gt;reg_offset[GC_HWIP][0][mmSCRATCH_RE=
G3_BASE_IDX] + mmSCRATCH_REG3)*4;</span><br>
<span style=3D"background:white">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; spare_int =3D adev-&gt;rmmio + (adev-&gt;reg_offset[GC_HWIP][0][mmRL=
C_SPARE_INT_BASE_IDX] + mmRLC_SPARE_INT)*4;</span></span><span style=3D"fon=
t-size:12.0pt; color:black"></span></p>
</div>
<div>
<p class=3D"x_MsoNormal" style=3D"background:white"><span style=3D"font-siz=
e:12.0pt; color:black">&nbsp;</span></p>
</div>
<div>
<p class=3D"x_MsoNormal" style=3D"background:white"><span style=3D"font-fam=
ily:&quot;Segoe UI&quot;,sans-serif; color:black; background:white">the def=
inition of scratch_reg2 and 3 has here.... will this be backwards compatibl=
e? Was it a bug in the definition?</span><span style=3D"font-size:12.0pt; c=
olor:black"></span></p>
</div>
<div class=3D"x_MsoNormal" align=3D"center" style=3D"text-align:center">
<hr size=3D"1" width=3D"98%" align=3D"center">
</div>
<div id=3D"x_divRplyFwdMsg">
<p class=3D"x_MsoNormal"><b><span style=3D"color:black">From:</span></b><sp=
an style=3D"color:black"> Skvortsov, Victor &lt;<a href=3D"mailto:Victor.Sk=
vortsov@amd.com">Victor.Skvortsov@amd.com</a>&gt;<br>
<b>Sent:</b> Wednesday, December 15, 2021 10:55 AM<br>
<b>To:</b> <a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.f=
reedesktop.org</a> &lt;<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd=
-gfx@lists.freedesktop.org</a>&gt;; Deng, Emily &lt;<a href=3D"mailto:Emily=
.Deng@amd.com">Emily.Deng@amd.com</a>&gt;; Liu, Monk
 &lt;<a href=3D"mailto:Monk.Liu@amd.com">Monk.Liu@amd.com</a>&gt;; Ming, Da=
vis &lt;<a href=3D"mailto:Davis.Ming@amd.com">Davis.Ming@amd.com</a>&gt;; L=
iu, Shaoyun &lt;<a href=3D"mailto:Shaoyun.Liu@amd.com">Shaoyun.Liu@amd.com<=
/a>&gt;; Zhou, Peng Ju &lt;<a href=3D"mailto:PengJu.Zhou@amd.com">PengJu.Zh=
ou@amd.com</a>&gt;;
 Chen, JingWen &lt;<a href=3D"mailto:JingWen.Chen2@amd.com">JingWen.Chen2@a=
md.com</a>&gt;; Chen, Horace &lt;<a href=3D"mailto:Horace.Chen@amd.com">Hor=
ace.Chen@amd.com</a>&gt;; Nieto, David M &lt;<a href=3D"mailto:David.Nieto@=
amd.com">David.Nieto@amd.com</a>&gt;<br>
<b>Cc:</b> Skvortsov, Victor &lt;<a href=3D"mailto:Victor.Skvortsov@amd.com=
">Victor.Skvortsov@amd.com</a>&gt;<br>
<b>Subject:</b> [PATCH 5/5] drm/amdgpu: Modify indirect register access for=
 gfx9 sriov</span>
</p>
<div>
<p class=3D"x_MsoNormal">&nbsp;</p>
</div>
</div>
<div>
<div>
<p class=3D"x_MsoNormal" style=3D"margin-bottom:12.0pt">Expand RLCG interfa=
ce for new GC read &amp; write commands.<br>
New interface will only be used if the PF enables the flag in pf2vf msg.<br=
>
<br>
Signed-off-by: Victor Skvortsov &lt;<a href=3D"mailto:victor.skvortsov@amd.=
com">victor.skvortsov@amd.com</a>&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c | 111 +++++++++++++++++++------=
-<br>
&nbsp;1 file changed, 83 insertions(+), 28 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/am=
dgpu/gfx_v9_0.c<br>
index d252b06efa43..bce6ab52cae0 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c<br>
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c<br>
@@ -63,6 +63,13 @@<br>
&nbsp;#define mmGCEA_PROBE_MAP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; 0x070c<br>
&nbsp;#define mmGCEA_PROBE_MAP_BASE_IDX&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<br>
&nbsp;<br>
+#define GFX9_RLCG_GC_WRITE_OLD&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (0x8 &lt;&lt; 28)<br>
+#define GFX9_RLCG_GC_WRITE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (0=
x0 &lt;&lt; 28)<br>
+#define GFX9_RLCG_GC_READ&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; (0x1 &lt;&lt; 28)<br>
+#define GFX9_RLCG_VFGATE_DISABLED&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x4000000<br>
+#define GFX9_RLCG_WRONG_OPERATION_TYPE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; 0x2000000<br>
+#define GFX9_RLCG_NOT_IN_RANGE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x1000000<br>
+<br>
&nbsp;MODULE_FIRMWARE(&quot;amdgpu/vega10_ce.bin&quot;);<br>
&nbsp;MODULE_FIRMWARE(&quot;amdgpu/vega10_pfp.bin&quot;);<br>
&nbsp;MODULE_FIRMWARE(&quot;amdgpu/vega10_me.bin&quot;);<br>
@@ -739,7 +746,7 @@ static const u32 GFX_RLC_SRM_INDEX_CNTL_DATA_OFFSETS[] =
=3D<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mmRLC_SRM_INDEX_CNTL_DATA_=
7 - mmRLC_SRM_INDEX_CNTL_DATA_0,<br>
&nbsp;};<br>
&nbsp;<br>
-static void gfx_v9_0_rlcg_w(struct amdgpu_device *adev, u32 offset, u32 v,=
 u32 flag)<br>
+static u32 gfx_v9_0_rlcg_rw(struct amdgpu_device *adev, u32 offset, u32 v,=
 uint32_t flag)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; static void *scratch_reg0;=
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; static void *scratch_reg1;=
<br>
@@ -748,21 +755,20 @@ static void gfx_v9_0_rlcg_w(struct amdgpu_device *ade=
v, u32 offset, u32 v, u32 f<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; static void *spare_int;<br=
>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; static uint32_t grbm_cntl;=
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; static uint32_t grbm_idx;<=
br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t i =3D 0;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t retries =3D 50000;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u32 ret =3D 0;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u32 tmp;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; scratch_reg0 =3D adev-&gt;=
rmmio + (adev-&gt;reg_offset[GC_HWIP][0][mmSCRATCH_REG0_BASE_IDX] + mmSCRAT=
CH_REG0)*4;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; scratch_reg1 =3D adev-&gt;=
rmmio + (adev-&gt;reg_offset[GC_HWIP][0][mmSCRATCH_REG1_BASE_IDX] + mmSCRAT=
CH_REG1)*4;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; scratch_reg2 =3D adev-&gt;rmmio + (ad=
ev-&gt;reg_offset[GC_HWIP][0][mmSCRATCH_REG1_BASE_IDX] + mmSCRATCH_REG2)*4;=
<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; scratch_reg3 =3D adev-&gt;rmmio + (ad=
ev-&gt;reg_offset[GC_HWIP][0][mmSCRATCH_REG1_BASE_IDX] + mmSCRATCH_REG3)*4;=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; scratch_reg2 =3D adev-&gt;rmmio + (ad=
ev-&gt;reg_offset[GC_HWIP][0][mmSCRATCH_REG2_BASE_IDX] + mmSCRATCH_REG2)*4;=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; scratch_reg3 =3D adev-&gt;rmmio + (ad=
ev-&gt;reg_offset[GC_HWIP][0][mmSCRATCH_REG3_BASE_IDX] + mmSCRATCH_REG3)*4;=
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spare_int =3D adev-&gt;rmm=
io + (adev-&gt;reg_offset[GC_HWIP][0][mmRLC_SPARE_INT_BASE_IDX] + mmRLC_SPA=
RE_INT)*4;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; grbm_cntl =3D adev-&gt;reg=
_offset[GC_HWIP][0][mmGRBM_GFX_CNTL_BASE_IDX] + mmGRBM_GFX_CNTL;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; grbm_idx =3D adev-&gt;reg_=
offset[GC_HWIP][0][mmGRBM_GFX_INDEX_BASE_IDX] + mmGRBM_GFX_INDEX;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (amdgpu_sriov_runtime(adev)) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pr_err(&quot;shouldn't call rlcg write register during runtime\n=
&quot;);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
-<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (offset =3D=3D grbm_cnt=
l || offset =3D=3D grbm_idx) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; if (offset&nbsp; =3D=3D grbm_cntl)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; write=
l(v, scratch_reg2);<br>
@@ -771,41 +777,89 @@ static void gfx_v9_0_rlcg_w(struct amdgpu_device *ade=
v, u32 offset, u32 v, u32 f<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; writel(v, ((void __iomem *)adev-&gt;rmmio) + (offset =
* 4));<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; uint32_t i =3D 0;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; uint32_t retries =3D 50000;<br>
-<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; writel(v, scratch_reg0);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; writel(offset | 0x80000000, scratch_reg1);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; writel(offset | flag, scratch_reg1);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; writel(1, spare_int);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; for (i =3D 0; i &lt; retries; i++) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u32 tmp;<br>
&nbsp;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; for (i =3D 0; i &lt; retries; i++) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tmp =
=3D readl(scratch_reg1);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!(tmp &amp; =
0x80000000))<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!(tmp &amp; =
flag))<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; udela=
y(10);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; }<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (i &gt;=3D retries)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pr_err(&quot;tim=
eout: rlcg program reg:0x%05x failed !\n&quot;, offset);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (i &gt;=3D retries) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (amdgpu_sriov=
_reg_indirect_gc(adev)) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (tmp &amp; GFX9_RLCG_VFGATE_DISABLED)<br=
>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; pr_err(&quot;The vfgate is disabled, program reg:0x%05x failed!\n&quot=
;, offset);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (tmp &amp; GFX9_RLCG_WRONG_OPERATIO=
N_TYPE)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; pr_err(&quot;Wrong operation type, program reg:0x%05x failed!\n&quot;,=
 offset);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (tmp &amp; GFX9_RLCG_NOT_IN_RANGE)<=
br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; pr_err(&quot;The register is not in range, program reg:0x%05x failed!\=
n&quot;, offset);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; pr_err(&quot;Unknown error type, program reg:0x%05x failed!\n&quot;, o=
ffset);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pr_err(&quot;timeout: rlcg program reg:0x%0=
5x failed!\n&quot;, offset);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D readl(scratch_reg0);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
+}<br>
+<br>
+static bool gfx_v9_0_get_rlcg_flag(struct amdgpu_device *adev, u32 acc_fla=
gs, u32 hwip,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int write, u32 *rlcg_flag)<br>
+{<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switch (hwip) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case GC_HWIP:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (amdgpu_sriov_reg_indirect_gc(adev)) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *rlcg_flag =3D w=
rite ? GFX9_RLCG_GC_WRITE : GFX9_RLCG_GC_READ;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return true;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; /* only in new version, AMDGPU_REGS_NO_KIQ and AMDGPU_REGS_RLC e=
nabled simultaneously */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; } else if ((acc_flags &amp; AMDGPU_REGS_RLC) &amp;&amp; !(acc_fl=
ags &amp; AMDGPU_REGS_NO_KIQ) &amp;&amp; write) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *rlcg_flag =3D G=
FX9_RLCG_GC_WRITE_OLD;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return true;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return false;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return false;<br>
+}<br>
+<br>
+static u32 gfx_v9_0_sriov_rreg(struct amdgpu_device *adev, u32 offset, u32=
 acc_flags, u32 hwip)<br>
+{<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u32 rlcg_flag;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!amdgpu_sriov_runtime(adev) &amp;=
&amp; gfx_v9_0_get_rlcg_flag(adev, acc_flags, hwip, 0, &amp;rlcg_flag))<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return gfx_v9_0_rlcg_rw(adev, offset, 0, rlcg_flag);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (acc_flags &amp; AMDGPU_REGS_NO_KI=
Q)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return RREG32_NO_KIQ(offset);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return RREG32(offset);<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;static void gfx_v9_0_sriov_wreg(struct amdgpu_device *adev, u32 offse=
t,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; u32 v, u32 acc_flags, u32 hwip)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; u32 value, u32 acc_flags, u32 hwip)<br>
&nbsp;{<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((acc_flags &amp; AMDGPU_REGS_RLC)=
 &amp;&amp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_sriov_=
fullaccess(adev)) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; gfx_v9_0_rlcg_w(adev, offset, v, acc_flags);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u32 rlcg_flag;<br>
&nbsp;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!amdgpu_sriov_runtime(adev) &amp;=
&amp; gfx_v9_0_get_rlcg_flag(adev, acc_flags, hwip, 1, &amp;rlcg_flag)) {<b=
r>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; gfx_v9_0_rlcg_rw(adev, offset, value, rlcg_flag);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (acc_flags &amp; AMDGPU=
_REGS_NO_KIQ)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; WREG32_NO_KIQ(offset, v);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; WREG32_NO_KIQ(offset, value);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; WREG32(offset, v);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; WREG32(offset, value);<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;#define VEGA10_GB_ADDR_CONFIG_GOLDEN 0x2a114042<br>
@@ -5134,7 +5188,7 @@ static void gfx_v9_0_update_spm_vmid(struct amdgpu_de=
vice *adev, unsigned vmid)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (amdgpu_sriov_is_pp_one=
_vf(adev))<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; data =3D RREG32_NO_KIQ(reg);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; data =3D RREG32(reg);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; data =3D RREG32_SOC15(GC, 0, mmRLC_SPM_MC_CNTL);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data &amp;=3D ~RLC_SPM_MC_=
CNTL__RLC_SPM_VMID_MASK;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data |=3D (vmid &amp; RLC_=
SPM_MC_CNTL__RLC_SPM_VMID_MASK) &lt;&lt; RLC_SPM_MC_CNTL__RLC_SPM_VMID__SHI=
FT;<br>
@@ -5190,6 +5244,7 @@ static const struct amdgpu_rlc_funcs gfx_v9_0_rlc_fun=
cs =3D {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .start =3D gfx_v9_0_rlc_st=
art,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .update_spm_vmid =3D gfx_v=
9_0_update_spm_vmid,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .sriov_wreg =3D gfx_v9_0_s=
riov_wreg,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .sriov_rreg =3D gfx_v9_0_sriov_rreg,<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .is_rlcg_access_range =3D =
gfx_v9_0_is_rlcg_access_range,<br>
&nbsp;};<br>
&nbsp;<br>
@@ -5795,16 +5850,16 @@ static void gfx_v9_0_set_compute_eop_interrupt_stat=
e(struct amdgpu_device *adev,<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switch (state) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_IRQ_STATE_DISA=
BLE:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; mec_int_cntl =3D RREG32(mec_int_cntl_reg);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; mec_int_cntl =3D RREG32_SOC15_IP(GC,mec_int_cntl_reg);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; mec_int_cntl =3D REG_SET_FIELD(mec_int_cntl, CP_ME1_P=
IPE0_INT_CNTL,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TIME_STAMP_INT_ENABLE, 0);<br=
>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; WREG32(mec_int_cntl_reg, mec_int_cntl);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; WREG32_SOC15_IP(GC, mec_int_cntl_reg, mec_int_cntl);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; break;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_IRQ_STATE_ENAB=
LE:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; mec_int_cntl =3D RREG32(mec_int_cntl_reg);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; mec_int_cntl =3D RREG32_SOC15_IP(GC, mec_int_cntl_reg);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; mec_int_cntl =3D REG_SET_FIELD(mec_int_cntl, CP_ME1_P=
IPE0_INT_CNTL,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TIME_STAMP_INT_ENABLE, 1);<br=
>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; WREG32(mec_int_cntl_reg, mec_int_cntl);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; WREG32_SOC15_IP(GC, mec_int_cntl_reg, mec_int_cntl);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; break;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; break;<br>
-- <br>
2.25.1</p>
</div>
</div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_BYAPR12MB28406D8BFF2ED8B49D44AD51F4769BYAPR12MB2840namp_--
