Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E396D6E0A0
	for <lists+amd-gfx@lfdr.de>; Fri, 19 Jul 2019 07:36:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B86E6E578;
	Fri, 19 Jul 2019 05:36:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680053.outbound.protection.outlook.com [40.107.68.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B0A26E57A
 for <amd-gfx@lists.freedesktop.org>; Fri, 19 Jul 2019 05:36:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UmSzbVyTH1+dRtCZo+OZ8M0XUeSwkvoPUO1ddjCNEImTjiLs5pfWKNimWnA7ePdLT8SoWXzijojBU3TiHh3fJUKgBaauFqFZ8EvAnmLSs2OK0VvTqn68x4uink3hnFhNuqipx4k/BIoNcGRQWBvefEG9khYCS3CnrlROtOxfbH3x4OYySfFQx7oyE3y5+yW9/T+T3EcxOOeCy+8qbvezvUm6XdD3RFnMPWvaFdnPbUwYq9OyTJLa5zDvIIYIG0HJSrjiCcbavQ9QcDnhnAd/N4cATVrv9vFB7oaadRt83VVGX3TYVtRA17z9aFBRNufNhCxlgmtRIVPEd+mpAYdEJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ntXywkMgstbWRqMn4SzSJOgXUFsHG0tMYyPnink3DAo=;
 b=TH2mP5OKecz29At3lFxT4BztFqPfhf7ZR20z+GFGCw0YrT3/3cf0kxp1Kf+gsmiTzXA+Zsj2dpcAr54FhM1tuuYJvcHmkhmNB/9SJMHaZwthjtuEKMjODsz1vHmRTUVeUsZn676Nen7S5eGMSip3ReXFfzhUyB5LDZJwardl0EkfBLMtMinKJCm0QO01a1JwBblqDOpq3X9BYv6F3eYz/2eZfOJho6RzPpgwsH3iSQ/+ixgX6JIW9KeMy2mvFJXDh5Jl//lOTS5R91FRckJz6fK5ZXpNMDsPbakPa8XMry/oDnjiEy53/+aEBxe8DURbIzz8x4M8Gi8KpWU8SeUFQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB3536.namprd12.prod.outlook.com (20.179.83.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.12; Fri, 19 Jul 2019 05:36:20 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::ad59:f055:2417:660f]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::ad59:f055:2417:660f%6]) with mapi id 15.20.2094.013; Fri, 19 Jul 2019
 05:36:20 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amd/powerplay: custom peak clock freq for navi10
Thread-Topic: [PATCH] drm/amd/powerplay: custom peak clock freq for navi10
Thread-Index: AQHVPeRrrwjCEvFq1k2763SRVfn3ZabRYb4QgAAHgY4=
Date: Fri, 19 Jul 2019 05:36:20 +0000
Message-ID: <MN2PR12MB329645069BD87A5E337E5CD0A2CB0@MN2PR12MB3296.namprd12.prod.outlook.com>
References: <20190719034517.25780-1-kevin1.wang@amd.com>,
 <MN2PR12MB3344FA52A933E4922488E720E4CB0@MN2PR12MB3344.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB3344FA52A933E4922488E720E4CB0@MN2PR12MB3344.namprd12.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bee01215-1495-4d61-e670-08d70c0b0759
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3536; 
x-ms-traffictypediagnostic: MN2PR12MB3536:
x-microsoft-antispam-prvs: <MN2PR12MB3536630DFD88A0D673E4C97CA2CB0@MN2PR12MB3536.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 01039C93E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(376002)(39860400002)(396003)(366004)(13464003)(199004)(189003)(6246003)(53936002)(68736007)(7736002)(478600001)(486006)(476003)(316002)(446003)(33656002)(74316002)(86362001)(11346002)(8676002)(19627405001)(99286004)(25786009)(54896002)(9686003)(55016002)(6436002)(4326008)(54906003)(14454004)(110136005)(14444005)(256004)(66066001)(8936002)(81166006)(186003)(81156014)(71190400001)(71200400001)(2906002)(6116002)(3846002)(66446008)(66556008)(64756008)(76116006)(66946007)(52536014)(91956017)(2501003)(102836004)(229853002)(5660300002)(76176011)(7696005)(6506007)(53546011)(6606003)(66476007)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3536;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ouh2wZwzfM8WuglYRb7WZ8msLTipRuIJXwyTOLIhYv/lN7EwGWc7mGVeiY7/ZCo7xrBF14DNJqHeSe+wvC548hxsE4RTnZJyQbJR99oJ/sfdx5X45O/z/JZIbox0h58Bk3PkU4rmQjxJp8SkOKwTZii+N+wHQqLulqPIwGsJpKkC6sMQdzY9bWwoWivqqvFY4LH3c6TxGNNhgHtgY4hGsinqydlbocJ5xTti7OApDUsmLnC615UvJAFL5pl/5cvE154Gc6oc7sNrVcw7PijwRmj01LkYfJNE4K7OAuvO0RLJ55MJ8uAWhYP9AZhnB5/LLWdYL1CvHmkCKiFjstp/Ejct2bOAH7secW19pFUfJao22uvYqCsArgbn/1LGBBvqb1nANyQRO1pUqGldSDzuN+W9EbsJSSCWHFfstIPCuJw=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bee01215-1495-4d61-e670-08d70c0b0759
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2019 05:36:20.1691 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kevwa@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3536
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ntXywkMgstbWRqMn4SzSJOgXUFsHG0tMYyPnink3DAo=;
 b=Bb91nEcHsrvffdqPZCY+wwc8XtKy2csQGY5UHdKK6v3XTh5gicjv8adHv/SkUcEyoWmeX43SED3T+47TyH2M951ovGtYK3lRzpjNzmIcKv8koqfC76wXjNiqVpNA5/MQObgpcW3N35YhaJpH+v2a31N8sW8QjruRQ1ItsYJcE6c=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kevin1.Wang@amd.com; 
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
Cc: "Xu, Feifei" <Feifei.Xu@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>, "Feng,
 Kenneth" <Kenneth.Feng@amd.com>, "Gui, Jack" <Jack.Gui@amd.com>
Content-Type: multipart/mixed; boundary="===============1494346727=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1494346727==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB329645069BD87A5E337E5CD0A2CB0MN2PR12MB3296namp_"

--_000_MN2PR12MB329645069BD87A5E337E5CD0A2CB0MN2PR12MB3296namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Comment inline

________________________________
From: Quan, Evan <Evan.Quan@amd.com>
Sent: Friday, July 19, 2019 1:03 PM
To: Wang, Kevin(Yang) <Kevin1.Wang@amd.com>; amd-gfx@lists.freedesktop.org =
<amd-gfx@lists.freedesktop.org>
Cc: Feng, Kenneth <Kenneth.Feng@amd.com>; Huang, Ray <Ray.Huang@amd.com>; X=
u, Feifei <Feifei.Xu@amd.com>; Gui, Jack <Jack.Gui@amd.com>
Subject: RE: [PATCH] drm/amd/powerplay: custom peak clock freq for navi10

Comment inline

> -----Original Message-----
> From: Wang, Kevin(Yang) <Kevin1.Wang@amd.com>
> Sent: Friday, July 19, 2019 11:46 AM
> To: amd-gfx@lists.freedesktop.org
> Cc: Feng, Kenneth <Kenneth.Feng@amd.com>; Quan, Evan
> <Evan.Quan@amd.com>; Huang, Ray <Ray.Huang@amd.com>; Xu, Feifei
> <Feifei.Xu@amd.com>; Gui, Jack <Jack.Gui@amd.com>; Wang, Kevin(Yang)
> <Kevin1.Wang@amd.com>
> Subject: [PATCH] drm/amd/powerplay: custom peak clock freq for navi10
>
> 1.NAVI10_PEAK_SCLK_XTX    1830 Mhz
> 2.NAVI10_PEAK_SCLK_XT     1755 Mhz
> 3.NAVI10_PEAK_SCLK_XL     1625 Mhz
>
> Change-Id: I48863a9d0e261b9e7778a6c0e4a8762d7c978da6
> Signed-off-by: Kevin Wang <kevin1.wang@amd.com>
> ---
>  drivers/gpu/drm/amd/powerplay/amdgpu_smu.c    | 65 ++++++++++--------
> -
>  .../gpu/drm/amd/powerplay/inc/amdgpu_smu.h    |  4 ++
>  drivers/gpu/drm/amd/powerplay/navi10_ppt.c    | 55 ++++++++++++++++
>  drivers/gpu/drm/amd/powerplay/navi10_ppt.h    |  4 ++
>  4 files changed, 97 insertions(+), 31 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
> b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
> index 7f51bbd2ac90..ab389dde9562 100644
> --- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
> +++ b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
> @@ -1360,37 +1360,40 @@ int smu_adjust_power_state_dynamic(struct
> smu_context *smu,
>        }
>
>        if (smu_dpm_ctx->dpm_level !=3D level) {
> -             switch (level) {
> -             case AMD_DPM_FORCED_LEVEL_HIGH:
> -                     ret =3D smu_force_dpm_limit_value(smu, true);
> -                     break;
> -             case AMD_DPM_FORCED_LEVEL_LOW:
> -                     ret =3D smu_force_dpm_limit_value(smu, false);
> -                     break;
> -
> -             case AMD_DPM_FORCED_LEVEL_AUTO:
> -             case AMD_DPM_FORCED_LEVEL_PROFILE_STANDARD:
> -                     ret =3D smu_unforce_dpm_levels(smu);
> -                     break;
> -
> -             case AMD_DPM_FORCED_LEVEL_PROFILE_MIN_SCLK:
> -             case AMD_DPM_FORCED_LEVEL_PROFILE_MIN_MCLK:
> -             case AMD_DPM_FORCED_LEVEL_PROFILE_PEAK:
> -                     ret =3D smu_get_profiling_clk_mask(smu, level,
> -                                                      &sclk_mask,
> -                                                      &mclk_mask,
> -                                                      &soc_mask);
> -                     if (ret)
> -                             return ret;
> -                     smu_force_clk_levels(smu, SMU_SCLK, 1 <<
> sclk_mask);
> -                     smu_force_clk_levels(smu, SMU_MCLK, 1 <<
> mclk_mask);
> -                     smu_force_clk_levels(smu, SMU_SOCCLK, 1 <<
> soc_mask);
> -                     break;
> -
> -             case AMD_DPM_FORCED_LEVEL_MANUAL:
> -             case AMD_DPM_FORCED_LEVEL_PROFILE_EXIT:
> -             default:
> -                     break;
> +             ret =3D smu_set_performance_level(smu, level);
> +             if (ret) {
[Quan, Evan] Since this actually handles AMD_DPM_FORCED_LEVEL_PROFILE_PEAK =
only. Please move this under "case AMD_DPM_FORCED_LEVEL_PROFILE_PEAK:".
And please give it a more meaningful name e.g. smu_set_asic_peak_profile().

[kevin]: in the future, for specifc asic, it may be custom other performanc=
e level, so we should have this capacity to support other asic with any per=
formance level. and i think it is not a good way to handle performance leve=
l use case by case method for each asic.

> +                     switch (level) {
> +                     case AMD_DPM_FORCED_LEVEL_HIGH:
> +                             ret =3D smu_force_dpm_limit_value(smu, true=
);
> +                             break;
> +                     case AMD_DPM_FORCED_LEVEL_LOW:
> +                             ret =3D smu_force_dpm_limit_value(smu,
> false);
> +                             break;
> +
> +                     case AMD_DPM_FORCED_LEVEL_AUTO:
> +                     case
> AMD_DPM_FORCED_LEVEL_PROFILE_STANDARD:
> +                             ret =3D smu_unforce_dpm_levels(smu);
> +                             break;
> +
> +                     case
> AMD_DPM_FORCED_LEVEL_PROFILE_MIN_SCLK:
> +                     case
> AMD_DPM_FORCED_LEVEL_PROFILE_MIN_MCLK:
> +                     case AMD_DPM_FORCED_LEVEL_PROFILE_PEAK:
> +                             ret =3D smu_get_profiling_clk_mask(smu, lev=
el,
> +                                                              &sclk_mask=
,
> +                                                              &mclk_mask=
,
> +                                                              &soc_mask)=
;
> +                             if (ret)
> +                                     return ret;
> +                             smu_force_clk_levels(smu, SMU_SCLK, 1 <<
> sclk_mask);
> +                             smu_force_clk_levels(smu, SMU_MCLK, 1 <<
> mclk_mask);
> +                             smu_force_clk_levels(smu, SMU_SOCCLK, 1
> << soc_mask);
> +                             break;
> +
> +                     case AMD_DPM_FORCED_LEVEL_MANUAL:
> +                     case AMD_DPM_FORCED_LEVEL_PROFILE_EXIT:
> +                     default:
> +                             break;
> +                     }
>                }
>
>                if (!ret)
> diff --git a/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h
> b/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h
> index 514d31518853..ba5ddafcbdba 100644
> --- a/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h
> +++ b/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h
> @@ -631,6 +631,7 @@ struct pptable_funcs {
>        int (*get_thermal_temperature_range)(struct smu_context *smu,
> struct smu_temperature_range *range);
>        int (*get_uclk_dpm_states)(struct smu_context *smu, uint32_t
> *clocks_in_khz, uint32_t *num_states);
>        int (*set_default_od_settings)(struct smu_context *smu, bool
> initialize);
> +     int (*set_performance_level)(struct smu_context *smu, int32_t
> level);
>  };
>
>  struct smu_funcs
> @@ -928,6 +929,9 @@ struct smu_funcs
>        ((smu)->funcs->baco_get_state? (smu)->funcs-
> >baco_get_state((smu), (state)) : 0)
>  #define smu_baco_reset(smu) \
>        ((smu)->funcs->baco_reset? (smu)->funcs->baco_reset((smu)) : 0)
> +#define smu_set_performance_level(smu, level) \
> +     ((smu)->ppt_funcs->set_performance_level? (smu)->ppt_funcs-
> >set_performance_level((smu), (level)) : -EINVAL);
> +
>
>  extern int smu_get_atom_data_table(struct smu_context *smu, uint32_t
> table,
>                                   uint16_t *size, uint8_t *frev, uint8_t =
*crev,
> diff --git a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
> b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
> index e44041a25e64..9024d91477f0 100644
> --- a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
> +++ b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
> @@ -1590,6 +1590,60 @@ static int navi10_set_ppfeature_status(struct
> smu_context *smu,
>        return 0;
>  }
>
> +static int navi10_set_peak_clock_by_device(struct smu_context *smu)
> +{
> +     struct amdgpu_device *adev =3D smu->adev;
> +     int ret =3D 0;
> +     uint32_t sclk_freq =3D 0, uclk_freq =3D 0;
> +     uint32_t uclk_level =3D 0;
> +
> +     switch (adev->rev_id) {
> +     case 0xf0: /* XTX */
> +     case 0xC0:
> +             sclk_freq =3D NAVI10_PEAK_SCLK_XTX;
> +             break;
> +     case 0xf1: /* XT */
> +     case 0xC1:
> +             sclk_freq =3D NAVI10_PEAK_SCLK_XT;
> +             break;
> +     default: /* XL */
> +             sclk_freq =3D NAVI10_PEAK_SCLK_XL;
> +             break;
> +     }
> +
> +     ret =3D smu_get_dpm_level_count(smu, SMU_UCLK, &uclk_level);
> +     if (ret)
> +             return ret;
> +     ret =3D smu_get_dpm_freq_by_index(smu, SMU_UCLK, uclk_level - 1,
> &uclk_freq);
> +     if (ret)
> +             return ret;
[Quan, Evan] I think with dpm level (3rd argument) set as 0xff directly,  y=
ou can  get the clock frequency for the max level.
[kevin]: not right, 0xff will return dpm clock level count, see function sm=
u_get_dpm_level_count
> +
> +     ret =3D smu_set_soft_freq_range(smu, SMU_SCLK, sclk_freq,
> sclk_freq);
> +     if (ret)
> +             return ret;
> +     ret =3D smu_set_soft_freq_range(smu, SMU_UCLK, uclk_freq,
> uclk_freq);
> +     if (ret)
> +             return ret;
> +
> +     return ret;
> +}
> +
> +static int navi10_set_performance_level(struct smu_context *smu, int32_t
> level)
> +{
> +     int ret =3D 0;
> +
> +     switch (level) {
> +     case AMD_DPM_FORCED_LEVEL_PROFILE_PEAK:
> +             ret =3D navi10_set_peak_clock_by_device(smu);
> +             break;
> +     default:
> +             ret =3D -EINVAL;
> +             break;
> +     }
> +
> +     return ret;
> +}
> +
>  static const struct pptable_funcs navi10_ppt_funcs =3D {
>        .tables_init =3D navi10_tables_init,
>        .alloc_dpm_context =3D navi10_allocate_dpm_context,
> @@ -1625,6 +1679,7 @@ static const struct pptable_funcs navi10_ppt_funcs
> =3D {
>        .get_uclk_dpm_states =3D navi10_get_uclk_dpm_states,
>        .get_ppfeature_status =3D navi10_get_ppfeature_status,
>        .set_ppfeature_status =3D navi10_set_ppfeature_status,
> +     .set_performance_level =3D navi10_set_performance_level,
>  };
>
>  void navi10_set_ppt_funcs(struct smu_context *smu)
> diff --git a/drivers/gpu/drm/amd/powerplay/navi10_ppt.h
> b/drivers/gpu/drm/amd/powerplay/navi10_ppt.h
> index 957288e22f47..620ff17c2fef 100644
> --- a/drivers/gpu/drm/amd/powerplay/navi10_ppt.h
> +++ b/drivers/gpu/drm/amd/powerplay/navi10_ppt.h
> @@ -23,6 +23,10 @@
>  #ifndef __NAVI10_PPT_H__
>  #define __NAVI10_PPT_H__
>
> +#define NAVI10_PEAK_SCLK_XTX         (1830)
> +#define NAVI10_PEAK_SCLK_XT           (1755)
> +#define NAVI10_PEAK_SCLK_XL           (1625)
> +
>  extern void navi10_set_ppt_funcs(struct smu_context *smu);
>
>  #endif
> --
> 2.22.0


--_000_MN2PR12MB329645069BD87A5E337E5CD0A2CB0MN2PR12MB3296namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size: 12pt; color: rgb(0, 0,=
 0); font-family: Calibri, Helvetica, sans-serif, EmojiFont, &quot;Apple Co=
lor Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji, &quot;Segoe UI=
 Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols;" dir=3D"ltr">
<p style=3D"margin-top:0;margin-bottom:0"><span style=3D"font-family: Calib=
ri, Helvetica, sans-serif, EmojiFont, &quot;Apple Color Emoji&quot;, &quot;=
Segoe UI Emoji&quot;, NotoColorEmoji, &quot;Segoe UI Symbol&quot;, &quot;An=
droid Emoji&quot;, EmojiSymbols; font-size: 14.6667px;">Comment inline</spa=
n><br>
</p>
<div style=3D"color: rgb(0, 0, 0);">
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Quan, Evan &lt;Evan.Q=
uan@amd.com&gt;<br>
<b>Sent:</b> Friday, July 19, 2019 1:03 PM<br>
<b>To:</b> Wang, Kevin(Yang) &lt;Kevin1.Wang@amd.com&gt;; amd-gfx@lists.fre=
edesktop.org &lt;amd-gfx@lists.freedesktop.org&gt;<br>
<b>Cc:</b> Feng, Kenneth &lt;Kenneth.Feng@amd.com&gt;; Huang, Ray &lt;Ray.H=
uang@amd.com&gt;; Xu, Feifei &lt;Feifei.Xu@amd.com&gt;; Gui, Jack &lt;Jack.=
Gui@amd.com&gt;<br>
<b>Subject:</b> RE: [PATCH] drm/amd/powerplay: custom peak clock freq for n=
avi10</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Comment inline<br>
<br>
&gt; -----Original Message-----<br>
&gt; From: Wang, Kevin(Yang) &lt;Kevin1.Wang@amd.com&gt;<br>
&gt; Sent: Friday, July 19, 2019 11:46 AM<br>
&gt; To: amd-gfx@lists.freedesktop.org<br>
&gt; Cc: Feng, Kenneth &lt;Kenneth.Feng@amd.com&gt;; Quan, Evan<br>
&gt; &lt;Evan.Quan@amd.com&gt;; Huang, Ray &lt;Ray.Huang@amd.com&gt;; Xu, F=
eifei<br>
&gt; &lt;Feifei.Xu@amd.com&gt;; Gui, Jack &lt;Jack.Gui@amd.com&gt;; Wang, K=
evin(Yang)<br>
&gt; &lt;Kevin1.Wang@amd.com&gt;<br>
&gt; Subject: [PATCH] drm/amd/powerplay: custom peak clock freq for navi10<=
br>
&gt; <br>
&gt; 1.NAVI10_PEAK_SCLK_XTX&nbsp;&nbsp;&nbsp; 1830 Mhz<br>
&gt; 2.NAVI10_PEAK_SCLK_XT&nbsp;&nbsp;&nbsp;&nbsp; 1755 Mhz<br>
&gt; 3.NAVI10_PEAK_SCLK_XL&nbsp;&nbsp;&nbsp;&nbsp; 1625 Mhz<br>
&gt; <br>
&gt; Change-Id: I48863a9d0e261b9e7778a6c0e4a8762d7c978da6<br>
&gt; Signed-off-by: Kevin Wang &lt;kevin1.wang@amd.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; drivers/gpu/drm/amd/powerplay/amdgpu_smu.c&nbsp;&nbsp;&nbsp; | 6=
5 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;--------<br>
&gt; -<br>
&gt;&nbsp; .../gpu/drm/amd/powerplay/inc/amdgpu_smu.h&nbsp;&nbsp;&nbsp; |&n=
bsp; 4 &#43;&#43;<br>
&gt;&nbsp; drivers/gpu/drm/amd/powerplay/navi10_ppt.c&nbsp;&nbsp;&nbsp; | 5=
5 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#4=
3;&#43;<br>
&gt;&nbsp; drivers/gpu/drm/amd/powerplay/navi10_ppt.h&nbsp;&nbsp;&nbsp; |&n=
bsp; 4 &#43;&#43;<br>
&gt;&nbsp; 4 files changed, 97 insertions(&#43;), 31 deletions(-)<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c<br>
&gt; b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c<br>
&gt; index 7f51bbd2ac90..ab389dde9562 100644<br>
&gt; --- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c<br>
&gt; @@ -1360,37 &#43;1360,40 @@ int smu_adjust_power_state_dynamic(struct<=
br>
&gt; smu_context *smu,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (smu_dpm_ctx-&gt;dpm_leve=
l !=3D level) {<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; switch (level) {<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; case AMD_DPM_FORCED_LEVEL_HIGH:<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D smu_force_dpm_l=
imit_value(smu, true);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; case AMD_DPM_FORCED_LEVEL_LOW:<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D smu_force_dpm_l=
imit_value(smu, false);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; case AMD_DPM_FORCED_LEVEL_AUTO:<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; case AMD_DPM_FORCED_LEVEL_PROFILE_STANDARD:<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D smu_unforce_dpm=
_levels(smu);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; case AMD_DPM_FORCED_LEVEL_PROFILE_MIN_SCLK:<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; case AMD_DPM_FORCED_LEVEL_PROFILE_MIN_MCLK:<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; case AMD_DPM_FORCED_LEVEL_PROFILE_PEAK:<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D smu_get_profili=
ng_clk_mask(smu, level,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; &amp;sclk_mask,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; &amp;mclk_mask,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; &amp;soc_mask);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smu_force_clk_levels(sm=
u, SMU_SCLK, 1 &lt;&lt;<br>
&gt; sclk_mask);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smu_force_clk_levels(sm=
u, SMU_MCLK, 1 &lt;&lt;<br>
&gt; mclk_mask);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smu_force_clk_levels(sm=
u, SMU_SOCCLK, 1 &lt;&lt;<br>
&gt; soc_mask);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; case AMD_DPM_FORCED_LEVEL_MANUAL:<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; case AMD_DPM_FORCED_LEVEL_PROFILE_EXIT:<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; default:<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; ret =3D smu_set_performance_level(smu, level);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; if (ret) {<br>
[Quan, Evan] Since this actually handles AMD_DPM_FORCED_LEVEL_PROFILE_PEAK =
only. Please move this under &quot;case AMD_DPM_FORCED_LEVEL_PROFILE_PEAK:&=
quot;.<br>
And please give it a more meaningful name e.g. smu_set_asic_peak_profile().=
</div>
<div class=3D"PlainText"><br>
</div>
<div class=3D"PlainText">[kevin]: in the future, for specifc asic, it may b=
e&nbsp;custom other performance level, so&nbsp;we should have this&nbsp;<sp=
an style=3D"font-family: Calibri, Helvetica, sans-serif, EmojiFont, &quot;A=
pple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji, &quot;S=
egoe UI Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols; font-size: 1=
4.6667px;">capacity
 to&nbsp;</span>support other asic with any performance level.&nbsp;<span s=
tyle=3D"font-size: 11pt;">and i think
</span><span style=3D"font-size: 11pt;">it is not a good way to handle perf=
ormance level use&nbsp;</span><span style=3D"font-size: 11pt;">case by case=
 method for each asic.</span></div>
<div class=3D"PlainText"><br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switch (level) {<br=
>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMD_DPM_FORCED=
_LEVEL_HIGH:<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D smu_force_dpm_limit_value(smu, true);<=
br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMD_DPM_FORCED=
_LEVEL_LOW:<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D smu_force_dpm_limit_value(smu,<br>
&gt; false);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMD_DPM_FORCED=
_LEVEL_AUTO:<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case<br>
&gt; AMD_DPM_FORCED_LEVEL_PROFILE_STANDARD:<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D smu_unforce_dpm_levels(smu);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case<br>
&gt; AMD_DPM_FORCED_LEVEL_PROFILE_MIN_SCLK:<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case<br>
&gt; AMD_DPM_FORCED_LEVEL_PROFILE_MIN_MCLK:<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMD_DPM_FORCED=
_LEVEL_PROFILE_PEAK:<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D smu_get_profiling_clk_mask(smu, level,=
<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; &amp;sclk_mask,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; &amp;mclk_mask,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; &amp;soc_mask);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; return ret;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; smu_force_clk_levels(smu, SMU_SCLK, 1 &lt;&lt;=
<br>
&gt; sclk_mask);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; smu_force_clk_levels(smu, SMU_MCLK, 1 &lt;&lt;=
<br>
&gt; mclk_mask);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; smu_force_clk_levels(smu, SMU_SOCCLK, 1<br>
&gt; &lt;&lt; soc_mask);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMD_DPM_FORCED=
_LEVEL_MANUAL:<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMD_DPM_FORCED=
_LEVEL_PROFILE_EXIT:<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default:<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; }<br>
&gt; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; if (!ret)<br>
&gt; diff --git a/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h<br>
&gt; b/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h<br>
&gt; index 514d31518853..ba5ddafcbdba 100644<br>
&gt; --- a/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h<br>
&gt; @@ -631,6 &#43;631,7 @@ struct pptable_funcs {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int (*get_thermal_temperatur=
e_range)(struct smu_context *smu,<br>
&gt; struct smu_temperature_range *range);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int (*get_uclk_dpm_states)(s=
truct smu_context *smu, uint32_t<br>
&gt; *clocks_in_khz, uint32_t *num_states);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int (*set_default_od_setting=
s)(struct smu_context *smu, bool<br>
&gt; initialize);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; int (*set_performance_level)(struct smu_=
context *smu, int32_t<br>
&gt; level);<br>
&gt;&nbsp; };<br>
&gt; <br>
&gt;&nbsp; struct smu_funcs<br>
&gt; @@ -928,6 &#43;929,9 @@ struct smu_funcs<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ((smu)-&gt;funcs-&gt;baco_ge=
t_state? (smu)-&gt;funcs-<br>
&gt; &gt;baco_get_state((smu), (state)) : 0)<br>
&gt;&nbsp; #define smu_baco_reset(smu) \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ((smu)-&gt;funcs-&gt;baco_re=
set? (smu)-&gt;funcs-&gt;baco_reset((smu)) : 0)<br>
&gt; &#43;#define smu_set_performance_level(smu, level) \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; ((smu)-&gt;ppt_funcs-&gt;set_performance=
_level? (smu)-&gt;ppt_funcs-<br>
&gt; &gt;set_performance_level((smu), (level)) : -EINVAL);<br>
&gt; &#43;<br>
&gt; <br>
&gt;&nbsp; extern int smu_get_atom_data_table(struct smu_context *smu, uint=
32_t<br>
&gt; table,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint16_t *size, =
uint8_t *frev, uint8_t *crev,<br>
&gt; diff --git a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c<br>
&gt; b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c<br>
&gt; index e44041a25e64..9024d91477f0 100644<br>
&gt; --- a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c<br>
&gt; @@ -1590,6 &#43;1590,60 @@ static int navi10_set_ppfeature_status(stru=
ct<br>
&gt; smu_context *smu,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt;&nbsp; }<br>
&gt; <br>
&gt; &#43;static int navi10_set_peak_clock_by_device(struct smu_context *sm=
u)<br>
&gt; &#43;{<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_device *adev =3D smu-&gt;a=
dev;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; int ret =3D 0;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t sclk_freq =3D 0, uclk_freq =3D =
0;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t uclk_level =3D 0;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; switch (adev-&gt;rev_id) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; case 0xf0: /* XTX */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; case 0xC0:<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; sclk_freq =3D NAVI10_PEAK_SCLK_XTX;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; break;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; case 0xf1: /* XT */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; case 0xC1:<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; sclk_freq =3D NAVI10_PEAK_SCLK_XT;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; break;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; default: /* XL */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; sclk_freq =3D NAVI10_PEAK_SCLK_XL;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; break;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D smu_get_dpm_level_count(smu, SMU=
_UCLK, &amp;uclk_level);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; return ret;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D smu_get_dpm_freq_by_index(smu, S=
MU_UCLK, uclk_level - 1,<br>
&gt; &amp;uclk_freq);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; return ret;<br>
[Quan, Evan] I think with dpm level (3rd argument) set as 0xff directly,&nb=
sp; you can&nbsp; get the clock frequency for the max level.</div>
<div class=3D"PlainText">[kevin]: not right, 0xff will return dpm clock lev=
el count, see function smu_get_dpm_level_count&nbsp;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D smu_set_soft_freq_range(smu, SMU=
_SCLK, sclk_freq,<br>
&gt; sclk_freq);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; return ret;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D smu_set_soft_freq_range(smu, SMU=
_UCLK, uclk_freq,<br>
&gt; uclk_freq);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; return ret;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&gt; &#43;}<br>
&gt; &#43;<br>
&gt; &#43;static int navi10_set_performance_level(struct smu_context *smu, =
int32_t<br>
&gt; level)<br>
&gt; &#43;{<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; int ret =3D 0;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; switch (level) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; case AMD_DPM_FORCED_LEVEL_PROFILE_PEAK:<=
br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; ret =3D navi10_set_peak_clock_by_device(smu);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; break;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; default:<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; ret =3D -EINVAL;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; break;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&gt; &#43;}<br>
&gt; &#43;<br>
&gt;&nbsp; static const struct pptable_funcs navi10_ppt_funcs =3D {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .tables_init =3D navi10_tabl=
es_init,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .alloc_dpm_context =3D navi1=
0_allocate_dpm_context,<br>
&gt; @@ -1625,6 &#43;1679,7 @@ static const struct pptable_funcs navi10_ppt=
_funcs<br>
&gt; =3D {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .get_uclk_dpm_states =3D nav=
i10_get_uclk_dpm_states,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .get_ppfeature_status =3D na=
vi10_get_ppfeature_status,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .set_ppfeature_status =3D na=
vi10_set_ppfeature_status,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; .set_performance_level =3D navi10_set_pe=
rformance_level,<br>
&gt;&nbsp; };<br>
&gt; <br>
&gt;&nbsp; void navi10_set_ppt_funcs(struct smu_context *smu)<br>
&gt; diff --git a/drivers/gpu/drm/amd/powerplay/navi10_ppt.h<br>
&gt; b/drivers/gpu/drm/amd/powerplay/navi10_ppt.h<br>
&gt; index 957288e22f47..620ff17c2fef 100644<br>
&gt; --- a/drivers/gpu/drm/amd/powerplay/navi10_ppt.h<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/navi10_ppt.h<br>
&gt; @@ -23,6 &#43;23,10 @@<br>
&gt;&nbsp; #ifndef __NAVI10_PPT_H__<br>
&gt;&nbsp; #define __NAVI10_PPT_H__<br>
&gt; <br>
&gt; &#43;#define NAVI10_PEAK_SCLK_XTX&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; (1830)<br>
&gt; &#43;#define NAVI10_PEAK_SCLK_XT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; (1755)<br>
&gt; &#43;#define NAVI10_PEAK_SCLK_XL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; (1625)<br>
&gt; &#43;<br>
&gt;&nbsp; extern void navi10_set_ppt_funcs(struct smu_context *smu);<br>
&gt; <br>
&gt;&nbsp; #endif<br>
&gt; --<br>
&gt; 2.22.0<br>
<br>
</div>
</span></font></div>
</div>
</div>
</body>
</html>

--_000_MN2PR12MB329645069BD87A5E337E5CD0A2CB0MN2PR12MB3296namp_--

--===============1494346727==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1494346727==--
