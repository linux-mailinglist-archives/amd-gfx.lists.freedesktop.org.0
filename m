Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62517388EA5
	for <lists+amd-gfx@lfdr.de>; Wed, 19 May 2021 15:09:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AB116E1DE;
	Wed, 19 May 2021 13:09:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2055.outbound.protection.outlook.com [40.107.237.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 186866E1DE
 for <amd-gfx@lists.freedesktop.org>; Wed, 19 May 2021 13:09:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fg5lhKOB6jNuSJDqVQwFO0+A7Lha9EwDAi8SYK5dUKLXO1LkvIrkeBXkOruJ2cNYUIMCRQg22gXx2af1mZckfVWTcaGUK84+R3Yi3K2eQLbnBRE0PTreXLMhTU0DvwA8Xyaf59DIsNhs67X4wzoBBtGd8V3LqqDZtRuWolM4Xh7u8QVOmqzrWZNE06xCwbPiL3wSFTYV6Q+XBTXe8hyL2fPHuS8dWcNuTMjm7ZnQ3Sq/Qc8zHJ9WLSRk/r38oJquB337FXYoKoMj2uDP1ZCOSbKxfiSKZywpTlWQok+Pro7PuazvpKf3b4gnlqwgode9ygA923szklLuwNeCmk+eng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dYD78I+KZJctZCiGnEwZ6jsET+gyJfGWSxq8VQORflw=;
 b=dzsAYAHZ2e9u5L5Ebt51Y10nySsvkUVaQTY8M7OHa5vMl/uB0LkH6Bk6+GgT72DyqjlW7tzVmUaN59thM6l6hkB2aRZosaZ5AD9WkDalchO6xqC91OTrYNyJOybXU2cA2Ddl8hkaP+LqQN9XT7gWJddSWQ5QkpQjO3t2hQpJc1zxeEDUDQQCsD0L+86aZZCo29O3+2z3E2qviSS56B2oiPh5L3CXK5/nQ3JtkkIIw745B54h6ZDyauWl2KpJmMo/fjQcTSSgrzefPP2lI5P49uik5ulezvBenRQy+I2t1BQuQGodag3v1tCIh3Oci0CPu/9nR4uWvtWSGpt23D1oBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dYD78I+KZJctZCiGnEwZ6jsET+gyJfGWSxq8VQORflw=;
 b=zAYeOHEGDoRRM00ylfhL6LKRMLaxvwxNYPgrE8ESJa2cqWK5kgdlxJzOoUOwoeqpjy7rqMdpLizJjTf0B15byWEXKBfWkzVBokRW1eA/qTABkkdo7q4kmISN/r3s8NyXRZe0PT/HkFC2s4UOIBQeK0Hpev2m/M74/guXcXhwwHs=
Received: from MN2PR12MB4488.namprd12.prod.outlook.com (2603:10b6:208:24e::19)
 by MN2PR12MB4846.namprd12.prod.outlook.com (2603:10b6:208:186::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Wed, 19 May
 2021 13:09:45 +0000
Received: from MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::3d98:cefb:476c:c36e]) by MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::3d98:cefb:476c:c36e%8]) with mapi id 15.20.4129.033; Wed, 19 May 2021
 13:09:45 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Gu, JiaWei (Will)" <JiaWei.Gu@amd.com>, "Nieto, David M"
 <David.Nieto@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "maraeo@gmail.com" <maraeo@gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Add vbios info ioctl interface
Thread-Topic: [PATCH] drm/amdgpu: Add vbios info ioctl interface
Thread-Index: AQHXSxVPkGLgCjZpIk+4y6A6w0ki7qrnlu0AgAACYYCAAObDgIAACUCAgAAGfwCAABndAIAAFbuAgAIKghY=
Date: Wed, 19 May 2021 13:09:45 +0000
Message-ID: <MN2PR12MB4488EAC16AE52CD7160D53F5F72B9@MN2PR12MB4488.namprd12.prod.outlook.com>
References: <20210517120804.27052-1-Jiawei.Gu@amd.com>
 <CH0PR12MB5156D238E265426E504B791BF82D9@CH0PR12MB5156.namprd12.prod.outlook.com>
 <51161d6d-a6be-90f0-262d-5215402e25dd@amd.com>,
 <CH0PR12MB515644C1FF56458EFCA4B0FBF82C9@CH0PR12MB5156.namprd12.prod.outlook.com>
 <BYAPR12MB2840E231B64B432D709A3B59F42C9@BYAPR12MB2840.namprd12.prod.outlook.com>,
 <CH0PR12MB515657CAB5F1DF60A7E689C5F82C9@CH0PR12MB5156.namprd12.prod.outlook.com>
 <BYAPR12MB284005A19E99B1D7AC43ABE5F42C9@BYAPR12MB2840.namprd12.prod.outlook.com>,
 <CH0PR12MB515686179ED43BB5CF71AC4AF82C9@CH0PR12MB5156.namprd12.prod.outlook.com>
In-Reply-To: <CH0PR12MB515686179ED43BB5CF71AC4AF82C9@CH0PR12MB5156.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=True;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2021-05-19T13:09:44.822Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Standard; 
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [204.111.139.213]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a86206fc-d8fe-4f36-77d1-08d91ac75fa4
x-ms-traffictypediagnostic: MN2PR12MB4846:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB4846B6621ED8C0F8C2E04836F72B9@MN2PR12MB4846.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FsHNm7wtStezuMiW+8LM28l4azPG0bs7hr2suC5SjTkFQ6cgME51C/qu0XPyyIDzFCCFPztiRp0IoVtGHYl3DtGw/UZaztNukGAyhITCKj7SY9TeRxhHOZ6aysf+FHhlzZpmj8r9ziyHaNNuHxcWhbPdT8jc6C1wp71SOHN3OE66jnbqwcljQF+XSt/2V6sY6Q9w7D8tj/3bogkMnGZ3vfbbLEdPBTz8gHF2ZPRpxswwu+PW1WLYI274zSGmUwivRZAj+lEkNFcDl9d4GSjc0s6bsmcMGrK/S8A9EZxD5OpJwqoyTkOLxOtARdwJsljk+lByBr+jTQuuWJ7/rAxlGo6TCqXWxFPDvPenOsd35r1+Ziu3rI3QCn9GjjAs6+YTBZvmAWPZlSQOExvT08QT4bMnzs8jOUhcdddnPPQj5u1MWnZfyRT2ORAie0ivohrkgyg/ZiA3k2c79l+wmoNejMaJIFjs8CN8woeJjwR7iBvR7EZ9F/RkgS7+ViUGpQTvFPrLZQDEZqYqj6hw/d0daDu2XaPvZL9+ynKDBz8P1uWwAnLT6zSRP2TXwoWMGQaRKr7D8ybM9Y44KrRSGPzvVH8dYr3bQ4gq0xBWy7f34RM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4488.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(366004)(396003)(376002)(346002)(19627405001)(66556008)(66446008)(71200400001)(66476007)(478600001)(66946007)(76116006)(33656002)(9686003)(38100700002)(4326008)(86362001)(8676002)(122000001)(55016002)(64756008)(186003)(8936002)(7696005)(2906002)(53546011)(66574015)(83380400001)(6506007)(5660300002)(52536014)(19627235002)(26005)(30864003)(316002)(110136005)(579004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?Windows-1252?Q?jzWur0lCfOiMi+ZSCCxE7SiIjr1L5+BvN/M8l7ZCYVCOFwwEbS3afSZO?=
 =?Windows-1252?Q?SfvSrCtnmou6GBpv0j/yG9zkrgcGyYUx+ZmiWabj3pbLrrGJVBhrZsSb?=
 =?Windows-1252?Q?qDeigxWqL0nMcvrSvINWEHXWLl2nxEPLfNOOC8Q5MzG0vFZ2Nitp2cXb?=
 =?Windows-1252?Q?vaZe55CzQiKitsK3Z1h7E9D+fGgNNHi6z3MjSUD+LIokOeakR2aqVB9x?=
 =?Windows-1252?Q?7zyEn6bd210wGtuHSZ64ifWs7yFvYBVTva0aajYVNE+UZ8z/y6pFRUEB?=
 =?Windows-1252?Q?N94v3DuNRea0qLlXwMF9tIdRb0MXEiQVd1ReMli9/VVMtadzg/AA6pbK?=
 =?Windows-1252?Q?fC3hMxwqDCDVChTKWS3HgduHowHSjkGpO2BgPm29A/9pvJgv2aW+CFS5?=
 =?Windows-1252?Q?QIY2glmKtWQoPi2D+FjR+YsbG/5W37nZZINNbjGo6o37o49C6cR7Bbx8?=
 =?Windows-1252?Q?wR3RyUowtXjgoCHcZp2s0yPUf9kwJ92kY074vcrGIzccNfRihxgIpZoz?=
 =?Windows-1252?Q?ngxsO4tr3wozJafi9WjK9AOVlGq/pKaeX7kZFxWvtFTHKEaNTnqp6ssf?=
 =?Windows-1252?Q?9GPshAHEdNqPom8m/gmCcd1MWMgylaSnKaCXG+MzE6l851ayHN6Y53VN?=
 =?Windows-1252?Q?WWObxuCaLWa7S3UgEPwaW2xO/Lik/KXjT0I66sigKA2ghjI27QBfIXYv?=
 =?Windows-1252?Q?6fJKkN5L0REsIycxPIOAHuVY4s9hZeOrohAjBYahHW9axxXQJLe7X375?=
 =?Windows-1252?Q?W/DjnwoCjL5hxgxQuJNo0ch2JLjqtL12dhvqA1ZEbGFhZYGkPwvU9cLt?=
 =?Windows-1252?Q?Rxy6UnEVQAaCi7m6SXJLy3uTES9N4eE3kKWwIjqsq82pkOPUA102OI1Z?=
 =?Windows-1252?Q?qiWi09DAis/hi8F0XVuTaghoWYXwaM1K81Y4uUR+S5CF5yIv710tEvzc?=
 =?Windows-1252?Q?h7vlgdAMsoLUqsXdk/UUyyisfPh4QMXrVMSnReiUqhh3WYSXEdCUJag2?=
 =?Windows-1252?Q?pAzHZULjcNc/xjzvOP8qdzSPchP1d2sabFwU5HR6wE5W7IHVsueX9sc3?=
 =?Windows-1252?Q?79OS/7a0bW5UfniilyAXNxI2eMq8VzrzQeUdzyHKbXvIy6IP5F1OOAT3?=
 =?Windows-1252?Q?1zNW/a2FegAyAIQlySX3LoomVQMfDKAuskRRC5w3d3UyOwZ9++Fnqqpp?=
 =?Windows-1252?Q?huCv8xJUDBS48r8z3G04VMhJA1ikSaGXb0tvqAZGPrfEtJjG/gbZsuGx?=
 =?Windows-1252?Q?1SWljWtyXLZr26eWUuAVVmUOQP7W2/Iu3AvjF6XQI17l1umIr2YtSseG?=
 =?Windows-1252?Q?YNTieZ9ntjVgmtgHJxP/ioaNxbGWXnAagv8ue7jdtyhGFdiZqgEXdZBa?=
 =?Windows-1252?Q?VmjwU5GWfi/va7sZ2BSQPfMdBLQxlfUHJXhOvQTTJ8EB4qJ/H81Mb9tj?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4488.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a86206fc-d8fe-4f36-77d1-08d91ac75fa4
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2021 13:09:45.3749 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: urdWjhCuYTiSaqDUuAa+mK9vI561PpywCpjlgHJgAAfJO9E/DodVTmyQ0lesBuj5u/umErpKIDKovLY3/zorJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4846
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
Cc: "Deng, Emily" <Emily.Deng@amd.com>
Content-Type: multipart/mixed; boundary="===============1114727364=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1114727364==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB4488EAC16AE52CD7160D53F5F72B9MN2PR12MB4488namp_"

--_000_MN2PR12MB4488EAC16AE52CD7160D53F5F72B9MN2PR12MB4488namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

[Public]

The structure is not 64 bit aligned.  I think you want something like:

> +struct drm_amdgpu_info_vbios {
> +     __u8 name[64];
> +     __u8 vbios_pn[64];
> +     __u32 version;
> +     __u32 pad;
> +     __u8 vbios_ver_str[32];
> +     __u8 date[32];
> +};
________________________________
From: Gu, JiaWei (Will) <JiaWei.Gu@amd.com>
Sent: Tuesday, May 18, 2021 1:58 AM
To: Nieto, David M <David.Nieto@amd.com>; Koenig, Christian <Christian.Koen=
ig@amd.com>; amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>;=
 maraeo@gmail.com <maraeo@gmail.com>; Deucher, Alexander <Alexander.Deucher=
@amd.com>
Cc: Deng, Emily <Emily.Deng@amd.com>
Subject: RE: [PATCH] drm/amdgpu: Add vbios info ioctl interface


[Public]


Hi all,



Then the struct looks like:



> +struct drm_amdgpu_info_vbios {
> +     __u8 name[64];
> +     __u8 vbios_pn[64];
> +     __u32 version;
> +     __u8 vbios_ver_str[32];
> +     __u8 date[32];
> +};



Sample output:



vbios name : NAVI12 A0 XT D30501 8GB EVAL 1150e/334m HYN/SAM
vbios pn : 113-D3050100-104
vbios version : 285409288
vbios ver_str : 017.003.000.008.016956
vbios date : 2021/05/03 23:32


Please help double confirm that we=92re all fine with it and there=92s no n=
eed to add & remove anything.



Best regards,

Jiawei



From: Nieto, David M <David.Nieto@amd.com>
Sent: Tuesday, May 18, 2021 12:40 PM
To: Gu, JiaWei (Will) <JiaWei.Gu@amd.com>; Koenig, Christian <Christian.Koe=
nig@amd.com>; amd-gfx@lists.freedesktop.org; maraeo@gmail.com; Deucher, Ale=
xander <Alexander.Deucher@amd.com>
Cc: Deng, Emily <Emily.Deng@amd.com>
Subject: Re: [PATCH] drm/amdgpu: Add vbios info ioctl interface



[Public]



Yes, let's remove that too,



Thanks,



David

________________________________

From: Gu, JiaWei (Will) <JiaWei.Gu@amd.com<mailto:JiaWei.Gu@amd.com>>
Sent: Monday, May 17, 2021 8:07 PM
To: Nieto, David M <David.Nieto@amd.com<mailto:David.Nieto@amd.com>>; Koeni=
g, Christian <Christian.Koenig@amd.com<mailto:Christian.Koenig@amd.com>>; a=
md-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org> <amd-gfx=
@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>>; maraeo@gmail=
.com<mailto:maraeo@gmail.com> <maraeo@gmail.com<mailto:maraeo@gmail.com>>; =
Deucher, Alexander <Alexander.Deucher@amd.com<mailto:Alexander.Deucher@amd.=
com>>
Cc: Deng, Emily <Emily.Deng@amd.com<mailto:Emily.Deng@amd.com>>
Subject: RE: [PATCH] drm/amdgpu: Add vbios info ioctl interface



[AMD Official Use Only - Internal Distribution Only]



OK let=92s remove serial.



dbdf comes from this:

vbios_info.dbdf =3D PCI_DEVID(adev->pdev->bus->number, adev->pdev->devfn);



I think we can remove dbdf as well.



Best regards,

Jiawei



From: Nieto, David M <David.Nieto@amd.com<mailto:David.Nieto@amd.com>>
Sent: Tuesday, May 18, 2021 10:45 AM
To: Gu, JiaWei (Will) <JiaWei.Gu@amd.com<mailto:JiaWei.Gu@amd.com>>; Koenig=
, Christian <Christian.Koenig@amd.com<mailto:Christian.Koenig@amd.com>>; am=
d-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>; maraeo@g=
mail.com<mailto:maraeo@gmail.com>; Deucher, Alexander <Alexander.Deucher@am=
d.com<mailto:Alexander.Deucher@amd.com>>
Cc: Deng, Emily <Emily.Deng@amd.com<mailto:Emily.Deng@amd.com>>
Subject: Re: [PATCH] drm/amdgpu: Add vbios info ioctl interface



[AMD Official Use Only - Internal Distribution Only]



The serial number is ASIC information, not VBIOS information, and it is sti=
ll available as a sysfs node... I don't think we should put it there.



Not sure what dbdf stands for.

________________________________

From: Gu, JiaWei (Will) <JiaWei.Gu@amd.com<mailto:JiaWei.Gu@amd.com>>
Sent: Monday, May 17, 2021 7:11 PM
To: Koenig, Christian <Christian.Koenig@amd.com<mailto:Christian.Koenig@amd=
.com>>; amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>=
 <amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>>; Nie=
to, David M <David.Nieto@amd.com<mailto:David.Nieto@amd.com>>; maraeo@gmail=
.com<mailto:maraeo@gmail.com> <maraeo@gmail.com<mailto:maraeo@gmail.com>>; =
Deucher, Alexander <Alexander.Deucher@amd.com<mailto:Alexander.Deucher@amd.=
com>>
Cc: Deng, Emily <Emily.Deng@amd.com<mailto:Emily.Deng@amd.com>>
Subject: RE: [PATCH] drm/amdgpu: Add vbios info ioctl interface



[AMD Official Use Only - Internal Distribution Only]

So I guess the dbdf is also needed to be removed?
And how about serial?

> +struct drm_amdgpu_info_vbios {
> +     __u8 name[64];
> +     __u32 dbdf; // do we need this?
> +     __u8 vbios_pn[64];
> +     __u32 version;
> +     __u8 vbios_ver_str[32];
> +     __u8 date[32];
> +     __u64 serial; // do we need this?
> +};

Best regards,
Jiawei

-----Original Message-----
From: Koenig, Christian <Christian.Koenig@amd.com<mailto:Christian.Koenig@a=
md.com>>
Sent: Monday, May 17, 2021 8:26 PM
To: Gu, JiaWei (Will) <JiaWei.Gu@amd.com<mailto:JiaWei.Gu@amd.com>>; amd-gf=
x@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>; Nieto, David=
 M <David.Nieto@amd.com<mailto:David.Nieto@amd.com>>; maraeo@gmail.com<mail=
to:maraeo@gmail.com>; Deucher, Alexander <Alexander.Deucher@amd.com<mailto:=
Alexander.Deucher@amd.com>>
Cc: Deng, Emily <Emily.Deng@amd.com<mailto:Emily.Deng@amd.com>>
Subject: Re: [PATCH] drm/amdgpu: Add vbios info ioctl interface

I'm not very familiar with the technical background why we have the fields =
here once more.

But of hand we should at least remove everything which is also available fr=
om the PCI information.

E.g. dev_id, rev_id, sub_dev_id, sub_ved_id.

Regards,
Christian.

Am 17.05.21 um 14:17 schrieb Gu, JiaWei (Will):
> [AMD Official Use Only - Internal Distribution Only]
>
> Hi all,
>
> Thanks Christian's suggestion.
> I reverted the previous patches and squash them into this single one.
>
> As this patch shows, the current uapi change looks like this:
>
> +struct drm_amdgpu_info_vbios {
> +     __u8 name[64];
> +     __u32 dbdf;
> +     __u8 vbios_pn[64];
> +     __u32 version;
> +     __u8 vbios_ver_str[32];
> +     __u8 date[32];
> +     __u64 serial;
> +     __u32 dev_id;
> +     __u32 rev_id;
> +     __u32 sub_dev_id;
> +     __u32 sub_ved_id;
> +};
>
> As we know there's some redundant info in this struct.
> Please feel free to give any comments or suggestion about what it should =
& shouldn't include.
>
> Best regards,
> Jiawei
>
> -----Original Message-----
> From: Jiawei Gu <Jiawei.Gu@amd.com<mailto:Jiawei.Gu@amd.com>>
> Sent: Monday, May 17, 2021 8:08 PM
> To: amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>; =
Koenig, Christian
> <Christian.Koenig@amd.com<mailto:Christian.Koenig@amd.com>>; Nieto, David=
 M <David.Nieto@amd.com<mailto:David.Nieto@amd.com>>;
> maraeo@gmail.com<mailto:maraeo@gmail.com>; Deucher, Alexander <Alexander.=
Deucher@amd.com<mailto:Alexander.Deucher@amd.com>>
> Cc: Deng, Emily <Emily.Deng@amd.com<mailto:Emily.Deng@amd.com>>; Gu, JiaW=
ei (Will)
> <JiaWei.Gu@amd.com<mailto:JiaWei.Gu@amd.com>>
> Subject: [PATCH] drm/amdgpu: Add vbios info ioctl interface
>
> Add AMDGPU_INFO_VBIOS_INFO subquery id for detailed vbios info.
>
> Provides a way for the user application to get the VBIOS information with=
out having to parse the binary.
> It is useful for the user to be able to display in a simple way the VBIOS=
 version in their system if they happen to encounter an issue.
>
> V2:
> Use numeric serial.
> Parse and expose vbios version string.
>
> Signed-off-by: Jiawei Gu <Jiawei.Gu@amd.com<mailto:Jiawei.Gu@amd.com>>
> Acked-by: Christian K=F6nig <christian.koenig@amd.com<mailto:christian.ko=
enig@amd.com>>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c    |  21 +++
>   drivers/gpu/drm/amd/amdgpu/atom.c          | 174 +++++++++++++++++++++
>   drivers/gpu/drm/amd/amdgpu/atom.h          |  12 ++
>   drivers/gpu/drm/amd/include/atomfirmware.h |   5 +
>   include/uapi/drm/amdgpu_drm.h              |  16 ++
>   5 files changed, 228 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> index 8d12e474745a..30e4fed3de22 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> @@ -861,6 +861,27 @@ int amdgpu_info_ioctl(struct drm_device *dev, void *=
data, struct drm_file *filp)
>                                            min((size_t)size, (size_t)(bio=
s_size - bios_offset)))
>                                        ? -EFAULT : 0;
>                }
> +             case AMDGPU_INFO_VBIOS_INFO: {
> +                     struct drm_amdgpu_info_vbios vbios_info =3D {};
> +                     struct atom_context *atom_context;
> +
> +                     atom_context =3D adev->mode_info.atom_context;
> +                     memcpy(vbios_info.name, atom_context->name, sizeof(=
atom_context->name));
> +                     vbios_info.dbdf =3D PCI_DEVID(adev->pdev->bus->numb=
er, adev->pdev->devfn);
> +                     memcpy(vbios_info.vbios_pn, atom_context->vbios_pn,=
 sizeof(atom_context->vbios_pn));
> +                     vbios_info.version =3D atom_context->version;
> +                     memcpy(vbios_info.vbios_ver_str, atom_context->vbio=
s_ver_str,
> +                                             sizeof(atom_context->vbios_=
ver_str));
> +                     memcpy(vbios_info.date, atom_context->date, sizeof(=
atom_context->date));
> +                     vbios_info.serial =3D adev->unique_id;
> +                     vbios_info.dev_id =3D adev->pdev->device;
> +                     vbios_info.rev_id =3D adev->pdev->revision;
> +                     vbios_info.sub_dev_id =3D atom_context->sub_dev_id;
> +                     vbios_info.sub_ved_id =3D atom_context->sub_ved_id;
> +
> +                     return copy_to_user(out, &vbios_info,
> +                                             min((size_t)size, sizeof(vb=
ios_info))) ? -EFAULT : 0;
> +             }
>                default:
>                        DRM_DEBUG_KMS("Invalid request %d\n",
>                                        info->vbios_info.type);
> diff --git a/drivers/gpu/drm/amd/amdgpu/atom.c
> b/drivers/gpu/drm/amd/amdgpu/atom.c
> index 3dcb8b32f48b..542b2c2414e4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/atom.c
> +++ b/drivers/gpu/drm/amd/amdgpu/atom.c
> @@ -31,6 +31,7 @@
>
>   #define ATOM_DEBUG
>
> +#include "atomfirmware.h"
>   #include "atom.h"
>   #include "atom-names.h"
>   #include "atom-bits.h"
> @@ -1299,12 +1300,168 @@ static void atom_index_iio(struct atom_context *=
ctx, int base)
>        }
>   }
>
> +static void atom_get_vbios_name(struct atom_context *ctx) {
> +     unsigned char *p_rom;
> +     unsigned char str_num;
> +     unsigned short off_to_vbios_str;
> +     unsigned char *c_ptr;
> +     int name_size;
> +     int i;
> +
> +     const char *na =3D "--N/A--";
> +     char *back;
> +
> +     p_rom =3D ctx->bios;
> +
> +     str_num =3D *(p_rom + OFFSET_TO_GET_ATOMBIOS_NUMBER_OF_STRINGS);
> +     if (str_num !=3D 0) {
> +             off_to_vbios_str =3D
> +                     *(unsigned short *)(p_rom + OFFSET_TO_GET_ATOMBIOS_=
STRING_START);
> +
> +             c_ptr =3D (unsigned char *)(p_rom + off_to_vbios_str);
> +     } else {
> +             /* do not know where to find name */
> +             memcpy(ctx->name, na, 7);
> +             ctx->name[7] =3D 0;
> +             return;
> +     }
> +
> +     /*
> +      * skip the atombios strings, usually 4
> +      * 1st is P/N, 2nd is ASIC, 3rd is PCI type, 4th is Memory type
> +      */
> +     for (i =3D 0; i < str_num; i++) {
> +             while (*c_ptr !=3D 0)
> +                     c_ptr++;
> +             c_ptr++;
> +     }
> +
> +     /* skip the following 2 chars: 0x0D 0x0A */
> +     c_ptr +=3D 2;
> +
> +     name_size =3D strnlen(c_ptr, STRLEN_LONG - 1);
> +     memcpy(ctx->name, c_ptr, name_size);
> +     back =3D ctx->name + name_size;
> +     while ((*--back) =3D=3D ' ')
> +             ;
> +     *(back + 1) =3D '\0';
> +}
> +
> +static void atom_get_vbios_date(struct atom_context *ctx) {
> +     unsigned char *p_rom;
> +     unsigned char *date_in_rom;
> +
> +     p_rom =3D ctx->bios;
> +
> +     date_in_rom =3D p_rom + OFFSET_TO_VBIOS_DATE;
> +
> +     ctx->date[0] =3D '2';
> +     ctx->date[1] =3D '0';
> +     ctx->date[2] =3D date_in_rom[6];
> +     ctx->date[3] =3D date_in_rom[7];
> +     ctx->date[4] =3D '/';
> +     ctx->date[5] =3D date_in_rom[0];
> +     ctx->date[6] =3D date_in_rom[1];
> +     ctx->date[7] =3D '/';
> +     ctx->date[8] =3D date_in_rom[3];
> +     ctx->date[9] =3D date_in_rom[4];
> +     ctx->date[10] =3D ' ';
> +     ctx->date[11] =3D date_in_rom[9];
> +     ctx->date[12] =3D date_in_rom[10];
> +     ctx->date[13] =3D date_in_rom[11];
> +     ctx->date[14] =3D date_in_rom[12];
> +     ctx->date[15] =3D date_in_rom[13];
> +     ctx->date[16] =3D '\0';
> +}
> +
> +static unsigned char *atom_find_str_in_rom(struct atom_context *ctx, cha=
r *str, int start,
> +                                        int end, int maxlen)
> +{
> +     unsigned long str_off;
> +     unsigned char *p_rom;
> +     unsigned short str_len;
> +
> +     str_off =3D 0;
> +     str_len =3D strnlen(str, maxlen);
> +     p_rom =3D ctx->bios;
> +
> +     for (; start <=3D end; ++start) {
> +             for (str_off =3D 0; str_off < str_len; ++str_off) {
> +                     if (str[str_off] !=3D *(p_rom + start + str_off))
> +                             break;
> +             }
> +
> +             if (str_off =3D=3D str_len || str[str_off] =3D=3D 0)
> +                     return p_rom + start;
> +     }
> +     return NULL;
> +}
> +
> +static void atom_get_vbios_pn(struct atom_context *ctx) {
> +     unsigned char *p_rom;
> +     unsigned short off_to_vbios_str;
> +     unsigned char *vbios_str;
> +     int count;
> +
> +     off_to_vbios_str =3D 0;
> +     p_rom =3D ctx->bios;
> +
> +     if (*(p_rom + OFFSET_TO_GET_ATOMBIOS_NUMBER_OF_STRINGS) !=3D 0) {
> +             off_to_vbios_str =3D
> +                     *(unsigned short *)(p_rom + OFFSET_TO_GET_ATOMBIOS_=
STRING_START);
> +
> +             vbios_str =3D (unsigned char *)(p_rom + off_to_vbios_str);
> +     } else {
> +             vbios_str =3D p_rom + OFFSET_TO_VBIOS_PART_NUMBER;
> +     }
> +
> +     if (*vbios_str =3D=3D 0) {
> +             vbios_str =3D atom_find_str_in_rom(ctx, BIOS_ATOM_PREFIX, 3=
, 1024, 64);
> +             if (vbios_str =3D=3D NULL)
> +                     vbios_str +=3D sizeof(BIOS_ATOM_PREFIX) - 1;
> +     }
> +     if (vbios_str !=3D NULL && *vbios_str =3D=3D 0)
> +             vbios_str++;
> +
> +     if (vbios_str !=3D NULL) {
> +             count =3D 0;
> +             while ((count < BIOS_STRING_LENGTH) && vbios_str[count] >=
=3D ' ' &&
> +                    vbios_str[count] <=3D 'z') {
> +                     ctx->vbios_pn[count] =3D vbios_str[count];
> +                     count++;
> +             }
> +
> +             ctx->vbios_pn[count] =3D 0;
> +     }
> +}
> +
> +static void atom_get_vbios_version(struct atom_context *ctx) {
> +     unsigned char *vbios_ver;
> +
> +     /* find anchor ATOMBIOSBK-AMD */
> +     vbios_ver =3D atom_find_str_in_rom(ctx, BIOS_VERSION_PREFIX, 3, 102=
4, 64);
> +     if (vbios_ver !=3D NULL) {
> +             /* skip ATOMBIOSBK-AMD VER */
> +             vbios_ver +=3D 18;
> +             memcpy(ctx->vbios_ver_str, vbios_ver, STRLEN_NORMAL);
> +     } else {
> +             ctx->vbios_ver_str[0] =3D '\0';
> +     }
> +}
> +
>   struct atom_context *amdgpu_atom_parse(struct card_info *card, void *bi=
os)  {
>        int base;
>        struct atom_context *ctx =3D
>            kzalloc(sizeof(struct atom_context), GFP_KERNEL);
>        char *str;
> +     struct _ATOM_ROM_HEADER *atom_rom_header;
> +     struct _ATOM_MASTER_DATA_TABLE *master_table;
> +     struct _ATOM_FIRMWARE_INFO *atom_fw_info;
>        u16 idx;
>
>        if (!ctx)
> @@ -1353,6 +1510,23 @@ struct atom_context *amdgpu_atom_parse(struct card=
_info *card, void *bios)
>                strlcpy(ctx->vbios_version, str, sizeof(ctx->vbios_version=
));
>        }
>
> +     atom_rom_header =3D (struct _ATOM_ROM_HEADER *)CSTR(base);
> +     ctx->sub_dev_id =3D atom_rom_header->usSubsystemVendorID;
> +     ctx->sub_ved_id =3D atom_rom_header->usSubsystemID;
> +     if (atom_rom_header->usMasterDataTableOffset !=3D 0) {
> +             master_table =3D (struct _ATOM_MASTER_DATA_TABLE *)
> +                             CSTR(atom_rom_header->usMasterDataTableOffs=
et);
> +             if (master_table->ListOfDataTables.FirmwareInfo !=3D 0) {
> +                     atom_fw_info =3D (struct _ATOM_FIRMWARE_INFO *)
> +                                     CSTR(master_table->ListOfDataTables=
.FirmwareInfo);
> +                     ctx->version =3D atom_fw_info->ulFirmwareRevision;
> +             }
> +     }
> +
> +     atom_get_vbios_name(ctx);
> +     atom_get_vbios_pn(ctx);
> +     atom_get_vbios_date(ctx);
> +     atom_get_vbios_version(ctx);
>
>        return ctx;
>   }
> diff --git a/drivers/gpu/drm/amd/amdgpu/atom.h
> b/drivers/gpu/drm/amd/amdgpu/atom.h
> index d279759cab47..6463ce6e756d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/atom.h
> +++ b/drivers/gpu/drm/amd/amdgpu/atom.h
> @@ -112,6 +112,10 @@ struct drm_device;
>   #define ATOM_IO_SYSIO               2
>   #define ATOM_IO_IIO         0x80
>
> +#define STRLEN_NORMAL                32
> +#define STRLEN_LONG          64
> +#define STRLEN_VERYLONG              254
> +
>   struct card_info {
>        struct drm_device *dev;
>        void (* reg_write)(struct card_info *, uint32_t, uint32_t);   /*  =
filled by driver */
> @@ -140,6 +144,14 @@ struct atom_context {
>        uint32_t *scratch;
>        int scratch_size_bytes;
>        char vbios_version[20];
> +
> +     uint8_t name[STRLEN_LONG];
> +     uint8_t vbios_pn[STRLEN_LONG];
> +     uint32_t version;
> +     uint8_t vbios_ver_str[STRLEN_NORMAL];
> +     uint8_t date[STRLEN_NORMAL];
> +     uint32_t sub_dev_id;
> +     uint32_t sub_ved_id;
>   };
>
>   extern int amdgpu_atom_debug;
> diff --git a/drivers/gpu/drm/amd/include/atomfirmware.h
> b/drivers/gpu/drm/amd/include/atomfirmware.h
> index 275468e4be60..28deecc2f990 100644
> --- a/drivers/gpu/drm/amd/include/atomfirmware.h
> +++ b/drivers/gpu/drm/amd/include/atomfirmware.h
> @@ -197,6 +197,9 @@ enum atom_dp_vs_preemph_def{
>     DP_VS_LEVEL0_PREEMPH_LEVEL3 =3D 0x18,
>   };
>
> +#define BIOS_ATOM_PREFIX   "ATOMBIOS"
> +#define BIOS_VERSION_PREFIX  "ATOMBIOSBK-AMD"
> +#define BIOS_STRING_LENGTH 43
>
>   /*
>   enum atom_string_def{
> @@ -215,6 +218,8 @@ enum atombios_image_offset{
>     MAXSIZE_OF_ATOMBIOS_ASIC_BUS_MEM_TYPE      =3D 20,  /*including the t=
erminator 0x0!*/
>     OFFSET_TO_GET_ATOMBIOS_NUMBER_OF_STRINGS   =3D 0x2f,
>     OFFSET_TO_GET_ATOMBIOS_STRING_START        =3D 0x6e,
> +  OFFSET_TO_VBIOS_PART_NUMBER                =3D 0x80,
> +  OFFSET_TO_VBIOS_DATE                       =3D 0x50,
>   };
>
>
> /*********************************************************************
> ******* diff --git a/include/uapi/drm/amdgpu_drm.h
> b/include/uapi/drm/amdgpu_drm.h index 9169df7fadee..e0f98ca9a755
> 100644
> --- a/include/uapi/drm/amdgpu_drm.h
> +++ b/include/uapi/drm/amdgpu_drm.h
> @@ -756,6 +756,8 @@ struct drm_amdgpu_cs_chunk_data {
>        #define AMDGPU_INFO_VBIOS_SIZE          0x1
>        /* Subquery id: Query vbios image */
>        #define AMDGPU_INFO_VBIOS_IMAGE         0x2
> +     /* Subquery id: Query vbios info */
> +     #define AMDGPU_INFO_VBIOS_INFO          0x3
>   /* Query UVD handles */
>   #define AMDGPU_INFO_NUM_HANDLES                     0x1C
>   /* Query sensor related information */ @@ -949,6 +951,20 @@ struct
> drm_amdgpu_info_firmware {
>        __u32 feature;
>   };
>
> +struct drm_amdgpu_info_vbios {
> +     __u8 name[64];
> +     __u32 dbdf;
> +     __u8 vbios_pn[64];
> +     __u32 version;
> +     __u8 vbios_ver_str[32];
> +     __u8 date[32];
> +     __u64 serial;
> +     __u32 dev_id;
> +     __u32 rev_id;
> +     __u32 sub_dev_id;
> +     __u32 sub_ved_id;
> +};
> +
>   #define AMDGPU_VRAM_TYPE_UNKNOWN 0
>   #define AMDGPU_VRAM_TYPE_GDDR1 1
>   #define AMDGPU_VRAM_TYPE_DDR2  2
> --
> 2.17.1

--_000_MN2PR12MB4488EAC16AE52CD7160D53F5F72B9MN2PR12MB4488namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
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
: 12pt; color: rgb(0, 0, 0);">
The structure is not 64 bit aligned.&nbsp; I think you want something like:=
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
&gt; +struct drm_amdgpu_info_vbios {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; __u8 name[64];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; __u8 vbios_pn[64];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; __u32 version;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; __u32 pad;<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; __u8 vbios_ver_str[32];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; __u8 date[32];<br>
&gt; +};<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Gu, JiaWei (Will) &lt=
;JiaWei.Gu@amd.com&gt;<br>
<b>Sent:</b> Tuesday, May 18, 2021 1:58 AM<br>
<b>To:</b> Nieto, David M &lt;David.Nieto@amd.com&gt;; Koenig, Christian &l=
t;Christian.Koenig@amd.com&gt;; amd-gfx@lists.freedesktop.org &lt;amd-gfx@l=
ists.freedesktop.org&gt;; maraeo@gmail.com &lt;maraeo@gmail.com&gt;; Deuche=
r, Alexander &lt;Alexander.Deucher@amd.com&gt;<br>
<b>Cc:</b> Deng, Emily &lt;Emily.Deng@amd.com&gt;<br>
<b>Subject:</b> RE: [PATCH] drm/amdgpu: Add vbios info ioctl interface</fon=
t>
<div>&nbsp;</div>
</div>
<style>
<!--
@font-face
	{font-family:"Cambria Math"}
@font-face
	{font-family:DengXian}
@font-face
	{font-family:Calibri}
@font-face
	{}
@font-face
	{font-family:"Segoe UI"}
p.x_MsoNormal, li.x_MsoNormal, div.x_MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif}
a:link, span.x_MsoHyperlink
	{color:#0563C1;
	text-decoration:underline}
p.x_xmsonormal, li.x_xmsonormal, div.x_xmsonormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif}
p.x_xmsipheader4d111418, li.x_xmsipheader4d111418, div.x_xmsipheader4d11141=
8
	{margin-right:0in;
	margin-left:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif}
span.x_EmailStyle25
	{font-family:"Calibri",sans-serif;
	color:windowtext}
.x_MsoChpDefault
	{font-size:10.0pt}
@page WordSection1
	{margin:1.0in 1.0in 1.0in 1.0in}
div.x_WordSection1
	{}
-->
</style>
<div lang=3D"EN-US" link=3D"#0563C1" vlink=3D"purple" style=3D"word-wrap:br=
eak-word">
<p align=3D"Left" style=3D"font-family:Arial; font-size:10pt; color:#008000=
; margin:15pt">
[Public]<br>
</p>
<br>
<div>
<div class=3D"x_WordSection1">
<p class=3D"x_MsoNormal">Hi all,</p>
<p class=3D"x_MsoNormal">&nbsp;</p>
<p class=3D"x_MsoNormal">Then the struct looks like:</p>
<p class=3D"x_MsoNormal">&nbsp;</p>
<p class=3D"x_MsoNormal">&gt; +struct drm_amdgpu_info_vbios {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; __u8 name[64];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; __u8 vbios_pn[64];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; __u32 version;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; __u8 vbios_ver_str[32];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; __u8 date[32];<br>
&gt; +};</p>
<p class=3D"x_MsoNormal">&nbsp;</p>
<p class=3D"x_MsoNormal">Sample output:</p>
<p class=3D"x_MsoNormal">&nbsp;</p>
<p class=3D"x_MsoNormal"><span style=3D"font-size:10.5pt; font-family:&quot=
;Segoe UI&quot;,sans-serif">vbios name : NAVI12 A0 XT D30501 8GB EVAL 1150e=
/334m HYN/SAM<br>
vbios pn : 113-D3050100-104<br>
vbios version : 285409288<br>
vbios ver_str : 017.003.000.008.016956<br>
vbios date : 2021/05/03 23:32<br>
<br>
</span></p>
<p class=3D"x_MsoNormal">Please help double confirm that we=92re all fine w=
ith it and there=92s no need to add &amp; remove anything.</p>
<p class=3D"x_MsoNormal">&nbsp;</p>
<p class=3D"x_MsoNormal">Best regards,</p>
<p class=3D"x_MsoNormal">Jiawei</p>
<p class=3D"x_MsoNormal">&nbsp;</p>
<div>
<div style=3D"border:none; border-top:solid #E1E1E1 1.0pt; padding:3.0pt 0i=
n 0in 0in">
<p class=3D"x_MsoNormal"><b>From:</b> Nieto, David M &lt;David.Nieto@amd.co=
m&gt; <br>
<b>Sent:</b> Tuesday, May 18, 2021 12:40 PM<br>
<b>To:</b> Gu, JiaWei (Will) &lt;JiaWei.Gu@amd.com&gt;; Koenig, Christian &=
lt;Christian.Koenig@amd.com&gt;; amd-gfx@lists.freedesktop.org; maraeo@gmai=
l.com; Deucher, Alexander &lt;Alexander.Deucher@amd.com&gt;<br>
<b>Cc:</b> Deng, Emily &lt;Emily.Deng@amd.com&gt;<br>
<b>Subject:</b> Re: [PATCH] drm/amdgpu: Add vbios info ioctl interface</p>
</div>
</div>
<p class=3D"x_MsoNormal">&nbsp;</p>
<p style=3D"margin:15.0pt"><span style=3D"font-size:10.0pt; font-family:&qu=
ot;Arial&quot;,sans-serif; color:green">[Public]</span></p>
<p class=3D"x_MsoNormal">&nbsp;</p>
<div>
<div>
<p class=3D"x_MsoNormal" style=3D"background:white"><span style=3D"font-siz=
e:12.0pt; color:black">Yes, let's remove that too,</span></p>
</div>
<div>
<p class=3D"x_MsoNormal" style=3D"background:white"><span style=3D"font-siz=
e:12.0pt; color:black">&nbsp;</span></p>
</div>
<div>
<p class=3D"x_MsoNormal" style=3D"background:white"><span style=3D"font-siz=
e:12.0pt; color:black">Thanks,</span></p>
</div>
<div>
<p class=3D"x_MsoNormal" style=3D"background:white"><span style=3D"font-siz=
e:12.0pt; color:black">&nbsp;</span></p>
</div>
<div>
<p class=3D"x_MsoNormal" style=3D"background:white"><span style=3D"font-siz=
e:12.0pt; color:black">David</span></p>
</div>
<div class=3D"x_MsoNormal" align=3D"center" style=3D"text-align:center">
<hr size=3D"2" width=3D"98%" align=3D"center">
</div>
<div id=3D"x_divRplyFwdMsg">
<p class=3D"x_MsoNormal"><b><span style=3D"color:black">From:</span></b><sp=
an style=3D"color:black"> Gu, JiaWei (Will) &lt;<a href=3D"mailto:JiaWei.Gu=
@amd.com">JiaWei.Gu@amd.com</a>&gt;<br>
<b>Sent:</b> Monday, May 17, 2021 8:07 PM<br>
<b>To:</b> Nieto, David M &lt;<a href=3D"mailto:David.Nieto@amd.com">David.=
Nieto@amd.com</a>&gt;; Koenig, Christian &lt;<a href=3D"mailto:Christian.Ko=
enig@amd.com">Christian.Koenig@amd.com</a>&gt;;
<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.=
org</a> &lt;<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.=
freedesktop.org</a>&gt;;
<a href=3D"mailto:maraeo@gmail.com">maraeo@gmail.com</a> &lt;<a href=3D"mai=
lto:maraeo@gmail.com">maraeo@gmail.com</a>&gt;; Deucher, Alexander &lt;<a h=
ref=3D"mailto:Alexander.Deucher@amd.com">Alexander.Deucher@amd.com</a>&gt;<=
br>
<b>Cc:</b> Deng, Emily &lt;<a href=3D"mailto:Emily.Deng@amd.com">Emily.Deng=
@amd.com</a>&gt;<br>
<b>Subject:</b> RE: [PATCH] drm/amdgpu: Add vbios info ioctl interface</spa=
n> </p>
<div>
<p class=3D"x_MsoNormal">&nbsp;</p>
</div>
</div>
<div>
<div>
<p class=3D"x_xmsipheader4d111418" style=3D"margin:0in"><span style=3D"font=
-family:&quot;Arial&quot;,sans-serif; color:#0078D7">[AMD Official Use Only=
 - Internal Distribution Only]</span></p>
<p class=3D"x_xmsonormal">&nbsp;</p>
<p class=3D"x_xmsonormal">OK let=92s remove serial.</p>
<p class=3D"x_xmsonormal">&nbsp;</p>
<p class=3D"x_xmsonormal">dbdf comes from this: </p>
<p class=3D"x_xmsonormal">vbios_info.dbdf =3D PCI_DEVID(adev-&gt;pdev-&gt;b=
us-&gt;number, adev-&gt;pdev-&gt;devfn);</p>
<p class=3D"x_xmsonormal">&nbsp;</p>
<p class=3D"x_xmsonormal">I think we can remove dbdf as well.</p>
<p class=3D"x_xmsonormal">&nbsp;</p>
<p class=3D"x_xmsonormal">Best regards,</p>
<p class=3D"x_xmsonormal">Jiawei</p>
<p class=3D"x_xmsonormal">&nbsp;</p>
<div>
<div style=3D"border:none; border-top:solid #E1E1E1 1.0pt; padding:3.0pt 0i=
n 0in 0in">
<p class=3D"x_xmsonormal"><b>From:</b> Nieto, David M &lt;<a href=3D"mailto=
:David.Nieto@amd.com">David.Nieto@amd.com</a>&gt;
<br>
<b>Sent:</b> Tuesday, May 18, 2021 10:45 AM<br>
<b>To:</b> Gu, JiaWei (Will) &lt;<a href=3D"mailto:JiaWei.Gu@amd.com">JiaWe=
i.Gu@amd.com</a>&gt;; Koenig, Christian &lt;<a href=3D"mailto:Christian.Koe=
nig@amd.com">Christian.Koenig@amd.com</a>&gt;;
<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.=
org</a>;
<a href=3D"mailto:maraeo@gmail.com">maraeo@gmail.com</a>; Deucher, Alexande=
r &lt;<a href=3D"mailto:Alexander.Deucher@amd.com">Alexander.Deucher@amd.co=
m</a>&gt;<br>
<b>Cc:</b> Deng, Emily &lt;<a href=3D"mailto:Emily.Deng@amd.com">Emily.Deng=
@amd.com</a>&gt;<br>
<b>Subject:</b> Re: [PATCH] drm/amdgpu: Add vbios info ioctl interface</p>
</div>
</div>
<p class=3D"x_xmsonormal">&nbsp;</p>
<p style=3D"margin:5.0pt"><span style=3D"font-family:&quot;Arial&quot;,sans=
-serif; color:#0078D7">[AMD Official Use Only - Internal Distribution Only]=
</span></p>
<p class=3D"x_xmsonormal">&nbsp;</p>
<div>
<div>
<p class=3D"x_xmsonormal" style=3D"background:white"><span style=3D"font-si=
ze:12.0pt; color:black">The serial&nbsp;number is ASIC information, not VBI=
OS information, and it is still available as a sysfs node... I don't think =
we should put it there.</span></p>
</div>
<div>
<p class=3D"x_xmsonormal" style=3D"background:white"><span style=3D"font-si=
ze:12.0pt; color:black">&nbsp;</span></p>
</div>
<div>
<p class=3D"x_xmsonormal" style=3D"background:white"><span style=3D"font-si=
ze:12.0pt; color:black">Not sure what dbdf stands for.</span></p>
</div>
<div class=3D"x_MsoNormal" align=3D"center" style=3D"text-align:center">
<hr size=3D"2" width=3D"98%" align=3D"center">
</div>
<div id=3D"x_x_divRplyFwdMsg">
<p class=3D"x_xmsonormal"><b><span style=3D"color:black">From:</span></b><s=
pan style=3D"color:black"> Gu, JiaWei (Will) &lt;<a href=3D"mailto:JiaWei.G=
u@amd.com">JiaWei.Gu@amd.com</a>&gt;<br>
<b>Sent:</b> Monday, May 17, 2021 7:11 PM<br>
<b>To:</b> Koenig, Christian &lt;<a href=3D"mailto:Christian.Koenig@amd.com=
">Christian.Koenig@amd.com</a>&gt;;
<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.=
org</a> &lt;<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.=
freedesktop.org</a>&gt;; Nieto, David M &lt;<a href=3D"mailto:David.Nieto@a=
md.com">David.Nieto@amd.com</a>&gt;;
<a href=3D"mailto:maraeo@gmail.com">maraeo@gmail.com</a> &lt;<a href=3D"mai=
lto:maraeo@gmail.com">maraeo@gmail.com</a>&gt;; Deucher, Alexander &lt;<a h=
ref=3D"mailto:Alexander.Deucher@amd.com">Alexander.Deucher@amd.com</a>&gt;<=
br>
<b>Cc:</b> Deng, Emily &lt;<a href=3D"mailto:Emily.Deng@amd.com">Emily.Deng=
@amd.com</a>&gt;<br>
<b>Subject:</b> RE: [PATCH] drm/amdgpu: Add vbios info ioctl interface</spa=
n> </p>
<div>
<p class=3D"x_xmsonormal">&nbsp;</p>
</div>
</div>
<div>
<div>
<p class=3D"x_xmsonormal">[AMD Official Use Only - Internal Distribution On=
ly]<br>
<br>
So I guess the dbdf is also needed to be removed?<br>
And how about serial?<br>
<br>
&gt; +struct drm_amdgpu_info_vbios {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; __u8 name[64];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; __u32 dbdf; // do we need this?<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; __u8 vbios_pn[64];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; __u32 version;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; __u8 vbios_ver_str[32];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; __u8 date[32];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; __u64 serial; // do we need this?<br>
&gt; +};<br>
<br>
Best regards,<br>
Jiawei<br>
<br>
-----Original Message-----<br>
From: Koenig, Christian &lt;<a href=3D"mailto:Christian.Koenig@amd.com">Chr=
istian.Koenig@amd.com</a>&gt;
<br>
Sent: Monday, May 17, 2021 8:26 PM<br>
To: Gu, JiaWei (Will) &lt;<a href=3D"mailto:JiaWei.Gu@amd.com">JiaWei.Gu@am=
d.com</a>&gt;;
<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.=
org</a>; Nieto, David M &lt;<a href=3D"mailto:David.Nieto@amd.com">David.Ni=
eto@amd.com</a>&gt;;
<a href=3D"mailto:maraeo@gmail.com">maraeo@gmail.com</a>; Deucher, Alexande=
r &lt;<a href=3D"mailto:Alexander.Deucher@amd.com">Alexander.Deucher@amd.co=
m</a>&gt;<br>
Cc: Deng, Emily &lt;<a href=3D"mailto:Emily.Deng@amd.com">Emily.Deng@amd.co=
m</a>&gt;<br>
Subject: Re: [PATCH] drm/amdgpu: Add vbios info ioctl interface<br>
<br>
I'm not very familiar with the technical background why we have the fields =
here once more.<br>
<br>
But of hand we should at least remove everything which is also available fr=
om the PCI information.<br>
<br>
E.g. dev_id, rev_id, sub_dev_id, sub_ved_id.<br>
<br>
Regards,<br>
Christian.<br>
<br>
Am 17.05.21 um 14:17 schrieb Gu, JiaWei (Will):<br>
&gt; [AMD Official Use Only - Internal Distribution Only]<br>
&gt;<br>
&gt; Hi all,<br>
&gt;<br>
&gt; Thanks Christian's suggestion.<br>
&gt; I reverted the previous patches and squash them into this single one.<=
br>
&gt;<br>
&gt; As this patch shows, the current uapi change looks like this:<br>
&gt;<br>
&gt; +struct drm_amdgpu_info_vbios {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; __u8 name[64];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; __u32 dbdf;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; __u8 vbios_pn[64];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; __u32 version;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; __u8 vbios_ver_str[32];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; __u8 date[32];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; __u64 serial;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; __u32 dev_id;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; __u32 rev_id;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; __u32 sub_dev_id;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; __u32 sub_ved_id;<br>
&gt; +};<br>
&gt;<br>
&gt; As we know there's some redundant info in this struct.<br>
&gt; Please feel free to give any comments or suggestion about what it shou=
ld &amp; shouldn't include.<br>
&gt;<br>
&gt; Best regards,<br>
&gt; Jiawei<br>
&gt;<br>
&gt; -----Original Message-----<br>
&gt; From: Jiawei Gu &lt;<a href=3D"mailto:Jiawei.Gu@amd.com">Jiawei.Gu@amd=
.com</a>&gt;<br>
&gt; Sent: Monday, May 17, 2021 8:08 PM<br>
&gt; To: <a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.fre=
edesktop.org</a>; Koenig, Christian
<br>
&gt; &lt;<a href=3D"mailto:Christian.Koenig@amd.com">Christian.Koenig@amd.c=
om</a>&gt;; Nieto, David M &lt;<a href=3D"mailto:David.Nieto@amd.com">David=
.Nieto@amd.com</a>&gt;;
<br>
&gt; <a href=3D"mailto:maraeo@gmail.com">maraeo@gmail.com</a>; Deucher, Ale=
xander &lt;<a href=3D"mailto:Alexander.Deucher@amd.com">Alexander.Deucher@a=
md.com</a>&gt;<br>
&gt; Cc: Deng, Emily &lt;<a href=3D"mailto:Emily.Deng@amd.com">Emily.Deng@a=
md.com</a>&gt;; Gu, JiaWei (Will)
<br>
&gt; &lt;<a href=3D"mailto:JiaWei.Gu@amd.com">JiaWei.Gu@amd.com</a>&gt;<br>
&gt; Subject: [PATCH] drm/amdgpu: Add vbios info ioctl interface<br>
&gt;<br>
&gt; Add AMDGPU_INFO_VBIOS_INFO subquery id for detailed vbios info.<br>
&gt;<br>
&gt; Provides a way for the user application to get the VBIOS information w=
ithout having to parse the binary.<br>
&gt; It is useful for the user to be able to display in a simple way the VB=
IOS version in their system if they happen to encounter an issue.<br>
&gt;<br>
&gt; V2:<br>
&gt; Use numeric serial.<br>
&gt; Parse and expose vbios version string.<br>
&gt;<br>
&gt; Signed-off-by: Jiawei Gu &lt;<a href=3D"mailto:Jiawei.Gu@amd.com">Jiaw=
ei.Gu@amd.com</a>&gt;<br>
&gt; Acked-by: Christian K=F6nig &lt;<a href=3D"mailto:christian.koenig@amd=
.com">christian.koenig@amd.com</a>&gt;<br>
&gt; ---<br>
&gt;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c&nbsp;&nbsp;&nbsp; =
|&nbsp; 21 +++<br>
&gt;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/atom.c&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 174 +++++++++++++++++++++<br>
&gt;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/atom.h&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 12 ++<br>
&gt;&nbsp;&nbsp; drivers/gpu/drm/amd/include/atomfirmware.h |&nbsp;&nbsp; 5=
 +<br>
&gt;&nbsp;&nbsp; include/uapi/drm/amdgpu_drm.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 16 ++<br>
&gt;&nbsp;&nbsp; 5 files changed, 228 insertions(+)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c <br>
&gt; b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c<br>
&gt; index 8d12e474745a..30e4fed3de22 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c<br>
&gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c<br>
&gt; @@ -861,6 +861,27 @@ int amdgpu_info_ioctl(struct drm_device *dev, voi=
d *data, struct drm_file *filp)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; min((size_t)size, (size_t)(bios_size =
- bios_offset)))<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; ? -EFAULT : 0;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; case AMDGPU_INFO_VBIOS_INFO: {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_amdgpu_info_=
vbios vbios_info =3D {};<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct atom_context *at=
om_context;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; atom_context =3D adev-&=
gt;mode_info.atom_context;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memcpy(vbios_info.name,=
 atom_context-&gt;name, sizeof(atom_context-&gt;name));<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vbios_info.dbdf =3D PCI=
_DEVID(adev-&gt;pdev-&gt;bus-&gt;number, adev-&gt;pdev-&gt;devfn);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memcpy(vbios_info.vbios=
_pn, atom_context-&gt;vbios_pn, sizeof(atom_context-&gt;vbios_pn));<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vbios_info.version =3D =
atom_context-&gt;version;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memcpy(vbios_info.vbios=
_ver_str, atom_context-&gt;vbios_ver_str,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sizeof(atom_context-&gt;vbios=
_ver_str));<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memcpy(vbios_info.date,=
 atom_context-&gt;date, sizeof(atom_context-&gt;date));<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vbios_info.serial =3D a=
dev-&gt;unique_id;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vbios_info.dev_id =3D a=
dev-&gt;pdev-&gt;device;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vbios_info.rev_id =3D a=
dev-&gt;pdev-&gt;revision;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vbios_info.sub_dev_id =
=3D atom_context-&gt;sub_dev_id;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vbios_info.sub_ved_id =
=3D atom_context-&gt;sub_ved_id;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return copy_to_user(out=
, &amp;vbios_info,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; min((size_t)size, sizeof(vbio=
s_info))) ? -EFAULT : 0;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; }<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; default:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_DEB=
UG_KMS(&quot;Invalid request %d\n&quot;,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; info-&gt;vbios_info.type);<br>
&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/atom.c <br>
&gt; b/drivers/gpu/drm/amd/amdgpu/atom.c<br>
&gt; index 3dcb8b32f48b..542b2c2414e4 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdgpu/atom.c<br>
&gt; +++ b/drivers/gpu/drm/amd/amdgpu/atom.c<br>
&gt; @@ -31,6 +31,7 @@<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp; #define ATOM_DEBUG<br>
&gt;&nbsp;&nbsp; <br>
&gt; +#include &quot;atomfirmware.h&quot;<br>
&gt;&nbsp;&nbsp; #include &quot;atom.h&quot;<br>
&gt;&nbsp;&nbsp; #include &quot;atom-names.h&quot;<br>
&gt;&nbsp;&nbsp; #include &quot;atom-bits.h&quot;<br>
&gt; @@ -1299,12 +1300,168 @@ static void atom_index_iio(struct atom_contex=
t *ctx, int base)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp; <br>
&gt; +static void atom_get_vbios_name(struct atom_context *ctx) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; unsigned char *p_rom;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; unsigned char str_num;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; unsigned short off_to_vbios_str;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; unsigned char *c_ptr;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int name_size;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int i;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; const char *na =3D &quot;--N/A--&quot;;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; char *back;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; p_rom =3D ctx-&gt;bios;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; str_num =3D *(p_rom + OFFSET_TO_GET_ATOMBIOS=
_NUMBER_OF_STRINGS);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (str_num !=3D 0) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; off_to_vbios_str =3D<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *(unsigned short *)(p_r=
om + OFFSET_TO_GET_ATOMBIOS_STRING_START);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; c_ptr =3D (unsigned char *)(p_rom + off_to_vbios_str);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; /* do not know where to find name */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; memcpy(ctx-&gt;name, na, 7);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ctx-&gt;name[7] =3D 0;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * skip the atombios strings, usually 4=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * 1st is P/N, 2nd is ASIC, 3rd is PCI =
type, 4th is Memory type<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; str_num; i++) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; while (*c_ptr !=3D 0)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; c_ptr++;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; c_ptr++;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* skip the following 2 chars: 0x0D 0x0A */<=
br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; c_ptr +=3D 2;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; name_size =3D strnlen(c_ptr, STRLEN_LONG - 1=
);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; memcpy(ctx-&gt;name, c_ptr, name_size);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; back =3D ctx-&gt;name + name_size;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; while ((*--back) =3D=3D ' ')<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; *(back + 1) =3D '\0';<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void atom_get_vbios_date(struct atom_context *ctx) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; unsigned char *p_rom;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; unsigned char *date_in_rom;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; p_rom =3D ctx-&gt;bios;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; date_in_rom =3D p_rom + OFFSET_TO_VBIOS_DATE=
;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; ctx-&gt;date[0] =3D '2';<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; ctx-&gt;date[1] =3D '0';<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; ctx-&gt;date[2] =3D date_in_rom[6];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; ctx-&gt;date[3] =3D date_in_rom[7];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; ctx-&gt;date[4] =3D '/';<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; ctx-&gt;date[5] =3D date_in_rom[0];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; ctx-&gt;date[6] =3D date_in_rom[1];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; ctx-&gt;date[7] =3D '/';<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; ctx-&gt;date[8] =3D date_in_rom[3];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; ctx-&gt;date[9] =3D date_in_rom[4];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; ctx-&gt;date[10] =3D ' ';<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; ctx-&gt;date[11] =3D date_in_rom[9];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; ctx-&gt;date[12] =3D date_in_rom[10];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; ctx-&gt;date[13] =3D date_in_rom[11];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; ctx-&gt;date[14] =3D date_in_rom[12];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; ctx-&gt;date[15] =3D date_in_rom[13];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; ctx-&gt;date[16] =3D '\0';<br>
&gt; +}<br>
&gt; +<br>
&gt; +static unsigned char *atom_find_str_in_rom(struct atom_context *ctx, =
char *str, int start,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; int end, int maxlen)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; unsigned long str_off;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; unsigned char *p_rom;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; unsigned short str_len;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; str_off =3D 0;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; str_len =3D strnlen(str, maxlen);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; p_rom =3D ctx-&gt;bios;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; for (; start &lt;=3D end; ++start) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; for (str_off =3D 0; str_off &lt; str_len; ++str_off) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (str[str_off] !=3D *=
(p_rom + start + str_off))<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (str_off =3D=3D str_len || str[str_off] =3D=3D 0)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return p_rom + start;<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return NULL;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void atom_get_vbios_pn(struct atom_context *ctx) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; unsigned char *p_rom;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; unsigned short off_to_vbios_str;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; unsigned char *vbios_str;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int count;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; off_to_vbios_str =3D 0;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; p_rom =3D ctx-&gt;bios;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (*(p_rom + OFFSET_TO_GET_ATOMBIOS_NUMBER_=
OF_STRINGS) !=3D 0) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; off_to_vbios_str =3D<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *(unsigned short *)(p_r=
om + OFFSET_TO_GET_ATOMBIOS_STRING_START);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; vbios_str =3D (unsigned char *)(p_rom + off_to_vbios_str);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; vbios_str =3D p_rom + OFFSET_TO_VBIOS_PART_NUMBER;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (*vbios_str =3D=3D 0) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; vbios_str =3D atom_find_str_in_rom(ctx, BIOS_ATOM_PREFIX, 3, 1024, 64);=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (vbios_str =3D=3D NULL)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vbios_str +=3D sizeof(B=
IOS_ATOM_PREFIX) - 1;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (vbios_str !=3D NULL &amp;&amp; *vbios_st=
r =3D=3D 0)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; vbios_str++;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (vbios_str !=3D NULL) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; count =3D 0;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; while ((count &lt; BIOS_STRING_LENGTH) &amp;&amp; vbios_str[count] &gt;=
=3D ' ' &amp;&amp;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vbios_str[count] &lt;=3D 'z')=
 {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ctx-&gt;vbios_pn[count]=
 =3D vbios_str[count];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; count++;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ctx-&gt;vbios_pn[count] =3D 0;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void atom_get_vbios_version(struct atom_context *ctx) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; unsigned char *vbios_ver;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* find anchor ATOMBIOSBK-AMD */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; vbios_ver =3D atom_find_str_in_rom(ctx, BIOS=
_VERSION_PREFIX, 3, 1024, 64);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (vbios_ver !=3D NULL) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; /* skip ATOMBIOSBK-AMD VER */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; vbios_ver +=3D 18;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; memcpy(ctx-&gt;vbios_ver_str, vbios_ver, STRLEN_NORMAL);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ctx-&gt;vbios_ver_str[0] =3D '\0';<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +}<br>
&gt; +<br>
&gt;&nbsp;&nbsp; struct atom_context *amdgpu_atom_parse(struct card_info *c=
ard, void *bios)&nbsp; {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int base;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct atom_context *ctx =3D=
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kzal=
loc(sizeof(struct atom_context), GFP_KERNEL);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char *str;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct _ATOM_ROM_HEADER *atom_rom_header;<br=
>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct _ATOM_MASTER_DATA_TABLE *master_table=
;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct _ATOM_FIRMWARE_INFO *atom_fw_info;<br=
>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u16 idx;<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!ctx)<br>
&gt; @@ -1353,6 +1510,23 @@ struct atom_context *amdgpu_atom_parse(struct c=
ard_info *card, void *bios)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; strlcpy(ctx-&gt;vbios_version, str, sizeof(ctx-&gt;vbio=
s_version));<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp; <br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; atom_rom_header =3D (struct _ATOM_ROM_HEADER=
 *)CSTR(base);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; ctx-&gt;sub_dev_id =3D atom_rom_header-&gt;u=
sSubsystemVendorID;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; ctx-&gt;sub_ved_id =3D atom_rom_header-&gt;u=
sSubsystemID;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (atom_rom_header-&gt;usMasterDataTableOff=
set !=3D 0) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; master_table =3D (struct _ATOM_MASTER_DATA_TABLE *)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; CSTR(atom_rom_header-&gt;usMasterDataTableOffset);=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (master_table-&gt;ListOfDataTables.FirmwareInfo !=3D 0) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; atom_fw_info =3D (struc=
t _ATOM_FIRMWARE_INFO *)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CS=
TR(master_table-&gt;ListOfDataTables.FirmwareInfo);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ctx-&gt;version =3D ato=
m_fw_info-&gt;ulFirmwareRevision;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; atom_get_vbios_name(ctx);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; atom_get_vbios_pn(ctx);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; atom_get_vbios_date(ctx);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; atom_get_vbios_version(ctx);<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ctx;<br>
&gt;&nbsp;&nbsp; }<br>
&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/atom.h <br>
&gt; b/drivers/gpu/drm/amd/amdgpu/atom.h<br>
&gt; index d279759cab47..6463ce6e756d 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdgpu/atom.h<br>
&gt; +++ b/drivers/gpu/drm/amd/amdgpu/atom.h<br>
&gt; @@ -112,6 +112,10 @@ struct drm_device;<br>
&gt;&nbsp;&nbsp; #define ATOM_IO_SYSIO&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2<br>
&gt;&nbsp;&nbsp; #define ATOM_IO_IIO&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; 0x80<br>
&gt;&nbsp;&nbsp; <br>
&gt; +#define STRLEN_NORMAL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 32<br>
&gt; +#define STRLEN_LONG&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; 64<br>
&gt; +#define STRLEN_VERYLONG&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 254<br>
&gt; +<br>
&gt;&nbsp;&nbsp; struct card_info {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_device *dev;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (* reg_write)(struct ca=
rd_info *, uint32_t, uint32_t);&nbsp;&nbsp; /*&nbsp; filled by driver */<br=
>
&gt; @@ -140,6 +144,14 @@ struct atom_context {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t *scratch;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int scratch_size_bytes;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char vbios_version[20];<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; uint8_t name[STRLEN_LONG];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; uint8_t vbios_pn[STRLEN_LONG];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; uint32_t version;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; uint8_t vbios_ver_str[STRLEN_NORMAL];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; uint8_t date[STRLEN_NORMAL];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; uint32_t sub_dev_id;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; uint32_t sub_ved_id;<br>
&gt;&nbsp;&nbsp; };<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp; extern int amdgpu_atom_debug;<br>
&gt; diff --git a/drivers/gpu/drm/amd/include/atomfirmware.h <br>
&gt; b/drivers/gpu/drm/amd/include/atomfirmware.h<br>
&gt; index 275468e4be60..28deecc2f990 100644<br>
&gt; --- a/drivers/gpu/drm/amd/include/atomfirmware.h<br>
&gt; +++ b/drivers/gpu/drm/amd/include/atomfirmware.h<br>
&gt; @@ -197,6 +197,9 @@ enum atom_dp_vs_preemph_def{<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; DP_VS_LEVEL0_PREEMPH_LEVEL3 =3D 0x18,<br>
&gt;&nbsp;&nbsp; };<br>
&gt;&nbsp;&nbsp; <br>
&gt; +#define BIOS_ATOM_PREFIX&nbsp;&nbsp; &quot;ATOMBIOS&quot;<br>
&gt; +#define BIOS_VERSION_PREFIX&nbsp; &quot;ATOMBIOSBK-AMD&quot;<br>
&gt; +#define BIOS_STRING_LENGTH 43<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp; /*<br>
&gt;&nbsp;&nbsp; enum atom_string_def{<br>
&gt; @@ -215,6 +218,8 @@ enum atombios_image_offset{<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; MAXSIZE_OF_ATOMBIOS_ASIC_BUS_MEM_TYPE&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; =3D 20,&nbsp; /*including the terminator 0x0!*/<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; OFFSET_TO_GET_ATOMBIOS_NUMBER_OF_STRINGS&nbsp;=
&nbsp; =3D 0x2f,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; OFFSET_TO_GET_ATOMBIOS_STRING_START&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D 0x6e,<br>
&gt; +&nbsp; OFFSET_TO_VBIOS_PART_NUMBER&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D 0x80,<br>
&gt; +&nbsp; OFFSET_TO_VBIOS_DATE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; =3D 0x50,<br>
&gt;&nbsp;&nbsp; };<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp; <br>
&gt; /*********************************************************************=
<br>
&gt; ******* diff --git a/include/uapi/drm/amdgpu_drm.h <br>
&gt; b/include/uapi/drm/amdgpu_drm.h index 9169df7fadee..e0f98ca9a755 <br>
&gt; 100644<br>
&gt; --- a/include/uapi/drm/amdgpu_drm.h<br>
&gt; +++ b/include/uapi/drm/amdgpu_drm.h<br>
&gt; @@ -756,6 +756,8 @@ struct drm_amdgpu_cs_chunk_data {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #define AMDGPU_INFO_VBIOS_SI=
ZE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x1<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Subquery id: Query vbios =
image */<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #define AMDGPU_INFO_VBIOS_IM=
AGE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x2<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Subquery id: Query vbios info */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; #define AMDGPU_INFO_VBIOS_INFO&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x3<br>
&gt;&nbsp;&nbsp; /* Query UVD handles */<br>
&gt;&nbsp;&nbsp; #define AMDGPU_INFO_NUM_HANDLES&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; 0x1C<br>
&gt;&nbsp;&nbsp; /* Query sensor related information */ @@ -949,6 +951,20 @=
@ struct <br>
&gt; drm_amdgpu_info_firmware {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __u32 feature;<br>
&gt;&nbsp;&nbsp; };<br>
&gt;&nbsp;&nbsp; <br>
&gt; +struct drm_amdgpu_info_vbios {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; __u8 name[64];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; __u32 dbdf;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; __u8 vbios_pn[64];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; __u32 version;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; __u8 vbios_ver_str[32];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; __u8 date[32];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; __u64 serial;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; __u32 dev_id;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; __u32 rev_id;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; __u32 sub_dev_id;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; __u32 sub_ved_id;<br>
&gt; +};<br>
&gt; +<br>
&gt;&nbsp;&nbsp; #define AMDGPU_VRAM_TYPE_UNKNOWN 0<br>
&gt;&nbsp;&nbsp; #define AMDGPU_VRAM_TYPE_GDDR1 1<br>
&gt;&nbsp;&nbsp; #define AMDGPU_VRAM_TYPE_DDR2&nbsp; 2<br>
&gt; --<br>
&gt; 2.17.1</p>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_MN2PR12MB4488EAC16AE52CD7160D53F5F72B9MN2PR12MB4488namp_--

--===============1114727364==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--===============1114727364==--
