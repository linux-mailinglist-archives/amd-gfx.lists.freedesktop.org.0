Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88824494D68
	for <lists+amd-gfx@lfdr.de>; Thu, 20 Jan 2022 12:51:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D181F10E422;
	Thu, 20 Jan 2022 11:51:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2052.outbound.protection.outlook.com [40.107.236.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BDB710E490
 for <amd-gfx@lists.freedesktop.org>; Thu, 20 Jan 2022 11:51:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GBHwm11OTzgqdCQSRid1iOGD1BlxhkrRV2AJx1d7of/ZIHCMxPQ7LhWTA5a58HXwIqW3+/WC7T8LH6RlMUa10CN5ubni9mbYFeETP/Hot83Jceihs6nYqAOkDwIYflbcd7lnblUNERjVhV96CFMpzu9qys5QHNgBua2qmWSWL0zEBwh3nPHLk2/XQ+q9aljIVUIXah9RCF2a4WJuI+ei9qpAOJzw9GoxPTxW3pj7nZYBmCymInvmnSg0PA6WLrR81x6+Wo5wro9tJJmoAjI2oUL0r5FtmuKTm8oyzYzWO3HUxlIF2lsv0Y0RQBP8f94ImQRiH7By5bF2Xx0rUPbyTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0D00lobuFb74n6Ec3mB5Zy5Whbni7SdM4ByLeA/Iz0E=;
 b=aw+LnoZ/CCsoNeptTFJyU1RvG1UX//aVe3l22V7bIdGjju3RTHDYoo8EvidT1VkZmh2U+IGXtiU25lAbCWmto0iWbx5XK4MI+JCN21JHbUs1lYT6Qvo6mYsizcEPVolQg8/mbpeBhtK7QEG5ty1I8B146YGeD6U77nwdVzgZ465g5cgow8uT1ksKeCw9XcNCUjgEbPD4SPNom+3O/T229VqXrMLrlgLe2w/RGD9fxsEuv1TZOS0z3aQSiIh8H9lzluz2nHr3H4S97y+xsLpnAymdiNUmklNRFJ3q0fHDWVDeComJvhmS5uex25U1atvU5kTigUH8R4pCKuLCR6Dr3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0D00lobuFb74n6Ec3mB5Zy5Whbni7SdM4ByLeA/Iz0E=;
 b=WTpOU5pYI9i1Nnk9DR/aBPwkBLOvzPtf/P22m1agzYHZatTuiVFmN3yPvOD9fcmpRukQIebt4voQaP2cM042H4T32k+6CmYp7Z+vfWKdUEZ4hNVEc/6O5EWt6rt15c/+QTDearS1RVP5tZuhkqM7M6YS4bK+hHmubz51Miku+hI=
Received: from DM6PR12MB2619.namprd12.prod.outlook.com (2603:10b6:5:45::18) by
 SA0PR12MB4576.namprd12.prod.outlook.com (2603:10b6:806:93::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4909.8; Thu, 20 Jan 2022 11:51:42 +0000
Received: from DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::a894:300e:5c16:5639]) by DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::a894:300e:5c16:5639%6]) with mapi id 15.20.4909.010; Thu, 20 Jan 2022
 11:51:42 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH V2 7/7] drm/amd/pm: drop unneeded hwmgr->smu_lock
Thread-Topic: [PATCH V2 7/7] drm/amd/pm: drop unneeded hwmgr->smu_lock
Thread-Index: AQHYC2USuCMF6o0VvU6btWLxmGhVvqxr0U2w
Date: Thu, 20 Jan 2022 11:51:42 +0000
Message-ID: <DM6PR12MB261959C203C1D74A51DE6045E45A9@DM6PR12MB2619.namprd12.prod.outlook.com>
References: <20220117054151.124838-1-evan.quan@amd.com>
 <20220117054151.124838-7-evan.quan@amd.com>
In-Reply-To: <20220117054151.124838-7-evan.quan@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=true;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2022-01-20T11:51:38Z; 
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD Official Use
 Only-AIP 2.0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ActionId=d87fda1c-ecd9-450a-bc1e-a7db8f1a24b7;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d4ccb687-6d9e-4c1d-6498-08d9dc0b3a1a
x-ms-traffictypediagnostic: SA0PR12MB4576:EE_
x-microsoft-antispam-prvs: <SA0PR12MB4576B0D5969674C067FBB39BE45A9@SA0PR12MB4576.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:240;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JIN7ScoJ8xCxd2G4O/d+0AdA3WI4wac08zTBP6EDz2DBEBFL19RWwo1z0IiwopU5x24SXRYzGVSK6j58LYE9gD5dTh4/N6gkEsKNAU1r1NWJRO+gPrO27W5KuyexsVd78T8RI2dd8hOUwqSP+TJu007yQ/ciX8Z0SSqerGDiX84AHSkCU5aVsEoXe4QXCAFq2N/vQrtliNKzWWsoDFhNK4mZjJJ4wSuVwGmqzmXONwyZoP/fTFohUSN3NLGUeO9CPaSJdrYJX8oNwMgKfFoeBBQchL4KIKfiMUK+fygspfsfhsU5nqPt58q1DdX2ZBjVZV/AsHwRanPocHMaRsqIqp2K8Ps2ytPg0cAzFhaZTzVBgD8fGlmjGq3Ak53cr0xvE9uWLPHwo2Klnpo4NWZwRcy5nr6DN/b7j5BQn6Q9B8eNK1mN1I/Rb/iHqjc2u4l+XBw9AgBxEdHMl8NBtF3ArRM1Oq8srn/AO+dRwIOj9j/6BImY6Ix6ortlpWAGeoWoe/Z079S4DGHFj1HAUUNjVQb/jkxp0tCCmYvPGwyAz38Df15r/Fk1Rh0+eZ8cIvm5Ecp6VsuurStIOn3cvvFSuBrd4jTnQmP1HYITZBTgXVT5pguxTt0T+/KziiDYpd9kbqGEiESxMV1KA5Nm4APkqG+Y3AwmYUiagt9bNFM4SRk4QslDspG0oi4UjC39UjjlrToEpAZPx96Eplvl4zA+5w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2619.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(52536014)(83380400001)(33656002)(38070700005)(86362001)(71200400001)(55016003)(76116006)(8676002)(66446008)(64756008)(66476007)(66946007)(4326008)(30864003)(508600001)(122000001)(38100700002)(8936002)(2906002)(6506007)(5660300002)(53546011)(54906003)(6916009)(7696005)(316002)(9686003)(66556008)(186003)(26005)(579004)(559001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?a5aQ9RYUWufa9z/CKBk/CsCPLljjOvZVGjhi+QlHEELAcAK0pwjwBnxQxhc0?=
 =?us-ascii?Q?Gp2SN/tW1gSdP5DeVEeaXDHuFiEuuhU5WATiglV24GThFlMzYMUHpPYnK9lA?=
 =?us-ascii?Q?UGimLomFgb9uUvzpxxa2Lf3/8eoq05wIE/RSiy3W2mrkmlENVZ/0xQZ6qaJw?=
 =?us-ascii?Q?pWeMOuk+Pyn36Hf+UWrlfB4IbGfiqxazwkzk9kFrz51A8mttefexpewi2jL5?=
 =?us-ascii?Q?dB/iIpMoygu9cx0BTmmO9qrCI3rkzwBO9N2qFm30cVYtvq4CxEh8GONd8JW5?=
 =?us-ascii?Q?Bc5W6xRl+uelN/In9q2kURkTyA1GZlyev0XI8qBQcXKHaDzq1j4dHH/eP7wK?=
 =?us-ascii?Q?eHuxarEmv4Hgr8SvlsM7CWifi2hDlvnkvfS+N4iAWkJHHyajLRxuGc5sdvPf?=
 =?us-ascii?Q?cFiVEW3UG+y5m9TBlmeU8Bz2jY/ExWYYbhdTUl+iD77ZWHaXUuOjeh3ZRHZm?=
 =?us-ascii?Q?r74d7aozjVRzBKBj3f4j6u7Zmh/qzXKdvEzL1MusRJ4LMfFySaZWzxI+gDih?=
 =?us-ascii?Q?IK1W7lYhpMEyUa4xOB1HuFCmwBxsBk6wopVMJStRM9hgSDfa5hCOQPSHu9oY?=
 =?us-ascii?Q?Tw7d5mnGBmVxfnPPAWB9b2bV+OmeaOcjEvtmDzLB0uqwUNV0Xzf1GyXgi2Dw?=
 =?us-ascii?Q?MrCr8rqKQyWvYTkj8khZBps6KOKnAGMn/PkmMVfgQpPZnjeNGvq1MKC0y+e1?=
 =?us-ascii?Q?n8YSRe3DDerSSybm5/wqQJOYk3cZhcePsF5uF0NcrOUbKhBwQQGXSBw3b+6Y?=
 =?us-ascii?Q?1tiveXNJJxKGTMhE9962TB4cKg4by6ampVndklIJ50JlB4DQE5adXnI5Awnh?=
 =?us-ascii?Q?kJOizbsnlFNj+sJn/X4SXm763YdSP6DuXPIB7rt8b12U/xD7uL780jFOroqX?=
 =?us-ascii?Q?n9gUk1VQ3CVEpjxTQHzMzHp9cCFSmgIJYkQjhi17h2qRZqllEDGNh9c/Xa1Q?=
 =?us-ascii?Q?mo75YGk6NYi6pKUxAvWFR71uvtGnuobtT/TK1SCZZjnw5zp7qXTL/83jgZ1l?=
 =?us-ascii?Q?LQfoZXHAxLe/XrhFpeI2mmP+1eaR3fY+BIgfSNKITVaSG8Ym7SGxrlWg2tAk?=
 =?us-ascii?Q?x+HnDgJi/8e/vRY2XVNtBHJF8/K99FAfESMadvt1B5+3zmi8XNyIUJbJzYBG?=
 =?us-ascii?Q?APxwLSz10YOUY19W8nrby94L/ujlVCHq2UhIuw4ozZNwCWpPvzZJ0grF+aJs?=
 =?us-ascii?Q?6iiAP87DiACUx86jVrM/TsMoXJrOSB2AisCNk92wXxw2r0+oHYfe4VotUHjs?=
 =?us-ascii?Q?E+cssriNO5gbBFjATdF0IIIv2Q1JqttaHtqKYiXYn59a9Lo+T0jkgdtHKOHk?=
 =?us-ascii?Q?/ZNi7iKDAsJQvmkF4SZemc8LL7Lyp9SSoOtckUpOYQtAar4nb2ET9GL0E18/?=
 =?us-ascii?Q?QD83tW4YNhUqFXaQOwz7CtPKSYjkCqQ4FWI7ZbyYcY0VeERK3KjOM3la9f1C?=
 =?us-ascii?Q?w4HyWx8xaXZpizWSPqcCOr+PTFPvZCf/H4pGtAy1hVATAxAQh0ympJcdJAME?=
 =?us-ascii?Q?47EJ4VdgQdbo4M/siJ1i2PKoQTy38r2RxW5BBLnQArSuj8KrxBTxsF4mbWGH?=
 =?us-ascii?Q?vhyGsQxegAbNqwP8d9s=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2619.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4ccb687-6d9e-4c1d-6498-08d9dc0b3a1a
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2022 11:51:42.5163 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4QGyMqAa/nEqp26GSayKPX0IIVXL5vuVPzruxrnd/reY7cI6W1kb6ovh4qmhy9/8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4576
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Lazar,
 Lijo" <Lijo.Lazar@amd.com>, "Chen, Guchun" <Guchun.Chen@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

[AMD Official Use Only]

Ping for the series..

> -----Original Message-----
> From: Quan, Evan <Evan.Quan@amd.com>
> Sent: Monday, January 17, 2022 1:42 PM
> To: amd-gfx@lists.freedesktop.org
> Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Lazar, Lijo
> <Lijo.Lazar@amd.com>; Chen, Guchun <Guchun.Chen@amd.com>; Quan,
> Evan <Evan.Quan@amd.com>
> Subject: [PATCH V2 7/7] drm/amd/pm: drop unneeded hwmgr->smu_lock
>=20
> As all those related APIs are already well protected by adev->pm.mutex.
>=20
> Signed-off-by: Evan Quan <evan.quan@amd.com>
> Change-Id: I36426791d3bbc9d84a6ae437da26a892682eb0cb
> ---
>  .../gpu/drm/amd/pm/powerplay/amd_powerplay.c  | 278 +++---------------
>  drivers/gpu/drm/amd/pm/powerplay/inc/hwmgr.h  |   1 -
>  2 files changed, 38 insertions(+), 241 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
> b/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
> index 76c26ae368f9..a2da46bf3985 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
> @@ -50,7 +50,6 @@ static int amd_powerplay_create(struct amdgpu_device
> *adev)
>  	hwmgr->adev =3D adev;
>  	hwmgr->not_vf =3D !amdgpu_sriov_vf(adev);
>  	hwmgr->device =3D amdgpu_cgs_create_device(adev);
> -	mutex_init(&hwmgr->smu_lock);
>  	mutex_init(&hwmgr->msg_lock);
>  	hwmgr->chip_family =3D adev->family;
>  	hwmgr->chip_id =3D adev->asic_type;
> @@ -178,12 +177,9 @@ static int pp_late_init(void *handle)
>  	struct amdgpu_device *adev =3D handle;
>  	struct pp_hwmgr *hwmgr =3D adev->powerplay.pp_handle;
>=20
> -	if (hwmgr && hwmgr->pm_en) {
> -		mutex_lock(&hwmgr->smu_lock);
> +	if (hwmgr && hwmgr->pm_en)
>  		hwmgr_handle_task(hwmgr,
>  					AMD_PP_TASK_COMPLETE_INIT,
> NULL);
> -		mutex_unlock(&hwmgr->smu_lock);
> -	}
>  	if (adev->pm.smu_prv_buffer_size !=3D 0)
>  		pp_reserve_vram_for_smu(adev);
>=20
> @@ -345,11 +341,9 @@ static int pp_dpm_force_performance_level(void
> *handle,
>  	if (level =3D=3D hwmgr->dpm_level)
>  		return 0;
>=20
> -	mutex_lock(&hwmgr->smu_lock);
>  	pp_dpm_en_umd_pstate(hwmgr, &level);
>  	hwmgr->request_dpm_level =3D level;
>  	hwmgr_handle_task(hwmgr,
> AMD_PP_TASK_READJUST_POWER_STATE, NULL);
> -	mutex_unlock(&hwmgr->smu_lock);
>=20
>  	return 0;
>  }
> @@ -358,21 +352,16 @@ static enum amd_dpm_forced_level
> pp_dpm_get_performance_level(
>  								void *handle)
>  {
>  	struct pp_hwmgr *hwmgr =3D handle;
> -	enum amd_dpm_forced_level level;
>=20
>  	if (!hwmgr || !hwmgr->pm_en)
>  		return -EINVAL;
>=20
> -	mutex_lock(&hwmgr->smu_lock);
> -	level =3D hwmgr->dpm_level;
> -	mutex_unlock(&hwmgr->smu_lock);
> -	return level;
> +	return hwmgr->dpm_level;
>  }
>=20
>  static uint32_t pp_dpm_get_sclk(void *handle, bool low)  {
>  	struct pp_hwmgr *hwmgr =3D handle;
> -	uint32_t clk =3D 0;
>=20
>  	if (!hwmgr || !hwmgr->pm_en)
>  		return 0;
> @@ -381,16 +370,12 @@ static uint32_t pp_dpm_get_sclk(void *handle,
> bool low)
>  		pr_info_ratelimited("%s was not implemented.\n",
> __func__);
>  		return 0;
>  	}
> -	mutex_lock(&hwmgr->smu_lock);
> -	clk =3D hwmgr->hwmgr_func->get_sclk(hwmgr, low);
> -	mutex_unlock(&hwmgr->smu_lock);
> -	return clk;
> +	return hwmgr->hwmgr_func->get_sclk(hwmgr, low);
>  }
>=20
>  static uint32_t pp_dpm_get_mclk(void *handle, bool low)  {
>  	struct pp_hwmgr *hwmgr =3D handle;
> -	uint32_t clk =3D 0;
>=20
>  	if (!hwmgr || !hwmgr->pm_en)
>  		return 0;
> @@ -399,10 +384,7 @@ static uint32_t pp_dpm_get_mclk(void *handle,
> bool low)
>  		pr_info_ratelimited("%s was not implemented.\n",
> __func__);
>  		return 0;
>  	}
> -	mutex_lock(&hwmgr->smu_lock);
> -	clk =3D hwmgr->hwmgr_func->get_mclk(hwmgr, low);
> -	mutex_unlock(&hwmgr->smu_lock);
> -	return clk;
> +	return hwmgr->hwmgr_func->get_mclk(hwmgr, low);
>  }
>=20
>  static void pp_dpm_powergate_vce(void *handle, bool gate) @@ -416,9
> +398,7 @@ static void pp_dpm_powergate_vce(void *handle, bool gate)
>  		pr_info_ratelimited("%s was not implemented.\n",
> __func__);
>  		return;
>  	}
> -	mutex_lock(&hwmgr->smu_lock);
>  	hwmgr->hwmgr_func->powergate_vce(hwmgr, gate);
> -	mutex_unlock(&hwmgr->smu_lock);
>  }
>=20
>  static void pp_dpm_powergate_uvd(void *handle, bool gate) @@ -432,25
> +412,18 @@ static void pp_dpm_powergate_uvd(void *handle, bool gate)
>  		pr_info_ratelimited("%s was not implemented.\n",
> __func__);
>  		return;
>  	}
> -	mutex_lock(&hwmgr->smu_lock);
>  	hwmgr->hwmgr_func->powergate_uvd(hwmgr, gate);
> -	mutex_unlock(&hwmgr->smu_lock);
>  }
>=20
>  static int pp_dpm_dispatch_tasks(void *handle, enum amd_pp_task task_id,
>  		enum amd_pm_state_type *user_state)
>  {
> -	int ret =3D 0;
>  	struct pp_hwmgr *hwmgr =3D handle;
>=20
>  	if (!hwmgr || !hwmgr->pm_en)
>  		return -EINVAL;
>=20
> -	mutex_lock(&hwmgr->smu_lock);
> -	ret =3D hwmgr_handle_task(hwmgr, task_id, user_state);
> -	mutex_unlock(&hwmgr->smu_lock);
> -
> -	return ret;
> +	return hwmgr_handle_task(hwmgr, task_id, user_state);
>  }
>=20
>  static enum amd_pm_state_type pp_dpm_get_current_power_state(void
> *handle) @@ -462,8 +435,6 @@ static enum amd_pm_state_type
> pp_dpm_get_current_power_state(void *handle)
>  	if (!hwmgr || !hwmgr->pm_en || !hwmgr->current_ps)
>  		return -EINVAL;
>=20
> -	mutex_lock(&hwmgr->smu_lock);
> -
>  	state =3D hwmgr->current_ps;
>=20
>  	switch (state->classification.ui_label) { @@ -483,7 +454,6 @@ static
> enum amd_pm_state_type pp_dpm_get_current_power_state(void
> *handle)
>  			pm_type =3D POWER_STATE_TYPE_DEFAULT;
>  		break;
>  	}
> -	mutex_unlock(&hwmgr->smu_lock);
>=20
>  	return pm_type;
>  }
> @@ -501,9 +471,7 @@ static int pp_dpm_set_fan_control_mode(void
> *handle, uint32_t mode)
>  	if (mode =3D=3D U32_MAX)
>  		return -EINVAL;
>=20
> -	mutex_lock(&hwmgr->smu_lock);
>  	hwmgr->hwmgr_func->set_fan_control_mode(hwmgr, mode);
> -	mutex_unlock(&hwmgr->smu_lock);
>=20
>  	return 0;
>  }
> @@ -521,16 +489,13 @@ static int pp_dpm_get_fan_control_mode(void
> *handle, uint32_t *fan_mode)
>  	if (!fan_mode)
>  		return -EINVAL;
>=20
> -	mutex_lock(&hwmgr->smu_lock);
>  	*fan_mode =3D hwmgr->hwmgr_func-
> >get_fan_control_mode(hwmgr);
> -	mutex_unlock(&hwmgr->smu_lock);
>  	return 0;
>  }
>=20
>  static int pp_dpm_set_fan_speed_pwm(void *handle, uint32_t speed)  {
>  	struct pp_hwmgr *hwmgr =3D handle;
> -	int ret =3D 0;
>=20
>  	if (!hwmgr || !hwmgr->pm_en)
>  		return -EOPNOTSUPP;
> @@ -541,16 +506,12 @@ static int pp_dpm_set_fan_speed_pwm(void
> *handle, uint32_t speed)
>  	if (speed =3D=3D U32_MAX)
>  		return -EINVAL;
>=20
> -	mutex_lock(&hwmgr->smu_lock);
> -	ret =3D hwmgr->hwmgr_func->set_fan_speed_pwm(hwmgr, speed);
> -	mutex_unlock(&hwmgr->smu_lock);
> -	return ret;
> +	return hwmgr->hwmgr_func->set_fan_speed_pwm(hwmgr, speed);
>  }
>=20
>  static int pp_dpm_get_fan_speed_pwm(void *handle, uint32_t *speed)  {
>  	struct pp_hwmgr *hwmgr =3D handle;
> -	int ret =3D 0;
>=20
>  	if (!hwmgr || !hwmgr->pm_en)
>  		return -EOPNOTSUPP;
> @@ -561,16 +522,12 @@ static int pp_dpm_get_fan_speed_pwm(void
> *handle, uint32_t *speed)
>  	if (!speed)
>  		return -EINVAL;
>=20
> -	mutex_lock(&hwmgr->smu_lock);
> -	ret =3D hwmgr->hwmgr_func->get_fan_speed_pwm(hwmgr, speed);
> -	mutex_unlock(&hwmgr->smu_lock);
> -	return ret;
> +	return hwmgr->hwmgr_func->get_fan_speed_pwm(hwmgr, speed);
>  }
>=20
>  static int pp_dpm_get_fan_speed_rpm(void *handle, uint32_t *rpm)  {
>  	struct pp_hwmgr *hwmgr =3D handle;
> -	int ret =3D 0;
>=20
>  	if (!hwmgr || !hwmgr->pm_en)
>  		return -EOPNOTSUPP;
> @@ -581,16 +538,12 @@ static int pp_dpm_get_fan_speed_rpm(void
> *handle, uint32_t *rpm)
>  	if (!rpm)
>  		return -EINVAL;
>=20
> -	mutex_lock(&hwmgr->smu_lock);
> -	ret =3D hwmgr->hwmgr_func->get_fan_speed_rpm(hwmgr, rpm);
> -	mutex_unlock(&hwmgr->smu_lock);
> -	return ret;
> +	return hwmgr->hwmgr_func->get_fan_speed_rpm(hwmgr, rpm);
>  }
>=20
>  static int pp_dpm_set_fan_speed_rpm(void *handle, uint32_t rpm)  {
>  	struct pp_hwmgr *hwmgr =3D handle;
> -	int ret =3D 0;
>=20
>  	if (!hwmgr || !hwmgr->pm_en)
>  		return -EOPNOTSUPP;
> @@ -601,10 +554,7 @@ static int pp_dpm_set_fan_speed_rpm(void
> *handle, uint32_t rpm)
>  	if (rpm =3D=3D U32_MAX)
>  		return -EINVAL;
>=20
> -	mutex_lock(&hwmgr->smu_lock);
> -	ret =3D hwmgr->hwmgr_func->set_fan_speed_rpm(hwmgr, rpm);
> -	mutex_unlock(&hwmgr->smu_lock);
> -	return ret;
> +	return hwmgr->hwmgr_func->set_fan_speed_rpm(hwmgr, rpm);
>  }
>=20
>  static int pp_dpm_get_pp_num_states(void *handle, @@ -618,8 +568,6
> @@ static int pp_dpm_get_pp_num_states(void *handle,
>  	if (!hwmgr || !hwmgr->pm_en ||!hwmgr->ps)
>  		return -EINVAL;
>=20
> -	mutex_lock(&hwmgr->smu_lock);
> -
>  	data->nums =3D hwmgr->num_ps;
>=20
>  	for (i =3D 0; i < hwmgr->num_ps; i++) {
> @@ -642,23 +590,18 @@ static int pp_dpm_get_pp_num_states(void
> *handle,
>  				data->states[i] =3D
> POWER_STATE_TYPE_DEFAULT;
>  		}
>  	}
> -	mutex_unlock(&hwmgr->smu_lock);
>  	return 0;
>  }
>=20
>  static int pp_dpm_get_pp_table(void *handle, char **table)  {
>  	struct pp_hwmgr *hwmgr =3D handle;
> -	int size =3D 0;
>=20
>  	if (!hwmgr || !hwmgr->pm_en ||!hwmgr->soft_pp_table)
>  		return -EINVAL;
>=20
> -	mutex_lock(&hwmgr->smu_lock);
>  	*table =3D (char *)hwmgr->soft_pp_table;
> -	size =3D hwmgr->soft_pp_table_size;
> -	mutex_unlock(&hwmgr->smu_lock);
> -	return size;
> +	return hwmgr->soft_pp_table_size;
>  }
>=20
>  static int amd_powerplay_reset(void *handle) @@ -685,13 +628,12 @@
> static int pp_dpm_set_pp_table(void *handle, const char *buf, size_t size=
)
>  	if (!hwmgr || !hwmgr->pm_en)
>  		return -EINVAL;
>=20
> -	mutex_lock(&hwmgr->smu_lock);
>  	if (!hwmgr->hardcode_pp_table) {
>  		hwmgr->hardcode_pp_table =3D kmemdup(hwmgr-
> >soft_pp_table,
>  						   hwmgr-
> >soft_pp_table_size,
>  						   GFP_KERNEL);
>  		if (!hwmgr->hardcode_pp_table)
> -			goto err;
> +			return ret;
>  	}
>=20
>  	memcpy(hwmgr->hardcode_pp_table, buf, size); @@ -700,17
> +642,11 @@ static int pp_dpm_set_pp_table(void *handle, const char *buf,
> size_t size)
>=20
>  	ret =3D amd_powerplay_reset(handle);
>  	if (ret)
> -		goto err;
> +		return ret;
>=20
> -	if (hwmgr->hwmgr_func->avfs_control) {
> +	if (hwmgr->hwmgr_func->avfs_control)
>  		ret =3D hwmgr->hwmgr_func->avfs_control(hwmgr, false);
> -		if (ret)
> -			goto err;
> -	}
> -	mutex_unlock(&hwmgr->smu_lock);
> -	return 0;
> -err:
> -	mutex_unlock(&hwmgr->smu_lock);
> +
>  	return ret;
>  }
>=20
> @@ -718,7 +654,6 @@ static int pp_dpm_force_clock_level(void *handle,
>  		enum pp_clock_type type, uint32_t mask)  {
>  	struct pp_hwmgr *hwmgr =3D handle;
> -	int ret =3D 0;
>=20
>  	if (!hwmgr || !hwmgr->pm_en)
>  		return -EINVAL;
> @@ -733,17 +668,13 @@ static int pp_dpm_force_clock_level(void *handle,
>  		return -EINVAL;
>  	}
>=20
> -	mutex_lock(&hwmgr->smu_lock);
> -	ret =3D hwmgr->hwmgr_func->force_clock_level(hwmgr, type, mask);
> -	mutex_unlock(&hwmgr->smu_lock);
> -	return ret;
> +	return hwmgr->hwmgr_func->force_clock_level(hwmgr, type,
> mask);
>  }
>=20
>  static int pp_dpm_print_clock_levels(void *handle,
>  		enum pp_clock_type type, char *buf)
>  {
>  	struct pp_hwmgr *hwmgr =3D handle;
> -	int ret =3D 0;
>=20
>  	if (!hwmgr || !hwmgr->pm_en)
>  		return -EINVAL;
> @@ -752,16 +683,12 @@ static int pp_dpm_print_clock_levels(void *handle,
>  		pr_info_ratelimited("%s was not implemented.\n",
> __func__);
>  		return 0;
>  	}
> -	mutex_lock(&hwmgr->smu_lock);
> -	ret =3D hwmgr->hwmgr_func->print_clock_levels(hwmgr, type, buf);
> -	mutex_unlock(&hwmgr->smu_lock);
> -	return ret;
> +	return hwmgr->hwmgr_func->print_clock_levels(hwmgr, type, buf);
>  }
>=20
>  static int pp_dpm_get_sclk_od(void *handle)  {
>  	struct pp_hwmgr *hwmgr =3D handle;
> -	int ret =3D 0;
>=20
>  	if (!hwmgr || !hwmgr->pm_en)
>  		return -EINVAL;
> @@ -770,16 +697,12 @@ static int pp_dpm_get_sclk_od(void *handle)
>  		pr_info_ratelimited("%s was not implemented.\n",
> __func__);
>  		return 0;
>  	}
> -	mutex_lock(&hwmgr->smu_lock);
> -	ret =3D hwmgr->hwmgr_func->get_sclk_od(hwmgr);
> -	mutex_unlock(&hwmgr->smu_lock);
> -	return ret;
> +	return hwmgr->hwmgr_func->get_sclk_od(hwmgr);
>  }
>=20
>  static int pp_dpm_set_sclk_od(void *handle, uint32_t value)  {
>  	struct pp_hwmgr *hwmgr =3D handle;
> -	int ret =3D 0;
>=20
>  	if (!hwmgr || !hwmgr->pm_en)
>  		return -EINVAL;
> @@ -789,16 +712,12 @@ static int pp_dpm_set_sclk_od(void *handle,
> uint32_t value)
>  		return 0;
>  	}
>=20
> -	mutex_lock(&hwmgr->smu_lock);
> -	ret =3D hwmgr->hwmgr_func->set_sclk_od(hwmgr, value);
> -	mutex_unlock(&hwmgr->smu_lock);
> -	return ret;
> +	return hwmgr->hwmgr_func->set_sclk_od(hwmgr, value);
>  }
>=20
>  static int pp_dpm_get_mclk_od(void *handle)  {
>  	struct pp_hwmgr *hwmgr =3D handle;
> -	int ret =3D 0;
>=20
>  	if (!hwmgr || !hwmgr->pm_en)
>  		return -EINVAL;
> @@ -807,16 +726,12 @@ static int pp_dpm_get_mclk_od(void *handle)
>  		pr_info_ratelimited("%s was not implemented.\n",
> __func__);
>  		return 0;
>  	}
> -	mutex_lock(&hwmgr->smu_lock);
> -	ret =3D hwmgr->hwmgr_func->get_mclk_od(hwmgr);
> -	mutex_unlock(&hwmgr->smu_lock);
> -	return ret;
> +	return hwmgr->hwmgr_func->get_mclk_od(hwmgr);
>  }
>=20
>  static int pp_dpm_set_mclk_od(void *handle, uint32_t value)  {
>  	struct pp_hwmgr *hwmgr =3D handle;
> -	int ret =3D 0;
>=20
>  	if (!hwmgr || !hwmgr->pm_en)
>  		return -EINVAL;
> @@ -825,17 +740,13 @@ static int pp_dpm_set_mclk_od(void *handle,
> uint32_t value)
>  		pr_info_ratelimited("%s was not implemented.\n",
> __func__);
>  		return 0;
>  	}
> -	mutex_lock(&hwmgr->smu_lock);
> -	ret =3D hwmgr->hwmgr_func->set_mclk_od(hwmgr, value);
> -	mutex_unlock(&hwmgr->smu_lock);
> -	return ret;
> +	return hwmgr->hwmgr_func->set_mclk_od(hwmgr, value);
>  }
>=20
>  static int pp_dpm_read_sensor(void *handle, int idx,
>  			      void *value, int *size)
>  {
>  	struct pp_hwmgr *hwmgr =3D handle;
> -	int ret =3D 0;
>=20
>  	if (!hwmgr || !hwmgr->pm_en || !value)
>  		return -EINVAL;
> @@ -854,10 +765,7 @@ static int pp_dpm_read_sensor(void *handle, int idx,
>  		*((uint32_t *)value) =3D hwmgr-
> >thermal_controller.fanInfo.ulMaxRPM;
>  		return 0;
>  	default:
> -		mutex_lock(&hwmgr->smu_lock);
> -		ret =3D hwmgr->hwmgr_func->read_sensor(hwmgr, idx, value,
> size);
> -		mutex_unlock(&hwmgr->smu_lock);
> -		return ret;
> +		return hwmgr->hwmgr_func->read_sensor(hwmgr, idx,
> value, size);
>  	}
>  }
>=20
> @@ -877,36 +785,28 @@ pp_dpm_get_vce_clock_state(void *handle,
> unsigned idx)  static int pp_get_power_profile_mode(void *handle, char
> *buf)  {
>  	struct pp_hwmgr *hwmgr =3D handle;
> -	int ret;
>=20
>  	if (!hwmgr || !hwmgr->pm_en || !hwmgr->hwmgr_func-
> >get_power_profile_mode)
>  		return -EOPNOTSUPP;
>  	if (!buf)
>  		return -EINVAL;
>=20
> -	mutex_lock(&hwmgr->smu_lock);
> -	ret =3D hwmgr->hwmgr_func->get_power_profile_mode(hwmgr, buf);
> -	mutex_unlock(&hwmgr->smu_lock);
> -	return ret;
> +	return hwmgr->hwmgr_func->get_power_profile_mode(hwmgr,
> buf);
>  }
>=20
>  static int pp_set_power_profile_mode(void *handle, long *input, uint32_t
> size)  {
>  	struct pp_hwmgr *hwmgr =3D handle;
> -	int ret =3D -EOPNOTSUPP;
>=20
>  	if (!hwmgr || !hwmgr->pm_en || !hwmgr->hwmgr_func-
> >set_power_profile_mode)
> -		return ret;
> +		return -EOPNOTSUPP;
>=20
>  	if (hwmgr->dpm_level !=3D AMD_DPM_FORCED_LEVEL_MANUAL) {
>  		pr_debug("power profile setting is for manual dpm mode
> only.\n");
>  		return -EINVAL;
>  	}
>=20
> -	mutex_lock(&hwmgr->smu_lock);
> -	ret =3D hwmgr->hwmgr_func->set_power_profile_mode(hwmgr,
> input, size);
> -	mutex_unlock(&hwmgr->smu_lock);
> -	return ret;
> +	return hwmgr->hwmgr_func->set_power_profile_mode(hwmgr,
> input, size);
>  }
>=20
>  static int pp_set_fine_grain_clk_vol(void *handle, uint32_t type, long *=
input,
> uint32_t size) @@ -971,8 +871,6 @@ static int
> pp_dpm_switch_power_profile(void *handle,
>  	if (!(type < PP_SMC_POWER_PROFILE_CUSTOM))
>  		return -EINVAL;
>=20
> -	mutex_lock(&hwmgr->smu_lock);
> -
>  	if (!en) {
>  		hwmgr->workload_mask &=3D ~(1 << hwmgr-
> >workload_prority[type]);
>  		index =3D fls(hwmgr->workload_mask);
> @@ -987,15 +885,12 @@ static int pp_dpm_switch_power_profile(void
> *handle,
>=20
>  	if (type =3D=3D PP_SMC_POWER_PROFILE_COMPUTE &&
>  		hwmgr->hwmgr_func-
> >disable_power_features_for_compute_performance) {
> -			if (hwmgr->hwmgr_func-
> >disable_power_features_for_compute_performance(hwmgr, en)) {
> -				mutex_unlock(&hwmgr->smu_lock);
> +			if
> +(hwmgr->hwmgr_func-
> >disable_power_features_for_compute_performance(hwmg
> +r, en))
>  				return -EINVAL;
> -			}
>  	}
>=20
>  	if (hwmgr->dpm_level !=3D AMD_DPM_FORCED_LEVEL_MANUAL)
>  		hwmgr->hwmgr_func->set_power_profile_mode(hwmgr,
> &workload, 0);
> -	mutex_unlock(&hwmgr->smu_lock);
>=20
>  	return 0;
>  }
> @@ -1025,10 +920,8 @@ static int pp_set_power_limit(void *handle,
> uint32_t limit)
>  	if (limit > max_power_limit)
>  		return -EINVAL;
>=20
> -	mutex_lock(&hwmgr->smu_lock);
>  	hwmgr->hwmgr_func->set_power_limit(hwmgr, limit);
>  	hwmgr->power_limit =3D limit;
> -	mutex_unlock(&hwmgr->smu_lock);
>  	return 0;
>  }
>=20
> @@ -1045,8 +938,6 @@ static int pp_get_power_limit(void *handle, uint32_t
> *limit,
>  	if (power_type !=3D PP_PWR_TYPE_SUSTAINED)
>  		return -EOPNOTSUPP;
>=20
> -	mutex_lock(&hwmgr->smu_lock);
> -
>  	switch (pp_limit_level) {
>  		case PP_PWR_LIMIT_CURRENT:
>  			*limit =3D hwmgr->power_limit;
> @@ -1066,8 +957,6 @@ static int pp_get_power_limit(void *handle, uint32_t
> *limit,
>  			break;
>  	}
>=20
> -	mutex_unlock(&hwmgr->smu_lock);
> -
>  	return ret;
>  }
>=20
> @@ -1079,9 +968,7 @@ static int pp_display_configuration_change(void
> *handle,
>  	if (!hwmgr || !hwmgr->pm_en)
>  		return -EINVAL;
>=20
> -	mutex_lock(&hwmgr->smu_lock);
>  	phm_store_dal_configuration_data(hwmgr, display_config);
> -	mutex_unlock(&hwmgr->smu_lock);
>  	return 0;
>  }
>=20
> @@ -1089,15 +976,11 @@ static int pp_get_display_power_level(void
> *handle,
>  		struct amd_pp_simple_clock_info *output)  {
>  	struct pp_hwmgr *hwmgr =3D handle;
> -	int ret =3D 0;
>=20
>  	if (!hwmgr || !hwmgr->pm_en ||!output)
>  		return -EINVAL;
>=20
> -	mutex_lock(&hwmgr->smu_lock);
> -	ret =3D phm_get_dal_power_level(hwmgr, output);
> -	mutex_unlock(&hwmgr->smu_lock);
> -	return ret;
> +	return phm_get_dal_power_level(hwmgr, output);
>  }
>=20
>  static int pp_get_current_clocks(void *handle, @@ -1111,8 +994,6 @@ stat=
ic
> int pp_get_current_clocks(void *handle,
>  	if (!hwmgr || !hwmgr->pm_en)
>  		return -EINVAL;
>=20
> -	mutex_lock(&hwmgr->smu_lock);
> -
>  	phm_get_dal_power_level(hwmgr, &simple_clocks);
>=20
>  	if (phm_cap_enabled(hwmgr->platform_descriptor.platformCaps,
> @@ -1125,7 +1006,6 @@ static int pp_get_current_clocks(void *handle,
>=20
>  	if (ret) {
>  		pr_debug("Error in phm_get_clock_info \n");
> -		mutex_unlock(&hwmgr->smu_lock);
>  		return -EINVAL;
>  	}
>=20
> @@ -1148,14 +1028,12 @@ static int pp_get_current_clocks(void *handle,
>  		clocks->max_engine_clock_in_sr =3D hw_clocks.max_eng_clk;
>  		clocks->min_engine_clock_in_sr =3D hw_clocks.min_eng_clk;
>  	}
> -	mutex_unlock(&hwmgr->smu_lock);
>  	return 0;
>  }
>=20
>  static int pp_get_clock_by_type(void *handle, enum amd_pp_clock_type
> type, struct amd_pp_clocks *clocks)  {
>  	struct pp_hwmgr *hwmgr =3D handle;
> -	int ret =3D 0;
>=20
>  	if (!hwmgr || !hwmgr->pm_en)
>  		return -EINVAL;
> @@ -1163,10 +1041,7 @@ static int pp_get_clock_by_type(void *handle,
> enum amd_pp_clock_type type, struc
>  	if (clocks =3D=3D NULL)
>  		return -EINVAL;
>=20
> -	mutex_lock(&hwmgr->smu_lock);
> -	ret =3D phm_get_clock_by_type(hwmgr, type, clocks);
> -	mutex_unlock(&hwmgr->smu_lock);
> -	return ret;
> +	return phm_get_clock_by_type(hwmgr, type, clocks);
>  }
>=20
>  static int pp_get_clock_by_type_with_latency(void *handle, @@ -1174,15
> +1049,11 @@ static int pp_get_clock_by_type_with_latency(void *handle,
>  		struct pp_clock_levels_with_latency *clocks)  {
>  	struct pp_hwmgr *hwmgr =3D handle;
> -	int ret =3D 0;
>=20
>  	if (!hwmgr || !hwmgr->pm_en ||!clocks)
>  		return -EINVAL;
>=20
> -	mutex_lock(&hwmgr->smu_lock);
> -	ret =3D phm_get_clock_by_type_with_latency(hwmgr, type, clocks);
> -	mutex_unlock(&hwmgr->smu_lock);
> -	return ret;
> +	return phm_get_clock_by_type_with_latency(hwmgr, type, clocks);
>  }
>=20
>  static int pp_get_clock_by_type_with_voltage(void *handle, @@ -1190,50
> +1061,34 @@ static int pp_get_clock_by_type_with_voltage(void *handle,
>  		struct pp_clock_levels_with_voltage *clocks)  {
>  	struct pp_hwmgr *hwmgr =3D handle;
> -	int ret =3D 0;
>=20
>  	if (!hwmgr || !hwmgr->pm_en ||!clocks)
>  		return -EINVAL;
>=20
> -	mutex_lock(&hwmgr->smu_lock);
> -
> -	ret =3D phm_get_clock_by_type_with_voltage(hwmgr, type, clocks);
> -
> -	mutex_unlock(&hwmgr->smu_lock);
> -	return ret;
> +	return phm_get_clock_by_type_with_voltage(hwmgr, type, clocks);
>  }
>=20
>  static int pp_set_watermarks_for_clocks_ranges(void *handle,
>  		void *clock_ranges)
>  {
>  	struct pp_hwmgr *hwmgr =3D handle;
> -	int ret =3D 0;
>=20
>  	if (!hwmgr || !hwmgr->pm_en || !clock_ranges)
>  		return -EINVAL;
>=20
> -	mutex_lock(&hwmgr->smu_lock);
> -	ret =3D phm_set_watermarks_for_clocks_ranges(hwmgr,
> -			clock_ranges);
> -	mutex_unlock(&hwmgr->smu_lock);
> -
> -	return ret;
> +	return phm_set_watermarks_for_clocks_ranges(hwmgr,
> +						    clock_ranges);
>  }
>=20
>  static int pp_display_clock_voltage_request(void *handle,
>  		struct pp_display_clock_request *clock)  {
>  	struct pp_hwmgr *hwmgr =3D handle;
> -	int ret =3D 0;
>=20
>  	if (!hwmgr || !hwmgr->pm_en ||!clock)
>  		return -EINVAL;
>=20
> -	mutex_lock(&hwmgr->smu_lock);
> -	ret =3D phm_display_clock_voltage_request(hwmgr, clock);
> -	mutex_unlock(&hwmgr->smu_lock);
> -
> -	return ret;
> +	return phm_display_clock_voltage_request(hwmgr, clock);
>  }
>=20
>  static int pp_get_display_mode_validation_clocks(void *handle, @@ -
> 1247,12 +1102,9 @@ static int pp_get_display_mode_validation_clocks(void
> *handle,
>=20
>  	clocks->level =3D PP_DAL_POWERLEVEL_7;
>=20
> -	mutex_lock(&hwmgr->smu_lock);
> -
>  	if (phm_cap_enabled(hwmgr->platform_descriptor.platformCaps,
> PHM_PlatformCaps_DynamicPatchPowerState))
>  		ret =3D phm_get_max_high_clocks(hwmgr, clocks);
>=20
> -	mutex_unlock(&hwmgr->smu_lock);
>  	return ret;
>  }
>=20
> @@ -1364,9 +1216,7 @@ static int pp_notify_smu_enable_pwe(void
> *handle)
>  		return -EINVAL;
>  	}
>=20
> -	mutex_lock(&hwmgr->smu_lock);
>  	hwmgr->hwmgr_func->smus_notify_pwe(hwmgr);
> -	mutex_unlock(&hwmgr->smu_lock);
>=20
>  	return 0;
>  }
> @@ -1382,9 +1232,7 @@ static int pp_enable_mgpu_fan_boost(void
> *handle)
>  	     hwmgr->hwmgr_func->enable_mgpu_fan_boost =3D=3D NULL)
>  		return 0;
>=20
> -	mutex_lock(&hwmgr->smu_lock);
>  	hwmgr->hwmgr_func->enable_mgpu_fan_boost(hwmgr);
> -	mutex_unlock(&hwmgr->smu_lock);
>=20
>  	return 0;
>  }
> @@ -1401,9 +1249,7 @@ static int pp_set_min_deep_sleep_dcefclk(void
> *handle, uint32_t clock)
>  		return -EINVAL;
>  	}
>=20
> -	mutex_lock(&hwmgr->smu_lock);
>  	hwmgr->hwmgr_func->set_min_deep_sleep_dcefclk(hwmgr, clock);
> -	mutex_unlock(&hwmgr->smu_lock);
>=20
>  	return 0;
>  }
> @@ -1420,9 +1266,7 @@ static int pp_set_hard_min_dcefclk_by_freq(void
> *handle, uint32_t clock)
>  		return -EINVAL;
>  	}
>=20
> -	mutex_lock(&hwmgr->smu_lock);
>  	hwmgr->hwmgr_func->set_hard_min_dcefclk_by_freq(hwmgr,
> clock);
> -	mutex_unlock(&hwmgr->smu_lock);
>=20
>  	return 0;
>  }
> @@ -1439,9 +1283,7 @@ static int pp_set_hard_min_fclk_by_freq(void
> *handle, uint32_t clock)
>  		return -EINVAL;
>  	}
>=20
> -	mutex_lock(&hwmgr->smu_lock);
>  	hwmgr->hwmgr_func->set_hard_min_fclk_by_freq(hwmgr, clock);
> -	mutex_unlock(&hwmgr->smu_lock);
>=20
>  	return 0;
>  }
> @@ -1449,16 +1291,11 @@ static int pp_set_hard_min_fclk_by_freq(void
> *handle, uint32_t clock)  static int pp_set_active_display_count(void *ha=
ndle,
> uint32_t count)  {
>  	struct pp_hwmgr *hwmgr =3D handle;
> -	int ret =3D 0;
>=20
>  	if (!hwmgr || !hwmgr->pm_en)
>  		return -EINVAL;
>=20
> -	mutex_lock(&hwmgr->smu_lock);
> -	ret =3D phm_set_active_display_count(hwmgr, count);
> -	mutex_unlock(&hwmgr->smu_lock);
> -
> -	return ret;
> +	return phm_set_active_display_count(hwmgr, count);
>  }
>=20
>  static int pp_get_asic_baco_capability(void *handle, bool *cap) @@ -1473=
,9
> +1310,7 @@ static int pp_get_asic_baco_capability(void *handle, bool *cap=
)
>  		!hwmgr->hwmgr_func->get_asic_baco_capability)
>  		return 0;
>=20
> -	mutex_lock(&hwmgr->smu_lock);
>  	hwmgr->hwmgr_func->get_asic_baco_capability(hwmgr, cap);
> -	mutex_unlock(&hwmgr->smu_lock);
>=20
>  	return 0;
>  }
> @@ -1490,9 +1325,7 @@ static int pp_get_asic_baco_state(void *handle, int
> *state)
>  	if (!hwmgr->pm_en || !hwmgr->hwmgr_func->get_asic_baco_state)
>  		return 0;
>=20
> -	mutex_lock(&hwmgr->smu_lock);
>  	hwmgr->hwmgr_func->get_asic_baco_state(hwmgr, (enum
> BACO_STATE *)state);
> -	mutex_unlock(&hwmgr->smu_lock);
>=20
>  	return 0;
>  }
> @@ -1508,9 +1341,7 @@ static int pp_set_asic_baco_state(void *handle, int
> state)
>  		!hwmgr->hwmgr_func->set_asic_baco_state)
>  		return 0;
>=20
> -	mutex_lock(&hwmgr->smu_lock);
>  	hwmgr->hwmgr_func->set_asic_baco_state(hwmgr, (enum
> BACO_STATE)state);
> -	mutex_unlock(&hwmgr->smu_lock);
>=20
>  	return 0;
>  }
> @@ -1518,7 +1349,6 @@ static int pp_set_asic_baco_state(void *handle, int
> state)  static int pp_get_ppfeature_status(void *handle, char *buf)  {
>  	struct pp_hwmgr *hwmgr =3D handle;
> -	int ret =3D 0;
>=20
>  	if (!hwmgr || !hwmgr->pm_en || !buf)
>  		return -EINVAL;
> @@ -1528,17 +1358,12 @@ static int pp_get_ppfeature_status(void *handle,
> char *buf)
>  		return -EINVAL;
>  	}
>=20
> -	mutex_lock(&hwmgr->smu_lock);
> -	ret =3D hwmgr->hwmgr_func->get_ppfeature_status(hwmgr, buf);
> -	mutex_unlock(&hwmgr->smu_lock);
> -
> -	return ret;
> +	return hwmgr->hwmgr_func->get_ppfeature_status(hwmgr, buf);
>  }
>=20
>  static int pp_set_ppfeature_status(void *handle, uint64_t ppfeature_mask=
s)
> {
>  	struct pp_hwmgr *hwmgr =3D handle;
> -	int ret =3D 0;
>=20
>  	if (!hwmgr || !hwmgr->pm_en)
>  		return -EINVAL;
> @@ -1548,17 +1373,12 @@ static int pp_set_ppfeature_status(void *handle,
> uint64_t ppfeature_masks)
>  		return -EINVAL;
>  	}
>=20
> -	mutex_lock(&hwmgr->smu_lock);
> -	ret =3D hwmgr->hwmgr_func->set_ppfeature_status(hwmgr,
> ppfeature_masks);
> -	mutex_unlock(&hwmgr->smu_lock);
> -
> -	return ret;
> +	return hwmgr->hwmgr_func->set_ppfeature_status(hwmgr,
> +ppfeature_masks);
>  }
>=20
>  static int pp_asic_reset_mode_2(void *handle)  {
>  	struct pp_hwmgr *hwmgr =3D handle;
> -	int ret =3D 0;
>=20
>  	if (!hwmgr || !hwmgr->pm_en)
>  		return -EINVAL;
> @@ -1568,17 +1388,12 @@ static int pp_asic_reset_mode_2(void *handle)
>  		return -EINVAL;
>  	}
>=20
> -	mutex_lock(&hwmgr->smu_lock);
> -	ret =3D hwmgr->hwmgr_func->asic_reset(hwmgr,
> SMU_ASIC_RESET_MODE_2);
> -	mutex_unlock(&hwmgr->smu_lock);
> -
> -	return ret;
> +	return hwmgr->hwmgr_func->asic_reset(hwmgr,
> SMU_ASIC_RESET_MODE_2);
>  }
>=20
>  static int pp_smu_i2c_bus_access(void *handle, bool acquire)  {
>  	struct pp_hwmgr *hwmgr =3D handle;
> -	int ret =3D 0;
>=20
>  	if (!hwmgr || !hwmgr->pm_en)
>  		return -EINVAL;
> @@ -1588,11 +1403,7 @@ static int pp_smu_i2c_bus_access(void *handle,
> bool acquire)
>  		return -EINVAL;
>  	}
>=20
> -	mutex_lock(&hwmgr->smu_lock);
> -	ret =3D hwmgr->hwmgr_func->smu_i2c_bus_access(hwmgr, acquire);
> -	mutex_unlock(&hwmgr->smu_lock);
> -
> -	return ret;
> +	return hwmgr->hwmgr_func->smu_i2c_bus_access(hwmgr, acquire);
>  }
>=20
>  static int pp_set_df_cstate(void *handle, enum pp_df_cstate state) @@ -
> 1605,9 +1416,7 @@ static int pp_set_df_cstate(void *handle, enum
> pp_df_cstate state)
>  	if (!hwmgr->pm_en || !hwmgr->hwmgr_func->set_df_cstate)
>  		return 0;
>=20
> -	mutex_lock(&hwmgr->smu_lock);
>  	hwmgr->hwmgr_func->set_df_cstate(hwmgr, state);
> -	mutex_unlock(&hwmgr->smu_lock);
>=20
>  	return 0;
>  }
> @@ -1622,9 +1431,7 @@ static int pp_set_xgmi_pstate(void *handle,
> uint32_t pstate)
>  	if (!hwmgr->pm_en || !hwmgr->hwmgr_func->set_xgmi_pstate)
>  		return 0;
>=20
> -	mutex_lock(&hwmgr->smu_lock);
>  	hwmgr->hwmgr_func->set_xgmi_pstate(hwmgr, pstate);
> -	mutex_unlock(&hwmgr->smu_lock);
>=20
>  	return 0;
>  }
> @@ -1632,7 +1439,6 @@ static int pp_set_xgmi_pstate(void *handle,
> uint32_t pstate)  static ssize_t pp_get_gpu_metrics(void *handle, void
> **table)  {
>  	struct pp_hwmgr *hwmgr =3D handle;
> -	ssize_t size;
>=20
>  	if (!hwmgr)
>  		return -EINVAL;
> @@ -1640,11 +1446,7 @@ static ssize_t pp_get_gpu_metrics(void *handle,
> void **table)
>  	if (!hwmgr->pm_en || !hwmgr->hwmgr_func->get_gpu_metrics)
>  		return -EOPNOTSUPP;
>=20
> -	mutex_lock(&hwmgr->smu_lock);
> -	size =3D hwmgr->hwmgr_func->get_gpu_metrics(hwmgr, table);
> -	mutex_unlock(&hwmgr->smu_lock);
> -
> -	return size;
> +	return hwmgr->hwmgr_func->get_gpu_metrics(hwmgr, table);
>  }
>=20
>  static int pp_gfx_state_change_set(void *handle, uint32_t state) @@ -
> 1659,9 +1461,7 @@ static int pp_gfx_state_change_set(void *handle,
> uint32_t state)
>  		return -EINVAL;
>  	}
>=20
> -	mutex_lock(&hwmgr->smu_lock);
>  	hwmgr->hwmgr_func->gfx_state_change(hwmgr, state);
> -	mutex_unlock(&hwmgr->smu_lock);
>  	return 0;
>  }
>=20
> @@ -1675,12 +1475,10 @@ static int pp_get_prv_buffer_details(void
> *handle, void **addr, size_t *size)
>=20
>  	*addr =3D NULL;
>  	*size =3D 0;
> -	mutex_lock(&hwmgr->smu_lock);
>  	if (adev->pm.smu_prv_buffer) {
>  		amdgpu_bo_kmap(adev->pm.smu_prv_buffer, addr);
>  		*size =3D adev->pm.smu_prv_buffer_size;
>  	}
> -	mutex_unlock(&hwmgr->smu_lock);
>=20
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/inc/hwmgr.h
> b/drivers/gpu/drm/amd/pm/powerplay/inc/hwmgr.h
> index 03226baea65e..4f7f2f455301 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/inc/hwmgr.h
> +++ b/drivers/gpu/drm/amd/pm/powerplay/inc/hwmgr.h
> @@ -748,7 +748,6 @@ struct pp_hwmgr {
>  	bool not_vf;
>  	bool pm_en;
>  	bool pp_one_vf;
> -	struct mutex smu_lock;
>  	struct mutex msg_lock;
>=20
>  	uint32_t pp_table_version;
> --
> 2.29.0
