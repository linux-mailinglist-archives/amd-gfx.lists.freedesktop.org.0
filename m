Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD2E396C89
	for <lists+amd-gfx@lfdr.de>; Tue,  1 Jun 2021 06:56:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F27E6E81C;
	Tue,  1 Jun 2021 04:56:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2046.outbound.protection.outlook.com [40.107.220.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C35656E81C
 for <amd-gfx@lists.freedesktop.org>; Tue,  1 Jun 2021 04:56:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kWOLFVKA7+OvEgEavx9zkabiZv2/uRoDBEgpjhEn1Blu1nS5x6+66ITca18XVuDa14d5wTOzvj2oQBxVzDH9g/FIPLdqrlaYStkdMLzGEgaNE50uQmXlt3hwvu4QmH3e3vKh7zwLNCInusZIzlCyOEBvm/fzbdJ9cLYMoyTiKWCldmfS7P3CbtALwcgigxpBVYpWIYMfMTzMvXQ+KUCCqexwLPsDTyWQgx8cGeNuppycZu70cqQCblbPmpwuMi6e/yxbm1Wa7wcWhWf0njADv6rwerb7xWPA/1tztCbSIHfV9fFtUZM3gyJpU1DVsNKRgGQ2kmZGNiEo5LOuZITmyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yG+XQoA+O5pKVY+PSQE9WThbHqnTomEbGkmnZ4XbgAM=;
 b=dT39JtTcLkJiLnzA/Kn6EXaCucmNEu2MYDSXbgWWzmo/Uj2zu4nhW+9uJ+QEp+T3EjwYiMqcFSXuB0szbkvSPmYcR9/w0i69ZVtCx2IvEFIMje47t54AMVdWHR6iLB8myWfuBIodRmb54npC07KuYrNWR3ikYjPDsLzvpba0g1S2fwAKpdP6V1VJr/1V4jntzFZj1W9KoEPCS/EHlEaNA5R5kF0yMxmwHvdW14H8qnZfS+3T/sKFH6kLvjZ17/nrkA3CYwdOqjOhjJ5r5d3R7VetXEjFL2kMLp1+x9o0h4XUs9KRP+Eh9F6IiC2sfuncrsb+ZZBFcUnEQRbRLI8f3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yG+XQoA+O5pKVY+PSQE9WThbHqnTomEbGkmnZ4XbgAM=;
 b=h8VLrMzZYvsH7BB5aIUkOq7QirwJOPl+kH4R0K7ZxUXGpwAVSl+DIwoSkkb8ykyiL469DPYQC3pfwFn3sUhpNTykw1FfYPBw72ATTTZ5ilSK+k+ZDEG2LbnRE96nDRoobFxdpsbQ5ma9AsXqvVmH8tsrYaGlyIS/muQr7ulWt1E=
Received: from CH0PR12MB5348.namprd12.prod.outlook.com (2603:10b6:610:d7::9)
 by CH0PR12MB5107.namprd12.prod.outlook.com (2603:10b6:610:be::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.22; Tue, 1 Jun
 2021 04:56:17 +0000
Received: from CH0PR12MB5348.namprd12.prod.outlook.com
 ([fe80::9c3:508d:5340:8efd]) by CH0PR12MB5348.namprd12.prod.outlook.com
 ([fe80::9c3:508d:5340:8efd%6]) with mapi id 15.20.4173.030; Tue, 1 Jun 2021
 04:56:17 +0000
From: "Lazar, Lijo" <Lijo.Lazar@amd.com>
To: "Powell, Darren" <Darren.Powell@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 2/6] amdgpu/pm: clean up smu_get_power_limit function
 signature
Thread-Topic: [PATCH 2/6] amdgpu/pm: clean up smu_get_power_limit function
 signature
Thread-Index: AQHXVBYfNEWgrbBnYkyNpITBdXGwIqr9G+QAgAEi8gCAAFqvYA==
Date: Tue, 1 Jun 2021 04:56:17 +0000
Message-ID: <CH0PR12MB5348DB50C9C32FB21586F41C973E9@CH0PR12MB5348.namprd12.prod.outlook.com>
References: <20210528230621.16468-1-darren.powell@amd.com>
 <20210528230621.16468-3-darren.powell@amd.com>,
 <CH0PR12MB5348CD424C6F4A5E0A064598973F9@CH0PR12MB5348.namprd12.prod.outlook.com>
 <DM6PR12MB2954B3E943CD476445C945E9F03F9@DM6PR12MB2954.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB2954B3E943CD476445C945E9F03F9@DM6PR12MB2954.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2021-06-01T04:56:10Z; 
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Standard;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [165.204.159.242]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8d80db7e-220f-4472-33af-08d924b99727
x-ms-traffictypediagnostic: CH0PR12MB5107:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH0PR12MB510728BF997082CA986C36B7973E9@CH0PR12MB5107.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xQyVzJ0KamyJZ9srnMC1iKIWkEZoFCU16e7oXRqsko3fE6CLZ8yitaqKySSFKF4DL6708KU2FoLZhkO2JrJ+/2UTnbNI8TRXX16OvgdIQID2VEOuqbAZsP3n798VD45JJxlIvV9dGfTgLE3r7e2a9pqPkp8vWPfFrW6EYNerwj58wFaDielk5kmds9EDrx9RvIAEwdcjiim4Q8RsPwmIYNzBZ8b/26J/RajNKi174L184BrFElEJTAiL9UEGgmajnVI/UZRWFKRM6yiAD1gnaEFc2+cIXAShi72QcjEgY+ltHSfe/aWR/d5+UTen5F+4zaBv5cDqoydfLORxWbQxcrj7v48ep26Vjfyo14OJ0LZUQFmXrIm2lypVwWgZhj8Y5paHeGxTkRwA7zNMtetekvlNvGQbfy+nZT+RPiW1GEUcTdtBFLMktX4VtUu2ebjtT/oxqfTCAy7mNozVPzEe+a2FdUsgBkhOWM4L3KBybrUp0Aj5yVHCXnZai++f9P9M90wTo+aBqRkU06AedGNo9BxNxWiLmN6ldmz5h92Yb9trHb/oCNJt90NKO1HucCpmVL0wj9auoKVasDnV5JDuQ1+65vseY/Nvfut4togZRmI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB5348.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(396003)(366004)(39860400002)(136003)(186003)(5660300002)(478600001)(55016002)(86362001)(66556008)(66446008)(122000001)(66476007)(53546011)(52536014)(26005)(64756008)(6506007)(66946007)(8676002)(76116006)(33656002)(71200400001)(8936002)(9686003)(2906002)(110136005)(316002)(7696005)(83380400001)(38100700002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?Csj1sDNV9msKm3csDU+Q4+ah7aoJjK5X/+0mSWORvGyMalS1/Lp2hscmCYKO?=
 =?us-ascii?Q?JaERDhMn5XmiRcL43j1n61xNx9Ae5JTj798T+p7aYowqGvKVXzwTFmATLyUr?=
 =?us-ascii?Q?eF5kBKShATys3OPhsXO4pho/eId2jfSN24gcfbFbjpISax/AmdH+B2ZYvsR3?=
 =?us-ascii?Q?wMBQcIvLGfpzzC5x//ADas6U9rzKJn2VkzT4zaiHRJRz6bAhdap4HTDO2/lR?=
 =?us-ascii?Q?ZToyl8cETLOPp8e/hAfnCnBRrjcT5gnFCc6OqmX5bcZ4lmaHuZqVypKbq6Bm?=
 =?us-ascii?Q?UAFrtsTpD1N6HafrrwVMokIabsos7qreUmmGgry1vzhlGSp4OHk97PvGMgzO?=
 =?us-ascii?Q?SnV3I/VGw2ndl+CLWxnvb/3PnOGN+EJuvtNmdqG4UrvAAxgG/nH0/CHTy97p?=
 =?us-ascii?Q?7Mu1zlVH80y3RRtYKd9IM50GsgiwGdZ04ZnATzpIIaxCxcbE/GFJxXkiKvRH?=
 =?us-ascii?Q?fnyzRHPcm/7oVZNZRPdjakfwc5+X/fbcYtcp7ldHclk6nVvhcyJy3fO/IOQK?=
 =?us-ascii?Q?671/B6RW2wh60s7GAR3nOKz4xSSCBiWIaqwDZqYALMf6MVMmTE1wCvdeA8Dt?=
 =?us-ascii?Q?NENyJLlDMkCw4RnkWqpJPuUboRTqXdsAZ8PfI9/c57vxoBCDLzaA2txyowvq?=
 =?us-ascii?Q?avmUakzY7ATeof4QBnvgwXh3eg9m9SUXky2NNvOB/GD0uVlleDBJMW/S9lci?=
 =?us-ascii?Q?7b2BIJIOg7NffI9tmmn78rsM4LfXI3+b9Cln0daFXRr52ohJE+XlJGBkn/St?=
 =?us-ascii?Q?m8l8dB/GapX3SNfTtnPBcOOs/wIspBxLL3Npq4vMuvF/R9wJeQVu/OxYZuHO?=
 =?us-ascii?Q?X1Stpl5AzuOgEDHn91AZ/6mLj8qEopW3FYs2AwjbQXFFP6bGMJYPbLIwwjKe?=
 =?us-ascii?Q?uBGwscub/rwvyapw0ifo22HvzOfKuOyYeefTgt1UZU5t9AuNA2Qplj5ORXrI?=
 =?us-ascii?Q?niLJHm4Mlogyhk2OfVyk0aYLatx94ZjTydmOgDqOgAtXT8y4gxGWuaRpOUlk?=
 =?us-ascii?Q?ie+OOQztgAI++oU5YnpiTeQ//Tjguvq/A05/PbmNfV6YVpLJgERt7mSppZ3w?=
 =?us-ascii?Q?Fz71oxZMuXb//MRg2gaG3uKGvUpNpFipzhr+kFM9bIAlvsmBSJREfL5f5a/z?=
 =?us-ascii?Q?kWiAjO0ghkiwUlATPEJPkSU4NIkGyGzKpfVkDYoawnw/NA5AciDDZNAHaTQv?=
 =?us-ascii?Q?5HILR+YEzKJOs0hlIU5hY3Vz4mBBIdrViuSlpNlI+gR7tmY4fJV5z4+MrPvR?=
 =?us-ascii?Q?OTf4+p2lcj6k0JbPWYvUoDUIaAV1B/qQasfHFl3bxNu2wFVug8/WnOkSTctW?=
 =?us-ascii?Q?NitsBDLi5lIsmw/44VQ3lnr2?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5348.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d80db7e-220f-4472-33af-08d924b99727
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2021 04:56:17.1829 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zm+FvWuJOmuBfZE6FxJQQ4Ewpiaj3sgYKrqDvpYkKjYVdYgprYF8+md6tfti59rd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5107
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
Content-Type: multipart/mixed; boundary="===============0732257761=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0732257761==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_CH0PR12MB5348DB50C9C32FB21586F41C973E9CH0PR12MB5348namp_"

--_000_CH0PR12MB5348DB50C9C32FB21586F41C973E9CH0PR12MB5348namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[Public]

May be just call it power_limit or power_cap similar to hwmon. The various =
limits correspond to hwmon power[1-*]_cap and levels correspond to min/ max=
 etc.

Thanks,
Lijo

From: Powell, Darren <Darren.Powell@amd.com>
Sent: Tuesday, June 1, 2021 4:50 AM
To: Lazar, Lijo <Lijo.Lazar@amd.com>; amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH 2/6] amdgpu/pm: clean up smu_get_power_limit function s=
ignature


[Public]


>< > The limits are not limited to sample window. There are limits like APU=
 only limit, platform limit and totally obscure ones like PPT0/PPT1 etc.
>It's better that the new enum takes care of those as well in case there is=
 a need to make them available through sysfs.

I think you mean something more like this?
+ enum pp_power_constraints
+{
+       PP_PWR_CONSTRAINT_DEFAULT,
+       PP_PWR_CONSTRAINT_FASTWINDOW,
+};
+


________________________________
From: Lazar, Lijo <Lijo.Lazar@amd.com<mailto:Lijo.Lazar@amd.com>>
Sent: Monday, May 31, 2021 2:04 AM
To: Powell, Darren <Darren.Powell@amd.com<mailto:Darren.Powell@amd.com>>; a=
md-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org> <amd-gfx=
@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>>
Subject: RE: [PATCH 2/6] amdgpu/pm: clean up smu_get_power_limit function s=
ignature

[Public]



-----Original Message-----
From: Powell, Darren <Darren.Powell@amd.com<mailto:Darren.Powell@amd.com>>
Sent: Saturday, May 29, 2021 4:36 AM
To: amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>
Cc: Powell, Darren <Darren.Powell@amd.com<mailto:Darren.Powell@amd.com>>
Subject: [PATCH 2/6] amdgpu/pm: clean up smu_get_power_limit function signa=
ture

 add two new powerplay enums (limit_level, sample_window)  add enums to smu=
_get_power_limit signature  remove input bitfield stuffing of output variab=
le limit  update calls to smu_get_power_limit

* Test
 AMDGPU_PCI_ADDR=3D`lspci -nn | grep "VGA\|Display" | cut -d " " -f 1`  AMD=
GPU_HWMON=3D`ls -la /sys/class/hwmon | grep $AMDGPU_PCI_ADDR | cut -d " " -=
f 10`  HWMON_DIR=3D/sys/class/hwmon/${AMDGPU_HWMON}

 lspci -nn | grep "VGA\|Display" ; \
 echo "=3D=3D=3D power1 cap =3D=3D=3D" ; cat $HWMON_DIR/power1_cap ;       =
    \
 echo "=3D=3D=3D power1 cap max =3D=3D=3D" ; cat $HWMON_DIR/power1_cap_max =
;   \
 echo "=3D=3D=3D power1 cap def =3D=3D=3D" ; cat $HWMON_DIR/power1_cap_defa=
ult

Signed-off-by: Darren Powell <darren.powell@amd.com<mailto:darren.powell@am=
d.com>>
---
 .../gpu/drm/amd/include/kgd_pp_interface.h    | 14 ++++++++
 drivers/gpu/drm/amd/pm/amdgpu_pm.c            | 18 +++++-----
 drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h       |  3 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c     | 34 +++++++++++++++++--
 4 files changed, 57 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/include/kgd_pp_interface.h b/drivers/gpu/d=
rm/amd/include/kgd_pp_interface.h
index b1cd52a9d684..ddbf802ea8ad 100644
--- a/drivers/gpu/drm/amd/include/kgd_pp_interface.h
+++ b/drivers/gpu/drm/amd/include/kgd_pp_interface.h
@@ -192,6 +192,20 @@ enum pp_df_cstate {
         DF_CSTATE_ALLOW,
 };

+enum pp_power_limit_level
+{
+       PP_PWR_LIMIT_MIN =3D -1,
+       PP_PWR_LIMIT_CURRENT,
+       PP_PWR_LIMIT_DEFAULT,
+       PP_PWR_LIMIT_MAX,
+};
+
+ enum pp_power_sample_window
+{
+       PP_PWR_WINDOW_DEFAULT,
+       PP_PWR_WINDOW_FAST,
+};
+

< > The limits are not limited to sample window. There are limits like APU =
only limit, platform limit and totally obscure ones like PPT0/PPT1 etc.
It's better that the new enum takes care of those as well in case there is =
a need to make them available through sysfs.

Thanks,
Lijo

 #define PP_GROUP_MASK        0xF0000000
 #define PP_GROUP_SHIFT       28

diff --git a/drivers/gpu/drm/amd/pm/amdgpu_pm.c b/drivers/gpu/drm/amd/pm/am=
dgpu_pm.c
index 13da377888d2..f7b45803431d 100644
--- a/drivers/gpu/drm/amd/pm/amdgpu_pm.c
+++ b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
@@ -2717,8 +2717,8 @@ static ssize_t amdgpu_hwmon_show_power_cap_max(struct=
 device *dev,  {
         struct amdgpu_device *adev =3D dev_get_drvdata(dev);
         const struct amd_pm_funcs *pp_funcs =3D adev->powerplay.pp_funcs;
-       int limit_type =3D to_sensor_dev_attr(attr)->index;
-       uint32_t limit =3D limit_type << 24;
+       enum pp_power_sample_window sample_window =3D to_sensor_dev_attr(at=
tr)->index;
+       uint32_t limit;
         uint32_t max_limit =3D 0;
         ssize_t size;
         int r;
@@ -2735,7 +2735,7 @@ static ssize_t amdgpu_hwmon_show_power_cap_max(struct=
 device *dev,
         }

         if (is_support_sw_smu(adev)) {
-               smu_get_power_limit(&adev->smu, &limit, SMU_PPT_LIMIT_MAX);
+               smu_get_power_limit(&adev->smu, &limit, PP_PWR_LIMIT_MAX,
+sample_window);
                 size =3D snprintf(buf, PAGE_SIZE, "%u\n", limit * 1000000)=
;
         } else if (pp_funcs && pp_funcs->get_power_limit) {
                 pp_funcs->get_power_limit(adev->powerplay.pp_handle,
@@ -2757,8 +2757,8 @@ static ssize_t amdgpu_hwmon_show_power_cap(struct dev=
ice *dev,  {
         struct amdgpu_device *adev =3D dev_get_drvdata(dev);
         const struct amd_pm_funcs *pp_funcs =3D adev->powerplay.pp_funcs;
-       int limit_type =3D to_sensor_dev_attr(attr)->index;
-       uint32_t limit =3D limit_type << 24;
+       enum pp_power_sample_window sample_window =3D to_sensor_dev_attr(at=
tr)->index;
+       uint32_t limit;
         ssize_t size;
         int r;

@@ -2774,7 +2774,7 @@ static ssize_t amdgpu_hwmon_show_power_cap(struct dev=
ice *dev,
         }

         if (is_support_sw_smu(adev)) {
-               smu_get_power_limit(&adev->smu, &limit, SMU_PPT_LIMIT_CURRE=
NT);
+               smu_get_power_limit(&adev->smu, &limit, PP_PWR_LIMIT_CURREN=
T,
+sample_window);
                 size =3D snprintf(buf, PAGE_SIZE, "%u\n", limit * 1000000)=
;
         } else if (pp_funcs && pp_funcs->get_power_limit) {
                 pp_funcs->get_power_limit(adev->powerplay.pp_handle,
@@ -2796,8 +2796,8 @@ static ssize_t amdgpu_hwmon_show_power_cap_default(st=
ruct device *dev,  {
         struct amdgpu_device *adev =3D dev_get_drvdata(dev);
         const struct amd_pm_funcs *pp_funcs =3D adev->powerplay.pp_funcs;
-       int limit_type =3D to_sensor_dev_attr(attr)->index;
-       uint32_t limit =3D limit_type << 24;
+       enum pp_power_sample_window sample_window =3D to_sensor_dev_attr(at=
tr)->index;
+       uint32_t limit;
         ssize_t size;
         int r;

@@ -2813,7 +2813,7 @@ static ssize_t amdgpu_hwmon_show_power_cap_default(st=
ruct device *dev,
         }

         if (is_support_sw_smu(adev)) {
-               smu_get_power_limit(&adev->smu, &limit, SMU_PPT_LIMIT_DEFAU=
LT);
+               smu_get_power_limit(&adev->smu, &limit, PP_PWR_LIMIT_DEFAUL=
T,
+sample_window);
                 size =3D snprintf(buf, PAGE_SIZE, "%u\n", limit * 1000000)=
;
         } else if (pp_funcs && pp_funcs->get_power_limit) {
                 pp_funcs->get_power_limit(adev->powerplay.pp_handle,
diff --git a/drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h b/drivers/gpu/drm/amd/=
pm/inc/amdgpu_smu.h
index 523f9d2982e9..b97b960c2eac 100644
--- a/drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h
+++ b/drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h
@@ -1262,7 +1262,8 @@ enum smu_cmn2asic_mapping_type {  #if !defined(SWSMU_=
CODE_LAYER_L2) && !defined(SWSMU_CODE_LAYER_L3) && !defined(SWSMU_CODE_LAYE=
R_L4)  int smu_get_power_limit(struct smu_context *smu,
                         uint32_t *limit,
-                       enum smu_ppt_limit_level limit_level);
+                       enum pp_power_limit_level pp_limit_level,
+                       enum pp_power_sample_window sample_window);

 bool smu_mode1_reset_is_support(struct smu_context *smu);  bool smu_mode2_=
reset_is_support(struct smu_context *smu); diff --git a/drivers/gpu/drm/amd=
/pm/swsmu/amdgpu_smu.c b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
index 8aff67a667fa..44c1baa2748d 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
@@ -2168,14 +2168,44 @@ static int smu_set_fan_speed_rpm(void *handle, uint=
32_t speed)

 int smu_get_power_limit(struct smu_context *smu,
                         uint32_t *limit,
-                       enum smu_ppt_limit_level limit_level)
+                       enum pp_power_limit_level pp_limit_level,
+                       enum pp_power_sample_window sample_window)
 {
-       uint32_t limit_type =3D *limit >> 24;
+       enum smu_ppt_limit_level limit_level;
+       uint32_t limit_type;
         int ret =3D 0;

         if (!smu->pm_enabled || !smu->adev->pm.dpm_enabled)
                 return -EOPNOTSUPP;

+       switch(sample_window) {
+       case PP_PWR_WINDOW_DEFAULT:
+               limit_type =3D SMU_DEFAULT_PPT_LIMIT;
+               break;
+       case PP_PWR_WINDOW_FAST:
+               limit_type =3D SMU_FAST_PPT_LIMIT;
+               break;
+       default:
+               return -EOPNOTSUPP;
+               break;
+       }
+
+       switch(pp_limit_level){
+       case PP_PWR_LIMIT_CURRENT:
+               limit_level =3D SMU_PPT_LIMIT_CURRENT;
+               break;
+       case PP_PWR_LIMIT_DEFAULT:
+               limit_level =3D SMU_PPT_LIMIT_DEFAULT;
+               break;
+       case PP_PWR_LIMIT_MAX:
+               limit_level =3D SMU_PPT_LIMIT_MAX;
+               break;
+       case PP_PWR_LIMIT_MIN:
+       default:
+               return -EOPNOTSUPP;
+               break;
+       }
+
         mutex_lock(&smu->mutex);

         if (limit_type !=3D SMU_DEFAULT_PPT_LIMIT) {
--
2.25.1

--_000_CH0PR12MB5348DB50C9C32FB21586F41C973E9CH0PR12MB5348namp_
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
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"Segoe UI";
	panose-1:2 11 5 2 4 2 4 2 2 3;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
span.EmailStyle18
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
p.msipheaderc10f11a2, li.msipheaderc10f11a2, div.msipheaderc10f11a2
	{mso-style-name:msipheaderc10f11a2;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"msipheaderc10f11a2" style=3D"margin:0in"><span style=3D"font-si=
ze:10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:green">[Public]</s=
pan><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">May be just call it power_limit or power_cap similar=
 to hwmon. The various limits correspond to hwmon power[1-*]_cap and levels=
 correspond to min/ max etc.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Lijo<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b>From:</b> Powell, Darren &lt;Darren.Powell@amd.co=
m&gt; <br>
<b>Sent:</b> Tuesday, June 1, 2021 4:50 AM<br>
<b>To:</b> Lazar, Lijo &lt;Lijo.Lazar@amd.com&gt;; amd-gfx@lists.freedeskto=
p.org<br>
<b>Subject:</b> Re: [PATCH 2/6] amdgpu/pm: clean up smu_get_power_limit fun=
ction signature<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p style=3D"margin:15.0pt"><span style=3D"font-size:10.0pt;font-family:&quo=
t;Arial&quot;,sans-serif;color:green">[Public]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Segoe UI&quot;,sans=
-serif;color:black"><br>
<span style=3D"background:white">&gt;&lt; &gt; The limits are not limited t=
o sample window. There are limits like APU only limit, platform limit and t=
otally obscure ones like PPT0/PPT1 etc.</span><br>
<span style=3D"background:white">&gt;It's better that the new enum takes ca=
re of those as well in case there is a need to make them available through =
sysfs.</span></span><span style=3D"font-size:12.0pt;color:black"><o:p></o:p=
></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">I think=
 you mean something more like this?<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Segoe UI&quot;,sans=
-serif;color:black;background:white">+ enum pp_power_constraints</span><spa=
n style=3D"font-size:12.0pt;color:black"><br>
</span><span style=3D"font-family:&quot;Segoe UI&quot;,sans-serif;color:bla=
ck;background:white">+{</span><span style=3D"font-family:&quot;Segoe UI&quo=
t;,sans-serif;color:black"><br>
<span style=3D"background:white">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PP_P=
WR_CONSTRAINT_DEFAULT,</span><br>
<span style=3D"background:white">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PP_P=
WR_CONSTRAINT_FASTWINDOW,</span><br>
<span style=3D"background:white">+};</span><br>
<span style=3D"background:white">+</span></span><span style=3D"font-size:12=
.0pt;color:black"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
</div>
<div class=3D"MsoNormal" align=3D"center" style=3D"text-align:center">
<hr size=3D"2" width=3D"98%" align=3D"center">
</div>
<div id=3D"divRplyFwdMsg">
<p class=3D"MsoNormal"><b><span style=3D"color:black">From:</span></b><span=
 style=3D"color:black"> Lazar, Lijo &lt;<a href=3D"mailto:Lijo.Lazar@amd.co=
m">Lijo.Lazar@amd.com</a>&gt;<br>
<b>Sent:</b> Monday, May 31, 2021 2:04 AM<br>
<b>To:</b> Powell, Darren &lt;<a href=3D"mailto:Darren.Powell@amd.com">Darr=
en.Powell@amd.com</a>&gt;;
<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.=
org</a> &lt;<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.=
freedesktop.org</a>&gt;<br>
<b>Subject:</b> RE: [PATCH 2/6] amdgpu/pm: clean up smu_get_power_limit fun=
ction signature</span>
<o:p></o:p></p>
<div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
</div>
<div>
<div>
<p class=3D"MsoNormal">[Public]<br>
<br>
<br>
<br>
-----Original Message-----<br>
From: Powell, Darren &lt;<a href=3D"mailto:Darren.Powell@amd.com">Darren.Po=
well@amd.com</a>&gt;
<br>
Sent: Saturday, May 29, 2021 4:36 AM<br>
To: <a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesk=
top.org</a><br>
Cc: Powell, Darren &lt;<a href=3D"mailto:Darren.Powell@amd.com">Darren.Powe=
ll@amd.com</a>&gt;<br>
Subject: [PATCH 2/6] amdgpu/pm: clean up smu_get_power_limit function signa=
ture<br>
<br>
&nbsp;add two new powerplay enums (limit_level, sample_window)&nbsp; add en=
ums to smu_get_power_limit signature&nbsp; remove input bitfield stuffing o=
f output variable limit&nbsp; update calls to smu_get_power_limit<br>
<br>
* Test<br>
&nbsp;AMDGPU_PCI_ADDR=3D`lspci -nn | grep &quot;VGA\|Display&quot; | cut -d=
 &quot; &quot; -f 1`&nbsp; AMDGPU_HWMON=3D`ls -la /sys/class/hwmon | grep $=
AMDGPU_PCI_ADDR | cut -d &quot; &quot; -f 10`&nbsp; HWMON_DIR=3D/sys/class/=
hwmon/${AMDGPU_HWMON}<br>
<br>
&nbsp;lspci -nn | grep &quot;VGA\|Display&quot; ; \<br>
&nbsp;echo &quot;=3D=3D=3D power1 cap =3D=3D=3D&quot; ; cat $HWMON_DIR/powe=
r1_cap ;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&nbsp;echo &quot;=3D=3D=3D power1 cap max =3D=3D=3D&quot; ; cat $HWMON_DIR/=
power1_cap_max ;&nbsp;&nbsp; \<br>
&nbsp;echo &quot;=3D=3D=3D power1 cap def =3D=3D=3D&quot; ; cat $HWMON_DIR/=
power1_cap_default<br>
<br>
Signed-off-by: Darren Powell &lt;<a href=3D"mailto:darren.powell@amd.com">d=
arren.powell@amd.com</a>&gt;<br>
---<br>
&nbsp;.../gpu/drm/amd/include/kgd_pp_interface.h&nbsp;&nbsp;&nbsp; | 14 +++=
+++++<br>
&nbsp;drivers/gpu/drm/amd/pm/amdgpu_pm.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 18 +++++-----<br>
&nbsp;drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; |&nbsp; 3 +-<br>
&nbsp;drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c&nbsp;&nbsp;&nbsp;&nbsp; | 3=
4 +++++++++++++++++--<br>
&nbsp;4 files changed, 57 insertions(+), 12 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/include/kgd_pp_interface.h b/drivers/gpu/d=
rm/amd/include/kgd_pp_interface.h<br>
index b1cd52a9d684..ddbf802ea8ad 100644<br>
--- a/drivers/gpu/drm/amd/include/kgd_pp_interface.h<br>
+++ b/drivers/gpu/drm/amd/include/kgd_pp_interface.h<br>
@@ -192,6 +192,20 @@ enum pp_df_cstate {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DF_CSTATE_ALLOW,<br>
&nbsp;};<br>
&nbsp;<br>
+enum pp_power_limit_level<br>
+{<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PP_PWR_LIMIT_MIN =3D -1,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PP_PWR_LIMIT_CURRENT,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PP_PWR_LIMIT_DEFAULT,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PP_PWR_LIMIT_MAX,<br>
+};<br>
+<br>
+ enum pp_power_sample_window<br>
+{<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PP_PWR_WINDOW_DEFAULT,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PP_PWR_WINDOW_FAST,<br>
+};<br>
+<br>
<br>
&lt; &gt; The limits are not limited to sample window. There are limits lik=
e APU only limit, platform limit and totally obscure ones like PPT0/PPT1 et=
c.
<br>
It's better that the new enum takes care of those as well in case there is =
a need to make them available through sysfs.<br>
<br>
Thanks,<br>
Lijo<br>
<br>
&nbsp;#define PP_GROUP_MASK&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xF00=
00000<br>
&nbsp;#define PP_GROUP_SHIFT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 28<br>
&nbsp;<br>
diff --git a/drivers/gpu/drm/amd/pm/amdgpu_pm.c b/drivers/gpu/drm/amd/pm/am=
dgpu_pm.c<br>
index 13da377888d2..f7b45803431d 100644<br>
--- a/drivers/gpu/drm/amd/pm/amdgpu_pm.c<br>
+++ b/drivers/gpu/drm/amd/pm/amdgpu_pm.c<br>
@@ -2717,8 +2717,8 @@ static ssize_t amdgpu_hwmon_show_power_cap_max(struct=
 device *dev,&nbsp; {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_device *adev=
 =3D dev_get_drvdata(dev);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const struct amd_pm_funcs =
*pp_funcs =3D adev-&gt;powerplay.pp_funcs;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int limit_type =3D to_sensor_dev_attr=
(attr)-&gt;index;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t limit =3D limit_type &lt;&lt=
; 24;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enum pp_power_sample_window sample_wi=
ndow =3D to_sensor_dev_attr(attr)-&gt;index;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t limit;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t max_limit =3D 0;<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ssize_t size;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int r;<br>
@@ -2735,7 +2735,7 @@ static ssize_t amdgpu_hwmon_show_power_cap_max(struct=
 device *dev,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (is_support_sw_smu(adev=
)) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; smu_get_power_limit(&amp;adev-&gt;smu, &amp;limit, SMU_PPT_LIMIT=
_MAX);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; smu_get_power_limit(&amp;adev-&gt;smu, &amp;limit, PP_PWR_LIMIT_=
MAX, <br>
+sample_window);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; size =3D snprintf(buf, PAGE_SIZE, &quot;%u\n&quot;, l=
imit * 1000000);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else if (pp_funcs &amp;&=
amp; pp_funcs-&gt;get_power_limit) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; pp_funcs-&gt;get_power_limit(adev-&gt;powerplay.pp_ha=
ndle,<br>
@@ -2757,8 +2757,8 @@ static ssize_t amdgpu_hwmon_show_power_cap(struct dev=
ice *dev,&nbsp; {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_device *adev=
 =3D dev_get_drvdata(dev);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const struct amd_pm_funcs =
*pp_funcs =3D adev-&gt;powerplay.pp_funcs;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int limit_type =3D to_sensor_dev_attr=
(attr)-&gt;index;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t limit =3D limit_type &lt;&lt=
; 24;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enum pp_power_sample_window sample_wi=
ndow =3D to_sensor_dev_attr(attr)-&gt;index;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t limit;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ssize_t size;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int r;<br>
&nbsp;<br>
@@ -2774,7 +2774,7 @@ static ssize_t amdgpu_hwmon_show_power_cap(struct dev=
ice *dev,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (is_support_sw_smu(adev=
)) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; smu_get_power_limit(&amp;adev-&gt;smu, &amp;limit, SMU_PPT_LIMIT=
_CURRENT);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; smu_get_power_limit(&amp;adev-&gt;smu, &amp;limit, PP_PWR_LIMIT_=
CURRENT, <br>
+sample_window);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; size =3D snprintf(buf, PAGE_SIZE, &quot;%u\n&quot;, l=
imit * 1000000);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else if (pp_funcs &amp;&=
amp; pp_funcs-&gt;get_power_limit) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; pp_funcs-&gt;get_power_limit(adev-&gt;powerplay.pp_ha=
ndle,<br>
@@ -2796,8 +2796,8 @@ static ssize_t amdgpu_hwmon_show_power_cap_default(st=
ruct device *dev,&nbsp; {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_device *adev=
 =3D dev_get_drvdata(dev);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const struct amd_pm_funcs =
*pp_funcs =3D adev-&gt;powerplay.pp_funcs;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int limit_type =3D to_sensor_dev_attr=
(attr)-&gt;index;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t limit =3D limit_type &lt;&lt=
; 24;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enum pp_power_sample_window sample_wi=
ndow =3D to_sensor_dev_attr(attr)-&gt;index;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t limit;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ssize_t size;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int r;<br>
&nbsp;<br>
@@ -2813,7 +2813,7 @@ static ssize_t amdgpu_hwmon_show_power_cap_default(st=
ruct device *dev,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (is_support_sw_smu(adev=
)) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; smu_get_power_limit(&amp;adev-&gt;smu, &amp;limit, SMU_PPT_LIMIT=
_DEFAULT);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; smu_get_power_limit(&amp;adev-&gt;smu, &amp;limit, PP_PWR_LIMIT_=
DEFAULT, <br>
+sample_window);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; size =3D snprintf(buf, PAGE_SIZE, &quot;%u\n&quot;, l=
imit * 1000000);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else if (pp_funcs &amp;&=
amp; pp_funcs-&gt;get_power_limit) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; pp_funcs-&gt;get_power_limit(adev-&gt;powerplay.pp_ha=
ndle,<br>
diff --git a/drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h b/drivers/gpu/drm/amd/=
pm/inc/amdgpu_smu.h<br>
index 523f9d2982e9..b97b960c2eac 100644<br>
--- a/drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h<br>
+++ b/drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h<br>
@@ -1262,7 +1262,8 @@ enum smu_cmn2asic_mapping_type {&nbsp; #if !defined(S=
WSMU_CODE_LAYER_L2) &amp;&amp; !defined(SWSMU_CODE_LAYER_L3) &amp;&amp; !de=
fined(SWSMU_CODE_LAYER_L4)&nbsp; int smu_get_power_limit(struct smu_context=
 *smu,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint3=
2_t *limit,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enum smu_ppt_lim=
it_level limit_level);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enum pp_power_li=
mit_level pp_limit_level,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enum pp_power_sa=
mple_window sample_window);<br>
&nbsp;<br>
&nbsp;bool smu_mode1_reset_is_support(struct smu_context *smu);&nbsp; bool =
smu_mode2_reset_is_support(struct smu_context *smu); diff --git a/drivers/g=
pu/drm/amd/pm/swsmu/amdgpu_smu.c b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.=
c<br>
index 8aff67a667fa..44c1baa2748d 100644<br>
--- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c<br>
+++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c<br>
@@ -2168,14 +2168,44 @@ static int smu_set_fan_speed_rpm(void *handle, uint=
32_t speed)<br>
&nbsp;<br>
&nbsp;int smu_get_power_limit(struct smu_context *smu,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint3=
2_t *limit,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enum smu_ppt_lim=
it_level limit_level)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enum pp_power_li=
mit_level pp_limit_level,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enum pp_power_sa=
mple_window sample_window)<br>
&nbsp;{<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t limit_type =3D *limit &gt;&g=
t; 24;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enum smu_ppt_limit_level limit_level;=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t limit_type;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret =3D 0;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!smu-&gt;pm_enabled ||=
 !smu-&gt;adev-&gt;pm.dpm_enabled)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return -EOPNOTSUPP;<br>
&nbsp;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switch(sample_window) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case PP_PWR_WINDOW_DEFAULT:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; limit_type =3D SMU_DEFAULT_PPT_LIMIT;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case PP_PWR_WINDOW_FAST:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; limit_type =3D SMU_FAST_PPT_LIMIT;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return -EOPNOTSUPP;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switch(pp_limit_level){<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case PP_PWR_LIMIT_CURRENT:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; limit_level =3D SMU_PPT_LIMIT_CURRENT;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case PP_PWR_LIMIT_DEFAULT:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; limit_level =3D SMU_PPT_LIMIT_DEFAULT;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case PP_PWR_LIMIT_MAX:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; limit_level =3D SMU_PPT_LIMIT_MAX;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case PP_PWR_LIMIT_MIN:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return -EOPNOTSUPP;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mutex_lock(&amp;smu-&gt;mu=
tex);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (limit_type !=3D SMU_DE=
FAULT_PPT_LIMIT) {<br>
--<br>
2.25.1<o:p></o:p></p>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_CH0PR12MB5348DB50C9C32FB21586F41C973E9CH0PR12MB5348namp_--

--===============0732257761==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--===============0732257761==--
