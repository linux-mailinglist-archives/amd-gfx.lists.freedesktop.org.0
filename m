Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A899846CB18
	for <lists+amd-gfx@lfdr.de>; Wed,  8 Dec 2021 03:45:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB26D6E90A;
	Wed,  8 Dec 2021 02:45:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2075.outbound.protection.outlook.com [40.107.92.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43C256E90A
 for <amd-gfx@lists.freedesktop.org>; Wed,  8 Dec 2021 02:45:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HGwI9sDSyZxYifMlyyk9dxzDP/OALdwquOBzxnfomF2revxgEtcxwaRVdkX5bkdnxtSHMLY2mzjR3YB4scHaBuoQlJN7GZ3TVPBwPeCkUtEScGBWkM0ET4f8d8YH+p11wnfvPO8aK+X3R+UjRipHSrAqHf5g5xrzS1RqjfoN9cokxFeDrpY7DKbitMICxf6jt919R0QGBTVInHDsZoKQvHRedAkMt29qE8rn/gHwl5t+GzVIlbyBpjvnyq8AitVyWjKjosQ8apR2LO+6WBxwD0Ya2kSqNcOtdbRF79rbXa+Bx0YRVFFwdi/EqyQ6n6qF13JAzNJ0sUDBAzDJaEhOBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IvStqZcCyb9ukMoV2J/qzrfrfS+PIXAbUgr0q7LMDpU=;
 b=GjhxSQxDmIVYj6Y+7Z8tBtitM0h/zGQHNVbAN9aphEz0WWhIXcVvKwhSe6S7qaXEVKTaN6k6KoV4PA2rUmdEjMcEUG3UmV7n/Rptoizd4408IIWd8KhjHI29QCHbx8IZDD0p0yhwcZFCWUN7QM4DLikbpK2p2MGslqpuWASZjbA8Xyq25EGu/12S38sV8ImHE0hJZdWIA+eYVeB5ULxq5JJfkXIsI2aoMyhLjzFHwMoVCRs4ETPZwKZFnBWrL0ApLwx8/dEmndJ/49PXkyFNolp79+rKoyllnSqqQdIezhX9TcuVy8BgUtJ69jdQU5RDEXjuA7d6bj+eNo4AEjUsMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IvStqZcCyb9ukMoV2J/qzrfrfS+PIXAbUgr0q7LMDpU=;
 b=mqMPGnM/xwM203S1D39zkEFb+CINL8DRimcEU9pUwvVMsGeg/9dp2oqSaQjQWZymkqjOBKJx5mRNOzD83oiOiuh3tCvSDuUjfk9wGOeL5QbfYajh/p9u2O0MPS+6+zeEXK+mrvr211S1jSyGe6m8zRhYzpGACoMzGVRnN64wVgI=
Received: from DM6PR12MB2619.namprd12.prod.outlook.com (2603:10b6:5:45::18) by
 DM6PR12MB4385.namprd12.prod.outlook.com (2603:10b6:5:2a6::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.11; Wed, 8 Dec 2021 02:45:48 +0000
Received: from DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::15d0:4c36:2886:bbef]) by DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::15d0:4c36:2886:bbef%3]) with mapi id 15.20.4755.024; Wed, 8 Dec 2021
 02:45:47 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH V4 17/17] drm/amd/pm: unified lock protections in
 amdgpu_dpm.c
Thread-Topic: [PATCH V4 17/17] drm/amd/pm: unified lock protections in
 amdgpu_dpm.c
Thread-Index: AQHX5/LJ4D+1UL2cPU263eD1r1iEEqwn6m8g
Date: Wed, 8 Dec 2021 02:45:47 +0000
Message-ID: <DM6PR12MB26194F86B8C35D8B10F88ACBE46F9@DM6PR12MB2619.namprd12.prod.outlook.com>
References: <20211203030540.1710564-1-evan.quan@amd.com>
 <20211203030540.1710564-17-evan.quan@amd.com>
In-Reply-To: <20211203030540.1710564-17-evan.quan@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=true;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-12-08T02:45:42Z; 
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD Official Use
 Only-AIP 2.0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ActionId=aff76f0b-6fcc-4c90-acaa-0088c066729d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 43718801-3d77-4b61-2c8c-08d9b9f4d6fa
x-ms-traffictypediagnostic: DM6PR12MB4385:EE_
x-microsoft-antispam-prvs: <DM6PR12MB438562E880469AA160AB4E43E46F9@DM6PR12MB4385.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DfNWJ9htku+FtjTSIWaaRI2yGDAcAV7LOTj4R+LxnosWiJ2Ng6fDio8RXJCr4ZG8+olOFFSLAUEICZ4jTK1vDT/HsjtaF60un64IxH3VkuOWjt98PM/Vmj9W+0mdypdidP654y4rUK2sQ6dB1HSwJW+wTMe2Q9ycXm2Le1BxXAQn89wqrSgs5+UEX4+icNG7yKOLizOCoS8Wzbe8oHLwrwssRm37V/wKn6O7nBRgrUV1EOV8HZ1oX5DbW7FvvSxkjXHCZ0UKKsQqAVvLzdIituZOl2vkPrZk1c5r0Rm9BpIo2+78vz+3MMPa1v7NkNkCQnK3D6zvvzcAb+HD5Yl4GGUuH9AfdyKzcK8iV/J7+R1MsLDIXSCTvvet37+LBJfDmp7AP9XRas+rrhPYhIMFK90Rv9BaWk4gUuqQYSYAdw9vn0LPmcws4XSJ2qmRRs5FHBq7csIPTvv4g61KjIpKr92Wj9lphJEzAT+HfB8eb/DFao3Wjsqm0p+8ztmTLGYG12I5soWgQ+MGSKFcxCIRclRqREmnqFfniuEheDwTP6omqjYSSDwzTObZp1g7Hu35Q7NT3m8JF466SyLBO/QS3ZIVIfpuKTuD/A8KQotHzwyqy7MklJGcus04g8f70Pjrc+1h11Sxyr9kYnF3quAgSTdXpSJGYj2E6uld08g8/rtXPb6wbuFl76m5Jek449cldiZnqcTnHv9ovx6NwNSoBg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2619.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66946007)(66556008)(66446008)(508600001)(26005)(33656002)(52536014)(76116006)(9686003)(38100700002)(122000001)(38070700005)(64756008)(6506007)(66476007)(6916009)(186003)(53546011)(30864003)(83380400001)(4326008)(86362001)(71200400001)(55016003)(5660300002)(8936002)(54906003)(8676002)(7696005)(316002)(2906002)(559001)(579004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2nRXMzMb2HKp/MfdpSRmGSWNsSme1KP3sAfHvQ3NymPkeVJCfoJiHEtYEkfZ?=
 =?us-ascii?Q?/1Y/V25v4YleSChsNKAD3p+wBH/Ux3ztJlCR3C2UwOZKf+WBflpKTHxaDTDh?=
 =?us-ascii?Q?R4C3rZY3I4oz+5JOUeC/bIhZSATZ/POch8PMY1T2Ni8SguJAdco3fQA5AMAN?=
 =?us-ascii?Q?MROUFzJByEo2agAA9nerbvR9UwYiDhGdl1UvqqlqolwBB1jSP9j8BrPsRQdi?=
 =?us-ascii?Q?6j+zLab03lg9fm4fDV1s0OF9rrIjEs9PPBYAXy9fu9ofbXEQbQG9MaXuKgqp?=
 =?us-ascii?Q?j9Hi7sUXlzc6b0lPKCctym9lnqg3Lvv77ygioji8/6HfWtYVb+EJOo+Y5HVB?=
 =?us-ascii?Q?VPHuYu9UJIzjoT6RfBjMZaGWpEEOpH45/E5YaSoef/SEUcvy0Jh4OdX29YAW?=
 =?us-ascii?Q?R+5o9I6aj83UECIi7x4mfnoQfBuGPFR0ed4wwZ+kVBPeiRLG51Esdv8pWlxV?=
 =?us-ascii?Q?vpUiO2mBoqEWGkiTtWizYejxyTKxrx04g+anlcZrcvdZ8I6dV39OhIGhoMn/?=
 =?us-ascii?Q?BIR3j+tidGVP/rM74VEq1IgmMDSZfOuBIkyA7QMI98oLDKoDhq+DSiKQZxfx?=
 =?us-ascii?Q?joepIRFCmrc+SP0obRd25lkcHlYXHmO738S6IYGQS8G3NzFVyEk/GtXUOy/4?=
 =?us-ascii?Q?8R6DbjmE3NO9RwOjTuxy92RIag7htYSF7Vf4A3g+ZW7N4rqnRCVgdUCggmcj?=
 =?us-ascii?Q?4aR8iykNY11LzqcjgNYI9FfyuU/HR4dZEsMB+o7JPa9gfP9TtwXYsaT2QTkH?=
 =?us-ascii?Q?5pDTtEY3bCoEGYAJduTIsZd4CrLQWCGV12DgO1yqNDsfsS2QbA3fr8tTUGQ8?=
 =?us-ascii?Q?wXdGV8x8/WT6F9oNED5NA3c3Q4zodrR14mC6aPnqHFMXPnUQkYliOdLWDs5D?=
 =?us-ascii?Q?DceQFAcm/MgA9oMgrigPhMqH3oiv3mqihHLW2BmIa74VrMrLywpyIpxXVguI?=
 =?us-ascii?Q?U6NkNx2kC+h5Lg1+1qR4uL66I/BYfossP/nDMC6BsHz+bVZ8Sx93aA1vGryk?=
 =?us-ascii?Q?Wmq1glnCLFtUeKUbLv76QIku26BrcOMGWbdf6UprrtrAvhfWL3zOOnOhQLHl?=
 =?us-ascii?Q?TysjCrG6C4AqZmL9yp+jbdIXfY7Avtw7FqzPqEdFj/+eEt+03mxCA/jJbMIx?=
 =?us-ascii?Q?8vz2awAduHfshhWs2TjKVsZCLojVvwAmO/dV8eFP8nQ7FRs0sK5fQ6Slf/Zb?=
 =?us-ascii?Q?pBzshFJ+5yU3ZWZSIXS+nrJ6NaMl1L1mM/5p8CpTWs8Xz5yFD6bgQmAe/fUW?=
 =?us-ascii?Q?2nO3aySz5rK+vNgc3ToG4x6r8J43Q4HEdBvtxdkVCzJF1xomj+u0/g4qLdYd?=
 =?us-ascii?Q?3s9xzxWAyxjsAbZfrYcDYb3x5IYQ9K/O9zWplZxHC7F+63gEjaK2+hIPtnSV?=
 =?us-ascii?Q?ac6gjxgAosYo0LbVu40dpfYGJZzjG1lQBC+BG+WDPc+QqDxbjFqRaAPlLXhd?=
 =?us-ascii?Q?U4ypwoZh+b42+ijuZrpZYIeeyPj70x+opGsgS9mHe+q2oKI/7Z/D4EJTSOLv?=
 =?us-ascii?Q?lj0WoyYf3ApoJ1w0dSv3xCTphzdXhuq85xX+jmWdX5rFgMNbjvc0UOWX4oU0?=
 =?us-ascii?Q?/I9y2jGbG/nseyrtuRA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2619.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43718801-3d77-4b61-2c8c-08d9b9f4d6fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2021 02:45:47.7275 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mNnUdkhHpd2FRsyLPaS4QncPDTm9Qz+ONYW6RfyoYcVlKB6H27TOkVNU4x6u1gc2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4385
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
 Lijo" <Lijo.Lazar@amd.com>, "Feng, 
 Kenneth" <Kenneth.Feng@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

[AMD Official Use Only]

Hi Alex & Lijo,

Please help to review this patch series and share your comments if any.
Need to get this landed to unblock further optimization.

BR
Evan
> -----Original Message-----
> From: Quan, Evan <Evan.Quan@amd.com>
> Sent: Friday, December 3, 2021 11:06 AM
> To: amd-gfx@lists.freedesktop.org
> Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian
> <Christian.Koenig@amd.com>; Lazar, Lijo <Lijo.Lazar@amd.com>; Feng,
> Kenneth <Kenneth.Feng@amd.com>; Quan, Evan <Evan.Quan@amd.com>
> Subject: [PATCH V4 17/17] drm/amd/pm: unified lock protections in
> amdgpu_dpm.c
>=20
> As the only entry point, it's now safe and reasonable to enforce the lock
> protections in amdgpu_dpm.c. And with this, we can drop other internal
> used power locks.
>=20
> Signed-off-by: Evan Quan <evan.quan@amd.com>
> Change-Id: Iad228cad0b3d8c41927def08965a52525f3f51d3
> ---
>  drivers/gpu/drm/amd/pm/amdgpu_dpm.c        | 719 +++++++++++++++-----
> -
>  drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c |  16 +-
> drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c |  16 +-
>  3 files changed, 536 insertions(+), 215 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/amd/pm/amdgpu_dpm.c
> b/drivers/gpu/drm/amd/pm/amdgpu_dpm.c
> index b58a5749538d..97acabe6b046 100644
> --- a/drivers/gpu/drm/amd/pm/amdgpu_dpm.c
> +++ b/drivers/gpu/drm/amd/pm/amdgpu_dpm.c
> @@ -39,15 +39,33 @@
>  int amdgpu_dpm_get_sclk(struct amdgpu_device *adev, bool low)  {
>  	const struct amd_pm_funcs *pp_funcs =3D adev->powerplay.pp_funcs;
> +	int ret =3D 0;
> +
> +	if (!pp_funcs->get_sclk)
> +		return 0;
>=20
> -	return pp_funcs->get_sclk((adev)->powerplay.pp_handle, (low));
> +	mutex_lock(&adev->pm.mutex);
> +	ret =3D pp_funcs->get_sclk((adev)->powerplay.pp_handle,
> +				 low);
> +	mutex_unlock(&adev->pm.mutex);
> +
> +	return ret;
>  }
>=20
>  int amdgpu_dpm_get_mclk(struct amdgpu_device *adev, bool low)  {
>  	const struct amd_pm_funcs *pp_funcs =3D adev->powerplay.pp_funcs;
> +	int ret =3D 0;
> +
> +	if (!pp_funcs->get_mclk)
> +		return 0;
> +
> +	mutex_lock(&adev->pm.mutex);
> +	ret =3D pp_funcs->get_mclk((adev)->powerplay.pp_handle,
> +				 low);
> +	mutex_unlock(&adev->pm.mutex);
>=20
> -	return pp_funcs->get_mclk((adev)->powerplay.pp_handle, (low));
> +	return ret;
>  }
>=20
>  int amdgpu_dpm_set_powergating_by_smu(struct amdgpu_device *adev,
> uint32_t block_type, bool gate) @@ -62,52 +80,20 @@ int
> amdgpu_dpm_set_powergating_by_smu(struct amdgpu_device *adev,
> uint32_t block
>  		return 0;
>  	}
>=20
> +	mutex_lock(&adev->pm.mutex);
> +
>  	switch (block_type) {
>  	case AMD_IP_BLOCK_TYPE_UVD:
>  	case AMD_IP_BLOCK_TYPE_VCE:
> -		if (pp_funcs && pp_funcs->set_powergating_by_smu) {
> -			/*
> -			 * TODO: need a better lock mechanism
> -			 *
> -			 * Here adev->pm.mutex lock protection is enforced
> on
> -			 * UVD and VCE cases only. Since for other cases,
> there
> -			 * may be already lock protection in amdgpu_pm.c.
> -			 * This is a quick fix for the deadlock issue below.
> -			 *     NFO: task ocltst:2028 blocked for more than 120
> seconds.
> -			 *     Tainted: G           OE     5.0.0-37-generic
> #40~18.04.1-Ubuntu
> -			 *     echo 0 >
> /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> -			 *     cltst          D    0  2028   2026 0x00000000
> -			 *     all Trace:
> -			 *     __schedule+0x2c0/0x870
> -			 *     schedule+0x2c/0x70
> -			 *     schedule_preempt_disabled+0xe/0x10
> -			 *     __mutex_lock.isra.9+0x26d/0x4e0
> -			 *     __mutex_lock_slowpath+0x13/0x20
> -			 *     ? __mutex_lock_slowpath+0x13/0x20
> -			 *     mutex_lock+0x2f/0x40
> -			 *
> amdgpu_dpm_set_powergating_by_smu+0x64/0xe0 [amdgpu]
> -			 *
> gfx_v8_0_enable_gfx_static_mg_power_gating+0x3c/0x70 [amdgpu]
> -			 *     gfx_v8_0_set_powergating_state+0x66/0x260
> [amdgpu]
> -			 *
> amdgpu_device_ip_set_powergating_state+0x62/0xb0 [amdgpu]
> -			 *     pp_dpm_force_performance_level+0xe7/0x100
> [amdgpu]
> -			 *
> amdgpu_set_dpm_forced_performance_level+0x129/0x330 [amdgpu]
> -			 */
> -			mutex_lock(&adev->pm.mutex);
> -			ret =3D (pp_funcs->set_powergating_by_smu(
> -				(adev)->powerplay.pp_handle, block_type,
> gate));
> -			mutex_unlock(&adev->pm.mutex);
> -		}
> -		break;
>  	case AMD_IP_BLOCK_TYPE_GFX:
>  	case AMD_IP_BLOCK_TYPE_VCN:
>  	case AMD_IP_BLOCK_TYPE_SDMA:
>  	case AMD_IP_BLOCK_TYPE_JPEG:
>  	case AMD_IP_BLOCK_TYPE_GMC:
>  	case AMD_IP_BLOCK_TYPE_ACP:
> -		if (pp_funcs && pp_funcs->set_powergating_by_smu) {
> +		if (pp_funcs && pp_funcs->set_powergating_by_smu)
>  			ret =3D (pp_funcs->set_powergating_by_smu(
>  				(adev)->powerplay.pp_handle, block_type,
> gate));
> -		}
>  		break;
>  	default:
>  		break;
> @@ -116,6 +102,8 @@ int amdgpu_dpm_set_powergating_by_smu(struct
> amdgpu_device *adev, uint32_t block
>  	if (!ret)
>  		atomic_set(&adev->pm.pwr_state[block_type], pwr_state);
>=20
> +	mutex_unlock(&adev->pm.mutex);
> +
>  	return ret;
>  }
>=20
> @@ -128,9 +116,13 @@ int amdgpu_dpm_baco_enter(struct
> amdgpu_device *adev)
>  	if (!pp_funcs || !pp_funcs->set_asic_baco_state)
>  		return -ENOENT;
>=20
> +	mutex_lock(&adev->pm.mutex);
> +
>  	/* enter BACO state */
>  	ret =3D pp_funcs->set_asic_baco_state(pp_handle, 1);
>=20
> +	mutex_unlock(&adev->pm.mutex);
> +
>  	return ret;
>  }
>=20
> @@ -143,9 +135,13 @@ int amdgpu_dpm_baco_exit(struct amdgpu_device
> *adev)
>  	if (!pp_funcs || !pp_funcs->set_asic_baco_state)
>  		return -ENOENT;
>=20
> +	mutex_lock(&adev->pm.mutex);
> +
>  	/* exit BACO state */
>  	ret =3D pp_funcs->set_asic_baco_state(pp_handle, 0);
>=20
> +	mutex_unlock(&adev->pm.mutex);
> +
>  	return ret;
>  }
>=20
> @@ -156,9 +152,13 @@ int amdgpu_dpm_set_mp1_state(struct
> amdgpu_device *adev,
>  	const struct amd_pm_funcs *pp_funcs =3D adev->powerplay.pp_funcs;
>=20
>  	if (pp_funcs && pp_funcs->set_mp1_state) {
> +		mutex_lock(&adev->pm.mutex);
> +
>  		ret =3D pp_funcs->set_mp1_state(
>  				adev->powerplay.pp_handle,
>  				mp1_state);
> +
> +		mutex_unlock(&adev->pm.mutex);
>  	}
>=20
>  	return ret;
> @@ -169,25 +169,37 @@ bool amdgpu_dpm_is_baco_supported(struct
> amdgpu_device *adev)
>  	const struct amd_pm_funcs *pp_funcs =3D adev->powerplay.pp_funcs;
>  	void *pp_handle =3D adev->powerplay.pp_handle;
>  	bool baco_cap;
> +	int ret =3D 0;
>=20
>  	if (!pp_funcs || !pp_funcs->get_asic_baco_capability)
>  		return false;
>=20
> -	if (pp_funcs->get_asic_baco_capability(pp_handle, &baco_cap))
> -		return false;
> +	mutex_lock(&adev->pm.mutex);
> +
> +	ret =3D pp_funcs->get_asic_baco_capability(pp_handle,
> +						 &baco_cap);
>=20
> -	return baco_cap;
> +	mutex_unlock(&adev->pm.mutex);
> +
> +	return ret ? false : baco_cap;
>  }
>=20
>  int amdgpu_dpm_mode2_reset(struct amdgpu_device *adev)  {
>  	const struct amd_pm_funcs *pp_funcs =3D adev->powerplay.pp_funcs;
>  	void *pp_handle =3D adev->powerplay.pp_handle;
> +	int ret =3D 0;
>=20
>  	if (!pp_funcs || !pp_funcs->asic_reset_mode_2)
>  		return -ENOENT;
>=20
> -	return pp_funcs->asic_reset_mode_2(pp_handle);
> +	mutex_lock(&adev->pm.mutex);
> +
> +	ret =3D pp_funcs->asic_reset_mode_2(pp_handle);
> +
> +	mutex_unlock(&adev->pm.mutex);
> +
> +	return ret;
>  }
>=20
>  int amdgpu_dpm_baco_reset(struct amdgpu_device *adev) @@ -199,37
> +211,47 @@ int amdgpu_dpm_baco_reset(struct amdgpu_device *adev)
>  	if (!pp_funcs || !pp_funcs->set_asic_baco_state)
>  		return -ENOENT;
>=20
> +	mutex_lock(&adev->pm.mutex);
> +
>  	/* enter BACO state */
>  	ret =3D pp_funcs->set_asic_baco_state(pp_handle, 1);
>  	if (ret)
> -		return ret;
> +		goto out;
>=20
>  	/* exit BACO state */
>  	ret =3D pp_funcs->set_asic_baco_state(pp_handle, 0);
> -	if (ret)
> -		return ret;
>=20
> -	return 0;
> +out:
> +	mutex_unlock(&adev->pm.mutex);
> +	return ret;
>  }
>=20
>  bool amdgpu_dpm_is_mode1_reset_supported(struct amdgpu_device
> *adev)  {
>  	struct smu_context *smu =3D adev->powerplay.pp_handle;
> +	bool support_mode1_reset =3D false;
>=20
> -	if (is_support_sw_smu(adev))
> -		return smu_mode1_reset_is_support(smu);
> +	if (is_support_sw_smu(adev)) {
> +		mutex_lock(&adev->pm.mutex);
> +		support_mode1_reset =3D
> smu_mode1_reset_is_support(smu);
> +		mutex_unlock(&adev->pm.mutex);
> +	}
>=20
> -	return false;
> +	return support_mode1_reset;
>  }
>=20
>  int amdgpu_dpm_mode1_reset(struct amdgpu_device *adev)  {
>  	struct smu_context *smu =3D adev->powerplay.pp_handle;
> +	int ret =3D -EOPNOTSUPP;
>=20
> -	if (is_support_sw_smu(adev))
> -		return smu_mode1_reset(smu);
> +	if (is_support_sw_smu(adev)) {
> +		mutex_lock(&adev->pm.mutex);
> +		ret =3D smu_mode1_reset(smu);
> +		mutex_unlock(&adev->pm.mutex);
> +	}
>=20
> -	return -EOPNOTSUPP;
> +	return ret;
>  }
>=20
>  int amdgpu_dpm_switch_power_profile(struct amdgpu_device *adev, @@
> -242,9 +264,12 @@ int amdgpu_dpm_switch_power_profile(struct
> amdgpu_device *adev,
>  	if (amdgpu_sriov_vf(adev))
>  		return 0;
>=20
> -	if (pp_funcs && pp_funcs->switch_power_profile)
> +	if (pp_funcs && pp_funcs->switch_power_profile) {
> +		mutex_lock(&adev->pm.mutex);
>  		ret =3D pp_funcs->switch_power_profile(
>  			adev->powerplay.pp_handle, type, en);
> +		mutex_unlock(&adev->pm.mutex);
> +	}
>=20
>  	return ret;
>  }
> @@ -255,9 +280,12 @@ int amdgpu_dpm_set_xgmi_pstate(struct
> amdgpu_device *adev,
>  	const struct amd_pm_funcs *pp_funcs =3D adev->powerplay.pp_funcs;
>  	int ret =3D 0;
>=20
> -	if (pp_funcs && pp_funcs->set_xgmi_pstate)
> +	if (pp_funcs && pp_funcs->set_xgmi_pstate) {
> +		mutex_lock(&adev->pm.mutex);
>  		ret =3D pp_funcs->set_xgmi_pstate(adev-
> >powerplay.pp_handle,
>  								pstate);
> +		mutex_unlock(&adev->pm.mutex);
> +	}
>=20
>  	return ret;
>  }
> @@ -269,8 +297,11 @@ int amdgpu_dpm_set_df_cstate(struct
> amdgpu_device *adev,
>  	const struct amd_pm_funcs *pp_funcs =3D adev->powerplay.pp_funcs;
>  	void *pp_handle =3D adev->powerplay.pp_handle;
>=20
> -	if (pp_funcs && pp_funcs->set_df_cstate)
> +	if (pp_funcs && pp_funcs->set_df_cstate) {
> +		mutex_lock(&adev->pm.mutex);
>  		ret =3D pp_funcs->set_df_cstate(pp_handle, cstate);
> +		mutex_unlock(&adev->pm.mutex);
> +	}
>=20
>  	return ret;
>  }
> @@ -278,11 +309,15 @@ int amdgpu_dpm_set_df_cstate(struct
> amdgpu_device *adev,  int amdgpu_dpm_allow_xgmi_power_down(struct
> amdgpu_device *adev, bool en)  {
>  	struct smu_context *smu =3D adev->powerplay.pp_handle;
> +	int ret =3D 0;
>=20
> -	if (is_support_sw_smu(adev))
> -		return smu_allow_xgmi_power_down(smu, en);
> +	if (is_support_sw_smu(adev)) {
> +		mutex_lock(&adev->pm.mutex);
> +		ret =3D smu_allow_xgmi_power_down(smu, en);
> +		mutex_unlock(&adev->pm.mutex);
> +	}
>=20
> -	return 0;
> +	return ret;
>  }
>=20
>  int amdgpu_dpm_enable_mgpu_fan_boost(struct amdgpu_device *adev)
> @@ -292,8 +327,11 @@ int amdgpu_dpm_enable_mgpu_fan_boost(struct
> amdgpu_device *adev)
>  			adev->powerplay.pp_funcs;
>  	int ret =3D 0;
>=20
> -	if (pp_funcs && pp_funcs->enable_mgpu_fan_boost)
> +	if (pp_funcs && pp_funcs->enable_mgpu_fan_boost) {
> +		mutex_lock(&adev->pm.mutex);
>  		ret =3D pp_funcs->enable_mgpu_fan_boost(pp_handle);
> +		mutex_unlock(&adev->pm.mutex);
> +	}
>=20
>  	return ret;
>  }
> @@ -306,9 +344,12 @@ int amdgpu_dpm_set_clockgating_by_smu(struct
> amdgpu_device *adev,
>  			adev->powerplay.pp_funcs;
>  	int ret =3D 0;
>=20
> -	if (pp_funcs && pp_funcs->set_clockgating_by_smu)
> +	if (pp_funcs && pp_funcs->set_clockgating_by_smu) {
> +		mutex_lock(&adev->pm.mutex);
>  		ret =3D pp_funcs->set_clockgating_by_smu(pp_handle,
>  						       msg_id);
> +		mutex_unlock(&adev->pm.mutex);
> +	}
>=20
>  	return ret;
>  }
> @@ -321,9 +362,12 @@ int amdgpu_dpm_smu_i2c_bus_access(struct
> amdgpu_device *adev,
>  			adev->powerplay.pp_funcs;
>  	int ret =3D -EOPNOTSUPP;
>=20
> -	if (pp_funcs && pp_funcs->smu_i2c_bus_access)
> +	if (pp_funcs && pp_funcs->smu_i2c_bus_access) {
> +		mutex_lock(&adev->pm.mutex);
>  		ret =3D pp_funcs->smu_i2c_bus_access(pp_handle,
>  						   acquire);
> +		mutex_unlock(&adev->pm.mutex);
> +	}
>=20
>  	return ret;
>  }
> @@ -336,13 +380,15 @@ void amdgpu_pm_acpi_event_handler(struct
> amdgpu_device *adev)
>  			adev->pm.ac_power =3D true;
>  		else
>  			adev->pm.ac_power =3D false;
> +
>  		if (adev->powerplay.pp_funcs &&
>  		    adev->powerplay.pp_funcs->enable_bapm)
>  			amdgpu_dpm_enable_bapm(adev, adev-
> >pm.ac_power);
> -		mutex_unlock(&adev->pm.mutex);
>=20
>  		if (is_support_sw_smu(adev))
>  			smu_set_ac_dc(adev->powerplay.pp_handle);
> +
> +		mutex_unlock(&adev->pm.mutex);
>  	}
>  }
>=20
> @@ -350,16 +396,19 @@ int amdgpu_dpm_read_sensor(struct
> amdgpu_device *adev, enum amd_pp_sensors senso
>  			   void *data, uint32_t *size)
>  {
>  	const struct amd_pm_funcs *pp_funcs =3D adev->powerplay.pp_funcs;
> -	int ret =3D 0;
> +	int ret =3D -EINVAL;
>=20
>  	if (!data || !size)
>  		return -EINVAL;
>=20
> -	if (pp_funcs && pp_funcs->read_sensor)
> -		ret =3D pp_funcs->read_sensor((adev)->powerplay.pp_handle,
> -								    sensor,
> data, size);
> -	else
> -		ret =3D -EINVAL;
> +	if (pp_funcs && pp_funcs->read_sensor) {
> +		mutex_lock(&adev->pm.mutex);
> +		ret =3D pp_funcs->read_sensor(adev->powerplay.pp_handle,
> +					    sensor,
> +					    data,
> +					    size);
> +		mutex_unlock(&adev->pm.mutex);
> +	}
>=20
>  	return ret;
>  }
> @@ -374,7 +423,9 @@ void amdgpu_dpm_compute_clocks(struct
> amdgpu_device *adev)
>  	if (!pp_funcs->pm_compute_clocks)
>  		return;
>=20
> +	mutex_lock(&adev->pm.mutex);
>  	pp_funcs->pm_compute_clocks(adev->powerplay.pp_handle);
> +	mutex_unlock(&adev->pm.mutex);
>  }
>=20
>  void amdgpu_dpm_enable_uvd(struct amdgpu_device *adev, bool enable)
> @@ -409,32 +460,51 @@ void amdgpu_dpm_enable_jpeg(struct
> amdgpu_device *adev, bool enable)
>=20
>  int amdgpu_pm_load_smu_firmware(struct amdgpu_device *adev,
> uint32_t *smu_version)  {
> -	int r;
> +	const struct amd_pm_funcs *pp_funcs =3D adev->powerplay.pp_funcs;
> +	int r =3D 0;
>=20
> -	if (adev->powerplay.pp_funcs && adev->powerplay.pp_funcs-
> >load_firmware) {
> -		r =3D adev->powerplay.pp_funcs->load_firmware(adev-
> >powerplay.pp_handle);
> -		if (r) {
> -			pr_err("smu firmware loading failed\n");
> -			return r;
> -		}
> +	if (!pp_funcs->load_firmware)
> +		return 0;
>=20
> -		if (smu_version)
> -			*smu_version =3D adev->pm.fw_version;
> +	mutex_lock(&adev->pm.mutex);
> +	r =3D pp_funcs->load_firmware(adev->powerplay.pp_handle);
> +	if (r) {
> +		pr_err("smu firmware loading failed\n");
> +		goto out;
>  	}
>=20
> -	return 0;
> +	if (smu_version)
> +		*smu_version =3D adev->pm.fw_version;
> +
> +out:
> +	mutex_unlock(&adev->pm.mutex);
> +	return r;
>  }
>=20
>  int amdgpu_dpm_set_light_sbr(struct amdgpu_device *adev, bool enable)
> {
> -	return smu_set_light_sbr(adev->powerplay.pp_handle, enable);
> +	int ret =3D 0;
> +
> +	if (is_support_sw_smu(adev)) {
> +		mutex_lock(&adev->pm.mutex);
> +		ret =3D smu_set_light_sbr(adev->powerplay.pp_handle,
> +					enable);
> +		mutex_unlock(&adev->pm.mutex);
> +	}
> +
> +	return ret;
>  }
>=20
>  int amdgpu_dpm_send_hbm_bad_pages_num(struct amdgpu_device
> *adev, uint32_t size)  {
>  	struct smu_context *smu =3D adev->powerplay.pp_handle;
> +	int ret =3D 0;
>=20
> -	return smu_send_hbm_bad_pages_num(smu, size);
> +	mutex_lock(&adev->pm.mutex);
> +	ret =3D smu_send_hbm_bad_pages_num(smu, size);
> +	mutex_unlock(&adev->pm.mutex);
> +
> +	return ret;
>  }
>=20
>  int amdgpu_dpm_get_dpm_freq_range(struct amdgpu_device *adev, @@
> -442,15 +512,22 @@ int amdgpu_dpm_get_dpm_freq_range(struct
> amdgpu_device *adev,
>  				  uint32_t *min,
>  				  uint32_t *max)
>  {
> +	int ret =3D 0;
> +
> +	if (type !=3D PP_SCLK)
> +		return -EINVAL;
> +
>  	if (!is_support_sw_smu(adev))
>  		return -EOPNOTSUPP;
>=20
> -	switch (type) {
> -	case PP_SCLK:
> -		return smu_get_dpm_freq_range(adev-
> >powerplay.pp_handle, SMU_SCLK, min, max);
> -	default:
> -		return -EINVAL;
> -	}
> +	mutex_lock(&adev->pm.mutex);
> +	ret =3D smu_get_dpm_freq_range(adev->powerplay.pp_handle,
> +				     SMU_SCLK,
> +				     min,
> +				     max);
> +	mutex_unlock(&adev->pm.mutex);
> +
> +	return ret;
>  }
>=20
>  int amdgpu_dpm_set_soft_freq_range(struct amdgpu_device *adev, @@ -
> 459,26 +536,37 @@ int amdgpu_dpm_set_soft_freq_range(struct
> amdgpu_device *adev,
>  				   uint32_t max)
>  {
>  	struct smu_context *smu =3D adev->powerplay.pp_handle;
> +	int ret =3D 0;
> +
> +	if (type !=3D PP_SCLK)
> +		return -EINVAL;
>=20
>  	if (!is_support_sw_smu(adev))
>  		return -EOPNOTSUPP;
>=20
> -	switch (type) {
> -	case PP_SCLK:
> -		return smu_set_soft_freq_range(smu, SMU_SCLK, min,
> max);
> -	default:
> -		return -EINVAL;
> -	}
> +	mutex_lock(&adev->pm.mutex);
> +	ret =3D smu_set_soft_freq_range(smu,
> +				      SMU_SCLK,
> +				      min,
> +				      max);
> +	mutex_unlock(&adev->pm.mutex);
> +
> +	return ret;
>  }
>=20
>  int amdgpu_dpm_write_watermarks_table(struct amdgpu_device *adev)  {
>  	struct smu_context *smu =3D adev->powerplay.pp_handle;
> +	int ret =3D 0;
>=20
>  	if (!is_support_sw_smu(adev))
>  		return 0;
>=20
> -	return smu_write_watermarks_table(smu);
> +	mutex_lock(&adev->pm.mutex);
> +	ret =3D smu_write_watermarks_table(smu);
> +	mutex_unlock(&adev->pm.mutex);
> +
> +	return ret;
>  }
>=20
>  int amdgpu_dpm_wait_for_event(struct amdgpu_device *adev, @@ -
> 486,27 +574,40 @@ int amdgpu_dpm_wait_for_event(struct
> amdgpu_device *adev,
>  			      uint64_t event_arg)
>  {
>  	struct smu_context *smu =3D adev->powerplay.pp_handle;
> +	int ret =3D 0;
>=20
>  	if (!is_support_sw_smu(adev))
>  		return -EOPNOTSUPP;
>=20
> -	return smu_wait_for_event(smu, event, event_arg);
> +	mutex_lock(&adev->pm.mutex);
> +	ret =3D smu_wait_for_event(smu, event, event_arg);
> +	mutex_unlock(&adev->pm.mutex);
> +
> +	return ret;
>  }
>=20
>  int amdgpu_dpm_get_status_gfxoff(struct amdgpu_device *adev, uint32_t
> *value)  {
>  	struct smu_context *smu =3D adev->powerplay.pp_handle;
> +	int ret =3D 0;
>=20
>  	if (!is_support_sw_smu(adev))
>  		return -EOPNOTSUPP;
>=20
> -	return smu_get_status_gfxoff(smu, value);
> +	mutex_lock(&adev->pm.mutex);
> +	ret =3D smu_get_status_gfxoff(smu, value);
> +	mutex_unlock(&adev->pm.mutex);
> +
> +	return ret;
>  }
>=20
>  uint64_t amdgpu_dpm_get_thermal_throttling_counter(struct
> amdgpu_device *adev)  {
>  	struct smu_context *smu =3D adev->powerplay.pp_handle;
>=20
> +	if (!is_support_sw_smu(adev))
> +		return 0;
> +
>  	return atomic64_read(&smu->throttle_int_counter);
>  }
>=20
> @@ -541,12 +642,17 @@ struct amd_vce_state
> *amdgpu_dpm_get_vce_clock_state(struct amdgpu_device *adev,
>  						     uint32_t idx)
>  {
>  	const struct amd_pm_funcs *pp_funcs =3D adev->powerplay.pp_funcs;
> +	struct amd_vce_state *vstate =3D NULL;
>=20
>  	if (!pp_funcs->get_vce_clock_state)
>  		return NULL;
>=20
> -	return pp_funcs->get_vce_clock_state(adev->powerplay.pp_handle,
> -					     idx);
> +	mutex_lock(&adev->pm.mutex);
> +	vstate =3D pp_funcs->get_vce_clock_state(adev-
> >powerplay.pp_handle,
> +					       idx);
> +	mutex_unlock(&adev->pm.mutex);
> +
> +	return vstate;
>  }
>=20
>  void amdgpu_dpm_get_current_power_state(struct amdgpu_device *adev,
> @@ -554,21 +660,28 @@ void
> amdgpu_dpm_get_current_power_state(struct amdgpu_device *adev,  {
>  	const struct amd_pm_funcs *pp_funcs =3D adev->powerplay.pp_funcs;
>=20
> +	mutex_lock(&adev->pm.mutex);
> +
>  	if (!pp_funcs->get_current_power_state) {
>  		*state =3D adev->pm.dpm.user_state;
> -		return;
> +		goto out;
>  	}
>=20
>  	*state =3D pp_funcs->get_current_power_state(adev-
> >powerplay.pp_handle);
>  	if (*state < POWER_STATE_TYPE_DEFAULT ||
>  	    *state > POWER_STATE_TYPE_INTERNAL_3DPERF)
>  		*state =3D adev->pm.dpm.user_state;
> +
> +out:
> +	mutex_unlock(&adev->pm.mutex);
>  }
>=20
>  void amdgpu_dpm_set_power_state(struct amdgpu_device *adev,
>  				enum amd_pm_state_type state)
>  {
> +	mutex_lock(&adev->pm.mutex);
>  	adev->pm.dpm.user_state =3D state;
> +	mutex_unlock(&adev->pm.mutex);
>  }
>=20
>  enum amd_dpm_forced_level
> amdgpu_dpm_get_performance_level(struct amdgpu_device *adev) @@ -
> 576,10 +689,12 @@ enum amd_dpm_forced_level
> amdgpu_dpm_get_performance_level(struct amdgpu_device
>  	const struct amd_pm_funcs *pp_funcs =3D adev->powerplay.pp_funcs;
>  	enum amd_dpm_forced_level level;
>=20
> +	mutex_lock(&adev->pm.mutex);
>  	if (pp_funcs->get_performance_level)
>  		level =3D pp_funcs->get_performance_level(adev-
> >powerplay.pp_handle);
>  	else
>  		level =3D adev->pm.dpm.forced_level;
> +	mutex_unlock(&adev->pm.mutex);
>=20
>  	return level;
>  }
> @@ -588,30 +703,46 @@ int amdgpu_dpm_force_performance_level(struct
> amdgpu_device *adev,
>  				       enum amd_dpm_forced_level level)  {
>  	const struct amd_pm_funcs *pp_funcs =3D adev->powerplay.pp_funcs;
> +	int ret =3D 0;
>=20
> -	if (pp_funcs->force_performance_level) {
> -		if (adev->pm.dpm.thermal_active)
> -			return -EINVAL;
> +	mutex_lock(&adev->pm.mutex);
> +
> +	if (!pp_funcs->force_performance_level)
> +		goto out;
>=20
> -		if (pp_funcs->force_performance_level(adev-
> >powerplay.pp_handle,
> -						      level))
> -			return -EINVAL;
> +	if (adev->pm.dpm.thermal_active) {
> +		ret =3D -EINVAL;
> +		goto out;
>  	}
>=20
> -	adev->pm.dpm.forced_level =3D level;
> +	if (pp_funcs->force_performance_level(adev-
> >powerplay.pp_handle,
> +					      level))
> +		ret =3D -EINVAL;
>=20
> -	return 0;
> +out:
> +	if (!ret)
> +		adev->pm.dpm.forced_level =3D level;
> +
> +	mutex_unlock(&adev->pm.mutex);
> +
> +	return ret;
>  }
>=20
>  int amdgpu_dpm_get_pp_num_states(struct amdgpu_device *adev,
>  				 struct pp_states_info *states)
>  {
>  	const struct amd_pm_funcs *pp_funcs =3D adev->powerplay.pp_funcs;
> +	int ret =3D 0;
>=20
>  	if (!pp_funcs->get_pp_num_states)
>  		return -EOPNOTSUPP;
>=20
> -	return pp_funcs->get_pp_num_states(adev->powerplay.pp_handle,
> states);
> +	mutex_lock(&adev->pm.mutex);
> +	ret =3D pp_funcs->get_pp_num_states(adev->powerplay.pp_handle,
> +					  states);
> +	mutex_unlock(&adev->pm.mutex);
> +
> +	return ret;
>  }
>=20
>  int amdgpu_dpm_dispatch_task(struct amdgpu_device *adev, @@ -619,21
> +750,34 @@ int amdgpu_dpm_dispatch_task(struct amdgpu_device *adev,
>  			      enum amd_pm_state_type *user_state)  {
>  	const struct amd_pm_funcs *pp_funcs =3D adev->powerplay.pp_funcs;
> +	int ret =3D 0;
>=20
>  	if (!pp_funcs->dispatch_tasks)
>  		return -EOPNOTSUPP;
>=20
> -	return pp_funcs->dispatch_tasks(adev->powerplay.pp_handle,
> task_id, user_state);
> +	mutex_lock(&adev->pm.mutex);
> +	ret =3D pp_funcs->dispatch_tasks(adev->powerplay.pp_handle,
> +				       task_id,
> +				       user_state);
> +	mutex_unlock(&adev->pm.mutex);
> +
> +	return ret;
>  }
>=20
>  int amdgpu_dpm_get_pp_table(struct amdgpu_device *adev, char **table)
> {
>  	const struct amd_pm_funcs *pp_funcs =3D adev->powerplay.pp_funcs;
> +	int ret =3D 0;
>=20
>  	if (!pp_funcs->get_pp_table)
>  		return 0;
>=20
> -	return pp_funcs->get_pp_table(adev->powerplay.pp_handle, table);
> +	mutex_lock(&adev->pm.mutex);
> +	ret =3D pp_funcs->get_pp_table(adev->powerplay.pp_handle,
> +				     table);
> +	mutex_unlock(&adev->pm.mutex);
> +
> +	return ret;
>  }
>=20
>  int amdgpu_dpm_set_fine_grain_clk_vol(struct amdgpu_device *adev, @@
> -642,14 +786,19 @@ int amdgpu_dpm_set_fine_grain_clk_vol(struct
> amdgpu_device *adev,
>  				      uint32_t size)
>  {
>  	const struct amd_pm_funcs *pp_funcs =3D adev->powerplay.pp_funcs;
> +	int ret =3D 0;
>=20
>  	if (!pp_funcs->set_fine_grain_clk_vol)
>  		return 0;
>=20
> -	return pp_funcs->set_fine_grain_clk_vol(adev-
> >powerplay.pp_handle,
> -						type,
> -						input,
> -						size);
> +	mutex_lock(&adev->pm.mutex);
> +	ret =3D pp_funcs->set_fine_grain_clk_vol(adev-
> >powerplay.pp_handle,
> +					       type,
> +					       input,
> +					       size);
> +	mutex_unlock(&adev->pm.mutex);
> +
> +	return ret;
>  }
>=20
>  int amdgpu_dpm_odn_edit_dpm_table(struct amdgpu_device *adev, @@ -
> 658,14 +807,19 @@ int amdgpu_dpm_odn_edit_dpm_table(struct
> amdgpu_device *adev,
>  				  uint32_t size)
>  {
>  	const struct amd_pm_funcs *pp_funcs =3D adev->powerplay.pp_funcs;
> +	int ret =3D 0;
>=20
>  	if (!pp_funcs->odn_edit_dpm_table)
>  		return 0;
>=20
> -	return pp_funcs->odn_edit_dpm_table(adev-
> >powerplay.pp_handle,
> -					    type,
> -					    input,
> -					    size);
> +	mutex_lock(&adev->pm.mutex);
> +	ret =3D pp_funcs->odn_edit_dpm_table(adev->powerplay.pp_handle,
> +					   type,
> +					   input,
> +					   size);
> +	mutex_unlock(&adev->pm.mutex);
> +
> +	return ret;
>  }
>=20
>  int amdgpu_dpm_print_clock_levels(struct amdgpu_device *adev, @@ -
> 673,36 +827,51 @@ int amdgpu_dpm_print_clock_levels(struct
> amdgpu_device *adev,
>  				  char *buf)
>  {
>  	const struct amd_pm_funcs *pp_funcs =3D adev->powerplay.pp_funcs;
> +	int ret =3D 0;
>=20
>  	if (!pp_funcs->print_clock_levels)
>  		return 0;
>=20
> -	return pp_funcs->print_clock_levels(adev->powerplay.pp_handle,
> -					    type,
> -					    buf);
> +	mutex_lock(&adev->pm.mutex);
> +	ret =3D pp_funcs->print_clock_levels(adev->powerplay.pp_handle,
> +					   type,
> +					   buf);
> +	mutex_unlock(&adev->pm.mutex);
> +
> +	return ret;
>  }
>=20
>  int amdgpu_dpm_set_ppfeature_status(struct amdgpu_device *adev,
>  				    uint64_t ppfeature_masks)
>  {
>  	const struct amd_pm_funcs *pp_funcs =3D adev->powerplay.pp_funcs;
> +	int ret =3D 0;
>=20
>  	if (!pp_funcs->set_ppfeature_status)
>  		return 0;
>=20
> -	return pp_funcs->set_ppfeature_status(adev-
> >powerplay.pp_handle,
> -					      ppfeature_masks);
> +	mutex_lock(&adev->pm.mutex);
> +	ret =3D pp_funcs->set_ppfeature_status(adev->powerplay.pp_handle,
> +					     ppfeature_masks);
> +	mutex_unlock(&adev->pm.mutex);
> +
> +	return ret;
>  }
>=20
>  int amdgpu_dpm_get_ppfeature_status(struct amdgpu_device *adev, char
> *buf)  {
>  	const struct amd_pm_funcs *pp_funcs =3D adev->powerplay.pp_funcs;
> +	int ret =3D 0;
>=20
>  	if (!pp_funcs->get_ppfeature_status)
>  		return 0;
>=20
> -	return pp_funcs->get_ppfeature_status(adev-
> >powerplay.pp_handle,
> -					      buf);
> +	mutex_lock(&adev->pm.mutex);
> +	ret =3D pp_funcs->get_ppfeature_status(adev->powerplay.pp_handle,
> +					     buf);
> +	mutex_unlock(&adev->pm.mutex);
> +
> +	return ret;
>  }
>=20
>  int amdgpu_dpm_force_clock_level(struct amdgpu_device *adev, @@ -
> 710,88 +879,131 @@ int amdgpu_dpm_force_clock_level(struct
> amdgpu_device *adev,
>  				 uint32_t mask)
>  {
>  	const struct amd_pm_funcs *pp_funcs =3D adev->powerplay.pp_funcs;
> +	int ret =3D 0;
>=20
>  	if (!pp_funcs->force_clock_level)
>  		return 0;
>=20
> -	return pp_funcs->force_clock_level(adev->powerplay.pp_handle,
> -					   type,
> -					   mask);
> +	mutex_lock(&adev->pm.mutex);
> +	ret =3D pp_funcs->force_clock_level(adev->powerplay.pp_handle,
> +					  type,
> +					  mask);
> +	mutex_unlock(&adev->pm.mutex);
> +
> +	return ret;
>  }
>=20
>  int amdgpu_dpm_get_sclk_od(struct amdgpu_device *adev)  {
>  	const struct amd_pm_funcs *pp_funcs =3D adev->powerplay.pp_funcs;
> +	int ret =3D 0;
>=20
>  	if (!pp_funcs->get_sclk_od)
>  		return 0;
>=20
> -	return pp_funcs->get_sclk_od(adev->powerplay.pp_handle);
> +	mutex_lock(&adev->pm.mutex);
> +	ret =3D pp_funcs->get_sclk_od(adev->powerplay.pp_handle);
> +	mutex_unlock(&adev->pm.mutex);
> +
> +	return ret;
>  }
>=20
>  int amdgpu_dpm_set_sclk_od(struct amdgpu_device *adev, uint32_t value)
> {
>  	const struct amd_pm_funcs *pp_funcs =3D adev->powerplay.pp_funcs;
> +	int ret =3D 0;
>=20
>  	if (!pp_funcs->set_sclk_od)
>  		return -EOPNOTSUPP;
>=20
> -	return pp_funcs->set_sclk_od(adev->powerplay.pp_handle, value);
> +	mutex_lock(&adev->pm.mutex);
> +	ret =3D pp_funcs->set_sclk_od(adev->powerplay.pp_handle,
> +				    value);
> +	mutex_unlock(&adev->pm.mutex);
> +
> +	return ret;
>  }
>=20
>  int amdgpu_dpm_get_mclk_od(struct amdgpu_device *adev)  {
>  	const struct amd_pm_funcs *pp_funcs =3D adev->powerplay.pp_funcs;
> +	int ret =3D 0;
>=20
>  	if (!pp_funcs->get_mclk_od)
>  		return 0;
>=20
> -	return pp_funcs->get_mclk_od(adev->powerplay.pp_handle);
> +	mutex_lock(&adev->pm.mutex);
> +	ret =3D pp_funcs->get_mclk_od(adev->powerplay.pp_handle);
> +	mutex_unlock(&adev->pm.mutex);
> +
> +	return ret;
>  }
>=20
>  int amdgpu_dpm_set_mclk_od(struct amdgpu_device *adev, uint32_t
> value)  {
>  	const struct amd_pm_funcs *pp_funcs =3D adev->powerplay.pp_funcs;
> +	int ret =3D 0;
>=20
>  	if (!pp_funcs->set_mclk_od)
>  		return -EOPNOTSUPP;
>=20
> -	return pp_funcs->set_mclk_od(adev->powerplay.pp_handle, value);
> +	mutex_lock(&adev->pm.mutex);
> +	ret =3D pp_funcs->set_mclk_od(adev->powerplay.pp_handle,
> +				    value);
> +	mutex_unlock(&adev->pm.mutex);
> +
> +	return ret;
>  }
>=20
>  int amdgpu_dpm_get_power_profile_mode(struct amdgpu_device *adev,
>  				      char *buf)
>  {
>  	const struct amd_pm_funcs *pp_funcs =3D adev->powerplay.pp_funcs;
> +	int ret =3D 0;
>=20
>  	if (!pp_funcs->get_power_profile_mode)
>  		return -EOPNOTSUPP;
>=20
> -	return pp_funcs->get_power_profile_mode(adev-
> >powerplay.pp_handle,
> -						buf);
> +	mutex_lock(&adev->pm.mutex);
> +	ret =3D pp_funcs->get_power_profile_mode(adev-
> >powerplay.pp_handle,
> +					       buf);
> +	mutex_unlock(&adev->pm.mutex);
> +
> +	return ret;
>  }
>=20
>  int amdgpu_dpm_set_power_profile_mode(struct amdgpu_device *adev,
>  				      long *input, uint32_t size)
>  {
>  	const struct amd_pm_funcs *pp_funcs =3D adev->powerplay.pp_funcs;
> +	int ret =3D 0;
>=20
>  	if (!pp_funcs->set_power_profile_mode)
>  		return 0;
>=20
> -	return pp_funcs->set_power_profile_mode(adev-
> >powerplay.pp_handle,
> -						input,
> -						size);
> +	mutex_lock(&adev->pm.mutex);
> +	ret =3D pp_funcs->set_power_profile_mode(adev-
> >powerplay.pp_handle,
> +					       input,
> +					       size);
> +	mutex_unlock(&adev->pm.mutex);
> +
> +	return ret;
>  }
>=20
>  int amdgpu_dpm_get_gpu_metrics(struct amdgpu_device *adev, void
> **table)  {
>  	const struct amd_pm_funcs *pp_funcs =3D adev->powerplay.pp_funcs;
> +	int ret =3D 0;
>=20
>  	if (!pp_funcs->get_gpu_metrics)
>  		return 0;
>=20
> -	return pp_funcs->get_gpu_metrics(adev->powerplay.pp_handle,
> table);
> +	mutex_lock(&adev->pm.mutex);
> +	ret =3D pp_funcs->get_gpu_metrics(adev->powerplay.pp_handle,
> +					table);
> +	mutex_unlock(&adev->pm.mutex);
> +
> +	return ret;
>  }
>=20
>  int amdgpu_dpm_get_fan_control_mode(struct amdgpu_device *adev,
> @@ -802,7 +1014,9 @@ int amdgpu_dpm_get_fan_control_mode(struct
> amdgpu_device *adev,
>  	if (!pp_funcs->get_fan_control_mode)
>  		return -EOPNOTSUPP;
>=20
> +	mutex_lock(&adev->pm.mutex);
>  	*fan_mode =3D pp_funcs->get_fan_control_mode(adev-
> >powerplay.pp_handle);
> +	mutex_unlock(&adev->pm.mutex);
>=20
>  	return 0;
>  }
> @@ -811,44 +1025,68 @@ int amdgpu_dpm_set_fan_speed_pwm(struct
> amdgpu_device *adev,
>  				 uint32_t speed)
>  {
>  	const struct amd_pm_funcs *pp_funcs =3D adev->powerplay.pp_funcs;
> +	int ret =3D 0;
>=20
>  	if (!pp_funcs->set_fan_speed_pwm)
>  		return -EINVAL;
>=20
> -	return pp_funcs->set_fan_speed_pwm(adev-
> >powerplay.pp_handle, speed);
> +	mutex_lock(&adev->pm.mutex);
> +	ret =3D pp_funcs->set_fan_speed_pwm(adev->powerplay.pp_handle,
> +					  speed);
> +	mutex_unlock(&adev->pm.mutex);
> +
> +	return ret;
>  }
>=20
>  int amdgpu_dpm_get_fan_speed_pwm(struct amdgpu_device *adev,
>  				 uint32_t *speed)
>  {
>  	const struct amd_pm_funcs *pp_funcs =3D adev->powerplay.pp_funcs;
> +	int ret =3D 0;
>=20
>  	if (!pp_funcs->get_fan_speed_pwm)
>  		return -EINVAL;
>=20
> -	return pp_funcs->get_fan_speed_pwm(adev-
> >powerplay.pp_handle, speed);
> +	mutex_lock(&adev->pm.mutex);
> +	ret =3D pp_funcs->get_fan_speed_pwm(adev->powerplay.pp_handle,
> +					  speed);
> +	mutex_unlock(&adev->pm.mutex);
> +
> +	return ret;
>  }
>=20
>  int amdgpu_dpm_get_fan_speed_rpm(struct amdgpu_device *adev,
>  				 uint32_t *speed)
>  {
>  	const struct amd_pm_funcs *pp_funcs =3D adev->powerplay.pp_funcs;
> +	int ret =3D 0;
>=20
>  	if (!pp_funcs->get_fan_speed_rpm)
>  		return -EINVAL;
>=20
> -	return pp_funcs->get_fan_speed_rpm(adev->powerplay.pp_handle,
> speed);
> +	mutex_lock(&adev->pm.mutex);
> +	ret =3D pp_funcs->get_fan_speed_rpm(adev->powerplay.pp_handle,
> +					  speed);
> +	mutex_unlock(&adev->pm.mutex);
> +
> +	return ret;
>  }
>=20
>  int amdgpu_dpm_set_fan_speed_rpm(struct amdgpu_device *adev,
>  				 uint32_t speed)
>  {
>  	const struct amd_pm_funcs *pp_funcs =3D adev->powerplay.pp_funcs;
> +	int ret =3D 0;
>=20
>  	if (!pp_funcs->set_fan_speed_rpm)
>  		return -EINVAL;
>=20
> -	return pp_funcs->set_fan_speed_rpm(adev->powerplay.pp_handle,
> speed);
> +	mutex_lock(&adev->pm.mutex);
> +	ret =3D pp_funcs->set_fan_speed_rpm(adev->powerplay.pp_handle,
> +					  speed);
> +	mutex_unlock(&adev->pm.mutex);
> +
> +	return ret;
>  }
>=20
>  int amdgpu_dpm_set_fan_control_mode(struct amdgpu_device *adev,
> @@ -859,7 +1097,10 @@ int amdgpu_dpm_set_fan_control_mode(struct
> amdgpu_device *adev,
>  	if (!pp_funcs->set_fan_control_mode)
>  		return -EOPNOTSUPP;
>=20
> -	pp_funcs->set_fan_control_mode(adev->powerplay.pp_handle,
> mode);
> +	mutex_lock(&adev->pm.mutex);
> +	pp_funcs->set_fan_control_mode(adev->powerplay.pp_handle,
> +				       mode);
> +	mutex_unlock(&adev->pm.mutex);
>=20
>  	return 0;
>  }
> @@ -870,33 +1111,50 @@ int amdgpu_dpm_get_power_limit(struct
> amdgpu_device *adev,
>  			       enum pp_power_type power_type)  {
>  	const struct amd_pm_funcs *pp_funcs =3D adev->powerplay.pp_funcs;
> +	int ret =3D 0;
>=20
>  	if (!pp_funcs->get_power_limit)
>  		return -ENODATA;
>=20
> -	return pp_funcs->get_power_limit(adev->powerplay.pp_handle,
> -					 limit,
> -					 pp_limit_level,
> -					 power_type);
> +	mutex_lock(&adev->pm.mutex);
> +	ret =3D pp_funcs->get_power_limit(adev->powerplay.pp_handle,
> +					limit,
> +					pp_limit_level,
> +					power_type);
> +	mutex_unlock(&adev->pm.mutex);
> +
> +	return ret;
>  }
>=20
>  int amdgpu_dpm_set_power_limit(struct amdgpu_device *adev,
>  			       uint32_t limit)
>  {
>  	const struct amd_pm_funcs *pp_funcs =3D adev->powerplay.pp_funcs;
> +	int ret =3D 0;
>=20
>  	if (!pp_funcs->set_power_limit)
>  		return -EINVAL;
>=20
> -	return pp_funcs->set_power_limit(adev->powerplay.pp_handle,
> limit);
> +	mutex_lock(&adev->pm.mutex);
> +	ret =3D pp_funcs->set_power_limit(adev->powerplay.pp_handle,
> +					limit);
> +	mutex_unlock(&adev->pm.mutex);
> +
> +	return ret;
>  }
>=20
>  int amdgpu_dpm_is_cclk_dpm_supported(struct amdgpu_device *adev)  {
> +	bool cclk_dpm_supported =3D false;
> +
>  	if (!is_support_sw_smu(adev))
>  		return false;
>=20
> -	return is_support_cclk_dpm(adev);
> +	mutex_lock(&adev->pm.mutex);
> +	cclk_dpm_supported =3D is_support_cclk_dpm(adev);
> +	mutex_unlock(&adev->pm.mutex);
> +
> +	return (int)cclk_dpm_supported;
>  }
>=20
>  int amdgpu_dpm_debugfs_print_current_performance_level(struct
> amdgpu_device *adev, @@ -907,8 +1165,10 @@ int
> amdgpu_dpm_debugfs_print_current_performance_level(struct
> amdgpu_device *ade
>  	if (!pp_funcs->debugfs_print_current_performance_level)
>  		return -EOPNOTSUPP;
>=20
> +	mutex_lock(&adev->pm.mutex);
>  	pp_funcs->debugfs_print_current_performance_level(adev-
> >powerplay.pp_handle,
>  							  m);
> +	mutex_unlock(&adev->pm.mutex);
>=20
>  	return 0;
>  }
> @@ -918,13 +1178,18 @@ int
> amdgpu_dpm_get_smu_prv_buf_details(struct amdgpu_device *adev,
>  				       size_t *size)
>  {
>  	const struct amd_pm_funcs *pp_funcs =3D adev->powerplay.pp_funcs;
> +	int ret =3D 0;
>=20
>  	if (!pp_funcs->get_smu_prv_buf_details)
>  		return -ENOSYS;
>=20
> -	return pp_funcs->get_smu_prv_buf_details(adev-
> >powerplay.pp_handle,
> -						 addr,
> -						 size);
> +	mutex_lock(&adev->pm.mutex);
> +	ret =3D pp_funcs->get_smu_prv_buf_details(adev-
> >powerplay.pp_handle,
> +						addr,
> +						size);
> +	mutex_unlock(&adev->pm.mutex);
> +
> +	return ret;
>  }
>=20
>  int amdgpu_dpm_is_overdrive_supported(struct amdgpu_device *adev)
> @@ -945,19 +1210,27 @@ int amdgpu_dpm_set_pp_table(struct
> amdgpu_device *adev,
>  			    size_t size)
>  {
>  	const struct amd_pm_funcs *pp_funcs =3D adev->powerplay.pp_funcs;
> +	int ret =3D 0;
>=20
>  	if (!pp_funcs->set_pp_table)
>  		return -EOPNOTSUPP;
>=20
> -	return pp_funcs->set_pp_table(adev->powerplay.pp_handle,
> -				      buf,
> -				      size);
> +	mutex_lock(&adev->pm.mutex);
> +	ret =3D pp_funcs->set_pp_table(adev->powerplay.pp_handle,
> +				     buf,
> +				     size);
> +	mutex_unlock(&adev->pm.mutex);
> +
> +	return ret;
>  }
>=20
>  int amdgpu_dpm_get_num_cpu_cores(struct amdgpu_device *adev)  {
>  	struct smu_context *smu =3D adev->powerplay.pp_handle;
>=20
> +	if (!is_support_sw_smu(adev))
> +		return INT_MAX;
> +
>  	return smu->cpu_core_num;
>  }
>=20
> @@ -973,12 +1246,17 @@ int
> amdgpu_dpm_display_configuration_change(struct amdgpu_device *adev,
>  					    const struct
> amd_pp_display_configuration *input)  {
>  	const struct amd_pm_funcs *pp_funcs =3D adev->powerplay.pp_funcs;
> +	int ret =3D 0;
>=20
>  	if (!pp_funcs->display_configuration_change)
>  		return 0;
>=20
> -	return pp_funcs->display_configuration_change(adev-
> >powerplay.pp_handle,
> -						      input);
> +	mutex_lock(&adev->pm.mutex);
> +	ret =3D pp_funcs->display_configuration_change(adev-
> >powerplay.pp_handle,
> +						     input);
> +	mutex_unlock(&adev->pm.mutex);
> +
> +	return ret;
>  }
>=20
>  int amdgpu_dpm_get_clock_by_type(struct amdgpu_device *adev, @@ -
> 986,25 +1264,35 @@ int amdgpu_dpm_get_clock_by_type(struct
> amdgpu_device *adev,
>  				 struct amd_pp_clocks *clocks)
>  {
>  	const struct amd_pm_funcs *pp_funcs =3D adev->powerplay.pp_funcs;
> +	int ret =3D 0;
>=20
>  	if (!pp_funcs->get_clock_by_type)
>  		return 0;
>=20
> -	return pp_funcs->get_clock_by_type(adev->powerplay.pp_handle,
> -					   type,
> -					   clocks);
> +	mutex_lock(&adev->pm.mutex);
> +	ret =3D pp_funcs->get_clock_by_type(adev->powerplay.pp_handle,
> +					  type,
> +					  clocks);
> +	mutex_unlock(&adev->pm.mutex);
> +
> +	return ret;
>  }
>=20
>  int amdgpu_dpm_get_display_mode_validation_clks(struct amdgpu_device
> *adev,
>  						struct
> amd_pp_simple_clock_info *clocks)  {
>  	const struct amd_pm_funcs *pp_funcs =3D adev->powerplay.pp_funcs;
> +	int ret =3D 0;
>=20
>  	if (!pp_funcs->get_display_mode_validation_clocks)
>  		return 0;
>=20
> -	return pp_funcs->get_display_mode_validation_clocks(adev-
> >powerplay.pp_handle,
> -							    clocks);
> +	mutex_lock(&adev->pm.mutex);
> +	ret =3D pp_funcs->get_display_mode_validation_clocks(adev-
> >powerplay.pp_handle,
> +							   clocks);
> +	mutex_unlock(&adev->pm.mutex);
> +
> +	return ret;
>  }
>=20
>  int amdgpu_dpm_get_clock_by_type_with_latency(struct amdgpu_device
> *adev, @@ -1012,13 +1300,18 @@ int
> amdgpu_dpm_get_clock_by_type_with_latency(struct amdgpu_device
> *adev,
>  					      struct
> pp_clock_levels_with_latency *clocks)  {
>  	const struct amd_pm_funcs *pp_funcs =3D adev->powerplay.pp_funcs;
> +	int ret =3D 0;
>=20
>  	if (!pp_funcs->get_clock_by_type_with_latency)
>  		return 0;
>=20
> -	return pp_funcs->get_clock_by_type_with_latency(adev-
> >powerplay.pp_handle,
> -							type,
> -							clocks);
> +	mutex_lock(&adev->pm.mutex);
> +	ret =3D pp_funcs->get_clock_by_type_with_latency(adev-
> >powerplay.pp_handle,
> +						       type,
> +						       clocks);
> +	mutex_unlock(&adev->pm.mutex);
> +
> +	return ret;
>  }
>=20
>  int amdgpu_dpm_get_clock_by_type_with_voltage(struct amdgpu_device
> *adev, @@ -1026,49 +1319,69 @@ int
> amdgpu_dpm_get_clock_by_type_with_voltage(struct amdgpu_device
> *adev,
>  					      struct
> pp_clock_levels_with_voltage *clocks)  {
>  	const struct amd_pm_funcs *pp_funcs =3D adev->powerplay.pp_funcs;
> +	int ret =3D 0;
>=20
>  	if (!pp_funcs->get_clock_by_type_with_voltage)
>  		return 0;
>=20
> -	return pp_funcs->get_clock_by_type_with_voltage(adev-
> >powerplay.pp_handle,
> -							type,
> -							clocks);
> +	mutex_lock(&adev->pm.mutex);
> +	ret =3D pp_funcs->get_clock_by_type_with_voltage(adev-
> >powerplay.pp_handle,
> +						       type,
> +						       clocks);
> +	mutex_unlock(&adev->pm.mutex);
> +
> +	return ret;
>  }
>=20
>  int amdgpu_dpm_set_watermarks_for_clocks_ranges(struct
> amdgpu_device *adev,
>  					       void *clock_ranges)
>  {
>  	const struct amd_pm_funcs *pp_funcs =3D adev->powerplay.pp_funcs;
> +	int ret =3D 0;
>=20
>  	if (!pp_funcs->set_watermarks_for_clocks_ranges)
>  		return -EOPNOTSUPP;
>=20
> -	return pp_funcs->set_watermarks_for_clocks_ranges(adev-
> >powerplay.pp_handle,
> -							  clock_ranges);
> +	mutex_lock(&adev->pm.mutex);
> +	ret =3D pp_funcs->set_watermarks_for_clocks_ranges(adev-
> >powerplay.pp_handle,
> +							 clock_ranges);
> +	mutex_unlock(&adev->pm.mutex);
> +
> +	return ret;
>  }
>=20
>  int amdgpu_dpm_display_clock_voltage_request(struct amdgpu_device
> *adev,
>  					     struct pp_display_clock_request
> *clock)  {
>  	const struct amd_pm_funcs *pp_funcs =3D adev->powerplay.pp_funcs;
> +	int ret =3D 0;
>=20
>  	if (!pp_funcs->display_clock_voltage_request)
>  		return -EOPNOTSUPP;
>=20
> -	return pp_funcs->display_clock_voltage_request(adev-
> >powerplay.pp_handle,
> -						       clock);
> +	mutex_lock(&adev->pm.mutex);
> +	ret =3D pp_funcs->display_clock_voltage_request(adev-
> >powerplay.pp_handle,
> +						      clock);
> +	mutex_unlock(&adev->pm.mutex);
> +
> +	return ret;
>  }
>=20
>  int amdgpu_dpm_get_current_clocks(struct amdgpu_device *adev,
>  				  struct amd_pp_clock_info *clocks)  {
>  	const struct amd_pm_funcs *pp_funcs =3D adev->powerplay.pp_funcs;
> +	int ret =3D 0;
>=20
>  	if (!pp_funcs->get_current_clocks)
>  		return -EOPNOTSUPP;
>=20
> -	return pp_funcs->get_current_clocks(adev->powerplay.pp_handle,
> -					    clocks);
> +	mutex_lock(&adev->pm.mutex);
> +	ret =3D pp_funcs->get_current_clocks(adev->powerplay.pp_handle,
> +					   clocks);
> +	mutex_unlock(&adev->pm.mutex);
> +
> +	return ret;
>  }
>=20
>  void amdgpu_dpm_notify_smu_enable_pwe(struct amdgpu_device *adev)
> @@ -1078,31 +1391,43 @@ void
> amdgpu_dpm_notify_smu_enable_pwe(struct amdgpu_device *adev)
>  	if (!pp_funcs->notify_smu_enable_pwe)
>  		return;
>=20
> +	mutex_lock(&adev->pm.mutex);
>  	pp_funcs->notify_smu_enable_pwe(adev->powerplay.pp_handle);
> +	mutex_unlock(&adev->pm.mutex);
>  }
>=20
>  int amdgpu_dpm_set_active_display_count(struct amdgpu_device *adev,
>  					uint32_t count)
>  {
>  	const struct amd_pm_funcs *pp_funcs =3D adev->powerplay.pp_funcs;
> +	int ret =3D 0;
>=20
>  	if (!pp_funcs->set_active_display_count)
>  		return -EOPNOTSUPP;
>=20
> -	return pp_funcs->set_active_display_count(adev-
> >powerplay.pp_handle,
> -						  count);
> +	mutex_lock(&adev->pm.mutex);
> +	ret =3D pp_funcs->set_active_display_count(adev-
> >powerplay.pp_handle,
> +						 count);
> +	mutex_unlock(&adev->pm.mutex);
> +
> +	return ret;
>  }
>=20
>  int amdgpu_dpm_set_min_deep_sleep_dcefclk(struct amdgpu_device
> *adev,
>  					  uint32_t clock)
>  {
>  	const struct amd_pm_funcs *pp_funcs =3D adev->powerplay.pp_funcs;
> +	int ret =3D 0;
>=20
>  	if (!pp_funcs->set_min_deep_sleep_dcefclk)
>  		return -EOPNOTSUPP;
>=20
> -	return pp_funcs->set_min_deep_sleep_dcefclk(adev-
> >powerplay.pp_handle,
> -						    clock);
> +	mutex_lock(&adev->pm.mutex);
> +	ret =3D pp_funcs->set_min_deep_sleep_dcefclk(adev-
> >powerplay.pp_handle,
> +						   clock);
> +	mutex_unlock(&adev->pm.mutex);
> +
> +	return ret;
>  }
>=20
>  void amdgpu_dpm_set_hard_min_dcefclk_by_freq(struct amdgpu_device
> *adev, @@ -1113,8 +1438,10 @@ void
> amdgpu_dpm_set_hard_min_dcefclk_by_freq(struct amdgpu_device *adev,
>  	if (!pp_funcs->set_hard_min_dcefclk_by_freq)
>  		return;
>=20
> +	mutex_lock(&adev->pm.mutex);
>  	pp_funcs->set_hard_min_dcefclk_by_freq(adev-
> >powerplay.pp_handle,
>  					       clock);
> +	mutex_unlock(&adev->pm.mutex);
>  }
>=20
>  void amdgpu_dpm_set_hard_min_fclk_by_freq(struct amdgpu_device
> *adev, @@ -1125,32 +1452,44 @@ void
> amdgpu_dpm_set_hard_min_fclk_by_freq(struct amdgpu_device *adev,
>  	if (!pp_funcs->set_hard_min_fclk_by_freq)
>  		return;
>=20
> +	mutex_lock(&adev->pm.mutex);
>  	pp_funcs->set_hard_min_fclk_by_freq(adev-
> >powerplay.pp_handle,
>  					    clock);
> +	mutex_unlock(&adev->pm.mutex);
>  }
>=20
>  int amdgpu_dpm_display_disable_memory_clock_switch(struct
> amdgpu_device *adev,
>  						   bool
> disable_memory_clock_switch)  {
>  	const struct amd_pm_funcs *pp_funcs =3D adev->powerplay.pp_funcs;
> +	int ret =3D 0;
>=20
>  	if (!pp_funcs->display_disable_memory_clock_switch)
>  		return 0;
>=20
> -	return pp_funcs->display_disable_memory_clock_switch(adev-
> >powerplay.pp_handle,
> -
> disable_memory_clock_switch);
> +	mutex_lock(&adev->pm.mutex);
> +	ret =3D pp_funcs->display_disable_memory_clock_switch(adev-
> >powerplay.pp_handle,
> +
> disable_memory_clock_switch);
> +	mutex_unlock(&adev->pm.mutex);
> +
> +	return ret;
>  }
>=20
>  int amdgpu_dpm_get_max_sustainable_clocks_by_dc(struct
> amdgpu_device *adev,
>  						struct
> pp_smu_nv_clock_table *max_clocks)  {
>  	const struct amd_pm_funcs *pp_funcs =3D adev->powerplay.pp_funcs;
> +	int ret =3D 0;
>=20
>  	if (!pp_funcs->get_max_sustainable_clocks_by_dc)
>  		return -EOPNOTSUPP;
>=20
> -	return pp_funcs->get_max_sustainable_clocks_by_dc(adev-
> >powerplay.pp_handle,
> -							  max_clocks);
> +	mutex_lock(&adev->pm.mutex);
> +	ret =3D pp_funcs->get_max_sustainable_clocks_by_dc(adev-
> >powerplay.pp_handle,
> +							 max_clocks);
> +	mutex_unlock(&adev->pm.mutex);
> +
> +	return ret;
>  }
>=20
>  enum pp_smu_status amdgpu_dpm_get_uclk_dpm_states(struct
> amdgpu_device *adev, @@ -1158,23 +1497,33 @@ enum pp_smu_status
> amdgpu_dpm_get_uclk_dpm_states(struct amdgpu_device *adev,
>  						  unsigned int *num_states)
>  {
>  	const struct amd_pm_funcs *pp_funcs =3D adev->powerplay.pp_funcs;
> +	int ret =3D 0;
>=20
>  	if (!pp_funcs->get_uclk_dpm_states)
>  		return -EOPNOTSUPP;
>=20
> -	return pp_funcs->get_uclk_dpm_states(adev-
> >powerplay.pp_handle,
> -					     clock_values_in_khz,
> -					     num_states);
> +	mutex_lock(&adev->pm.mutex);
> +	ret =3D pp_funcs->get_uclk_dpm_states(adev->powerplay.pp_handle,
> +					    clock_values_in_khz,
> +					    num_states);
> +	mutex_unlock(&adev->pm.mutex);
> +
> +	return ret;
>  }
>=20
>  int amdgpu_dpm_get_dpm_clock_table(struct amdgpu_device *adev,
>  				   struct dpm_clocks *clock_table)
>  {
>  	const struct amd_pm_funcs *pp_funcs =3D adev->powerplay.pp_funcs;
> +	int ret =3D 0;
>=20
>  	if (!pp_funcs->get_dpm_clock_table)
>  		return -EOPNOTSUPP;
>=20
> -	return pp_funcs->get_dpm_clock_table(adev-
> >powerplay.pp_handle,
> -					     clock_table);
> +	mutex_lock(&adev->pm.mutex);
> +	ret =3D pp_funcs->get_dpm_clock_table(adev->powerplay.pp_handle,
> +					    clock_table);
> +	mutex_unlock(&adev->pm.mutex);
> +
> +	return ret;
>  }
> diff --git a/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c
> b/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c
> index 72824ef61edd..b37662c4a413 100644
> --- a/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c
> +++ b/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c
> @@ -3040,21 +3040,18 @@ static int kv_dpm_sw_init(void *handle)
>  		return 0;
>=20
>  	INIT_WORK(&adev->pm.dpm.thermal.work,
> amdgpu_dpm_thermal_work_handler);
> -	mutex_lock(&adev->pm.mutex);
>  	ret =3D kv_dpm_init(adev);
>  	if (ret)
>  		goto dpm_failed;
>  	adev->pm.dpm.current_ps =3D adev->pm.dpm.requested_ps =3D adev-
> >pm.dpm.boot_ps;
>  	if (amdgpu_dpm =3D=3D 1)
>  		amdgpu_pm_print_power_states(adev);
> -	mutex_unlock(&adev->pm.mutex);
>  	DRM_INFO("amdgpu: dpm initialized\n");
>=20
>  	return 0;
>=20
>  dpm_failed:
>  	kv_dpm_fini(adev);
> -	mutex_unlock(&adev->pm.mutex);
>  	DRM_ERROR("amdgpu: dpm initialization failed\n");
>  	return ret;
>  }
> @@ -3065,9 +3062,7 @@ static int kv_dpm_sw_fini(void *handle)
>=20
>  	flush_work(&adev->pm.dpm.thermal.work);
>=20
> -	mutex_lock(&adev->pm.mutex);
>  	kv_dpm_fini(adev);
> -	mutex_unlock(&adev->pm.mutex);
>=20
>  	return 0;
>  }
> @@ -3080,14 +3075,12 @@ static int kv_dpm_hw_init(void *handle)
>  	if (!amdgpu_dpm)
>  		return 0;
>=20
> -	mutex_lock(&adev->pm.mutex);
>  	kv_dpm_setup_asic(adev);
>  	ret =3D kv_dpm_enable(adev);
>  	if (ret)
>  		adev->pm.dpm_enabled =3D false;
>  	else
>  		adev->pm.dpm_enabled =3D true;
> -	mutex_unlock(&adev->pm.mutex);
>  	amdgpu_legacy_dpm_compute_clocks(adev);
>  	return ret;
>  }
> @@ -3096,11 +3089,8 @@ static int kv_dpm_hw_fini(void *handle)  {
>  	struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
>=20
> -	if (adev->pm.dpm_enabled) {
> -		mutex_lock(&adev->pm.mutex);
> +	if (adev->pm.dpm_enabled)
>  		kv_dpm_disable(adev);
> -		mutex_unlock(&adev->pm.mutex);
> -	}
>=20
>  	return 0;
>  }
> @@ -3110,12 +3100,10 @@ static int kv_dpm_suspend(void *handle)
>  	struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
>=20
>  	if (adev->pm.dpm_enabled) {
> -		mutex_lock(&adev->pm.mutex);
>  		/* disable dpm */
>  		kv_dpm_disable(adev);
>  		/* reset the power state */
>  		adev->pm.dpm.current_ps =3D adev->pm.dpm.requested_ps
> =3D adev->pm.dpm.boot_ps;
> -		mutex_unlock(&adev->pm.mutex);
>  	}
>  	return 0;
>  }
> @@ -3127,14 +3115,12 @@ static int kv_dpm_resume(void *handle)
>=20
>  	if (adev->pm.dpm_enabled) {
>  		/* asic init will reset to the boot state */
> -		mutex_lock(&adev->pm.mutex);
>  		kv_dpm_setup_asic(adev);
>  		ret =3D kv_dpm_enable(adev);
>  		if (ret)
>  			adev->pm.dpm_enabled =3D false;
>  		else
>  			adev->pm.dpm_enabled =3D true;
> -		mutex_unlock(&adev->pm.mutex);
>  		if (adev->pm.dpm_enabled)
>  			amdgpu_legacy_dpm_compute_clocks(adev);
>  	}
> diff --git a/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
> b/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
> index e3b58249c6f4..22cf5f978f68 100644
> --- a/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
> +++ b/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
> @@ -7786,21 +7786,18 @@ static int si_dpm_sw_init(void *handle)
>  		return ret;
>=20
>  	INIT_WORK(&adev->pm.dpm.thermal.work,
> amdgpu_dpm_thermal_work_handler);
> -	mutex_lock(&adev->pm.mutex);
>  	ret =3D si_dpm_init(adev);
>  	if (ret)
>  		goto dpm_failed;
>  	adev->pm.dpm.current_ps =3D adev->pm.dpm.requested_ps =3D adev-
> >pm.dpm.boot_ps;
>  	if (amdgpu_dpm =3D=3D 1)
>  		amdgpu_pm_print_power_states(adev);
> -	mutex_unlock(&adev->pm.mutex);
>  	DRM_INFO("amdgpu: dpm initialized\n");
>=20
>  	return 0;
>=20
>  dpm_failed:
>  	si_dpm_fini(adev);
> -	mutex_unlock(&adev->pm.mutex);
>  	DRM_ERROR("amdgpu: dpm initialization failed\n");
>  	return ret;
>  }
> @@ -7811,9 +7808,7 @@ static int si_dpm_sw_fini(void *handle)
>=20
>  	flush_work(&adev->pm.dpm.thermal.work);
>=20
> -	mutex_lock(&adev->pm.mutex);
>  	si_dpm_fini(adev);
> -	mutex_unlock(&adev->pm.mutex);
>=20
>  	return 0;
>  }
> @@ -7827,14 +7822,12 @@ static int si_dpm_hw_init(void *handle)
>  	if (!amdgpu_dpm)
>  		return 0;
>=20
> -	mutex_lock(&adev->pm.mutex);
>  	si_dpm_setup_asic(adev);
>  	ret =3D si_dpm_enable(adev);
>  	if (ret)
>  		adev->pm.dpm_enabled =3D false;
>  	else
>  		adev->pm.dpm_enabled =3D true;
> -	mutex_unlock(&adev->pm.mutex);
>  	amdgpu_legacy_dpm_compute_clocks(adev);
>  	return ret;
>  }
> @@ -7843,11 +7836,8 @@ static int si_dpm_hw_fini(void *handle)  {
>  	struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
>=20
> -	if (adev->pm.dpm_enabled) {
> -		mutex_lock(&adev->pm.mutex);
> +	if (adev->pm.dpm_enabled)
>  		si_dpm_disable(adev);
> -		mutex_unlock(&adev->pm.mutex);
> -	}
>=20
>  	return 0;
>  }
> @@ -7857,12 +7847,10 @@ static int si_dpm_suspend(void *handle)
>  	struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
>=20
>  	if (adev->pm.dpm_enabled) {
> -		mutex_lock(&adev->pm.mutex);
>  		/* disable dpm */
>  		si_dpm_disable(adev);
>  		/* reset the power state */
>  		adev->pm.dpm.current_ps =3D adev->pm.dpm.requested_ps
> =3D adev->pm.dpm.boot_ps;
> -		mutex_unlock(&adev->pm.mutex);
>  	}
>  	return 0;
>  }
> @@ -7874,14 +7862,12 @@ static int si_dpm_resume(void *handle)
>=20
>  	if (adev->pm.dpm_enabled) {
>  		/* asic init will reset to the boot state */
> -		mutex_lock(&adev->pm.mutex);
>  		si_dpm_setup_asic(adev);
>  		ret =3D si_dpm_enable(adev);
>  		if (ret)
>  			adev->pm.dpm_enabled =3D false;
>  		else
>  			adev->pm.dpm_enabled =3D true;
> -		mutex_unlock(&adev->pm.mutex);
>  		if (adev->pm.dpm_enabled)
>  			amdgpu_legacy_dpm_compute_clocks(adev);
>  	}
> --
> 2.29.0
