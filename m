Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 194458B776B
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Apr 2024 15:44:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 892E110FB7D;
	Tue, 30 Apr 2024 13:44:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="DbmecD2x";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2086.outbound.protection.outlook.com [40.107.94.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F13A810F3F9
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Apr 2024 13:43:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dtazP5pZMJ6ZN4JcZW5vipu4uWu55rjI3zcLt1fHoB7H0sczh/1KnlGFSoUW3qv3UtL0ZNrRYedhVPyw/QNeUXHq67DjC7aQsyeKK5FZtWILCjiFnee8P4g/r2oAGA5spCrnnsCgZqLn0HJyuOiYn+KxBmNQNRrq8iabHOczH0nlAUCieLUxlJiuRvvI/1VlLWHfLyijdr/CNNcGrCUhudOh2s79ZpF9jNp9W5Cl3dqVjKRcRrgwwR+f/Ml7XXq5IlESUz3NEGtEI/cmVefw3R+XzyLBGNxlAspFiY50NPwGDeIlagtvb0oW7fQgkK/LdcJBAyNyBI1VyiNsIg7b5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bbhYnh27b7aW3hRkFyQr8oOMMmIUFpX+diuchH3XWzQ=;
 b=FX4+ZEhyCepcIDl7MduDqiJZsGZPJwWETm72WqlQY6TrucICYrvzq+rvnUzLhih8PD+JEYMnWwXbywKLQx7eSgk9L4iUwVOKzLEEjBN81+ei2iRrSToL5/SPSIdfDRaySM+9X9/zB8TUiy6WwugRNaXOk8cxru7CAP0t+K3i2ShfecF3KP/5FowkDSGdXucITxf2ZR62eS38PPHXv1KBEMlqx+6E7u7yKtibkHNADZZ6qmVhu757gHjrXELmxWep509YmVaGhrAEzHs9RQLPfsHn9QYRDo/P1XqsuVmqitpVrFppoWQTYO19crfU2+C77f0ixGoryWruzdZsHaIhHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bbhYnh27b7aW3hRkFyQr8oOMMmIUFpX+diuchH3XWzQ=;
 b=DbmecD2xmX4BWBjAbK1DD6Nd4ZlniimNi4r1AmXRd8byc5UD8Joy/qLkAY5WhBGp5SLhUe+ahAfWUySB+g7P9CMEGCY505gzEiy+vW1aD1kBrmkoYgsTqpMlLlnDM9X3yFSNwRhbFWJqi4CjEVH95/h8my439xx0cM1tM9NHaio=
Received: from CH0PR12MB5284.namprd12.prod.outlook.com (2603:10b6:610:d7::13)
 by DS7PR12MB6286.namprd12.prod.outlook.com (2603:10b6:8:95::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.35; Tue, 30 Apr
 2024 13:43:56 +0000
Received: from CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::8060:1b11:e9f3:3a51]) by CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::8060:1b11:e9f3:3a51%4]) with mapi id 15.20.7519.031; Tue, 30 Apr 2024
 13:43:56 +0000
From: "Pillai, Aurabindo" <Aurabindo.Pillai@amd.com>
To: "Wentland, Harry" <Harry.Wentland@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
CC: "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>
Subject: Re: [PATCH] drm/amd/display: Override DCN410 IP version
Thread-Topic: [PATCH] drm/amd/display: Override DCN410 IP version
Thread-Index: AQHamwGhqcRWyInwd0uKZHqMD/CiwLGA0M8AgAAB9Ss=
Date: Tue, 30 Apr 2024 13:43:56 +0000
Message-ID: <CH0PR12MB52842FC9E8BADBCCFBE947A88B1A2@CH0PR12MB5284.namprd12.prod.outlook.com>
References: <20240430132340.16902-1-aurabindo.pillai@amd.com>
 <1802b351-261d-4b85-bd19-cf5cb81ca8bc@amd.com>
In-Reply-To: <1802b351-261d-4b85-bd19-cf5cb81ca8bc@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=True;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2024-04-30T13:43:55.782Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard; 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR12MB5284:EE_|DS7PR12MB6286:EE_
x-ms-office365-filtering-correlation-id: 2f7b03ae-0210-45c3-a5d8-08dc691b94db
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?nVli8qCFttj1cvTJUpJkkwdglpgQXPXoLmWPYf+v9cuoal6BXa7QlOYEMN9n?=
 =?us-ascii?Q?v1452u1kentlMO87VTUCczxz4IVmllvNDWK77HUx/v1fte7SnO/dG+iXS0TL?=
 =?us-ascii?Q?MRVWwG6mYrDOgPxzL4uDEitopeJJ2OdDnSO+vIUsqWzcFYgyCr7haaT4gmx/?=
 =?us-ascii?Q?/kDK0T5Ht33E1UZXViqw30hEBpROdICKYV7qCQS8+aXHcRVct/BRqAvv3ERZ?=
 =?us-ascii?Q?S21LZ+t4YGnKZzamsCNbqLyZWUzE0MQWMhpLHCR+OJpzx6hzmylHo98J6pvq?=
 =?us-ascii?Q?l5zK+1SgrxOY/wI7aN6J2yUPXD+URQvQt2q3EVs3lDm5rDoFLKcdeXtLlkvI?=
 =?us-ascii?Q?XKJLNmY/VO94SnrReTz0Ob68UZPw2xiRZvAf1jDRD+OJTadKfhaPywHSeTYT?=
 =?us-ascii?Q?2V5iJjHUv5HQiPJ/MiHOoAs86T4UeKhTGVMPoa6uUeYZvEYYM/WKdbcS6BSV?=
 =?us-ascii?Q?9nQeOZBindrwCLVmfl8pe2fBLK90lJmGMzlUVhhfYrO2cHMs71Ul6SNspSJl?=
 =?us-ascii?Q?dLABrMCVoHNACBIQx6xNcZEBmKBRJkq4riWj0oR7kvjfLJkez2R0UCfZ2VxV?=
 =?us-ascii?Q?i1qSKVXziSQ/d4nmeiMK11ZQ+Jg0UPOF3NRzOwAoFhEjtMJL0XSTAo4owaxY?=
 =?us-ascii?Q?V525o1s9DbMkPwcf+kEP5XNWMQkUL91ta3lJgu2Qgn1AR3iqV3bn2KqFPVU1?=
 =?us-ascii?Q?2xU25Qgar1mfQ+e2nbcuGK8dTLHxMxWWSDByVc6tK8OG3sKJzYCcyOZAmKmF?=
 =?us-ascii?Q?ZbxnFKFg50jZoonvDwXE4vAqrmGXoPwv2kdtvWqzacZky+qv+ngdAu5wnNkb?=
 =?us-ascii?Q?cmAe9avostYAlkFNQbZmZUg27mQUmiKoMOqUUfwTz2RnXbe/Vw/DmPvXvV/I?=
 =?us-ascii?Q?9H1vznCh+QQn/aGOLErr6NiuW9AmeDl3/loNWQRnC/mVxcw3Tm/i0dAEfKUP?=
 =?us-ascii?Q?by2QyXzKRn82hy3tvV92OHCbdULShvBKeSx+p+jSbBe7/JCe7q/i8VrRuIzS?=
 =?us-ascii?Q?SdpkPDYgoQIU2ktmGLBWOUKpHAZw2rbf5IjYXcqK/IvlaOdlt+gVaEuj1IfW?=
 =?us-ascii?Q?4e+01yskWdlHep79B/zmF0PEr4OuTI7thVg9c2ZxAjQkqeFYqlq6Q96tcdHl?=
 =?us-ascii?Q?Zf8b3IEYySz8+D7alnvJuQNclPUCCoIGDpamn/A14MlHI5N5z+MeQ2VULxBY?=
 =?us-ascii?Q?QqXCDsjnEIDtLFAVgRSfz9mNIlyky2pvoeesoiGdfcWvu/WET1ll3iF18kUm?=
 =?us-ascii?Q?kYkj8qbArAlBHfucmM93KrBQWfTySVKWqkAn6WYs6IUrZ/ekCeNTf3E9esup?=
 =?us-ascii?Q?fRDyeXTS4lR1UbRQzPDFfAjI+F/ty4ZHE8aKmC/nX3rBqw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB5284.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?yosn+CCIi7AsvNOSJn2KbvE9G6a88PrVW3KYVTvqoj+QABwSMbEO71fEA4oD?=
 =?us-ascii?Q?Uiq+tHsmAlmuxirBZ4rK8Tk8D1wqG7jX/rVOzVUp1E16M/sxA6LDE7LbVJOc?=
 =?us-ascii?Q?ZNvyCA3UijA0NjLja01o0lov2miE5ZmxC0HM454dL409XQykl+W4+vT6m6C/?=
 =?us-ascii?Q?Reu5gd9EP/PRkqi6rK5DqG6E83AiRc46QurTOUQcFldbr0G8mIvSyJp0VyHe?=
 =?us-ascii?Q?phWS4Wc7gFPgUX94jrPufAZ+2MAbkKeqltHkZ3tBJL88KejqgNamPWx/eKHx?=
 =?us-ascii?Q?2Z9S0o0Evr4hUubQxUtfeSY/djj1M9IKHeatZPL89CW4hp5cwvfHwFsFdmO1?=
 =?us-ascii?Q?FXkZT4RtZYiBnThxIILpZzzkAmtty0x55jc/CwGkKMllQ+IY7c19SuTjg2bd?=
 =?us-ascii?Q?mIYdkEqioAR20yw5uuR3dKV++As8YZp3fwM+A13S2KJoJCL1/7C4JCYMjx+3?=
 =?us-ascii?Q?q74rInObKS39WQzILelk5UXsStkiBQ+QE5lTO22K2Yv0c6Id/+AsaHLLZHaF?=
 =?us-ascii?Q?pOd7b97wdwBgmUQ5MfieqbpfcA9FVgiyCRQoste91pYI8X2OaB3Plhz0zH+a?=
 =?us-ascii?Q?QpiXLWvzHdypREPXLlzdROHNAC3zQwAtBP75Nbdbe5Cd1oYyKzpoj0AcEIpF?=
 =?us-ascii?Q?60UhiRMPFEenOuUZ3CXyhZbkCJ/9yfni8j3r9UnDqXbcQNnZsBl4n+YPRDdj?=
 =?us-ascii?Q?a3Ch+jhm6ooryoVTAiag+TKb20+xJgiho//nbZ/ElBpaNZduc1OKxmNHIZQP?=
 =?us-ascii?Q?iFQXVJ5zH62sJpzMVtMfrOjo0G3iD9U856dCmz/O49DvUjUh77xNTBI85jiU?=
 =?us-ascii?Q?kiOPthEe79kihG9perCuy036j6ev/oRKgiWU4sfgxorX8osoEaVdZlMrhBzy?=
 =?us-ascii?Q?rsBm2Agh4EJCAntPE+Z8eplb/GQpW+v9UYv/Is/Mbsul+ehwrYBRrYGhGWQy?=
 =?us-ascii?Q?uwXAHCKTiQvfcrw/yfc0zSHlWlItI/JMuprlm7mHU5BbtqnaxX7+a9LB5mQf?=
 =?us-ascii?Q?1zrvSAePojdpW4KjahPBujvqpg9hTUBnAKaHz5zPgMzIG054Nvrnz78sZfNh?=
 =?us-ascii?Q?UZge8SW4r8/75yeqmH7JvgLs35DNCuJv10W/MlL2SDNOMoD5QcZG4XvXjgzm?=
 =?us-ascii?Q?dUUH/1iSfTRNW2PPncaesTS+xazNpn7/6LVfFsbw6vvBdkK+Ls7HsxNL5mu8?=
 =?us-ascii?Q?RAiWH+OEe91BGFGktl2rXexfmjb+nC+8n1A3LoDMAV0BtMySemRu4n/hm6uk?=
 =?us-ascii?Q?8oc5VvwuiaN29woCzhVxbIIKzYiMjd+SWLfmdOFSxvtJRjH3NMLcqaurE9O+?=
 =?us-ascii?Q?1Hx2EitL95NZlEpU04vVS0ktBAwm8Uq5AK3hgo85X0qu5uuuO4UPJay7K0FV?=
 =?us-ascii?Q?u7B93ejjK9HNjUvfk+nCzqnjOQoMNYk4QpfxXuOMcTPcp9CL5sTvCWela/M9?=
 =?us-ascii?Q?J6Hy4gv68amra74hEJWsjQcsbS+VuyFT0SF51XkbnMMgJ8rPql81YUYcE5Sf?=
 =?us-ascii?Q?Hg8GIpM0HGmRYMKVimef3vnnt2wDCbo/rMn5mJPGyrZJvY3/D33rAxLd9h4r?=
 =?us-ascii?Q?DtriMqHydPQP7BnuNoE=3D?=
Content-Type: multipart/alternative;
 boundary="_000_CH0PR12MB52842FC9E8BADBCCFBE947A88B1A2CH0PR12MB5284namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5284.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f7b03ae-0210-45c3-a5d8-08dc691b94db
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2024 13:43:56.1757 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qEQlThty3/XStvdLUwoJWgKx7g376my1b7pVgLo59MVNA39v7/u699VDknmuLcrt3ME8TBu43bVCPTkd0d4n/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6286
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

--_000_CH0PR12MB52842FC9E8BADBCCFBE947A88B1A2CH0PR12MB5284namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - General]

Thanks for the review!

Just sent a v2
________________________________
From: Wentland, Harry <Harry.Wentland@amd.com>
Sent: Tuesday, April 30, 2024 9:36 AM
To: Pillai, Aurabindo <Aurabindo.Pillai@amd.com>; amd-gfx@lists.freedesktop=
.org <amd-gfx@lists.freedesktop.org>
Cc: Siqueira, Rodrigo <Rodrigo.Siqueira@amd.com>; Deucher, Alexander <Alexa=
nder.Deucher@amd.com>
Subject: Re: [PATCH] drm/amd/display: Override DCN410 IP version



On 2024-04-30 09:23, Aurabindo Pillai wrote:
> Override DCN IP version to 4.0.1 from 4.1.0 temporarily until change is
> made in DC codebase to use 4.1.0
>
> Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/=
drm/amd/amdgpu/amdgpu_discovery.c
> index 2aad1ba0ab9d..87a2f15c8a64 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
> @@ -1965,6 +1965,11 @@ static int amdgpu_discovery_set_display_ip_blocks(=
struct amdgpu_device *adev)
>                case IP_VERSION(3, 2, 1):
>                case IP_VERSION(3, 5, 0):
>                case IP_VERSION(3, 5, 1):
> +             case IP_VERSION(4, 1, 0):

Doesn't this do more than override? Doesn't this enable IP
creation for DCN 4.1.0 in the first place?

It might make sense to split this into a separate patch
as it sounds like we'll want to revert the override at
some point in the future but not the IP creation.

Harry

> +                     /* TODO: Fix IP version. DC code expects version 4.=
0.1 */
> +                     if (adev->ip_versions[DCE_HWIP][0] =3D=3D IP_VERSIO=
N(4, 1, 0))
> +                               adev->ip_versions[DCE_HWIP][0] =3D IP_VER=
SION(4, 0, 1);
> +
>                        if (amdgpu_sriov_vf(adev))
>                                amdgpu_discovery_set_sriov_display(adev);
>                        else


--_000_CH0PR12MB52842FC9E8BADBCCFBE947A88B1A2CH0PR12MB5284namp_
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
<p style=3D"font-family:Arial;font-size:10pt;color:#0000FF;margin:5pt;font-=
style:normal;font-weight:normal;text-decoration:none;" align=3D"Left">
[AMD Official Use Only - General]<br>
</p>
<br>
<div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Thanks for the review!</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
Just sent a v2</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Wentland, Harry &lt;H=
arry.Wentland@amd.com&gt;<br>
<b>Sent:</b> Tuesday, April 30, 2024 9:36 AM<br>
<b>To:</b> Pillai, Aurabindo &lt;Aurabindo.Pillai@amd.com&gt;; amd-gfx@list=
s.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&gt;<br>
<b>Cc:</b> Siqueira, Rodrigo &lt;Rodrigo.Siqueira@amd.com&gt;; Deucher, Ale=
xander &lt;Alexander.Deucher@amd.com&gt;<br>
<b>Subject:</b> Re: [PATCH] drm/amd/display: Override DCN410 IP version</fo=
nt>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText"><br>
<br>
On 2024-04-30 09:23, Aurabindo Pillai wrote:<br>
&gt; Override DCN IP version to 4.0.1 from 4.1.0 temporarily until change i=
s<br>
&gt; made in DC codebase to use 4.1.0<br>
&gt; <br>
&gt; Signed-off-by: Aurabindo Pillai &lt;aurabindo.pillai@amd.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 5 +++++<br>
&gt;&nbsp; 1 file changed, 5 insertions(+)<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/g=
pu/drm/amd/amdgpu/amdgpu_discovery.c<br>
&gt; index 2aad1ba0ab9d..87a2f15c8a64 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c<br>
&gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c<br>
&gt; @@ -1965,6 +1965,11 @@ static int amdgpu_discovery_set_display_ip_bloc=
ks(struct amdgpu_device *adev)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; case IP_VERSION(3, 2, 1):<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; case IP_VERSION(3, 5, 0):<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; case IP_VERSION(3, 5, 1):<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; case IP_VERSION(4, 1, 0):<br>
<br>
Doesn't this do more than override? Doesn't this enable IP<br>
creation for DCN 4.1.0 in the first place?<br>
<br>
It might make sense to split this into a separate patch<br>
as it sounds like we'll want to revert the override at<br>
some point in the future but not the IP creation.<br>
<br>
Harry<br>
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* TODO: Fix IP version=
. DC code expects version 4.0.1 */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;ip_version=
s[DCE_HWIP][0] =3D=3D IP_VERSION(4, 1, 0))<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;ip_versions[DCE_HWIP][0] =3D =
IP_VERSION(4, 0, 1);<br>
&gt; +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (amd=
gpu_sriov_vf(adev))<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_discovery_set_sriov_display=
(adev);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br=
>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_CH0PR12MB52842FC9E8BADBCCFBE947A88B1A2CH0PR12MB5284namp_--
