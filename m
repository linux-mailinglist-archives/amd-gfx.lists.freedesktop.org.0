Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA7290505
	for <lists+amd-gfx@lfdr.de>; Fri, 16 Aug 2019 17:55:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFA8F6E8BF;
	Fri, 16 Aug 2019 15:55:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800085.outbound.protection.outlook.com [40.107.80.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57A176E8BA
 for <amd-gfx@lists.freedesktop.org>; Fri, 16 Aug 2019 15:55:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f+TgDsw6/wouE8SW5tcCkeehrmiGfO8+bBlzy00vG69JGI95r6XfprHI9jj+pn3gNF1mH9Drf1PD3xVEEKCVDNOpu5OtoZ1LipNWyZvg0jykgYf4JeByP9bHCpRm4u2pmTsHNa1PoBiaEwSneReu1EXF/iKVf5Vc8j1ouxNLaoO8TZ+OBahSGnCeFnWXXBia1L7v22NGUE6ibo0bC/ozcgR52SWIPTDnQSRAlSNmQIQqxXj2zSLBHpASlLKTgWGNHxu4YwVLwltaDmhWlhP8PlaSRDa5LVsaHi95F0hEMVgesWE6RjJQP2BN4zBt5C3r3DWMtdaYxutpDvpyiS+2Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3kZVIwypou8tKVq2+k4U7qUtuQNG99dS1T9HwNfoXKE=;
 b=OnNu1q49mnOO+/6IMNNuf4Yug+4knOri1PHBN341KwZ7wk0PURE7kkHubhQXb38bqfh+YKFQ7bWrBrRdX3DkW0vEMI1yr9e5vPURCbqtv6/1n29B11UfrDIaZo0Rbm0O0wiohZCletCGB1IodFIU2XhITww4F4+oy9xjuaCHLg3WSAr2ERWd+o/9xryi05oAv0E/djeL+V5NBRyVK16LTISbTObLwzMp2T5WTv703CwdneRxIttc31qXae84uTU5v8LKYS8gEzEUDaSKrUhSBVYqvUgftWGVAI6pTE5LMN244Rf1Xqa6n/O0sG5pHnGHqS/3PMls7/XVZi+x0BN6Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB2778.namprd12.prod.outlook.com (20.176.114.145) by
 DM6PR12MB3180.namprd12.prod.outlook.com (20.179.104.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.16; Fri, 16 Aug 2019 15:55:21 +0000
Received: from DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::448a:9fc:743d:49cb]) by DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::448a:9fc:743d:49cb%7]) with mapi id 15.20.2178.016; Fri, 16 Aug 2019
 15:55:21 +0000
From: "Zhao, Yong" <Yong.Zhao@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdkfd: Fill the name field in node topology with
 asic name v2
Thread-Topic: [PATCH] drm/amdkfd: Fill the name field in node topology with
 asic name v2
Thread-Index: AQHVUh0PxCSoHMneuk6OQm2051qFsab884EAgAD+KgE=
Date: Fri, 16 Aug 2019 15:55:21 +0000
Message-ID: <DM6PR12MB27787E0DEC3F3CB26EFA4573F0AF0@DM6PR12MB2778.namprd12.prod.outlook.com>
References: <20190813212112.11797-1-Yong.Zhao@amd.com>,
 <e893f615-a81b-c5ab-2072-17a64c5f0a3b@amd.com>
In-Reply-To: <e893f615-a81b-c5ab-2072-17a64c5f0a3b@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.54.211]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f819ba93-3fce-4c38-bca6-08d7226224fe
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM6PR12MB3180; 
x-ms-traffictypediagnostic: DM6PR12MB3180:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB3180D6CF2E1068437A007BA7F0AF0@DM6PR12MB3180.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0131D22242
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(366004)(346002)(39860400002)(136003)(376002)(189003)(199004)(76116006)(6436002)(66476007)(256004)(66556008)(66946007)(11346002)(476003)(66446008)(76176011)(105004)(316002)(7696005)(14444005)(64756008)(52536014)(486006)(99286004)(19627405001)(74316002)(7736002)(86362001)(5660300002)(446003)(66066001)(71190400001)(71200400001)(33656002)(186003)(26005)(478600001)(6246003)(9686003)(6506007)(53936002)(81166006)(102836004)(229853002)(55016002)(54896002)(8936002)(53546011)(25786009)(2906002)(3846002)(110136005)(81156014)(6116002)(14454004)(2501003)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3180;
 H:DM6PR12MB2778.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 74fI6GqwwJNSXIvkc2RjCeW3HfFCiAHfGHiVBKxiULmmTlHqFZIDO3ONDv53pCtPU8z3enGSehhgESHW8nBPE/cdpFprNdIxQMFBW2ahh+EVLBoPkosLxG69uaKBmJ0TebuzQgCeKk0zHpQ4eCSIE5FWM3lyapKWOtDruyRBoVxRE9WIMVWsqD/xT19LlaU0IovoLPlmexhVFloU1ECmGw9KpmLN7qvZJc/JbCWaPfLkgmzp7Cd5MSgS8FQ48W9aUBzAfcU489uKQojOMiFp8JVUifkywoPqfpixf1ppbCfnbUeYNcK/6i4Qu55WgROHbyz+LU3c0vEqRfdxKFqxeSeNKYlQNCoSwYIRT8l06ffp2rEbepONbekDvJqKHWJVmj3HSw5Of8l3SuWEO7Ds25qnsBWR9/uBPAvz3FEOOQo=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f819ba93-3fce-4c38-bca6-08d7226224fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2019 15:55:21.8008 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GaK7kaENZonHoJvlCw/UyWlCmSE9sEoo44fj+1P0VhNWfhlXw6iZAEP9b8J9tmFQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3kZVIwypou8tKVq2+k4U7qUtuQNG99dS1T9HwNfoXKE=;
 b=uVSQccJVV9yUx/Z5vZkv/BeYdKsz+lCxd4sfVCJG15+0R239zM24i3vWtrtSYenpo0fV5gBbSQzo5iaU7CvvMgpeR3hPSGmBG1M8xOODroZoO22Br+6aVue+kQgDe18X0td8Ipu15jAs7ry8zieDvrkeqmYhhk666LwT/y2H3aI=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Yong.Zhao@amd.com; 
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
Content-Type: multipart/mixed; boundary="===============0402469317=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0402469317==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DM6PR12MB27787E0DEC3F3CB26EFA4573F0AF0DM6PR12MB2778namp_"

--_000_DM6PR12MB27787E0DEC3F3CB26EFA4573F0AF0DM6PR12MB2778namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Pushed. Will work on the market name later.

Yong
________________________________
From: Kuehling, Felix <Felix.Kuehling@amd.com>
Sent: Thursday, August 15, 2019 8:45 PM
To: Zhao, Yong <Yong.Zhao@amd.com>; amd-gfx@lists.freedesktop.org <amd-gfx@=
lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdkfd: Fill the name field in node topology with =
asic name v2

On 2019-08-13 17:21, Zhao, Yong wrote:
> The name field in node topology has not been used. We re-purpose it to
> hold the asic name, which can be queried by user space applications
> through sysfs.
>
> Change-Id: I74f4f5487db169004a9d27ea15abe99261c86220
> Signed-off-by: Yong Zhao <Yong.Zhao@amd.com>

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>

As a follow-up, I think you could also remove the marketing name field
from struct kfd_node_properties. As far as I can tell this is never
populated and now it's also no longer reported in sysfs.

Regards,
   Felix

> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_device.c   | 18 ++++++++++++++++++
>   drivers/gpu/drm/amd/amdkfd/kfd_priv.h     |  1 +
>   drivers/gpu/drm/amd/amdkfd/kfd_topology.c | 16 ++++++----------
>   drivers/gpu/drm/amd/amdkfd/kfd_topology.h |  4 ++--
>   4 files changed, 27 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device.c b/drivers/gpu/drm/am=
d/amdkfd/kfd_device.c
> index 3b9fe629a126..24bfdf583820 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_device.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
> @@ -42,6 +42,7 @@ static atomic_t kfd_locked =3D ATOMIC_INIT(0);
>   #ifdef KFD_SUPPORT_IOMMU_V2
>   static const struct kfd_device_info kaveri_device_info =3D {
>        .asic_family =3D CHIP_KAVERI,
> +     .asic_name =3D "kaveri",
>        .max_pasid_bits =3D 16,
>        /* max num of queues for KV.TODO should be a dynamic value */
>        .max_no_of_hqd  =3D 24,
> @@ -60,6 +61,7 @@ static const struct kfd_device_info kaveri_device_info =
=3D {
>
>   static const struct kfd_device_info carrizo_device_info =3D {
>        .asic_family =3D CHIP_CARRIZO,
> +     .asic_name =3D "carrizo",
>        .max_pasid_bits =3D 16,
>        /* max num of queues for CZ.TODO should be a dynamic value */
>        .max_no_of_hqd  =3D 24,
> @@ -78,6 +80,7 @@ static const struct kfd_device_info carrizo_device_info=
 =3D {
>
>   static const struct kfd_device_info raven_device_info =3D {
>        .asic_family =3D CHIP_RAVEN,
> +     .asic_name =3D "raven",
>        .max_pasid_bits =3D 16,
>        .max_no_of_hqd  =3D 24,
>        .doorbell_size  =3D 8,
> @@ -96,6 +99,7 @@ static const struct kfd_device_info raven_device_info =
=3D {
>
>   static const struct kfd_device_info hawaii_device_info =3D {
>        .asic_family =3D CHIP_HAWAII,
> +     .asic_name =3D "hawaii",
>        .max_pasid_bits =3D 16,
>        /* max num of queues for KV.TODO should be a dynamic value */
>        .max_no_of_hqd  =3D 24,
> @@ -114,6 +118,7 @@ static const struct kfd_device_info hawaii_device_inf=
o =3D {
>
>   static const struct kfd_device_info tonga_device_info =3D {
>        .asic_family =3D CHIP_TONGA,
> +     .asic_name =3D "tonga",
>        .max_pasid_bits =3D 16,
>        .max_no_of_hqd  =3D 24,
>        .doorbell_size  =3D 4,
> @@ -131,6 +136,7 @@ static const struct kfd_device_info tonga_device_info=
 =3D {
>
>   static const struct kfd_device_info fiji_device_info =3D {
>        .asic_family =3D CHIP_FIJI,
> +     .asic_name =3D "fiji",
>        .max_pasid_bits =3D 16,
>        .max_no_of_hqd  =3D 24,
>        .doorbell_size  =3D 4,
> @@ -148,6 +154,7 @@ static const struct kfd_device_info fiji_device_info =
=3D {
>
>   static const struct kfd_device_info fiji_vf_device_info =3D {
>        .asic_family =3D CHIP_FIJI,
> +     .asic_name =3D "fiji",
>        .max_pasid_bits =3D 16,
>        .max_no_of_hqd  =3D 24,
>        .doorbell_size  =3D 4,
> @@ -166,6 +173,7 @@ static const struct kfd_device_info fiji_vf_device_in=
fo =3D {
>
>   static const struct kfd_device_info polaris10_device_info =3D {
>        .asic_family =3D CHIP_POLARIS10,
> +     .asic_name =3D "polaris10",
>        .max_pasid_bits =3D 16,
>        .max_no_of_hqd  =3D 24,
>        .doorbell_size  =3D 4,
> @@ -183,6 +191,7 @@ static const struct kfd_device_info polaris10_device_=
info =3D {
>
>   static const struct kfd_device_info polaris10_vf_device_info =3D {
>        .asic_family =3D CHIP_POLARIS10,
> +     .asic_name =3D "polaris10",
>        .max_pasid_bits =3D 16,
>        .max_no_of_hqd  =3D 24,
>        .doorbell_size  =3D 4,
> @@ -200,6 +209,7 @@ static const struct kfd_device_info polaris10_vf_devi=
ce_info =3D {
>
>   static const struct kfd_device_info polaris11_device_info =3D {
>        .asic_family =3D CHIP_POLARIS11,
> +     .asic_name =3D "polaris11",
>        .max_pasid_bits =3D 16,
>        .max_no_of_hqd  =3D 24,
>        .doorbell_size  =3D 4,
> @@ -217,6 +227,7 @@ static const struct kfd_device_info polaris11_device_=
info =3D {
>
>   static const struct kfd_device_info polaris12_device_info =3D {
>        .asic_family =3D CHIP_POLARIS12,
> +     .asic_name =3D "polaris12",
>        .max_pasid_bits =3D 16,
>        .max_no_of_hqd  =3D 24,
>        .doorbell_size  =3D 4,
> @@ -234,6 +245,7 @@ static const struct kfd_device_info polaris12_device_=
info =3D {
>
>   static const struct kfd_device_info vegam_device_info =3D {
>        .asic_family =3D CHIP_VEGAM,
> +     .asic_name =3D "vegam",
>        .max_pasid_bits =3D 16,
>        .max_no_of_hqd  =3D 24,
>        .doorbell_size  =3D 4,
> @@ -251,6 +263,7 @@ static const struct kfd_device_info vegam_device_info=
 =3D {
>
>   static const struct kfd_device_info vega10_device_info =3D {
>        .asic_family =3D CHIP_VEGA10,
> +     .asic_name =3D "vega10",
>        .max_pasid_bits =3D 16,
>        .max_no_of_hqd  =3D 24,
>        .doorbell_size  =3D 8,
> @@ -268,6 +281,7 @@ static const struct kfd_device_info vega10_device_inf=
o =3D {
>
>   static const struct kfd_device_info vega10_vf_device_info =3D {
>        .asic_family =3D CHIP_VEGA10,
> +     .asic_name =3D "vega10",
>        .max_pasid_bits =3D 16,
>        .max_no_of_hqd  =3D 24,
>        .doorbell_size  =3D 8,
> @@ -285,6 +299,7 @@ static const struct kfd_device_info vega10_vf_device_=
info =3D {
>
>   static const struct kfd_device_info vega12_device_info =3D {
>        .asic_family =3D CHIP_VEGA12,
> +     .asic_name =3D "vega12",
>        .max_pasid_bits =3D 16,
>        .max_no_of_hqd  =3D 24,
>        .doorbell_size  =3D 8,
> @@ -302,6 +317,7 @@ static const struct kfd_device_info vega12_device_inf=
o =3D {
>
>   static const struct kfd_device_info vega20_device_info =3D {
>        .asic_family =3D CHIP_VEGA20,
> +     .asic_name =3D "vega20",
>        .max_pasid_bits =3D 16,
>        .max_no_of_hqd  =3D 24,
>        .doorbell_size  =3D 8,
> @@ -319,6 +335,7 @@ static const struct kfd_device_info vega20_device_inf=
o =3D {
>
>   static const struct kfd_device_info arcturus_device_info =3D {
>        .asic_family =3D CHIP_ARCTURUS,
> +     .asic_name =3D "arcturus",
>        .max_pasid_bits =3D 16,
>        .max_no_of_hqd  =3D 24,
>        .doorbell_size  =3D 8,
> @@ -336,6 +353,7 @@ static const struct kfd_device_info arcturus_device_i=
nfo =3D {
>
>   static const struct kfd_device_info navi10_device_info =3D {
>        .asic_family =3D CHIP_NAVI10,
> +     .asic_name =3D "navi10",
>        .max_pasid_bits =3D 16,
>        .max_no_of_hqd  =3D 24,
>        .doorbell_size  =3D 8,
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/=
amdkfd/kfd_priv.h
> index 9b9a8da187c8..06bb2d7a9b39 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> @@ -195,6 +195,7 @@ struct kfd_event_interrupt_class {
>
>   struct kfd_device_info {
>        enum amd_asic_type asic_family;
> +     const char *asic_name;
>        const struct kfd_event_interrupt_class *event_interrupt_class;
>        unsigned int max_pasid_bits;
>        unsigned int max_no_of_hqd;
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c b/drivers/gpu/drm/=
amd/amdkfd/kfd_topology.c
> index 36fa98fe858b..7551761f2aa9 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
> @@ -406,8 +406,6 @@ static ssize_t node_show(struct kobject *kobj, struct=
 attribute *attr,
>                char *buffer)
>   {
>        struct kfd_topology_device *dev;
> -     char public_name[KFD_TOPOLOGY_PUBLIC_NAME_SIZE];
> -     uint32_t i;
>        uint32_t log_max_watch_addr;
>
>        /* Making sure that the buffer is an empty string */
> @@ -422,14 +420,8 @@ static ssize_t node_show(struct kobject *kobj, struc=
t attribute *attr,
>        if (strcmp(attr->name, "name") =3D=3D 0) {
>                dev =3D container_of(attr, struct kfd_topology_device,
>                                attr_name);
> -             for (i =3D 0; i < KFD_TOPOLOGY_PUBLIC_NAME_SIZE; i++) {
> -                     public_name[i] =3D
> -                                     (char)dev->node_props.marketing_nam=
e[i];
> -                     if (dev->node_props.marketing_name[i] =3D=3D 0)
> -                             break;
> -             }
> -             public_name[KFD_TOPOLOGY_PUBLIC_NAME_SIZE-1] =3D 0x0;
> -             return sysfs_show_str_val(buffer, public_name);
> +
> +             return sysfs_show_str_val(buffer, dev->node_props.name);
>        }
>
>        dev =3D container_of(attr, struct kfd_topology_device,
> @@ -1274,6 +1266,10 @@ int kfd_topology_add_device(struct kfd_dev *gpu)
>         */
>
>        amdgpu_amdkfd_get_cu_info(dev->gpu->kgd, &cu_info);
> +
> +     strncpy(dev->node_props.name, gpu->device_info->asic_name,
> +                     KFD_TOPOLOGY_PUBLIC_NAME_SIZE);
> +
>        dev->node_props.simd_arrays_per_engine =3D
>                cu_info.num_shader_arrays_per_engine;
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_topology.h b/drivers/gpu/drm/=
amd/amdkfd/kfd_topology.h
> index 276354aa0fcc..d4718d58d0f2 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_topology.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_topology.h
> @@ -27,7 +27,7 @@
>   #include <linux/list.h>
>   #include "kfd_crat.h"
>
> -#define KFD_TOPOLOGY_PUBLIC_NAME_SIZE 128
> +#define KFD_TOPOLOGY_PUBLIC_NAME_SIZE 32
>
>   #define HSA_CAP_HOT_PLUGGABLE                       0x00000001
>   #define HSA_CAP_ATS_PRESENT                 0x00000002
> @@ -81,7 +81,7 @@ struct kfd_node_properties {
>        int32_t  drm_render_minor;
>        uint32_t num_sdma_engines;
>        uint32_t num_sdma_xgmi_engines;
> -     uint16_t marketing_name[KFD_TOPOLOGY_PUBLIC_NAME_SIZE];
> +     char name[KFD_TOPOLOGY_PUBLIC_NAME_SIZE];
>   };
>
>   #define HSA_MEM_HEAP_TYPE_SYSTEM    0

--_000_DM6PR12MB27787E0DEC3F3CB26EFA4573F0AF0DM6PR12MB2778namp_
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
Pushed. Will work on the market name later.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Yong</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Kuehling, Felix &lt;F=
elix.Kuehling@amd.com&gt;<br>
<b>Sent:</b> Thursday, August 15, 2019 8:45 PM<br>
<b>To:</b> Zhao, Yong &lt;Yong.Zhao@amd.com&gt;; amd-gfx@lists.freedesktop.=
org &lt;amd-gfx@lists.freedesktop.org&gt;<br>
<b>Subject:</b> Re: [PATCH] drm/amdkfd: Fill the name field in node topolog=
y with asic name v2</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On 2019-08-13 17:21, Zhao, Yong wrote:<br>
&gt; The name field in node topology has not been used. We re-purpose it to=
<br>
&gt; hold the asic name, which can be queried by user space applications<br=
>
&gt; through sysfs.<br>
&gt;<br>
&gt; Change-Id: I74f4f5487db169004a9d27ea15abe99261c86220<br>
&gt; Signed-off-by: Yong Zhao &lt;Yong.Zhao@amd.com&gt;<br>
<br>
Reviewed-by: Felix Kuehling &lt;Felix.Kuehling@amd.com&gt;<br>
<br>
As a follow-up, I think you could also remove the marketing name field <br>
from struct kfd_node_properties. As far as I can tell this is never <br>
populated and now it's also no longer reported in sysfs.<br>
<br>
Regards,<br>
&nbsp;&nbsp; Felix<br>
<br>
&gt; ---<br>
&gt;&nbsp;&nbsp; drivers/gpu/drm/amd/amdkfd/kfd_device.c&nbsp;&nbsp; | 18 &=
#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&=
#43;&#43;&#43;<br>
&gt;&nbsp;&nbsp; drivers/gpu/drm/amd/amdkfd/kfd_priv.h&nbsp;&nbsp;&nbsp;&nb=
sp; |&nbsp; 1 &#43;<br>
&gt;&nbsp;&nbsp; drivers/gpu/drm/amd/amdkfd/kfd_topology.c | 16 &#43;&#43;&=
#43;&#43;&#43;&#43;----------<br>
&gt;&nbsp;&nbsp; drivers/gpu/drm/amd/amdkfd/kfd_topology.h |&nbsp; 4 &#43;&=
#43;--<br>
&gt;&nbsp;&nbsp; 4 files changed, 27 insertions(&#43;), 12 deletions(-)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device.c b/drivers/gpu/drm=
/amd/amdkfd/kfd_device.c<br>
&gt; index 3b9fe629a126..24bfdf583820 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdkfd/kfd_device.c<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/amdkfd/kfd_device.c<br>
&gt; @@ -42,6 &#43;42,7 @@ static atomic_t kfd_locked =3D ATOMIC_INIT(0);<b=
r>
&gt;&nbsp;&nbsp; #ifdef KFD_SUPPORT_IOMMU_V2<br>
&gt;&nbsp;&nbsp; static const struct kfd_device_info kaveri_device_info =3D=
 {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .asic_family =3D CHIP_KAVERI=
,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; .asic_name =3D &quot;kaveri&quot;,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_pasid_bits =3D 16,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* max num of queues for KV.=
TODO should be a dynamic value */<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_no_of_hqd&nbsp; =3D 24,=
<br>
&gt; @@ -60,6 &#43;61,7 @@ static const struct kfd_device_info kaveri_devic=
e_info =3D {<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp; static const struct kfd_device_info carrizo_device_info =
=3D {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .asic_family =3D CHIP_CARRIZ=
O,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; .asic_name =3D &quot;carrizo&quot;,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_pasid_bits =3D 16,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* max num of queues for CZ.=
TODO should be a dynamic value */<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_no_of_hqd&nbsp; =3D 24,=
<br>
&gt; @@ -78,6 &#43;80,7 @@ static const struct kfd_device_info carrizo_devi=
ce_info =3D {<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp; static const struct kfd_device_info raven_device_info =3D =
{<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .asic_family =3D CHIP_RAVEN,=
<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; .asic_name =3D &quot;raven&quot;,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_pasid_bits =3D 16,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_no_of_hqd&nbsp; =3D 24,=
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .doorbell_size&nbsp; =3D 8,<=
br>
&gt; @@ -96,6 &#43;99,7 @@ static const struct kfd_device_info raven_device=
_info =3D {<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp; static const struct kfd_device_info hawaii_device_info =3D=
 {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .asic_family =3D CHIP_HAWAII=
,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; .asic_name =3D &quot;hawaii&quot;,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_pasid_bits =3D 16,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* max num of queues for KV.=
TODO should be a dynamic value */<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_no_of_hqd&nbsp; =3D 24,=
<br>
&gt; @@ -114,6 &#43;118,7 @@ static const struct kfd_device_info hawaii_dev=
ice_info =3D {<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp; static const struct kfd_device_info tonga_device_info =3D =
{<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .asic_family =3D CHIP_TONGA,=
<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; .asic_name =3D &quot;tonga&quot;,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_pasid_bits =3D 16,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_no_of_hqd&nbsp; =3D 24,=
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .doorbell_size&nbsp; =3D 4,<=
br>
&gt; @@ -131,6 &#43;136,7 @@ static const struct kfd_device_info tonga_devi=
ce_info =3D {<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp; static const struct kfd_device_info fiji_device_info =3D {=
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .asic_family =3D CHIP_FIJI,<=
br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; .asic_name =3D &quot;fiji&quot;,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_pasid_bits =3D 16,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_no_of_hqd&nbsp; =3D 24,=
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .doorbell_size&nbsp; =3D 4,<=
br>
&gt; @@ -148,6 &#43;154,7 @@ static const struct kfd_device_info fiji_devic=
e_info =3D {<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp; static const struct kfd_device_info fiji_vf_device_info =
=3D {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .asic_family =3D CHIP_FIJI,<=
br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; .asic_name =3D &quot;fiji&quot;,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_pasid_bits =3D 16,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_no_of_hqd&nbsp; =3D 24,=
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .doorbell_size&nbsp; =3D 4,<=
br>
&gt; @@ -166,6 &#43;173,7 @@ static const struct kfd_device_info fiji_vf_de=
vice_info =3D {<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp; static const struct kfd_device_info polaris10_device_info =
=3D {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .asic_family =3D CHIP_POLARI=
S10,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; .asic_name =3D &quot;polaris10&quot;,<br=
>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_pasid_bits =3D 16,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_no_of_hqd&nbsp; =3D 24,=
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .doorbell_size&nbsp; =3D 4,<=
br>
&gt; @@ -183,6 &#43;191,7 @@ static const struct kfd_device_info polaris10_=
device_info =3D {<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp; static const struct kfd_device_info polaris10_vf_device_in=
fo =3D {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .asic_family =3D CHIP_POLARI=
S10,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; .asic_name =3D &quot;polaris10&quot;,<br=
>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_pasid_bits =3D 16,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_no_of_hqd&nbsp; =3D 24,=
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .doorbell_size&nbsp; =3D 4,<=
br>
&gt; @@ -200,6 &#43;209,7 @@ static const struct kfd_device_info polaris10_=
vf_device_info =3D {<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp; static const struct kfd_device_info polaris11_device_info =
=3D {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .asic_family =3D CHIP_POLARI=
S11,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; .asic_name =3D &quot;polaris11&quot;,<br=
>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_pasid_bits =3D 16,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_no_of_hqd&nbsp; =3D 24,=
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .doorbell_size&nbsp; =3D 4,<=
br>
&gt; @@ -217,6 &#43;227,7 @@ static const struct kfd_device_info polaris11_=
device_info =3D {<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp; static const struct kfd_device_info polaris12_device_info =
=3D {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .asic_family =3D CHIP_POLARI=
S12,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; .asic_name =3D &quot;polaris12&quot;,<br=
>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_pasid_bits =3D 16,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_no_of_hqd&nbsp; =3D 24,=
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .doorbell_size&nbsp; =3D 4,<=
br>
&gt; @@ -234,6 &#43;245,7 @@ static const struct kfd_device_info polaris12_=
device_info =3D {<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp; static const struct kfd_device_info vegam_device_info =3D =
{<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .asic_family =3D CHIP_VEGAM,=
<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; .asic_name =3D &quot;vegam&quot;,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_pasid_bits =3D 16,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_no_of_hqd&nbsp; =3D 24,=
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .doorbell_size&nbsp; =3D 4,<=
br>
&gt; @@ -251,6 &#43;263,7 @@ static const struct kfd_device_info vegam_devi=
ce_info =3D {<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp; static const struct kfd_device_info vega10_device_info =3D=
 {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .asic_family =3D CHIP_VEGA10=
,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; .asic_name =3D &quot;vega10&quot;,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_pasid_bits =3D 16,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_no_of_hqd&nbsp; =3D 24,=
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .doorbell_size&nbsp; =3D 8,<=
br>
&gt; @@ -268,6 &#43;281,7 @@ static const struct kfd_device_info vega10_dev=
ice_info =3D {<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp; static const struct kfd_device_info vega10_vf_device_info =
=3D {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .asic_family =3D CHIP_VEGA10=
,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; .asic_name =3D &quot;vega10&quot;,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_pasid_bits =3D 16,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_no_of_hqd&nbsp; =3D 24,=
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .doorbell_size&nbsp; =3D 8,<=
br>
&gt; @@ -285,6 &#43;299,7 @@ static const struct kfd_device_info vega10_vf_=
device_info =3D {<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp; static const struct kfd_device_info vega12_device_info =3D=
 {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .asic_family =3D CHIP_VEGA12=
,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; .asic_name =3D &quot;vega12&quot;,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_pasid_bits =3D 16,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_no_of_hqd&nbsp; =3D 24,=
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .doorbell_size&nbsp; =3D 8,<=
br>
&gt; @@ -302,6 &#43;317,7 @@ static const struct kfd_device_info vega12_dev=
ice_info =3D {<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp; static const struct kfd_device_info vega20_device_info =3D=
 {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .asic_family =3D CHIP_VEGA20=
,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; .asic_name =3D &quot;vega20&quot;,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_pasid_bits =3D 16,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_no_of_hqd&nbsp; =3D 24,=
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .doorbell_size&nbsp; =3D 8,<=
br>
&gt; @@ -319,6 &#43;335,7 @@ static const struct kfd_device_info vega20_dev=
ice_info =3D {<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp; static const struct kfd_device_info arcturus_device_info =
=3D {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .asic_family =3D CHIP_ARCTUR=
US,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; .asic_name =3D &quot;arcturus&quot;,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_pasid_bits =3D 16,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_no_of_hqd&nbsp; =3D 24,=
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .doorbell_size&nbsp; =3D 8,<=
br>
&gt; @@ -336,6 &#43;353,7 @@ static const struct kfd_device_info arcturus_d=
evice_info =3D {<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp; static const struct kfd_device_info navi10_device_info =3D=
 {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .asic_family =3D CHIP_NAVI10=
,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; .asic_name =3D &quot;navi10&quot;,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_pasid_bits =3D 16,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_no_of_hqd&nbsp; =3D 24,=
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .doorbell_size&nbsp; =3D 8,<=
br>
&gt; diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/a=
md/amdkfd/kfd_priv.h<br>
&gt; index 9b9a8da187c8..06bb2d7a9b39 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h<br>
&gt; @@ -195,6 &#43;195,7 @@ struct kfd_event_interrupt_class {<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp; struct kfd_device_info {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enum amd_asic_type asic_fami=
ly;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; const char *asic_name;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const struct kfd_event_inter=
rupt_class *event_interrupt_class;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned int max_pasid_bits;=
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned int max_no_of_hqd;<=
br>
&gt; diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c b/drivers/gpu/d=
rm/amd/amdkfd/kfd_topology.c<br>
&gt; index 36fa98fe858b..7551761f2aa9 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c<br>
&gt; @@ -406,8 &#43;406,6 @@ static ssize_t node_show(struct kobject *kobj,=
 struct attribute *attr,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; char *buffer)<br>
&gt;&nbsp;&nbsp; {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct kfd_topology_device *=
dev;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; char public_name[KFD_TOPOLOGY_PUBLIC_NAME_SI=
ZE];<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; uint32_t i;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t log_max_watch_addr;=
<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Making sure that the buff=
er is an empty string */<br>
&gt; @@ -422,14 &#43;420,8 @@ static ssize_t node_show(struct kobject *kobj=
, struct attribute *attr,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strcmp(attr-&gt;name, &q=
uot;name&quot;) =3D=3D 0) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; dev =3D container_of(attr, struct kfd_topology_device,<=
br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; attr_name);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; for (i =3D 0; i &lt; KFD_TOPOLOGY_PUBLIC_NAME_SIZE; i&#43;&#43;) {<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; public_name[i] =3D<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (c=
har)dev-&gt;node_props.marketing_name[i];<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (dev-&gt;node_props.=
marketing_name[i] =3D=3D 0)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; }<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; public_name[KFD_TOPOLOGY_PUBLIC_NAME_SIZE-1] =3D 0x0;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return sysfs_show_str_val(buffer, public_name);<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; return sysfs_show_str_val(buffer, dev-&gt;node_props.name);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev =3D container_of(attr, s=
truct kfd_topology_device,<br>
&gt; @@ -1274,6 &#43;1266,10 @@ int kfd_topology_add_device(struct kfd_dev =
*gpu)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_amdkfd_get_cu_info(de=
v-&gt;gpu-&gt;kgd, &amp;cu_info);<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; strncpy(dev-&gt;node_props.name, gpu-&gt=
;device_info-&gt;asic_name,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; KFD_TOPOLOGY_PUBLIC=
_NAME_SIZE);<br>
&gt; &#43;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev-&gt;node_props.simd_arra=
ys_per_engine =3D<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; cu_info.num_shader_arrays_per_engine;<br>
&gt;&nbsp;&nbsp; <br>
&gt; diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_topology.h b/drivers/gpu/d=
rm/amd/amdkfd/kfd_topology.h<br>
&gt; index 276354aa0fcc..d4718d58d0f2 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdkfd/kfd_topology.h<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/amdkfd/kfd_topology.h<br>
&gt; @@ -27,7 &#43;27,7 @@<br>
&gt;&nbsp;&nbsp; #include &lt;linux/list.h&gt;<br>
&gt;&nbsp;&nbsp; #include &quot;kfd_crat.h&quot;<br>
&gt;&nbsp;&nbsp; <br>
&gt; -#define KFD_TOPOLOGY_PUBLIC_NAME_SIZE 128<br>
&gt; &#43;#define KFD_TOPOLOGY_PUBLIC_NAME_SIZE 32<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp; #define HSA_CAP_HOT_PLUGGABLE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x00000001<br>
&gt;&nbsp;&nbsp; #define HSA_CAP_ATS_PRESENT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x0000000=
2<br>
&gt; @@ -81,7 &#43;81,7 @@ struct kfd_node_properties {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int32_t&nbsp; drm_render_min=
or;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t num_sdma_engines;<b=
r>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t num_sdma_xgmi_engin=
es;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; uint16_t marketing_name[KFD_TOPOLOGY_PUBLIC_=
NAME_SIZE];<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; char name[KFD_TOPOLOGY_PUBLIC_NAME_SIZE]=
;<br>
&gt;&nbsp;&nbsp; };<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp; #define HSA_MEM_HEAP_TYPE_SYSTEM&nbsp;&nbsp;&nbsp; 0<br>
</div>
</span></font></div>
</body>
</html>

--_000_DM6PR12MB27787E0DEC3F3CB26EFA4573F0AF0DM6PR12MB2778namp_--

--===============0402469317==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0402469317==--
