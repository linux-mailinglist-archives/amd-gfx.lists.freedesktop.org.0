Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D625334617A
	for <lists+amd-gfx@lfdr.de>; Tue, 23 Mar 2021 15:30:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD5C06E8D0;
	Tue, 23 Mar 2021 14:30:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770053.outbound.protection.outlook.com [40.107.77.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6D2F6E8D0;
 Tue, 23 Mar 2021 14:30:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bj1zz4ecDaA1WeatZA9CS93nQtBUmyi/6lYi+BVDs7zqgk3G+/nBhKtFscsba4Zk4EpA6WYvfaY2w+JBFStNNxDdhxfo4ZzS5UGSJbtyXz+QX18n0xYsz2Y1IvFSvcJSYl5wU0Qd9gyQ8hudh/8cQBQmsUhOSjvEenhGDB9gpzARciuTBd/NWXvfLBITyxcXaBM5F468DsICpYkxA+2xhnvdttqDseUXXN0fBa0FpANKJiluL5VEtRkPxJFFZfLr/CqG5dBitY2HEkh0V0cV8dmGEd+7sZ09WPoYxq0oOZdFM9jeUZR9/aQTbaWj/TZUoXV7RwKrqEZlsIV8rBaW3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sxxciAzDCEgCz1dA+KCVgjPspzJkNdZn5KOuL0Ha0Pg=;
 b=PFrfjYWJ7T+fQ2aXwZhyUZKV0RYT7ZJokVQt8h7DNSFlr3H0nXeSrpbFK9FTurL13URlb+uoPrfFRNSKF0pQxFQXHCv5b1vSsIIBIy/plmckIrrmsjcGtjCqZKLlh1Tvgm8FwfSplfch3WAvzCZY6eJMGzVX8j5AY7rra5Wm68emT5r7xbmjkN0IT3yaDFfIiZwTFi72DUwcsBznb5ToiIqsaEk+6mrF4tC0djXNV3fj1bcR4d74dScVWC3PSUvKv5Qm0HOrAdtJLlWoHBc359ZFeRERQc7BY4309Owa7HZxqapz7IulVLSVkGYrpP9zVstvR3kscCf/6sjRJ0UL+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sxxciAzDCEgCz1dA+KCVgjPspzJkNdZn5KOuL0Ha0Pg=;
 b=ocRfiMTdFUZD0WCLnN6onu9xbkxhJFbAyaNhAM+xvZ2X95+mtJ4vGh5/Pw0hLbu+u1svM/84+VYIw4wDfjCniU3yRs5jxWjQhCipc7kskr091V5+UiG2CQvpxl5F3QHt5xlL9x6+Dc9g6DZReLYWXvLEP+w/UgbHgC7GLLsp2xo=
Received: from DM5PR12MB4680.namprd12.prod.outlook.com (2603:10b6:4:a6::33) by
 DM5PR1201MB0122.namprd12.prod.outlook.com (2603:10b6:4:57::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.24; Tue, 23 Mar 2021 14:30:36 +0000
Received: from DM5PR12MB4680.namprd12.prod.outlook.com
 ([fe80::b193:3bb1:c6d8:aeec]) by DM5PR12MB4680.namprd12.prod.outlook.com
 ([fe80::b193:3bb1:c6d8:aeec%3]) with mapi id 15.20.3977.024; Tue, 23 Mar 2021
 14:30:36 +0000
From: "Kim, Jonathan" <Jonathan.Kim@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 01/44] drm/amdgpu: replace per_device_list by array
Thread-Topic: [PATCH 01/44] drm/amdgpu: replace per_device_list by array
Thread-Index: AQHXHwuWV5/kHVKL5keDut7Q1zTCp6qRof2g
Date: Tue, 23 Mar 2021 14:30:36 +0000
Message-ID: <DM5PR12MB4680A8DF9B38930DB341A01185649@DM5PR12MB4680.namprd12.prod.outlook.com>
References: <20210322105900.14068-1-Felix.Kuehling@amd.com>
 <20210322105900.14068-2-Felix.Kuehling@amd.com>
In-Reply-To: <20210322105900.14068-2-Felix.Kuehling@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ActionId=5f153227-ef7f-425a-9b2f-ded16e58bb35;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=0;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal
 Use Only - Unrestricted;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2021-03-23T14:23:06Z;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [2607:fea8:7a2:ec00:d4dd:9129:e776:9b6d]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a2998169-489b-48c7-f60e-08d8ee08395f
x-ms-traffictypediagnostic: DM5PR1201MB0122:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR1201MB012255E5764659EB38A7800D85649@DM5PR1201MB0122.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:232;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eFIBf24zRlxVjYDsuOCarO2uzLAPLBWz3tj2MeFEGIuuNLH8o+Xyz3TeHvOTgKvHipFtLLYA7Z7x+11Bo+LaAiLW2Sd84Y/HoKmW1in5HNe/qk1Y00ae4hK5/SgzBXbBUFgo6W9H5h3KKZGaVPNpm/wNxPQ1VjzUga+INYJUxH+DaUAwc564EnrmFEL+UT0lCVRMRKO2dWGMmiMosPRSsV49GtaScJl9XCpVvijC1TIjWawN4x/6Br9MXTgUc5zAAMBA0lD2AF1/I4rkoLJa0k54r2W09q+U9O5ReMMGh2kfH5yN22ZRE3BAJGOIXfXuLuPkJUZRu5+Gqseqhvb2UvfV6cr7MLan4uJrcInAugxnM6vsOhMR4ycezn1XmVFw9bez/ef7uwglO0ubLN8W84QH3C2k7kj0Xpx2FVkyAUdaMh8TZPjrtazts+fQhPfKcSfTYuunfZeYFcuRxzYJNxmMHB68f17BeorVGH9QGt3avI8v6ZefRnw1EojfC1h7VriTIzu8JThPqB+WI8Lf/u2QOgc+tit4voZc64cH18gm49bZEbFPmmAPRiepltPM9MiSIZBl7fLJNiuJoChXmuLPvloPNeNqzizplOnsmfYVijZAfvQoJwP5ovHhL/UfVYr6jCciY3Od+j0lJwO1DnG9LKeI8qk1wK407PgziG5Io8yp85fEptyoFrJtSF+Wx84JlFitlgyUPjlIFsUk+5nGPQ33QeAgvLuhZvkc/ARjjaoBEg/sn4XtsiQoefTo
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB4680.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(39840400004)(346002)(366004)(376002)(30864003)(8936002)(5660300002)(66446008)(55016002)(110136005)(45080400002)(83380400001)(66476007)(86362001)(66556008)(64756008)(6506007)(8676002)(38100700001)(9686003)(4326008)(2906002)(52536014)(450100002)(478600001)(966005)(66946007)(186003)(53546011)(76116006)(33656002)(316002)(7696005)(71200400001)(579004)(559001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?ITQOOPh/tlZqFtORAMxmbV1PKG9SGzjhU6C6acJu8GJIcfhVBsPn4OLolxem?=
 =?us-ascii?Q?kFWOTIM7Q1aiGQg9ZPcT23u5fDg0WX4gbVgzwlZgk/y4jXcTelgfFwBZHkx6?=
 =?us-ascii?Q?4umrhr2Qz4XtTlduJSqR30hwuwQrrnwKyGcEHY0CngJgYXnhFcS2Ze49aODk?=
 =?us-ascii?Q?I3yOsk+rrMA7jiEx8qVMAZOZ5RszmWaznBIrbzqkrjI8JPiNXMqiUXumtbKg?=
 =?us-ascii?Q?0MpwTUPQvMGEQ5wPPhd8nfqO3RBaQCl0pX0xnXU52Pf4AFk15Eee2l9OX7mn?=
 =?us-ascii?Q?QBL58K8CFFoqEMqSC2N12sLKjBkXtbjCBF6PkIM4WZsZTAlKT9uHS4faR5xU?=
 =?us-ascii?Q?nEHT+rdl+J3wK5iztqGlSKZnJvRNJmbYu+Z5u05eMcF4rRgLhPZlm6QY4+Jq?=
 =?us-ascii?Q?7TxWhKO7UKhb4lbAlIzmS+yZlBPhrsxvojcm2MeeIUdIevjx/JiKpHeGZbz5?=
 =?us-ascii?Q?AkZkJSUJTAJ2NP5ZWn5dHQmduTP7JQvor/jaTaxYoRSS71qCpQqySYWTlgBu?=
 =?us-ascii?Q?LVHDTSJu24flDQuh8y8FvWH7EW/qlYCYc6pC7nLHnjICxDCZ+m5vf/Unj+lR?=
 =?us-ascii?Q?ye2cV0KfYSADr3RCC9Om1rfFmJ1VqlSYqJqZotNfzMuI9BRcXvW5ddhs2aDp?=
 =?us-ascii?Q?7XUItKTtGbrlDTYtXn9PJxu0m8GVs7ZL5d5WAWQczUIgXX5WFvXBhuVFAwXm?=
 =?us-ascii?Q?uUMelXUVL1kQZ7phlXnjW3OezoaaNHq7zuCVTAKJQt0fzz0bpXN9R8b2MbE7?=
 =?us-ascii?Q?vsO6UwlsnVG8H5a8tao1uFyiX/GjUj4PIg4CLekpoNUcenqFn+s9116xogav?=
 =?us-ascii?Q?gfWkGduq758wdmpQ1BAkaMCFZfmFjEnki3gd5cpBtIuLZoU17EGuqzR0V3hR?=
 =?us-ascii?Q?tPU9UYD/Ol7bcWGN+byRXh+715IT2Zu0Jy4BMzgGtaqvU3aJnTi343TYxviq?=
 =?us-ascii?Q?ugff6zHtWFc3aSWc95oDGu+PQj1dR3K1p5kXMmCO07ssM/9UMZUx/cdiBgnU?=
 =?us-ascii?Q?suPAYulV+r4Jb0UUaeQL1/KUD0MHUWS6NObAY+ey8GIsjLuxArnHE50Ps/Fx?=
 =?us-ascii?Q?FBoxCZQmyf++psgkz5TJnGeo871ui62b4i40hG4UFLkFso4WdlmEqfGI27C1?=
 =?us-ascii?Q?6ST8w9S1dm+Bljyj0bMo4xxu1zLOOhucPxOi8FdGUIIHjv3mg0JX/yGQIDC1?=
 =?us-ascii?Q?xC0KG4ujcobBhFinge+QnHlm989v5zKsOWCgY/mx/KEJR2iCmlFaIBUGc+7h?=
 =?us-ascii?Q?LzP/bzPEa0xB91ote3xB78TXAabNRidfaNRs+zmFCNjX7K6NjewOFdszqMW6?=
 =?us-ascii?Q?Nnn1AfpGW5gGlIgCF3dACRWEUt4hNnTUGKGI/clIgysek8V41l/GmfgzCSOL?=
 =?us-ascii?Q?Gj0sQGGfFrh2OHhOpvvfOMm1MqUI?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB4680.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2998169-489b-48c7-f60e-08d8ee08395f
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2021 14:30:36.0745 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g+evrmP+NoXo4Ss/cvhtgG4t7IBt6YmWgQpGVSPh4QxI23WUBrnxMkdVuBn0SNVY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0122
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
Cc: "Sierra Guiza, Alejandro \(Alex\)" <Alex.Sierra@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

[AMD Official Use Only - Internal Distribution Only]

> -----Original Message-----
> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Felix
> Kuehling
> Sent: Monday, March 22, 2021 6:58 AM
> To: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org
> Cc: Sierra Guiza, Alejandro (Alex) <Alex.Sierra@amd.com>
> Subject: [PATCH 01/44] drm/amdgpu: replace per_device_list by array
>
> [CAUTION: External Email]
>
> From: Alex Sierra <alex.sierra@amd.com>
>
> Remove per_device_list from kfd_process and replace it with a
> kfd_process_device pointers array of MAX_GPU_INSTANCES size. This helps
> to manage the kfd_process_devices binded to a specific kfd_process.
> Also, functions used by kfd_chardev to iterate over the list were removed,
> since they are not valid anymore. Instead, it was replaced by a local loop
> iterating the array.
>
> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
> Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>

As discussed, this patch is required to sync internal branches for the KFD and is
Reviewed-by: Jonathan Kim <jonathan.kim@amd.com>

> ---
>  drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      | 116 ++++++++----------
>  drivers/gpu/drm/amd/amdkfd/kfd_iommu.c        |   8 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_priv.h         |  20 +--
>  drivers/gpu/drm/amd/amdkfd/kfd_process.c      | 108 ++++++++--------
>  .../amd/amdkfd/kfd_process_queue_manager.c    |   6 +-
>  5 files changed, 111 insertions(+), 147 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> index 6802c616e10e..43de260b2230 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> @@ -870,52 +870,47 @@ static int kfd_ioctl_get_process_apertures(struct
> file *filp,  {
>         struct kfd_ioctl_get_process_apertures_args *args = data;
>         struct kfd_process_device_apertures *pAperture;
> -       struct kfd_process_device *pdd;
> +       int i;
>
>         dev_dbg(kfd_device, "get apertures for PASID 0x%x", p->pasid);
>
>         args->num_of_nodes = 0;
>
>         mutex_lock(&p->mutex);
> +       /* Run over all pdd of the process */
> +       for (i = 0; i < p->n_pdds; i++) {
> +               struct kfd_process_device *pdd = p->pdds[i];
> +
> +               pAperture =
> +                       &args->process_apertures[args->num_of_nodes];
> +               pAperture->gpu_id = pdd->dev->id;
> +               pAperture->lds_base = pdd->lds_base;
> +               pAperture->lds_limit = pdd->lds_limit;
> +               pAperture->gpuvm_base = pdd->gpuvm_base;
> +               pAperture->gpuvm_limit = pdd->gpuvm_limit;
> +               pAperture->scratch_base = pdd->scratch_base;
> +               pAperture->scratch_limit = pdd->scratch_limit;
>
> -       /*if the process-device list isn't empty*/
> -       if (kfd_has_process_device_data(p)) {
> -               /* Run over all pdd of the process */
> -               pdd = kfd_get_first_process_device_data(p);
> -               do {
> -                       pAperture =
> -                               &args->process_apertures[args->num_of_nodes];
> -                       pAperture->gpu_id = pdd->dev->id;
> -                       pAperture->lds_base = pdd->lds_base;
> -                       pAperture->lds_limit = pdd->lds_limit;
> -                       pAperture->gpuvm_base = pdd->gpuvm_base;
> -                       pAperture->gpuvm_limit = pdd->gpuvm_limit;
> -                       pAperture->scratch_base = pdd->scratch_base;
> -                       pAperture->scratch_limit = pdd->scratch_limit;
> -
> -                       dev_dbg(kfd_device,
> -                               "node id %u\n", args->num_of_nodes);
> -                       dev_dbg(kfd_device,
> -                               "gpu id %u\n", pdd->dev->id);
> -                       dev_dbg(kfd_device,
> -                               "lds_base %llX\n", pdd->lds_base);
> -                       dev_dbg(kfd_device,
> -                               "lds_limit %llX\n", pdd->lds_limit);
> -                       dev_dbg(kfd_device,
> -                               "gpuvm_base %llX\n", pdd->gpuvm_base);
> -                       dev_dbg(kfd_device,
> -                               "gpuvm_limit %llX\n", pdd->gpuvm_limit);
> -                       dev_dbg(kfd_device,
> -                               "scratch_base %llX\n", pdd->scratch_base);
> -                       dev_dbg(kfd_device,
> -                               "scratch_limit %llX\n", pdd->scratch_limit);
> -
> -                       args->num_of_nodes++;
> -
> -                       pdd = kfd_get_next_process_device_data(p, pdd);
> -               } while (pdd && (args->num_of_nodes <
> NUM_OF_SUPPORTED_GPUS));
> -       }
> +               dev_dbg(kfd_device,
> +                       "node id %u\n", args->num_of_nodes);
> +               dev_dbg(kfd_device,
> +                       "gpu id %u\n", pdd->dev->id);
> +               dev_dbg(kfd_device,
> +                       "lds_base %llX\n", pdd->lds_base);
> +               dev_dbg(kfd_device,
> +                       "lds_limit %llX\n", pdd->lds_limit);
> +               dev_dbg(kfd_device,
> +                       "gpuvm_base %llX\n", pdd->gpuvm_base);
> +               dev_dbg(kfd_device,
> +                       "gpuvm_limit %llX\n", pdd->gpuvm_limit);
> +               dev_dbg(kfd_device,
> +                       "scratch_base %llX\n", pdd->scratch_base);
> +               dev_dbg(kfd_device,
> +                       "scratch_limit %llX\n", pdd->scratch_limit);
>
> +               if (++args->num_of_nodes >= NUM_OF_SUPPORTED_GPUS)
> +                       break;
> +       }
>         mutex_unlock(&p->mutex);
>
>         return 0;
> @@ -926,9 +921,8 @@ static int
> kfd_ioctl_get_process_apertures_new(struct file *filp,  {
>         struct kfd_ioctl_get_process_apertures_new_args *args = data;
>         struct kfd_process_device_apertures *pa;
> -       struct kfd_process_device *pdd;
> -       uint32_t nodes = 0;
>         int ret;
> +       int i;
>
>         dev_dbg(kfd_device, "get apertures for PASID 0x%x", p->pasid);
>
> @@ -937,17 +931,7 @@ static int
> kfd_ioctl_get_process_apertures_new(struct file *filp,
>                  * sufficient memory
>                  */
>                 mutex_lock(&p->mutex);
> -
> -               if (!kfd_has_process_device_data(p))
> -                       goto out_unlock;
> -
> -               /* Run over all pdd of the process */
> -               pdd = kfd_get_first_process_device_data(p);
> -               do {
> -                       args->num_of_nodes++;
> -                       pdd = kfd_get_next_process_device_data(p, pdd);
> -               } while (pdd);
> -
> +               args->num_of_nodes = p->n_pdds;
>                 goto out_unlock;
>         }
>
> @@ -962,22 +946,23 @@ static int
> kfd_ioctl_get_process_apertures_new(struct file *filp,
>
>         mutex_lock(&p->mutex);
>
> -       if (!kfd_has_process_device_data(p)) {
> +       if (!p->n_pdds) {
>                 args->num_of_nodes = 0;
>                 kfree(pa);
>                 goto out_unlock;
>         }
>
>         /* Run over all pdd of the process */
> -       pdd = kfd_get_first_process_device_data(p);
> -       do {
> -               pa[nodes].gpu_id = pdd->dev->id;
> -               pa[nodes].lds_base = pdd->lds_base;
> -               pa[nodes].lds_limit = pdd->lds_limit;
> -               pa[nodes].gpuvm_base = pdd->gpuvm_base;
> -               pa[nodes].gpuvm_limit = pdd->gpuvm_limit;
> -               pa[nodes].scratch_base = pdd->scratch_base;
> -               pa[nodes].scratch_limit = pdd->scratch_limit;
> +       for (i = 0; i < min(p->n_pdds, args->num_of_nodes); i++) {
> +               struct kfd_process_device *pdd = p->pdds[i];
> +
> +               pa[i].gpu_id = pdd->dev->id;
> +               pa[i].lds_base = pdd->lds_base;
> +               pa[i].lds_limit = pdd->lds_limit;
> +               pa[i].gpuvm_base = pdd->gpuvm_base;
> +               pa[i].gpuvm_limit = pdd->gpuvm_limit;
> +               pa[i].scratch_base = pdd->scratch_base;
> +               pa[i].scratch_limit = pdd->scratch_limit;
>
>                 dev_dbg(kfd_device,
>                         "gpu id %u\n", pdd->dev->id); @@ -993,17 +978,14 @@ static int
> kfd_ioctl_get_process_apertures_new(struct file *filp,
>                         "scratch_base %llX\n", pdd->scratch_base);
>                 dev_dbg(kfd_device,
>                         "scratch_limit %llX\n", pdd->scratch_limit);
> -               nodes++;
> -
> -               pdd = kfd_get_next_process_device_data(p, pdd);
> -       } while (pdd && (nodes < args->num_of_nodes));
> +       }
>         mutex_unlock(&p->mutex);
>
> -       args->num_of_nodes = nodes;
> +       args->num_of_nodes = i;
>         ret = copy_to_user(
>                         (void __user *)args->kfd_process_device_apertures_ptr,
>                         pa,
> -                       (nodes * sizeof(struct kfd_process_device_apertures)));
> +                       (i * sizeof(struct
> + kfd_process_device_apertures)));
>         kfree(pa);
>         return ret ? -EFAULT : 0;
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_iommu.c
> b/drivers/gpu/drm/amd/amdkfd/kfd_iommu.c
> index 9318936aa805..5a1f2433632b 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_iommu.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_iommu.c
> @@ -135,11 +135,11 @@ int kfd_iommu_bind_process_to_device(struct
> kfd_process_device *pdd)
>   */
>  void kfd_iommu_unbind_process(struct kfd_process *p)  {
> -       struct kfd_process_device *pdd;
> +       int i;
>
> -       list_for_each_entry(pdd, &p->per_device_data, per_device_list)
> -               if (pdd->bound == PDD_BOUND)
> -                       amd_iommu_unbind_pasid(pdd->dev->pdev, p->pasid);
> +       for (i = 0; i < p->n_pdds; i++)
> +               if (p->pdds[i]->bound == PDD_BOUND)
> +                       amd_iommu_unbind_pasid(p->pdds[i]->dev->pdev,
> + p->pasid);
>  }
>
>  /* Callback for process shutdown invoked by the IOMMU driver */ diff --git
> a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> index d8c8b5ff449a..33e56db14327 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> @@ -45,6 +45,7 @@
>  #include <linux/swap.h>
>
>  #include "amd_shared.h"
> +#include "amdgpu.h"
>
>  #define KFD_MAX_RING_ENTRY_SIZE        8
>
> @@ -649,12 +650,6 @@ enum kfd_pdd_bound {
>
>  /* Data that is per-process-per device. */  struct kfd_process_device {
> -       /*
> -        * List of all per-device data for a process.
> -        * Starts from kfd_process.per_device_data.
> -        */
> -       struct list_head per_device_list;
> -
>         /* The device that owns this data. */
>         struct kfd_dev *dev;
>
> @@ -771,10 +766,11 @@ struct kfd_process {
>         u32 pasid;
>
>         /*
> -        * List of kfd_process_device structures,
> +        * Array of kfd_process_device pointers,
>          * one for each device the process is using.
>          */
> -       struct list_head per_device_data;
> +       struct kfd_process_device *pdds[MAX_GPU_INSTANCE];
> +       uint32_t n_pdds;
>
>         struct process_queue_manager pqm;
>
> @@ -872,14 +868,6 @@ void *kfd_process_device_translate_handle(struct
> kfd_process_device *p,  void
> kfd_process_device_remove_obj_handle(struct kfd_process_device *pdd,
>                                         int handle);
>
> -/* Process device data iterator */
> -struct kfd_process_device *kfd_get_first_process_device_data(
> -                                                       struct kfd_process *p);
> -struct kfd_process_device *kfd_get_next_process_device_data(
> -                                               struct kfd_process *p,
> -                                               struct kfd_process_device *pdd);
> -bool kfd_has_process_device_data(struct kfd_process *p);
> -
>  /* PASIDs */
>  int kfd_pasid_init(void);
>  void kfd_pasid_exit(void);
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> index f5237997fa18..d4241d29ea94 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> @@ -505,7 +505,7 @@ static int kfd_sysfs_create_file(struct kfd_process *p,
> struct attribute *attr,  static int kfd_procfs_add_sysfs_stats(struct
> kfd_process *p)  {
>         int ret = 0;
> -       struct kfd_process_device *pdd;
> +       int i;
>         char stats_dir_filename[MAX_SYSFS_FILENAME_LEN];
>
>         if (!p)
> @@ -520,7 +520,8 @@ static int kfd_procfs_add_sysfs_stats(struct
> kfd_process *p)
>          * - proc/<pid>/stats_<gpuid>/evicted_ms
>          * - proc/<pid>/stats_<gpuid>/cu_occupancy
>          */
> -       list_for_each_entry(pdd, &p->per_device_data, per_device_list) {
> +       for (i = 0; i < p->n_pdds; i++) {
> +               struct kfd_process_device *pdd = p->pdds[i];
>                 struct kobject *kobj_stats;
>
>                 snprintf(stats_dir_filename, MAX_SYSFS_FILENAME_LEN, @@ -
> 571,7 +572,7 @@ static int kfd_procfs_add_sysfs_stats(struct kfd_process
> *p)  static int kfd_procfs_add_sysfs_files(struct kfd_process *p)  {
>         int ret = 0;
> -       struct kfd_process_device *pdd;
> +       int i;
>
>         if (!p)
>                 return -EINVAL;
> @@ -584,7 +585,9 @@ static int kfd_procfs_add_sysfs_files(struct
> kfd_process *p)
>          * - proc/<pid>/vram_<gpuid>
>          * - proc/<pid>/sdma_<gpuid>
>          */
> -       list_for_each_entry(pdd, &p->per_device_data, per_device_list) {
> +       for (i = 0; i < p->n_pdds; i++) {
> +               struct kfd_process_device *pdd = p->pdds[i];
> +
>                 snprintf(pdd->vram_filename, MAX_SYSFS_FILENAME_LEN,
> "vram_%u",
>                          pdd->dev->id);
>                 ret = kfd_sysfs_create_file(p, &pdd->attr_vram, pdd-
> >vram_filename); @@ -881,21 +884,23 @@ void kfd_unref_process(struct
> kfd_process *p)
>         kref_put(&p->ref, kfd_process_ref_release);  }
>
> +
>  static void kfd_process_device_free_bos(struct kfd_process_device *pdd)
> {
>         struct kfd_process *p = pdd->process;
>         void *mem;
>         int id;
> +       int i;
>
>         /*
>          * Remove all handles from idr and release appropriate
>          * local memory object
>          */
>         idr_for_each_entry(&pdd->alloc_idr, mem, id) {
> -               struct kfd_process_device *peer_pdd;
>
> -               list_for_each_entry(peer_pdd, &p->per_device_data,
> -                                   per_device_list) {
> +               for (i = 0; i < p->n_pdds; i++) {
> +                       struct kfd_process_device *peer_pdd =
> + p->pdds[i];
> +
>                         if (!peer_pdd->vm)
>                                 continue;
>                         amdgpu_amdkfd_gpuvm_unmap_memory_from_gpu(
> @@ -909,18 +914,19 @@ static void kfd_process_device_free_bos(struct
> kfd_process_device *pdd)
>
>  static void kfd_process_free_outstanding_kfd_bos(struct kfd_process *p)  {
> -       struct kfd_process_device *pdd;
> +       int i;
>
> -       list_for_each_entry(pdd, &p->per_device_data, per_device_list)
> -               kfd_process_device_free_bos(pdd);
> +       for (i = 0; i < p->n_pdds; i++)
> +               kfd_process_device_free_bos(p->pdds[i]);
>  }
>
>  static void kfd_process_destroy_pdds(struct kfd_process *p)  {
> -       struct kfd_process_device *pdd, *temp;
> +       int i;
> +
> +       for (i = 0; i < p->n_pdds; i++) {
> +               struct kfd_process_device *pdd = p->pdds[i];
>
> -       list_for_each_entry_safe(pdd, temp, &p->per_device_data,
> -                                per_device_list) {
>                 pr_debug("Releasing pdd (topology id %d) for process (pasid
> 0x%x)\n",
>                                 pdd->dev->id, p->pasid);
>
> @@ -933,8 +939,6 @@ static void kfd_process_destroy_pdds(struct
> kfd_process *p)
>                         amdgpu_amdkfd_gpuvm_destroy_process_vm(
>                                 pdd->dev->kgd, pdd->vm);
>
> -               list_del(&pdd->per_device_list);
> -
>                 if (pdd->qpd.cwsr_kaddr && !pdd->qpd.cwsr_base)
>                         free_pages((unsigned long)pdd->qpd.cwsr_kaddr,
>                                 get_order(KFD_CWSR_TBA_TMA_SIZE));
> @@ -955,7 +959,9 @@ static void kfd_process_destroy_pdds(struct
> kfd_process *p)
>                 }
>
>                 kfree(pdd);
> +               p->pdds[i] = NULL;
>         }
> +       p->n_pdds = 0;
>  }
>
>  /* No process locking is needed in this function, because the process @@ -
> 967,7 +973,7 @@ static void kfd_process_wq_release(struct work_struct
> *work)  {
>         struct kfd_process *p = container_of(work, struct kfd_process,
>                                              release_work);
> -       struct kfd_process_device *pdd;
> +       int i;
>
>         /* Remove the procfs files */
>         if (p->kobj) {
> @@ -976,7 +982,9 @@ static void kfd_process_wq_release(struct
> work_struct *work)
>                 kobject_put(p->kobj_queues);
>                 p->kobj_queues = NULL;
>
> -               list_for_each_entry(pdd, &p->per_device_data, per_device_list) {
> +               for (i = 0; i < p->n_pdds; i++) {
> +                       struct kfd_process_device *pdd = p->pdds[i];
> +
>                         sysfs_remove_file(p->kobj, &pdd->attr_vram);
>                         sysfs_remove_file(p->kobj, &pdd->attr_sdma);
>                         sysfs_remove_file(p->kobj, &pdd->attr_evict); @@ -1036,7
> +1044,7 @@ static void kfd_process_notifier_release(struct mmu_notifier
> *mn,
>                                         struct mm_struct *mm)  {
>         struct kfd_process *p;
> -       struct kfd_process_device *pdd = NULL;
> +       int i;
>
>         /*
>          * The kfd_process structure can not be free because the @@ -1060,8
> +1068,8 @@ static void kfd_process_notifier_release(struct mmu_notifier
> *mn,
>          * pdd is in debug mode, we should first force unregistration,
>          * then we will be able to destroy the queues
>          */
> -       list_for_each_entry(pdd, &p->per_device_data, per_device_list) {
> -               struct kfd_dev *dev = pdd->dev;
> +       for (i = 0; i < p->n_pdds; i++) {
> +               struct kfd_dev *dev = p->pdds[i]->dev;
>
>                 mutex_lock(kfd_get_dbgmgr_mutex());
>                 if (dev && dev->dbgmgr && dev->dbgmgr->pasid == p->pasid) { @@
> -1098,11 +1106,11 @@ static const struct mmu_notifier_ops
> kfd_process_mmu_notifier_ops = {  static int
> kfd_process_init_cwsr_apu(struct kfd_process *p, struct file *filep)  {
>         unsigned long  offset;
> -       struct kfd_process_device *pdd;
> +       int i;
>
> -       list_for_each_entry(pdd, &p->per_device_data, per_device_list) {
> -               struct kfd_dev *dev = pdd->dev;
> -               struct qcm_process_device *qpd = &pdd->qpd;
> +       for (i = 0; i < p->n_pdds; i++) {
> +               struct kfd_dev *dev = p->pdds[i]->dev;
> +               struct qcm_process_device *qpd = &p->pdds[i]->qpd;
>
>                 if (!dev->cwsr_enabled || qpd->cwsr_kaddr || qpd->cwsr_base)
>                         continue;
> @@ -1199,7 +1207,7 @@ static struct kfd_process *create_process(const
> struct task_struct *thread)
>         mutex_init(&process->mutex);
>         process->mm = thread->mm;
>         process->lead_thread = thread->group_leader;
> -       INIT_LIST_HEAD(&process->per_device_data);
> +       process->n_pdds = 0;
>         INIT_DELAYED_WORK(&process->eviction_work,
> evict_process_worker);
>         INIT_DELAYED_WORK(&process->restore_work,
> restore_process_worker);
>         process->last_restore_timestamp = get_jiffies_64(); @@ -1290,11
> +1298,11 @@ static int init_doorbell_bitmap(struct qcm_process_device
> *qpd,  struct kfd_process_device *kfd_get_process_device_data(struct
> kfd_dev *dev,
>                                                         struct kfd_process *p)  {
> -       struct kfd_process_device *pdd = NULL;
> +       int i;
>
> -       list_for_each_entry(pdd, &p->per_device_data, per_device_list)
> -               if (pdd->dev == dev)
> -                       return pdd;
> +       for (i = 0; i < p->n_pdds; i++)
> +               if (p->pdds[i]->dev == dev)
> +                       return p->pdds[i];
>
>         return NULL;
>  }
> @@ -1304,6 +1312,8 @@ struct kfd_process_device
> *kfd_create_process_device_data(struct kfd_dev *dev,  {
>         struct kfd_process_device *pdd = NULL;
>
> +       if (WARN_ON_ONCE(p->n_pdds >= MAX_GPU_INSTANCE))
> +               return NULL;
>         pdd = kzalloc(sizeof(*pdd), GFP_KERNEL);
>         if (!pdd)
>                 return NULL;
> @@ -1332,7 +1342,7 @@ struct kfd_process_device
> *kfd_create_process_device_data(struct kfd_dev *dev,
>         pdd->vram_usage = 0;
>         pdd->sdma_past_activity_counter = 0;
>         atomic64_set(&pdd->evict_duration_counter, 0);
> -       list_add(&pdd->per_device_list, &p->per_device_data);
> +       p->pdds[p->n_pdds++] = pdd;
>
>         /* Init idr used for memory handle translation */
>         idr_init(&pdd->alloc_idr);
> @@ -1464,28 +1474,6 @@ struct kfd_process_device
> *kfd_bind_process_to_device(struct kfd_dev *dev,
>         return ERR_PTR(err);
>  }
>
> -struct kfd_process_device *kfd_get_first_process_device_data(
> -                                               struct kfd_process *p)
> -{
> -       return list_first_entry(&p->per_device_data,
> -                               struct kfd_process_device,
> -                               per_device_list);
> -}
> -
> -struct kfd_process_device *kfd_get_next_process_device_data(
> -                                               struct kfd_process *p,
> -                                               struct kfd_process_device *pdd)
> -{
> -       if (list_is_last(&pdd->per_device_list, &p->per_device_data))
> -               return NULL;
> -       return list_next_entry(pdd, per_device_list);
> -}
> -
> -bool kfd_has_process_device_data(struct kfd_process *p) -{
> -       return !(list_empty(&p->per_device_data));
> -}
> -
>  /* Create specific handle mapped to mem from process local memory idr
>   * Assumes that the process lock is held.
>   */
> @@ -1561,11 +1549,13 @@ struct kfd_process
> *kfd_lookup_process_by_mm(const struct mm_struct *mm)
>   */
>  int kfd_process_evict_queues(struct kfd_process *p)  {
> -       struct kfd_process_device *pdd;
>         int r = 0;
> +       int i;
>         unsigned int n_evicted = 0;
>
> -       list_for_each_entry(pdd, &p->per_device_data, per_device_list) {
> +       for (i = 0; i < p->n_pdds; i++) {
> +               struct kfd_process_device *pdd = p->pdds[i];
> +
>                 r = pdd->dev->dqm->ops.evict_process_queues(pdd->dev->dqm,
>                                                             &pdd->qpd);
>                 if (r) {
> @@ -1581,7 +1571,9 @@ int kfd_process_evict_queues(struct kfd_process
> *p)
>         /* To keep state consistent, roll back partial eviction by
>          * restoring queues
>          */
> -       list_for_each_entry(pdd, &p->per_device_data, per_device_list) {
> +       for (i = 0; i < p->n_pdds; i++) {
> +               struct kfd_process_device *pdd = p->pdds[i];
> +
>                 if (n_evicted == 0)
>                         break;
>                 if (pdd->dev->dqm->ops.restore_process_queues(pdd->dev->dqm,
> @@ -1597,10 +1589,12 @@ int kfd_process_evict_queues(struct
> kfd_process *p)
>  /* kfd_process_restore_queues - Restore all user queues of a process */
> int kfd_process_restore_queues(struct kfd_process *p)  {
> -       struct kfd_process_device *pdd;
>         int r, ret = 0;
> +       int i;
> +
> +       for (i = 0; i < p->n_pdds; i++) {
> +               struct kfd_process_device *pdd = p->pdds[i];
>
> -       list_for_each_entry(pdd, &p->per_device_data, per_device_list) {
>                 r = pdd->dev->dqm->ops.restore_process_queues(pdd->dev-
> >dqm,
>                                                               &pdd->qpd);
>                 if (r) {
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
> b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
> index eb1635ac8988..95a6c36cea4c 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
> @@ -126,10 +126,10 @@ int pqm_set_gws(struct process_queue_manager
> *pqm, unsigned int qid,
>
>  void kfd_process_dequeue_from_all_devices(struct kfd_process *p)  {
> -       struct kfd_process_device *pdd;
> +       int i;
>
> -       list_for_each_entry(pdd, &p->per_device_data, per_device_list)
> -               kfd_process_dequeue_from_device(pdd);
> +       for (i = 0; i < p->n_pdds; i++)
> +               kfd_process_dequeue_from_device(p->pdds[i]);
>  }
>
>  int pqm_init(struct process_queue_manager *pqm, struct kfd_process *p)
> --
> 2.31.0
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.
> freedesktop.org%2Fmailman%2Flistinfo%2Famd-
> gfx&amp;data=04%7C01%7Cjonathan.kim%40amd.com%7C83b87ca9f6124f4
> ad72c08d8ed22b77a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7
> C637520080662795937%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAw
> MDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sda
> ta=t0J%2B6x2jBzmcJFLNCQfm%2FKjY0lucHI4nqw4pcAjNGK8%3D&amp;reser
> ved=0
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
