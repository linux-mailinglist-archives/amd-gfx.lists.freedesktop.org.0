Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D115AFC03
	for <lists+amd-gfx@lfdr.de>; Wed,  7 Sep 2022 07:53:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0F7310E2F7;
	Wed,  7 Sep 2022 05:53:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2070.outbound.protection.outlook.com [40.107.223.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63EC110E2F7
 for <amd-gfx@lists.freedesktop.org>; Wed,  7 Sep 2022 05:53:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fcomFrbDP/SpgXOMIwHswJzh9sA4TlshNWY2Dx43IZC3tqJCaDwg18WLMoDbIMeSEcadf3Qw+RQplytUNn9Cu6/Vr7Q6yPmb6PX5whwZBjMjymLW9Gs2FSk2+J5hc8dCas4vLtFnXeU60OXQ/zLZwtYnHIh2sZoI9vpMty0P7Cwa5MfOZDkMM8LEprZ0DHkcb5uSOT3A7QS1IYHnj94w+jdbasubGaBvHTAJppE0RdauQ11lTPGHxOCshqTONJSfojTgmdQl9SM0lqaDLtwKan6WosMeQcowVRfnDrWwBxyMmnurJPu4vgbZjs220hcR9LuG/Ds5pHfRzxQlIsNzjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DmhAaWsfL3NzcNavzVf7NjCF+rq5ifmw6lTYP+xeeHA=;
 b=NAku/t/na0SyRwnGrdcye1NPdIKTk/PY1tAnKTp4ulccULFcv5ZVqqULjLC9eYd0riVztCXQVSGDCmZtbntmT5GJHDyNg4RdLgKhoohyqovVFFOYPEqi07Nk7+LAQpI9JQ5uWlFiPbb14mrIoqByGJ9NIfWs6sqam+sdeKgaGHjMNMNytYLispRpfPnOY5LmJb8yax2bVKaATd9zma+va45+EemueXZ2nBlOrF/6WrLduqRCGtdad6yM7aFOjpOHtHSr8lIdej30PdPfal+xw2KEqss4X61xp0if+qv2u7jqROZ3YNNkpF70oOkbmMsyNy/3wgDWabWLzh0H5l3BMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DmhAaWsfL3NzcNavzVf7NjCF+rq5ifmw6lTYP+xeeHA=;
 b=LB/0x468JGL7BQ+BaLnLYjVkkVSrsqX/2iP+jodEUFgSRD0zXrnNX/3GLcmoWkReu1zgj41NRppgRGcY2YFuh57oQXj3iOXn3bWhwaZCRna7Z/hlqdEyVjHFQlcwMB5nPbwUTeNfuOO1uO8ZP7cqh8h+ppK4QWhc19WJIYJ4vZM=
Received: from CH2PR12MB4215.namprd12.prod.outlook.com (2603:10b6:610:ab::24)
 by BN9PR12MB5244.namprd12.prod.outlook.com (2603:10b6:408:101::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12; Wed, 7 Sep
 2022 05:53:42 +0000
Received: from CH2PR12MB4215.namprd12.prod.outlook.com
 ([fe80::b554:96ce:4449:5e98]) by CH2PR12MB4215.namprd12.prod.outlook.com
 ([fe80::b554:96ce:4449:5e98%5]) with mapi id 15.20.5588.018; Wed, 7 Sep 2022
 05:53:42 +0000
From: "Chai, Thomas" <YiPeng.Chai@amd.com>
To: "Zhang, Hawking" <Hawking.Zhang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH V2] drm/amdgpu: Adjust removal control flow for smu v13_0_2
Thread-Topic: [PATCH V2] drm/amdgpu: Adjust removal control flow for smu
 v13_0_2
Thread-Index: AQHYwcUXXCDZYelE7UWkXHkAOUzNjq3TQqOAgAANyfCAAAOSAIAAIgtA
Date: Wed, 7 Sep 2022 05:53:42 +0000
Message-ID: <CH2PR12MB421571152FFA6D7161DF6775FC419@CH2PR12MB4215.namprd12.prod.outlook.com>
References: <20220906074822.3885626-1-YiPeng.Chai@amd.com>
 <BN9PR12MB5257F5FC5531B2426C073CDEFC419@BN9PR12MB5257.namprd12.prod.outlook.com>
 <CH2PR12MB42157A5295994AACB0D17166FC419@CH2PR12MB4215.namprd12.prod.outlook.com>
 <BN9PR12MB52570D6703F7FFEF517305C6FC419@BN9PR12MB5257.namprd12.prod.outlook.com>
In-Reply-To: <BN9PR12MB52570D6703F7FFEF517305C6FC419@BN9PR12MB5257.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=True;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2022-09-07T03:29:30.0000000Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_enabled: true
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_setdate: 2022-09-07T05:53:38Z
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_method: Standard
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_name: General
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_actionid: 51c78f8f-cb5a-4ecc-8b15-f74ff9647554
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 288b2f57-4d1c-49cd-3858-08da909551ce
x-ms-traffictypediagnostic: BN9PR12MB5244:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TkKkjpQSHC6JP8arspEN9R4+hcErOIu8+QMtjdMC+kQVXG1iy3dfC/HqYe2onchLGOEuQgDsE2wRrJ78zrVCK/U2/MkirVwiklfp0wmG9eEkdSI6JCaDqYRE5lRgGG0IDsyTwCbYJctMJwydTTbX528GPV+cFP1jrdM943HL2JzYHlcpBgxNqSC48SKY95gUnH6yin8JhjzmKjrp6FawhMIkoi4KUaDEZXGiqVr2D97pKEzhwYzGJPzarBFEq+R/WDjm+cwVIxS/r8boYFNVn3hp7VcdTKeDrIiuVj85O32IeVSKk59YrVu2B0JV/Ndk+8K/P3Lcfn5p1AI/9nlTsUnHmTZxe+uyuG6eSraPwF7kXGUleigJWm9nJHK9hp6foLMANqO0DKwlpT21+LOEkHKQXtS+keOrD3XSzPT/uwaA5zyDHFedBKnhCnB0V7RCmGkUymyRg50Ob3Ei7dTTq3/+nAjmb8KGHJP/G2Od4KgAZQd8CsrsJ3j3I227pbT0KAO5cuqECe9E45vDM9oO142Aec6c9Hgr0BcQM9ljTVzf/H7LDAZyroUKWCFspnp4ibhhwrWEEQPa3d8+MhG/EtnjPsMUvruUgdoZmcuzSmnE+LDly1gIBJGBS2JQ9s1ILQYgXfYrZKDEeVt4RvaffKlVq25BKwthPJXsXlMseFUc5k8gR3QqBn5Z+ERtIoInFLJ9z3SnIBIoGsrUIOACxck2Sl1j0k+U0sSLOmtK1AAjWahITsorLjPDxAoeRtJQ9in1RO96QM9IE8AMx09XE0xTKuNNvAvIyy8h7SoWcLw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB4215.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(396003)(136003)(376002)(39860400002)(346002)(110136005)(71200400001)(55016003)(316002)(54906003)(478600001)(86362001)(41300700001)(38070700005)(83380400001)(9686003)(53546011)(7696005)(6506007)(26005)(186003)(8676002)(4326008)(66446008)(66556008)(5660300002)(76116006)(2906002)(64756008)(66946007)(66476007)(122000001)(8936002)(33656002)(52536014)(30864003)(38100700002)(473944003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?BItcfkTDvFdKMRp115XNf70zwf/W60XL6qZzqR4HQb79d/+BnjkXwU7rDkMA?=
 =?us-ascii?Q?oE/RtNgllFNprGOFloOf+h2bQgSGkIJ5t+45b8dmycgT94upc52QXdwTCUcV?=
 =?us-ascii?Q?WvgubLThDFxEog7LFXUDyBOwfCa1kmlLIyBUft5FrElQtPgTcksmZqEKMvu9?=
 =?us-ascii?Q?8fpEt1mC2pqJMqy2Kqze54/IF8Nxtmu0NaJosYnHqs005MYOaQQ6OK+lUV0k?=
 =?us-ascii?Q?tX8MP6Y/3W8+9yujcpZeRX03l7beNVu736o/TwJW7g7I3DEUOaUqKeLm3Vn1?=
 =?us-ascii?Q?qfZkwyofdc7SZZ23F8jPIj2qwXh+L7Rd6aReq6dmbBm2FqF24xDgQOj8ybwo?=
 =?us-ascii?Q?jwOANEm/sXkv08R0fuJx5nYAtKhKxenzH6+QmMG0SkET55vxs73Yaz1ul5Gr?=
 =?us-ascii?Q?f8fGZ0rJkJgXDHIVxFSucNAnpT6jXV7rngWeWu1eE2uebr6Hq6K9tsEVv8mY?=
 =?us-ascii?Q?47jGFx0A34yU3SpY9XCbWCeeo/FdWHNX+vTEIOXG7Q08S4KAYgC6mrJ05rC3?=
 =?us-ascii?Q?KWbd4UkUyuygfUIimWbIxJkpGEB1nrw/hM5ibs5ZEbgC0dJXocnusvORSfaH?=
 =?us-ascii?Q?YuLfbKhX2Pp+G1MlvZXBT5N6Vay9wyee6dJGeUoFTBj/YmlNLwg7tWW21bzD?=
 =?us-ascii?Q?iWAP0PYMFwik/MnJz+EPn4UCCejrKDS8mbMzF/e43u9znIIxMOCSdw2qHXaS?=
 =?us-ascii?Q?MHrKN3L03daVuPL8BXT+H8hEVwn77ODochHu9SUlANl1xsgVOFkONsaAlPKb?=
 =?us-ascii?Q?fww4XV9npqPpdwF7jCpc34ygzQv2bpZG4fVL22fy0Cy1Z4Bo2rmvA0ikheqa?=
 =?us-ascii?Q?J1SgRYAX8fZZYCYrRQhIzRHhL2RkH5eypInIEw8gn5/SDgr3Cnau4r5QOokp?=
 =?us-ascii?Q?4JDyOVQAhG0WiECsvCLS/QHL4gQMkjOta9VWYjQ2mmNoEu7YWPhmeRDWawrc?=
 =?us-ascii?Q?SMjctdT+usJ2SoY2OpJm/whihOoCAXEs/vO92VjWNV/EJRq98Eo2w76SP3En?=
 =?us-ascii?Q?BIsspAv3e3Vx8Gk1di+wogNCN6zBPRE3GM6y8B6DgRR/zDmSaCRgTX44M5gz?=
 =?us-ascii?Q?RQ4krK3eB0mYl50lae9Cnw2bMNIJL7Y8p876IDIWttawmWsnkrt6AMVDfH85?=
 =?us-ascii?Q?+wyMlUA/hviiMR4SsulHyoHDbyFNJfhYwxfh3pLtRASzp9zIswtz3JS8GhNL?=
 =?us-ascii?Q?NwKFHb8Iulm5PNxAtswH1c1re2W+Jj/17pzQ9fSsitClHpiy8m5/2xyrhWAZ?=
 =?us-ascii?Q?9m0d3skjwUOCGeDul0gMm9eT49hwtcFeFzAMPhwOv3TbqAQhxrNji48fnxqA?=
 =?us-ascii?Q?QuqqxSZBG5dX17mgecuWJKRqfjZz48qRSEyMAaBdf1O5B9vN5KYYxsUfNKbs?=
 =?us-ascii?Q?jt1v4/eUifJO8lFlQa2F/B5l4sK91zPF9dyADorGgYswLE0vDG0MMuDGbqc9?=
 =?us-ascii?Q?8wwtjuzy6vIF24HJMr4ZXhoEIC13E4PLDBVQGJL50N+Zzf9CJRmuYUMYY3I6?=
 =?us-ascii?Q?a7jeUvua3Pm2QVBScVJtOQ2QLiJ72zu/Uokx5R042nnVwIg7MWCmwOOwbayh?=
 =?us-ascii?Q?tAgKsUa8P0aJWNDVCfGxHpSR9JuWaL19aLM05SKQ?=
Content-Type: multipart/alternative;
 boundary="_000_CH2PR12MB421571152FFA6D7161DF6775FC419CH2PR12MB4215namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4215.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 288b2f57-4d1c-49cd-3858-08da909551ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2022 05:53:42.2740 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vb+4LyGnq7q+f7pA6eqXj2Ak66tW3Sa81parllHzA9DavbTQT2WyzEBUiejPh/IWOikAAEXE4oH3iOycgvADbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5244
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
Cc: "Zhou1, Tao" <Tao.Zhou1@amd.com>, "Wang,
 Yang\(Kevin\)" <KevinYang.Wang@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--_000_CH2PR12MB421571152FFA6D7161DF6775FC419CH2PR12MB4215namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - General]

Yes, I will add the sequence adjustment to the comment.


-----------------
Best Regards,
Thomas

From: Zhang, Hawking <Hawking.Zhang@amd.com>
Sent: Wednesday, September 7, 2022 11:42 AM
To: Chai, Thomas <YiPeng.Chai@amd.com>; amd-gfx@lists.freedesktop.org
Cc: Zhou1, Tao <Tao.Zhou1@amd.com>; Wang, Yang(Kevin) <KevinYang.Wang@amd.c=
om>
Subject: Re: [PATCH V2] drm/amdgpu: Adjust removal control flow for smu v13=
_0_2

Thanks.

Can you please share more details to help me understand the sequence adjust=
ment in suspend?

Regards,
Hawking

From: Chai, Thomas <YiPeng.Chai@amd.com<mailto:YiPeng.Chai@amd.com>>
Date: Wednesday, September 7, 2022 at 11:29
To: Zhang, Hawking <Hawking.Zhang@amd.com<mailto:Hawking.Zhang@amd.com>>, a=
md-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org> <amd-gfx=
@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>>
Cc: Zhou1, Tao <Tao.Zhou1@amd.com<mailto:Tao.Zhou1@amd.com>>, Wang, Yang(Ke=
vin) <KevinYang.Wang@amd.com<mailto:KevinYang.Wang@amd.com>>
Subject: RE: [PATCH V2] drm/amdgpu: Adjust removal control flow for smu v13=
_0_2

[AMD Official Use Only - General]

OK, I will update patch.


-----------------
Best Regards,
Thomas

From: Zhang, Hawking <Hawking.Zhang@amd.com<mailto:Hawking.Zhang@amd.com>>
Sent: Wednesday, September 7, 2022 10:40 AM
To: Chai, Thomas <YiPeng.Chai@amd.com<mailto:YiPeng.Chai@amd.com>>; amd-gfx=
@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>
Cc: Chai, Thomas <YiPeng.Chai@amd.com<mailto:YiPeng.Chai@amd.com>>; Zhou1, =
Tao <Tao.Zhou1@amd.com<mailto:Tao.Zhou1@amd.com>>; Wang, Yang(Kevin) <Kevin=
Yang.Wang@amd.com<mailto:KevinYang.Wang@amd.com>>
Subject: Re: [PATCH V2] drm/amdgpu: Adjust removal control flow for smu v13=
_0_2


[AMD Official Use Only - General]

+static void amdgpu_device_gpu_reset(struct amdgpu_device *adev)
+{
+       struct amdgpu_reset_context reset_context;
+
+       memset(&reset_context, 0, sizeof(reset_context));
+       reset_context.method =3D AMD_RESET_METHOD_NONE;
+       reset_context.reset_req_dev =3D adev;
+       set_bit(AMDGPU_NEED_FULL_RESET, &reset_context.flags);
+       set_bit(AMDGPU_RESET_FOR_DEVICE_REMOVE, &reset_context.flags);
+
+       amdgpu_device_gpu_recover(adev, NULL, &reset_context);
+}

This wrapper is kind of confusing. Let's keep amdgpu_device_gpu_recover as =
the only entry point for recovery handling. If possible, please drop this w=
rapper,  initialize reset_context and call amdgpu_device_gpu_recover direct=
ly


+               /* If in_remove is true, psp_hw_fini should be executed aft=
er
+                *  psp_suspend to free psp shared buffers.
+                */
+               if (adev->in_remove && (adev->ip_blocks[i].version->type =
=3D=3D AMD_IP_BLOCK_TYPE_PSP))
+                       continue;
Can you please share more details to help me understand the sequence adjust=
ment here?

Regards,
Hawking

From: Chai, Thomas <YiPeng.Chai@amd.com<mailto:YiPeng.Chai@amd.com>>
Date: Tuesday, September 6, 2022 at 15:48
To: amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org> <am=
d-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>>
Cc: Chai, Thomas <YiPeng.Chai@amd.com<mailto:YiPeng.Chai@amd.com>>, Zhang, =
Hawking <Hawking.Zhang@amd.com<mailto:Hawking.Zhang@amd.com>>, Zhou1, Tao <=
Tao.Zhou1@amd.com<mailto:Tao.Zhou1@amd.com>>, Wang, Yang(Kevin) <KevinYang.=
Wang@amd.com<mailto:KevinYang.Wang@amd.com>>, Chai, Thomas <YiPeng.Chai@amd=
.com<mailto:YiPeng.Chai@amd.com>>
Subject: [PATCH V2] drm/amdgpu: Adjust removal control flow for smu v13_0_2
Adjust removal control flow for smu v13_0_2:
   During amdgpu uninstallation, when removing the first
device, the kernel needs to first send a mode1reset message
to all gpu devices. Otherwise, smu initialization will fail
the next time amdgpu is installed.

V2:
1. Update commit comments.
2. Remove the global variable amdgpu_device_remove_cnt
   and add a variable to the structure amdgpu_hive_info.
3. Use hive to detect the first removed device instead of
   a global variable.

Signed-off-by: YiPeng Chai <YiPeng.Chai@amd.com<mailto:YiPeng.Chai@amd.com>=
>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  3 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 40 +++++++++++++++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    | 35 +++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c    | 16 ++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h  |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h   |  1 +
 drivers/gpu/drm/amd/pm/amdgpu_pm.c         |  6 +++-
 7 files changed, 99 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdg=
pu/amdgpu.h
index 79bb6fd83094..465295318830 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -997,6 +997,9 @@ struct amdgpu_device {
         bool                            in_s4;
         bool                            in_s0ix;

+       /* uninstall */
+       bool                            in_remove;
+
         enum pp_mp1_state               mp1_state;
         struct amdgpu_doorbell_index doorbell_index;

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_device.c
index 62b26f0e37b0..1402717673f7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -2999,6 +2999,13 @@ static int amdgpu_device_ip_suspend_phase2(struct am=
dgpu_device *adev)
                         DRM_ERROR("suspend of IP block <%s> failed %d\n",
                                   adev->ip_blocks[i].version->funcs->name,=
 r);
                 }
+
+               /* If in_remove is true, psp_hw_fini should be executed aft=
er
+                *  psp_suspend to free psp shared buffers.
+                */
+               if (adev->in_remove && (adev->ip_blocks[i].version->type =
=3D=3D AMD_IP_BLOCK_TYPE_PSP))
+                       continue;
+
                 adev->ip_blocks[i].status.hw =3D false;
                 /* handle putting the SMC in the appropriate state */
                 if(!amdgpu_sriov_vf(adev)){
@@ -4739,6 +4746,7 @@ int amdgpu_do_asic_reset(struct list_head *device_lis=
t_handle,
         struct amdgpu_device *tmp_adev =3D NULL;
         bool need_full_reset, skip_hw_reset, vram_lost =3D false;
         int r =3D 0;
+       bool gpu_reset_for_dev_remove =3D 0;

         /* Try reset handler method first */
         tmp_adev =3D list_first_entry(device_list_handle, struct amdgpu_de=
vice,
@@ -4758,6 +4766,10 @@ int amdgpu_do_asic_reset(struct list_head *device_li=
st_handle,
                 test_bit(AMDGPU_NEED_FULL_RESET, &reset_context->flags);
         skip_hw_reset =3D test_bit(AMDGPU_SKIP_HW_RESET, &reset_context->f=
lags);

+       gpu_reset_for_dev_remove =3D
+               test_bit(AMDGPU_RESET_FOR_DEVICE_REMOVE, &reset_context->fl=
ags) &&
+                       test_bit(AMDGPU_NEED_FULL_RESET, &reset_context->fl=
ags);
+
         /*
          * ASIC reset has to be done on all XGMI hive nodes ASAP
          * to allow proper links negotiation in FW (within 1 sec)
@@ -4802,6 +4814,16 @@ int amdgpu_do_asic_reset(struct list_head *device_li=
st_handle,
                 amdgpu_ras_intr_cleared();
         }

+       /* Fixed the problem that BIOS signature errors and psp bootloader
+        * failure to load kdb on next amdgpu install.
+        */
+       if (gpu_reset_for_dev_remove) {
+               list_for_each_entry(tmp_adev, device_list_handle, reset_lis=
t)
+                       amdgpu_device_ip_resume_phase1(tmp_adev);
+
+               goto end;
+       }
+
         list_for_each_entry(tmp_adev, device_list_handle, reset_list) {
                 if (need_full_reset) {
                         /* post card */
@@ -5124,6 +5146,11 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *=
adev,
         bool need_emergency_restart =3D false;
         bool audio_suspended =3D false;
         int tmp_vram_lost_counter;
+       bool gpu_reset_for_dev_remove =3D false;
+
+       gpu_reset_for_dev_remove =3D
+                       test_bit(AMDGPU_RESET_FOR_DEVICE_REMOVE, &reset_con=
text->flags) &&
+                               test_bit(AMDGPU_NEED_FULL_RESET, &reset_con=
text->flags);

         /*
          * Special case: RAS triggered and full reset isn't supported
@@ -5159,8 +5186,11 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *=
adev,
          */
         INIT_LIST_HEAD(&device_list);
         if (!amdgpu_sriov_vf(adev) && (adev->gmc.xgmi.num_physical_nodes >=
 1)) {
-               list_for_each_entry(tmp_adev, &hive->device_list, gmc.xgmi.=
head)
+               list_for_each_entry(tmp_adev, &hive->device_list, gmc.xgmi.=
head) {
                         list_add_tail(&tmp_adev->reset_list, &device_list)=
;
+                       if (adev->in_remove)
+                               tmp_adev->in_remove =3D true;
+               }
                 if (!list_is_first(&adev->reset_list, &device_list))
                         list_rotate_to_front(&adev->reset_list, &device_li=
st);
                 device_list_handle =3D &device_list;
@@ -5243,6 +5273,10 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *=
adev,

 retry:  /* Rest of adevs pre asic reset from XGMI hive. */
         list_for_each_entry(tmp_adev, device_list_handle, reset_list) {
+               if (gpu_reset_for_dev_remove) {
+                       /* Workaroud for ASICs need to disable SMC first */
+                       amdgpu_device_smu_fini_early(tmp_adev);
+               }
                 r =3D amdgpu_device_pre_asic_reset(tmp_adev, reset_context=
);
                 /*TODO Should we stop ?*/
                 if (r) {
@@ -5276,6 +5310,9 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *a=
dev,
                         adev->asic_reset_res =3D 0;
                         goto retry;
                 }
+
+               if (!r && gpu_reset_for_dev_remove)
+                       goto recover_end;
         }

 skip_hw_reset:
@@ -5349,6 +5386,7 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *a=
dev,
                 amdgpu_device_unset_mp1_state(tmp_adev);
         }

+recover_end:
         tmp_adev =3D list_first_entry(device_list_handle, struct amdgpu_de=
vice,
                                             reset_list);
         amdgpu_device_unlock_reset_domain(tmp_adev->reset_domain);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_drv.c
index 728a0933ea6f..9271f219d8fa 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -2175,6 +2175,19 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
         return ret;
 }

+static void amdgpu_device_gpu_reset(struct amdgpu_device *adev)
+{
+       struct amdgpu_reset_context reset_context;
+
+       memset(&reset_context, 0, sizeof(reset_context));
+       reset_context.method =3D AMD_RESET_METHOD_NONE;
+       reset_context.reset_req_dev =3D adev;
+       set_bit(AMDGPU_NEED_FULL_RESET, &reset_context.flags);
+       set_bit(AMDGPU_RESET_FOR_DEVICE_REMOVE, &reset_context.flags);
+
+       amdgpu_device_gpu_recover(adev, NULL, &reset_context);
+}
+
 static void
 amdgpu_pci_remove(struct pci_dev *pdev)
 {
@@ -2186,6 +2199,28 @@ amdgpu_pci_remove(struct pci_dev *pdev)
                 pm_runtime_forbid(dev->dev);
         }

+       if (adev->asic_type =3D=3D CHIP_ALDEBARAN) {
+               bool need_to_reset_gpu =3D false;
+
+               adev->in_remove =3D true;
+               if (adev->gmc.xgmi.num_physical_nodes > 1) {
+                       struct amdgpu_hive_info *hive;
+
+                       hive =3D amdgpu_get_xgmi_hive(adev);
+                       if (hive->device_remove_count =3D=3D 0)
+                               need_to_reset_gpu =3D true;
+                       hive->device_remove_count++;
+                       amdgpu_put_xgmi_hive(hive);
+               } else
+                       need_to_reset_gpu =3D true;
+
+               /* Workaround for ASICs need to reset SMU.
+                * Called only when the first device is removed.
+                */
+               if (need_to_reset_gpu)
+                       amdgpu_device_gpu_reset(adev);
+       }
+
         amdgpu_driver_unload_kms(dev);

         drm_dev_unplug(dev);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_psp.c
index 28ca0a94b8a5..1f19f9fa4396 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
@@ -2647,7 +2647,15 @@ static int psp_hw_fini(void *handle)
         psp_asd_terminate(psp);
         psp_tmr_terminate(psp);

-       psp_ring_destroy(psp, PSP_RING_TYPE__KM);
+       /* If in_remove is true, psp_suspend is called before
+        *  psp_hw_fini. psp ring has been stopped in psp_suspend.
+        */
+       if (adev->in_remove && psp->km_ring.ring_mem)
+               amdgpu_bo_free_kernel(&adev->firmware.rbuf,
+                               &psp->km_ring.ring_mem_mc_addr,
+                               (void **)&psp->km_ring.ring_mem);
+       else
+               psp_ring_destroy(psp, PSP_RING_TYPE__KM);

         psp_free_shared_bufs(psp);

@@ -2715,6 +2723,12 @@ static int psp_suspend(void *handle)
         }

 out:
+       /* If in_remove is true, psp_hw_fini will be called after
+        * psp_suspend. Psp shared buffer will be freed in psp_hw_fini.
+        */
+       if (adev->in_remove)
+               return ret;
+
         psp_free_shared_bufs(psp);

         return ret;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_reset.h
index f71b83c42590..dc43fcb93eac 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
@@ -31,6 +31,7 @@ enum AMDGPU_RESET_FLAGS {
         AMDGPU_NEED_FULL_RESET =3D 0,
         AMDGPU_SKIP_HW_RESET =3D 1,
         AMDGPU_SKIP_MODE2_RESET =3D 2,
+       AMDGPU_RESET_FOR_DEVICE_REMOVE =3D 3,
 };

 struct amdgpu_reset_context {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h b/drivers/gpu/drm/amd=
/amdgpu/amdgpu_xgmi.h
index 552e6fb55aa8..30dcc1681b4e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h
@@ -43,6 +43,7 @@ struct amdgpu_hive_info {
         } pstate;

         struct amdgpu_reset_domain *reset_domain;
+       uint32_t device_remove_count;
 };

 struct amdgpu_pcs_ras_field {
diff --git a/drivers/gpu/drm/amd/pm/amdgpu_pm.c b/drivers/gpu/drm/amd/pm/am=
dgpu_pm.c
index 5e318b3f6c0f..6be90076c9f3 100644
--- a/drivers/gpu/drm/amd/pm/amdgpu_pm.c
+++ b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
@@ -3405,7 +3405,11 @@ int amdgpu_pm_sysfs_init(struct amdgpu_device *adev)

 void amdgpu_pm_sysfs_fini(struct amdgpu_device *adev)
 {
-       if (adev->pm.dpm_enabled =3D=3D 0)
+       /* If in_remove is true, the check for pm.dpm_enabled
+        * needs to be skipped, since smu_suspend is called before
+        * amdgpu_pm_sysfs_fini in the device removal path.
+        */
+       if ((adev->pm.dpm_enabled =3D=3D 0) && !adev->in_remove)
                 return;

         if (adev->pm.int_hwmon_dev)
--
2.25.1

--_000_CH2PR12MB421571152FFA6D7161DF6775FC419CH2PR12MB4215namp_
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
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:10.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
p.msipheaderdf3d92d6, li.msipheaderdf3d92d6, div.msipheaderdf3d92d6
	{mso-style-name:msipheaderdf3d92d6;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
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
<p class=3D"msipheaderdf3d92d6" style=3D"margin:0in"><span style=3D"font-si=
ze:10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:blue">[AMD Officia=
l Use Only - General]</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Yes, I will add <sp=
an style=3D"color:black">
the sequence adjustment to the comment.</span><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">-----------------<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Best Regards,<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Thomas<o:p></o:p></=
span></p>
</div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:11.0pt">From:</span></b>=
<span style=3D"font-size:11.0pt"> Zhang, Hawking &lt;Hawking.Zhang@amd.com&=
gt;
<br>
<b>Sent:</b> Wednesday, September 7, 2022 11:42 AM<br>
<b>To:</b> Chai, Thomas &lt;YiPeng.Chai@amd.com&gt;; amd-gfx@lists.freedesk=
top.org<br>
<b>Cc:</b> Zhou1, Tao &lt;Tao.Zhou1@amd.com&gt;; Wang, Yang(Kevin) &lt;Kevi=
nYang.Wang@amd.com&gt;<br>
<b>Subject:</b> Re: [PATCH V2] drm/amdgpu: Adjust removal control flow for =
smu v13_0_2<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Thanks. <o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;color:black">Can you=
 please share more details to help me understand the sequence adjustment in=
 suspend?</span><span style=3D"font-size:11.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Regards,<br>
Hawking<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><b><span style=3D"fon=
t-size:12.0pt;color:black">From:
</span></b><span style=3D"font-size:12.0pt;color:black">Chai, Thomas &lt;<a=
 href=3D"mailto:YiPeng.Chai@amd.com">YiPeng.Chai@amd.com</a>&gt;<br>
<b>Date: </b>Wednesday, September 7, 2022 at 11:29<br>
<b>To: </b>Zhang, Hawking &lt;<a href=3D"mailto:Hawking.Zhang@amd.com">Hawk=
ing.Zhang@amd.com</a>&gt;,
<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.=
org</a> &lt;<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.=
freedesktop.org</a>&gt;<br>
<b>Cc: </b>Zhou1, Tao &lt;<a href=3D"mailto:Tao.Zhou1@amd.com">Tao.Zhou1@am=
d.com</a>&gt;, Wang, Yang(Kevin) &lt;<a href=3D"mailto:KevinYang.Wang@amd.c=
om">KevinYang.Wang@amd.com</a>&gt;<br>
<b>Subject: </b>RE: [PATCH V2] drm/amdgpu: Adjust removal control flow for =
smu v13_0_2<o:p></o:p></span></p>
</div>
<p class=3D"msipheaderdf3d92d6" style=3D"margin:0in"><span style=3D"font-si=
ze:10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:blue">[AMD Officia=
l Use Only - General]</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;</span><o:p><=
/o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">OK, I will update p=
atch.</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;</span><o:p><=
/o:p></p>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;</span><o:p><=
/o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">-----------------</=
span><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Best Regards,</span=
><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Thomas</span><o:p><=
/o:p></p>
</div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;</span><o:p><=
/o:p></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:11.0pt">From:</span></b>=
<span style=3D"font-size:11.0pt"> Zhang, Hawking &lt;<a href=3D"mailto:Hawk=
ing.Zhang@amd.com">Hawking.Zhang@amd.com</a>&gt;
<br>
<b>Sent:</b> Wednesday, September 7, 2022 10:40 AM<br>
<b>To:</b> Chai, Thomas &lt;<a href=3D"mailto:YiPeng.Chai@amd.com">YiPeng.C=
hai@amd.com</a>&gt;;
<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.=
org</a><br>
<b>Cc:</b> Chai, Thomas &lt;<a href=3D"mailto:YiPeng.Chai@amd.com">YiPeng.C=
hai@amd.com</a>&gt;; Zhou1, Tao &lt;<a href=3D"mailto:Tao.Zhou1@amd.com">Ta=
o.Zhou1@amd.com</a>&gt;; Wang, Yang(Kevin) &lt;<a href=3D"mailto:KevinYang.=
Wang@amd.com">KevinYang.Wang@amd.com</a>&gt;<br>
<b>Subject:</b> Re: [PATCH V2] drm/amdgpu: Adjust removal control flow for =
smu v13_0_2</span><o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p style=3D"margin:5.0pt"><span style=3D"font-size:10.0pt;font-family:&quot=
;Arial&quot;,sans-serif;color:blue">[AMD Official Use Only - General]</span=
><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;</span><o:p><=
/o:p></p>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">+static void amdgpu=
_device_gpu_reset(struct amdgpu_device *adev)<br>
+{<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_reset_context reset_con=
text;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memset(&amp;reset_context, 0, sizeof(=
reset_context));<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reset_context.method =3D AMD_RESET_ME=
THOD_NONE;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reset_context.reset_req_dev =3D adev;=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set_bit(AMDGPU_NEED_FULL_RESET, &amp;=
reset_context.flags);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set_bit(AMDGPU_RESET_FOR_DEVICE_REMOV=
E, &amp;reset_context.flags);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_device_gpu_recover(adev, NULL,=
 &amp;reset_context);<br>
+}</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;</span><o:p><=
/o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">This wrapper is kin=
d of confusing. Let&#8217;s keep amdgpu_device_gpu_recover as the only entr=
y point for recovery handling. If possible, please drop this wrapper, &nbsp=
;initialize reset_context and call amdgpu_device_gpu_recover
 directly</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;</span><o:p><=
/o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;</span><o:p><=
/o:p></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><span style=3D"font-s=
ize:11.0pt">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; /* If in_remove is true, psp_hw_fini should be execu=
ted after<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; *&nbsp; psp_suspend to free psp shared buffers.<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (adev-&gt;in_remove &amp;&amp; (adev-&gt;ip_blocks[i].version=
-&gt;type =3D=3D AMD_IP_BLOCK_TYPE_PSP))<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;</span>=
<o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Can you please shar=
e more details to help me understand the sequence adjustment here?
</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;</span><o:p><=
/o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Regards,<br>
Hawking</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;</span><o:p><=
/o:p></p>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><b><span style=3D"fon=
t-size:12.0pt;color:black">From:
</span></b><span style=3D"font-size:12.0pt;color:black">Chai, Thomas &lt;<a=
 href=3D"mailto:YiPeng.Chai@amd.com">YiPeng.Chai@amd.com</a>&gt;<br>
<b>Date: </b>Tuesday, September 6, 2022 at 15:48<br>
<b>To: </b><a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.f=
reedesktop.org</a> &lt;<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd=
-gfx@lists.freedesktop.org</a>&gt;<br>
<b>Cc: </b>Chai, Thomas &lt;<a href=3D"mailto:YiPeng.Chai@amd.com">YiPeng.C=
hai@amd.com</a>&gt;, Zhang, Hawking &lt;<a href=3D"mailto:Hawking.Zhang@amd=
.com">Hawking.Zhang@amd.com</a>&gt;, Zhou1, Tao &lt;<a href=3D"mailto:Tao.Z=
hou1@amd.com">Tao.Zhou1@amd.com</a>&gt;, Wang, Yang(Kevin)
 &lt;<a href=3D"mailto:KevinYang.Wang@amd.com">KevinYang.Wang@amd.com</a>&g=
t;, Chai, Thomas &lt;<a href=3D"mailto:YiPeng.Chai@amd.com">YiPeng.Chai@amd=
.com</a>&gt;<br>
<b>Subject: </b>[PATCH V2] drm/amdgpu: Adjust removal control flow for smu =
v13_0_2</span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><span style=3D"font-s=
ize:11.0pt">Adjust removal control flow for smu v13_0_2:<br>
&nbsp;&nbsp; During amdgpu uninstallation, when removing the first<br>
device, the kernel needs to first send a mode1reset message<br>
to all gpu devices. Otherwise, smu initialization will fail<br>
the next time amdgpu is installed.<br>
<br>
V2:<br>
1. Update commit comments.<br>
2. Remove the global variable amdgpu_device_remove_cnt<br>
&nbsp;&nbsp; and add a variable to the structure amdgpu_hive_info.<br>
3. Use hive to detect the first removed device instead of<br>
&nbsp;&nbsp; a global variable.<br>
<br>
Signed-off-by: YiPeng Chai &lt;<a href=3D"mailto:YiPeng.Chai@amd.com">YiPen=
g.Chai@amd.com</a>&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; |&nbsp; 3 ++<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 40 +++++++++++++++++++++=
-<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c&nbsp;&nbsp;&nbsp; | 35 ++++++=
+++++++++++++<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c&nbsp;&nbsp;&nbsp; | 16 ++++++=
++-<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h&nbsp; |&nbsp; 1 +<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h&nbsp;&nbsp; |&nbsp; 1 +<br>
&nbsp;drivers/gpu/drm/amd/pm/amdgpu_pm.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; |&nbsp; 6 +++-<br>
&nbsp;7 files changed, 99 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdg=
pu/amdgpu.h<br>
index 79bb6fd83094..465295318830 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h<br>
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h<br>
@@ -997,6 +997,9 @@ struct amdgpu_device {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; in_s4;<br=
>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; in_s0ix;<=
br>
&nbsp;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* uninstall */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; in_remove;<br>
+<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enum pp_mp1_state&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 mp1_state;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_doorbell_ind=
ex doorbell_index;<br>
&nbsp;<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_device.c<br>
index 62b26f0e37b0..1402717673f7 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<br>
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<br>
@@ -2999,6 +2999,13 @@ static int amdgpu_device_ip_suspend_phase2(struct am=
dgpu_device *adev)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_E=
RROR(&quot;suspend of IP block &lt;%s&gt; failed %d\n&quot;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;ip_blocks[i=
].version-&gt;funcs-&gt;name, r);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; /* If in_remove is true, psp_hw_fini should be executed after<br=
>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; *&nbsp; psp_suspend to free psp shared buffers.<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (adev-&gt;in_remove &amp;&amp; (adev-&gt;ip_blocks[i].version=
-&gt;type =3D=3D AMD_IP_BLOCK_TYPE_PSP))<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;<br>
+<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; adev-&gt;ip_blocks[i].status.hw =3D false;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; /* handle putting the SMC in the appropriate state */=
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; if(!amdgpu_sriov_vf(adev)){<br>
@@ -4739,6 +4746,7 @@ int amdgpu_do_asic_reset(struct list_head *device_lis=
t_handle,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_device *tmp_=
adev =3D NULL;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool need_full_reset, skip=
_hw_reset, vram_lost =3D false;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int r =3D 0;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool gpu_reset_for_dev_remove =3D 0;<=
br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Try reset handler metho=
d first */<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tmp_adev =3D list_first_en=
try(device_list_handle, struct amdgpu_device,<br>
@@ -4758,6 +4766,10 @@ int amdgpu_do_asic_reset(struct list_head *device_li=
st_handle,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; test_bit(AMDGPU_NEED_FULL_RESET, &amp;reset_context-&=
gt;flags);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; skip_hw_reset =3D test_bit=
(AMDGPU_SKIP_HW_RESET, &amp;reset_context-&gt;flags);<br>
&nbsp;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gpu_reset_for_dev_remove =3D<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; test_bit(AMDGPU_RESET_FOR_DEVICE_REMOVE, &amp;reset_context-&gt;=
flags) &amp;&amp;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test_bit(AMDGPU_=
NEED_FULL_RESET, &amp;reset_context-&gt;flags);<br>
+<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * ASIC reset has to =
be done on all XGMI hive nodes ASAP<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * to allow proper li=
nks negotiation in FW (within 1 sec)<br>
@@ -4802,6 +4814,16 @@ int amdgpu_do_asic_reset(struct list_head *device_li=
st_handle,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; amdgpu_ras_intr_cleared();<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Fixed the problem that BIOS signat=
ure errors and psp bootloader<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * failure to load kdb on next a=
mdgpu install.<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (gpu_reset_for_dev_remove) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; list_for_each_entry(tmp_adev, device_list_handle, reset_list)<br=
>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_device_ip=
_resume_phase1(tmp_adev);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; goto end;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; list_for_each_entry(tmp_ad=
ev, device_list_handle, reset_list) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; if (need_full_reset) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* po=
st card */<br>
@@ -5124,6 +5146,11 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *=
adev,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool need_emergency_restar=
t =3D false;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool audio_suspended =3D f=
alse;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int tmp_vram_lost_counter;=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool gpu_reset_for_dev_remove =3D fal=
se;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gpu_reset_for_dev_remove =3D<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test_bit(AMDGPU_=
RESET_FOR_DEVICE_REMOVE, &amp;reset_context-&gt;flags) &amp;&amp;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test_bit(AMDGPU_NEED_FULL_RESET, &amp;reset=
_context-&gt;flags);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Special case: RAS =
triggered and full reset isn't supported<br>
@@ -5159,8 +5186,11 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *=
adev,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; INIT_LIST_HEAD(&amp;device=
_list);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!amdgpu_sriov_vf(adev)=
 &amp;&amp; (adev-&gt;gmc.xgmi.num_physical_nodes &gt; 1)) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; list_for_each_entry(tmp_adev, &amp;hive-&gt;device_list, gmc.xgm=
i.head)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; list_for_each_entry(tmp_adev, &amp;hive-&gt;device_list, gmc.xgm=
i.head) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; list_=
add_tail(&amp;tmp_adev-&gt;reset_list, &amp;device_list);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;in_=
remove)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tmp_adev-&gt;in_remove =3D true;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; if (!list_is_first(&amp;adev-&gt;reset_list, &amp;dev=
ice_list))<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; list_=
rotate_to_front(&amp;adev-&gt;reset_list, &amp;device_list);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; device_list_handle =3D &amp;device_list;<br>
@@ -5243,6 +5273,10 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *=
adev,<br>
&nbsp;<br>
&nbsp;retry:&nbsp; /* Rest of adevs pre asic reset from XGMI hive. */<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; list_for_each_entry(tmp_ad=
ev, device_list_handle, reset_list) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (gpu_reset_for_dev_remove) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Workaroud for=
 ASICs need to disable SMC first */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_device_sm=
u_fini_early(tmp_adev);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; r =3D amdgpu_device_pre_asic_reset(tmp_adev, reset_co=
ntext);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; /*TODO Should we stop ?*/<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; if (r) {<br>
@@ -5276,6 +5310,9 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *a=
dev,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-=
&gt;asic_reset_res =3D 0;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto =
retry;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (!r &amp;&amp; gpu_reset_for_dev_remove)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto recover_end=
;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
&nbsp;skip_hw_reset:<br>
@@ -5349,6 +5386,7 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *a=
dev,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; amdgpu_device_unset_mp1_state(tmp_adev);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
+recover_end:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tmp_adev =3D list_first_en=
try(device_list_handle, struct amdgpu_device,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reset_list);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_device_unlock_reset=
_domain(tmp_adev-&gt;reset_domain);<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_drv.c<br>
index 728a0933ea6f..9271f219d8fa 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c<br>
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c<br>
@@ -2175,6 +2175,19 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,<br=
>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
+static void amdgpu_device_gpu_reset(struct amdgpu_device *adev)<br>
+{<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_reset_context reset_con=
text;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memset(&amp;reset_context, 0, sizeof(=
reset_context));<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reset_context.method =3D AMD_RESET_ME=
THOD_NONE;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reset_context.reset_req_dev =3D adev;=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set_bit(AMDGPU_NEED_FULL_RESET, &amp;=
reset_context.flags);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set_bit(AMDGPU_RESET_FOR_DEVICE_REMOV=
E, &amp;reset_context.flags);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_device_gpu_recover(adev, NULL,=
 &amp;reset_context);<br>
+}<br>
+<br>
&nbsp;static void<br>
&nbsp;amdgpu_pci_remove(struct pci_dev *pdev)<br>
&nbsp;{<br>
@@ -2186,6 +2199,28 @@ amdgpu_pci_remove(struct pci_dev *pdev)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; pm_runtime_forbid(dev-&gt;dev);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;asic_type =3D=3D CHIP_AL=
DEBARAN) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; bool need_to_reset_gpu =3D false;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; adev-&gt;in_remove =3D true;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (adev-&gt;gmc.xgmi.num_physical_nodes &gt; 1) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_hi=
ve_info *hive;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hive =3D amdgpu_=
get_xgmi_hive(adev);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (hive-&gt;dev=
ice_remove_count =3D=3D 0)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; need_to_reset_gpu =3D true;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hive-&gt;device_=
remove_count++;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_put_xgmi_=
hive(hive);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; } else<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; need_to_reset_gp=
u =3D true;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; /* Workaround for ASICs need to reset SMU.<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; * Called only when the first device is removed.<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (need_to_reset_gpu)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_device_gp=
u_reset(adev);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_driver_unload_kms(d=
ev);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_dev_unplug(dev);<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_psp.c<br>
index 28ca0a94b8a5..1f19f9fa4396 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c<br>
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c<br>
@@ -2647,7 +2647,15 @@ static int psp_hw_fini(void *handle)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; psp_asd_terminate(psp);<br=
>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; psp_tmr_terminate(psp);<br=
>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; psp_ring_destroy(psp, PSP_RING_TYPE__=
KM);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* If in_remove is true, psp_suspend =
is called before<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *&nbsp; psp_hw_fini. psp ring h=
as been stopped in psp_suspend.<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;in_remove &amp;&amp; psp=
-&gt;km_ring.ring_mem)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; amdgpu_bo_free_kernel(&amp;adev-&gt;firmware.rbuf,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;psp-&gt;km_ring.ring_mem_mc_addr,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (void **)&amp;psp-&gt;km_ring.ring_mem);<br=
>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; psp_ring_destroy(psp, PSP_RING_TYPE__KM);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; psp_free_shared_bufs(psp);=
<br>
&nbsp;<br>
@@ -2715,6 +2723,12 @@ static int psp_suspend(void *handle)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
&nbsp;out:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* If in_remove is true, psp_hw_fini =
will be called after<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * psp_suspend. Psp shared buffe=
r will be freed in psp_hw_fini.<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;in_remove)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return ret;<br>
+<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; psp_free_shared_bufs(psp);=
<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_reset.h<br>
index f71b83c42590..dc43fcb93eac 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h<br>
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h<br>
@@ -31,6 +31,7 @@ enum AMDGPU_RESET_FLAGS {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AMDGPU_NEED_FULL_RESET =3D=
 0,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AMDGPU_SKIP_HW_RESET =3D 1=
,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AMDGPU_SKIP_MODE2_RESET =
=3D 2,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AMDGPU_RESET_FOR_DEVICE_REMOVE =3D 3,=
<br>
&nbsp;};<br>
&nbsp;<br>
&nbsp;struct amdgpu_reset_context {<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h b/drivers/gpu/drm/amd=
/amdgpu/amdgpu_xgmi.h<br>
index 552e6fb55aa8..30dcc1681b4e 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h<br>
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h<br>
@@ -43,6 +43,7 @@ struct amdgpu_hive_info {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } pstate;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_reset_domain=
 *reset_domain;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t device_remove_count;<br>
&nbsp;};<br>
&nbsp;<br>
&nbsp;struct amdgpu_pcs_ras_field {<br>
diff --git a/drivers/gpu/drm/amd/pm/amdgpu_pm.c b/drivers/gpu/drm/amd/pm/am=
dgpu_pm.c<br>
index 5e318b3f6c0f..6be90076c9f3 100644<br>
--- a/drivers/gpu/drm/amd/pm/amdgpu_pm.c<br>
+++ b/drivers/gpu/drm/amd/pm/amdgpu_pm.c<br>
@@ -3405,7 +3405,11 @@ int amdgpu_pm_sysfs_init(struct amdgpu_device *adev)=
<br>
&nbsp;<br>
&nbsp;void amdgpu_pm_sysfs_fini(struct amdgpu_device *adev)<br>
&nbsp;{<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;pm.dpm_enabled =3D=3D 0)=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* If in_remove is true, the check fo=
r pm.dpm_enabled<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * needs to be skipped, since sm=
u_suspend is called before<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * amdgpu_pm_sysfs_fini in the d=
evice removal path.<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((adev-&gt;pm.dpm_enabled =3D=3D 0=
) &amp;&amp; !adev-&gt;in_remove)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;pm.int_hwmon_=
dev)<br>
-- <br>
2.25.1</span><o:p></o:p></p>
</div>
</div>
</div>
</body>
</html>

--_000_CH2PR12MB421571152FFA6D7161DF6775FC419CH2PR12MB4215namp_--
