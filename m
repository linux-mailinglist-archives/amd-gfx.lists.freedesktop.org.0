Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3430DD5D93
	for <lists+amd-gfx@lfdr.de>; Mon, 14 Oct 2019 10:35:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A94466E142;
	Mon, 14 Oct 2019 08:35:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790081.outbound.protection.outlook.com [40.107.79.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E72A6E13D
 for <amd-gfx@lists.freedesktop.org>; Mon, 14 Oct 2019 08:35:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lCHc0HjqaeuKUTS60i6+pzYdr3oR1S7LqcD3WFEY4MMHpe5FiFoPrU8BqSMlJs10C7ks00t9ii0TzyjsZ5B6ibfvgIUIp9rfsE4q2ZiHNj50Zdhi3f0t0hKKDdEI0ObOB4+dgnG0Ueorjie3Ctv+zv39ZqnBqzuB1kf5+M42GFB5yiXWHQ2q4t9Ee5x5CgCQxZC4JCuZes8zYv7WTjnkUsQYCw08LIHZmwzjZGwjimSB1TH8Rr+Ji34Vr95ou8UY71ofhV16Qq2Gn+qSPAECGKSKbahKMis1bTYI7SfjPe6l0uWUVh0rg/6LWXp/beMlxgZPBu5XXgW2hwSziUTrog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y88Ibt1+N1QmFaPKmFozawV7E+rnXgbTqDtHA3v8VJo=;
 b=GPO44LKl+gpgdVI2yzBHuLn7bnG3dBHUP08dPRPWt18Z5rjHhH6tg+WzdHnmfpwlGcu4Bif1RpwmVmntROSXBNZujL1PyVQlTTI4QA4Ztlpyzpy9X8fRx6v2Z6TMpjmRMyWqgQlRswBRTRAcsAhzrku19pO8kj8mJFZgEdg5lfu8pOn4ErpJKx0GBkLv+SxgxNaXxrQcpTXhjofxgZ+egxJqNHy0FHGlPuBw5XltY7DMrzygFTqPHc2HzDus4KKjnjg2a2Lnyg3gRYxJdLnMAGyipdsVoOYiju0FQSViP9HSV5jkI6p7JPb5xat2pQ2ba6LbMvELOpibhuVxYVn7IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB2535.namprd12.prod.outlook.com (52.132.141.154) by
 DM5PR12MB1674.namprd12.prod.outlook.com (10.172.40.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Mon, 14 Oct 2019 08:35:10 +0000
Received: from DM5PR12MB2535.namprd12.prod.outlook.com
 ([fe80::8d85:da2d:2f38:9b87]) by DM5PR12MB2535.namprd12.prod.outlook.com
 ([fe80::8d85:da2d:2f38:9b87%4]) with mapi id 15.20.2347.023; Mon, 14 Oct 2019
 08:35:10 +0000
From: "Yin, Tianci (Rico)" <Tianci.Yin@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, "Tuikov, Luben"
 <Luben.Tuikov@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 7/8] drm/amdgpu: reserve vram for memory training
Thread-Topic: [PATCH 7/8] drm/amdgpu: reserve vram for memory training
Thread-Index: AQHVf+clnKNBiK35lEmo7UEkjy8QzKdWFgoAgAO8NICAAAIXqg==
Date: Mon, 14 Oct 2019 08:35:10 +0000
Message-ID: <DM5PR12MB2535759A477900F96128CAC395900@DM5PR12MB2535.namprd12.prod.outlook.com>
References: <20191011035033.24935-1-tianci.yin@amd.com>
 <20191011035033.24935-7-tianci.yin@amd.com>
 <9084e67e-adc2-b512-b593-ca218c17a366@amd.com>,
 <a93b3b8e-4df9-f6e2-95f7-3f0c0d8bebdc@amd.com>
In-Reply-To: <a93b3b8e-4df9-f6e2-95f7-3f0c0d8bebdc@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 21b514c9-b58b-479e-6715-08d750816ce1
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM5PR12MB1674:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB16746927EC303B9CD13B310495900@DM5PR12MB1674.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01901B3451
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(366004)(396003)(376002)(346002)(199004)(189003)(105004)(26005)(7736002)(99936001)(486006)(4326008)(52536014)(316002)(7696005)(76176011)(74316002)(110136005)(5660300002)(25786009)(33656002)(11346002)(476003)(2906002)(446003)(19627405001)(4001150100001)(6506007)(99286004)(86362001)(6116002)(3846002)(186003)(478600001)(256004)(91956017)(81156014)(66946007)(8676002)(81166006)(102836004)(9686003)(14454004)(53546011)(76116006)(8936002)(71190400001)(71200400001)(6436002)(54896002)(2501003)(66556008)(55016002)(66446008)(64756008)(66476007)(66616009)(229853002)(6246003)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1674;
 H:DM5PR12MB2535.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: C1R0dHYZ5fpgHlpjJBqolOXOaXVmFLWNXw0I5Qhr4erB16ztUU5FVW1Gw8m+nKuCwwqOTF813wwx0dEsc4aJ2+LxMOcYiaXW35XQ+YytP+VvIvJrMDkavJKf1uOT8bDZPDz4j4lo/saPQ+OVgrF1iwEasjeKDxpWqhn9rWPwp21+zs3Odtae3yPwbuKIQCAT+WtQU8pv9qpzcPZIqJUIzglP7lehehMZQvf4OJIG4XLbJjhLTDf5WIDa6mQPeL21/5hYLC2x7Htn1v328fRHbF/kBgm2W6aFCX2brcZa3kvNssIjjNGCwlHt9qL9uHGgJ6BpTofNX2gZvGp89VXFbEoxjZbPXVXjwpnYiHuwXWBES73FfMSnH6LidYlTVJ4U4ceUsYaYQCtuG3B4QYZqONf6ljZYUMxjp9zBp3kdQcM=
Content-Type: multipart/mixed;
 boundary="_004_DM5PR12MB2535759A477900F96128CAC395900DM5PR12MB2535namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21b514c9-b58b-479e-6715-08d750816ce1
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2019 08:35:10.2310 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4cTrwySEoDGvzgIzbu4qkzI9nO8fFQRMOM2k4GkkcsWBTnnAPtnDBBpvH8H2Y4s9MV92+qAYTA06r2QBrg4FEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1674
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y88Ibt1+N1QmFaPKmFozawV7E+rnXgbTqDtHA3v8VJo=;
 b=IoznzKqNPQA3O8yVI+QL7DNcXYsHz/L13jAXunmuWwIbfFCBZupyzr8ce9LmoNJKzs87f1YMvu80i5NUabzteQ9+CNn0r7/YoIjqdDVp9NF/pnZJh/RQk1xWFOncjibtzeEqE099FVND46bNx707+Ga6WtekFJXc+jlY/qvAwOI=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Tianci.Yin@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--_004_DM5PR12MB2535759A477900F96128CAC395900DM5PR12MB2535namp_
Content-Type: multipart/alternative;
	boundary="_000_DM5PR12MB2535759A477900F96128CAC395900DM5PR12MB2535namp_"

--_000_DM5PR12MB2535759A477900F96128CAC395900DM5PR12MB2535namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks very much Christian!

Rico
________________________________
From: Koenig, Christian <Christian.Koenig@amd.com>
Sent: Monday, October 14, 2019 16:26
To: Tuikov, Luben <Luben.Tuikov@amd.com>; Yin, Tianci (Rico) <Tianci.Yin@am=
d.com>; amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Cc: Deucher, Alexander <Alexander.Deucher@amd.com>
Subject: Re: [PATCH 7/8] drm/amdgpu: reserve vram for memory training

Am 12.10.19 um 01:23 schrieb Tuikov, Luben:
> On 2019-10-10 11:50 p.m., Tianci Yin wrote:
>> From: "Tianci.Yin" <tianci.yin@amd.com>
>>
>> memory training using specific fixed vram segment, reserve these
>> segments before anyone may allocate it.
>>
>> Change-Id: I1436755813a565608a2857a683f535377620a637
>> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
>> Signed-off-by: Tianci.Yin <tianci.yin@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 96 +++++++++++++++++++++++++
>>   1 file changed, 96 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_ttm.c
>> index 9da6350a4ba2..42d0fcb98382 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> @@ -1667,6 +1667,93 @@ static int amdgpu_ttm_fw_reserve_vram_init(struct=
 amdgpu_device *adev)
>>                                         &adev->fw_vram_usage.va);
>>   }
>>
>> +/*
>> + * Memoy training reservation functions
>> + */
>> +
>> +/**
>> + * amdgpu_ttm_training_reserve_vram_fini - free memory training reserve=
d vram
>> + *
>> + * @adev: amdgpu_device pointer
>> + *
>> + * free memory training reserved vram if it has been reserved.
>> + */
>> +static int amdgpu_ttm_training_reserve_vram_fini(struct amdgpu_device *=
adev)
>> +{
>> +    struct psp_memory_training_context *ctx =3D &adev->psp.mem_train_ct=
x;
>> +
>> +    ctx->init =3D PSP_MEM_TRAIN_NOT_SUPPORT;
>> +    if (ctx->c2p_bo) {
>> +            amdgpu_bo_free_kernel(&ctx->c2p_bo, NULL, NULL);
>> +            ctx->c2p_bo =3D NULL;
>> +    }
> Generally it is a good idea to paragraph your code.
> So an empty line between if-statements is a good idea.
> However, there is no need in:
>
> ret =3D f(x);
> if (ret) {
>        <body of code>
> }
>
> if (blah) {
>        <body of code>
> }
>
> The above are two (2) well-formed paragraphs.

Additional to that amdgpu_bo_free_kernel() just like kfree() is NULL
safe for the reason that you shouldn't need "if"s like that one.

E.g. just write:

amdgpu_bo_free_kernel(&ctx->c2p_bo...);

and you are done.

Regards,
Christian.

>
>> +    if (ctx->p2c_bo) {
>> +            amdgpu_bo_free_kernel(&ctx->p2c_bo, NULL, NULL);
>> +            ctx->p2c_bo =3D NULL;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +/**
>> + * amdgpu_ttm_training_reserve_vram_init - create bo vram reservation f=
rom memory training
>> + *
>> + * @adev: amdgpu_device pointer
>> + *
>> + * create bo vram reservation from memory training.
>> + */
>> +static int amdgpu_ttm_training_reserve_vram_init(struct amdgpu_device *=
adev)
>> +{
>> +    int ret;
>> +    struct psp_memory_training_context *ctx =3D &adev->psp.mem_train_ct=
x;
>> +
>> +    memset(ctx, 0, sizeof(*ctx));
>> +    if (!adev->fw_vram_usage.mem_train_support) {
>> +            DRM_DEBUG("memory training does not support!\n");
>> +            return 0;
>> +    }
>> +
>> +    ctx->c2p_train_data_offset =3D adev->fw_vram_usage.mem_train_fb_loc=
;
>> +    ctx->p2c_train_data_offset =3D (adev->gmc.mc_vram_size - GDDR6_MEM_=
TRAINING_OFFSET);
>> +    ctx->train_data_size =3D GDDR6_MEM_TRAINING_DATA_SIZE_IN_BYTES;
>> +
>> +    DRM_DEBUG("train_data_size:%llx,p2c_train_data_offset:%llx,c2p_trai=
n_data_offset:%llx.\n",
>> +              ctx->train_data_size,
>> +              ctx->p2c_train_data_offset,
>> +              ctx->c2p_train_data_offset);
>> +
>> +    ret =3D amdgpu_bo_create_kernel_at(adev,
>> +                                     ctx->p2c_train_data_offset,
>> +                                     ctx->train_data_size,
>> +                                     AMDGPU_GEM_DOMAIN_VRAM,
>> +                                     &ctx->p2c_bo,
>> +                                     NULL);
>> +    if (ret) {
>> +            DRM_ERROR("alloc p2c_bo failed(%d)!\n", ret);
>> +            ret =3D -ENOMEM;
>> +            goto err_out;
>> +    }
> NAK!
> Why are you re-writing the error code from "amdgpu_bo_create_kenrel_at()"=
?
> Pass the error as is.
>
>> +
>> +    ret =3D amdgpu_bo_create_kernel_at(adev,
>> +                                     ctx->c2p_train_data_offset,
>> +                                     ctx->train_data_size,
>> +                                     AMDGPU_GEM_DOMAIN_VRAM,
>> +                                     &ctx->c2p_bo,
>> +                                     NULL);
>> +    if (ret) {
>> +            DRM_ERROR("alloc c2p_bo failed(%d)!\n", ret);
>> +            ret =3D -ENOMEM;
>> +            goto err_out;
>> +    }
> NAK!
> Why are you re-writing the error code from "amdgpu_bo_create_kenrel_at()"=
?
> Pass the error as is.
>
>> +
>> +    ctx->init =3D PSP_MEM_TRAIN_RESERVE_SUCCESS;
>> +    return 0;
>> +
>> +err_out:
> Yes... well "err_out" could be any identifier, including
> a variable, as our variables follow snake-notation, all lowercase.
>
> Back at the turn of this century, Linux followed capitalized
> goto labels to distinguish them from anything else around
> in the kernel code:
>
>        goto Bad_err;
>        ...
>
>        return 0;
> Bad_err:
>        return bad_gift;
> }
>
> To distinguish that a capitalized identifier is a goto label,
> "Bad_err" and all lower-case label is just another variable
> or function identifier, "bad_gift".
>
> Regards,
> Luben
>
>> +    amdgpu_ttm_training_reserve_vram_fini(adev);
>> +    return ret;
>> +}
>> +
>>   /**
>>    * amdgpu_ttm_init - Init the memory management (ttm) as well as vario=
us
>>    * gtt/vram related fields.
>> @@ -1740,6 +1827,14 @@ int amdgpu_ttm_init(struct amdgpu_device *adev)
>>               return r;
>>       }
>>
>> +    /*
>> +     *The reserved vram for memory training must be pinned to the speci=
fied
>> +     *place on the VRAM, so reserve it early.
>> +     */
>> +    r =3D amdgpu_ttm_training_reserve_vram_init(adev);
>> +    if (r)
>> +            return r;
>> +
>>       /* allocate memory as required for VGA
>>        * This is used for VGA emulation and pre-OS scanout buffers to
>>        * avoid display artifacts while transitioning between pre-OS
>> @@ -1825,6 +1920,7 @@ void amdgpu_ttm_fini(struct amdgpu_device *adev)
>>               return;
>>
>>       amdgpu_ttm_debugfs_fini(adev);
>> +    amdgpu_ttm_training_reserve_vram_fini(adev);
>>       amdgpu_ttm_fw_reserve_vram_fini(adev);
>>       if (adev->mman.aper_base_kaddr)
>>               iounmap(adev->mman.aper_base_kaddr);
>>


--_000_DM5PR12MB2535759A477900F96128CAC395900DM5PR12MB2535namp_
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
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks very much Christian!</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Rico<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Koenig, Christian &lt=
;Christian.Koenig@amd.com&gt;<br>
<b>Sent:</b> Monday, October 14, 2019 16:26<br>
<b>To:</b> Tuikov, Luben &lt;Luben.Tuikov@amd.com&gt;; Yin, Tianci (Rico) &=
lt;Tianci.Yin@amd.com&gt;; amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.=
freedesktop.org&gt;<br>
<b>Cc:</b> Deucher, Alexander &lt;Alexander.Deucher@amd.com&gt;<br>
<b>Subject:</b> Re: [PATCH 7/8] drm/amdgpu: reserve vram for memory trainin=
g</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Am 12.10.19 um 01:23 schrieb Tuikov, Luben:<br>
&gt; On 2019-10-10 11:50 p.m., Tianci Yin wrote:<br>
&gt;&gt; From: &quot;Tianci.Yin&quot; &lt;tianci.yin@amd.com&gt;<br>
&gt;&gt;<br>
&gt;&gt; memory training using specific fixed vram segment, reserve these<b=
r>
&gt;&gt; segments before anyone may allocate it.<br>
&gt;&gt;<br>
&gt;&gt; Change-Id: I1436755813a565608a2857a683f535377620a637<br>
&gt;&gt; Reviewed-by: Alex Deucher &lt;alexander.deucher@amd.com&gt;<br>
&gt;&gt; Signed-off-by: Tianci.Yin &lt;tianci.yin@amd.com&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 96 &#43;&#43=
;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43=
;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<br>
&gt;&gt;&nbsp;&nbsp; 1 file changed, 96 insertions(&#43;)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu=
/drm/amd/amdgpu/amdgpu_ttm.c<br>
&gt;&gt; index 9da6350a4ba2..42d0fcb98382 100644<br>
&gt;&gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c<br>
&gt;&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c<br>
&gt;&gt; @@ -1667,6 &#43;1667,93 @@ static int amdgpu_ttm_fw_reserve_vram_i=
nit(struct amdgpu_device *adev)<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &amp;adev-&gt;fw_vram_usage.va);<br>
&gt;&gt;&nbsp;&nbsp; }<br>
&gt;&gt;&nbsp;&nbsp; <br>
&gt;&gt; &#43;/*<br>
&gt;&gt; &#43; * Memoy training reservation functions<br>
&gt;&gt; &#43; */<br>
&gt;&gt; &#43;<br>
&gt;&gt; &#43;/**<br>
&gt;&gt; &#43; * amdgpu_ttm_training_reserve_vram_fini - free memory traini=
ng reserved vram<br>
&gt;&gt; &#43; *<br>
&gt;&gt; &#43; * @adev: amdgpu_device pointer<br>
&gt;&gt; &#43; *<br>
&gt;&gt; &#43; * free memory training reserved vram if it has been reserved=
.<br>
&gt;&gt; &#43; */<br>
&gt;&gt; &#43;static int amdgpu_ttm_training_reserve_vram_fini(struct amdgp=
u_device *adev)<br>
&gt;&gt; &#43;{<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp; struct psp_memory_training_context *ctx =
=3D &amp;adev-&gt;psp.mem_train_ctx;<br>
&gt;&gt; &#43;<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp; ctx-&gt;init =3D PSP_MEM_TRAIN_NOT_SUPPORT=
;<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp; if (ctx-&gt;c2p_bo) {<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; amdgpu_bo_free_kernel(&amp;ctx-&gt;c2p_bo, NULL, NULL);<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; ctx-&gt;c2p_bo =3D NULL;<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp; }<br>
&gt; Generally it is a good idea to paragraph your code.<br>
&gt; So an empty line between if-statements is a good idea.<br>
&gt; However, there is no need in:<br>
&gt;<br>
&gt; ret =3D f(x);<br>
&gt; if (ret) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;body of code&gt;<br>
&gt; }<br>
&gt;<br>
&gt; if (blah) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;body of code&gt;<br>
&gt; }<br>
&gt;<br>
&gt; The above are two (2) well-formed paragraphs.<br>
<br>
Additional to that amdgpu_bo_free_kernel() just like kfree() is NULL <br>
safe for the reason that you shouldn't need &quot;if&quot;s like that one.<=
br>
<br>
E.g. just write:<br>
<br>
amdgpu_bo_free_kernel(&amp;ctx-&gt;c2p_bo...);<br>
<br>
and you are done.<br>
<br>
Regards,<br>
Christian.<br>
<br>
&gt;<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp; if (ctx-&gt;p2c_bo) {<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; amdgpu_bo_free_kernel(&amp;ctx-&gt;p2c_bo, NULL, NULL);<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; ctx-&gt;p2c_bo =3D NULL;<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp; }<br>
&gt;&gt; &#43;<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt;&gt; &#43;}<br>
&gt;&gt; &#43;<br>
&gt;&gt; &#43;/**<br>
&gt;&gt; &#43; * amdgpu_ttm_training_reserve_vram_init - create bo vram res=
ervation from memory training<br>
&gt;&gt; &#43; *<br>
&gt;&gt; &#43; * @adev: amdgpu_device pointer<br>
&gt;&gt; &#43; *<br>
&gt;&gt; &#43; * create bo vram reservation from memory training.<br>
&gt;&gt; &#43; */<br>
&gt;&gt; &#43;static int amdgpu_ttm_training_reserve_vram_init(struct amdgp=
u_device *adev)<br>
&gt;&gt; &#43;{<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp; int ret;<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp; struct psp_memory_training_context *ctx =
=3D &amp;adev-&gt;psp.mem_train_ctx;<br>
&gt;&gt; &#43;<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp; memset(ctx, 0, sizeof(*ctx));<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp; if (!adev-&gt;fw_vram_usage.mem_train_supp=
ort) {<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; DRM_DEBUG(&quot;memory training does not support!\n&quot;);<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return 0;<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp; }<br>
&gt;&gt; &#43;<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp; ctx-&gt;c2p_train_data_offset =3D adev-&gt=
;fw_vram_usage.mem_train_fb_loc;<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp; ctx-&gt;p2c_train_data_offset =3D (adev-&g=
t;gmc.mc_vram_size - GDDR6_MEM_TRAINING_OFFSET);<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp; ctx-&gt;train_data_size =3D GDDR6_MEM_TRAI=
NING_DATA_SIZE_IN_BYTES;<br>
&gt;&gt; &#43;<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp; DRM_DEBUG(&quot;train_data_size:%llx,p2c_t=
rain_data_offset:%llx,c2p_train_data_offset:%llx.\n&quot;,<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; ctx-&gt;train_data_size,<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; ctx-&gt;p2c_train_data_offset,<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; ctx-&gt;c2p_train_data_offset);<br>
&gt;&gt; &#43;<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp; ret =3D amdgpu_bo_create_kernel_at(adev,<b=
r>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; ctx-&gt;p2c_train_data_offset,<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; ctx-&gt;train_data_size,<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; AMDGPU_GEM_DOMAIN_VRAM,<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; &amp;ctx-&gt;p2c_bo,<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; NULL);<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp; if (ret) {<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; DRM_ERROR(&quot;alloc p2c_bo failed(%d)!\n&quot;, ret);<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; ret =3D -ENOMEM;<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; goto err_out;<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp; }<br>
&gt; NAK!<br>
&gt; Why are you re-writing the error code from &quot;amdgpu_bo_create_kenr=
el_at()&quot;?<br>
&gt; Pass the error as is.<br>
&gt;<br>
&gt;&gt; &#43;<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp; ret =3D amdgpu_bo_create_kernel_at(adev,<b=
r>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; ctx-&gt;c2p_train_data_offset,<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; ctx-&gt;train_data_size,<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; AMDGPU_GEM_DOMAIN_VRAM,<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; &amp;ctx-&gt;c2p_bo,<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; NULL);<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp; if (ret) {<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; DRM_ERROR(&quot;alloc c2p_bo failed(%d)!\n&quot;, ret);<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; ret =3D -ENOMEM;<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; goto err_out;<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp; }<br>
&gt; NAK!<br>
&gt; Why are you re-writing the error code from &quot;amdgpu_bo_create_kenr=
el_at()&quot;?<br>
&gt; Pass the error as is.<br>
&gt;<br>
&gt;&gt; &#43;<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp; ctx-&gt;init =3D PSP_MEM_TRAIN_RESERVE_SUC=
CESS;<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt;&gt; &#43;<br>
&gt;&gt; &#43;err_out:<br>
&gt; Yes... well &quot;err_out&quot; could be any identifier, including<br>
&gt; a variable, as our variables follow snake-notation, all lowercase.<br>
&gt;<br>
&gt; Back at the turn of this century, Linux followed capitalized<br>
&gt; goto labels to distinguish them from anything else around<br>
&gt; in the kernel code:<br>
&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto Bad_err;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ...<br>
&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt; Bad_err:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return bad_gift;<br>
&gt; }<br>
&gt;<br>
&gt; To distinguish that a capitalized identifier is a goto label,<br>
&gt; &quot;Bad_err&quot; and all lower-case label is just another variable<=
br>
&gt; or function identifier, &quot;bad_gift&quot;.<br>
&gt;<br>
&gt; Regards,<br>
&gt; Luben<br>
&gt;<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp; amdgpu_ttm_training_reserve_vram_fini(adev=
);<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp; return ret;<br>
&gt;&gt; &#43;}<br>
&gt;&gt; &#43;<br>
&gt;&gt;&nbsp;&nbsp; /**<br>
&gt;&gt;&nbsp;&nbsp;&nbsp; * amdgpu_ttm_init - Init the memory management (=
ttm) as well as various<br>
&gt;&gt;&nbsp;&nbsp;&nbsp; * gtt/vram related fields.<br>
&gt;&gt; @@ -1740,6 &#43;1827,14 @@ int amdgpu_ttm_init(struct amdgpu_devic=
e *adev)<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; return r;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&gt;&nbsp;&nbsp; <br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp; /*<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; *The reserved vram for memory traini=
ng must be pinned to the specified<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; *place on the VRAM, so reserve it ea=
rly.<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp; r =3D amdgpu_ttm_training_reserve_vram_ini=
t(adev);<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp; if (r)<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return r;<br>
&gt;&gt; &#43;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* allocate memory as required=
 for VGA<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * This is used for VGA e=
mulation and pre-OS scanout buffers to<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * avoid display artifact=
s while transitioning between pre-OS<br>
&gt;&gt; @@ -1825,6 &#43;1920,7 @@ void amdgpu_ttm_fini(struct amdgpu_devic=
e *adev)<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; return;<br>
&gt;&gt;&nbsp;&nbsp; <br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ttm_debugfs_fini(adev);=
<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp; amdgpu_ttm_training_reserve_vram_fini(adev=
);<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ttm_fw_reserve_vram_fin=
i(adev);<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;mman.aper_base_ka=
ddr)<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; iounmap(adev-&gt;mman.aper_base_kaddr);<br>
&gt;&gt;<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_DM5PR12MB2535759A477900F96128CAC395900DM5PR12MB2535namp_--

--_004_DM5PR12MB2535759A477900F96128CAC395900DM5PR12MB2535namp_
Content-Type: text/x-patch;
	name="0001-drm-amdgpu-reserve-vram-for-memory-training-v4.patch"
Content-Description: 0001-drm-amdgpu-reserve-vram-for-memory-training-v4.patch
Content-Disposition: attachment;
	filename="0001-drm-amdgpu-reserve-vram-for-memory-training-v4.patch";
	size=3986; creation-date="Mon, 14 Oct 2019 08:34:25 GMT";
	modification-date="Mon, 14 Oct 2019 08:35:05 GMT"
Content-Transfer-Encoding: base64

RnJvbSA4OGI3YTA0ZjVjNmIwMmFjMzAwM2Y4YjIyYjBiMDRiYzdhOGUwOGVhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiAiVGlhbmNpLllpbiIgPHRpYW5jaS55aW5AYW1kLmNvbT4KRGF0
ZTogTW9uLCAzMCBTZXAgMjAxOSAxNDoyODoxNyArMDgwMApTdWJqZWN0OiBbUEFUQ0hdIGRybS9h
bWRncHU6IHJlc2VydmUgdnJhbSBmb3IgbWVtb3J5IHRyYWluaW5nKHY0KQoKbWVtb3J5IHRyYWlu
aW5nIHVzaW5nIHNwZWNpZmljIGZpeGVkIHZyYW0gc2VnbWVudCwgcmVzZXJ2ZSB0aGVzZQpzZWdt
ZW50cyBiZWZvcmUgYW55b25lIG1heSBhbGxvY2F0ZSBpdC4KCkNoYW5nZS1JZDogSTE0MzY3NTU4
MTNhNTY1NjA4YTI4NTdhNjgzZjUzNTM3NzYyMGE2MzcKUmV2aWV3ZWQtYnk6IEFsZXggRGV1Y2hl
ciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogVGlhbmNpLllpbiA8
dGlhbmNpLnlpbkBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV90dG0uYyB8IDkxICsrKysrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA5
MSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3R0bS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jCmlu
ZGV4IDJlODVhNTE1NGY4Ny4uNjllNTQzMDhmMDgwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3R0bS5jCkBAIC0xNjY3LDYgKzE2NjcsODggQEAgc3RhdGljIGludCBhbWRncHVf
dHRtX2Z3X3Jlc2VydmVfdnJhbV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCQkJ
CQkgICZhZGV2LT5md192cmFtX3VzYWdlLnZhKTsKIH0KIAorLyoKKyAqIE1lbW95IHRyYWluaW5n
IHJlc2VydmF0aW9uIGZ1bmN0aW9ucworICovCisKKy8qKgorICogYW1kZ3B1X3R0bV90cmFpbmlu
Z19yZXNlcnZlX3ZyYW1fZmluaSAtIGZyZWUgbWVtb3J5IHRyYWluaW5nIHJlc2VydmVkIHZyYW0K
KyAqCisgKiBAYWRldjogYW1kZ3B1X2RldmljZSBwb2ludGVyCisgKgorICogZnJlZSBtZW1vcnkg
dHJhaW5pbmcgcmVzZXJ2ZWQgdnJhbSBpZiBpdCBoYXMgYmVlbiByZXNlcnZlZC4KKyAqLworc3Rh
dGljIGludCBhbWRncHVfdHRtX3RyYWluaW5nX3Jlc2VydmVfdnJhbV9maW5pKHN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2KQoreworCXN0cnVjdCBwc3BfbWVtb3J5X3RyYWluaW5nX2NvbnRleHQg
KmN0eCA9ICZhZGV2LT5wc3AubWVtX3RyYWluX2N0eDsKKworCWN0eC0+aW5pdCA9IFBTUF9NRU1f
VFJBSU5fTk9UX1NVUFBPUlQ7CisJYW1kZ3B1X2JvX2ZyZWVfa2VybmVsKCZjdHgtPmMycF9ibywg
TlVMTCwgTlVMTCk7CisJY3R4LT5jMnBfYm8gPSBOVUxMOworCisJYW1kZ3B1X2JvX2ZyZWVfa2Vy
bmVsKCZjdHgtPnAyY19ibywgTlVMTCwgTlVMTCk7CisJY3R4LT5wMmNfYm8gPSBOVUxMOworCisJ
cmV0dXJuIDA7Cit9CisKKy8qKgorICogYW1kZ3B1X3R0bV90cmFpbmluZ19yZXNlcnZlX3ZyYW1f
aW5pdCAtIGNyZWF0ZSBibyB2cmFtIHJlc2VydmF0aW9uIGZyb20gbWVtb3J5IHRyYWluaW5nCisg
KgorICogQGFkZXY6IGFtZGdwdV9kZXZpY2UgcG9pbnRlcgorICoKKyAqIGNyZWF0ZSBibyB2cmFt
IHJlc2VydmF0aW9uIGZyb20gbWVtb3J5IHRyYWluaW5nLgorICovCitzdGF0aWMgaW50IGFtZGdw
dV90dG1fdHJhaW5pbmdfcmVzZXJ2ZV92cmFtX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYpCit7CisJaW50IHJldDsKKwlzdHJ1Y3QgcHNwX21lbW9yeV90cmFpbmluZ19jb250ZXh0ICpj
dHggPSAmYWRldi0+cHNwLm1lbV90cmFpbl9jdHg7CisKKwltZW1zZXQoY3R4LCAwLCBzaXplb2Yo
KmN0eCkpOworCWlmICghYWRldi0+ZndfdnJhbV91c2FnZS5tZW1fdHJhaW5fc3VwcG9ydCkgewor
CQlEUk1fREVCVUcoIm1lbW9yeSB0cmFpbmluZyBkb2VzIG5vdCBzdXBwb3J0IVxuIik7CisJCXJl
dHVybiAwOworCX0KKworCWN0eC0+YzJwX3RyYWluX2RhdGFfb2Zmc2V0ID0gYWRldi0+ZndfdnJh
bV91c2FnZS5tZW1fdHJhaW5fZmJfbG9jOworCWN0eC0+cDJjX3RyYWluX2RhdGFfb2Zmc2V0ID0g
KGFkZXYtPmdtYy5tY192cmFtX3NpemUgLSBHRERSNl9NRU1fVFJBSU5JTkdfT0ZGU0VUKTsKKwlj
dHgtPnRyYWluX2RhdGFfc2l6ZSA9IEdERFI2X01FTV9UUkFJTklOR19EQVRBX1NJWkVfSU5fQllU
RVM7CisKKwlEUk1fREVCVUcoInRyYWluX2RhdGFfc2l6ZTolbGx4LHAyY190cmFpbl9kYXRhX29m
ZnNldDolbGx4LGMycF90cmFpbl9kYXRhX29mZnNldDolbGx4LlxuIiwKKwkJICBjdHgtPnRyYWlu
X2RhdGFfc2l6ZSwKKwkJICBjdHgtPnAyY190cmFpbl9kYXRhX29mZnNldCwKKwkJICBjdHgtPmMy
cF90cmFpbl9kYXRhX29mZnNldCk7CisKKwlyZXQgPSBhbWRncHVfYm9fY3JlYXRlX2tlcm5lbF9h
dChhZGV2LAorCQkJCQkgY3R4LT5wMmNfdHJhaW5fZGF0YV9vZmZzZXQsCisJCQkJCSBjdHgtPnRy
YWluX2RhdGFfc2l6ZSwKKwkJCQkJIEFNREdQVV9HRU1fRE9NQUlOX1ZSQU0sCisJCQkJCSAmY3R4
LT5wMmNfYm8sCisJCQkJCSBOVUxMKTsKKwlpZiAocmV0KSB7CisJCURSTV9FUlJPUigiYWxsb2Mg
cDJjX2JvIGZhaWxlZCglZCkhXG4iLCByZXQpOworCQlnb3RvIEVycl9vdXQ7CisJfQorCisJcmV0
ID0gYW1kZ3B1X2JvX2NyZWF0ZV9rZXJuZWxfYXQoYWRldiwKKwkJCQkJIGN0eC0+YzJwX3RyYWlu
X2RhdGFfb2Zmc2V0LAorCQkJCQkgY3R4LT50cmFpbl9kYXRhX3NpemUsCisJCQkJCSBBTURHUFVf
R0VNX0RPTUFJTl9WUkFNLAorCQkJCQkgJmN0eC0+YzJwX2JvLAorCQkJCQkgTlVMTCk7CisJaWYg
KHJldCkgeworCQlEUk1fRVJST1IoImFsbG9jIGMycF9ibyBmYWlsZWQoJWQpIVxuIiwgcmV0KTsK
KwkJZ290byBFcnJfb3V0OworCX0KKworCWN0eC0+aW5pdCA9IFBTUF9NRU1fVFJBSU5fUkVTRVJW
RV9TVUNDRVNTOworCXJldHVybiAwOworCitFcnJfb3V0OgorCWFtZGdwdV90dG1fdHJhaW5pbmdf
cmVzZXJ2ZV92cmFtX2ZpbmkoYWRldik7CisJcmV0dXJuIHJldDsKK30KKwogLyoqCiAgKiBhbWRn
cHVfdHRtX2luaXQgLSBJbml0IHRoZSBtZW1vcnkgbWFuYWdlbWVudCAodHRtKSBhcyB3ZWxsIGFz
IHZhcmlvdXMKICAqIGd0dC92cmFtIHJlbGF0ZWQgZmllbGRzLgpAQCAtMTc0MCw2ICsxODIyLDE0
IEBAIGludCBhbWRncHVfdHRtX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJCXJl
dHVybiByOwogCX0KIAorCS8qCisJICpUaGUgcmVzZXJ2ZWQgdnJhbSBmb3IgbWVtb3J5IHRyYWlu
aW5nIG11c3QgYmUgcGlubmVkIHRvIHRoZSBzcGVjaWZpZWQKKwkgKnBsYWNlIG9uIHRoZSBWUkFN
LCBzbyByZXNlcnZlIGl0IGVhcmx5LgorCSAqLworCXIgPSBhbWRncHVfdHRtX3RyYWluaW5nX3Jl
c2VydmVfdnJhbV9pbml0KGFkZXYpOworCWlmIChyKQorCQlyZXR1cm4gcjsKKwogCS8qIGFsbG9j
YXRlIG1lbW9yeSBhcyByZXF1aXJlZCBmb3IgVkdBCiAJICogVGhpcyBpcyB1c2VkIGZvciBWR0Eg
ZW11bGF0aW9uIGFuZCBwcmUtT1Mgc2Nhbm91dCBidWZmZXJzIHRvCiAJICogYXZvaWQgZGlzcGxh
eSBhcnRpZmFjdHMgd2hpbGUgdHJhbnNpdGlvbmluZyBiZXR3ZWVuIHByZS1PUwpAQCAtMTg0Miw2
ICsxOTMyLDcgQEAgdm9pZCBhbWRncHVfdHRtX2Zpbmkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYpCiAJCXJldHVybjsKIAogCWFtZGdwdV90dG1fZGVidWdmc19maW5pKGFkZXYpOworCWFtZGdw
dV90dG1fdHJhaW5pbmdfcmVzZXJ2ZV92cmFtX2ZpbmkoYWRldik7CiAJYW1kZ3B1X3R0bV9md19y
ZXNlcnZlX3ZyYW1fZmluaShhZGV2KTsKIAlpZiAoYWRldi0+bW1hbi5hcGVyX2Jhc2Vfa2FkZHIp
CiAJCWlvdW5tYXAoYWRldi0+bW1hbi5hcGVyX2Jhc2Vfa2FkZHIpOwotLSAKMi4xNy4xCgo=

--_004_DM5PR12MB2535759A477900F96128CAC395900DM5PR12MB2535namp_
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--_004_DM5PR12MB2535759A477900F96128CAC395900DM5PR12MB2535namp_--
