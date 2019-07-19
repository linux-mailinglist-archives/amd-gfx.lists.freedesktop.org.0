Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D35F16E0D2
	for <lists+amd-gfx@lfdr.de>; Fri, 19 Jul 2019 08:01:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B3FF6E580;
	Fri, 19 Jul 2019 06:01:27 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770050.outbound.protection.outlook.com [40.107.77.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0D006E580
 for <amd-gfx@lists.freedesktop.org>; Fri, 19 Jul 2019 06:01:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PqWwXi+/z8Z7XB1mitx6GW8aA7NOwSBvd7pDRcf0Q8W1RvEIqquvD+sBGH7LLFEKi0hSfcJRhHtU02xjTNQyBeFRtwlT8xNn5xFL7fFILFbYo8A/AuBnE4aoBMWvFAQZfB5ZGAiQhLwDkrVnYszGDmKA8bzAOD+Xl37EAg4AoTO8yZDpw2f4rr7BRoMs5amxsBVWVvRVB0vVbKNxVuGnk/L9qFOxgCns6LM2gsdo1anaSszv+YnrQCO4PcFcN1YgSkw4txFNjkuUFXTn4F2gly99GMQdw3WXUctuZ6sgPbQIpgNCV1XAyBZAwBAiCkWwvrp2Gn1L1lPtW68cxnb9CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NLfsey/6KrvKy+6rhscWBRuVbUtlwgAndl0DauVAFvY=;
 b=ijmBkQ/bW2m1tGMXa83CACgWlUev2o776P+NI/CGSig3SPGruM+nY5u8mHMUikOLubAMeNfbcWxEqVAQHz90dKktbmC1nKBffkLKWjqCd98BYUgeMQNTWrrBnqIvg9SgruUE1zav/e+yHHiag0YcK7yc+iWWJnWwM4JRovMVc291CqHNeABXq7nzZebrpec3izzygbLT7JuAzTBlyFbjRmCSAOr2ldBn4Py6AcWh24Yxz9qrR5KyaVHJzcTdAcaEtqlO8i0ESkf72IrcBq6Fxi/2PLmCiEDKclh/tO6GT3U10mk33z8FDZ4AcXHWRXhFEUdcKReDW7vDwD/SemR0zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3598.namprd12.prod.outlook.com (20.178.244.84) by
 MN2PR12MB2911.namprd12.prod.outlook.com (20.179.80.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.12; Fri, 19 Jul 2019 06:01:23 +0000
Received: from MN2PR12MB3598.namprd12.prod.outlook.com
 ([fe80::40cc:2c68:41f3:c5b5]) by MN2PR12MB3598.namprd12.prod.outlook.com
 ([fe80::40cc:2c68:41f3:c5b5%7]) with mapi id 15.20.2073.012; Fri, 19 Jul 2019
 06:01:23 +0000
From: "Feng, Kenneth" <Kenneth.Feng@amd.com>
To: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>, "Quan, Evan"
 <Evan.Quan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amd/powerplay: custom peak clock freq for navi10
Thread-Topic: [PATCH] drm/amd/powerplay: custom peak clock freq for navi10
Thread-Index: AQHVPeRrrwjCEvFq1k2763SRVfn3ZabRYb4QgAAHgY6AAAlGAA==
Date: Fri, 19 Jul 2019 06:01:23 +0000
Message-ID: <MN2PR12MB3598B7FA125EB5DC2C640D7E8ECB0@MN2PR12MB3598.namprd12.prod.outlook.com>
References: <20190719034517.25780-1-kevin1.wang@amd.com>,
 <MN2PR12MB3344FA52A933E4922488E720E4CB0@MN2PR12MB3344.namprd12.prod.outlook.com>
 <MN2PR12MB329645069BD87A5E337E5CD0A2CB0@MN2PR12MB3296.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB329645069BD87A5E337E5CD0A2CB0@MN2PR12MB3296.namprd12.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 97b45f2c-53f4-4d30-70fd-08d70c0e8773
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB2911; 
x-ms-traffictypediagnostic: MN2PR12MB2911:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <MN2PR12MB2911CA6F0165252276582E268ECB0@MN2PR12MB2911.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 01039C93E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(396003)(346002)(376002)(136003)(39860400002)(189003)(199004)(13464003)(8676002)(99286004)(54906003)(316002)(86362001)(6246003)(7736002)(71200400001)(71190400001)(110136005)(4326008)(2501003)(74316002)(229853002)(53546011)(52536014)(81156014)(66946007)(68736007)(81166006)(76116006)(8936002)(66476007)(66446008)(6506007)(66556008)(64756008)(5660300002)(7696005)(76176011)(236005)(9686003)(6306002)(55016002)(2906002)(54896002)(53936002)(26005)(186003)(102836004)(33656002)(476003)(11346002)(446003)(6436002)(66066001)(790700001)(6116002)(3846002)(14454004)(486006)(25786009)(14444005)(256004)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2911;
 H:MN2PR12MB3598.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: eBWLS9ZabLHmmJFqvSnjwsdXmBZLmWTlQdI5AraA7bfePyf4dN0Q5cSTgKL0vSs6kdOMuZEcbdvG8UiBLoiHezeIwIUGpw/hctK4675zalcY2aX4zN1VhH3JmrlnLmFw6MuUZB8GfDXCZynvkIM29pz+OaV7YRrHccnd3vZiKQ2bxxBZAxHNKClcFXY943k9wqY8XFBjXLAF7gJwrkffUzQ1ZSVJuM1pZ/eCyw23Olt4rEDN2lnG5G+e9Yz4I+sJhLXi79jtvQcglebZNtJ7tOkAT4w/6Kj1nvtRTP270xuaeY8RwU7S4zV34/zbNe7goA+nSIMmX0neiSuSlJ+OdwIA41gP2X1mlJwkJeAaNzBgFjJ5Gn3WXsVY743YjsVp1so0Cp4C38MgVxOYnlVKJD/TMG6fpPbxvNS21DyE0D0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97b45f2c-53f4-4d30-70fd-08d70c0e8773
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2019 06:01:23.5920 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qyfeng@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2911
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NLfsey/6KrvKy+6rhscWBRuVbUtlwgAndl0DauVAFvY=;
 b=auuCvb1S+TIaTsnKmJxQmDCIp4UUCNneTFsN7h1GzCio5m47bb1/DfVr0DtceWy5Ozpwji9qlrtjkkxP5gTBAt1uCFpAFBpfzk0pFTmAec1Kg+1amuUo19XCvhc4LVWFOH9jU4F5gR/dhqJnhDT6BBRuMeVwNAmDn0keoOzq8k4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kenneth.Feng@amd.com; 
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
Cc: "Xu, Feifei" <Feifei.Xu@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>, "Gui, 
 Jack" <Jack.Gui@amd.com>
Content-Type: multipart/mixed; boundary="===============0636882689=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0636882689==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB3598B7FA125EB5DC2C640D7E8ECB0MN2PR12MB3598namp_"

--_000_MN2PR12MB3598B7FA125EB5DC2C640D7E8ECB0MN2PR12MB3598namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Parameter 0xff for message PPSMC_MSG_GetDpmFreqByIndex will get the dpm num=
bers, so it's ok.

Reviewed-by: Kenneth Feng <kenneth.feng@amd.com<mailto:kenneth.feng@amd.com=
>>


From: Wang, Kevin(Yang)
Sent: Friday, July 19, 2019 1:36 PM
To: Quan, Evan <Evan.Quan@amd.com>; amd-gfx@lists.freedesktop.org
Cc: Feng, Kenneth <Kenneth.Feng@amd.com>; Huang, Ray <Ray.Huang@amd.com>; X=
u, Feifei <Feifei.Xu@amd.com>; Gui, Jack <Jack.Gui@amd.com>
Subject: Re: [PATCH] drm/amd/powerplay: custom peak clock freq for navi10


Comment inline

________________________________
From: Quan, Evan <Evan.Quan@amd.com<mailto:Evan.Quan@amd.com>>
Sent: Friday, July 19, 2019 1:03 PM
To: Wang, Kevin(Yang) <Kevin1.Wang@amd.com<mailto:Kevin1.Wang@amd.com>>; am=
d-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org> <amd-gfx@=
lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>>
Cc: Feng, Kenneth <Kenneth.Feng@amd.com<mailto:Kenneth.Feng@amd.com>>; Huan=
g, Ray <Ray.Huang@amd.com<mailto:Ray.Huang@amd.com>>; Xu, Feifei <Feifei.Xu=
@amd.com<mailto:Feifei.Xu@amd.com>>; Gui, Jack <Jack.Gui@amd.com<mailto:Jac=
k.Gui@amd.com>>
Subject: RE: [PATCH] drm/amd/powerplay: custom peak clock freq for navi10

Comment inline

> -----Original Message-----
> From: Wang, Kevin(Yang) <Kevin1.Wang@amd.com<mailto:Kevin1.Wang@amd.com>>
> Sent: Friday, July 19, 2019 11:46 AM
> To: amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>
> Cc: Feng, Kenneth <Kenneth.Feng@amd.com<mailto:Kenneth.Feng@amd.com>>; Qu=
an, Evan
> <Evan.Quan@amd.com<mailto:Evan.Quan@amd.com>>; Huang, Ray <Ray.Huang@amd.=
com<mailto:Ray.Huang@amd.com>>; Xu, Feifei
> <Feifei.Xu@amd.com<mailto:Feifei.Xu@amd.com>>; Gui, Jack <Jack.Gui@amd.co=
m<mailto:Jack.Gui@amd.com>>; Wang, Kevin(Yang)
> <Kevin1.Wang@amd.com<mailto:Kevin1.Wang@amd.com>>
> Subject: [PATCH] drm/amd/powerplay: custom peak clock freq for navi10
>
> 1.NAVI10_PEAK_SCLK_XTX    1830 Mhz
> 2.NAVI10_PEAK_SCLK_XT     1755 Mhz
> 3.NAVI10_PEAK_SCLK_XL     1625 Mhz
>
> Change-Id: I48863a9d0e261b9e7778a6c0e4a8762d7c978da6
> Signed-off-by: Kevin Wang <kevin1.wang@amd.com<mailto:kevin1.wang@amd.com=
>>
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

--_000_MN2PR12MB3598B7FA125EB5DC2C640D7E8ECB0MN2PR12MB3598namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman",serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-priority:99;
	mso-style-link:"Plain Text Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
p
	{mso-style-priority:99;
	margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman",serif;}
span.EmailStyle18
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:#1F497D;}
span.PlainTextChar
	{mso-style-name:"Plain Text Char";
	mso-style-priority:99;
	mso-style-link:"Plain Text";
	font-family:"Calibri",sans-serif;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.25in 1.0in 1.25in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:black">Parameter 0xff for message PPSMC_MSG_Ge=
tDpmFreqByIndex will get the dpm numbers, so it&#8217;s ok.<o:p></o:p></spa=
n></p>
<p class=3D"MsoPlainText">Reviewed-by: Kenneth Feng &lt;<a href=3D"mailto:k=
enneth.feng@amd.com">kenneth.feng@amd.com</a>&gt;<o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1F497D"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1F497D"><o:p>&nbsp;</o:p></span></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:11.0pt;font-family:&quot=
;Calibri&quot;,sans-serif">From:</span></b><span style=3D"font-size:11.0pt;=
font-family:&quot;Calibri&quot;,sans-serif"> Wang, Kevin(Yang)
<br>
<b>Sent:</b> Friday, July 19, 2019 1:36 PM<br>
<b>To:</b> Quan, Evan &lt;Evan.Quan@amd.com&gt;; amd-gfx@lists.freedesktop.=
org<br>
<b>Cc:</b> Feng, Kenneth &lt;Kenneth.Feng@amd.com&gt;; Huang, Ray &lt;Ray.H=
uang@amd.com&gt;; Xu, Feifei &lt;Feifei.Xu@amd.com&gt;; Gui, Jack &lt;Jack.=
Gui@amd.com&gt;<br>
<b>Subject:</b> Re: [PATCH] drm/amd/powerplay: custom peak clock freq for n=
avi10<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div id=3D"divtagdefaultwrapper">
<p><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-ser=
if;color:black">Comment inline</span><span style=3D"font-family:&quot;Calib=
ri&quot;,sans-serif;color:black"><o:p></o:p></span></p>
<div>
<div class=3D"MsoNormal" align=3D"center" style=3D"text-align:center"><span=
 style=3D"font-family:&quot;Calibri&quot;,sans-serif;color:black">
<hr size=3D"2" width=3D"98%" align=3D"center">
</span></div>
<div id=3D"divRplyFwdMsg">
<p class=3D"MsoNormal"><b><span style=3D"font-size:11.0pt;font-family:&quot=
;Calibri&quot;,sans-serif;color:black">From:</span></b><span style=3D"font-=
size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:black"> Quan, =
Evan &lt;<a href=3D"mailto:Evan.Quan@amd.com">Evan.Quan@amd.com</a>&gt;<br>
<b>Sent:</b> Friday, July 19, 2019 1:03 PM<br>
<b>To:</b> Wang, Kevin(Yang) &lt;<a href=3D"mailto:Kevin1.Wang@amd.com">Kev=
in1.Wang@amd.com</a>&gt;;
<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.=
org</a> &lt;<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.=
freedesktop.org</a>&gt;<br>
<b>Cc:</b> Feng, Kenneth &lt;<a href=3D"mailto:Kenneth.Feng@amd.com">Kennet=
h.Feng@amd.com</a>&gt;; Huang, Ray &lt;<a href=3D"mailto:Ray.Huang@amd.com"=
>Ray.Huang@amd.com</a>&gt;; Xu, Feifei &lt;<a href=3D"mailto:Feifei.Xu@amd.=
com">Feifei.Xu@amd.com</a>&gt;; Gui, Jack &lt;<a href=3D"mailto:Jack.Gui@am=
d.com">Jack.Gui@amd.com</a>&gt;<br>
<b>Subject:</b> RE: [PATCH] drm/amd/powerplay: custom peak clock freq for n=
avi10</span><span style=3D"font-family:&quot;Calibri&quot;,sans-serif;color=
:black">
<o:p></o:p></span></p>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">&nbsp;<o:p></o:p></span></p>
</div>
</div>
<div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:black">Comment inline<br>
<br>
&gt; -----Original Message-----<br>
&gt; From: Wang, Kevin(Yang) &lt;<a href=3D"mailto:Kevin1.Wang@amd.com">Kev=
in1.Wang@amd.com</a>&gt;<br>
&gt; Sent: Friday, July 19, 2019 11:46 AM<br>
&gt; To: <a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.fre=
edesktop.org</a><br>
&gt; Cc: Feng, Kenneth &lt;<a href=3D"mailto:Kenneth.Feng@amd.com">Kenneth.=
Feng@amd.com</a>&gt;; Quan, Evan<br>
&gt; &lt;<a href=3D"mailto:Evan.Quan@amd.com">Evan.Quan@amd.com</a>&gt;; Hu=
ang, Ray &lt;<a href=3D"mailto:Ray.Huang@amd.com">Ray.Huang@amd.com</a>&gt;=
; Xu, Feifei<br>
&gt; &lt;<a href=3D"mailto:Feifei.Xu@amd.com">Feifei.Xu@amd.com</a>&gt;; Gu=
i, Jack &lt;<a href=3D"mailto:Jack.Gui@amd.com">Jack.Gui@amd.com</a>&gt;; W=
ang, Kevin(Yang)<br>
&gt; &lt;<a href=3D"mailto:Kevin1.Wang@amd.com">Kevin1.Wang@amd.com</a>&gt;=
<br>
&gt; Subject: [PATCH] drm/amd/powerplay: custom peak clock freq for navi10<=
br>
&gt; <br>
&gt; 1.NAVI10_PEAK_SCLK_XTX&nbsp;&nbsp;&nbsp; 1830 Mhz<br>
&gt; 2.NAVI10_PEAK_SCLK_XT&nbsp;&nbsp;&nbsp;&nbsp; 1755 Mhz<br>
&gt; 3.NAVI10_PEAK_SCLK_XL&nbsp;&nbsp;&nbsp;&nbsp; 1625 Mhz<br>
&gt; <br>
&gt; Change-Id: I48863a9d0e261b9e7778a6c0e4a8762d7c978da6<br>
&gt; Signed-off-by: Kevin Wang &lt;<a href=3D"mailto:kevin1.wang@amd.com">k=
evin1.wang@amd.com</a>&gt;<br>
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
<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:black"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:black">[kevin]: in the future, for specifc asi=
c, it may be&nbsp;custom other performance level, so&nbsp;we should have th=
is&nbsp;capacity to&nbsp;support other asic with any performance level.&nbs=
p;and
 i think it is not a good way to handle performance level use&nbsp;case by =
case method for each asic.<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:black"><br>
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
sp; you can&nbsp; get the clock frequency for the max level.<o:p></o:p></sp=
an></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><span style=3D"font-s=
ize:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:black">[kevin]:=
 not right, 0xff will return dpm clock level count, see function smu_get_dp=
m_level_count&nbsp;<br>
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
&gt; 2.22.0<o:p></o:p></span></p>
</div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_MN2PR12MB3598B7FA125EB5DC2C640D7E8ECB0MN2PR12MB3598namp_--

--===============0636882689==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0636882689==--
