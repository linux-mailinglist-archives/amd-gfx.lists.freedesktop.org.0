Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 119263998F2
	for <lists+amd-gfx@lfdr.de>; Thu,  3 Jun 2021 06:23:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 119C96F38F;
	Thu,  3 Jun 2021 04:23:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2057.outbound.protection.outlook.com [40.107.101.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A87176F38F
 for <amd-gfx@lists.freedesktop.org>; Thu,  3 Jun 2021 04:23:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nuS07ZO3d+1sGSFWlBk/BCrjRjRGm3gj6Qgg7OZJkS83KL5LS63+QaOOD5Fzy0a1K9TjxrnCCbW87E4AbBOy7aMs2PybON7GjjPyqkcgYvofGTgMqBOnsBSZ1Hwmlk8++nyN29hjqqENetyRoBzJqFjuBGK2we8xrs6XLkCSGsm0qzk2Gq7k0nZBxwkjHSkEPmHv1gNOqDK1AtVmEE2IhPIgxmXoahvFdCx00dEVqVfWHio9cIqer+ygtY/19LawwBelqLb+9U3fJFuX93bLreLhV5fCBGAkvqY4JEKVs/xRhyObXuSh/xMvEUAT+rVTI0Ux7dj6oaDbUMgnUcOU2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5PlPjYEMPRinoM0Py/lba+br1lAV09htcA+m8GToQmA=;
 b=Mic+3uVaMh9grEJgZ5zW3QaZSuaPJa/SFzflEq/zXadLuFyHqa4JTeYt2U9TLegclQxBb5q4iVG0N4mcMEnoLfwu1kID+AGGdn6MqPa25LNzM6LICqlmEY8YsKzhxK5tcWqFbpB0pSD4M9/TVORBnLAkSOU11tXt69LTRBLUyNPx5XYk98q+zhtTlHd59xnm5hsz8OcMyd+sjzNJ058dbPSkWSUzJbAnGXiZvyiNeYYs9bUPOfQhbhZ69ggS7EG04ceFPUnGs24Bw3tp7kZ6k5PZFkjWwZricGVZ1dV7vwql7lpHbFT1/jRo53teOFhBSai2e02NS88F7JAOu7tLTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5PlPjYEMPRinoM0Py/lba+br1lAV09htcA+m8GToQmA=;
 b=UgnKTJF/ype3gWyqzTgxU8LzhXxcYCVTBBLVcxT5+D4KdvDdYHwCpaN/GT3AkczNZkRHToOg+lepTpQkxsBDkjgZJCUfNphjFnTIaWXn8Ec86SBaeZQDSJJYHCYk6WHMSvnsKQ9yS0zBORFMWgpGedhCGqfjO+cTJ0bYIeM9msA=
Received: from CH0PR12MB5348.namprd12.prod.outlook.com (2603:10b6:610:d7::9)
 by CH0PR12MB5074.namprd12.prod.outlook.com (2603:10b6:610:e1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.22; Thu, 3 Jun
 2021 04:23:18 +0000
Received: from CH0PR12MB5348.namprd12.prod.outlook.com
 ([fe80::80e7:eb2e:843d:91e9]) by CH0PR12MB5348.namprd12.prod.outlook.com
 ([fe80::80e7:eb2e:843d:91e9%3]) with mapi id 15.20.4195.021; Thu, 3 Jun 2021
 04:23:18 +0000
From: "Lazar, Lijo" <Lijo.Lazar@amd.com>
To: "Powell, Darren" <Darren.Powell@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 2/6] amdgpu/pm: clean up smu_get_power_limit function
 signature
Thread-Topic: [PATCH 2/6] amdgpu/pm: clean up smu_get_power_limit function
 signature
Thread-Index: AQHXVBYfNEWgrbBnYkyNpITBdXGwIqr9G+QAgAEi8gCAAFqvYIABhHQAgAAFFcCAAXppAIAAFtDg
Date: Thu, 3 Jun 2021 04:23:18 +0000
Message-ID: <CH0PR12MB53480C0F873DBA01F6ECDB1A973C9@CH0PR12MB5348.namprd12.prod.outlook.com>
References: <20210528230621.16468-1-darren.powell@amd.com>
 <20210528230621.16468-3-darren.powell@amd.com>,
 <CH0PR12MB5348CD424C6F4A5E0A064598973F9@CH0PR12MB5348.namprd12.prod.outlook.com>
 <DM6PR12MB2954B3E943CD476445C945E9F03F9@DM6PR12MB2954.namprd12.prod.outlook.com>,
 <CH0PR12MB5348DB50C9C32FB21586F41C973E9@CH0PR12MB5348.namprd12.prod.outlook.com>
 <DM6PR12MB2954060EE8BA02E3E048FECEF03D9@DM6PR12MB2954.namprd12.prod.outlook.com>,
 <CH0PR12MB5348672703366A7EDE22BE8B973D9@CH0PR12MB5348.namprd12.prod.outlook.com>
 <DM6PR12MB29540334678B98C0A7B10C32F03C9@DM6PR12MB2954.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB29540334678B98C0A7B10C32F03C9@DM6PR12MB2954.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2021-06-03T04:23:11Z; 
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Standard;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [117.222.149.213]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 69096e56-b18b-4094-79ef-08d9264750b1
x-ms-traffictypediagnostic: CH0PR12MB5074:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH0PR12MB50741F38E114FF9FD8644A05973C9@CH0PR12MB5074.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: G5W9mHct/mBQCIcRGuMj8H1Qhtc3kvguCoWHw3nmQURH4YTtPoXrvIAffou2M5AZ23vTiTFMgewjf01Vl95DKJxJzLx90w+OW5gb+RhvmxoEBV+gTkfut30XxuwK4aM7FvGgucNfuLeLgn82UvPEx3SZascr/W23abSBqzJBZRQ/WI9SZzGUtVCHbt8NfnOw6gMRpCdOHN3WuZoM7PB8+9eXVH/u+YgEkCscpXjF6gj1cRRDJswTtXkdiEyQPyonueRg+jqD9CsTgdtJbtYdttXbnlREGEKmRouYeGYawJ4/SB4Mlcel2zBCu7ZignZpHxAlkI7lpC2Pi9yolYKveRi0gZvg2YeC2OTj7Y7k3H2TokvuJUQD7CyLv51kJZVRPVx57UmgFDc3tQAXGojJhLo3rg+DeG7p0GtSerLR8a8yYoZ7wfTdCBiyAajExOKVOXJT5QgFYkPpOW+CjYS8zjg26HoY/u4Rx3jb+Jy70sOIEPwp1Ze4stsMocHYRBH3whflBhOhHgADcIcqEPNEm/gKk2BAzv2ct96hVmwEjybaDwLLCYP43HorGmBtE92dw7gWBObyiJv2hcdEEQiKfTXF54ku26/vjGWbDmozTsM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB5348.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(366004)(376002)(136003)(346002)(86362001)(8676002)(186003)(110136005)(53546011)(6506007)(66946007)(52536014)(33656002)(9686003)(83380400001)(26005)(66476007)(66446008)(478600001)(2906002)(7696005)(76116006)(71200400001)(5660300002)(55016002)(316002)(4326008)(30864003)(64756008)(122000001)(38100700002)(66556008)(8936002)(579004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?gfc1kV1fS+6Kz0ppsixeDUyAPV6vfCmlrhpbiPwyve/SLwNTUOcoKfCDX5KX?=
 =?us-ascii?Q?2VkRtmG1klnpdmDGyCWbMFHiIK1nonfaKRSqRzZok/ojok9QhTkffXpb2Vto?=
 =?us-ascii?Q?SF0TMinSB/gLREvOi5pi58FysFz4T2peL5zulGyw6IMHUjjKimi6GwT8yeuv?=
 =?us-ascii?Q?Twp8CIg8qTDJ6MVnTY6wd9/akgv87mSwvk31O/XCu6DSX/2SyX7TKzIaT439?=
 =?us-ascii?Q?QehQnjFNUwjrrmf3gS8kBIoJS5EsWCumTweqCAPGEvgteDCA+Zg4sS418LwV?=
 =?us-ascii?Q?89B+2gN/t8qECJqQfd/dBp4D4NKsJL4z2C73mdM+AFVXUtSa7yuaGKz16uai?=
 =?us-ascii?Q?QGbv3zOs+XNUv6xyM+DRDsbWAgGc1RNQIFqPptP2Dbng/rdRW4J3pd7ZEiP1?=
 =?us-ascii?Q?+S7Uw1EHNTneL7ubAx0Pl3kSLweJhd1nQ9fnkXWeotcZbHUOc9eofktvYbAA?=
 =?us-ascii?Q?UoQuxjvPv+B4IU+VqQvEVX0X1vdz4F93K/diP5RBkxeZ13Kiyldpb1chWtMK?=
 =?us-ascii?Q?5pakswId5zNlfmsMI9BHJXOqod+vKb9lIg9UctEzeZkr8pfkijDorUttGsIk?=
 =?us-ascii?Q?uhIKwRv45Wi8Jy8E7ajAsoJ30c3zPrTdvy1lODiahmaJ/T8TIPF+G1j0EQ3A?=
 =?us-ascii?Q?NbJFXNWwCFZZ8Dx8k1R52XO/He0ieZ43NeGH9yL8KvqiclPyEZ75jyjUPcur?=
 =?us-ascii?Q?Oi1b452NmcFjsgOcZqOjYzQ2uM1WTHFeZu1iLuNGrZ1lMC/wmTUFUM/WpI1G?=
 =?us-ascii?Q?/CCTDjHuC7b9OzqP1iYx3SRWRvtt+x8MlSFAPUkuhadx5FpZlcxL6/tKfIDB?=
 =?us-ascii?Q?jgTlGnvugJO5tZEJF02i6oGzZRhi2BzFir8CUeeDfkestApOklGQdYoCSh7l?=
 =?us-ascii?Q?bl/uRGhl9Eqvps6FjnhpCy7UGVvy0Uke9vi15kNdCYykQ4q8XKN688Tx3UXV?=
 =?us-ascii?Q?TA+nkBctepz5cJl7VVjFtGbAJ67TY/0Vmbfds3xdaHHvkERCZC8h2tcZcJR9?=
 =?us-ascii?Q?OzaGfBKTqihGxw8AbrqIt84Tyr6uUatByussTVN4JVAiWNRG+yvQGqMRr3mb?=
 =?us-ascii?Q?N4aBUGuanQ23lpjopl+0nGLzLQenRwdtsbxuURo1tg7nhm2Zk+qMVc4pnMOG?=
 =?us-ascii?Q?xTY0ih4rWSrbOl+RvFl+9Az784Ei/kwqm3YioY3l50EPck694NFdJsAatPQb?=
 =?us-ascii?Q?1u3qRhWy+bE8BDiR7PDJ+YybaRSHJgoY88PsWpGxsAePX2XQ0hmDRpegHxbZ?=
 =?us-ascii?Q?H5bjzMKH0n+PY/V7s8Wt7YQLuekdKF/xUc1VNibmdS46x7KNYTaq2p7pdom5?=
 =?us-ascii?Q?be17dIXHz8i2EXwQWwjjBr0l?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5348.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69096e56-b18b-4094-79ef-08d9264750b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2021 04:23:18.7181 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UBN0MR/PDbG+qRCmp5ZkvCj1DH4rht11m17oEiY3ozEcM5iSDzGTj8ec5Z9KrlFe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5074
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
Cc: "Quan, Evan" <Evan.Quan@amd.com>
Content-Type: multipart/mixed; boundary="===============0333882511=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0333882511==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_CH0PR12MB53480C0F873DBA01F6ECDB1A973C9CH0PR12MB5348namp_"

--_000_CH0PR12MB53480C0F873DBA01F6ECDB1A973C9CH0PR12MB5348namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[Public]

I guess, you are suggesting to have levels to indicate limits/average and t=
ypes/class to indicate different levels. I'm fine with that.

enum pp_power_level
{
            PP_PWR_LIMIT_MIN =3D -1,
            PP_PWR_LIMIT_CURRENT,
            PP_PWR_LIMIT_DEFAULT,
            PP_PWR_LIMIT_MAX,
};

enum pp_power_type
{
            PP_PWR_TYPE_SUSTAINED,   =3D> Sustained Power is the default in=
 ASICs
            PP_PWR_TYPE_FAST,
            PP_PWR_TYPE_PLATFORM,
            PP_PWR_TYPE_APU,
};

Do note that for some ASICs FW uses power types like below (indicated in th=
rottler bits) which we won't be able to explain with meaningful names.

#define THROTTLER_PPT0_BIT         13
#define THROTTLER_PPT1_BIT         14
#define THROTTLER_PPT2_BIT         15
#define THROTTLER_PPT3_BIT         16

Thanks,
Lijo

From: Powell, Darren <Darren.Powell@amd.com>
Sent: Thursday, June 3, 2021 8:18 AM
To: Lazar, Lijo <Lijo.Lazar@amd.com>; amd-gfx@lists.freedesktop.org
Cc: Quan, Evan <Evan.Quan@amd.com>
Subject: Re: [PATCH 2/6] amdgpu/pm: clean up smu_get_power_limit function s=
ignature


[Public]

I think both of those candidates have drawbacks
** option #1 has a clash with the limit_level
 eg.
 enum pp_power_limit_level limit_level;
 enum pp_power_limit power_limit;

 power_limit =3D PP_PWR_LIMIT_DEFAULT; // name clash

** option #2 doesn't describe the usage, and might as well just be a uint
 power_limit =3D PP_PWR_LIMIT_0; // no use in reading code later

Would you accept "category" as a suitable solution?
 eg.
 enum pp_power_category
 {
                PP_PWR_CATEGORY_DEFAULT,
                PP_PWR_CATEGORY_FAST,
                PP_PWR_CATEGORY_APU,
                PP_PWR_CATEGORY_PLATFORM,
 };

Other possibilities may be
** class
** subsystem
** type
** element

Thanks
Darren
________________________________
From: Lazar, Lijo <Lijo.Lazar@amd.com<mailto:Lijo.Lazar@amd.com>>
Sent: Wednesday, June 2, 2021 12:32 AM
To: Powell, Darren <Darren.Powell@amd.com<mailto:Darren.Powell@amd.com>>; a=
md-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org> <amd-gfx=
@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>>
Subject: RE: [PATCH 2/6] amdgpu/pm: clean up smu_get_power_limit function s=
ignature


[Public]



I'm looking for an appropriate name that can accommodate more limits like



enum pp_power_limit

{

                PP_PWR_LIMIT_DEFAULT,

                PP_PWR_LIMIT_FAST,

PP_PWR_LIMIT_APU,

                PP_PWR_LIMIT_PLATFORM,

};



Or simply different limits where the meaning may change based on ASIC - LIM=
IT2 could be platform power limit for ASIC1 or LIMIT2 could be max power al=
location for a domain (say memory) for ASIC2



enum pp_power_limit

{

                PP_PWR_LIMIT_0,

                PP_PWR_LIMIT_1,

                PP_PWR_LIMIT_2,

                PP_PWR_LIMIT_3,

};



Thanks,

Lijo



From: Powell, Darren <Darren.Powell@amd.com<mailto:Darren.Powell@amd.com>>
Sent: Wednesday, June 2, 2021 9:25 AM
To: Lazar, Lijo <Lijo.Lazar@amd.com<mailto:Lijo.Lazar@amd.com>>; amd-gfx@li=
sts.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 2/6] amdgpu/pm: clean up smu_get_power_limit function s=
ignature



[Public]



I'm not sure exactly what you are looking for. The enums sample_window and =
limit_level map to power{1,2} and cap{min,max,default,current} respectively=
. I added the enums to make the function signatures more readable and stop =
the use of value as an input and output variable.

Please give more specific example?

Darren



=3D HWMON Mapping =3D

=3D=3D Read =3D=3D

SENSOR(power1_average)     amdgpu_hwmon_show_power_avg(0)           amdgpu_=
dpm_read_sensor(AMDGPU_PP_SENSOR_GPU_POWER)

SENSOR(power1_cap_max)     amdgpu_hwmon_show_power_cap_max(0)       get_pow=
er_limit(PP_PWR_LIMIT_MAX, PP_PWR_WINDOW_DEFAULT)

SENSOR(power1_cap_min)     amdgpu_hwmon_show_power_cap_min(0)       0

SENSOR(power1_cap)         amdgpu_hwmon_show_power_cap(0)           get_pow=
er_limit(PP_PWR_LIMIT_CURRENT, PP_PWR_WINDOW_DEFAULT)

SENSOR(power1_cap_default) amdgpu_hwmon_show_power_cap_default(0)   get_pow=
er_limit(PP_PWR_LIMIT_DEFAULT, PP_PWR_WINDOW_DEFAULT)

SENSOR(power1_label)       amdgpu_hwmon_show_power_label(0)         "slowPP=
T"

SENSOR(power2_average)     amdgpu_hwmon_show_power_avg(1)           amdgpu_=
dpm_read_sensor(AMDGPU_PP_SENSOR_GPU_POWER)

SENSOR(power2_cap_max)     amdgpu_hwmon_show_power_cap_max(1)       get_pow=
er_limit(PP_PWR_LIMIT_MAX, PP_PWR_WINDOW_FAST)

SENSOR(power2_cap_min)     amdgpu_hwmon_show_power_cap_min(1)       0

SENSOR(power2_cap)         amdgpu_hwmon_show_power_cap(1)           get_pow=
er_limit(PP_PWR_LIMIT_CURRENT, PP_PWR_WINDOW_FAST)

SENSOR(power2_cap_default) amdgpu_hwmon_show_power_cap_default(1)   get_pow=
er_limit(PP_PWR_LIMIT_DEFAULT, PP_PWR_WINDOW_FAST)

SENSOR(power2_label)       amdgpu_hwmon_show_power_label(1)         "fastPP=
T"

=3D=3D Write =3D=3D

SENSOR(power1_cap)         amdgpu_hwmon_set_power_cap(0,value)      set_pow=
er_limit( (0<<24) || value )

SENSOR(power2_cap)         amdgpu_hwmon_set_power_cap(1,value)      set_pow=
er_limit( (1<<24) || value )



=3D Summary =3D

power1 =3D> PP_PWR_WINDOW_DEFAULT   ( label ("slowPPT"))

power2 =3D> PP_PWR_WINDOW_FAST      ( label ("fastPPT"))

power_avg         =3D> AMDGPU_PP_SENSOR_GPU_POWER

power_cap_max     =3D> PP_PWR_LIMIT_MAX

power_cap_min     =3D> PP_PWR_LIMIT_MIN (optimized to 0)

power_cap         =3D> PP_PWR_LIMIT_CURRENT

power_cap_default =3D> PP_PWR_LIMIT_DEFAULT







________________________________

From: Lazar, Lijo <Lijo.Lazar@amd.com<mailto:Lijo.Lazar@amd.com>>
Sent: Tuesday, June 1, 2021 12:56 AM
To: Powell, Darren <Darren.Powell@amd.com<mailto:Darren.Powell@amd.com>>; a=
md-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org> <amd-gfx=
@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>>
Subject: RE: [PATCH 2/6] amdgpu/pm: clean up smu_get_power_limit function s=
ignature



[Public]



May be just call it power_limit or power_cap similar to hwmon. The various =
limits correspond to hwmon power[1-*]_cap and levels correspond to min/ max=
 etc.



Thanks,

Lijo



From: Powell, Darren <Darren.Powell@amd.com<mailto:Darren.Powell@amd.com>>
Sent: Tuesday, June 1, 2021 4:50 AM
To: Lazar, Lijo <Lijo.Lazar@amd.com<mailto:Lijo.Lazar@amd.com>>; amd-gfx@li=
sts.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>
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

--_000_CH0PR12MB53480C0F873DBA01F6ECDB1A973C9CH0PR12MB5348namp_
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
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
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
pre
	{mso-style-priority:99;
	mso-style-link:"HTML Preformatted Char";
	margin:0in;
	font-size:10.0pt;
	font-family:"Courier New";}
span.HTMLPreformattedChar
	{mso-style-name:"HTML Preformatted Char";
	mso-style-priority:99;
	mso-style-link:"HTML Preformatted";
	font-family:Consolas;}
p.xmsonormal, li.xmsonormal, div.xmsonormal
	{mso-style-name:x_msonormal;
	margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
p.xxmsonormal, li.xxmsonormal, div.xxmsonormal
	{mso-style-name:x_xmsonormal;
	margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
p.xxmsipheaderc10f11a2, li.xxmsipheaderc10f11a2, div.xxmsipheaderc10f11a2
	{mso-style-name:x_xmsipheaderc10f11a2;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
p.xmsipheaderc10f11a2, li.xmsipheaderc10f11a2, div.xmsipheaderc10f11a2
	{mso-style-name:x_msipheaderc10f11a2;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle24
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
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"purple" style=3D"word-wrap:b=
reak-word">
<div class=3D"WordSection1">
<p class=3D"msipheaderc10f11a2" style=3D"margin:0in"><span style=3D"font-si=
ze:10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:green">[Public]</s=
pan><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I guess, you are suggesting to have levels to indica=
te limits/average and types/class to indicate different levels. I&#8217;m f=
ine with that.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">enum pp=
_power_level<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">{<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PP_PWR_LIMIT_MI=
N =3D -1,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PP_PWR_LIMIT_CU=
RRENT,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PP_PWR_LIMIT_DE=
FAULT,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PP_PWR_LIMIT_MA=
X,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">};<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">enum pp=
_power_type<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">{<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PP_PWR_TYPE_SUS=
TAINED,&nbsp;&nbsp; =3D&gt; Sustained Power is the default in ASICs<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PP_PWR_TYPE_FAS=
T,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PP_PWR_TYPE_PLA=
TFORM,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PP_PWR_TYPE_APU=
,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">};<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">Do note=
 that for some ASICs FW uses power types like below (indicated in throttler=
 bits) which we won&#8217;t be able to explain with meaningful names.<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-size:=
12.0pt;color:black">#define THROTTLER_PPT0_BIT &nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;13<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-size:=
12.0pt;color:black">#define THROTTLER_PPT1_BIT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; 14<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-size:=
12.0pt;color:black">#define THROTTLER_PPT2_BIT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; 15<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-size:=
12.0pt;color:black">#define THROTTLER_PPT3_BIT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; 16<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Lijo<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b>From:</b> Powell, Darren &lt;Darren.Powell@amd.co=
m&gt; <br>
<b>Sent:</b> Thursday, June 3, 2021 8:18 AM<br>
<b>To:</b> Lazar, Lijo &lt;Lijo.Lazar@amd.com&gt;; amd-gfx@lists.freedeskto=
p.org<br>
<b>Cc:</b> Quan, Evan &lt;Evan.Quan@amd.com&gt;<br>
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
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">I think=
 both of those candidates have drawbacks
<o:p></o:p></span></p>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">** opti=
on #1 has a clash with the limit_level<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;e=
g.<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;e=
num pp_power_limit_level limit_level;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;e=
num pp_power_limit power_limit;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;<=
o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;p=
ower_limit =3D PP_PWR_LIMIT_DEFAULT; // name clash<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">** opti=
on #2 doesn't describe the usage, and might as well just be a uint<o:p></o:=
p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;p=
ower_limit =3D PP_PWR_LIMIT_0; // no use in reading code later<o:p></o:p></=
span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">Would y=
ou accept &quot;category&quot; as a suitable solution?<o:p></o:p></span></p=
>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;e=
g.<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;e=
num pp_power_category<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;{=
<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; PP_PWR_CATEGORY_DEFAULT,<o=
:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; PP_PWR_CATEGORY_FAST,<o:p>=
</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; PP_PWR_CATEGORY_APU,<o:p><=
/o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; PP_PWR_CATEGORY_PLATFORM,<=
o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;}=
;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">Other p=
ossibilities may be<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">** clas=
s<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">** subs=
ystem<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">** type=
<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">** elem=
ent<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">Thanks<=
o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">Darren<=
o:p></o:p></span></p>
</div>
<div class=3D"MsoNormal" align=3D"center" style=3D"text-align:center">
<hr size=3D"2" width=3D"98%" align=3D"center">
</div>
<div id=3D"divRplyFwdMsg">
<p class=3D"MsoNormal"><b><span style=3D"color:black">From:</span></b><span=
 style=3D"color:black"> Lazar, Lijo &lt;<a href=3D"mailto:Lijo.Lazar@amd.co=
m">Lijo.Lazar@amd.com</a>&gt;<br>
<b>Sent:</b> Wednesday, June 2, 2021 12:32 AM<br>
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
<p class=3D"xmsipheaderc10f11a2" style=3D"margin:0in"><span style=3D"font-s=
ize:10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:green">[Public]</=
span><o:p></o:p></p>
<p class=3D"xmsonormal">&nbsp;<o:p></o:p></p>
<p class=3D"xmsonormal">I&#8217;m looking for an appropriate name that can =
accommodate more limits like
<o:p></o:p></p>
<p class=3D"xmsonormal">&nbsp;<o:p></o:p></p>
<p class=3D"xmsonormal">enum pp_power_limit<o:p></o:p></p>
<p class=3D"xmsonormal">{<o:p></o:p></p>
<p class=3D"xmsonormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PP_PWR_LIMIT_DEFAULT,<o:p></o:p></p=
>
<p class=3D"xmsonormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PP_PWR_LIMIT_FAST, <o:p></o:p></p>
<p class=3D"xmsonormal" style=3D"text-indent:.5in">PP_PWR_LIMIT_APU,<o:p></=
o:p></p>
<p class=3D"xmsonormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PP_PWR_LIMIT_PLATFORM,<o:p></o:p></=
p>
<p class=3D"xmsonormal">};<o:p></o:p></p>
<p class=3D"xmsonormal">&nbsp;<o:p></o:p></p>
<p class=3D"xmsonormal">Or simply different limits where the meaning may ch=
ange based on ASIC - LIMIT2 could be platform power limit for ASIC1 or LIMI=
T2 could be max power allocation for a domain (say memory) for ASIC2<o:p></=
o:p></p>
<p class=3D"xmsonormal">&nbsp;<o:p></o:p></p>
<p class=3D"xmsonormal">enum pp_power_limit<o:p></o:p></p>
<p class=3D"xmsonormal">{<o:p></o:p></p>
<p class=3D"xmsonormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PP_PWR_LIMIT_0,<o:p></o:p></p>
<p class=3D"xmsonormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PP_PWR_LIMIT_1,<o:p></o:p></p>
<p class=3D"xmsonormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PP_PWR_LIMIT_2,<o:p></o:p></p>
<p class=3D"xmsonormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PP_PWR_LIMIT_3,<o:p></o:p></p>
<p class=3D"xmsonormal">};<o:p></o:p></p>
<p class=3D"xmsonormal">&nbsp;<o:p></o:p></p>
<p class=3D"xmsonormal">Thanks,<o:p></o:p></p>
<p class=3D"xmsonormal">Lijo<o:p></o:p></p>
<p class=3D"xmsonormal">&nbsp;<o:p></o:p></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"xmsonormal"><b>From:</b> Powell, Darren &lt;<a href=3D"mailto:D=
arren.Powell@amd.com">Darren.Powell@amd.com</a>&gt;
<br>
<b>Sent:</b> Wednesday, June 2, 2021 9:25 AM<br>
<b>To:</b> Lazar, Lijo &lt;<a href=3D"mailto:Lijo.Lazar@amd.com">Lijo.Lazar=
@amd.com</a>&gt;;
<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.=
org</a><br>
<b>Subject:</b> Re: [PATCH 2/6] amdgpu/pm: clean up smu_get_power_limit fun=
ction signature<o:p></o:p></p>
</div>
</div>
<p class=3D"xmsonormal">&nbsp;<o:p></o:p></p>
<p style=3D"margin:15.0pt"><span style=3D"font-size:10.0pt;font-family:&quo=
t;Arial&quot;,sans-serif;color:green">[Public]</span><o:p></o:p></p>
<p class=3D"xmsonormal">&nbsp;<o:p></o:p></p>
<div>
<div>
<p class=3D"xmsonormal"><span style=3D"font-size:12.0pt;color:black">I'm no=
t sure exactly what you are looking for. The enums sample_window and limit_=
level map to power{1,2} and cap{min,max,default,current} respectively. I ad=
ded the enums to make the function signatures
 more readable and stop the use of value as an input and output variable.</=
span><o:p></o:p></p>
</div>
<div>
<p class=3D"xmsonormal"><span style=3D"font-size:12.0pt;color:black">Please=
 give more specific example?</span><o:p></o:p></p>
</div>
<div>
<p class=3D"xmsonormal"><span style=3D"font-size:12.0pt;color:black">Darren=
&nbsp;</span><o:p></o:p></p>
</div>
<div>
<p class=3D"xmsonormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;=
</span><o:p></o:p></p>
</div>
<div>
<div>
<div>
<p class=3D"xmsonormal"><span style=3D"font-size:12.0pt;color:black">=3D HW=
MON Mapping =3D</span><o:p></o:p></p>
</div>
<div>
<p class=3D"xmsonormal"><span style=3D"font-size:12.0pt;color:black">=3D=3D=
 Read =3D=3D</span><o:p></o:p></p>
</div>
</div>
<div style=3D"border:solid #EAECF0 1.0pt;padding:12.0pt 12.0pt 12.0pt 12.0p=
t">
<pre style=3D"line-height:15.6pt;background:#F8F9FA"><span style=3D"font-si=
ze:10.5pt;color:black">SENSOR(power1_average) &nbsp; &nbsp; amdgpu_hwmon_sh=
ow_power_avg(0) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; amdgpu_dpm_read_sensor(A=
MDGPU_PP_SENSOR_GPU_POWER)</span><o:p></o:p></pre>
<pre style=3D"line-height:15.6pt;background:#F8F9FA"><span style=3D"font-si=
ze:10.5pt;color:black">SENSOR(power1_cap_max) &nbsp; &nbsp; amdgpu_hwmon_sh=
ow_power_cap_max(0) &nbsp; &nbsp; &nbsp; get_power_limit(PP_PWR_LIMIT_MAX, =
PP_PWR_WINDOW_DEFAULT)</span><o:p></o:p></pre>
<pre style=3D"line-height:15.6pt;background:#F8F9FA"><span style=3D"font-si=
ze:10.5pt;color:black">SENSOR(power1_cap_min) &nbsp; &nbsp; amdgpu_hwmon_sh=
ow_power_cap_min(0) &nbsp; &nbsp; &nbsp; 0</span><o:p></o:p></pre>
<pre style=3D"line-height:15.6pt;background:#F8F9FA"><span style=3D"font-si=
ze:10.5pt;color:black">SENSOR(power1_cap) &nbsp; &nbsp; &nbsp; &nbsp; amdgp=
u_hwmon_show_power_cap(0) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; get_power_limi=
t(PP_PWR_LIMIT_CURRENT, PP_PWR_WINDOW_DEFAULT)</span><o:p></o:p></pre>
<pre style=3D"line-height:15.6pt;background:#F8F9FA"><span style=3D"font-si=
ze:10.5pt;color:black">SENSOR(power1_cap_default) amdgpu_hwmon_show_power_c=
ap_default(0) &nbsp; get_power_limit(PP_PWR_LIMIT_DEFAULT, PP_PWR_WINDOW_DE=
FAULT)</span><o:p></o:p></pre>
<pre style=3D"line-height:15.6pt;background:#F8F9FA"><span style=3D"font-si=
ze:10.5pt;color:black">SENSOR(power1_label) &nbsp; &nbsp; &nbsp; amdgpu_hwm=
on_show_power_label(0) &nbsp; &nbsp; &nbsp; &nbsp; &quot;slowPPT&quot;</spa=
n><o:p></o:p></pre>
<pre style=3D"line-height:15.6pt;background:#F8F9FA"><span style=3D"font-si=
ze:10.5pt;color:black">SENSOR(power2_average) &nbsp; &nbsp; amdgpu_hwmon_sh=
ow_power_avg(1) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; amdgpu_dpm_read_sensor(A=
MDGPU_PP_SENSOR_GPU_POWER)</span><o:p></o:p></pre>
<pre style=3D"line-height:15.6pt;background:#F8F9FA"><span style=3D"font-si=
ze:10.5pt;color:black">SENSOR(power2_cap_max) &nbsp; &nbsp; amdgpu_hwmon_sh=
ow_power_cap_max(1) &nbsp; &nbsp; &nbsp; get_power_limit(PP_PWR_LIMIT_MAX, =
PP_PWR_WINDOW_FAST)</span><o:p></o:p></pre>
<pre style=3D"line-height:15.6pt;background:#F8F9FA"><span style=3D"font-si=
ze:10.5pt;color:black">SENSOR(power2_cap_min) &nbsp; &nbsp; amdgpu_hwmon_sh=
ow_power_cap_min(1) &nbsp; &nbsp; &nbsp; 0</span><o:p></o:p></pre>
<pre style=3D"line-height:15.6pt;background:#F8F9FA"><span style=3D"font-si=
ze:10.5pt;color:black">SENSOR(power2_cap) &nbsp; &nbsp; &nbsp; &nbsp; amdgp=
u_hwmon_show_power_cap(1) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; get_power_limi=
t(PP_PWR_LIMIT_CURRENT, PP_PWR_WINDOW_FAST)</span><o:p></o:p></pre>
<pre style=3D"line-height:15.6pt;background:#F8F9FA"><span style=3D"font-si=
ze:10.5pt;color:black">SENSOR(power2_cap_default) amdgpu_hwmon_show_power_c=
ap_default(1) &nbsp; get_power_limit(PP_PWR_LIMIT_DEFAULT, PP_PWR_WINDOW_FA=
ST)</span><o:p></o:p></pre>
<pre style=3D"line-height:15.6pt;background:#F8F9FA"><span style=3D"font-si=
ze:10.5pt;color:black">SENSOR(power2_label) &nbsp; &nbsp; &nbsp; amdgpu_hwm=
on_show_power_label(1) &nbsp; &nbsp; &nbsp; &nbsp; &quot;fastPPT&quot;</spa=
n><o:p></o:p></pre>
</div>
<div>
<div>
<p class=3D"xmsonormal"><span style=3D"font-size:12.0pt;color:black">=3D=3D=
 Write =3D=3D</span><o:p></o:p></p>
</div>
</div>
<div style=3D"border:solid #EAECF0 1.0pt;padding:12.0pt 12.0pt 12.0pt 12.0p=
t">
<pre style=3D"line-height:15.6pt;background:#F8F9FA"><span style=3D"font-si=
ze:10.5pt;color:black">SENSOR(power1_cap) &nbsp; &nbsp; &nbsp; &nbsp; amdgp=
u_hwmon_set_power_cap(0,value) &nbsp; &nbsp; &nbsp;set_power_limit( (0&lt;&=
lt;24) || value )</span><o:p></o:p></pre>
<pre style=3D"line-height:15.6pt;background:#F8F9FA"><span style=3D"font-si=
ze:10.5pt;color:black">SENSOR(power2_cap) &nbsp; &nbsp; &nbsp; &nbsp; amdgp=
u_hwmon_set_power_cap(1,value) &nbsp; &nbsp; &nbsp;set_power_limit( (1&lt;&=
lt;24) || value )</span><o:p></o:p></pre>
</div>
<p style=3D"margin-bottom:6.0pt;background:white"><span style=3D"font-size:=
10.5pt;font-family:&quot;Arial&quot;,sans-serif;color:#222222">&nbsp;</span=
><o:p></o:p></p>
<div>
<p class=3D"xmsonormal"><span style=3D"font-size:12.0pt;color:black">=3D Su=
mmary =3D</span><o:p></o:p></p>
</div>
<div style=3D"border:solid #EAECF0 1.0pt;padding:12.0pt 12.0pt 12.0pt 12.0p=
t">
<pre style=3D"line-height:15.6pt;background:#F8F9FA"><span style=3D"font-si=
ze:10.5pt;color:black">power1 =3D&gt; PP_PWR_WINDOW_DEFAULT &nbsp; ( label =
(&quot;slowPPT&quot;))</span><o:p></o:p></pre>
<pre style=3D"line-height:15.6pt;background:#F8F9FA"><span style=3D"font-si=
ze:10.5pt;color:black">power2 =3D&gt; PP_PWR_WINDOW_FAST &nbsp; &nbsp; &nbs=
p;( label (&quot;fastPPT&quot;))</span><o:p></o:p></pre>
<pre style=3D"line-height:15.6pt;background:#F8F9FA"><span style=3D"font-si=
ze:10.5pt;color:black">power_avg &nbsp; &nbsp; &nbsp; &nbsp; =3D&gt; AMDGPU=
_PP_SENSOR_GPU_POWER</span><o:p></o:p></pre>
<pre style=3D"line-height:15.6pt;background:#F8F9FA"><span style=3D"font-si=
ze:10.5pt;color:black">power_cap_max &nbsp; &nbsp; =3D&gt; PP_PWR_LIMIT_MAX=
</span><o:p></o:p></pre>
<pre style=3D"line-height:15.6pt;background:#F8F9FA"><span style=3D"font-si=
ze:10.5pt;color:black">power_cap_min &nbsp; &nbsp; =3D&gt; PP_PWR_LIMIT_MIN=
 (optimized to 0)</span><o:p></o:p></pre>
<pre style=3D"line-height:15.6pt;background:#F8F9FA"><span style=3D"font-si=
ze:10.5pt;color:black">power_cap &nbsp; &nbsp; &nbsp; &nbsp; =3D&gt; PP_PWR=
_LIMIT_CURRENT</span><o:p></o:p></pre>
<pre style=3D"line-height:15.6pt;background:#F8F9FA"><span style=3D"font-si=
ze:10.5pt;color:black">power_cap_default =3D&gt; PP_PWR_LIMIT_DEFAULT</span=
><o:p></o:p></pre>
</div>
<p class=3D"xmsonormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;=
</span><o:p></o:p></p>
</div>
<div>
<p class=3D"xmsonormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;=
</span><o:p></o:p></p>
</div>
<div>
<p class=3D"xmsonormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;=
</span><o:p></o:p></p>
</div>
<div class=3D"MsoNormal" align=3D"center" style=3D"text-align:center">
<hr size=3D"2" width=3D"98%" align=3D"center">
</div>
<div id=3D"x_divRplyFwdMsg">
<p class=3D"xmsonormal"><b><span style=3D"color:black">From:</span></b><spa=
n style=3D"color:black"> Lazar, Lijo &lt;<a href=3D"mailto:Lijo.Lazar@amd.c=
om">Lijo.Lazar@amd.com</a>&gt;<br>
<b>Sent:</b> Tuesday, June 1, 2021 12:56 AM<br>
<b>To:</b> Powell, Darren &lt;<a href=3D"mailto:Darren.Powell@amd.com">Darr=
en.Powell@amd.com</a>&gt;;
<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.=
org</a> &lt;<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.=
freedesktop.org</a>&gt;<br>
<b>Subject:</b> RE: [PATCH 2/6] amdgpu/pm: clean up smu_get_power_limit fun=
ction signature</span>
<o:p></o:p></p>
<div>
<p class=3D"xmsonormal">&nbsp;<o:p></o:p></p>
</div>
</div>
<div>
<div>
<p class=3D"xxmsipheaderc10f11a2" style=3D"margin:0in"><span style=3D"font-=
size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:green">[Public]<=
/span><o:p></o:p></p>
<p class=3D"xxmsonormal">&nbsp;<o:p></o:p></p>
<p class=3D"xxmsonormal">May be just call it power_limit or power_cap simil=
ar to hwmon. The various limits correspond to hwmon power[1-*]_cap and leve=
ls correspond to min/ max etc.<o:p></o:p></p>
<p class=3D"xxmsonormal">&nbsp;<o:p></o:p></p>
<p class=3D"xxmsonormal">Thanks,<o:p></o:p></p>
<p class=3D"xxmsonormal">Lijo<o:p></o:p></p>
<p class=3D"xxmsonormal">&nbsp;<o:p></o:p></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"xxmsonormal"><b>From:</b> Powell, Darren &lt;<a href=3D"mailto:=
Darren.Powell@amd.com">Darren.Powell@amd.com</a>&gt;
<br>
<b>Sent:</b> Tuesday, June 1, 2021 4:50 AM<br>
<b>To:</b> Lazar, Lijo &lt;<a href=3D"mailto:Lijo.Lazar@amd.com">Lijo.Lazar=
@amd.com</a>&gt;;
<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.=
org</a><br>
<b>Subject:</b> Re: [PATCH 2/6] amdgpu/pm: clean up smu_get_power_limit fun=
ction signature<o:p></o:p></p>
</div>
</div>
<p class=3D"xxmsonormal">&nbsp;<o:p></o:p></p>
<p style=3D"margin:15.0pt"><span style=3D"font-size:10.0pt;font-family:&quo=
t;Arial&quot;,sans-serif;color:green">[Public]</span><o:p></o:p></p>
<p class=3D"xxmsonormal">&nbsp;<o:p></o:p></p>
<div>
<div>
<p class=3D"xxmsonormal"><span style=3D"font-family:&quot;Segoe UI&quot;,sa=
ns-serif;color:black"><br>
<span style=3D"background:white">&gt;&lt; &gt; The limits are not limited t=
o sample window. There are limits like APU only limit, platform limit and t=
otally obscure ones like PPT0/PPT1 etc.</span><br>
<span style=3D"background:white">&gt;It's better that the new enum takes ca=
re of those as well in case there is a need to make them available through =
sysfs.</span></span><o:p></o:p></p>
</div>
<div>
<p class=3D"xxmsonormal"><span style=3D"font-size:12.0pt;color:black">&nbsp=
;</span><o:p></o:p></p>
</div>
<div>
<p class=3D"xxmsonormal"><span style=3D"font-size:12.0pt;color:black">I thi=
nk you mean something more like this?</span><o:p></o:p></p>
</div>
<div>
<p class=3D"xxmsonormal"><span style=3D"font-family:&quot;Segoe UI&quot;,sa=
ns-serif;color:black;background:white">+ enum pp_power_constraints</span><s=
pan style=3D"font-size:12.0pt;color:black"><br>
</span><span style=3D"font-family:&quot;Segoe UI&quot;,sans-serif;color:bla=
ck;background:white">+{</span><span style=3D"font-family:&quot;Segoe UI&quo=
t;,sans-serif;color:black"><br>
<span style=3D"background:white">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PP_P=
WR_CONSTRAINT_DEFAULT,</span><br>
<span style=3D"background:white">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PP_P=
WR_CONSTRAINT_FASTWINDOW,</span><br>
<span style=3D"background:white">+};</span><br>
<span style=3D"background:white">+</span></span><o:p></o:p></p>
</div>
<div>
<p class=3D"xxmsonormal"><span style=3D"font-size:12.0pt;color:black">&nbsp=
;</span><o:p></o:p></p>
</div>
<div>
<p class=3D"xxmsonormal"><span style=3D"font-size:12.0pt;color:black">&nbsp=
;</span><o:p></o:p></p>
</div>
<div class=3D"MsoNormal" align=3D"center" style=3D"text-align:center">
<hr size=3D"2" width=3D"98%" align=3D"center">
</div>
<div id=3D"x_x_divRplyFwdMsg">
<p class=3D"xxmsonormal"><b><span style=3D"color:black">From:</span></b><sp=
an style=3D"color:black"> Lazar, Lijo &lt;<a href=3D"mailto:Lijo.Lazar@amd.=
com">Lijo.Lazar@amd.com</a>&gt;<br>
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
<p class=3D"xxmsonormal">&nbsp;<o:p></o:p></p>
</div>
</div>
<div>
<div>
<p class=3D"xxmsonormal">[Public]<br>
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
</div>
</div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_CH0PR12MB53480C0F873DBA01F6ECDB1A973C9CH0PR12MB5348namp_--

--===============0333882511==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--===============0333882511==--
