Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA641EDB4B
	for <lists+amd-gfx@lfdr.de>; Thu,  4 Jun 2020 04:42:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A94F6E155;
	Thu,  4 Jun 2020 02:42:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2082.outbound.protection.outlook.com [40.107.93.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 916A989A1E
 for <amd-gfx@lists.freedesktop.org>; Thu,  4 Jun 2020 02:42:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SHsaRbkBgspw1rPdrT8Ksg/dzLSJGGxNQBvXfbCnyvd+zxcn5Lg2q/J1MdTOdqTqFHaOb0ATTqlK3LLt97QIdZctFRySHk4HTRW0oQLEAEeLdlTn7xS7bmOgHBGvSeD7bWxqnY+KEmSdurg23B743BzHNuK2d7G0yRU5UPVuGRPVtvz8r3wnWKEwO5vHeB6D/IqgK0OcmIugyCJJ/OsOshrKCH7gcV6xLwHf6FXqTQ7B8C+T2FlcJVqj5qdPZlr86SkyRir2iY/jnSXYTIAXvq4MUsMMUXKXv5iTnsXdQPaB3FlCcayHAht8hrkGDfPx29Y1SmcgHZJMu03VGgI4eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qFewYzsgtdy/qzY8VCeFuIuZCdoWi3uMBZCwk7voqNU=;
 b=TN6sd3WWB8MvaNyUgtYjkh6q/StObXbGuX4OSoYQ6kzmgdTRMoecTc9lrnuE2qr20ZG5eX2s9Y4974zw5nZPyaWHhBXqezcaDGjUFpMZXwGRmpCYzkjMCv+axUBgQ8rauE21XCACiDg0lg3IVz5EdqMes2po5orlySb6Ye0n4w2HFXIyoFWD3QRwAr6/JRh9WBTlEIi671s5ypRtaiEZ0zpYbDLHGAtUXdPidrbiWN79hQfgDmubA81ggFHR1RyoOIAJcq/xxKykAW5m1s2lstOTMoxfp//kniz/YE9HZ8sK5Pyt3V1J+9w7kQpwXZfhJEEoVdGaKGvSItgVCVD76g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qFewYzsgtdy/qzY8VCeFuIuZCdoWi3uMBZCwk7voqNU=;
 b=TuZrfpi7J/dvetb1v8S77tUxB/PCwrSZhriAAHYgSqLxub1v3gihTxDap2NCzQFs5pWj9C1MfuNDoLUYFuxADajlCcPmE4Fuy3VWXJCERzUANyY1tc43uMlurVSoxC2jBVrqvj1jq7smeJjQRnhOm/B+wRWEiBB0r1igxmP/Vg8=
Received: from MWHPR12MB1837.namprd12.prod.outlook.com (2603:10b6:300:113::20)
 by MWHPR12MB1469.namprd12.prod.outlook.com (2603:10b6:301:10::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.19; Thu, 4 Jun
 2020 02:42:27 +0000
Received: from MWHPR12MB1837.namprd12.prod.outlook.com
 ([fe80::c142:31c5:738f:205c]) by MWHPR12MB1837.namprd12.prod.outlook.com
 ([fe80::c142:31c5:738f:205c%9]) with mapi id 15.20.3045.024; Thu, 4 Jun 2020
 02:42:26 +0000
From: "Yang, Stanley" <Stanley.Yang@amd.com>
To: "Chen, Guchun" <Guchun.Chen@amd.com>, "Zhang, Hawking"
 <Hawking.Zhang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: support reserve bad page for virt
Thread-Topic: [PATCH] drm/amdgpu: support reserve bad page for virt
Thread-Index: AQHWObChXEgcpkdsdkCXrEkMip8Jk6jHA1CAgACpKICAABONwA==
Date: Thu, 4 Jun 2020 02:42:26 +0000
Message-ID: <MWHPR12MB18370F3F019EB9286F4B360A9A890@MWHPR12MB1837.namprd12.prod.outlook.com>
References: <20200603140936.7356-1-Stanley.Yang@amd.com>
 <DM6PR12MB4075EB57AFB77FB8540A4A71FC880@DM6PR12MB4075.namprd12.prod.outlook.com>
 <CY4PR12MB128751585C2956DE6510CF70F1890@CY4PR12MB1287.namprd12.prod.outlook.com>
In-Reply-To: <CY4PR12MB128751585C2956DE6510CF70F1890@CY4PR12MB1287.namprd12.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Enabled=true;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SetDate=2020-06-03T14:44:33Z; 
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Method=Privileged;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Name=Public_0;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ActionId=e468eff5-ff11-483a-926b-00000e727a69;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ContentBits=1
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_enabled: true
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_setdate: 2020-06-04T02:42:23Z
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_method: Privileged
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_name: Public_0
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_actionid: c860394a-6bf5-4cc1-97c8-0000fd8e304d
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_contentbits: 0
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [58.247.170.242]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9f002439-99b6-4856-7e97-08d80830eb12
x-ms-traffictypediagnostic: MWHPR12MB1469:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR12MB1469AD02D66E16E44D1DB8DF9A890@MWHPR12MB1469.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 04244E0DC5
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1jr0N9fRUSTXPpMqmyLCYJu2lUd6XL/0sOxUnbNBBbms0o3omU6RgwToxuyntCn80etjHVeEQ0piYBFLuMPXLnp1+cFXW5Hy31o64ImDjyYSt+U6oQU2LgMvqip8gkkxzMkJq25kJVWRJlRoIV61FnT4YIp3nxwLLMgCutpiAKV/xmSmULkBPp6mTdZ0AnwWtMmUKvKvPzTyq8hR3NlPKrwRadKAep2TjrXdNMJ1esKgAkFQsXDXDLCTbVmK7uvJkd6LrA5ROHqnWm3etqSfcQXlqt8gKFXbMip6tiLtTtTC79woYB2nYYI2yOlYpreK
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR12MB1837.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(396003)(366004)(346002)(376002)(39860400002)(6506007)(26005)(186003)(8676002)(9686003)(55016002)(2906002)(4326008)(8936002)(7696005)(316002)(86362001)(110136005)(54906003)(53546011)(478600001)(30864003)(52536014)(5660300002)(83380400001)(71200400001)(66446008)(33656002)(66476007)(64756008)(66556008)(76116006)(66946007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 1cY4kEO/PhiEg7bFI3ZmGlhaZtywqaDygUesRk/QeT9OjGHo1hvxdY8CrBTrMPIRistgcxAOTKfiKarkYz3kvVAJRVDx31c9lYRng8c/uGCnVcpRrPwhUMG/b7t98KIfASYY5reFxW86fh6F6pogUrn/CCVFGrizgwulcnYo76bss7ufekwMkAFA5FkGmekgW4vRVZKVnAGmGjFEImVOzeN9T2cOZlpqZOzTwY+9YKXmJAB1G2anHBlGC6T01Jc5Xdm3yuzxPieBerB8XQWWnssFL4t4PkUX2BQRgEhVhcJGZxkBtUedAKwtIikBAKTZqUv22pLop84AsbNNHcS7V6+enZ1DbjSMBgpSKFkb+//EeiLHNtbGgdsyGugmT3zTY3fQ9S0/frTL+2mSwC9ePXiJ6PQSKTUU3APXbmCydTY7tvQChQ97BNolt3jufwho8gVaSW1uvNnBSOQg4cWSl7VUp4zxPDdGwEUhcQPLLbiQLpV5RmGu8HfiPMyMD70X
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f002439-99b6-4856-7e97-08d80830eb12
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2020 02:42:26.6896 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zkhBBu9xEd68kL+D3ADnsWq93ZoTVN6fjlxOVyDZ2oRRd66QXBwiXRQHvzwbArkxO+NunS0sos2KxNFdBwNsYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1469
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
Cc: "Zhou1, Tao" <Tao.Zhou1@amd.com>, "Clements, John" <John.Clements@amd.com>,
 "Li, Dennis" <Dennis.Li@amd.com>, "Liu, Monk" <Monk.Liu@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

[AMD Public Use]

Hi GuChun,

Thanks for reminding.

Regards,
Stanley
> -----Original Message-----
> From: Chen, Guchun <Guchun.Chen@amd.com>
> Sent: Thursday, June 4, 2020 9:32 AM
> To: Zhang, Hawking <Hawking.Zhang@amd.com>; Yang, Stanley
> <Stanley.Yang@amd.com>; amd-gfx@lists.freedesktop.org
> Cc: Liu, Monk <Monk.Liu@amd.com>; Clements, John
> <John.Clements@amd.com>; Zhou1, Tao <Tao.Zhou1@amd.com>; Li, Dennis
> <Dennis.Li@amd.com>; Yang, Stanley <Stanley.Yang@amd.com>
> Subject: RE: [PATCH] drm/amdgpu: support reserve bad page for virt
> 
> [AMD Public Use]
> 
> Except Hawking's comments, we shall not change file mode in the patch as
> well.
> 
> mode change 100644 => 100755
> drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
> mode change 100644 => 100755
> drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h
> 
> Regards,
> Guchun
> 
> -----Original Message-----
> From: Zhang, Hawking <Hawking.Zhang@amd.com>
> Sent: Wednesday, June 3, 2020 11:26 PM
> To: Yang, Stanley <Stanley.Yang@amd.com>; amd-gfx@lists.freedesktop.org
> Cc: Chen, Guchun <Guchun.Chen@amd.com>; Liu, Monk
> <Monk.Liu@amd.com>; Clements, John <John.Clements@amd.com>; Zhou1,
> Tao <Tao.Zhou1@amd.com>; Li, Dennis <Dennis.Li@amd.com>; Yang,
> Stanley <Stanley.Yang@amd.com>
> Subject: RE: [PATCH] drm/amdgpu: support reserve bad page for virt
> 
> [AMD Public Use]
> 
> Please check my comments inline.
> 
> Regards,
> Hawking
> 
> -----Original Message-----
> From: Stanley.Yang <Stanley.Yang@amd.com>
> Sent: Wednesday, June 3, 2020 22:10
> To: amd-gfx@lists.freedesktop.org
> Cc: Zhang, Hawking <Hawking.Zhang@amd.com>; Chen, Guchun
> <Guchun.Chen@amd.com>; Liu, Monk <Monk.Liu@amd.com>; Clements,
> John <John.Clements@amd.com>; Zhou1, Tao <Tao.Zhou1@amd.com>; Li,
> Dennis <Dennis.Li@amd.com>; Yang, Stanley <Stanley.Yang@amd.com>
> Subject: [PATCH] drm/amdgpu: support reserve bad page for virt
> 
> Signed-off-by: Stanley.Yang <Stanley.Yang@amd.com>
> Change-Id: Ia0ad9453ac3ac929f95c73cbee5b7a8fc42a9816
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |   7 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c   | 164
> +++++++++++++++++++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h   |  30 +++-
>  3 files changed, 196 insertions(+), 5 deletions(-)  mode change 100644 =>
> 100755 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
>  mode change 100644 => 100755
> drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index b633171281f8..e8986e007206 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -2001,8 +2001,10 @@ static int amdgpu_device_ip_init(struct
> amdgpu_device *adev)
>  		}
>  	}
> 
> -	if (amdgpu_sriov_vf(adev))
> +	if (amdgpu_sriov_vf(adev)) {
> +		amdgpu_virt_init_err_handler_data(adev);
> 
> [Hawking]:
> 1. It might be better to rename the function to
> amdgpu_virt_init_ras_err_handler_data
> 2. we shall apply either asic type check or more general data structure check
> before call into amdgpu_virt_init_ras_err_handler_data. Please check my
> comments in amdgpu_virt_init_ras_err_handler_data function
> 
> 
>  		amdgpu_virt_init_data_exchange(adev);
> +	}
> 
>  	r = amdgpu_ib_pool_init(adev);
>  	if (r) {
> @@ -2306,6 +2308,9 @@ static int amdgpu_device_ip_fini(struct
> amdgpu_device *adev)  {
>  	int i, r;
> 
> +	if (amdgpu_sriov_vf(adev))
> +		amdgpu_release_virt_err_handler_data(adev);
> 
> [Hawking]:
> 1. It might be better to rename the function to
> amdgpu_virt_release_ras_err_handler_data
> 2. we shall apply either asic type check or more general data structure check
> In case it introduce regression on MI100 and V340L
> 
> +
>  	amdgpu_ras_pre_fini(adev);
> 
>  	if (adev->gmc.xgmi.num_physical_nodes > 1) diff --git
> a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
> old mode 100644
> new mode 100755
> index f3b38c9e04ca..c1554562a2ce
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
> @@ -26,6 +26,7 @@
>  #include <drm/drm_drv.h>
> 
>  #include "amdgpu.h"
> +#include "amdgpu_ras.h"
> 
>  bool amdgpu_virt_mmio_blocked(struct amdgpu_device *adev)  { @@ -
> 255,12 +256,164 @@ int amdgpu_virt_fw_reserve_get_checksum(void *obj,
>  	return ret;
>  }
> 
> +int amdgpu_virt_init_err_handler_data(struct amdgpu_device *adev) {
> 
> [Hawking]:
> 1. same as above, rename it to amdgpu_virt_init_ras_err_handler_data
> 
> +	struct amdgpu_virt *virt = &adev->virt;
> +	struct virt_ras_err_handler_data **data = &virt->virt_eh_data;
> +	/* GPU will be marked bad on host if bp count more then 10,
> +	 * so alloc 512 is enough.
> +	 */
> +	unsigned int align_space = 512;
> +	void *bps = NULL;
> +	struct amdgpu_bo **bps_bo = NULL;
> +
> 
> [Hawking]:
> 1. This will result to regression on MI100 SRIOV if we don't apply check. Or
> leverage general data structure for the purpose, thoughts?
> 
> +	*data = kmalloc(sizeof(struct virt_ras_err_handler_data),
> GFP_KERNEL);
> 
> [Hawking]:
> 1. rename the data structure to amdgpu_virt_ras_err_handler_data
> 
> +	if (!*data)
> +		return -ENOMEM;
> +
> +	bps = kmalloc(align_space * sizeof((*data)->bps), GFP_KERNEL);
> +	bps_bo = kmalloc(align_space * sizeof((*data)->bps_bo),
> GFP_KERNEL);
> +
> +	if (!bps || !bps_bo) {
> +		kfree(bps);
> +		kfree(bps_bo);
> +		return -ENOMEM;
> +	}
> +
> +	(*data)->bps = bps;
> +	(*data)->bps_bo = bps_bo;
> +	(*data)->count = 0;
> +	(*data)->last_reserved = 0;
> +	return 0;
> +}
> +
> +static void amdgpu_virt_release_bp(struct amdgpu_device *adev) {
> +	struct amdgpu_virt *virt = &adev->virt;
> +	struct virt_ras_err_handler_data *data = virt->virt_eh_data;
> 
> [Hawking]:
> 1. same as above, please rename the virt_ras_err_handler_data to
> amdgpu_virt_ras_err_handler_data
> 
> +	struct amdgpu_bo *bo;
> +	int i;
> +
> +	if (!data)
> +		return;
> +
> +	for (i = data->last_reserved - 1; i >= 0; i--) {
> +		bo = data->bps_bo[i];
> +		amdgpu_bo_free_kernel(&bo, NULL, NULL);
> +		data->bps_bo[i] = bo;
> +		data->last_reserved = i;
> +	}
> +}
> +
> +void amdgpu_release_virt_err_handler_data(struct amdgpu_device *adev)
> {
> 
> [Hawking]:
> 1. same as above, rename the function to
> amdgpu_virt_release_ras_err_handler_data
> 
> +	struct amdgpu_virt *virt = &adev->virt;
> +	struct virt_ras_err_handler_data *data = virt->virt_eh_data;
> +
> +	if (!data)
> +		return;
> +
> +	amdgpu_virt_release_bp(adev);
> +
> +	kfree(data->bps);
> +	kfree(data->bps_bo);
> +	kfree(data);
> +	virt->virt_eh_data = NULL;
> +}
> +
> +static void amdgpu_virt_ras_add_bps(struct amdgpu_device *adev,
> +		struct eeprom_table_record *bps, int pages) {
> +	struct amdgpu_virt *virt = &adev->virt;
> +	struct virt_ras_err_handler_data *data = virt->virt_eh_data;
> +
> +	if (!data)
> +		return;
> +
> +	memcpy(&data->bps[data->count], bps, pages * sizeof(*data->bps));
> +	data->count += pages;
> +}
> +
> +static void amdgpu_virt_ras_reserve_bps(struct amdgpu_device *adev) {
> +	struct amdgpu_virt *virt = &adev->virt;
> +	struct virt_ras_err_handler_data *data = virt->virt_eh_data;
> +	struct amdgpu_bo *bo = NULL;
> +	uint64_t bp;
> +	int i;
> +
> +	if (!data)
> +		return;
> +
> +	for (i = data->last_reserved; i < data->count; i++) {
> +		bp = data->bps[i].retired_page;
> +
> +		/* There are two cases of reserve error should be ignored:
> +		 * 1) a ras bad page has been allocated (used by someone);
> +		 * 2) a ras bad page has been reserved (duplicate error
> injection
> +		 *    for one page);
> +		 */
> +		if (amdgpu_bo_create_kernel_at(adev, bp <<
> AMDGPU_GPU_PAGE_SHIFT,
> +					       AMDGPU_GPU_PAGE_SIZE,
> +					       AMDGPU_GEM_DOMAIN_VRAM,
> +					       &bo, NULL))
> +			DRM_WARN("RAS WARN: reserve vram for retired
> page %llx fail\n", bp);
> 
> [Hawking]:
> 1. can we make this as debug message?
> 
> +
> +		data->bps_bo[i] = bo;
> +		data->last_reserved = i + 1;
> +		bo = NULL;
> +	}
> +}
> +
> +static bool amdgpu_virt_check_bad_page(struct amdgpu_device *adev,
> +		uint64_t retired_page)
> +{
> +	struct amdgpu_virt *virt = &adev->virt;
> +	struct virt_ras_err_handler_data *data = virt->virt_eh_data;
> +	int i;
> +
> +	if (!data)
> +		return true;
> +
> +	for (i = 0; i < data->count; i++)
> +		if (retired_page == data->bps[i].retired_page)
> +			return true;
> +
> +	return false;
> +}
> +
> +static void amdgpu_virt_add_bad_page(struct amdgpu_device *adev,
> +		uint64_t bp_block_offset, uint32_t bp_block_size) {
> +	struct eeprom_table_record bp;
> +	uint64_t retired_page;
> +	uint32_t bp_idx, bp_cnt;
> +
> +	if (bp_block_size) {
> +		bp_cnt = bp_block_size / sizeof(uint64_t);
> +		for (bp_idx = 0; bp_idx < bp_cnt; bp_idx++) {
> +			retired_page = *(uint64_t *)(adev-
> >fw_vram_usage.va +
> +					bp_block_offset + bp_idx *
> sizeof(uint64_t));
> +			bp.retired_page = retired_page;
> +
> +			if (amdgpu_virt_check_bad_page(adev,
> retired_page))
> +				continue;
> +
> +			amdgpu_virt_ras_add_bps(adev, &bp, 1);
> +
> +			amdgpu_virt_ras_reserve_bps(adev);
> +		}
> +	}
> +}
> +
>  void amdgpu_virt_init_data_exchange(struct amdgpu_device *adev)  {
>  	uint32_t pf2vf_size = 0;
>  	uint32_t checksum = 0;
>  	uint32_t checkval;
>  	char *str;
> +	uint64_t bp_block_offset = 0;
> +	uint32_t bp_block_size = 0;
> 
>  	adev->virt.fw_reserve.p_pf2vf = NULL;
>  	adev->virt.fw_reserve.p_vf2pf = NULL;
> @@ -275,6 +428,17 @@ void amdgpu_virt_init_data_exchange(struct
> amdgpu_device *adev)
> 
>  		/* pf2vf message must be in 4K */
>  		if (pf2vf_size > 0 && pf2vf_size < 4096) {
> +			if (adev->virt.fw_reserve.p_pf2vf->version == 2) {
> +				struct amdgim_pf2vf_info_v2 *pf2vf_v2 =
> NULL;
> +
> +				pf2vf_v2 = (struct amdgim_pf2vf_info_v2
> *)adev->virt.fw_reserve.p_pf2vf;
> +				bp_block_offset = ((uint64_t)pf2vf_v2-
> >bp_block_offset_L & 0xFFFFFFFF) |
> +						((((uint64_t)pf2vf_v2-
> >bp_block_offset_H) << 32) & 0xFFFFFFFF00000000);
> +				bp_block_size = pf2vf_v2->bp_block_size;
> +
> +				amdgpu_virt_add_bad_page(adev,
> bp_block_offset, bp_block_size);
> +			}
> +
>  			checkval = amdgpu_virt_fw_reserve_get_checksum(
>  				adev->virt.fw_reserve.p_pf2vf, pf2vf_size,
>  				adev->virt.fw_reserve.checksum_key,
> checksum); diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h
> old mode 100644
> new mode 100755
> index b90e822cebd7..96d84f036e96
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h
> @@ -143,19 +143,27 @@ struct  amdgim_pf2vf_info_v2 {
>  	uint32_t vce_enc_max_pixels_count;
>  	/* 16x16 pixels/sec, codec independent */
>  	uint32_t vce_enc_max_bandwidth;
> +	/* Bad pages block position in BYTE */
> +	uint32_t bp_block_offset_L;
> +	uint32_t bp_block_offset_H;
> +	/* Bad pages block size in BYTE */
> +	uint32_t bp_block_size;
>  	/* MEC FW position in kb from the start of VF visible frame buffer */
> -	uint64_t mecfw_kboffset;
> +	uint32_t mecfw_kboffset_L;
> +	uint32_t mecfw_kboffset_H;
> 
> [Hawking]:
> 1. can you just explain the reason that split the position in lower 32bit and
> higher 32 bit respectively?
> 
>  	/* MEC FW size in KB */
>  	uint32_t mecfw_ksize;
>  	/* UVD FW position in kb from the start of VF visible frame buffer */
> -	uint64_t uvdfw_kboffset;
> +	uint32_t uvdfw_kboffset_L;
> +	uint32_t uvdfw_kboffset_H;
>  	/* UVD FW size in KB */
>  	uint32_t uvdfw_ksize;
>  	/* VCE FW position in kb from the start of VF visible frame buffer */
> -	uint64_t vcefw_kboffset;
> +	uint32_t vcefw_kboffset_L;
> +	uint32_t vcefw_kboffset_H;
>  	/* VCE FW size in KB */
>  	uint32_t vcefw_ksize;
> -	uint32_t reserved[AMDGIM_GET_STRUCTURE_RESERVED_SIZE(256,
> 0, 0, (9 + sizeof(struct amd_sriov_msg_pf2vf_info_header)/sizeof(uint32_t)),
> 3)];
> +	uint32_t reserved[AMDGIM_GET_STRUCTURE_RESERVED_SIZE(256,
> 0, 0, (18 +
> +sizeof(struct amd_sriov_msg_pf2vf_info_header)/sizeof(uint32_t)), 0)];
>  } __aligned(4);
> 
> 
> @@ -254,6 +262,17 @@ typedef struct amdgim_vf2pf_info_v2
> amdgim_vf2pf_info ;
>  		} \
>  	} while (0)
> 
> +struct virt_ras_err_handler_data {
> +	/* point to bad page records array */
> +	struct eeprom_table_record *bps;
> +	/* point to reserved bo array */
> +	struct amdgpu_bo **bps_bo;
> +	/* the count of entries */
> +	int count;
> +	/* last reserved entry's index + 1 */
> +	int last_reserved;
> +};
> +
>  /* GPU virtualization */
>  struct amdgpu_virt {
>  	uint32_t			caps;
> @@ -272,6 +291,7 @@ struct amdgpu_virt {
>  	uint32_t reg_access_mode;
>  	int req_init_data_ver;
>  	bool tdr_debug;
> +	struct virt_ras_err_handler_data *virt_eh_data;
>  };
> 
>  #define amdgpu_sriov_enabled(adev) \
> @@ -323,6 +343,8 @@ void amdgpu_virt_free_mm_table(struct
> amdgpu_device *adev);  int amdgpu_virt_fw_reserve_get_checksum(void
> *obj, unsigned long obj_size,
>  					unsigned int key,
>  					unsigned int chksum);
> +void amdgpu_release_virt_err_handler_data(struct amdgpu_device
> *adev);
> +int amdgpu_virt_init_err_handler_data(struct amdgpu_device *adev);
>  void amdgpu_virt_init_data_exchange(struct amdgpu_device *adev);  void
> amdgpu_detect_virtualization(struct amdgpu_device *adev);
> 
> --
> 2.25.1
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
