Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39617A7894
	for <lists+amd-gfx@lfdr.de>; Wed,  4 Sep 2019 04:11:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59B90896D8;
	Wed,  4 Sep 2019 02:11:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720056.outbound.protection.outlook.com [40.107.72.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CC22896D8
 for <amd-gfx@lists.freedesktop.org>; Wed,  4 Sep 2019 02:11:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m9BJV2K8YjpREvO9FHV9hrlMCBgjVgacI2mU7eBZjUky//QDv0C8OBwSlDV2O56Kdx6+AfUdDuOEFVN3qrFMH/TBWRp3rnUwIVc/YSvTm2Fik28wj2VVnREZbcDevj/gn69DeozFEbcmcg8KVL7xqWfaWnY1jqyAyVUdIjYRQzXS70zucuSyEnqXPMOLcLafh49dMunwwo2VreWVeInSguYziaWBU/pAyfsu59Lh+ibkMydvPv/ihIWDVG0XaeL+/2kovd/rnGUlvhjpCgXhl7oqKfnMTb32xwpZxrujtrwQf9sa1En6eGjN9m/yoXYdt5tpKCh6SJKoxzsc4pXKVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0tDFflssxpalaTkAtDa8bTvjCHlORBTxrZ+Btg8Cwq8=;
 b=crSIj7bh6Fbj0hGPcoOgb0s/Ov9TSwRK3Hr4bJR+dXJNrm5KyenFrD/ytwouh24mpy3NCG/EYY2E9HABduJj3HVv6TIkSr/hhjiGjh7YHRSit0IHDp2DzSLwiG4XDA+hz5gijjFMId6EHaiXpF7wwVgV7GR9u2xXMrhjHVfF0Ic/6uzMweVNwoYAC6KAgrGnuuaE7JjwlzJihGLIK7dLw83hEzMM2ioS2HRAI8bUq/6MdLV+ZhNGFLLaAEgpXujJvvsaqyEZv4RoSOeIwZZ8fzKPG1/NTlB2KajslB/2buEAx23cWx5Mp1vdjPh22rv4tm3RfdRwS5WdPAWHPO+vTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB3149.namprd12.prod.outlook.com (20.178.244.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.20; Wed, 4 Sep 2019 02:11:47 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::9929:92fb:f329:a911]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::9929:92fb:f329:a911%7]) with mapi id 15.20.2220.021; Wed, 4 Sep 2019
 02:11:47 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Huang, Ray" <Ray.Huang@amd.com>
Subject: Re: [PATCH] drm/amd/powerplay: replace smu->table_count with
 SMU_TABLE_COUNT in smu
Thread-Topic: [PATCH] drm/amd/powerplay: replace smu->table_count with
 SMU_TABLE_COUNT in smu
Thread-Index: AQHVYjADwPThxM4CDE6QIT3TSYUsDKcauCAggAAPAFM=
Date: Wed, 4 Sep 2019 02:11:47 +0000
Message-ID: <MN2PR12MB3296F888862316BBEB874AC2A2B80@MN2PR12MB3296.namprd12.prod.outlook.com>
References: <20190903081702.24937-1-kevin1.wang@amd.com>,
 <MN2PR12MB3344CB5D45A7FE830BDC4E34E4B80@MN2PR12MB3344.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB3344CB5D45A7FE830BDC4E34E4B80@MN2PR12MB3344.namprd12.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f53c1450-fa99-4864-3ddd-08d730dd3d84
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3149; 
x-ms-traffictypediagnostic: MN2PR12MB3149:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3149AC3DD7BE35B00A3749A7A2B80@MN2PR12MB3149.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0150F3F97D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(346002)(39860400002)(396003)(136003)(13464003)(199004)(189003)(6636002)(486006)(99286004)(446003)(476003)(229853002)(11346002)(71200400001)(71190400001)(478600001)(86362001)(102836004)(26005)(14454004)(6506007)(53546011)(966005)(7696005)(33656002)(19627405001)(76176011)(55016002)(66946007)(105004)(76116006)(91956017)(64756008)(66556008)(66476007)(81166006)(9686003)(6436002)(2906002)(81156014)(186003)(66446008)(5660300002)(7736002)(6306002)(25786009)(54896002)(52536014)(6246003)(236005)(8676002)(2501003)(53936002)(316002)(3846002)(110136005)(606006)(66066001)(74316002)(8936002)(14444005)(256004)(6116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3149;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: LBEDH8MjPEISI2Eshtb1szp1RLxLNz3eDaaUT1muJ/DFSysdPd44rZKBYY8fVjhqFj2+reb1cDRTa81B5LijXPFtyr4GvLp2okHMc5Ex73GzsmIVTB6KZpcekz9BHP2m7boD5XAxtaX1ms1EYe84Koxg5HPKuD2ZR6E29o3Xq/jG48KlpHJtcxfFgPUbXw19gOl6IwaC3cgZghEtv374IEq66vLlinuCvjfOpV9K401OKVNbH7c+9fb3k82xUfhIKDo/Cgu91GTtnU8Qjb6mpURMO5P9723QR4jFkMPS4a26wkmHk/Xv/8xot9Ef0wZg3GARFOdQ1bP36fEaY4hevDhcnNJgezpX+zn1Y5UZvTpCtOED+IfA9PI9Djk95Sc4gkqCE91WlOMaNNx3VHvcwyAq90eOvsoCsTuAJqgYFog=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f53c1450-fa99-4864-3ddd-08d730dd3d84
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2019 02:11:47.3007 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dXYcBvesLnaM6viJfFL4SskLv8VXuh1JqwcSYyLuYnfH00r7kv2ebHFc6ib9LLvQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3149
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0tDFflssxpalaTkAtDa8bTvjCHlORBTxrZ+Btg8Cwq8=;
 b=jnFBHQDr+WMc23oAhqOXa6tiWtqsH2mvO7jA+hZwNGdzFh1P6mCpwNLbhTrfJIdVspPMEUrOglgL3RW5MI4J+LaacSbGWxblbjGZwVIqcLxC+j7O6rVmlJEJatnULOMFIWUW4xJHrfy36Nga/n/3I1MGeBTM0OtJXkVC/7/FP1Y=
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
Content-Type: multipart/mixed; boundary="===============1783607258=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1783607258==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB3296F888862316BBEB874AC2A2B80MN2PR12MB3296namp_"

--_000_MN2PR12MB3296F888862316BBEB874AC2A2B80MN2PR12MB3296namp_
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable


________________________________
From: Quan, Evan <Evan.Quan@amd.com>
Sent: Wednesday, September 4, 2019 9:17 AM
To: Wang, Kevin(Yang) <Kevin1.Wang@amd.com>; amd-gfx@lists.freedesktop.org =
<amd-gfx@lists.freedesktop.org>; Huang, Ray <Ray.Huang@amd.com>
Cc: Wang, Kevin(Yang) <Kevin1.Wang@amd.com>
Subject: RE: [PATCH] drm/amd/powerplay: replace smu->table_count with SMU_T=
ABLE_COUNT in smu

Please drop the table_count member from the smu_table structure as it's tot=
ally unused.
With that fixed, the patch is reviewed-by: Evan Quan <evan.quan@amd.com>

[Kevin]:
sure, it should be removed in this patch.

> -----Original Message-----
> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of
> Wang, Kevin(Yang)
> Sent: 2019=1B$BG/=1B(B9=1B$B7n=1B(B3=1B$BF|=1B(B 16:17
> To: amd-gfx@lists.freedesktop.org; Huang, Ray <Ray.Huang@amd.com>
> Cc: Wang, Kevin(Yang) <Kevin1.Wang@amd.com>
> Subject: [PATCH] drm/amd/powerplay: replace smu->table_count with
> SMU_TABLE_COUNT in smu
>
> fix bellow patch issue:
> drm/amd/powerplay: introduce smu table id type to handle the smu table
> for each asic
> ----
> "This patch introduces new smu table type, it's to handle the  different =
smu
> table  defines for each asic with the same smu ip."
>
> before:
> use smu->table_count to represent the actual table count in smc firmware
> use actual table count to check smu function parameter about smu table
> after:
> use logic table count "SMU_TABLE_COUNT" to check function parameter
> because table id already mapped in smu driver, and smu function will use
> logic table id not actual table id to check func parameter.
>
> Signed-off-by: Kevin Wang <kevin1.wang@amd.com>
> ---
>  drivers/gpu/drm/amd/powerplay/amdgpu_smu.c   | 13 ++++---------
>  drivers/gpu/drm/amd/powerplay/arcturus_ppt.c |  1 -
>  drivers/gpu/drm/amd/powerplay/navi10_ppt.c   |  1 -
>  drivers/gpu/drm/amd/powerplay/renoir_ppt.c   |  1 -
>  drivers/gpu/drm/amd/powerplay/smu_v11_0.c    |  5 ++---
>  drivers/gpu/drm/amd/powerplay/vega20_ppt.c   |  1 -
>  6 files changed, 6 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
> b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
> index 6f435d60fe86..c71a82a6a785 100644
> --- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
> +++ b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
> @@ -462,7 +462,7 @@ int smu_update_table(struct smu_context *smu,
> enum smu_table_id table_index, int
>        int ret =3D 0;
>        int table_id =3D smu_table_get_index(smu, table_index);
>
> -     if (!table_data || table_id >=3D smu_table->table_count || table_id=
 < 0)
> +     if (!table_data || table_id >=3D SMU_TABLE_COUNT || table_id < 0)
>                return -EINVAL;
>
>        table =3D &smu_table->tables[table_index]; @@ -940,14 +940,10 @@
> static int smu_init_fb_allocations(struct smu_context *smu)
>        struct amdgpu_device *adev =3D smu->adev;
>        struct smu_table_context *smu_table =3D &smu->smu_table;
>        struct smu_table *tables =3D smu_table->tables;
> -     uint32_t table_count =3D smu_table->table_count;
>        uint32_t i =3D 0;
>        int32_t ret =3D 0;
>
> -     if (table_count <=3D 0)
> -             return -EINVAL;
> -
> -     for (i =3D 0 ; i < table_count; i++) {
> +     for (i =3D 0; i < SMU_TABLE_COUNT; i++) {
>                if (tables[i].size =3D=3D 0)
>                        continue;
>                ret =3D amdgpu_bo_create_kernel(adev,
> @@ -978,13 +974,12 @@ static int smu_fini_fb_allocations(struct
> smu_context *smu)  {
>        struct smu_table_context *smu_table =3D &smu->smu_table;
>        struct smu_table *tables =3D smu_table->tables;
> -     uint32_t table_count =3D smu_table->table_count;
>        uint32_t i =3D 0;
>
> -     if (table_count =3D=3D 0 || tables =3D=3D NULL)
> +     if (!tables)
>                return 0;
>
> -     for (i =3D 0 ; i < table_count; i++) {
> +     for (i =3D 0; i < SMU_TABLE_COUNT; i++) {
>                if (tables[i].size =3D=3D 0)
>                        continue;
>                amdgpu_bo_free_kernel(&tables[i].bo,
> diff --git a/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c
> b/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c
> index f1f072012fac..6e8eb0f94c8b 100644
> --- a/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c
> +++ b/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c
> @@ -1934,5 +1934,4 @@ void arcturus_set_ppt_funcs(struct smu_context
> *smu)
>        struct smu_table_context *smu_table =3D &smu->smu_table;
>
>        smu->ppt_funcs =3D &arcturus_ppt_funcs;
> -     smu_table->table_count =3D TABLE_COUNT;
>  }
> diff --git a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
> b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
> index 744b7501c34d..e3add8b59291 100644
> --- a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
> +++ b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
> @@ -1633,5 +1633,4 @@ void navi10_set_ppt_funcs(struct smu_context
> *smu)
>        struct smu_table_context *smu_table =3D &smu->smu_table;
>
>        smu->ppt_funcs =3D &navi10_ppt_funcs;
> -     smu_table->table_count =3D TABLE_COUNT;
>  }
> diff --git a/drivers/gpu/drm/amd/powerplay/renoir_ppt.c
> b/drivers/gpu/drm/amd/powerplay/renoir_ppt.c
> index de43159564a5..2b953f7431b6 100644
> --- a/drivers/gpu/drm/amd/powerplay/renoir_ppt.c
> +++ b/drivers/gpu/drm/amd/powerplay/renoir_ppt.c
> @@ -169,5 +169,4 @@ void renoir_set_ppt_funcs(struct smu_context *smu)
>
>        smu->ppt_funcs =3D &renoir_ppt_funcs;
>        smu->smc_if_version =3D SMU12_DRIVER_IF_VERSION;
> -     smu_table->table_count =3D TABLE_COUNT;
>  }
> diff --git a/drivers/gpu/drm/amd/powerplay/smu_v11_0.c
> b/drivers/gpu/drm/amd/powerplay/smu_v11_0.c
> index deca9f85764c..3709e4d77338 100644
> --- a/drivers/gpu/drm/amd/powerplay/smu_v11_0.c
> +++ b/drivers/gpu/drm/amd/powerplay/smu_v11_0.c
> @@ -439,7 +439,7 @@ static int smu_v11_0_init_smc_tables(struct
> smu_context *smu)
>        struct smu_table *tables =3D NULL;
>        int ret =3D 0;
>
> -     if (smu_table->tables || smu_table->table_count =3D=3D 0)
> +     if (smu_table->tables)
>                return -EINVAL;
>
>        tables =3D kcalloc(SMU_TABLE_COUNT, sizeof(struct smu_table), @@ -
> 465,13 +465,12 @@ static int smu_v11_0_fini_smc_tables(struct
> smu_context *smu)
>        struct smu_table_context *smu_table =3D &smu->smu_table;
>        int ret =3D 0;
>
> -     if (!smu_table->tables || smu_table->table_count =3D=3D 0)
> +     if (!smu_table->tables)
>                return -EINVAL;
>
>        kfree(smu_table->tables);
>        kfree(smu_table->metrics_table);
>        smu_table->tables =3D NULL;
> -     smu_table->table_count =3D 0;
>        smu_table->metrics_table =3D NULL;
>        smu_table->metrics_time =3D 0;
>
> diff --git a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c
> b/drivers/gpu/drm/amd/powerplay/vega20_ppt.c
> index 899bf96b23e1..68548ba9b6ea 100644
> --- a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c
> +++ b/drivers/gpu/drm/amd/powerplay/vega20_ppt.c
> @@ -3189,5 +3189,4 @@ void vega20_set_ppt_funcs(struct smu_context
> *smu)
>        struct smu_table_context *smu_table =3D &smu->smu_table;
>
>        smu->ppt_funcs =3D &vega20_ppt_funcs;
> -     smu_table->table_count =3D TABLE_COUNT;
>  }
> --
> 2.22.0
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_MN2PR12MB3296F888862316BBEB874AC2A2B80MN2PR12MB3296namp_
Content-Type: text/html; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-2022-=
jp">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Quan, Evan &lt;Evan.Q=
uan@amd.com&gt;<br>
<b>Sent:</b> Wednesday, September 4, 2019 9:17 AM<br>
<b>To:</b> Wang, Kevin(Yang) &lt;Kevin1.Wang@amd.com&gt;; amd-gfx@lists.fre=
edesktop.org &lt;amd-gfx@lists.freedesktop.org&gt;; Huang, Ray &lt;Ray.Huan=
g@amd.com&gt;<br>
<b>Cc:</b> Wang, Kevin(Yang) &lt;Kevin1.Wang@amd.com&gt;<br>
<b>Subject:</b> RE: [PATCH] drm/amd/powerplay: replace smu-&gt;table_count =
with SMU_TABLE_COUNT in smu</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">Please drop the table_count member from the smu_ta=
ble structure as it's totally unused.<br>
With that fixed, the patch is reviewed-by: Evan Quan &lt;evan.quan@amd.com&=
gt;</div>
<div class=3D"PlainText"><br>
</div>
<div class=3D"PlainText">[Kevin]:</div>
<div class=3D"PlainText">sure, it should be removed in this patch.<br>
<br>
&gt; -----Original Message-----<br>
&gt; From: amd-gfx &lt;amd-gfx-bounces@lists.freedesktop.org&gt; On Behalf =
Of<br>
&gt; Wang, Kevin(Yang)<br>
&gt; Sent: 2019=1B$BG/=1B(B9=1B$B7n=1B(B3=1B$BF|=1B(B 16:17<br>
&gt; To: amd-gfx@lists.freedesktop.org; Huang, Ray &lt;Ray.Huang@amd.com&gt=
;<br>
&gt; Cc: Wang, Kevin(Yang) &lt;Kevin1.Wang@amd.com&gt;<br>
&gt; Subject: [PATCH] drm/amd/powerplay: replace smu-&gt;table_count with<b=
r>
&gt; SMU_TABLE_COUNT in smu<br>
&gt; <br>
&gt; fix bellow patch issue:<br>
&gt; drm/amd/powerplay: introduce smu table id type to handle the smu table=
<br>
&gt; for each asic<br>
&gt; ----<br>
&gt; &quot;This patch introduces new smu table type, it's to handle the&nbs=
p; different smu<br>
&gt; table&nbsp; defines for each asic with the same smu ip.&quot;<br>
&gt; <br>
&gt; before:<br>
&gt; use smu-&gt;table_count to represent the actual table count in smc fir=
mware<br>
&gt; use actual table count to check smu function parameter about smu table=
<br>
&gt; after:<br>
&gt; use logic table count &quot;SMU_TABLE_COUNT&quot; to check function pa=
rameter<br>
&gt; because table id already mapped in smu driver, and smu function will u=
se<br>
&gt; logic table id not actual table id to check func parameter.<br>
&gt; <br>
&gt; Signed-off-by: Kevin Wang &lt;kevin1.wang@amd.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; drivers/gpu/drm/amd/powerplay/amdgpu_smu.c&nbsp;&nbsp; | 13 &#43=
;&#43;&#43;&#43;---------<br>
&gt;&nbsp; drivers/gpu/drm/amd/powerplay/arcturus_ppt.c |&nbsp; 1 -<br>
&gt;&nbsp; drivers/gpu/drm/amd/powerplay/navi10_ppt.c&nbsp;&nbsp; |&nbsp; 1=
 -<br>
&gt;&nbsp; drivers/gpu/drm/amd/powerplay/renoir_ppt.c&nbsp;&nbsp; |&nbsp; 1=
 -<br>
&gt;&nbsp; drivers/gpu/drm/amd/powerplay/smu_v11_0.c&nbsp;&nbsp;&nbsp; |&nb=
sp; 5 &#43;&#43;---<br>
&gt;&nbsp; drivers/gpu/drm/amd/powerplay/vega20_ppt.c&nbsp;&nbsp; |&nbsp; 1=
 -<br>
&gt;&nbsp; 6 files changed, 6 insertions(&#43;), 16 deletions(-)<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c<br>
&gt; b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c<br>
&gt; index 6f435d60fe86..c71a82a6a785 100644<br>
&gt; --- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c<br>
&gt; @@ -462,7 &#43;462,7 @@ int smu_update_table(struct smu_context *smu,<=
br>
&gt; enum smu_table_id table_index, int<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret =3D 0;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int table_id =3D smu_table_g=
et_index(smu, table_index);<br>
&gt; <br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; if (!table_data || table_id &gt;=3D smu_tabl=
e-&gt;table_count || table_id &lt; 0)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if (!table_data || table_id &gt;=3D SMU_=
TABLE_COUNT || table_id &lt; 0)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; return -EINVAL;<br>
&gt; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; table =3D &amp;smu_table-&gt=
;tables[table_index]; @@ -940,14 &#43;940,10 @@<br>
&gt; static int smu_init_fb_allocations(struct smu_context *smu)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_device *adev =
=3D smu-&gt;adev;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct smu_table_context *sm=
u_table =3D &amp;smu-&gt;smu_table;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct smu_table *tables =3D=
 smu_table-&gt;tables;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; uint32_t table_count =3D smu_table-&gt;table=
_count;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t i =3D 0;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int32_t ret =3D 0;<br>
&gt; <br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; if (table_count &lt;=3D 0)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return -EINVAL;<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0 ; i &lt; table_count; i&#43;&#4=
3;) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; SMU_TABLE_COUNT; i&=
#43;&#43;) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; if (tables[i].size =3D=3D 0)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continu=
e;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; ret =3D amdgpu_bo_create_kernel(adev,<br>
&gt; @@ -978,13 &#43;974,12 @@ static int smu_fini_fb_allocations(struct<br=
>
&gt; smu_context *smu)&nbsp; {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct smu_table_context *sm=
u_table =3D &amp;smu-&gt;smu_table;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct smu_table *tables =3D=
 smu_table-&gt;tables;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; uint32_t table_count =3D smu_table-&gt;table=
_count;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t i =3D 0;<br>
&gt; <br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; if (table_count =3D=3D 0 || tables =3D=3D NU=
LL)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if (!tables)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt; <br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0 ; i &lt; table_count; i&#43;&#4=
3;) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; SMU_TABLE_COUNT; i&=
#43;&#43;) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; if (tables[i].size =3D=3D 0)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continu=
e;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; amdgpu_bo_free_kernel(&amp;tables[i].bo,<br>
&gt; diff --git a/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c<br>
&gt; b/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c<br>
&gt; index f1f072012fac..6e8eb0f94c8b 100644<br>
&gt; --- a/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c<br>
&gt; @@ -1934,5 &#43;1934,4 @@ void arcturus_set_ppt_funcs(struct smu_conte=
xt<br>
&gt; *smu)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct smu_table_context *sm=
u_table =3D &amp;smu-&gt;smu_table;<br>
&gt; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smu-&gt;ppt_funcs =3D &amp;a=
rcturus_ppt_funcs;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; smu_table-&gt;table_count =3D TABLE_COUNT;<b=
r>
&gt;&nbsp; }<br>
&gt; diff --git a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c<br>
&gt; b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c<br>
&gt; index 744b7501c34d..e3add8b59291 100644<br>
&gt; --- a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c<br>
&gt; @@ -1633,5 &#43;1633,4 @@ void navi10_set_ppt_funcs(struct smu_context=
<br>
&gt; *smu)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct smu_table_context *sm=
u_table =3D &amp;smu-&gt;smu_table;<br>
&gt; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smu-&gt;ppt_funcs =3D &amp;n=
avi10_ppt_funcs;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; smu_table-&gt;table_count =3D TABLE_COUNT;<b=
r>
&gt;&nbsp; }<br>
&gt; diff --git a/drivers/gpu/drm/amd/powerplay/renoir_ppt.c<br>
&gt; b/drivers/gpu/drm/amd/powerplay/renoir_ppt.c<br>
&gt; index de43159564a5..2b953f7431b6 100644<br>
&gt; --- a/drivers/gpu/drm/amd/powerplay/renoir_ppt.c<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/renoir_ppt.c<br>
&gt; @@ -169,5 &#43;169,4 @@ void renoir_set_ppt_funcs(struct smu_context *=
smu)<br>
&gt; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smu-&gt;ppt_funcs =3D &amp;r=
enoir_ppt_funcs;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smu-&gt;smc_if_version =3D S=
MU12_DRIVER_IF_VERSION;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; smu_table-&gt;table_count =3D TABLE_COUNT;<b=
r>
&gt;&nbsp; }<br>
&gt; diff --git a/drivers/gpu/drm/amd/powerplay/smu_v11_0.c<br>
&gt; b/drivers/gpu/drm/amd/powerplay/smu_v11_0.c<br>
&gt; index deca9f85764c..3709e4d77338 100644<br>
&gt; --- a/drivers/gpu/drm/amd/powerplay/smu_v11_0.c<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/smu_v11_0.c<br>
&gt; @@ -439,7 &#43;439,7 @@ static int smu_v11_0_init_smc_tables(struct<br=
>
&gt; smu_context *smu)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct smu_table *tables =3D=
 NULL;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret =3D 0;<br>
&gt; <br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; if (smu_table-&gt;tables || smu_table-&gt;ta=
ble_count =3D=3D 0)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if (smu_table-&gt;tables)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; return -EINVAL;<br>
&gt; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tables =3D kcalloc(SMU_TABLE=
_COUNT, sizeof(struct smu_table), @@ -<br>
&gt; 465,13 &#43;465,12 @@ static int smu_v11_0_fini_smc_tables(struct<br>
&gt; smu_context *smu)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct smu_table_context *sm=
u_table =3D &amp;smu-&gt;smu_table;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret =3D 0;<br>
&gt; <br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; if (!smu_table-&gt;tables || smu_table-&gt;t=
able_count =3D=3D 0)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if (!smu_table-&gt;tables)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; return -EINVAL;<br>
&gt; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kfree(smu_table-&gt;tables);=
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kfree(smu_table-&gt;metrics_=
table);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smu_table-&gt;tables =3D NUL=
L;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; smu_table-&gt;table_count =3D 0;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smu_table-&gt;metrics_table =
=3D NULL;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smu_table-&gt;metrics_time =
=3D 0;<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c<br>
&gt; b/drivers/gpu/drm/amd/powerplay/vega20_ppt.c<br>
&gt; index 899bf96b23e1..68548ba9b6ea 100644<br>
&gt; --- a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/vega20_ppt.c<br>
&gt; @@ -3189,5 &#43;3189,4 @@ void vega20_set_ppt_funcs(struct smu_context=
<br>
&gt; *smu)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct smu_table_context *sm=
u_table =3D &amp;smu-&gt;smu_table;<br>
&gt; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smu-&gt;ppt_funcs =3D &amp;v=
ega20_ppt_funcs;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; smu_table-&gt;table_count =3D TABLE_COUNT;<b=
r>
&gt;&nbsp; }<br>
&gt; --<br>
&gt; 2.22.0<br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; amd-gfx mailing list<br>
&gt; amd-gfx@lists.freedesktop.org<br>
&gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">htt=
ps://lists.freedesktop.org/mailman/listinfo/amd-gfx</a><br>
</div>
</span></font></div>
</body>
</html>

--_000_MN2PR12MB3296F888862316BBEB874AC2A2B80MN2PR12MB3296namp_--

--===============1783607258==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1783607258==--
