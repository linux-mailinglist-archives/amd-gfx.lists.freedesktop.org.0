Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE5A3EF809
	for <lists+amd-gfx@lfdr.de>; Wed, 18 Aug 2021 04:23:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43BFD6E303;
	Wed, 18 Aug 2021 02:23:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2074.outbound.protection.outlook.com [40.107.237.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C6286E30C
 for <amd-gfx@lists.freedesktop.org>; Wed, 18 Aug 2021 02:23:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n8H93W7Wd1pxaBbdlkGOEWjvp0KHkGvYPlRWf25HFsj89d+kNc7DiV5mC6yzpvMhq/lRZG5ikiEnVRXbkLn28TRdxlzc+vnvIt2vKcFG68W882wCsganGWkAfiDmXUdbdIurfp/yTU3CpkMxgeJxE99hbpQzNpqgVKjGfl2l1Mit1T7hIyWNANATiAHss8rEY8UfVHXySe/geTe2oNrg++Je8Zl8jozXVYMGQUr25IYS7fyys+jw8Qht8reGoDr0xRt1cMdCgFZSEO7Rtz1rtFNRzGawRj9PzzcHk2H7DECf+lCRh1zjy6tGthP/0mP4yAP0N0M9bytmPiwRh2pi4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2LF75sjNDOw+7cENBj7coeM9PdaKT7wFX8A0KuNyszY=;
 b=NPRjqgykZMu/Pp8MtnCEPygIzLQJacjSK/a3IrD4VNjaFIp3m/qvT1ZILsWDqAQcbmVpMNwL3oFd/oTsnjNnIfL0+epQc3WPNw2qncyWiegnmVpixZTG+iQcqsDvAOcr9soGutq5Dk/18tziNprddX1LTmA4RaG/WSgW9qk1vzbOqu115dc6EmPc/QJj86VmWWimlIkWbvvyd+LaApMvSsgd9sBzkRVykx+p5hpWfxMyPp+HxaXW2o7n5HqjVQcSvjOzqPA1TsOJmr3GERt9GN3CAGD/Nh8pUiEcWfWjHBdXbh+Qez0x5f8efP2oHAm6IKjmwjrr73rdRIAEIuoHng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2LF75sjNDOw+7cENBj7coeM9PdaKT7wFX8A0KuNyszY=;
 b=yKBusFUAv+iNvMXW28J7/1cmbiR00ijFlblgrt8CoiIo8uUGVoRuF4cFFJrQ2Ml1uj/yA5m1HdCerZnlDsguNI3dNbt9zP+iw7cKPUp2xvjFJweWhVnk1RbUU4U59Hd8txpVZI1msQ3kaE+/Oc4fi0ibQxrcqsS10PFAFePVAzU=
Received: from DM5PR12MB2469.namprd12.prod.outlook.com (2603:10b6:4:af::38) by
 DM6PR12MB2890.namprd12.prod.outlook.com (2603:10b6:5:15e::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.23; Wed, 18 Aug 2021 02:23:35 +0000
Received: from DM5PR12MB2469.namprd12.prod.outlook.com
 ([fe80::453c:6ded:8973:744e]) by DM5PR12MB2469.namprd12.prod.outlook.com
 ([fe80::453c:6ded:8973:744e%4]) with mapi id 15.20.4415.024; Wed, 18 Aug 2021
 02:23:35 +0000
From: "Chen, Guchun" <Guchun.Chen@amd.com>
To: Mike Lothian <mike@fireburn.co.uk>
CC: Alex Deucher <alexdeucher@gmail.com>, =?iso-8859-1?Q?Christian_K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Gao, Likun" <Likun.Gao@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, "Zhang, Hawking"
 <Hawking.Zhang@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: RE: [PATCH] drm/amdgpu: avoid over-handle of fence driver fini in s3
 test (v2)
Thread-Topic: [PATCH] drm/amdgpu: avoid over-handle of fence driver fini in s3
 test (v2)
Thread-Index: AQHXh12IB96Cm6kAd0+4i+qoX2BuqKtfyE6AgAAXjgCAAFfjgIAAzsVggBeWtYCAAAEHgIAAAsVw
Date: Wed, 18 Aug 2021 02:23:35 +0000
Message-ID: <DM5PR12MB24695E8F2DFE2EE603354D8FF1FF9@DM5PR12MB2469.namprd12.prod.outlook.com>
References: <20210802051602.23822-1-guchun.chen@amd.com>
 <b7218d98-9eb1-2d41-157a-bc417ef496ab@gmail.com>
 <DM5PR12MB2469A94D544647D893DA0FAAF1EF9@DM5PR12MB2469.namprd12.prod.outlook.com>
 <CADnq5_N_56yTXq4W8N3GG2kNsyEaCD1-xF8Mip8=26q0oRw39A@mail.gmail.com>
 <DM5PR12MB2469AD07423359B8EC3EE763F1F09@DM5PR12MB2469.namprd12.prod.outlook.com>
 <CAHbf0-H+L=BbvYidcqziwDfvGHwdsaKi9L7Tz6QKinUTRbbLTA@mail.gmail.com>
 <CAHbf0-H=EwCx6jHXNJRzh5WfMxu2VmTdXnNPUPgjS5TcZAAp1Q@mail.gmail.com>
In-Reply-To: <CAHbf0-H=EwCx6jHXNJRzh5WfMxu2VmTdXnNPUPgjS5TcZAAp1Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2021-08-18T02:23:31Z; 
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=66dfe09c-9783-4b4d-ac45-2d7e3d92daa5;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
authentication-results: fireburn.co.uk; dkim=none (message not signed)
 header.d=none;fireburn.co.uk; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 528f7410-7dce-4fd1-5677-08d961ef2e97
x-ms-traffictypediagnostic: DM6PR12MB2890:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB2890E721DFB7F3BA4B8E173EF1FF9@DM6PR12MB2890.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:639;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: r/1r20CrDQFJqVccAKEQzqgJg5WTaqB7CT+eaEjrpecGQLSD1XS1c7umz7bqRMC1FNRNPtugpmtg8Wdgz4SMfAFeHHniqvUKkDfIESd5ViO3fueqUd34HqdIEpqJ3Hh6x9Qx+tJ0jHT13n4FTFu/Mt3vmVkoUz9I+ZV1TL4lNtNQeCIBTQPa774PgtoReystXlxItbKlvQRh8e5eyjbsOWuOO/IgmXmFKz75avMIXSDhRtiu+zQH5WJF4iTt59rin+q8yOYEhiy5F3BciH8dsWjdIXNUbO7PJjvew1IAEmTXfnzPkDQNATNwV6sjEwKgH/kzmVr2RsOEsra0KEpUwnDylgJqM5WKDmRl79jLy7IWm1UwWS78xDYibMzyku2Ud1M844++UMx0y7aHW0MdARWmaf7omXhUwuHHPFmUwM+i8fn9LdTC1JhpEdI7P5JL/42n6WdVK/5D8MS/odyXrytxFnZiVMYqefQ9Iw2f6Fz+5+ShoZUlXpsvGTx1ukJj3b2tNP89P/gXyrIayxxdV8OlOuwwgvVJnImOdd58XcjeTRGPRm51Glk2J18RbYhxOMrUyAS/I3RXmkfU12cGPSvlBobnLnsPIb1U6RNYR2CNa4iV7JGTXRCip2SrArHEMPp6YX74jHjmbLNz7d1plM20YNu/L/WeE8W9u4iefYuHqZSEqOCHCtOWzvn/tRFMDvf4BDrqwAuMsqM87y2SsmJvWexIZG1FXiwIljdvRZaLDD02mdw7tKrw5L+lJiURR2slEh78xmS4O/GrHB0p7CIvJDzplHsK6EgrMPhcXl0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB2469.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(136003)(366004)(39860400002)(376002)(45080400002)(30864003)(33656002)(2906002)(71200400001)(5660300002)(4326008)(55016002)(6916009)(52536014)(76116006)(66446008)(38070700005)(9686003)(166002)(66946007)(86362001)(66574015)(54906003)(316002)(26005)(66476007)(64756008)(966005)(66556008)(8936002)(8676002)(7696005)(38100700002)(478600001)(122000001)(53546011)(6506007)(83380400001)(186003)(579004)(559001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?OW/44O1I7auPW6IxGLzG3bEwys07Ftm+BPZlPypNxA9zSDbVMDtozt7y1D?=
 =?iso-8859-1?Q?pKMHig3y0ugahXfmJFPxEXEc3I+eguiBD4pxtxzTiltyehspeRQolXBUUb?=
 =?iso-8859-1?Q?IavXOT2jHgqOByhazF3sxvfM1LfsAeBh1glhl3O3Rm5BbatlvE3hN1OE6q?=
 =?iso-8859-1?Q?pMxXi4aTFsZYqb1YT+yk5K+ERot3vGz9tFfCw3KoUjHApvHigmUt38EnPv?=
 =?iso-8859-1?Q?CiQonJjLRkaDHtOdSsqPBt/8gOXFJXVtszeuIBhgX0y5UICMASfrI6GIIK?=
 =?iso-8859-1?Q?IcNIxOwYY0y4ZSdZfXZh4UnUmY9DqOGgXbPr3QNvhtg5n976rpp2PUXGIY?=
 =?iso-8859-1?Q?nZeehfZuCZdeRAxmfHq4U+r3oMYygXXS6QErw6y8/5DzxDx1PTPdsjCLmO?=
 =?iso-8859-1?Q?oVyNwV7HRvR1GpUe+IWnFSIxNscoO4P4tP1V5gYVbYU1qj5LhqT8QCvOmo?=
 =?iso-8859-1?Q?q032jhEz0PFEamWe3hu1Oi8FS377UcBXxV4Lz3NfAPIrHvcdiOgsmgyScv?=
 =?iso-8859-1?Q?N1UqZZctNyFPmEgUWsSbpNfN9PDSKIkuwc2x+24R+lMXwJlJ6/fbjZVlFY?=
 =?iso-8859-1?Q?YToNDDe9uh+/xlwLu0rGRJJWgcpbI+7NeefYsXUC7EKEazWHYbbVF/VJbL?=
 =?iso-8859-1?Q?y7rFt/ORbiZ0qaH5lTO6at/9G52nuJznkhYD5JQ9tQzGNYo4Y2CAgKRcy4?=
 =?iso-8859-1?Q?mmS0zJDY9PkR6l/+OkvCi5xkezk4xJRjZdqCp+bAz/nc1NFIkvDSEzdtXX?=
 =?iso-8859-1?Q?MALm9cLLB3sffG0nC/dr+0CNCl34sU/owmM5m9O9tQn3EtyDICie8fnvWm?=
 =?iso-8859-1?Q?i7Jg0+i8ZhyRE81QnPH6BzLwJ4IJYYOGb2/YmjDevpcl7E3H/9hAKifJ+2?=
 =?iso-8859-1?Q?CaPOi9MwE1n0uj2zeSjDVTI99ga3Pon4RxKkJ+adVmyqPZ5D7iwt6jBAtz?=
 =?iso-8859-1?Q?2tJwUQZxuy9ZFjG+iddssBu+oT8uKYmbmkVHR/gOg8CYXwXq3L6W1hT3Mh?=
 =?iso-8859-1?Q?MdjQP091uwMq0NzviwgEHH1H7PbVTV6d7rI6Q8T7WJ6143Yo3h5LXfwdVC?=
 =?iso-8859-1?Q?ATgHwE011CRQl21luol7Z8O0WwukK+231Iwngu9Q8z7FxxP3AjKQWDD0qI?=
 =?iso-8859-1?Q?sQ3/qSoIWut8KYBa9/y1Rni4FET+SpkGNX9Eu9uVltsU/TiVMWjeDn5CHO?=
 =?iso-8859-1?Q?O0PWAJiP3wkv07ilr3RzxKQtLYGKLyCDc+1dFqfS4CUnezP/YT6MXOJc5n?=
 =?iso-8859-1?Q?4ec0bGkjpp3k/ILDEiF9g23D0pmDV4hxrPzPJEgUDG0t5iBuzWy84xgspE?=
 =?iso-8859-1?Q?OspugAew6EiP8YxUwBQolkuvIJ6Xi9SB+23kOnCIlWTSK7DPD7BfSq8ApC?=
 =?iso-8859-1?Q?fu4LKYhyui?=
Content-Type: multipart/alternative;
 boundary="_000_DM5PR12MB24695E8F2DFE2EE603354D8FF1FF9DM5PR12MB2469namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB2469.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 528f7410-7dce-4fd1-5677-08d961ef2e97
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2021 02:23:35.5344 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g/CaLty0lZz8A+Uloigh2MV7XSYJA557ovKHsOEOIrsHxytwxlVDiKk5mb/Hy/TVW+H03jIlVNvFtHJDE7wGiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2890
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--_000_DM5PR12MB24695E8F2DFE2EE603354D8FF1FF9DM5PR12MB2469namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

[Public]

Hi Mike,

Thanks for your info. So with Weston, the issue can be observed, while with=
 X, no such issue?

Regards,
Guchun

From: Mike Lothian <mike@fireburn.co.uk>
Sent: Wednesday, August 18, 2021 10:12 AM
To: Chen, Guchun <Guchun.Chen@amd.com>
Cc: Alex Deucher <alexdeucher@gmail.com>; Christian K=F6nig <ckoenig.leicht=
zumerken@gmail.com>; amd-gfx@lists.freedesktop.org; Gao, Likun <Likun.Gao@a=
md.com>; Koenig, Christian <Christian.Koenig@amd.com>; Zhang, Hawking <Hawk=
ing.Zhang@amd.com>; Deucher, Alexander <Alexander.Deucher@amd.com>
Subject: Re: [PATCH] drm/amdgpu: avoid over-handle of fence driver fini in =
s3 test (v2)

Here's the dmesg

Linux version 5.14.0-rc3-agd5f+ (root@axion.fireburn.co.uk<mailto:root@axio=
n.fireburn.co.uk>) (clang version 12.0.1, LLD 12.0.1) #1279 SMP Tue Aug 17 =
02:23:10 BST 2021
Command line:
KERNEL supported cpus:
  Intel GenuineIntel
x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
x86/fpu: Supporting XSAVE feature 0x008: 'MPX bounds registers'
x86/fpu: Supporting XSAVE feature 0x010: 'MPX CSR'
x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
x86/fpu: xstate_offset[3]:  832, xstate_sizes[3]:   64
x86/fpu: xstate_offset[4]:  896, xstate_sizes[4]:   64
x86/fpu: Enabled xstate features 0x1f, context size is 960 bytes, using 'co=
mpacted' format.
signal: max sigframe size: 2032
BIOS-provided physical RAM map:
BIOS-e820: [mem 0x0000000000000000-0x0000000000057fff] usable
BIOS-e820: [mem 0x0000000000058000-0x0000000000058fff] reserved
BIOS-e820: [mem 0x0000000000059000-0x000000000009dfff] usable
BIOS-e820: [mem 0x000000000009e000-0x000000000009ffff] reserved
BIOS-e820: [mem 0x0000000000100000-0x00000000312bafff] usable
BIOS-e820: [mem 0x00000000312bb000-0x00000000312ccfff] reserved
BIOS-e820: [mem 0x00000000312cd000-0x00000000312e5fff] usable
BIOS-e820: [mem 0x00000000312e6000-0x00000000312e6fff] ACPI NVS
BIOS-e820: [mem 0x00000000312e7000-0x0000000031330fff] reserved
BIOS-e820: [mem 0x0000000031331000-0x000000003138bfff] usable
BIOS-e820: [mem 0x000000003138c000-0x0000000031aaafff] reserved
BIOS-e820: [mem 0x0000000031aab000-0x00000000362a0fff] usable
BIOS-e820: [mem 0x00000000362a1000-0x00000000372bbfff] reserved
BIOS-e820: [mem 0x00000000372bc000-0x00000000372fafff] ACPI data
BIOS-e820: [mem 0x00000000372fb000-0x000000003789afff] ACPI NVS
BIOS-e820: [mem 0x000000003789b000-0x0000000037ffefff] reserved
BIOS-e820: [mem 0x0000000037fff000-0x0000000037ffffff] usable
BIOS-e820: [mem 0x0000000038000000-0x00000000380fffff] reserved
BIOS-e820: [mem 0x00000000e0000000-0x00000000efffffff] reserved
BIOS-e820: [mem 0x00000000fe000000-0x00000000fe010fff] reserved
BIOS-e820: [mem 0x00000000fec00000-0x00000000fec00fff] reserved
BIOS-e820: [mem 0x00000000fee00000-0x00000000fee00fff] reserved
BIOS-e820: [mem 0x00000000ff000000-0x00000000ffffffff] reserved
BIOS-e820: [mem 0x0000000100000000-0x00000008c1ffffff] usable
NX (Execute Disable) protection: active
e820: update [mem 0x310ad018-0x310bcc57] usable =3D=3D> usable
e820: update [mem 0x310ad018-0x310bcc57] usable =3D=3D> usable
e820: update [mem 0x3109c018-0x310ac057] usable =3D=3D> usable
e820: update [mem 0x3109c018-0x310ac057] usable =3D=3D> usable
extended physical RAM map:
reserve setup_data: [mem 0x0000000000000000-0x0000000000057fff] usable
reserve setup_data: [mem 0x0000000000058000-0x0000000000058fff] reserved
reserve setup_data: [mem 0x0000000000059000-0x000000000009dfff] usable
reserve setup_data: [mem 0x000000000009e000-0x000000000009ffff] reserved
reserve setup_data: [mem 0x0000000000100000-0x000000003109c017] usable
reserve setup_data: [mem 0x000000003109c018-0x00000000310ac057] usable
reserve setup_data: [mem 0x00000000310ac058-0x00000000310ad017] usable
reserve setup_data: [mem 0x00000000310ad018-0x00000000310bcc57] usable
reserve setup_data: [mem 0x00000000310bcc58-0x00000000312bafff] usable
reserve setup_data: [mem 0x00000000312bb000-0x00000000312ccfff] reserved
reserve setup_data: [mem 0x00000000312cd000-0x00000000312e5fff] usable
reserve setup_data: [mem 0x00000000312e6000-0x00000000312e6fff] ACPI NVS
reserve setup_data: [mem 0x00000000312e7000-0x0000000031330fff] reserved
reserve setup_data: [mem 0x0000000031331000-0x000000003138bfff] usable
reserve setup_data: [mem 0x000000003138c000-0x0000000031aaafff] reserved
reserve setup_data: [mem 0x0000000031aab000-0x00000000362a0fff] usable
reserve setup_data: [mem 0x00000000362a1000-0x00000000372bbfff] reserved
reserve setup_data: [mem 0x00000000372bc000-0x00000000372fafff] ACPI data
reserve setup_data: [mem 0x00000000372fb000-0x000000003789afff] ACPI NVS
reserve setup_data: [mem 0x000000003789b000-0x0000000037ffefff] reserved
reserve setup_data: [mem 0x0000000037fff000-0x0000000037ffffff] usable
reserve setup_data: [mem 0x0000000038000000-0x00000000380fffff] reserved
reserve setup_data: [mem 0x00000000e0000000-0x00000000efffffff] reserved
reserve setup_data: [mem 0x00000000fe000000-0x00000000fe010fff] reserved
reserve setup_data: [mem 0x00000000fec00000-0x00000000fec00fff] reserved
reserve setup_data: [mem 0x00000000fee00000-0x00000000fee00fff] reserved
reserve setup_data: [mem 0x00000000ff000000-0x00000000ffffffff] reserved
reserve setup_data: [mem 0x0000000100000000-0x00000008c1ffffff] usable
efi: EFI v2.40 by American Megatrends
efi: ESRT=3D0x37f83018 ACPI=3D0x372c8000 ACPI 2.0=3D0x372c8000 SMBIOS=3D0x3=
7ecd000
SMBIOS 2.8 present.
DMI: Alienware Alienware 15 R2/0H6J09, BIOS 1.13.1 06/10/2021
tsc: Detected 2700.000 MHz processor
tsc: Detected 2699.909 MHz TSC
e820: update [mem 0x00000000-0x00000fff] usable =3D=3D> reserved
e820: remove [mem 0x000a0000-0x000fffff] usable
last_pfn =3D 0x8c2000 max_arch_pfn =3D 0x400000000
x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT
last_pfn =3D 0x38000 max_arch_pfn =3D 0x400000000
esrt: Reserving ESRT space from 0x0000000037f83018 to 0x0000000037f83050.
Kernel/User page tables isolation: disabled on command line.
Using GB pages for direct mapping
Secure boot disabled
ACPI: Early table checksum verification disabled
ACPI: RSDP 0x00000000372C8000 000024 (v02 ALWARE)
ACPI: XSDT 0x00000000372C80A8 0000CC (v01 ALWARE ALIENWRE 01072009 AMI  000=
10013)
ACPI: FACP 0x00000000372EBF70 00010C (v05 ALWARE ALIENWRE 01072009 AMI  000=
10013)
ACPI: DSDT 0x00000000372C8200 023D6B (v02 ALWARE ALIENWRE 01072009 INTL 201=
20913)
ACPI: FACS 0x0000000037899F80 000040
ACPI: APIC 0x00000000372EC080 0000BC (v03 ALWARE ALIENWRE 01072009 AMI  000=
10013)
ACPI: FPDT 0x00000000372EC140 000044 (v01 ALWARE ALIENWRE 01072009 AMI  000=
10013)
ACPI: FIDT 0x00000000372EC188 00009C (v01 ALWARE ALIENWRE 01072009 AMI  000=
10013)
ACPI: MCFG 0x00000000372EC228 00003C (v01 ALWARE ALIENWRE 01072009 MSFT 000=
00097)
ACPI: HPET 0x00000000372EC268 000038 (v01 ALWARE ALIENWRE 01072009 AMI. 000=
5000B)
ACPI: SSDT 0x00000000372EC2A0 0004B9 (v01 SataRe SataTabl 00001000 INTL 201=
20913)
ACPI: LPIT 0x00000000372EC760 000094 (v01 INTEL  SKL      00000000 MSFT 000=
0005F)
ACPI: SSDT 0x00000000372EC7F8 000248 (v02 INTEL  sensrhub 00000000 INTL 201=
20913)
ACPI: SSDT 0x00000000372ECA40 002BAE (v02 INTEL  PtidDevc 00001000 INTL 201=
20913)
ACPI: DBGP 0x00000000372EF5F0 000034 (v01 INTEL           00000000 MSFT 000=
0005F)
ACPI: DBG2 0x00000000372EF628 000054 (v00 INTEL           00000000 MSFT 000=
0005F)
ACPI: SSDT 0x00000000372EF680 00069D (v02 INTEL  xh_rvp10 00000000 INTL 201=
20913)
ACPI: SSDT 0x00000000372EFD20 002DB7 (v02 DptfTa DptfTabl 00001000 INTL 201=
20913)
ACPI: SSDT 0x00000000372F2AD8 00559B (v02 SaSsdt SaSsdt   00003000 INTL 201=
20913)
ACPI: UEFI 0x00000000372F8078 000042 (v01                 00000000      000=
00000)
ACPI: SSDT 0x00000000372F80C0 000E58 (v02 CpuRef CpuSsdt  00003000 INTL 201=
20913)
ACPI: SSDT 0x00000000372F8F18 0000CE (v02 SgRef  SgPeg    00001000 INTL 201=
20913)
ACPI: DMAR 0x00000000372F8FE8 0000A8 (v01 INTEL  SKL      00000001 INTL 000=
00001)
ACPI: BGRT 0x00000000372F9090 000038 (v01 ALWARE ALIENWRE 01072009 AMI  000=
10013)
ACPI: SSDT 0x00000000372F90C8 001216 (v01 AmdRef AmdTabl  00001000 INTL 201=
20913)
ACPI: Reserving FACP table memory at [mem 0x372ebf70-0x372ec07b]
ACPI: Reserving DSDT table memory at [mem 0x372c8200-0x372ebf6a]
ACPI: Reserving FACS table memory at [mem 0x37899f80-0x37899fbf]
ACPI: Reserving APIC table memory at [mem 0x372ec080-0x372ec13b]
ACPI: Reserving FPDT table memory at [mem 0x372ec140-0x372ec183]
ACPI: Reserving FIDT table memory at [mem 0x372ec188-0x372ec223]
ACPI: Reserving MCFG table memory at [mem 0x372ec228-0x372ec263]
ACPI: Reserving HPET table memory at [mem 0x372ec268-0x372ec29f]
ACPI: Reserving SSDT table memory at [mem 0x372ec2a0-0x372ec758]
ACPI: Reserving LPIT table memory at [mem 0x372ec760-0x372ec7f3]
ACPI: Reserving SSDT table memory at [mem 0x372ec7f8-0x372eca3f]
ACPI: Reserving SSDT table memory at [mem 0x372eca40-0x372ef5ed]
ACPI: Reserving DBGP table memory at [mem 0x372ef5f0-0x372ef623]
ACPI: Reserving DBG2 table memory at [mem 0x372ef628-0x372ef67b]
ACPI: Reserving SSDT table memory at [mem 0x372ef680-0x372efd1c]
ACPI: Reserving SSDT table memory at [mem 0x372efd20-0x372f2ad6]
ACPI: Reserving SSDT table memory at [mem 0x372f2ad8-0x372f8072]
ACPI: Reserving UEFI table memory at [mem 0x372f8078-0x372f80b9]
ACPI: Reserving SSDT table memory at [mem 0x372f80c0-0x372f8f17]
ACPI: Reserving SSDT table memory at [mem 0x372f8f18-0x372f8fe5]
ACPI: Reserving DMAR table memory at [mem 0x372f8fe8-0x372f908f]
ACPI: Reserving BGRT table memory at [mem 0x372f9090-0x372f90c7]
ACPI: Reserving SSDT table memory at [mem 0x372f90c8-0x372fa2dd]
Zone ranges:
  DMA      [mem 0x0000000000001000-0x0000000000ffffff]
  DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
  Normal   [mem 0x0000000100000000-0x00000008c1ffffff]
  Device   empty
Movable zone start for each node
Early memory node ranges
  node   0: [mem 0x0000000000001000-0x0000000000057fff]
  node   0: [mem 0x0000000000059000-0x000000000009dfff]
  node   0: [mem 0x0000000000100000-0x00000000312bafff]
  node   0: [mem 0x00000000312cd000-0x00000000312e5fff]
  node   0: [mem 0x0000000031331000-0x000000003138bfff]
  node   0: [mem 0x0000000031aab000-0x00000000362a0fff]
  node   0: [mem 0x0000000037fff000-0x0000000037ffffff]
  node   0: [mem 0x0000000100000000-0x00000008c1ffffff]
Initmem setup node 0 [mem 0x0000000000001000-0x00000008c1ffffff]
On node 0, zone DMA: 1 pages in unavailable ranges
On node 0, zone DMA: 1 pages in unavailable ranges
On node 0, zone DMA: 98 pages in unavailable ranges
On node 0, zone DMA32: 18 pages in unavailable ranges
On node 0, zone DMA32: 75 pages in unavailable ranges
On node 0, zone DMA32: 1823 pages in unavailable ranges
On node 0, zone DMA32: 7518 pages in unavailable ranges
On node 0, zone Normal: 24576 pages in unavailable ranges
Reserving Intel graphics memory at [mem 0x39000000-0x3cffffff]
ACPI: PM-Timer IO Port: 0x1808
ACPI: LAPIC_NMI (acpi_id[0x01] high edge lint[0x1])
ACPI: LAPIC_NMI (acpi_id[0x02] high edge lint[0x1])
ACPI: LAPIC_NMI (acpi_id[0x03] high edge lint[0x1])
ACPI: LAPIC_NMI (acpi_id[0x04] high edge lint[0x1])
ACPI: LAPIC_NMI (acpi_id[0x05] high edge lint[0x1])
ACPI: LAPIC_NMI (acpi_id[0x06] high edge lint[0x1])
ACPI: LAPIC_NMI (acpi_id[0x07] high edge lint[0x1])
ACPI: LAPIC_NMI (acpi_id[0x08] high edge lint[0x1])
IOAPIC[0]: apic_id 2, version 32, address 0xfec00000, GSI 0-119
ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
ACPI: Using ACPI (MADT) for SMP configuration information
ACPI: HPET id: 0x8086a701 base: 0xfed00000
e820: update [mem 0x345ec000-0x34775fff] usable =3D=3D> reserved
TSC deadline timer available
smpboot: Allowing 8 CPUs, 0 hotplug CPUs
[mem 0x3d000000-0xdfffffff] available for PCI devices
clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_=
idle_ns: 1910969940391419 ns
setup_percpu: NR_CPUS:16 nr_cpumask_bits:16 nr_cpu_ids:8 nr_node_ids:1
percpu: Embedded 54 pages/cpu s182104 r8192 d30888 u262144
pcpu-alloc: s182104 r8192 d30888 u262144 alloc=3D1*2097152
pcpu-alloc: [0] 0 1 2 3 4 5 6 7
Built 1 zonelists, mobility grouping on.  Total pages: 8223801
Kernel command line: root=3D/dev/nvme0n1p2 rootfstype=3Dext4 libahci.ignore=
_sss=3D1 init=3D/usr/lib/systemd/systemd systemd.unified_cgroup_hierarchy=
=3D1 cgroup_no_v1=3Dall psmouse.synaptics_intertouch=3D1 mitigations=3Doff =
mds=3Doff pti=3Doff spectre_v2=3Doff l1tf=3Doff nospec_store_bypass_disable=
 printk.devkmsg=3Don amdgpu.resize_bar=3D1 i915.enable_guc=3D3 dell_smm_hwm=
on.force=3D1
Setting dangerous option i915.enable_guc - tainting kernel
Unknown command line parameters: nospec_store_bypass_disable pti=3Doff spec=
tre_v2=3Doff
printk: log_buf_len individual max cpu contribution: 131072 bytes
printk: log_buf_len total cpu_extra contributions: 917504 bytes
printk: log_buf_len min size: 262144 bytes
printk: log_buf_len: 2097152 bytes
printk: early log buf free: 248144(94%)
Dentry cache hash table entries: 4194304 (order: 13, 33554432 bytes, linear=
)
Inode-cache hash table entries: 2097152 (order: 12, 16777216 bytes, linear)
mem auto-init: stack:all(zero), heap alloc:off, heap free:off
Memory: 32648724K/33417992K available (22540K kernel code, 2395K rwdata, 10=
548K rodata, 1112K init, 2464K bss, 769012K reserved, 0K cma-reserved)
random: get_random_u64 called from cache_random_seq_create+0x52/0x1b0 with =
crng_init=3D0
SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D8, Nodes=3D1
rcu: Hierarchical RCU implementation.
rcu: RCU event tracing is enabled.
rcu: RCU restricting CPUs from NR_CPUS=3D16 to nr_cpu_ids=3D8.
Tracing variant of Tasks RCU enabled.
rcu: RCU calculated value of scheduler-enlistment delay is 100 jiffies.
rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=3D8
NR_IRQS: 4352, nr_irqs: 2048, preallocated irqs: 16
random: crng done (trusting CPU's manufacturer)
spurious 8259A interrupt: IRQ7.
Console: colour dummy device 80x25
printk: console [tty0] enabled
ACPI: Core revision 20210604
clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 79=
635855245 ns
APIC: Switch to symmetric I/O mode setup
DMAR: Host address width 39
DMAR: DRHD base: 0x000000fed90000 flags: 0x0
DMAR: dmar0: reg_base_addr fed90000 ver 1:0 cap 1c0000c40660462 ecap 7e3ff0=
501e
DMAR: DRHD base: 0x000000fed91000 flags: 0x1
DMAR: dmar1: reg_base_addr fed91000 ver 1:0 cap d2008c40660462 ecap f050da
DMAR: RMRR base: 0x000000371e5000 end: 0x00000037204fff
DMAR: RMRR base: 0x00000038800000 end: 0x0000003cffffff
DMAR: [Firmware Bug]: No firmware reserved region can cover this RMRR [0x00=
00000038800000-0x000000003cffffff], contact BIOS vendor for fixes
DMAR: [Firmware Bug]: Your BIOS is broken; bad RMRR [0x0000000038800000-0x0=
00000003cffffff]
BIOS vendor: Alienware; Ver: 1.13.1; Product Version: 1.13.1
DMAR-IR: IOAPIC id 2 under DRHD base  0xfed91000 IOMMU 1
DMAR-IR: HPET id 0 under DRHD base 0xfed91000
DMAR-IR: Enabled IRQ remapping in xapic mode
..TIMER: vector=3D0x30 apic1=3D0 pin1=3D2 apic2=3D-1 pin2=3D-1
clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles: 0x26eae8729ef,=
 max_idle_ns: 440795235156 ns
Calibrating delay loop (skipped), value calculated using timer frequency.. =
5399.81 BogoMIPS (lpj=3D2699909)
pid_max: default: 32768 minimum: 301
Mount-cache hash table entries: 65536 (order: 7, 524288 bytes, linear)
Mountpoint-cache hash table entries: 65536 (order: 7, 524288 bytes, linear)
Disabling cpuset control group subsystem in v1 mounts
Disabling cpu control group subsystem in v1 mounts
Disabling cpuacct control group subsystem in v1 mounts
Disabling io control group subsystem in v1 mounts
Disabling memory control group subsystem in v1 mounts
Disabling devices control group subsystem in v1 mounts
Disabling freezer control group subsystem in v1 mounts
Disabling net_cls control group subsystem in v1 mounts
Disabling net_prio control group subsystem in v1 mounts
Disabling hugetlb control group subsystem in v1 mounts
Disabling pids control group subsystem in v1 mounts
Disabling rdma control group subsystem in v1 mounts
Disabling misc control group subsystem in v1 mounts
CPU0: Thermal monitoring enabled (TM1)
process: using mwait in idle threads
Last level iTLB entries: 4KB 64, 2MB 8, 4MB 8
Last level dTLB entries: 4KB 64, 2MB 0, 4MB 0, 1GB 4
Speculative Store Bypass: Vulnerable
TAA: Mitigation: TSX disabled
SRBDS: Vulnerable
Freeing SMP alternatives memory: 60K
smpboot: Estimated ratio of average max frequency by base frequency (times =
1024): 1213
smpboot: CPU0: Intel(R) Core(TM) i7-6820HK CPU @ 2.70GHz (family: 0x6, mode=
l: 0x5e, stepping: 0x3)
Performance Events: PEBS fmt3+, Skylake events, 32-deep LBR, full-width cou=
nters, Intel PMU driver.
... version:                4
... bit width:              48
... generic registers:      4
... value mask:             0000ffffffffffff
... max period:             00007fffffffffff
... fixed-purpose events:   3
... event mask:             000000070000000f
rcu: Hierarchical SRCU implementation.
smp: Bringing up secondary CPUs ...
x86: Booting SMP configuration:
.... node  #0, CPUs:      #1 #2 #3 #4 #5 #6 #7
smp: Brought up 1 node, 8 CPUs
smpboot: Max logical packages: 1
smpboot: Total of 8 processors activated (43198.54 BogoMIPS)
devtmpfs: initialized
x86/mm: Memory block size: 128MB
ACPI: PM: Registering ACPI NVS region [mem 0x312e6000-0x312e6fff] (4096 byt=
es)
ACPI: PM: Registering ACPI NVS region [mem 0x372fb000-0x3789afff] (5898240 =
bytes)
clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns:=
 1911260446275000 ns
futex hash table entries: 2048 (order: 5, 131072 bytes, linear)
NET: Registered PF_NETLINK/PF_ROUTE protocol family
thermal_sys: Registered thermal governor 'step_wise'
cpuidle: using governor ladder
cpuidle: using governor menu
HugeTLB: can free 4094 vmemmap pages for hugepages-1048576kB
ACPI FADT declares the system doesn't support PCIe ASPM, so disable it
ACPI: bus type PCI registered
acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
PCI: MMCONFIG for domain 0000 [bus 00-ff] at [mem 0xe0000000-0xefffffff] (b=
ase 0xe0000000)
PCI: MMCONFIG at [mem 0xe0000000-0xefffffff] reserved in E820
PCI: Using configuration type 1 for base access
ENERGY_PERF_BIAS: Set to 'normal', was 'performance'
HugeTLB: can free 6 vmemmap pages for hugepages-2048kB
HugeTLB registered 1.00 GiB page size, pre-allocated 0 pages
HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
cryptd: max_cpu_qlen set to 1000
fbcon: Taking over console
ACPI: Added _OSI(Module Device)
ACPI: Added _OSI(Processor Device)
ACPI: Added _OSI(3.0 _SCP Extensions)
ACPI: Added _OSI(Processor Aggregator Device)
ACPI: Added _OSI(Linux-Dell-Video)
ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
ACPI: Added _OSI(Linux-HPI-Hybrid-Graphics)
ACPI: 10 ACPI AML tables successfully acquired and loaded
ACPI: [Firmware Bug]: BIOS _OSI(Linux) query ignored
ACPI: Dynamic OEM Table Load:
ACPI: SSDT 0xFFFF8881010EF800 0005FD (v02 PmRef  Cpu0Ist  00003000 INTL 201=
20913)
ACPI: \_PR_.CPU0: _OSC native thermal LVT Acked
ACPI: Dynamic OEM Table Load:
ACPI: SSDT 0xFFFF8881010E4400 00037F (v02 PmRef  Cpu0Cst  00003001 INTL 201=
20913)
ACPI: Dynamic OEM Table Load:
ACPI: SSDT 0xFFFF8881010E8000 0005AA (v02 PmRef  ApIst    00003000 INTL 201=
20913)
ACPI: Dynamic OEM Table Load:
ACPI: SSDT 0xFFFF888101108A00 000119 (v02 PmRef  ApCst    00003000 INTL 201=
20913)
ACPI: EC: EC started
ACPI: EC: interrupt blocked
ACPI: EC: EC_CMD/EC_SC=3D0x66, EC_DATA=3D0x62
ACPI: \_SB_.PCI0.LPCB.EC0_: Boot DSDT EC used to handle transactions
ACPI: Interpreter enabled
ACPI: PM: (supports S0 S3 S5)
ACPI: Using IOAPIC for interrupt routing
PCI: Using host bridge windows from ACPI; if necessary, use "pci=3Dnocrs" a=
nd report a bug
ACPI: Enabled 9 GPEs in block 00 to 7F
ACPI: PM: Power Resource [PG00]
ACPI: PM: Power Resource [PG01]
ACPI: PM: Power Resource [PG02]
ACPI: PM: Power Resource [WRST]
ACPI: PM: Power Resource [WRST]
ACPI: PM: Power Resource [WRST]
ACPI: PM: Power Resource [WRST]
ACPI: PM: Power Resource [WRST]
ACPI: PM: Power Resource [WRST]
ACPI: PM: Power Resource [WRST]
ACPI: PM: Power Resource [WRST]
ACPI: PM: Power Resource [WRST]
ACPI: PM: Power Resource [WRST]
ACPI: PM: Power Resource [WRST]
ACPI: PM: Power Resource [WRST]
ACPI: PM: Power Resource [WRST]
ACPI: PM: Power Resource [WRST]
ACPI: PM: Power Resource [WRST]
ACPI: PM: Power Resource [WRST]
ACPI: PM: Power Resource [WRST]
ACPI: PM: Power Resource [WRST]
ACPI: PM: Power Resource [WRST]
ACPI: PM: Power Resource [WRST]
ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-fe])
acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MS=
I HPX-Type3]
acpi PNP0A08:00: _OSC: platform retains control of PCIe features (AE_ERROR)
PCI host bridge to bus 0000:00
pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 window]
pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bffff window]
pci_bus 0000:00: root bus resource [mem 0x000c0000-0x000c3fff window]
pci_bus 0000:00: root bus resource [mem 0x000c4000-0x000c7fff window]
pci_bus 0000:00: root bus resource [mem 0x000c8000-0x000cbfff window]
pci_bus 0000:00: root bus resource [mem 0x000cc000-0x000cffff window]
pci_bus 0000:00: root bus resource [mem 0x000d0000-0x000d3fff window]
pci_bus 0000:00: root bus resource [mem 0x000d4000-0x000d7fff window]
pci_bus 0000:00: root bus resource [mem 0x000d8000-0x000dbfff window]
pci_bus 0000:00: root bus resource [mem 0x000dc000-0x000dffff window]
pci_bus 0000:00: root bus resource [mem 0x000e0000-0x000e3fff window]
pci_bus 0000:00: root bus resource [mem 0x000e4000-0x000e7fff window]
pci_bus 0000:00: root bus resource [mem 0x000e8000-0x000ebfff window]
pci_bus 0000:00: root bus resource [mem 0x000ec000-0x000effff window]
pci_bus 0000:00: root bus resource [mem 0x3d000000-0xdfffffff window]
pci_bus 0000:00: root bus resource [mem 0xfd000000-0xfe7fffff window]
pci_bus 0000:00: root bus resource [bus 00-fe]
pci 0000:00:00.0: [8086:1910] type 00 class 0x060000
pci 0000:00:01.0: [8086:1901] type 01 class 0x060400
pci 0000:00:01.0: PME# supported from D0 D3hot D3cold
pci 0000:00:02.0: [8086:191b] type 00 class 0x030000
pci 0000:00:02.0: reg 0x10: [mem 0xdb000000-0xdbffffff 64bit]
pci 0000:00:02.0: reg 0x18: [mem 0x70000000-0x7fffffff 64bit pref]
pci 0000:00:02.0: reg 0x20: [io  0xf000-0xf03f]
pci 0000:00:02.0: BAR 2: assigned to efifb
pci 0000:00:04.0: [8086:1903] type 00 class 0x118000
pci 0000:00:04.0: reg 0x10: [mem 0xdc620000-0xdc627fff 64bit]
pci 0000:00:14.0: [8086:a12f] type 00 class 0x0c0330
pci 0000:00:14.0: reg 0x10: [mem 0xdc610000-0xdc61ffff 64bit]
pci 0000:00:14.0: PME# supported from D3hot D3cold
pci 0000:00:14.2: [8086:a131] type 00 class 0x118000
pci 0000:00:14.2: reg 0x10: [mem 0xdc636000-0xdc636fff 64bit]
pci 0000:00:16.0: [8086:a13a] type 00 class 0x078000
pci 0000:00:16.0: reg 0x10: [mem 0xdc635000-0xdc635fff 64bit]
pci 0000:00:16.0: PME# supported from D3hot
pci 0000:00:17.0: [8086:a103] type 00 class 0x010601
pci 0000:00:17.0: reg 0x10: [mem 0xdc630000-0xdc631fff]
pci 0000:00:17.0: reg 0x14: [mem 0xdc634000-0xdc6340ff]
pci 0000:00:17.0: reg 0x18: [io  0xf090-0xf097]
pci 0000:00:17.0: reg 0x1c: [io  0xf080-0xf083]
pci 0000:00:17.0: reg 0x20: [io  0xf060-0xf07f]
pci 0000:00:17.0: reg 0x24: [mem 0xdc633000-0xdc6337ff]
pci 0000:00:17.0: PME# supported from D3hot
pci 0000:00:1c.0: [8086:a110] type 01 class 0x060400
pci 0000:00:1c.0: PME# supported from D0 D3hot D3cold
pci 0000:00:1c.0: Intel SPT PCH root port ACS workaround enabled
pci 0000:00:1c.4: [8086:a114] type 01 class 0x060400
pci 0000:00:1c.4: PME# supported from D0 D3hot D3cold
pci 0000:00:1c.4: Intel SPT PCH root port ACS workaround enabled
pci 0000:00:1c.5: [8086:a115] type 01 class 0x060400
pci 0000:00:1c.5: PME# supported from D0 D3hot D3cold
pci 0000:00:1c.5: Intel SPT PCH root port ACS workaround enabled
pci 0000:00:1c.6: [8086:a116] type 01 class 0x060400
pci 0000:00:1c.6: PME# supported from D0 D3hot D3cold
pci 0000:00:1c.6: Intel SPT PCH root port ACS workaround enabled
pci 0000:00:1d.0: [8086:a118] type 01 class 0x060400
pci 0000:00:1d.0: PME# supported from D0 D3hot D3cold
pci 0000:00:1d.0: Intel SPT PCH root port ACS workaround enabled
pci 0000:00:1f.0: [8086:a14e] type 00 class 0x060100
pci 0000:00:1f.2: [8086:a121] type 00 class 0x058000
pci 0000:00:1f.2: reg 0x10: [mem 0xdc62c000-0xdc62ffff]
pci 0000:00:1f.3: [8086:a170] type 00 class 0x040300
pci 0000:00:1f.3: reg 0x10: [mem 0xdc628000-0xdc62bfff 64bit]
pci 0000:00:1f.3: reg 0x20: [mem 0xdc600000-0xdc60ffff 64bit]
pci 0000:00:1f.3: PME# supported from D3hot D3cold
pci 0000:00:1f.4: [8086:a123] type 00 class 0x0c0500
pci 0000:00:1f.4: reg 0x10: [mem 0xdc632000-0xdc6320ff 64bit]
pci 0000:00:1f.4: reg 0x20: [io  0xf040-0xf05f]
pci 0000:01:00.0: [1002:6921] type 00 class 0x038000
pci 0000:01:00.0: reg 0x10: [mem 0xb0000000-0xbfffffff 64bit pref]
pci 0000:01:00.0: reg 0x18: [mem 0xc0000000-0xc01fffff 64bit pref]
pci 0000:01:00.0: reg 0x20: [io  0xe000-0xe0ff]
pci 0000:01:00.0: reg 0x24: [mem 0xdc500000-0xdc53ffff]
pci 0000:01:00.0: reg 0x30: [mem 0xdc540000-0xdc55ffff pref]
pci 0000:01:00.0: supports D1 D2
pci 0000:01:00.0: PME# supported from D1 D2 D3hot D3cold
pci 0000:01:00.0: 63.008 Gb/s available PCIe bandwidth, limited by 8.0 GT/s=
 PCIe x8 link at 0000:00:01.0 (capable of 126.016 Gb/s with 8.0 GT/s PCIe x=
16 link)
pci 0000:00:01.0: PCI bridge to [bus 01]
pci 0000:00:01.0:   bridge window [io  0xe000-0xefff]
pci 0000:00:01.0:   bridge window [mem 0xdc500000-0xdc5fffff]
pci 0000:00:01.0:   bridge window [mem 0xb0000000-0xc01fffff 64bit pref]
acpiphp: Slot [1] registered
pci 0000:00:1c.0: PCI bridge to [bus 02-3a]
pci 0000:00:1c.0:   bridge window [mem 0xc4000000-0xda0fffff]
pci 0000:00:1c.0:   bridge window [mem 0x80000000-0xa1ffffff 64bit pref]
pci 0000:3b:00.0: [1969:e0a1] type 00 class 0x020000
pci 0000:3b:00.0: reg 0x10: [mem 0xdc400000-0xdc43ffff 64bit]
pci 0000:3b:00.0: reg 0x18: [io  0xd000-0xd07f]
pci 0000:3b:00.0: PME# supported from D0 D1 D2 D3hot D3cold
pci 0000:00:1c.4: PCI bridge to [bus 3b]
pci 0000:00:1c.4:   bridge window [io  0xd000-0xdfff]
pci 0000:00:1c.4:   bridge window [mem 0xdc400000-0xdc4fffff]
pci 0000:3c:00.0: [168c:003e] type 00 class 0x028000
pci 0000:3c:00.0: reg 0x10: [mem 0xdc000000-0xdc1fffff 64bit]
pci 0000:3c:00.0: PME# supported from D0 D3hot D3cold
pci 0000:00:1c.5: PCI bridge to [bus 3c]
pci 0000:00:1c.5:   bridge window [mem 0xdc000000-0xdc1fffff]
pci 0000:3d:00.0: [10ec:5227] type 00 class 0xff0000
pci 0000:3d:00.0: reg 0x10: [mem 0xdc300000-0xdc300fff]
pci 0000:3d:00.0: supports D1 D2
pci 0000:3d:00.0: PME# supported from D1 D2 D3hot D3cold
pci 0000:00:1c.6: PCI bridge to [bus 3d]
pci 0000:00:1c.6:   bridge window [mem 0xdc300000-0xdc3fffff]
pci 0000:3e:00.0: [144d:a802] type 00 class 0x010802
pci 0000:3e:00.0: reg 0x10: [mem 0xdc200000-0xdc203fff 64bit]
pci 0000:3e:00.0: reg 0x18: [io  0xc000-0xc0ff]
pci 0000:00:1d.0: PCI bridge to [bus 3e]
pci 0000:00:1d.0:   bridge window [io  0xc000-0xcfff]
pci 0000:00:1d.0:   bridge window [mem 0xdc200000-0xdc2fffff]
pci_bus 0000:00: on NUMA node 0
pci 0000:00:01.0: Max Payload Size set to  256/ 256 (was  256), Max Read Rq=
  128
pci 0000:01:00.0: Max Payload Size set to  256/ 256 (was  256), Max Read Rq=
  256
pci 0000:00:1c.0: Max Payload Size set to  256/ 256 (was  128), Max Read Rq=
  128
pci 0000:00:1c.4: Max Payload Size set to  256/ 256 (was  256), Max Read Rq=
  128
pci 0000:3b:00.0: Max Payload Size set to  256/4096 (was  256), Max Read Rq=
  256
pci 0000:00:1c.5: Max Payload Size set to  256/ 256 (was  256), Max Read Rq=
  128
pci 0000:3c:00.0: Max Payload Size set to  256/ 256 (was  256), Max Read Rq=
  256
pci 0000:00:1c.6: Max Payload Size set to  256/ 256 (was  128), Max Read Rq=
  128
pci 0000:3d:00.0: Max Payload Size set to  128/ 128 (was  128), Max Read Rq=
  128
pci 0000:00:1d.0: Max Payload Size set to  256/ 256 (was  128), Max Read Rq=
  128
pci 0000:3e:00.0: Max Payload Size set to  128/ 128 (was  128), Max Read Rq=
  128
ACPI: PCI: Interrupt link LNKA configured for IRQ 11
ACPI: PCI: Interrupt link LNKB configured for IRQ 10
ACPI: PCI: Interrupt link LNKC configured for IRQ 11
ACPI: PCI: Interrupt link LNKD configured for IRQ 11
ACPI: PCI: Interrupt link LNKE configured for IRQ 11
ACPI: PCI: Interrupt link LNKF configured for IRQ 11
ACPI: PCI: Interrupt link LNKG configured for IRQ 11
ACPI: PCI: Interrupt link LNKH configured for IRQ 11
ACPI: EC: interrupt unblocked
ACPI: EC: event unblocked
ACPI: EC: EC_CMD/EC_SC=3D0x66, EC_DATA=3D0x62
ACPI: EC: GPE=3D0x14
ACPI: \_SB_.PCI0.LPCB.EC0_: Boot DSDT EC initialization complete
ACPI: \_SB_.PCI0.LPCB.EC0_: EC: Used to handle transactions and events
iommu: Default domain type: Passthrough
pci 0000:00:02.0: vgaarb: setting as boot VGA device
pci 0000:00:02.0: vgaarb: VGA device added: decodes=3Dio+mem,owns=3Dio+mem,=
locks=3Dnone
pci 0000:00:02.0: vgaarb: bridge control possible
vgaarb: loaded
SCSI subsystem initialized
libata version 3.00 loaded.
ACPI: bus type USB registered
usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
videodev: Linux video capture interface: v2.00
Registered efivars operations
Advanced Linux Sound Architecture Driver Initialized.
Bluetooth: Core ver 2.22
NET: Registered PF_BLUETOOTH protocol family
Bluetooth: HCI device and connection manager initialized
Bluetooth: HCI socket layer initialized
Bluetooth: L2CAP socket layer initialized
Bluetooth: SCO socket layer initialized
PCI: Using ACPI for IRQ routing
PCI: pci_cache_line_size set to 64 bytes
e820: reserve RAM buffer [mem 0x00058000-0x0005ffff]
e820: reserve RAM buffer [mem 0x0009e000-0x0009ffff]
e820: reserve RAM buffer [mem 0x3109c018-0x33ffffff]
e820: reserve RAM buffer [mem 0x310ad018-0x33ffffff]
e820: reserve RAM buffer [mem 0x312bb000-0x33ffffff]
e820: reserve RAM buffer [mem 0x312e6000-0x33ffffff]
e820: reserve RAM buffer [mem 0x3138c000-0x33ffffff]
e820: reserve RAM buffer [mem 0x345ec000-0x37ffffff]
e820: reserve RAM buffer [mem 0x362a1000-0x37ffffff]
e820: reserve RAM buffer [mem 0x8c2000000-0x8c3ffffff]
wmi_bus wmi_bus-PNP0C14:01: WQBC data block query control method not found
dcdbas dcdbas: Dell Systems Management Base Driver (version 5.6.0-3.4)
hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0, 0, 0, 0, 0, 0
hpet0: 8 comparators, 64-bit 24.000000 MHz counter
clocksource: Switched to clocksource tsc-early
FS-Cache: Loaded
CacheFiles: Loaded
pnp: PnP ACPI init
system 00:02: [io  0x0680-0x069f] has been reserved
system 00:02: [io  0xffff] has been reserved
system 00:02: [io  0xffff] has been reserved
system 00:02: [io  0xffff] has been reserved
system 00:02: [io  0x1800-0x18fe] has been reserved
system 00:02: [io  0x164e-0x164f] has been reserved
system 00:03: [io  0x0800-0x087f] has been reserved
system 00:05: [io  0x1854-0x1857] has been reserved
system 00:06: [mem 0xfed10000-0xfed17fff] has been reserved
system 00:06: [mem 0xfed18000-0xfed18fff] has been reserved
system 00:06: [mem 0xfed19000-0xfed19fff] has been reserved
system 00:06: [mem 0xe0000000-0xefffffff] has been reserved
system 00:06: [mem 0xfed20000-0xfed3ffff] has been reserved
system 00:06: [mem 0xfed90000-0xfed93fff] could not be reserved
system 00:06: [mem 0xfed45000-0xfed8ffff] has been reserved
system 00:06: [mem 0xff000000-0xffffffff] has been reserved
system 00:06: [mem 0xfee00000-0xfeefffff] could not be reserved
system 00:06: [mem 0xdffe0000-0xdfffffff] has been reserved
system 00:07: [mem 0xfd000000-0xfdabffff] has been reserved
system 00:07: [mem 0xfdad0000-0xfdadffff] has been reserved
system 00:07: [mem 0xfdb00000-0xfdffffff] has been reserved
system 00:07: [mem 0xfe000000-0xfe01ffff] could not be reserved
system 00:07: [mem 0xfe036000-0xfe03bfff] has been reserved
system 00:07: [mem 0xfe03d000-0xfe3fffff] has been reserved
system 00:07: [mem 0xfe410000-0xfe7fffff] has been reserved
system 00:08: [mem 0xfdaf0000-0xfdafffff] has been reserved
system 00:08: [mem 0xfdae0000-0xfdaeffff] has been reserved
system 00:08: [mem 0xfdac0000-0xfdacffff] has been reserved
pnp: PnP ACPI: found 9 devices
clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, max_idle_ns: 208=
5701024 ns
NET: Registered PF_INET protocol family
IP idents hash table entries: 262144 (order: 9, 2097152 bytes, linear)
tcp_listen_portaddr_hash hash table entries: 16384 (order: 6, 262144 bytes,=
 linear)
TCP established hash table entries: 262144 (order: 9, 2097152 bytes, linear=
)
TCP bind hash table entries: 65536 (order: 8, 1048576 bytes, linear)
TCP: Hash tables configured (established 262144 bind 65536)
UDP hash table entries: 16384 (order: 7, 524288 bytes, linear)
UDP-Lite hash table entries: 16384 (order: 7, 524288 bytes, linear)
NET: Registered PF_UNIX/PF_LOCAL protocol family
pci 0000:00:1c.0: bridge window [io  0x1000-0x0fff] to [bus 02-3a] add_size=
 1000
pci 0000:00:1c.0: BAR 13: assigned [io  0x2000-0x2fff]
pci 0000:00:01.0: PCI bridge to [bus 01]
pci 0000:00:01.0:   bridge window [io  0xe000-0xefff]
pci 0000:00:01.0:   bridge window [mem 0xdc500000-0xdc5fffff]
pci 0000:00:01.0:   bridge window [mem 0xb0000000-0xc01fffff 64bit pref]
pci 0000:00:1c.0: PCI bridge to [bus 02-3a]
pci 0000:00:1c.0:   bridge window [io  0x2000-0x2fff]
pci 0000:00:1c.0:   bridge window [mem 0xc4000000-0xda0fffff]
pci 0000:00:1c.0:   bridge window [mem 0x80000000-0xa1ffffff 64bit pref]
pci 0000:00:1c.4: PCI bridge to [bus 3b]
pci 0000:00:1c.4:   bridge window [io  0xd000-0xdfff]
pci 0000:00:1c.4:   bridge window [mem 0xdc400000-0xdc4fffff]
pci 0000:00:1c.5: PCI bridge to [bus 3c]
pci 0000:00:1c.5:   bridge window [mem 0xdc000000-0xdc1fffff]
pci 0000:00:1c.6: PCI bridge to [bus 3d]
pci 0000:00:1c.6:   bridge window [mem 0xdc300000-0xdc3fffff]
pci 0000:00:1d.0: PCI bridge to [bus 3e]
pci 0000:00:1d.0:   bridge window [io  0xc000-0xcfff]
pci 0000:00:1d.0:   bridge window [mem 0xdc200000-0xdc2fffff]
pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff window]
pci_bus 0000:00: resource 7 [mem 0x000c0000-0x000c3fff window]
pci_bus 0000:00: resource 8 [mem 0x000c4000-0x000c7fff window]
pci_bus 0000:00: resource 9 [mem 0x000c8000-0x000cbfff window]
pci_bus 0000:00: resource 10 [mem 0x000cc000-0x000cffff window]
pci_bus 0000:00: resource 11 [mem 0x000d0000-0x000d3fff window]
pci_bus 0000:00: resource 12 [mem 0x000d4000-0x000d7fff window]
pci_bus 0000:00: resource 13 [mem 0x000d8000-0x000dbfff window]
pci_bus 0000:00: resource 14 [mem 0x000dc000-0x000dffff window]
pci_bus 0000:00: resource 15 [mem 0x000e0000-0x000e3fff window]
pci_bus 0000:00: resource 16 [mem 0x000e4000-0x000e7fff window]
pci_bus 0000:00: resource 17 [mem 0x000e8000-0x000ebfff window]
pci_bus 0000:00: resource 18 [mem 0x000ec000-0x000effff window]
pci_bus 0000:00: resource 19 [mem 0x3d000000-0xdfffffff window]
pci_bus 0000:00: resource 20 [mem 0xfd000000-0xfe7fffff window]
pci_bus 0000:01: resource 0 [io  0xe000-0xefff]
pci_bus 0000:01: resource 1 [mem 0xdc500000-0xdc5fffff]
pci_bus 0000:01: resource 2 [mem 0xb0000000-0xc01fffff 64bit pref]
pci_bus 0000:02: resource 0 [io  0x2000-0x2fff]
pci_bus 0000:02: resource 1 [mem 0xc4000000-0xda0fffff]
pci_bus 0000:02: resource 2 [mem 0x80000000-0xa1ffffff 64bit pref]
pci_bus 0000:3b: resource 0 [io  0xd000-0xdfff]
pci_bus 0000:3b: resource 1 [mem 0xdc400000-0xdc4fffff]
pci_bus 0000:3c: resource 1 [mem 0xdc000000-0xdc1fffff]
pci_bus 0000:3d: resource 1 [mem 0xdc300000-0xdc3fffff]
pci_bus 0000:3e: resource 0 [io  0xc000-0xcfff]
pci_bus 0000:3e: resource 1 [mem 0xdc200000-0xdc2fffff]
pci 0000:00:02.0: Video device with shadowed ROM at [mem 0x000c0000-0x000df=
fff]
PCI: CLS 0 bytes, default 64
DMAR: No ATSR found
DMAR: No SATC found
DMAR: IOMMU feature fl1gp_support inconsistent
DMAR: IOMMU feature pgsel_inv inconsistent
DMAR: IOMMU feature nwfs inconsistent
DMAR: IOMMU feature eafs inconsistent
DMAR: IOMMU feature prs inconsistent
DMAR: IOMMU feature nest inconsistent
DMAR: IOMMU feature mts inconsistent
DMAR: IOMMU feature sc_support inconsistent
DMAR: IOMMU feature pass_through inconsistent
DMAR: IOMMU feature dev_iotlb_support inconsistent
DMAR: dmar0: Using Queued invalidation
DMAR: dmar1: Using Queued invalidation
pci 0000:00:00.0: Adding to iommu group 0
pci 0000:00:01.0: Adding to iommu group 1
pci 0000:00:02.0: Adding to iommu group 2
pci 0000:00:04.0: Adding to iommu group 3
pci 0000:00:14.0: Adding to iommu group 4
pci 0000:00:14.2: Adding to iommu group 4
pci 0000:00:16.0: Adding to iommu group 5
pci 0000:00:17.0: Adding to iommu group 6
pci 0000:00:1c.0: Adding to iommu group 7
pci 0000:00:1c.4: Adding to iommu group 8
pci 0000:00:1c.5: Adding to iommu group 9
pci 0000:00:1c.6: Adding to iommu group 10
pci 0000:00:1d.0: Adding to iommu group 11
pci 0000:00:1f.0: Adding to iommu group 12
pci 0000:00:1f.2: Adding to iommu group 12
pci 0000:00:1f.3: Adding to iommu group 12
pci 0000:00:1f.4: Adding to iommu group 12
pci 0000:01:00.0: Adding to iommu group 1
pci 0000:3b:00.0: Adding to iommu group 13
pci 0000:3c:00.0: Adding to iommu group 14
pci 0000:3d:00.0: Adding to iommu group 15
pci 0000:3e:00.0: Adding to iommu group 16
DMAR: Intel(R) Virtualization Technology for Directed I/O
PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
software IO TLB: mapped [mem 0x000000002d09c000-0x000000003109c000] (64MB)
RAPL PMU: API unit is 2^-32 Joules, 5 fixed counters, 655360 ms ovfl timer
RAPL PMU: hw unit of domain pp0-core 2^-14 Joules
RAPL PMU: hw unit of domain package 2^-14 Joules
RAPL PMU: hw unit of domain dram 2^-14 Joules
RAPL PMU: hw unit of domain pp1-gpu 2^-14 Joules
RAPL PMU: hw unit of domain psys 2^-14 Joules
DMAR: DRHD: handling fault status reg 3
DMAR: [DMA Read NO_PASID] Request device [0x00:0x02.0] fault addr 0x3a80000=
0 [fault reason 0x06] PTE Read access is not set
DMAR: DRHD: handling fault status reg 3
DMAR: [DMA Read NO_PASID] Request device [0x00:0x02.0] fault addr 0x3a81800=
0 [fault reason 0x06] PTE Read access is not set
DMAR: DRHD: handling fault status reg 3
DMAR: [DMA Read NO_PASID] Request device [0x00:0x02.0] fault addr 0x3a85200=
0 [fault reason 0x06] PTE Read access is not set
DMAR: DRHD: handling fault status reg 3
Initialise system trusted keyrings
workingset: timestamp_bits=3D46 max_order=3D23 bucket_order=3D0
zbud: loaded
FS-Cache: Netfs 'cifs' registered for caching
Key type cifs.idmap registered
fuse: init (API version 7.34)
NET: Registered PF_ALG protocol family
Key type asymmetric registered
Asymmetric key parser 'x509' registered
Block layer SCSI generic (bsg) driver version 0.4 loaded (major 252)
ACPI: AC: AC Adapter [ACAD] (on-line)
input: Lid Switch as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:40/=
PNP0C0D:00/input/input0
ACPI: button: Lid Switch [LID0]
input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/in=
put1
ACPI: button: Power Button [PWRB]
input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input2
ACPI: button: Power Button [PWRF]
Non-volatile memory driver v1.3
Linux agpgart interface v0.103
[drm] amdgpu kernel modesetting enabled.
vga_switcheroo: detected switching method \_SB_.PCI0.GFX0.ATPX handle
ATPX version 1, functions 0x00000033
ATPX Hybrid Graphics
amdgpu: CRAT table disabled by module option
amdgpu: Virtual CRAT table created for CPU
amdgpu: Topology: Add CPU node
amdgpu 0000:01:00.0: enabling device (0000 -> 0003)
[drm] initializing kernel modesetting (TONGA 0x1002:0x6921 0x1028:0x0708 0x=
00).
amdgpu 0000:01:00.0: amdgpu: Trusted Memory Zone (TMZ) feature not supporte=
d
[drm] register mmio base: 0xDC500000
[drm] register mmio size: 262144
[drm] add ip block number 0 <vi_common>
[drm] add ip block number 1 <gmc_v8_0>
[drm] add ip block number 2 <tonga_ih>
[drm] add ip block number 3 <gfx_v8_0>
[drm] add ip block number 4 <sdma_v3_0>
[drm] add ip block number 5 <powerplay>
[drm] add ip block number 6 <dm>
[drm] add ip block number 7 <uvd_v5_0>
[drm] add ip block number 8 <vce_v3_0>
ACPI: battery: Slot [BAT1] (battery present)
amdgpu 0000:01:00.0: amdgpu: Fetched VBIOS from ATRM
amdgpu: ATOM BIOS: BR46576.001
[drm] VCE enabled in physical mode
[drm] GPU posting now...
[drm] vm size is 128 GB, 2 levels, block size is 10-bit, fragment size is 9=
-bit
amdgpu 0000:01:00.0: amdgpu: VRAM: 4096M 0x000000F400000000 - 0x000000F4FFF=
FFFFF (4096M used)
amdgpu 0000:01:00.0: amdgpu: GART: 1024M 0x000000FF00000000 - 0x000000FF3FF=
FFFFF
[drm] Detected VRAM RAM=3D4096M, BAR=3D256M
[drm] RAM width 256bits GDDR5
[drm] amdgpu: 4096M of VRAM memory ready
[drm] amdgpu: 4096M of GTT memory ready.
[drm] GART: num cpu pages 262144, num gpu pages 262144
[drm] PCIE GART of 1024M enabled (table at 0x000000F400000000).
[drm] Chained IB support enabled!
amdgpu: hwmgr_sw_init smu backed is tonga_smu
[drm] Found UVD firmware Version: 1.68 Family ID: 10
[drm] Found VCE firmware Version: 52.8 Binary ID: 3
[drm] Display Core initialized with v3.2.149!
[drm] UVD initialized successfully.
[drm] VCE initialized successfully.
kfd kfd: amdgpu: Allocated 3969056 bytes on gart
amdgpu: SW scheduler is used
amdgpu: Virtual CRAT table created for GPU
amdgpu: Topology: Add dGPU node [0x6921:0x1002]
kfd kfd: amdgpu: added device 1002:6921
amdgpu 0000:01:00.0: amdgpu: SE 4, SH per SE 1, CU per SH 8, active_cu_numb=
er 32
amdgpu 0000:01:00.0: amdgpu: Using BOCO for runtime pm
[drm] Initialized amdgpu 3.42.0 20150101 for 0000:01:00.0 on minor 0
i915 0000:00:02.0: [drm] Incompatible option enable_guc=3D3 - GuC submissio=
n is N/A
i915 0000:00:02.0: [drm] VT-d active for gfx access
i915 0000:00:02.0: vgaarb: deactivate vga console
i915 0000:00:02.0: vgaarb: changed VGA decodes: olddecodes=3Dio+mem,decodes=
=3Dio+mem:owns=3Dio+mem
i915 0000:00:02.0: [drm] Finished loading DMC firmware i915/skl_dmc_ver1_27=
.bin (v1.27)
i915 0000:00:02.0: [drm] Disabling framebuffer compression (FBC) to prevent=
 screen flicker with VT-d enabled
i915 0000:00:02.0: [drm] [ENCODER:102:DDI B/PHY B] is disabled/in DSI mode =
with an ungated DDI clock, gate it
i915 0000:00:02.0: [drm] [ENCODER:117:DDI C/PHY C] is disabled/in DSI mode =
with an ungated DDI clock, gate it
i915 0000:00:02.0: [drm] [ENCODER:127:DDI D/PHY D] is disabled/in DSI mode =
with an ungated DDI clock, gate it
i915 0000:00:02.0: Direct firmware load for i915/skl_guc_49.0.1.bin failed =
with error -2
i915 0000:00:02.0: [drm] GuC firmware i915/skl_guc_49.0.1.bin: fetch failed=
 with error -2
i915 0000:00:02.0: [drm] GuC firmware(s) can be downloaded from https://git=
.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/i915<=
https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit.ker=
nel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ffirmware%2Flinux-firmware.git%=
2Ftree%2Fi915&data=3D04%7C01%7CGuchun.Chen%40amd.com%7C82f9e022b7d54387f0dd=
08d961eda83b%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C63764849565696312=
6%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1ha=
WwiLCJXVCI6Mn0%3D%7C1000&sdata=3DKzZr5%2FwcJPXYIhIvzkTapqIlLcTZklsEQ6odo%2B=
nu8fc%3D&reserved=3D0>
i915 0000:00:02.0: [drm] GuC is uninitialized
[drm] Initialized i915 1.6.0 20201103 for 0000:00:02.0 on minor 1
ACPI: video: Video Device [GFX0] (multi-head: yes  rom: no  post: no)
input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/LNXVIDEO:00=
/input/input3
loop: module loaded
mei_me 0000:00:16.0: enabling device (0000 -> 0002)
rtsx_pci 0000:3d:00.0: enabling device (0000 -> 0002)
nvme nvme0: pci function 0000:3e:00.0
ahci 0000:00:17.0: version 3.0
ahci 0000:00:17.0: AHCI 0001.0301 32 slots 1 ports 6 Gbps 0x2 impl SATA mod=
e
ahci 0000:00:17.0: flags: 64bit ncq sntf pm led clo only pio slum part ems =
deso sadm sds apst
scsi host0: ahci
scsi host1: ahci
ata1: DUMMY
ata2: SATA max UDMA/133 abar m2048@0xdc633000 port 0xdc633180 irq 133
alx 0000:3b:00.0 eth0: Qualcomm Atheros AR816x/AR817x Ethernet [f8:ca:b8:03=
:29:43]
ath10k_pci 0000:3c:00.0: enabling device (0000 -> 0002)
ath10k_pci 0000:3c:00.0: pci irq msi oper_irq_mode 2 irq_mode 0 reset_mode =
0
fbcon: i915 (fb0) is primary device
Console: switching to colour frame buffer device 240x67
nvme nvme0: 8/0/0 default/read/poll queues
 nvme0n1: p1 p2 p3
i915 0000:00:02.0: [drm] fb0: i915 frame buffer device
xhci_hcd 0000:00:14.0: xHCI Host Controller
xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 1
xhci_hcd 0000:00:14.0: hcc params 0x200077c1 hci version 0x100 quirks 0x000=
0000001109810
usb usb1: New USB device found, idVendor=3D1d6b, idProduct=3D0002, bcdDevic=
e=3D 5.14
usb usb1: New USB device strings: Mfr=3D3, Product=3D2, SerialNumber=3D1
usb usb1: Product: xHCI Host Controller
usb usb1: Manufacturer: Linux 5.14.0-rc3-agd5f+ xhci-hcd
usb usb1: SerialNumber: 0000:00:14.0
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 16 ports detected
xhci_hcd 0000:00:14.0: xHCI Host Controller
xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 2
xhci_hcd 0000:00:14.0: Host supports USB 3.0 SuperSpeed
usb usb2: New USB device found, idVendor=3D1d6b, idProduct=3D0003, bcdDevic=
e=3D 5.14
usb usb2: New USB device strings: Mfr=3D3, Product=3D2, SerialNumber=3D1
usb usb2: Product: xHCI Host Controller
usb usb2: Manufacturer: Linux 5.14.0-rc3-agd5f+ xhci-hcd
usb usb2: SerialNumber: 0000:00:14.0
hub 2-0:1.0: USB hub found
hub 2-0:1.0: 8 ports detected
usb: port power management may be unreliable
usbcore: registered new interface driver cdc_acm
cdc_acm: USB Abstract Control Model driver for USB modems and ISDN adapters
usbcore: registered new interface driver uas
usbcore: registered new interface driver usb-storage
i8042: PNP: PS/2 Controller [PNP0303:PS2K,PNP0f13:PS2M] at 0x60,0x64 irq 1,=
12
serio: i8042 KBD port at 0x60,0x64 irq 1
serio: i8042 AUX port at 0x60,0x64 irq 12
mousedev: PS/2 mouse device common for all mice
rtc_cmos 00:04: RTC can wake from S4
rtc_cmos 00:04: registered as rtc0
rtc_cmos 00:04: setting system clock to 2021-08-18T01:47:48 UTC (1629251268=
)
rtc_cmos 00:04: alarms up to one month, y3k, 242 bytes nvram, hpet irqs
i2c /dev entries driver
i801_smbus 0000:00:1f.4: SPD Write Disable is set
i801_smbus 0000:00:1f.4: SMBus using PCI interrupt
i2c i2c-6: 2/2 memory slots populated (from DMI)
ee1004 6-0050: 512 byte EE1004-compliant SPD EEPROM, read-only
i2c i2c-6: Successfully instantiated SPD at 0x50
usbcore: registered new interface driver uvcvideo
dell_smm_hwmon: not running on a supported Dell system.
input: AT Translated Set 2 keyboard as /devices/platform/i8042/serio0/input=
/input4
dell_smm_hwmon: vendor=3DAlienware, model=3DAlienware 15 R2, version=3D1.13=
.1
usbcore: registered new interface driver btusb
intel_pstate: Intel P-state driver initializing
intel_pstate: HWP enabled
[drm] Initialized simpledrm 1.0.0 20200625 for simple-framebuffer.0 on mino=
r 2
simple-framebuffer simple-framebuffer.0: [drm] fb1: simpledrm frame buffer =
device
EFI Variables Facility v0.08 2004-May-17
pstore: Registered efi as persistent store backend
usbcore: registered new interface driver usbhid
usbhid: USB HID core driver
ath10k_pci 0000:3c:00.0: qca6174 hw3.2 target 0x05030000 chip_id 0x00340aff=
 sub 1a56:1535
alienware_wmi: alienware-wmi: No known WMI GUID found
ath10k_pci 0000:3c:00.0: kconfig debug 0 debugfs 0 tracing 0 dfs 0 testmode=
 0
dell_wmi_aio: No known WMI GUID found
ath10k_pci 0000:3c:00.0: firmware ver WLAN.RM.4.4.1-00157-QCARMSWPZ-1 api 6=
 features wowlan,ignore-otp,mfp crc32 90eebefb
snd_hda_intel 0000:00:1f.3: enabling device (0000 -> 0002)
snd_hda_intel 0000:00:1f.3: bound 0000:00:02.0 (ops i915_audio_component_bi=
nd_ops)
xt_time: kernel timezone is -0000
ipt_CLUSTERIP: ClusterIP Version 0.8 loaded successfully
Initializing XFRM netlink socket
NET: Registered PF_INET6 protocol family
Segment Routing with IPv6
sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
NET: Registered PF_PACKET protocol family
snd_hda_codec_ca0132 hdaudioC0D0: autoconfig for CA0132: line_outs=3D1 (0xb=
/0x0/0x0/0x0/0x0) type:speaker
NET: Registered PF_KEY protocol family
snd_hda_codec_ca0132 hdaudioC0D0:    speaker_outs=3D0 (0x0/0x0/0x0/0x0/0x0)
snd_hda_codec_ca0132 hdaudioC0D0:    hp_outs=3D1 (0xf/0x0/0x0/0x0/0x0)
snd_hda_codec_ca0132 hdaudioC0D0:    mono: mono_out=3D0x0
snd_hda_codec_ca0132 hdaudioC0D0:    inputs:
snd_hda_codec_ca0132 hdaudioC0D0:      Mic=3D0x11
snd_hda_codec_ca0132 hdaudioC0D0:      Internal Mic=3D0x12
ath10k_pci 0000:3c:00.0: board_file api 2 bmi_id N/A crc32 318825bf
Bluetooth: RFCOMM TTY layer initialized
ata2: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
Bluetooth: RFCOMM socket layer initialized
ata2.00: ATA-9: M4-CT512M4SSD2, 070H, max UDMA/100
Bluetooth: RFCOMM ver 1.11
ata2.00: 1000215216 sectors, multi 16: LBA48 NCQ (depth 32), AA
ata2.00: configured for UDMA/100
Bluetooth: BNEP (Ethernet Emulation) ver 1.3
Bluetooth: BNEP filters: protocol multicast
scsi 1:0:0:0: Direct-Access     ATA      M4-CT512M4SSD2   070H PQ: 0 ANSI: =
5
Bluetooth: BNEP socket layer initialized
sd 1:0:0:0: [sda] 1000215216 512-byte logical blocks: (512 GB/477 GiB)
Bluetooth: HIDP (Human Interface Emulation) ver 1.2
Bluetooth: HIDP socket layer initialized
sd 1:0:0:0: [sda] Write Protect is off
usb 1-4: new full-speed USB device number 2 using xhci_hcd
Key type dns_resolver registered
sd 1:0:0:0: [sda] Mode Sense: 00 3a 00 00
microcode: sig=3D0x506e3, pf=3D0x20, revision=3D0xea
sd 1:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't suppor=
t DPO or FUA
microcode: Microcode Update Driver: v2.2.
IPI shorthand broadcast: enabled
 sda: sda1 sda2 sda3 sda4 sda5
AVX2 version of gcm_enc/dec engaged.
ath10k_pci 0000:3c:00.0: htt-ver 3.60 wmi-op 4 htt-op 3 cal otp max-sta 32 =
raw 0 hwcrypto 1
sd 1:0:0:0: [sda] Attached SCSI disk
AES CTR mode by8 optimization enabled
sched_clock: Marking stable (1160678423, 3697821)->(1168177289, -3801045)
registered taskstats version 1
Loading compiled-in X.509 certificates
Key type ._fscrypt registered
Key type .fscrypt registered
Key type fscrypt-provisioning registered
dell-smbios A80593CE-A997-11DA-B012-B622A1EF5492: WMI SMBIOS userspace inte=
rface not supported(0), try upgrading to a newer BIOS
input: Dell WMI hotkeys as /devices/platform/PNP0C14:01/wmi_bus/wmi_bus-PNP=
0C14:01/9DBB5994-A997-11DA-B012-B622A1EF5492/input/input7
cfg80211: Loading compiled-in X.509 certificates for regulatory database
cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
ALSA device list:
  No soundcards found.
ath: EEPROM regdomain: 0x6c
ath: EEPROM indicates we should expect a direct regpair map
ath: Country alpha2 being used: 00
ath: Regpair used: 0x6c
usb 1-4: config 1 interface 0 altsetting 0 has 2 endpoint descriptors, diff=
erent from the interface descriptor's value: 1
usb 1-4: New USB device found, idVendor=3D187c, idProduct=3D0528, bcdDevice=
=3D 0.00
usb 1-4: New USB device strings: Mfr=3D1, Product=3D2, SerialNumber=3D3
usb 1-4: Product: AW1517
usb 1-4: Manufacturer: Alienware
usb 1-4: SerialNumber: 16.0
hid-generic 0003:187C:0528.0001: device has no listeners, quitting
psmouse serio1: synaptics: queried max coordinates: x [..5668], y [..4756]
tsc: Refined TSC clocksource calibration: 2711.973 MHz
clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x27176cd0728, max_i=
dle_ns: 440795290119 ns
clocksource: Switched to clocksource tsc
usb 1-5: new full-speed USB device number 3 using xhci_hcd
psmouse serio1: synaptics: queried min coordinates: x [1274..], y [1098..]
psmouse serio1: synaptics: Trying to set up SMBus access
rmi4_smbus 6-002c: registering SMbus-connected sensor
rmi4_f01 rmi4-00.fn01: found RMI device, manufacturer: Synaptics, product: =
TM2417-001, fw id: 0
input: Synaptics TM2417-001 as /devices/rmi4-00/input/input8
usb 1-5: New USB device found, idVendor=3D0cf3, idProduct=3De300, bcdDevice=
=3D 0.01
usb 1-5: New USB device strings: Mfr=3D0, Product=3D0, SerialNumber=3D0
Bluetooth: hci0: using rampatch file: qca/rampatch_usb_00000302.bin
Bluetooth: hci0: QCA: patch rome 0x302 build 0x3e8, firmware rome 0x302 bui=
ld 0x111
snd_hda_codec_ca0132 hdaudioC0D0: ca0132 DSP downloaded and running
EXT4-fs (nvme0n1p2): INFO: recovery required on readonly filesystem
input: HDA Intel PCH Mic as /devices/pci0000:00/0000:00:1f.3/sound/card0/in=
put9
EXT4-fs (nvme0n1p2): write access will be enabled during recovery
input: HDA Intel PCH Headphone as /devices/pci0000:00/0000:00:1f.3/sound/ca=
rd0/input10
input: HDA Intel PCH HDMI/DP,pcm=3D3 as /devices/pci0000:00/0000:00:1f.3/so=
und/card0/input11
input: HDA Intel PCH HDMI/DP,pcm=3D7 as /devices/pci0000:00/0000:00:1f.3/so=
und/card0/input12
input: HDA Intel PCH HDMI/DP,pcm=3D8 as /devices/pci0000:00/0000:00:1f.3/so=
und/card0/input13
input: HDA Intel PCH HDMI/DP,pcm=3D9 as /devices/pci0000:00/0000:00:1f.3/so=
und/card0/input14
input: HDA Intel PCH HDMI/DP,pcm=3D10 as /devices/pci0000:00/0000:00:1f.3/s=
ound/card0/input15
usb 1-7: new high-speed USB device number 4 using xhci_hcd
EXT4-fs (nvme0n1p2): recovery complete
EXT4-fs (nvme0n1p2): mounted filesystem with ordered data mode. Opts: (null=
). Quota mode: disabled.
VFS: Mounted root (ext4 filesystem) readonly on device 259:2.
devtmpfs: mounted
Freeing unused kernel image (initmem) memory: 1112K
Write protecting the kernel read-only data: 36864k
Freeing unused kernel image (text/rodata gap) memory: 2032K
Freeing unused kernel image (rodata/data gap) memory: 1740K
Run /usr/lib/systemd/systemd as init process
  with arguments:
    /usr/lib/systemd/systemd
    nospec_store_bypass_disable
  with environment:
    HOME=3D/
    TERM=3Dlinux
    pti=3Doff
    spectre_v2=3Doff
usb 1-7: New USB device found, idVendor=3D1bcf, idProduct=3D2b8c, bcdDevice=
=3D47.14
usb 1-7: New USB device strings: Mfr=3D1, Product=3D2, SerialNumber=3D0
usb 1-7: Product: Integrated_Webcam_HD
usb 1-7: Manufacturer: SunplusIT Inc
usb 1-7: Found UVC 1.00 device Integrated_Webcam_HD (1bcf:2b8c)
input: Integrated_Webcam_HD: Integrate as /devices/pci0000:00/0000:00:14.0/=
usb1/1-7/1-7:1.0/input/input16
systemd 249 running in system mode (+PAM -AUDIT -SELINUX -APPARMOR +IMA +SM=
ACK +SECCOMP -GCRYPT +GNUTLS +OPENSSL +ACL +BLKID -CURL -ELFUTILS -FIDO2 +I=
DN2 -IDN +IPTC +KMOD -LIBCRYPTSETUP +LIBFDISK +PCRE2 -PWQUALITY -P11KIT -QR=
ENCODE -BZIP2 +LZ4 +XZ -ZLIB +ZSTD +XKBCOMMON +UTMP +SYSVINIT default-hiera=
rchy=3Dunified)
Detected architecture x86-64.
Bluetooth: hci0: using NVM file: qca/nvm_usb_00000302.bin
/lib/systemd/system/gpm.service:7: Standard output type syslog is obsolete,=
 automatically updating to journal. Please update your unit file, and consi=
der removing the setting altogether.
Queued start job for default target Graphical Interface.
Created slice Slice /system/getty.
Created slice Slice /system/modprobe.
Created slice Slice /system/systemd-fsck.
Created slice User and Session Slice.
Started Dispatch Password Requests to Console Directory Watch.
Started Forward Password Requests to Wall Directory Watch.
Set up automount Arbitrary Executable File Formats File System Automount Po=
int.
Reached target Remote File Systems.
Reached target Slice Units.
Reached target Swaps.
Listening on Process Core Dump Socket.
Listening on initctl Compatibility Named Pipe.
Condition check resulted in Journal Audit Socket being skipped.
Listening on Journal Socket (/dev/log).
Listening on Journal Socket.
Listening on Network Service Netlink Socket.
Listening on udev Control Socket.
Listening on udev Kernel Socket.
Mounting Huge Pages File System...
Mounting POSIX Message Queue File System...
Mounting Kernel Debug File System...
Mounting Kernel Trace File System...
tmp.mount: Directory /tmp to mount over is not empty, mounting anyway.
Mounting Temporary Directory /tmp...
Condition check resulted in Create List of Static Device Nodes being skippe=
d.
Starting Load Kernel Module configfs...
Starting Load Kernel Module drm...
Starting Load Kernel Module fuse...
Condition check resulted in Set Up Additional Binary Formats being skipped.
Starting File System Check on Root Device...
Starting Journal Service...
Condition check resulted in Load Kernel Modules being skipped.
Starting Apply Kernel Variables...
Starting Coldplug All udev Devices...
Started Journal Service.
EXT4-fs (nvme0n1p2): re-mounted. Opts: (null). Quota mode: disabled.
EXT4-fs (nvme0n1p3): mounted filesystem with ordered data mode. Opts: (null=
). Quota mode: disabled.
[drm] PCIE GART of 1024M enabled (table at 0x000000F400000000).
BUG: kernel NULL pointer dereference, address: 0000000000000020
#PF: supervisor write access in kernel mode
#PF: error_code(0x0002) - not-present page
PGD 0 P4D 0
Oops: 0002 [#1] SMP NOPTI
CPU: 1 PID: 472 Comm: X Tainted: G     U    I       5.14.0-rc3-agd5f+ #1279
Hardware name: Alienware Alienware 15 R2/0H6J09, BIOS 1.13.1 06/10/2021
RIP: 0010:mutex_lock+0x14/0x30
Code: c3 0f 1f 44 00 00 ba 02 01 00 00 e9 c6 fc ff ff cc cc cc cc cc cc 53 =
48 89 fb e8 e7 f3 ff ff 65 48 8b 0c 25 80 7c 01 00 31 c0 <f0> 48 0f b1 0b 7=
4 06 48 89 df 5b eb 0f 5b c3 66 2e 0f 1f 84 00 00
RSP: 0018:ffff8881123c7410 EFLAGS: 00010246
RAX: 0000000000000000 RBX: 0000000000000020 RCX: ffff8881130eab80
RDX: ffffffff837a3b20 RSI: ffffffff82f21500 RDI: 0000000000000020
RBP: ffff8881123c7810 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000001 R12: ffff88811b5e0000
R13: 0000000000000020 R14: ffff8881123c7440 R15: ffff888110ef3400
FS:  00007ff8f25a5e40(0000) GS:ffff8888a1c40000(0000) knlGS:000000000000000=
0
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000020 CR3: 000000010febe003 CR4: 00000000001706a0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 ? flush_workqueue+0x8e/0x560
 ? amdgpu_dm_atomic_commit_tail+0x481/0x2630
 ? atom_put_dst+0x251/0x460
 ? kfree+0x179/0x2d0
 ? amdgpu_atom_execute_table_locked+0x299/0x350
 ? kfree+0x179/0x2d0
 ? atom_op_and+0xc7/0x1a0
 ? __cond_resched+0x11/0x40
 ? __ww_mutex_lock+0x41/0x840
 ? kmem_cache_alloc_trace+0x152/0x260
 ? dm_plane_helper_prepare_fb+0x1ba/0x240
 ? commit_tail+0x8f/0x170
 ? drm_atomic_helper_commit+0x1f2/0x210
 ? drm_atomic_helper_commit_duplicated_state+0xf5/0x100
 ? drm_atomic_helper_resume+0xbc/0x150
 ? dm_resume.llvm.5009353506756501165+0x5b9/0x630
 ? amdgpu_device_resume+0x1a4/0x3f0
 ? amdgpu_pmops_runtime_resume+0xa2/0xd0
 ? pci_pm_runtime_resume+0xa2/0xe0
 ? pci_pm_runtime_suspend+0x180/0x180
 ? __rpm_callback+0x95/0x320
 ? ep_poll_callback+0x88/0x210
 ? __mod_memcg_lruvec_state+0x35/0xe0
 ? pci_pm_runtime_suspend+0x180/0x180
 ? rpm_resume+0x4a7/0x780
 ? __flush_work.llvm.17749977397669205720+0x7d/0x280
 ? __pm_runtime_resume+0x53/0x70
 ? amdgpu_driver_open_kms+0x57/0x210
 ? drm_file_alloc+0x19a/0x260
 ? drm_open+0xd8/0x210
 ? drm_stub_open+0xa2/0x120
 ? chrdev_open.llvm.10459766552443321194+0xe2/0x1e0
 ? cd_forget+0x60/0x60
 ? do_dentry_open+0x135/0x340
 ? path_openat+0x8df/0xbb0
 ? kmem_cache_free+0x151/0x230
 ? do_filp_open+0xa8/0x130
 ? do_sys_openat2+0x80/0x170
 ? __x64_sys_openat+0x6a/0x70
 ? do_syscall_64+0x70/0xa0
 ? entry_SYSCALL_64_after_hwframe+0x44/0xae
Modules linked in:
CR2: 0000000000000020
---[ end trace 6afaf9921664f04e ]---
RIP: 0010:mutex_lock+0x14/0x30
Code: c3 0f 1f 44 00 00 ba 02 01 00 00 e9 c6 fc ff ff cc cc cc cc cc cc 53 =
48 89 fb e8 e7 f3 ff ff 65 48 8b 0c 25 80 7c 01 00 31 c0 <f0> 48 0f b1 0b 7=
4 06 48 89 df 5b eb 0f 5b c3 66 2e 0f 1f 84 00 00
RSP: 0018:ffff8881123c7410 EFLAGS: 00010246
RAX: 0000000000000000 RBX: 0000000000000020 RCX: ffff8881130eab80
RDX: ffffffff837a3b20 RSI: ffffffff82f21500 RDI: 0000000000000020
RBP: ffff8881123c7810 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000001 R12: ffff88811b5e0000
R13: 0000000000000020 R14: ffff8881123c7440 R15: ffff888110ef3400
FS:  00007ff8f25a5e40(0000) GS:ffff8888a1c40000(0000) knlGS:000000000000000=
0
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000020 CR3: 000000010febe003 CR4: 00000000001706a0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Syncing filesystems and block devices.
Sending SIGTERM to remaining processes...

On Wed, 18 Aug 2021 at 03:08, Mike Lothian <mike@fireburn.co.uk<mailto:mike=
@fireburn.co.uk>> wrote:
Hi

I've just noticed something similar when starting weston, I still see it wi=
th this patch, but not on linus's tree

I'll confirm for sure tomorrow and send the stack trace if I can save it

Cheers

Mike

On Tue, 3 Aug 2021 at 02:56, Chen, Guchun <Guchun.Chen@amd.com<mailto:Guchu=
n.Chen@amd.com>> wrote:
[Public]

Hi Alex,

I submitted the patch before your message, I will take care of this next ti=
me.

Regards,
Guchun

-----Original Message-----
From: Alex Deucher <alexdeucher@gmail.com<mailto:alexdeucher@gmail.com>>
Sent: Monday, August 2, 2021 9:35 PM
To: Chen, Guchun <Guchun.Chen@amd.com<mailto:Guchun.Chen@amd.com>>
Cc: Christian K=F6nig <ckoenig.leichtzumerken@gmail.com<mailto:ckoenig.leic=
htzumerken@gmail.com>>; amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.=
freedesktop.org>; Gao, Likun <Likun.Gao@amd.com<mailto:Likun.Gao@amd.com>>;=
 Koenig, Christian <Christian.Koenig@amd.com<mailto:Christian.Koenig@amd.co=
m>>; Zhang, Hawking <Hawking.Zhang@amd.com<mailto:Hawking.Zhang@amd.com>>; =
Deucher, Alexander <Alexander.Deucher@amd.com<mailto:Alexander.Deucher@amd.=
com>>
Subject: Re: [PATCH] drm/amdgpu: avoid over-handle of fence driver fini in =
s3 test (v2)

On Mon, Aug 2, 2021 at 4:23 AM Chen, Guchun <Guchun.Chen@amd.com<mailto:Guc=
hun.Chen@amd.com>> wrote:
>
> [Public]
>
> Thank you, Christian.
>
> Regarding fence_drv.initialized, it looks to a bit redundant, anyway let =
me look into this more.

Does this patch fix this bug?
https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgitlab.=
freedesktop.org%2Fdrm%2Famd%2F-%2Fissues%2F1668&amp;data=3D04%7C01%7CGuchun=
.Chen%40amd.com%7C2bf8bebf5b424751572408d955ba66e8%7C3dd8961fe4884e608e11a8=
2d994e183d%7C0%7C0%7C637635081353279181%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4=
wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3D=
FuAo44Ws5SnuCxt45A%2Fqmu%2B3OfEkat1G%2BixO8G9uDVc%3D&amp;reserved=3D0<https=
://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgitlab.freed=
esktop.org%2Fdrm%2Famd%2F-%2Fissues%2F1668&data=3D04%7C01%7CGuchun.Chen%40a=
md.com%7C82f9e022b7d54387f0dd08d961eda83b%7C3dd8961fe4884e608e11a82d994e183=
d%7C0%7C0%7C637648495656963126%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAi=
LCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=3DLEUfvxvXNo5BS=
xy9ZWMG2sCmhS0%2FJN3boUh6c1kOTXo%3D&reserved=3D0>

If so, please add:
Bug: https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgi=
tlab.freedesktop.org%2Fdrm%2Famd%2F-%2Fissues%2F1668&amp;data=3D04%7C01%7CG=
uchun.Chen%40amd.com%7C2bf8bebf5b424751572408d955ba66e8%7C3dd8961fe4884e608=
e11a82d994e183d%7C0%7C0%7C637635081353279181%7CUnknown%7CTWFpbGZsb3d8eyJWIj=
oiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sda=
ta=3DFuAo44Ws5SnuCxt45A%2Fqmu%2B3OfEkat1G%2BixO8G9uDVc%3D&amp;reserved=3D0<=
https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgitlab.=
freedesktop.org%2Fdrm%2Famd%2F-%2Fissues%2F1668&data=3D04%7C01%7CGuchun.Che=
n%40amd.com%7C82f9e022b7d54387f0dd08d961eda83b%7C3dd8961fe4884e608e11a82d99=
4e183d%7C0%7C0%7C637648495656973118%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjA=
wMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=3Dw0cgvYWr=
UdxKUmIavnhArY2DkS2IYxuWLb%2FYHNB0%2BmM%3D&reserved=3D0>
to the commit message.

Alex

>
> Regards,
> Guchun
>
> -----Original Message-----
> From: Christian K=F6nig <ckoenig.leichtzumerken@gmail.com<mailto:ckoenig.=
leichtzumerken@gmail.com>>
> Sent: Monday, August 2, 2021 2:56 PM
> To: Chen, Guchun <Guchun.Chen@amd.com<mailto:Guchun.Chen@amd.com>>; amd-g=
fx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>;
> Gao, Likun <Likun.Gao@amd.com<mailto:Likun.Gao@amd.com>>; Koenig, Christi=
an
> <Christian.Koenig@amd.com<mailto:Christian.Koenig@amd.com>>; Zhang, Hawki=
ng <Hawking.Zhang@amd.com<mailto:Hawking.Zhang@amd.com>>;
> Deucher, Alexander <Alexander.Deucher@amd.com<mailto:Alexander.Deucher@am=
d.com>>
> Subject: Re: [PATCH] drm/amdgpu: avoid over-handle of fence driver
> fini in s3 test (v2)
>
> Am 02.08.21 um 07:16 schrieb Guchun Chen:
> > In amdgpu_fence_driver_hw_fini, no need to call drm_sched_fini to
> > stop scheduler in s3 test, otherwise, fence related failure will
> > arrive after resume. To fix this and for a better clean up, move
> > drm_sched_fini from fence_hw_fini to fence_sw_fini, as it's part of
> > driver shutdown, and should never be called in hw_fini.
> >
> > v2: rename amdgpu_fence_driver_init to amdgpu_fence_driver_sw_init,
> > to keep sw_init and sw_fini paired.
> >
> > Fixes: cd87a6dcf6af drm/amdgpu: adjust fence driver enable sequence
> > Suggested-by: Christian K=F6nig <christian.koenig@amd.com<mailto:christ=
ian.koenig@amd.com>>
> > Signed-off-by: Guchun Chen <guchun.chen@amd.com<mailto:guchun.chen@amd.=
com>>
>
> It's a bit ambiguous now what fence_drv.initialized means, but I think we=
 can live with that for now.
>
> Patch is Reviewed-by: Christian K=F6nig <christian.koenig@amd.com<mailto:=
christian.koenig@amd.com>>.
>
> Regards,
> Christian.
>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  5 ++---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c  | 12 +++++++-----
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h   |  4 ++--
> >   3 files changed, 11 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > index b1d2dc39e8be..9e53ff851496 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > @@ -3646,9 +3646,9 @@ int amdgpu_device_init(struct amdgpu_device
> > *adev,
> >
> >   fence_driver_init:
> >       /* Fence driver */
> > -     r =3D amdgpu_fence_driver_init(adev);
> > +     r =3D amdgpu_fence_driver_sw_init(adev);
> >       if (r) {
> > -             dev_err(adev->dev, "amdgpu_fence_driver_init failed\n");
> > +             dev_err(adev->dev, "amdgpu_fence_driver_sw_init
> > + failed\n");
> >               amdgpu_vf_error_put(adev, AMDGIM_ERROR_VF_FENCE_INIT_FAIL=
, 0, 0);
> >               goto failed;
> >       }
> > @@ -3988,7 +3988,6 @@ int amdgpu_device_resume(struct drm_device *dev, =
bool fbcon)
> >       }
> >       amdgpu_fence_driver_hw_init(adev);
> >
> > -
> >       r =3D amdgpu_device_ip_late_init(adev);
> >       if (r)
> >               return r;
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> > b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> > index 49c5c7331c53..7495911516c2 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> > @@ -498,7 +498,7 @@ int amdgpu_fence_driver_init_ring(struct amdgpu_rin=
g *ring,
> >   }
> >
> >   /**
> > - * amdgpu_fence_driver_init - init the fence driver
> > + * amdgpu_fence_driver_sw_init - init the fence driver
> >    * for all possible rings.
> >    *
> >    * @adev: amdgpu device pointer
> > @@ -509,13 +509,13 @@ int amdgpu_fence_driver_init_ring(struct amdgpu_r=
ing *ring,
> >    * amdgpu_fence_driver_start_ring().
> >    * Returns 0 for success.
> >    */
> > -int amdgpu_fence_driver_init(struct amdgpu_device *adev)
> > +int amdgpu_fence_driver_sw_init(struct amdgpu_device *adev)
> >   {
> >       return 0;
> >   }
> >
> >   /**
> > - * amdgpu_fence_driver_fini - tear down the fence driver
> > + * amdgpu_fence_driver_hw_fini - tear down the fence driver
> >    * for all possible rings.
> >    *
> >    * @adev: amdgpu device pointer
> > @@ -531,8 +531,7 @@ void amdgpu_fence_driver_hw_fini(struct
> > amdgpu_device *adev)
> >
> >               if (!ring || !ring->fence_drv.initialized)
> >                       continue;
> > -             if (!ring->no_scheduler)
> > -                     drm_sched_fini(&ring->sched);
> > +
> >               /* You can't wait for HW to signal if it's gone */
> >               if (!drm_dev_is_unplugged(&adev->ddev))
> >                       r =3D amdgpu_fence_wait_empty(ring); @@ -560,6
> > +559,9 @@ void amdgpu_fence_driver_sw_fini(struct amdgpu_device *adev)
> >               if (!ring || !ring->fence_drv.initialized)
> >                       continue;
> >
> > +             if (!ring->no_scheduler)
> > +                     drm_sched_fini(&ring->sched);
> > +
> >               for (j =3D 0; j <=3D ring->fence_drv.num_fences_mask; ++j=
)
> >                       dma_fence_put(ring->fence_drv.fences[j]);
> >               kfree(ring->fence_drv.fences); diff --git
> > a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
> > b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
> > index 27adffa7658d..9c11ced4312c 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
> > @@ -106,7 +106,6 @@ struct amdgpu_fence_driver {
> >       struct dma_fence                **fences;
> >   };
> >
> > -int amdgpu_fence_driver_init(struct amdgpu_device *adev);
> >   void amdgpu_fence_driver_force_completion(struct amdgpu_ring
> > *ring);
> >
> >   int amdgpu_fence_driver_init_ring(struct amdgpu_ring *ring, @@
> > -115,9 +114,10 @@ int amdgpu_fence_driver_init_ring(struct amdgpu_ring =
*ring,
> >   int amdgpu_fence_driver_start_ring(struct amdgpu_ring *ring,
> >                                  struct amdgpu_irq_src *irq_src,
> >                                  unsigned irq_type);
> > +void amdgpu_fence_driver_hw_init(struct amdgpu_device *adev);
> >   void amdgpu_fence_driver_hw_fini(struct amdgpu_device *adev);
> > +int amdgpu_fence_driver_sw_init(struct amdgpu_device *adev);
> >   void amdgpu_fence_driver_sw_fini(struct amdgpu_device *adev);
> > -void amdgpu_fence_driver_hw_init(struct amdgpu_device *adev);
> >   int amdgpu_fence_emit(struct amdgpu_ring *ring, struct dma_fence **fe=
nce,
> >                     unsigned flags);
> >   int amdgpu_fence_emit_polling(struct amdgpu_ring *ring, uint32_t *s,

--_000_DM5PR12MB24695E8F2DFE2EE603354D8FF1FF9DM5PR12MB2469namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
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
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
span.EmailStyle18
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
p.msipheader23c54b6f, li.msipheader23c54b6f, div.msipheader23c54b6f
	{mso-style-name:msipheader23c54b6f;
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
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:brea=
k-word">
<div class=3D"WordSection1">
<p class=3D"msipheader23c54b6f" style=3D"margin:0in"><span style=3D"font-si=
ze:10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:green">[Public]</s=
pan><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Hi Mike,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks for your info. So with Weston, the issue can =
be observed, while with X, no such issue?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Guchun<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b>From:</b> Mike Lothian &lt;mike@fireburn.co.uk&gt=
; <br>
<b>Sent:</b> Wednesday, August 18, 2021 10:12 AM<br>
<b>To:</b> Chen, Guchun &lt;Guchun.Chen@amd.com&gt;<br>
<b>Cc:</b> Alex Deucher &lt;alexdeucher@gmail.com&gt;; Christian K=F6nig &l=
t;ckoenig.leichtzumerken@gmail.com&gt;; amd-gfx@lists.freedesktop.org; Gao,=
 Likun &lt;Likun.Gao@amd.com&gt;; Koenig, Christian &lt;Christian.Koenig@am=
d.com&gt;; Zhang, Hawking &lt;Hawking.Zhang@amd.com&gt;; Deucher,
 Alexander &lt;Alexander.Deucher@amd.com&gt;<br>
<b>Subject:</b> Re: [PATCH] drm/amdgpu: avoid over-handle of fence driver f=
ini in s3 test (v2)<o:p></o:p></p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal">Here's the dmesg<o:p></o:p></p>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Linux version 5.14.0-rc3-agd5f+ (<a href=3D"mailto:r=
oot@axion.fireburn.co.uk">root@axion.fireburn.co.uk</a>) (clang version 12.=
0.1, LLD 12.0.1) #1279 SMP Tue Aug 17 02:23:10 BST 2021<br>
Command line: <br>
KERNEL supported cpus:<br>
&nbsp; Intel GenuineIntel<br>
x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'<br>
x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'<br>
x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'<br>
x86/fpu: Supporting XSAVE feature 0x008: 'MPX bounds registers'<br>
x86/fpu: Supporting XSAVE feature 0x010: 'MPX CSR'<br>
x86/fpu: xstate_offset[2]: &nbsp;576, xstate_sizes[2]: &nbsp;256<br>
x86/fpu: xstate_offset[3]: &nbsp;832, xstate_sizes[3]: &nbsp; 64<br>
x86/fpu: xstate_offset[4]: &nbsp;896, xstate_sizes[4]: &nbsp; 64<br>
x86/fpu: Enabled xstate features 0x1f, context size is 960 bytes, using 'co=
mpacted' format.<br>
signal: max sigframe size: 2032<br>
BIOS-provided physical RAM map:<br>
BIOS-e820: [mem 0x0000000000000000-0x0000000000057fff] usable<br>
BIOS-e820: [mem 0x0000000000058000-0x0000000000058fff] reserved<br>
BIOS-e820: [mem 0x0000000000059000-0x000000000009dfff] usable<br>
BIOS-e820: [mem 0x000000000009e000-0x000000000009ffff] reserved<br>
BIOS-e820: [mem 0x0000000000100000-0x00000000312bafff] usable<br>
BIOS-e820: [mem 0x00000000312bb000-0x00000000312ccfff] reserved<br>
BIOS-e820: [mem 0x00000000312cd000-0x00000000312e5fff] usable<br>
BIOS-e820: [mem 0x00000000312e6000-0x00000000312e6fff] ACPI NVS<br>
BIOS-e820: [mem 0x00000000312e7000-0x0000000031330fff] reserved<br>
BIOS-e820: [mem 0x0000000031331000-0x000000003138bfff] usable<br>
BIOS-e820: [mem 0x000000003138c000-0x0000000031aaafff] reserved<br>
BIOS-e820: [mem 0x0000000031aab000-0x00000000362a0fff] usable<br>
BIOS-e820: [mem 0x00000000362a1000-0x00000000372bbfff] reserved<br>
BIOS-e820: [mem 0x00000000372bc000-0x00000000372fafff] ACPI data<br>
BIOS-e820: [mem 0x00000000372fb000-0x000000003789afff] ACPI NVS<br>
BIOS-e820: [mem 0x000000003789b000-0x0000000037ffefff] reserved<br>
BIOS-e820: [mem 0x0000000037fff000-0x0000000037ffffff] usable<br>
BIOS-e820: [mem 0x0000000038000000-0x00000000380fffff] reserved<br>
BIOS-e820: [mem 0x00000000e0000000-0x00000000efffffff] reserved<br>
BIOS-e820: [mem 0x00000000fe000000-0x00000000fe010fff] reserved<br>
BIOS-e820: [mem 0x00000000fec00000-0x00000000fec00fff] reserved<br>
BIOS-e820: [mem 0x00000000fee00000-0x00000000fee00fff] reserved<br>
BIOS-e820: [mem 0x00000000ff000000-0x00000000ffffffff] reserved<br>
BIOS-e820: [mem 0x0000000100000000-0x00000008c1ffffff] usable<br>
NX (Execute Disable) protection: active<br>
e820: update [mem 0x310ad018-0x310bcc57] usable =3D=3D&gt; usable<br>
e820: update [mem 0x310ad018-0x310bcc57] usable =3D=3D&gt; usable<br>
e820: update [mem 0x3109c018-0x310ac057] usable =3D=3D&gt; usable<br>
e820: update [mem 0x3109c018-0x310ac057] usable =3D=3D&gt; usable<br>
extended physical RAM map:<br>
reserve setup_data: [mem 0x0000000000000000-0x0000000000057fff] usable<br>
reserve setup_data: [mem 0x0000000000058000-0x0000000000058fff] reserved<br=
>
reserve setup_data: [mem 0x0000000000059000-0x000000000009dfff] usable<br>
reserve setup_data: [mem 0x000000000009e000-0x000000000009ffff] reserved<br=
>
reserve setup_data: [mem 0x0000000000100000-0x000000003109c017] usable<br>
reserve setup_data: [mem 0x000000003109c018-0x00000000310ac057] usable<br>
reserve setup_data: [mem 0x00000000310ac058-0x00000000310ad017] usable<br>
reserve setup_data: [mem 0x00000000310ad018-0x00000000310bcc57] usable<br>
reserve setup_data: [mem 0x00000000310bcc58-0x00000000312bafff] usable<br>
reserve setup_data: [mem 0x00000000312bb000-0x00000000312ccfff] reserved<br=
>
reserve setup_data: [mem 0x00000000312cd000-0x00000000312e5fff] usable<br>
reserve setup_data: [mem 0x00000000312e6000-0x00000000312e6fff] ACPI NVS<br=
>
reserve setup_data: [mem 0x00000000312e7000-0x0000000031330fff] reserved<br=
>
reserve setup_data: [mem 0x0000000031331000-0x000000003138bfff] usable<br>
reserve setup_data: [mem 0x000000003138c000-0x0000000031aaafff] reserved<br=
>
reserve setup_data: [mem 0x0000000031aab000-0x00000000362a0fff] usable<br>
reserve setup_data: [mem 0x00000000362a1000-0x00000000372bbfff] reserved<br=
>
reserve setup_data: [mem 0x00000000372bc000-0x00000000372fafff] ACPI data<b=
r>
reserve setup_data: [mem 0x00000000372fb000-0x000000003789afff] ACPI NVS<br=
>
reserve setup_data: [mem 0x000000003789b000-0x0000000037ffefff] reserved<br=
>
reserve setup_data: [mem 0x0000000037fff000-0x0000000037ffffff] usable<br>
reserve setup_data: [mem 0x0000000038000000-0x00000000380fffff] reserved<br=
>
reserve setup_data: [mem 0x00000000e0000000-0x00000000efffffff] reserved<br=
>
reserve setup_data: [mem 0x00000000fe000000-0x00000000fe010fff] reserved<br=
>
reserve setup_data: [mem 0x00000000fec00000-0x00000000fec00fff] reserved<br=
>
reserve setup_data: [mem 0x00000000fee00000-0x00000000fee00fff] reserved<br=
>
reserve setup_data: [mem 0x00000000ff000000-0x00000000ffffffff] reserved<br=
>
reserve setup_data: [mem 0x0000000100000000-0x00000008c1ffffff] usable<br>
efi: EFI v2.40 by American Megatrends<br>
efi: ESRT=3D0x37f83018 ACPI=3D0x372c8000 ACPI 2.0=3D0x372c8000 SMBIOS=3D0x3=
7ecd000 <br>
SMBIOS 2.8 present.<br>
DMI: Alienware Alienware 15 R2/0H6J09, BIOS 1.13.1 06/10/2021<br>
tsc: Detected 2700.000 MHz processor<br>
tsc: Detected 2699.909 MHz TSC<br>
e820: update [mem 0x00000000-0x00000fff] usable =3D=3D&gt; reserved<br>
e820: remove [mem 0x000a0000-0x000fffff] usable<br>
last_pfn =3D 0x8c2000 max_arch_pfn =3D 0x400000000<br>
x86/PAT: Configuration [0-7]: WB &nbsp;WC &nbsp;UC- UC &nbsp;WB &nbsp;WP &n=
bsp;UC- WT &nbsp;<br>
last_pfn =3D 0x38000 max_arch_pfn =3D 0x400000000<br>
esrt: Reserving ESRT space from 0x0000000037f83018 to 0x0000000037f83050.<b=
r>
Kernel/User page tables isolation: disabled on command line.<br>
Using GB pages for direct mapping<br>
Secure boot disabled<br>
ACPI: Early table checksum verification disabled<br>
ACPI: RSDP 0x00000000372C8000 000024 (v02 ALWARE)<br>
ACPI: XSDT 0x00000000372C80A8 0000CC (v01 ALWARE ALIENWRE 01072009 AMI &nbs=
p;00010013)<br>
ACPI: FACP 0x00000000372EBF70 00010C (v05 ALWARE ALIENWRE 01072009 AMI &nbs=
p;00010013)<br>
ACPI: DSDT 0x00000000372C8200 023D6B (v02 ALWARE ALIENWRE 01072009 INTL 201=
20913)<br>
ACPI: FACS 0x0000000037899F80 000040<br>
ACPI: APIC 0x00000000372EC080 0000BC (v03 ALWARE ALIENWRE 01072009 AMI &nbs=
p;00010013)<br>
ACPI: FPDT 0x00000000372EC140 000044 (v01 ALWARE ALIENWRE 01072009 AMI &nbs=
p;00010013)<br>
ACPI: FIDT 0x00000000372EC188 00009C (v01 ALWARE ALIENWRE 01072009 AMI &nbs=
p;00010013)<br>
ACPI: MCFG 0x00000000372EC228 00003C (v01 ALWARE ALIENWRE 01072009 MSFT 000=
00097)<br>
ACPI: HPET 0x00000000372EC268 000038 (v01 ALWARE ALIENWRE 01072009 AMI. 000=
5000B)<br>
ACPI: SSDT 0x00000000372EC2A0 0004B9 (v01 SataRe SataTabl 00001000 INTL 201=
20913)<br>
ACPI: LPIT 0x00000000372EC760 000094 (v01 INTEL &nbsp;SKL &nbsp; &nbsp; &nb=
sp;00000000 MSFT 0000005F)<br>
ACPI: SSDT 0x00000000372EC7F8 000248 (v02 INTEL &nbsp;sensrhub 00000000 INT=
L 20120913)<br>
ACPI: SSDT 0x00000000372ECA40 002BAE (v02 INTEL &nbsp;PtidDevc 00001000 INT=
L 20120913)<br>
ACPI: DBGP 0x00000000372EF5F0 000034 (v01 INTEL &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; 00000000 MSFT 0000005F)<br>
ACPI: DBG2 0x00000000372EF628 000054 (v00 INTEL &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; 00000000 MSFT 0000005F)<br>
ACPI: SSDT 0x00000000372EF680 00069D (v02 INTEL &nbsp;xh_rvp10 00000000 INT=
L 20120913)<br>
ACPI: SSDT 0x00000000372EFD20 002DB7 (v02 DptfTa DptfTabl 00001000 INTL 201=
20913)<br>
ACPI: SSDT 0x00000000372F2AD8 00559B (v02 SaSsdt SaSsdt &nbsp; 00003000 INT=
L 20120913)<br>
ACPI: UEFI 0x00000000372F8078 000042 (v01 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; 00000000 &nbsp; &nbsp; &nbsp;00000000)<br>
ACPI: SSDT 0x00000000372F80C0 000E58 (v02 CpuRef CpuSsdt &nbsp;00003000 INT=
L 20120913)<br>
ACPI: SSDT 0x00000000372F8F18 0000CE (v02 SgRef &nbsp;SgPeg &nbsp; &nbsp;00=
001000 INTL 20120913)<br>
ACPI: DMAR 0x00000000372F8FE8 0000A8 (v01 INTEL &nbsp;SKL &nbsp; &nbsp; &nb=
sp;00000001 INTL 00000001)<br>
ACPI: BGRT 0x00000000372F9090 000038 (v01 ALWARE ALIENWRE 01072009 AMI &nbs=
p;00010013)<br>
ACPI: SSDT 0x00000000372F90C8 001216 (v01 AmdRef AmdTabl &nbsp;00001000 INT=
L 20120913)<br>
ACPI: Reserving FACP table memory at [mem 0x372ebf70-0x372ec07b]<br>
ACPI: Reserving DSDT table memory at [mem 0x372c8200-0x372ebf6a]<br>
ACPI: Reserving FACS table memory at [mem 0x37899f80-0x37899fbf]<br>
ACPI: Reserving APIC table memory at [mem 0x372ec080-0x372ec13b]<br>
ACPI: Reserving FPDT table memory at [mem 0x372ec140-0x372ec183]<br>
ACPI: Reserving FIDT table memory at [mem 0x372ec188-0x372ec223]<br>
ACPI: Reserving MCFG table memory at [mem 0x372ec228-0x372ec263]<br>
ACPI: Reserving HPET table memory at [mem 0x372ec268-0x372ec29f]<br>
ACPI: Reserving SSDT table memory at [mem 0x372ec2a0-0x372ec758]<br>
ACPI: Reserving LPIT table memory at [mem 0x372ec760-0x372ec7f3]<br>
ACPI: Reserving SSDT table memory at [mem 0x372ec7f8-0x372eca3f]<br>
ACPI: Reserving SSDT table memory at [mem 0x372eca40-0x372ef5ed]<br>
ACPI: Reserving DBGP table memory at [mem 0x372ef5f0-0x372ef623]<br>
ACPI: Reserving DBG2 table memory at [mem 0x372ef628-0x372ef67b]<br>
ACPI: Reserving SSDT table memory at [mem 0x372ef680-0x372efd1c]<br>
ACPI: Reserving SSDT table memory at [mem 0x372efd20-0x372f2ad6]<br>
ACPI: Reserving SSDT table memory at [mem 0x372f2ad8-0x372f8072]<br>
ACPI: Reserving UEFI table memory at [mem 0x372f8078-0x372f80b9]<br>
ACPI: Reserving SSDT table memory at [mem 0x372f80c0-0x372f8f17]<br>
ACPI: Reserving SSDT table memory at [mem 0x372f8f18-0x372f8fe5]<br>
ACPI: Reserving DMAR table memory at [mem 0x372f8fe8-0x372f908f]<br>
ACPI: Reserving BGRT table memory at [mem 0x372f9090-0x372f90c7]<br>
ACPI: Reserving SSDT table memory at [mem 0x372f90c8-0x372fa2dd]<br>
Zone ranges:<br>
&nbsp; DMA &nbsp; &nbsp; &nbsp;[mem 0x0000000000001000-0x0000000000ffffff]<=
br>
&nbsp; DMA32 &nbsp; &nbsp;[mem 0x0000000001000000-0x00000000ffffffff]<br>
&nbsp; Normal &nbsp; [mem 0x0000000100000000-0x00000008c1ffffff]<br>
&nbsp; Device &nbsp; empty<br>
Movable zone start for each node<br>
Early memory node ranges<br>
&nbsp; node &nbsp; 0: [mem 0x0000000000001000-0x0000000000057fff]<br>
&nbsp; node &nbsp; 0: [mem 0x0000000000059000-0x000000000009dfff]<br>
&nbsp; node &nbsp; 0: [mem 0x0000000000100000-0x00000000312bafff]<br>
&nbsp; node &nbsp; 0: [mem 0x00000000312cd000-0x00000000312e5fff]<br>
&nbsp; node &nbsp; 0: [mem 0x0000000031331000-0x000000003138bfff]<br>
&nbsp; node &nbsp; 0: [mem 0x0000000031aab000-0x00000000362a0fff]<br>
&nbsp; node &nbsp; 0: [mem 0x0000000037fff000-0x0000000037ffffff]<br>
&nbsp; node &nbsp; 0: [mem 0x0000000100000000-0x00000008c1ffffff]<br>
Initmem setup node 0 [mem 0x0000000000001000-0x00000008c1ffffff]<br>
On node 0, zone DMA: 1 pages in unavailable ranges<br>
On node 0, zone DMA: 1 pages in unavailable ranges<br>
On node 0, zone DMA: 98 pages in unavailable ranges<br>
On node 0, zone DMA32: 18 pages in unavailable ranges<br>
On node 0, zone DMA32: 75 pages in unavailable ranges<br>
On node 0, zone DMA32: 1823 pages in unavailable ranges<br>
On node 0, zone DMA32: 7518 pages in unavailable ranges<br>
On node 0, zone Normal: 24576 pages in unavailable ranges<br>
Reserving Intel graphics memory at [mem 0x39000000-0x3cffffff]<br>
ACPI: PM-Timer IO Port: 0x1808<br>
ACPI: LAPIC_NMI (acpi_id[0x01] high edge lint[0x1])<br>
ACPI: LAPIC_NMI (acpi_id[0x02] high edge lint[0x1])<br>
ACPI: LAPIC_NMI (acpi_id[0x03] high edge lint[0x1])<br>
ACPI: LAPIC_NMI (acpi_id[0x04] high edge lint[0x1])<br>
ACPI: LAPIC_NMI (acpi_id[0x05] high edge lint[0x1])<br>
ACPI: LAPIC_NMI (acpi_id[0x06] high edge lint[0x1])<br>
ACPI: LAPIC_NMI (acpi_id[0x07] high edge lint[0x1])<br>
ACPI: LAPIC_NMI (acpi_id[0x08] high edge lint[0x1])<br>
IOAPIC[0]: apic_id 2, version 32, address 0xfec00000, GSI 0-119<br>
ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)<br>
ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)<br>
ACPI: Using ACPI (MADT) for SMP configuration information<br>
ACPI: HPET id: 0x8086a701 base: 0xfed00000<br>
e820: update [mem 0x345ec000-0x34775fff] usable =3D=3D&gt; reserved<br>
TSC deadline timer available<br>
smpboot: Allowing 8 CPUs, 0 hotplug CPUs<br>
[mem 0x3d000000-0xdfffffff] available for PCI devices<br>
clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_=
idle_ns: 1910969940391419 ns<br>
setup_percpu: NR_CPUS:16 nr_cpumask_bits:16 nr_cpu_ids:8 nr_node_ids:1<br>
percpu: Embedded 54 pages/cpu s182104 r8192 d30888 u262144<br>
pcpu-alloc: s182104 r8192 d30888 u262144 alloc=3D1*2097152<br>
pcpu-alloc: [0] 0 1 2 3 4 5 6 7 <br>
Built 1 zonelists, mobility grouping on.&nbsp; Total pages: 8223801<br>
Kernel command line: root=3D/dev/nvme0n1p2 rootfstype=3Dext4 libahci.ignore=
_sss=3D1 init=3D/usr/lib/systemd/systemd systemd.unified_cgroup_hierarchy=
=3D1 cgroup_no_v1=3Dall psmouse.synaptics_intertouch=3D1 mitigations=3Doff =
mds=3Doff pti=3Doff spectre_v2=3Doff l1tf=3Doff nospec_store_bypass_disable
 printk.devkmsg=3Don amdgpu.resize_bar=3D1 i915.enable_guc=3D3 dell_smm_hwm=
on.force=3D1 <br>
Setting dangerous option i915.enable_guc - tainting kernel<br>
Unknown command line parameters: nospec_store_bypass_disable pti=3Doff spec=
tre_v2=3Doff<br>
printk: log_buf_len individual max cpu contribution: 131072 bytes<br>
printk: log_buf_len total cpu_extra contributions: 917504 bytes<br>
printk: log_buf_len min size: 262144 bytes<br>
printk: log_buf_len: 2097152 bytes<br>
printk: early log buf free: 248144(94%)<br>
Dentry cache hash table entries: 4194304 (order: 13, 33554432 bytes, linear=
)<br>
Inode-cache hash table entries: 2097152 (order: 12, 16777216 bytes, linear)=
<br>
mem auto-init: stack:all(zero), heap alloc:off, heap free:off<br>
Memory: 32648724K/33417992K available (22540K kernel code, 2395K rwdata, 10=
548K rodata, 1112K init, 2464K bss, 769012K reserved, 0K cma-reserved)<br>
random: get_random_u64 called from cache_random_seq_create+0x52/0x1b0 with =
crng_init=3D0<br>
SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D8, Nodes=3D1<br>
rcu: Hierarchical RCU implementation.<br>
rcu: RCU event tracing is enabled.<br>
rcu: RCU restricting CPUs from NR_CPUS=3D16 to nr_cpu_ids=3D8.<br>
Tracing variant of Tasks RCU enabled.<br>
rcu: RCU calculated value of scheduler-enlistment delay is 100 jiffies.<br>
rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=3D8<br>
NR_IRQS: 4352, nr_irqs: 2048, preallocated irqs: 16<br>
random: crng done (trusting CPU's manufacturer)<br>
spurious 8259A interrupt: IRQ7.<br>
Console: colour dummy device 80x25<br>
printk: console [tty0] enabled<br>
ACPI: Core revision 20210604<br>
clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 79=
635855245 ns<br>
APIC: Switch to symmetric I/O mode setup<br>
DMAR: Host address width 39<br>
DMAR: DRHD base: 0x000000fed90000 flags: 0x0<br>
DMAR: dmar0: reg_base_addr fed90000 ver 1:0 cap 1c0000c40660462 ecap 7e3ff0=
501e<br>
DMAR: DRHD base: 0x000000fed91000 flags: 0x1<br>
DMAR: dmar1: reg_base_addr fed91000 ver 1:0 cap d2008c40660462 ecap f050da<=
br>
DMAR: RMRR base: 0x000000371e5000 end: 0x00000037204fff<br>
DMAR: RMRR base: 0x00000038800000 end: 0x0000003cffffff<br>
DMAR: [Firmware Bug]: No firmware reserved region can cover this RMRR [0x00=
00000038800000-0x000000003cffffff], contact BIOS vendor for fixes<br>
DMAR: [Firmware Bug]: Your BIOS is broken; bad RMRR [0x0000000038800000-0x0=
00000003cffffff]<br>
BIOS vendor: Alienware; Ver: 1.13.1; Product Version: 1.13.1<br>
DMAR-IR: IOAPIC id 2 under DRHD base &nbsp;0xfed91000 IOMMU 1<br>
DMAR-IR: HPET id 0 under DRHD base 0xfed91000<br>
DMAR-IR: Enabled IRQ remapping in xapic mode<br>
..TIMER: vector=3D0x30 apic1=3D0 pin1=3D2 apic2=3D-1 pin2=3D-1<br>
clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles: 0x26eae8729ef,=
 max_idle_ns: 440795235156 ns<br>
Calibrating delay loop (skipped), value calculated using timer frequency.. =
5399.81 BogoMIPS (lpj=3D2699909)<br>
pid_max: default: 32768 minimum: 301<br>
Mount-cache hash table entries: 65536 (order: 7, 524288 bytes, linear)<br>
Mountpoint-cache hash table entries: 65536 (order: 7, 524288 bytes, linear)=
<br>
Disabling cpuset control group subsystem in v1 mounts<br>
Disabling cpu control group subsystem in v1 mounts<br>
Disabling cpuacct control group subsystem in v1 mounts<br>
Disabling io control group subsystem in v1 mounts<br>
Disabling memory control group subsystem in v1 mounts<br>
Disabling devices control group subsystem in v1 mounts<br>
Disabling freezer control group subsystem in v1 mounts<br>
Disabling net_cls control group subsystem in v1 mounts<br>
Disabling net_prio control group subsystem in v1 mounts<br>
Disabling hugetlb control group subsystem in v1 mounts<br>
Disabling pids control group subsystem in v1 mounts<br>
Disabling rdma control group subsystem in v1 mounts<br>
Disabling misc control group subsystem in v1 mounts<br>
CPU0: Thermal monitoring enabled (TM1)<br>
process: using mwait in idle threads<br>
Last level iTLB entries: 4KB 64, 2MB 8, 4MB 8<br>
Last level dTLB entries: 4KB 64, 2MB 0, 4MB 0, 1GB 4<br>
Speculative Store Bypass: Vulnerable<br>
TAA: Mitigation: TSX disabled<br>
SRBDS: Vulnerable<br>
Freeing SMP alternatives memory: 60K<br>
smpboot: Estimated ratio of average max frequency by base frequency (times =
1024): 1213<br>
smpboot: CPU0: Intel(R) Core(TM) i7-6820HK CPU @ 2.70GHz (family: 0x6, mode=
l: 0x5e, stepping: 0x3)<br>
Performance Events: PEBS fmt3+, Skylake events, 32-deep LBR, full-width cou=
nters, Intel PMU driver.<br>
... version: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;4<br>
... bit width: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;48<br>
... generic registers: &nbsp; &nbsp; &nbsp;4<br>
... value mask: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 0000ffffffffffff<=
br>
... max period: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 00007fffffffffff<=
br>
... fixed-purpose events: &nbsp; 3<br>
... event mask: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 000000070000000f<=
br>
rcu: Hierarchical SRCU implementation.<br>
smp: Bringing up secondary CPUs ...<br>
x86: Booting SMP configuration:<br>
.... node &nbsp;#0, CPUs: &nbsp; &nbsp; &nbsp;#1 #2 #3 #4 #5 #6 #7<br>
smp: Brought up 1 node, 8 CPUs<br>
smpboot: Max logical packages: 1<br>
smpboot: Total of 8 processors activated (43198.54 BogoMIPS)<br>
devtmpfs: initialized<br>
x86/mm: Memory block size: 128MB<br>
ACPI: PM: Registering ACPI NVS region [mem 0x312e6000-0x312e6fff] (4096 byt=
es)<br>
ACPI: PM: Registering ACPI NVS region [mem 0x372fb000-0x3789afff] (5898240 =
bytes)<br>
clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns:=
 1911260446275000 ns<br>
futex hash table entries: 2048 (order: 5, 131072 bytes, linear)<br>
NET: Registered PF_NETLINK/PF_ROUTE protocol family<br>
thermal_sys: Registered thermal governor 'step_wise'<br>
cpuidle: using governor ladder<br>
cpuidle: using governor menu<br>
HugeTLB: can free 4094 vmemmap pages for hugepages-1048576kB<br>
ACPI FADT declares the system doesn't support PCIe ASPM, so disable it<br>
ACPI: bus type PCI registered<br>
acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5<br>
PCI: MMCONFIG for domain 0000 [bus 00-ff] at [mem 0xe0000000-0xefffffff] (b=
ase 0xe0000000)<br>
PCI: MMCONFIG at [mem 0xe0000000-0xefffffff] reserved in E820<br>
PCI: Using configuration type 1 for base access<br>
ENERGY_PERF_BIAS: Set to 'normal', was 'performance'<br>
HugeTLB: can free 6 vmemmap pages for hugepages-2048kB<br>
HugeTLB registered 1.00 GiB page size, pre-allocated 0 pages<br>
HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages<br>
cryptd: max_cpu_qlen set to 1000<br>
fbcon: Taking over console<br>
ACPI: Added _OSI(Module Device)<br>
ACPI: Added _OSI(Processor Device)<br>
ACPI: Added _OSI(3.0 _SCP Extensions)<br>
ACPI: Added _OSI(Processor Aggregator Device)<br>
ACPI: Added _OSI(Linux-Dell-Video)<br>
ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)<br>
ACPI: Added _OSI(Linux-HPI-Hybrid-Graphics)<br>
ACPI: 10 ACPI AML tables successfully acquired and loaded<br>
ACPI: [Firmware Bug]: BIOS _OSI(Linux) query ignored<br>
ACPI: Dynamic OEM Table Load:<br>
ACPI: SSDT 0xFFFF8881010EF800 0005FD (v02 PmRef &nbsp;Cpu0Ist &nbsp;0000300=
0 INTL 20120913)<br>
ACPI: \_PR_.CPU0: _OSC native thermal LVT Acked<br>
ACPI: Dynamic OEM Table Load:<br>
ACPI: SSDT 0xFFFF8881010E4400 00037F (v02 PmRef &nbsp;Cpu0Cst &nbsp;0000300=
1 INTL 20120913)<br>
ACPI: Dynamic OEM Table Load:<br>
ACPI: SSDT 0xFFFF8881010E8000 0005AA (v02 PmRef &nbsp;ApIst &nbsp; &nbsp;00=
003000 INTL 20120913)<br>
ACPI: Dynamic OEM Table Load:<br>
ACPI: SSDT 0xFFFF888101108A00 000119 (v02 PmRef &nbsp;ApCst &nbsp; &nbsp;00=
003000 INTL 20120913)<br>
ACPI: EC: EC started<br>
ACPI: EC: interrupt blocked<br>
ACPI: EC: EC_CMD/EC_SC=3D0x66, EC_DATA=3D0x62<br>
ACPI: \_SB_.PCI0.LPCB.EC0_: Boot DSDT EC used to handle transactions<br>
ACPI: Interpreter enabled<br>
ACPI: PM: (supports S0 S3 S5)<br>
ACPI: Using IOAPIC for interrupt routing<br>
PCI: Using host bridge windows from ACPI; if necessary, use &quot;pci=3Dnoc=
rs&quot; and report a bug<br>
ACPI: Enabled 9 GPEs in block 00 to 7F<br>
ACPI: PM: Power Resource [PG00]<br>
ACPI: PM: Power Resource [PG01]<br>
ACPI: PM: Power Resource [PG02]<br>
ACPI: PM: Power Resource [WRST]<br>
ACPI: PM: Power Resource [WRST]<br>
ACPI: PM: Power Resource [WRST]<br>
ACPI: PM: Power Resource [WRST]<br>
ACPI: PM: Power Resource [WRST]<br>
ACPI: PM: Power Resource [WRST]<br>
ACPI: PM: Power Resource [WRST]<br>
ACPI: PM: Power Resource [WRST]<br>
ACPI: PM: Power Resource [WRST]<br>
ACPI: PM: Power Resource [WRST]<br>
ACPI: PM: Power Resource [WRST]<br>
ACPI: PM: Power Resource [WRST]<br>
ACPI: PM: Power Resource [WRST]<br>
ACPI: PM: Power Resource [WRST]<br>
ACPI: PM: Power Resource [WRST]<br>
ACPI: PM: Power Resource [WRST]<br>
ACPI: PM: Power Resource [WRST]<br>
ACPI: PM: Power Resource [WRST]<br>
ACPI: PM: Power Resource [WRST]<br>
ACPI: PM: Power Resource [WRST]<br>
ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-fe])<br>
acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MS=
I HPX-Type3]<br>
acpi PNP0A08:00: _OSC: platform retains control of PCIe features (AE_ERROR)=
<br>
PCI host bridge to bus 0000:00<br>
pci_bus 0000:00: root bus resource [io &nbsp;0x0000-0x0cf7 window]<br>
pci_bus 0000:00: root bus resource [io &nbsp;0x0d00-0xffff window]<br>
pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bffff window]<br>
pci_bus 0000:00: root bus resource [mem 0x000c0000-0x000c3fff window]<br>
pci_bus 0000:00: root bus resource [mem 0x000c4000-0x000c7fff window]<br>
pci_bus 0000:00: root bus resource [mem 0x000c8000-0x000cbfff window]<br>
pci_bus 0000:00: root bus resource [mem 0x000cc000-0x000cffff window]<br>
pci_bus 0000:00: root bus resource [mem 0x000d0000-0x000d3fff window]<br>
pci_bus 0000:00: root bus resource [mem 0x000d4000-0x000d7fff window]<br>
pci_bus 0000:00: root bus resource [mem 0x000d8000-0x000dbfff window]<br>
pci_bus 0000:00: root bus resource [mem 0x000dc000-0x000dffff window]<br>
pci_bus 0000:00: root bus resource [mem 0x000e0000-0x000e3fff window]<br>
pci_bus 0000:00: root bus resource [mem 0x000e4000-0x000e7fff window]<br>
pci_bus 0000:00: root bus resource [mem 0x000e8000-0x000ebfff window]<br>
pci_bus 0000:00: root bus resource [mem 0x000ec000-0x000effff window]<br>
pci_bus 0000:00: root bus resource [mem 0x3d000000-0xdfffffff window]<br>
pci_bus 0000:00: root bus resource [mem 0xfd000000-0xfe7fffff window]<br>
pci_bus 0000:00: root bus resource [bus 00-fe]<br>
pci 0000:00:00.0: [8086:1910] type 00 class 0x060000<br>
pci 0000:00:01.0: [8086:1901] type 01 class 0x060400<br>
pci 0000:00:01.0: PME# supported from D0 D3hot D3cold<br>
pci 0000:00:02.0: [8086:191b] type 00 class 0x030000<br>
pci 0000:00:02.0: reg 0x10: [mem 0xdb000000-0xdbffffff 64bit]<br>
pci 0000:00:02.0: reg 0x18: [mem 0x70000000-0x7fffffff 64bit pref]<br>
pci 0000:00:02.0: reg 0x20: [io &nbsp;0xf000-0xf03f]<br>
pci 0000:00:02.0: BAR 2: assigned to efifb<br>
pci 0000:00:04.0: [8086:1903] type 00 class 0x118000<br>
pci 0000:00:04.0: reg 0x10: [mem 0xdc620000-0xdc627fff 64bit]<br>
pci 0000:00:14.0: [8086:a12f] type 00 class 0x0c0330<br>
pci 0000:00:14.0: reg 0x10: [mem 0xdc610000-0xdc61ffff 64bit]<br>
pci 0000:00:14.0: PME# supported from D3hot D3cold<br>
pci 0000:00:14.2: [8086:a131] type 00 class 0x118000<br>
pci 0000:00:14.2: reg 0x10: [mem 0xdc636000-0xdc636fff 64bit]<br>
pci 0000:00:16.0: [8086:a13a] type 00 class 0x078000<br>
pci 0000:00:16.0: reg 0x10: [mem 0xdc635000-0xdc635fff 64bit]<br>
pci 0000:00:16.0: PME# supported from D3hot<br>
pci 0000:00:17.0: [8086:a103] type 00 class 0x010601<br>
pci 0000:00:17.0: reg 0x10: [mem 0xdc630000-0xdc631fff]<br>
pci 0000:00:17.0: reg 0x14: [mem 0xdc634000-0xdc6340ff]<br>
pci 0000:00:17.0: reg 0x18: [io &nbsp;0xf090-0xf097]<br>
pci 0000:00:17.0: reg 0x1c: [io &nbsp;0xf080-0xf083]<br>
pci 0000:00:17.0: reg 0x20: [io &nbsp;0xf060-0xf07f]<br>
pci 0000:00:17.0: reg 0x24: [mem 0xdc633000-0xdc6337ff]<br>
pci 0000:00:17.0: PME# supported from D3hot<br>
pci 0000:00:1c.0: [8086:a110] type 01 class 0x060400<br>
pci 0000:00:1c.0: PME# supported from D0 D3hot D3cold<br>
pci 0000:00:1c.0: Intel SPT PCH root port ACS workaround enabled<br>
pci 0000:00:1c.4: [8086:a114] type 01 class 0x060400<br>
pci 0000:00:1c.4: PME# supported from D0 D3hot D3cold<br>
pci 0000:00:1c.4: Intel SPT PCH root port ACS workaround enabled<br>
pci 0000:00:1c.5: [8086:a115] type 01 class 0x060400<br>
pci 0000:00:1c.5: PME# supported from D0 D3hot D3cold<br>
pci 0000:00:1c.5: Intel SPT PCH root port ACS workaround enabled<br>
pci 0000:00:1c.6: [8086:a116] type 01 class 0x060400<br>
pci 0000:00:1c.6: PME# supported from D0 D3hot D3cold<br>
pci 0000:00:1c.6: Intel SPT PCH root port ACS workaround enabled<br>
pci 0000:00:1d.0: [8086:a118] type 01 class 0x060400<br>
pci 0000:00:1d.0: PME# supported from D0 D3hot D3cold<br>
pci 0000:00:1d.0: Intel SPT PCH root port ACS workaround enabled<br>
pci 0000:00:1f.0: [8086:a14e] type 00 class 0x060100<br>
pci 0000:00:1f.2: [8086:a121] type 00 class 0x058000<br>
pci 0000:00:1f.2: reg 0x10: [mem 0xdc62c000-0xdc62ffff]<br>
pci 0000:00:1f.3: [8086:a170] type 00 class 0x040300<br>
pci 0000:00:1f.3: reg 0x10: [mem 0xdc628000-0xdc62bfff 64bit]<br>
pci 0000:00:1f.3: reg 0x20: [mem 0xdc600000-0xdc60ffff 64bit]<br>
pci 0000:00:1f.3: PME# supported from D3hot D3cold<br>
pci 0000:00:1f.4: [8086:a123] type 00 class 0x0c0500<br>
pci 0000:00:1f.4: reg 0x10: [mem 0xdc632000-0xdc6320ff 64bit]<br>
pci 0000:00:1f.4: reg 0x20: [io &nbsp;0xf040-0xf05f]<br>
pci 0000:01:00.0: [1002:6921] type 00 class 0x038000<br>
pci 0000:01:00.0: reg 0x10: [mem 0xb0000000-0xbfffffff 64bit pref]<br>
pci 0000:01:00.0: reg 0x18: [mem 0xc0000000-0xc01fffff 64bit pref]<br>
pci 0000:01:00.0: reg 0x20: [io &nbsp;0xe000-0xe0ff]<br>
pci 0000:01:00.0: reg 0x24: [mem 0xdc500000-0xdc53ffff]<br>
pci 0000:01:00.0: reg 0x30: [mem 0xdc540000-0xdc55ffff pref]<br>
pci 0000:01:00.0: supports D1 D2<br>
pci 0000:01:00.0: PME# supported from D1 D2 D3hot D3cold<br>
pci 0000:01:00.0: 63.008 Gb/s available PCIe bandwidth, limited by 8.0 GT/s=
 PCIe x8 link at 0000:00:01.0 (capable of 126.016 Gb/s with 8.0 GT/s PCIe x=
16 link)<br>
pci 0000:00:01.0: PCI bridge to [bus 01]<br>
pci 0000:00:01.0: &nbsp; bridge window [io &nbsp;0xe000-0xefff]<br>
pci 0000:00:01.0: &nbsp; bridge window [mem 0xdc500000-0xdc5fffff]<br>
pci 0000:00:01.0: &nbsp; bridge window [mem 0xb0000000-0xc01fffff 64bit pre=
f]<br>
acpiphp: Slot [1] registered<br>
pci 0000:00:1c.0: PCI bridge to [bus 02-3a]<br>
pci 0000:00:1c.0: &nbsp; bridge window [mem 0xc4000000-0xda0fffff]<br>
pci 0000:00:1c.0: &nbsp; bridge window [mem 0x80000000-0xa1ffffff 64bit pre=
f]<br>
pci 0000:3b:00.0: [1969:e0a1] type 00 class 0x020000<br>
pci 0000:3b:00.0: reg 0x10: [mem 0xdc400000-0xdc43ffff 64bit]<br>
pci 0000:3b:00.0: reg 0x18: [io &nbsp;0xd000-0xd07f]<br>
pci 0000:3b:00.0: PME# supported from D0 D1 D2 D3hot D3cold<br>
pci 0000:00:1c.4: PCI bridge to [bus 3b]<br>
pci 0000:00:1c.4: &nbsp; bridge window [io &nbsp;0xd000-0xdfff]<br>
pci 0000:00:1c.4: &nbsp; bridge window [mem 0xdc400000-0xdc4fffff]<br>
pci 0000:3c:00.0: [168c:003e] type 00 class 0x028000<br>
pci 0000:3c:00.0: reg 0x10: [mem 0xdc000000-0xdc1fffff 64bit]<br>
pci 0000:3c:00.0: PME# supported from D0 D3hot D3cold<br>
pci 0000:00:1c.5: PCI bridge to [bus 3c]<br>
pci 0000:00:1c.5: &nbsp; bridge window [mem 0xdc000000-0xdc1fffff]<br>
pci 0000:3d:00.0: [10ec:5227] type 00 class 0xff0000<br>
pci 0000:3d:00.0: reg 0x10: [mem 0xdc300000-0xdc300fff]<br>
pci 0000:3d:00.0: supports D1 D2<br>
pci 0000:3d:00.0: PME# supported from D1 D2 D3hot D3cold<br>
pci 0000:00:1c.6: PCI bridge to [bus 3d]<br>
pci 0000:00:1c.6: &nbsp; bridge window [mem 0xdc300000-0xdc3fffff]<br>
pci 0000:3e:00.0: [144d:a802] type 00 class 0x010802<br>
pci 0000:3e:00.0: reg 0x10: [mem 0xdc200000-0xdc203fff 64bit]<br>
pci 0000:3e:00.0: reg 0x18: [io &nbsp;0xc000-0xc0ff]<br>
pci 0000:00:1d.0: PCI bridge to [bus 3e]<br>
pci 0000:00:1d.0: &nbsp; bridge window [io &nbsp;0xc000-0xcfff]<br>
pci 0000:00:1d.0: &nbsp; bridge window [mem 0xdc200000-0xdc2fffff]<br>
pci_bus 0000:00: on NUMA node 0<br>
pci 0000:00:01.0: Max Payload Size set to &nbsp;256/ 256 (was &nbsp;256), M=
ax Read Rq &nbsp;128<br>
pci 0000:01:00.0: Max Payload Size set to &nbsp;256/ 256 (was &nbsp;256), M=
ax Read Rq &nbsp;256<br>
pci 0000:00:1c.0: Max Payload Size set to &nbsp;256/ 256 (was &nbsp;128), M=
ax Read Rq &nbsp;128<br>
pci 0000:00:1c.4: Max Payload Size set to &nbsp;256/ 256 (was &nbsp;256), M=
ax Read Rq &nbsp;128<br>
pci 0000:3b:00.0: Max Payload Size set to &nbsp;256/4096 (was &nbsp;256), M=
ax Read Rq &nbsp;256<br>
pci 0000:00:1c.5: Max Payload Size set to &nbsp;256/ 256 (was &nbsp;256), M=
ax Read Rq &nbsp;128<br>
pci 0000:3c:00.0: Max Payload Size set to &nbsp;256/ 256 (was &nbsp;256), M=
ax Read Rq &nbsp;256<br>
pci 0000:00:1c.6: Max Payload Size set to &nbsp;256/ 256 (was &nbsp;128), M=
ax Read Rq &nbsp;128<br>
pci 0000:3d:00.0: Max Payload Size set to &nbsp;128/ 128 (was &nbsp;128), M=
ax Read Rq &nbsp;128<br>
pci 0000:00:1d.0: Max Payload Size set to &nbsp;256/ 256 (was &nbsp;128), M=
ax Read Rq &nbsp;128<br>
pci 0000:3e:00.0: Max Payload Size set to &nbsp;128/ 128 (was &nbsp;128), M=
ax Read Rq &nbsp;128<br>
ACPI: PCI: Interrupt link LNKA configured for IRQ 11<br>
ACPI: PCI: Interrupt link LNKB configured for IRQ 10<br>
ACPI: PCI: Interrupt link LNKC configured for IRQ 11<br>
ACPI: PCI: Interrupt link LNKD configured for IRQ 11<br>
ACPI: PCI: Interrupt link LNKE configured for IRQ 11<br>
ACPI: PCI: Interrupt link LNKF configured for IRQ 11<br>
ACPI: PCI: Interrupt link LNKG configured for IRQ 11<br>
ACPI: PCI: Interrupt link LNKH configured for IRQ 11<br>
ACPI: EC: interrupt unblocked<br>
ACPI: EC: event unblocked<br>
ACPI: EC: EC_CMD/EC_SC=3D0x66, EC_DATA=3D0x62<br>
ACPI: EC: GPE=3D0x14<br>
ACPI: \_SB_.PCI0.LPCB.EC0_: Boot DSDT EC initialization complete<br>
ACPI: \_SB_.PCI0.LPCB.EC0_: EC: Used to handle transactions and events<br>
iommu: Default domain type: Passthrough <br>
pci 0000:00:02.0: vgaarb: setting as boot VGA device<br>
pci 0000:00:02.0: vgaarb: VGA device added: decodes=3Dio+mem,owns=3Dio+mem,=
locks=3Dnone<br>
pci 0000:00:02.0: vgaarb: bridge control possible<br>
vgaarb: loaded<br>
SCSI subsystem initialized<br>
libata version 3.00 loaded.<br>
ACPI: bus type USB registered<br>
usbcore: registered new interface driver usbfs<br>
usbcore: registered new interface driver hub<br>
usbcore: registered new device driver usb<br>
videodev: Linux video capture interface: v2.00<br>
Registered efivars operations<br>
Advanced Linux Sound Architecture Driver Initialized.<br>
Bluetooth: Core ver 2.22<br>
NET: Registered PF_BLUETOOTH protocol family<br>
Bluetooth: HCI device and connection manager initialized<br>
Bluetooth: HCI socket layer initialized<br>
Bluetooth: L2CAP socket layer initialized<br>
Bluetooth: SCO socket layer initialized<br>
PCI: Using ACPI for IRQ routing<br>
PCI: pci_cache_line_size set to 64 bytes<br>
e820: reserve RAM buffer [mem 0x00058000-0x0005ffff]<br>
e820: reserve RAM buffer [mem 0x0009e000-0x0009ffff]<br>
e820: reserve RAM buffer [mem 0x3109c018-0x33ffffff]<br>
e820: reserve RAM buffer [mem 0x310ad018-0x33ffffff]<br>
e820: reserve RAM buffer [mem 0x312bb000-0x33ffffff]<br>
e820: reserve RAM buffer [mem 0x312e6000-0x33ffffff]<br>
e820: reserve RAM buffer [mem 0x3138c000-0x33ffffff]<br>
e820: reserve RAM buffer [mem 0x345ec000-0x37ffffff]<br>
e820: reserve RAM buffer [mem 0x362a1000-0x37ffffff]<br>
e820: reserve RAM buffer [mem 0x8c2000000-0x8c3ffffff]<br>
wmi_bus wmi_bus-PNP0C14:01: WQBC data block query control method not found<=
br>
dcdbas dcdbas: Dell Systems Management Base Driver (version 5.6.0-3.4)<br>
hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0, 0, 0, 0, 0, 0<br>
hpet0: 8 comparators, 64-bit 24.000000 MHz counter<br>
clocksource: Switched to clocksource tsc-early<br>
FS-Cache: Loaded<br>
CacheFiles: Loaded<br>
pnp: PnP ACPI init<br>
system 00:02: [io &nbsp;0x0680-0x069f] has been reserved<br>
system 00:02: [io &nbsp;0xffff] has been reserved<br>
system 00:02: [io &nbsp;0xffff] has been reserved<br>
system 00:02: [io &nbsp;0xffff] has been reserved<br>
system 00:02: [io &nbsp;0x1800-0x18fe] has been reserved<br>
system 00:02: [io &nbsp;0x164e-0x164f] has been reserved<br>
system 00:03: [io &nbsp;0x0800-0x087f] has been reserved<br>
system 00:05: [io &nbsp;0x1854-0x1857] has been reserved<br>
system 00:06: [mem 0xfed10000-0xfed17fff] has been reserved<br>
system 00:06: [mem 0xfed18000-0xfed18fff] has been reserved<br>
system 00:06: [mem 0xfed19000-0xfed19fff] has been reserved<br>
system 00:06: [mem 0xe0000000-0xefffffff] has been reserved<br>
system 00:06: [mem 0xfed20000-0xfed3ffff] has been reserved<br>
system 00:06: [mem 0xfed90000-0xfed93fff] could not be reserved<br>
system 00:06: [mem 0xfed45000-0xfed8ffff] has been reserved<br>
system 00:06: [mem 0xff000000-0xffffffff] has been reserved<br>
system 00:06: [mem 0xfee00000-0xfeefffff] could not be reserved<br>
system 00:06: [mem 0xdffe0000-0xdfffffff] has been reserved<br>
system 00:07: [mem 0xfd000000-0xfdabffff] has been reserved<br>
system 00:07: [mem 0xfdad0000-0xfdadffff] has been reserved<br>
system 00:07: [mem 0xfdb00000-0xfdffffff] has been reserved<br>
system 00:07: [mem 0xfe000000-0xfe01ffff] could not be reserved<br>
system 00:07: [mem 0xfe036000-0xfe03bfff] has been reserved<br>
system 00:07: [mem 0xfe03d000-0xfe3fffff] has been reserved<br>
system 00:07: [mem 0xfe410000-0xfe7fffff] has been reserved<br>
system 00:08: [mem 0xfdaf0000-0xfdafffff] has been reserved<br>
system 00:08: [mem 0xfdae0000-0xfdaeffff] has been reserved<br>
system 00:08: [mem 0xfdac0000-0xfdacffff] has been reserved<br>
pnp: PnP ACPI: found 9 devices<br>
clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, max_idle_ns: 208=
5701024 ns<br>
NET: Registered PF_INET protocol family<br>
IP idents hash table entries: 262144 (order: 9, 2097152 bytes, linear)<br>
tcp_listen_portaddr_hash hash table entries: 16384 (order: 6, 262144 bytes,=
 linear)<br>
TCP established hash table entries: 262144 (order: 9, 2097152 bytes, linear=
)<br>
TCP bind hash table entries: 65536 (order: 8, 1048576 bytes, linear)<br>
TCP: Hash tables configured (established 262144 bind 65536)<br>
UDP hash table entries: 16384 (order: 7, 524288 bytes, linear)<br>
UDP-Lite hash table entries: 16384 (order: 7, 524288 bytes, linear)<br>
NET: Registered PF_UNIX/PF_LOCAL protocol family<br>
pci 0000:00:1c.0: bridge window [io &nbsp;0x1000-0x0fff] to [bus 02-3a] add=
_size 1000<br>
pci 0000:00:1c.0: BAR 13: assigned [io &nbsp;0x2000-0x2fff]<br>
pci 0000:00:01.0: PCI bridge to [bus 01]<br>
pci 0000:00:01.0: &nbsp; bridge window [io &nbsp;0xe000-0xefff]<br>
pci 0000:00:01.0: &nbsp; bridge window [mem 0xdc500000-0xdc5fffff]<br>
pci 0000:00:01.0: &nbsp; bridge window [mem 0xb0000000-0xc01fffff 64bit pre=
f]<br>
pci 0000:00:1c.0: PCI bridge to [bus 02-3a]<br>
pci 0000:00:1c.0: &nbsp; bridge window [io &nbsp;0x2000-0x2fff]<br>
pci 0000:00:1c.0: &nbsp; bridge window [mem 0xc4000000-0xda0fffff]<br>
pci 0000:00:1c.0: &nbsp; bridge window [mem 0x80000000-0xa1ffffff 64bit pre=
f]<br>
pci 0000:00:1c.4: PCI bridge to [bus 3b]<br>
pci 0000:00:1c.4: &nbsp; bridge window [io &nbsp;0xd000-0xdfff]<br>
pci 0000:00:1c.4: &nbsp; bridge window [mem 0xdc400000-0xdc4fffff]<br>
pci 0000:00:1c.5: PCI bridge to [bus 3c]<br>
pci 0000:00:1c.5: &nbsp; bridge window [mem 0xdc000000-0xdc1fffff]<br>
pci 0000:00:1c.6: PCI bridge to [bus 3d]<br>
pci 0000:00:1c.6: &nbsp; bridge window [mem 0xdc300000-0xdc3fffff]<br>
pci 0000:00:1d.0: PCI bridge to [bus 3e]<br>
pci 0000:00:1d.0: &nbsp; bridge window [io &nbsp;0xc000-0xcfff]<br>
pci 0000:00:1d.0: &nbsp; bridge window [mem 0xdc200000-0xdc2fffff]<br>
pci_bus 0000:00: resource 4 [io &nbsp;0x0000-0x0cf7 window]<br>
pci_bus 0000:00: resource 5 [io &nbsp;0x0d00-0xffff window]<br>
pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff window]<br>
pci_bus 0000:00: resource 7 [mem 0x000c0000-0x000c3fff window]<br>
pci_bus 0000:00: resource 8 [mem 0x000c4000-0x000c7fff window]<br>
pci_bus 0000:00: resource 9 [mem 0x000c8000-0x000cbfff window]<br>
pci_bus 0000:00: resource 10 [mem 0x000cc000-0x000cffff window]<br>
pci_bus 0000:00: resource 11 [mem 0x000d0000-0x000d3fff window]<br>
pci_bus 0000:00: resource 12 [mem 0x000d4000-0x000d7fff window]<br>
pci_bus 0000:00: resource 13 [mem 0x000d8000-0x000dbfff window]<br>
pci_bus 0000:00: resource 14 [mem 0x000dc000-0x000dffff window]<br>
pci_bus 0000:00: resource 15 [mem 0x000e0000-0x000e3fff window]<br>
pci_bus 0000:00: resource 16 [mem 0x000e4000-0x000e7fff window]<br>
pci_bus 0000:00: resource 17 [mem 0x000e8000-0x000ebfff window]<br>
pci_bus 0000:00: resource 18 [mem 0x000ec000-0x000effff window]<br>
pci_bus 0000:00: resource 19 [mem 0x3d000000-0xdfffffff window]<br>
pci_bus 0000:00: resource 20 [mem 0xfd000000-0xfe7fffff window]<br>
pci_bus 0000:01: resource 0 [io &nbsp;0xe000-0xefff]<br>
pci_bus 0000:01: resource 1 [mem 0xdc500000-0xdc5fffff]<br>
pci_bus 0000:01: resource 2 [mem 0xb0000000-0xc01fffff 64bit pref]<br>
pci_bus 0000:02: resource 0 [io &nbsp;0x2000-0x2fff]<br>
pci_bus 0000:02: resource 1 [mem 0xc4000000-0xda0fffff]<br>
pci_bus 0000:02: resource 2 [mem 0x80000000-0xa1ffffff 64bit pref]<br>
pci_bus 0000:3b: resource 0 [io &nbsp;0xd000-0xdfff]<br>
pci_bus 0000:3b: resource 1 [mem 0xdc400000-0xdc4fffff]<br>
pci_bus 0000:3c: resource 1 [mem 0xdc000000-0xdc1fffff]<br>
pci_bus 0000:3d: resource 1 [mem 0xdc300000-0xdc3fffff]<br>
pci_bus 0000:3e: resource 0 [io &nbsp;0xc000-0xcfff]<br>
pci_bus 0000:3e: resource 1 [mem 0xdc200000-0xdc2fffff]<br>
pci 0000:00:02.0: Video device with shadowed ROM at [mem 0x000c0000-0x000df=
fff]<br>
PCI: CLS 0 bytes, default 64<br>
DMAR: No ATSR found<br>
DMAR: No SATC found<br>
DMAR: IOMMU feature fl1gp_support inconsistent<br>
DMAR: IOMMU feature pgsel_inv inconsistent<br>
DMAR: IOMMU feature nwfs inconsistent<br>
DMAR: IOMMU feature eafs inconsistent<br>
DMAR: IOMMU feature prs inconsistent<br>
DMAR: IOMMU feature nest inconsistent<br>
DMAR: IOMMU feature mts inconsistent<br>
DMAR: IOMMU feature sc_support inconsistent<br>
DMAR: IOMMU feature pass_through inconsistent<br>
DMAR: IOMMU feature dev_iotlb_support inconsistent<br>
DMAR: dmar0: Using Queued invalidation<br>
DMAR: dmar1: Using Queued invalidation<br>
pci 0000:00:00.0: Adding to iommu group 0<br>
pci 0000:00:01.0: Adding to iommu group 1<br>
pci 0000:00:02.0: Adding to iommu group 2<br>
pci 0000:00:04.0: Adding to iommu group 3<br>
pci 0000:00:14.0: Adding to iommu group 4<br>
pci 0000:00:14.2: Adding to iommu group 4<br>
pci 0000:00:16.0: Adding to iommu group 5<br>
pci 0000:00:17.0: Adding to iommu group 6<br>
pci 0000:00:1c.0: Adding to iommu group 7<br>
pci 0000:00:1c.4: Adding to iommu group 8<br>
pci 0000:00:1c.5: Adding to iommu group 9<br>
pci 0000:00:1c.6: Adding to iommu group 10<br>
pci 0000:00:1d.0: Adding to iommu group 11<br>
pci 0000:00:1f.0: Adding to iommu group 12<br>
pci 0000:00:1f.2: Adding to iommu group 12<br>
pci 0000:00:1f.3: Adding to iommu group 12<br>
pci 0000:00:1f.4: Adding to iommu group 12<br>
pci 0000:01:00.0: Adding to iommu group 1<br>
pci 0000:3b:00.0: Adding to iommu group 13<br>
pci 0000:3c:00.0: Adding to iommu group 14<br>
pci 0000:3d:00.0: Adding to iommu group 15<br>
pci 0000:3e:00.0: Adding to iommu group 16<br>
DMAR: Intel(R) Virtualization Technology for Directed I/O<br>
PCI-DMA: Using software bounce buffering for IO (SWIOTLB)<br>
software IO TLB: mapped [mem 0x000000002d09c000-0x000000003109c000] (64MB)<=
br>
RAPL PMU: API unit is 2^-32 Joules, 5 fixed counters, 655360 ms ovfl timer<=
br>
RAPL PMU: hw unit of domain pp0-core 2^-14 Joules<br>
RAPL PMU: hw unit of domain package 2^-14 Joules<br>
RAPL PMU: hw unit of domain dram 2^-14 Joules<br>
RAPL PMU: hw unit of domain pp1-gpu 2^-14 Joules<br>
RAPL PMU: hw unit of domain psys 2^-14 Joules<br>
DMAR: DRHD: handling fault status reg 3<br>
DMAR: [DMA Read NO_PASID] Request device [0x00:0x02.0] fault addr 0x3a80000=
0 [fault reason 0x06] PTE Read access is not set<br>
DMAR: DRHD: handling fault status reg 3<br>
DMAR: [DMA Read NO_PASID] Request device [0x00:0x02.0] fault addr 0x3a81800=
0 [fault reason 0x06] PTE Read access is not set<br>
DMAR: DRHD: handling fault status reg 3<br>
DMAR: [DMA Read NO_PASID] Request device [0x00:0x02.0] fault addr 0x3a85200=
0 [fault reason 0x06] PTE Read access is not set<br>
DMAR: DRHD: handling fault status reg 3<br>
Initialise system trusted keyrings<br>
workingset: timestamp_bits=3D46 max_order=3D23 bucket_order=3D0<br>
zbud: loaded<br>
FS-Cache: Netfs 'cifs' registered for caching<br>
Key type cifs.idmap registered<br>
fuse: init (API version 7.34)<br>
NET: Registered PF_ALG protocol family<br>
Key type asymmetric registered<br>
Asymmetric key parser 'x509' registered<br>
Block layer SCSI generic (bsg) driver version 0.4 loaded (major 252)<br>
ACPI: AC: AC Adapter [ACAD] (on-line)<br>
input: Lid Switch as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:40/=
PNP0C0D:00/input/input0<br>
ACPI: button: Lid Switch [LID0]<br>
input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/in=
put1<br>
ACPI: button: Power Button [PWRB]<br>
input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input2<br>
ACPI: button: Power Button [PWRF]<br>
Non-volatile memory driver v1.3<br>
Linux agpgart interface v0.103<br>
[drm] amdgpu kernel modesetting enabled.<br>
vga_switcheroo: detected switching method \_SB_.PCI0.GFX0.ATPX handle<br>
ATPX version 1, functions 0x00000033<br>
ATPX Hybrid Graphics<br>
amdgpu: CRAT table disabled by module option<br>
amdgpu: Virtual CRAT table created for CPU<br>
amdgpu: Topology: Add CPU node<br>
amdgpu 0000:01:00.0: enabling device (0000 -&gt; 0003)<br>
[drm] initializing kernel modesetting (TONGA 0x1002:0x6921 0x1028:0x0708 0x=
00).<br>
amdgpu 0000:01:00.0: amdgpu: Trusted Memory Zone (TMZ) feature not supporte=
d<br>
[drm] register mmio base: 0xDC500000<br>
[drm] register mmio size: 262144<br>
[drm] add ip block number 0 &lt;vi_common&gt;<br>
[drm] add ip block number 1 &lt;gmc_v8_0&gt;<br>
[drm] add ip block number 2 &lt;tonga_ih&gt;<br>
[drm] add ip block number 3 &lt;gfx_v8_0&gt;<br>
[drm] add ip block number 4 &lt;sdma_v3_0&gt;<br>
[drm] add ip block number 5 &lt;powerplay&gt;<br>
[drm] add ip block number 6 &lt;dm&gt;<br>
[drm] add ip block number 7 &lt;uvd_v5_0&gt;<br>
[drm] add ip block number 8 &lt;vce_v3_0&gt;<br>
ACPI: battery: Slot [BAT1] (battery present)<br>
amdgpu 0000:01:00.0: amdgpu: Fetched VBIOS from ATRM<br>
amdgpu: ATOM BIOS: BR46576.001<br>
[drm] VCE enabled in physical mode<br>
[drm] GPU posting now...<br>
[drm] vm size is 128 GB, 2 levels, block size is 10-bit, fragment size is 9=
-bit<br>
amdgpu 0000:01:00.0: amdgpu: VRAM: 4096M 0x000000F400000000 - 0x000000F4FFF=
FFFFF (4096M used)<br>
amdgpu 0000:01:00.0: amdgpu: GART: 1024M 0x000000FF00000000 - 0x000000FF3FF=
FFFFF<br>
[drm] Detected VRAM RAM=3D4096M, BAR=3D256M<br>
[drm] RAM width 256bits GDDR5<br>
[drm] amdgpu: 4096M of VRAM memory ready<br>
[drm] amdgpu: 4096M of GTT memory ready.<br>
[drm] GART: num cpu pages 262144, num gpu pages 262144<br>
[drm] PCIE GART of 1024M enabled (table at 0x000000F400000000).<br>
[drm] Chained IB support enabled!<br>
amdgpu: hwmgr_sw_init smu backed is tonga_smu<br>
[drm] Found UVD firmware Version: 1.68 Family ID: 10<br>
[drm] Found VCE firmware Version: 52.8 Binary ID: 3<br>
[drm] Display Core initialized with v3.2.149!<br>
[drm] UVD initialized successfully.<br>
[drm] VCE initialized successfully.<br>
kfd kfd: amdgpu: Allocated 3969056 bytes on gart<br>
amdgpu: SW scheduler is used<br>
amdgpu: Virtual CRAT table created for GPU<br>
amdgpu: Topology: Add dGPU node [0x6921:0x1002]<br>
kfd kfd: amdgpu: added device 1002:6921<br>
amdgpu 0000:01:00.0: amdgpu: SE 4, SH per SE 1, CU per SH 8, active_cu_numb=
er 32<br>
amdgpu 0000:01:00.0: amdgpu: Using BOCO for runtime pm<br>
[drm] Initialized amdgpu 3.42.0 20150101 for 0000:01:00.0 on minor 0<br>
i915 0000:00:02.0: [drm] Incompatible option enable_guc=3D3 - GuC submissio=
n is N/A<br>
i915 0000:00:02.0: [drm] VT-d active for gfx access<br>
i915 0000:00:02.0: vgaarb: deactivate vga console<br>
i915 0000:00:02.0: vgaarb: changed VGA decodes: olddecodes=3Dio+mem,decodes=
=3Dio+mem:owns=3Dio+mem<br>
i915 0000:00:02.0: [drm] Finished loading DMC firmware i915/skl_dmc_ver1_27=
.bin (v1.27)<br>
i915 0000:00:02.0: [drm] Disabling framebuffer compression (FBC) to prevent=
 screen flicker with VT-d enabled<br>
i915 0000:00:02.0: [drm] [ENCODER:102:DDI B/PHY B] is disabled/in DSI mode =
with an ungated DDI clock, gate it<br>
i915 0000:00:02.0: [drm] [ENCODER:117:DDI C/PHY C] is disabled/in DSI mode =
with an ungated DDI clock, gate it<br>
i915 0000:00:02.0: [drm] [ENCODER:127:DDI D/PHY D] is disabled/in DSI mode =
with an ungated DDI clock, gate it<br>
i915 0000:00:02.0: Direct firmware load for i915/skl_guc_49.0.1.bin failed =
with error -2<br>
i915 0000:00:02.0: [drm] GuC firmware i915/skl_guc_49.0.1.bin: fetch failed=
 with error -2<br>
i915 0000:00:02.0: [drm] GuC firmware(s) can be downloaded from <a href=3D"=
https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit.ker=
nel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ffirmware%2Flinux-firmware.git%=
2Ftree%2Fi915&amp;data=3D04%7C01%7CGuchun.Chen%40amd.com%7C82f9e022b7d54387=
f0dd08d961eda83b%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C6376484956569=
63126%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6I=
k1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DKzZr5%2FwcJPXYIhIvzkTapqIlLcTZklsE=
Q6odo%2Bnu8fc%3D&amp;reserved=3D0">
https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git=
/tree/i915</a><br>
i915 0000:00:02.0: [drm] GuC is uninitialized<br>
[drm] Initialized i915 1.6.0 20201103 for 0000:00:02.0 on minor 1<br>
ACPI: video: Video Device [GFX0] (multi-head: yes &nbsp;rom: no &nbsp;post:=
 no)<br>
input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/LNXVIDEO:00=
/input/input3<br>
loop: module loaded<br>
mei_me 0000:00:16.0: enabling device (0000 -&gt; 0002)<br>
rtsx_pci 0000:3d:00.0: enabling device (0000 -&gt; 0002)<br>
nvme nvme0: pci function 0000:3e:00.0<br>
ahci 0000:00:17.0: version 3.0<br>
ahci 0000:00:17.0: AHCI 0001.0301 32 slots 1 ports 6 Gbps 0x2 impl SATA mod=
e<br>
ahci 0000:00:17.0: flags: 64bit ncq sntf pm led clo only pio slum part ems =
deso sadm sds apst
<br>
scsi host0: ahci<br>
scsi host1: ahci<br>
ata1: DUMMY<br>
ata2: SATA max UDMA/133 abar m2048@0xdc633000 port 0xdc633180 irq 133<br>
alx 0000:3b:00.0 eth0: Qualcomm Atheros AR816x/AR817x Ethernet [f8:ca:b8:03=
:29:43]<br>
ath10k_pci 0000:3c:00.0: enabling device (0000 -&gt; 0002)<br>
ath10k_pci 0000:3c:00.0: pci irq msi oper_irq_mode 2 irq_mode 0 reset_mode =
0<br>
fbcon: i915 (fb0) is primary device<br>
Console: switching to colour frame buffer device 240x67<br>
nvme nvme0: 8/0/0 default/read/poll queues<br>
&nbsp;nvme0n1: p1 p2 p3<br>
i915 0000:00:02.0: [drm] fb0: i915 frame buffer device<br>
xhci_hcd 0000:00:14.0: xHCI Host Controller<br>
xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 1<br>
xhci_hcd 0000:00:14.0: hcc params 0x200077c1 hci version 0x100 quirks 0x000=
0000001109810<br>
usb usb1: New USB device found, idVendor=3D1d6b, idProduct=3D0002, bcdDevic=
e=3D 5.14<br>
usb usb1: New USB device strings: Mfr=3D3, Product=3D2, SerialNumber=3D1<br=
>
usb usb1: Product: xHCI Host Controller<br>
usb usb1: Manufacturer: Linux 5.14.0-rc3-agd5f+ xhci-hcd<br>
usb usb1: SerialNumber: 0000:00:14.0<br>
hub 1-0:1.0: USB hub found<br>
hub 1-0:1.0: 16 ports detected<br>
xhci_hcd 0000:00:14.0: xHCI Host Controller<br>
xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 2<br>
xhci_hcd 0000:00:14.0: Host supports USB 3.0 SuperSpeed<br>
usb usb2: New USB device found, idVendor=3D1d6b, idProduct=3D0003, bcdDevic=
e=3D 5.14<br>
usb usb2: New USB device strings: Mfr=3D3, Product=3D2, SerialNumber=3D1<br=
>
usb usb2: Product: xHCI Host Controller<br>
usb usb2: Manufacturer: Linux 5.14.0-rc3-agd5f+ xhci-hcd<br>
usb usb2: SerialNumber: 0000:00:14.0<br>
hub 2-0:1.0: USB hub found<br>
hub 2-0:1.0: 8 ports detected<br>
usb: port power management may be unreliable<br>
usbcore: registered new interface driver cdc_acm<br>
cdc_acm: USB Abstract Control Model driver for USB modems and ISDN adapters=
<br>
usbcore: registered new interface driver uas<br>
usbcore: registered new interface driver usb-storage<br>
i8042: PNP: PS/2 Controller [PNP0303:PS2K,PNP0f13:PS2M] at 0x60,0x64 irq 1,=
12<br>
serio: i8042 KBD port at 0x60,0x64 irq 1<br>
serio: i8042 AUX port at 0x60,0x64 irq 12<br>
mousedev: PS/2 mouse device common for all mice<br>
rtc_cmos 00:04: RTC can wake from S4<br>
rtc_cmos 00:04: registered as rtc0<br>
rtc_cmos 00:04: setting system clock to 2021-08-18T01:47:48 UTC (1629251268=
)<br>
rtc_cmos 00:04: alarms up to one month, y3k, 242 bytes nvram, hpet irqs<br>
i2c /dev entries driver<br>
i801_smbus 0000:00:1f.4: SPD Write Disable is set<br>
i801_smbus 0000:00:1f.4: SMBus using PCI interrupt<br>
i2c i2c-6: 2/2 memory slots populated (from DMI)<br>
ee1004 6-0050: 512 byte EE1004-compliant SPD EEPROM, read-only<br>
i2c i2c-6: Successfully instantiated SPD at 0x50<br>
usbcore: registered new interface driver uvcvideo<br>
dell_smm_hwmon: not running on a supported Dell system.<br>
input: AT Translated Set 2 keyboard as /devices/platform/i8042/serio0/input=
/input4<br>
dell_smm_hwmon: vendor=3DAlienware, model=3DAlienware 15 R2, version=3D1.13=
.1<br>
usbcore: registered new interface driver btusb<br>
intel_pstate: Intel P-state driver initializing<br>
intel_pstate: HWP enabled<br>
[drm] Initialized simpledrm 1.0.0 20200625 for simple-framebuffer.0 on mino=
r 2<br>
simple-framebuffer simple-framebuffer.0: [drm] fb1: simpledrm frame buffer =
device<br>
EFI Variables Facility v0.08 2004-May-17<br>
pstore: Registered efi as persistent store backend<br>
usbcore: registered new interface driver usbhid<br>
usbhid: USB HID core driver<br>
ath10k_pci 0000:3c:00.0: qca6174 hw3.2 target 0x05030000 chip_id 0x00340aff=
 sub 1a56:1535<br>
alienware_wmi: alienware-wmi: No known WMI GUID found<br>
ath10k_pci 0000:3c:00.0: kconfig debug 0 debugfs 0 tracing 0 dfs 0 testmode=
 0<br>
dell_wmi_aio: No known WMI GUID found<br>
ath10k_pci 0000:3c:00.0: firmware ver WLAN.RM.4.4.1-00157-QCARMSWPZ-1 api 6=
 features wowlan,ignore-otp,mfp crc32 90eebefb<br>
snd_hda_intel 0000:00:1f.3: enabling device (0000 -&gt; 0002)<br>
snd_hda_intel 0000:00:1f.3: bound 0000:00:02.0 (ops i915_audio_component_bi=
nd_ops)<br>
xt_time: kernel timezone is -0000<br>
ipt_CLUSTERIP: ClusterIP Version 0.8 loaded successfully<br>
Initializing XFRM netlink socket<br>
NET: Registered PF_INET6 protocol family<br>
Segment Routing with IPv6<br>
sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver<br>
NET: Registered PF_PACKET protocol family<br>
snd_hda_codec_ca0132 hdaudioC0D0: autoconfig for CA0132: line_outs=3D1 (0xb=
/0x0/0x0/0x0/0x0) type:speaker<br>
NET: Registered PF_KEY protocol family<br>
snd_hda_codec_ca0132 hdaudioC0D0: &nbsp; &nbsp;speaker_outs=3D0 (0x0/0x0/0x=
0/0x0/0x0)<br>
snd_hda_codec_ca0132 hdaudioC0D0: &nbsp; &nbsp;hp_outs=3D1 (0xf/0x0/0x0/0x0=
/0x0)<br>
snd_hda_codec_ca0132 hdaudioC0D0: &nbsp; &nbsp;mono: mono_out=3D0x0<br>
snd_hda_codec_ca0132 hdaudioC0D0: &nbsp; &nbsp;inputs:<br>
snd_hda_codec_ca0132 hdaudioC0D0: &nbsp; &nbsp; &nbsp;Mic=3D0x11<br>
snd_hda_codec_ca0132 hdaudioC0D0: &nbsp; &nbsp; &nbsp;Internal Mic=3D0x12<b=
r>
ath10k_pci 0000:3c:00.0: board_file api 2 bmi_id N/A crc32 318825bf<br>
Bluetooth: RFCOMM TTY layer initialized<br>
ata2: SATA link up 6.0 Gbps (SStatus 133 SControl 300)<br>
Bluetooth: RFCOMM socket layer initialized<br>
ata2.00: ATA-9: M4-CT512M4SSD2, 070H, max UDMA/100<br>
Bluetooth: RFCOMM ver 1.11<br>
ata2.00: 1000215216 sectors, multi 16: LBA48 NCQ (depth 32), AA<br>
ata2.00: configured for UDMA/100<br>
Bluetooth: BNEP (Ethernet Emulation) ver 1.3<br>
Bluetooth: BNEP filters: protocol multicast<br>
scsi 1:0:0:0: Direct-Access &nbsp; &nbsp; ATA &nbsp; &nbsp; &nbsp;M4-CT512M=
4SSD2 &nbsp; 070H PQ: 0 ANSI: 5<br>
Bluetooth: BNEP socket layer initialized<br>
sd 1:0:0:0: [sda] 1000215216 512-byte logical blocks: (512 GB/477 GiB)<br>
Bluetooth: HIDP (Human Interface Emulation) ver 1.2<br>
Bluetooth: HIDP socket layer initialized<br>
sd 1:0:0:0: [sda] Write Protect is off<br>
usb 1-4: new full-speed USB device number 2 using xhci_hcd<br>
Key type dns_resolver registered<br>
sd 1:0:0:0: [sda] Mode Sense: 00 3a 00 00<br>
microcode: sig=3D0x506e3, pf=3D0x20, revision=3D0xea<br>
sd 1:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't suppor=
t DPO or FUA<br>
microcode: Microcode Update Driver: v2.2.<br>
IPI shorthand broadcast: enabled<br>
&nbsp;sda: sda1 sda2 sda3 sda4 sda5<br>
AVX2 version of gcm_enc/dec engaged.<br>
ath10k_pci 0000:3c:00.0: htt-ver 3.60 wmi-op 4 htt-op 3 cal otp max-sta 32 =
raw 0 hwcrypto 1<br>
sd 1:0:0:0: [sda] Attached SCSI disk<br>
AES CTR mode by8 optimization enabled<br>
sched_clock: Marking stable (1160678423, 3697821)-&gt;(1168177289, -3801045=
)<br>
registered taskstats version 1<br>
Loading compiled-in X.509 certificates<br>
Key type ._fscrypt registered<br>
Key type .fscrypt registered<br>
Key type fscrypt-provisioning registered<br>
dell-smbios A80593CE-A997-11DA-B012-B622A1EF5492: WMI SMBIOS userspace inte=
rface not supported(0), try upgrading to a newer BIOS<br>
input: Dell WMI hotkeys as /devices/platform/PNP0C14:01/wmi_bus/wmi_bus-PNP=
0C14:01/9DBB5994-A997-11DA-B012-B622A1EF5492/input/input7<br>
cfg80211: Loading compiled-in X.509 certificates for regulatory database<br=
>
cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'<br>
ALSA device list:<br>
&nbsp; No soundcards found.<br>
ath: EEPROM regdomain: 0x6c<br>
ath: EEPROM indicates we should expect a direct regpair map<br>
ath: Country alpha2 being used: 00<br>
ath: Regpair used: 0x6c<br>
usb 1-4: config 1 interface 0 altsetting 0 has 2 endpoint descriptors, diff=
erent from the interface descriptor's value: 1<br>
usb 1-4: New USB device found, idVendor=3D187c, idProduct=3D0528, bcdDevice=
=3D 0.00<br>
usb 1-4: New USB device strings: Mfr=3D1, Product=3D2, SerialNumber=3D3<br>
usb 1-4: Product: AW1517<br>
usb 1-4: Manufacturer: Alienware<br>
usb 1-4: SerialNumber: 16.0<br>
hid-generic 0003:187C:0528.0001: device has no listeners, quitting<br>
psmouse serio1: synaptics: queried max coordinates: x [..5668], y [..4756]<=
br>
tsc: Refined TSC clocksource calibration: 2711.973 MHz<br>
clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x27176cd0728, max_i=
dle_ns: 440795290119 ns<br>
clocksource: Switched to clocksource tsc<br>
usb 1-5: new full-speed USB device number 3 using xhci_hcd<br>
psmouse serio1: synaptics: queried min coordinates: x [1274..], y [1098..]<=
br>
psmouse serio1: synaptics: Trying to set up SMBus access<br>
rmi4_smbus 6-002c: registering SMbus-connected sensor<br>
rmi4_f01 rmi4-00.fn01: found RMI device, manufacturer: Synaptics, product: =
TM2417-001, fw id: 0<br>
input: Synaptics TM2417-001 as /devices/rmi4-00/input/input8<br>
usb 1-5: New USB device found, idVendor=3D0cf3, idProduct=3De300, bcdDevice=
=3D 0.01<br>
usb 1-5: New USB device strings: Mfr=3D0, Product=3D0, SerialNumber=3D0<br>
Bluetooth: hci0: using rampatch file: qca/rampatch_usb_00000302.bin<br>
Bluetooth: hci0: QCA: patch rome 0x302 build 0x3e8, firmware rome 0x302 bui=
ld 0x111<br>
snd_hda_codec_ca0132 hdaudioC0D0: ca0132 DSP downloaded and running<br>
EXT4-fs (nvme0n1p2): INFO: recovery required on readonly filesystem<br>
input: HDA Intel PCH Mic as /devices/pci0000:00/0000:00:1f.3/sound/card0/in=
put9<br>
EXT4-fs (nvme0n1p2): write access will be enabled during recovery<br>
input: HDA Intel PCH Headphone as /devices/pci0000:00/0000:00:1f.3/sound/ca=
rd0/input10<br>
input: HDA Intel PCH HDMI/DP,pcm=3D3 as /devices/pci0000:00/0000:00:1f.3/so=
und/card0/input11<br>
input: HDA Intel PCH HDMI/DP,pcm=3D7 as /devices/pci0000:00/0000:00:1f.3/so=
und/card0/input12<br>
input: HDA Intel PCH HDMI/DP,pcm=3D8 as /devices/pci0000:00/0000:00:1f.3/so=
und/card0/input13<br>
input: HDA Intel PCH HDMI/DP,pcm=3D9 as /devices/pci0000:00/0000:00:1f.3/so=
und/card0/input14<br>
input: HDA Intel PCH HDMI/DP,pcm=3D10 as /devices/pci0000:00/0000:00:1f.3/s=
ound/card0/input15<br>
usb 1-7: new high-speed USB device number 4 using xhci_hcd<br>
EXT4-fs (nvme0n1p2): recovery complete<br>
EXT4-fs (nvme0n1p2): mounted filesystem with ordered data mode. Opts: (null=
). Quota mode: disabled.<br>
VFS: Mounted root (ext4 filesystem) readonly on device 259:2.<br>
devtmpfs: mounted<br>
Freeing unused kernel image (initmem) memory: 1112K<br>
Write protecting the kernel read-only data: 36864k<br>
Freeing unused kernel image (text/rodata gap) memory: 2032K<br>
Freeing unused kernel image (rodata/data gap) memory: 1740K<br>
Run /usr/lib/systemd/systemd as init process<br>
&nbsp; with arguments:<br>
&nbsp; &nbsp; /usr/lib/systemd/systemd<br>
&nbsp; &nbsp; nospec_store_bypass_disable<br>
&nbsp; with environment:<br>
&nbsp; &nbsp; HOME=3D/<br>
&nbsp; &nbsp; TERM=3Dlinux<br>
&nbsp; &nbsp; pti=3Doff<br>
&nbsp; &nbsp; spectre_v2=3Doff<br>
usb 1-7: New USB device found, idVendor=3D1bcf, idProduct=3D2b8c, bcdDevice=
=3D47.14<br>
usb 1-7: New USB device strings: Mfr=3D1, Product=3D2, SerialNumber=3D0<br>
usb 1-7: Product: Integrated_Webcam_HD<br>
usb 1-7: Manufacturer: SunplusIT Inc<br>
usb 1-7: Found UVC 1.00 device Integrated_Webcam_HD (1bcf:2b8c)<br>
input: Integrated_Webcam_HD: Integrate as /devices/pci0000:00/0000:00:14.0/=
usb1/1-7/1-7:1.0/input/input16<br>
systemd 249 running in system mode (+PAM -AUDIT -SELINUX -APPARMOR +IMA +SM=
ACK +SECCOMP -GCRYPT +GNUTLS +OPENSSL +ACL +BLKID -CURL -ELFUTILS -FIDO2 +I=
DN2 -IDN +IPTC +KMOD -LIBCRYPTSETUP +LIBFDISK +PCRE2 -PWQUALITY -P11KIT -QR=
ENCODE -BZIP2 +LZ4 +XZ -ZLIB +ZSTD
 +XKBCOMMON +UTMP +SYSVINIT default-hierarchy=3Dunified)<br>
Detected architecture x86-64.<br>
Bluetooth: hci0: using NVM file: qca/nvm_usb_00000302.bin<br>
/lib/systemd/system/gpm.service:7: Standard output type syslog is obsolete,=
 automatically updating to journal. Please update your unit file, and consi=
der removing the setting altogether.<br>
Queued start job for default target Graphical Interface.<br>
Created slice Slice /system/getty.<br>
Created slice Slice /system/modprobe.<br>
Created slice Slice /system/systemd-fsck.<br>
Created slice User and Session Slice.<br>
Started Dispatch Password Requests to Console Directory Watch.<br>
Started Forward Password Requests to Wall Directory Watch.<br>
Set up automount Arbitrary Executable File Formats File System Automount Po=
int.<br>
Reached target Remote File Systems.<br>
Reached target Slice Units.<br>
Reached target Swaps.<br>
Listening on Process Core Dump Socket.<br>
Listening on initctl Compatibility Named Pipe.<br>
Condition check resulted in Journal Audit Socket being skipped.<br>
Listening on Journal Socket (/dev/log).<br>
Listening on Journal Socket.<br>
Listening on Network Service Netlink Socket.<br>
Listening on udev Control Socket.<br>
Listening on udev Kernel Socket.<br>
Mounting Huge Pages File System...<br>
Mounting POSIX Message Queue File System...<br>
Mounting Kernel Debug File System...<br>
Mounting Kernel Trace File System...<br>
tmp.mount: Directory /tmp to mount over is not empty, mounting anyway.<br>
Mounting Temporary Directory /tmp...<br>
Condition check resulted in Create List of Static Device Nodes being skippe=
d.<br>
Starting Load Kernel Module configfs...<br>
Starting Load Kernel Module drm...<br>
Starting Load Kernel Module fuse...<br>
Condition check resulted in Set Up Additional Binary Formats being skipped.=
<br>
Starting File System Check on Root Device...<br>
Starting Journal Service...<br>
Condition check resulted in Load Kernel Modules being skipped.<br>
Starting Apply Kernel Variables...<br>
Starting Coldplug All udev Devices...<br>
Started Journal Service.<br>
EXT4-fs (nvme0n1p2): re-mounted. Opts: (null). Quota mode: disabled.<br>
EXT4-fs (nvme0n1p3): mounted filesystem with ordered data mode. Opts: (null=
). Quota mode: disabled.<br>
[drm] PCIE GART of 1024M enabled (table at 0x000000F400000000).<br>
BUG: kernel NULL pointer dereference, address: 0000000000000020<br>
#PF: supervisor write access in kernel mode<br>
#PF: error_code(0x0002) - not-present page<br>
PGD 0 P4D 0 <br>
Oops: 0002 [#1] SMP NOPTI<br>
CPU: 1 PID: 472 Comm: X Tainted: G &nbsp; &nbsp; U &nbsp; &nbsp;I &nbsp; &n=
bsp; &nbsp; 5.14.0-rc3-agd5f+ #1279<br>
Hardware name: Alienware Alienware 15 R2/0H6J09, BIOS 1.13.1 06/10/2021<br>
RIP: 0010:mutex_lock+0x14/0x30<br>
Code: c3 0f 1f 44 00 00 ba 02 01 00 00 e9 c6 fc ff ff cc cc cc cc cc cc 53 =
48 89 fb e8 e7 f3 ff ff 65 48 8b 0c 25 80 7c 01 00 31 c0 &lt;f0&gt; 48 0f b=
1 0b 74 06 48 89 df 5b eb 0f 5b c3 66 2e 0f 1f 84 00 00<br>
RSP: 0018:ffff8881123c7410 EFLAGS: 00010246<br>
RAX: 0000000000000000 RBX: 0000000000000020 RCX: ffff8881130eab80<br>
RDX: ffffffff837a3b20 RSI: ffffffff82f21500 RDI: 0000000000000020<br>
RBP: ffff8881123c7810 R08: 0000000000000000 R09: 0000000000000000<br>
R10: 0000000000000000 R11: 0000000000000001 R12: ffff88811b5e0000<br>
R13: 0000000000000020 R14: ffff8881123c7440 R15: ffff888110ef3400<br>
FS: &nbsp;00007ff8f25a5e40(0000) GS:ffff8888a1c40000(0000) knlGS:0000000000=
000000<br>
CS: &nbsp;0010 DS: 0000 ES: 0000 CR0: 0000000080050033<br>
CR2: 0000000000000020 CR3: 000000010febe003 CR4: 00000000001706a0<br>
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000<br>
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400<br>
Call Trace:<br>
&nbsp;? flush_workqueue+0x8e/0x560<br>
&nbsp;? amdgpu_dm_atomic_commit_tail+0x481/0x2630<br>
&nbsp;? atom_put_dst+0x251/0x460<br>
&nbsp;? kfree+0x179/0x2d0<br>
&nbsp;? amdgpu_atom_execute_table_locked+0x299/0x350<br>
&nbsp;? kfree+0x179/0x2d0<br>
&nbsp;? atom_op_and+0xc7/0x1a0<br>
&nbsp;? __cond_resched+0x11/0x40<br>
&nbsp;? __ww_mutex_lock+0x41/0x840<br>
&nbsp;? kmem_cache_alloc_trace+0x152/0x260<br>
&nbsp;? dm_plane_helper_prepare_fb+0x1ba/0x240<br>
&nbsp;? commit_tail+0x8f/0x170<br>
&nbsp;? drm_atomic_helper_commit+0x1f2/0x210<br>
&nbsp;? drm_atomic_helper_commit_duplicated_state+0xf5/0x100<br>
&nbsp;? drm_atomic_helper_resume+0xbc/0x150<br>
&nbsp;? dm_resume.llvm.5009353506756501165+0x5b9/0x630<br>
&nbsp;? amdgpu_device_resume+0x1a4/0x3f0<br>
&nbsp;? amdgpu_pmops_runtime_resume+0xa2/0xd0<br>
&nbsp;? pci_pm_runtime_resume+0xa2/0xe0<br>
&nbsp;? pci_pm_runtime_suspend+0x180/0x180<br>
&nbsp;? __rpm_callback+0x95/0x320<br>
&nbsp;? ep_poll_callback+0x88/0x210<br>
&nbsp;? __mod_memcg_lruvec_state+0x35/0xe0<br>
&nbsp;? pci_pm_runtime_suspend+0x180/0x180<br>
&nbsp;? rpm_resume+0x4a7/0x780<br>
&nbsp;? __flush_work.llvm.17749977397669205720+0x7d/0x280<br>
&nbsp;? __pm_runtime_resume+0x53/0x70<br>
&nbsp;? amdgpu_driver_open_kms+0x57/0x210<br>
&nbsp;? drm_file_alloc+0x19a/0x260<br>
&nbsp;? drm_open+0xd8/0x210<br>
&nbsp;? drm_stub_open+0xa2/0x120<br>
&nbsp;? chrdev_open.llvm.10459766552443321194+0xe2/0x1e0<br>
&nbsp;? cd_forget+0x60/0x60<br>
&nbsp;? do_dentry_open+0x135/0x340<br>
&nbsp;? path_openat+0x8df/0xbb0<br>
&nbsp;? kmem_cache_free+0x151/0x230<br>
&nbsp;? do_filp_open+0xa8/0x130<br>
&nbsp;? do_sys_openat2+0x80/0x170<br>
&nbsp;? __x64_sys_openat+0x6a/0x70<br>
&nbsp;? do_syscall_64+0x70/0xa0<br>
&nbsp;? entry_SYSCALL_64_after_hwframe+0x44/0xae<br>
Modules linked in:<br>
CR2: 0000000000000020<br>
---[ end trace 6afaf9921664f04e ]---<br>
RIP: 0010:mutex_lock+0x14/0x30<br>
Code: c3 0f 1f 44 00 00 ba 02 01 00 00 e9 c6 fc ff ff cc cc cc cc cc cc 53 =
48 89 fb e8 e7 f3 ff ff 65 48 8b 0c 25 80 7c 01 00 31 c0 &lt;f0&gt; 48 0f b=
1 0b 74 06 48 89 df 5b eb 0f 5b c3 66 2e 0f 1f 84 00 00<br>
RSP: 0018:ffff8881123c7410 EFLAGS: 00010246<br>
RAX: 0000000000000000 RBX: 0000000000000020 RCX: ffff8881130eab80<br>
RDX: ffffffff837a3b20 RSI: ffffffff82f21500 RDI: 0000000000000020<br>
RBP: ffff8881123c7810 R08: 0000000000000000 R09: 0000000000000000<br>
R10: 0000000000000000 R11: 0000000000000001 R12: ffff88811b5e0000<br>
R13: 0000000000000020 R14: ffff8881123c7440 R15: ffff888110ef3400<br>
FS: &nbsp;00007ff8f25a5e40(0000) GS:ffff8888a1c40000(0000) knlGS:0000000000=
000000<br>
CS: &nbsp;0010 DS: 0000 ES: 0000 CR0: 0000000080050033<br>
CR2: 0000000000000020 CR3: 000000010febe003 CR4: 00000000001706a0<br>
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000<br>
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400<br>
Syncing filesystems and block devices.<br>
Sending SIGTERM to remaining processes...<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div>
<p class=3D"MsoNormal">On Wed, 18 Aug 2021 at 03:08, Mike Lothian &lt;<a hr=
ef=3D"mailto:mike@fireburn.co.uk">mike@fireburn.co.uk</a>&gt; wrote:<o:p></=
o:p></p>
</div>
<blockquote style=3D"border:none;border-left:solid #CCCCCC 1.0pt;padding:0i=
n 0in 0in 6.0pt;margin-left:4.8pt;margin-top:5.0pt;margin-right:0in;margin-=
bottom:5.0pt">
<div>
<p class=3D"MsoNormal">Hi<o:p></o:p></p>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">I've just noticed something similar when starting we=
ston, I still see it with this patch, but not on linus's tree<o:p></o:p></p=
>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">I'll confirm for sure tomorrow and send the stack tr=
ace if I can save it<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Cheers<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Mike<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div>
<p class=3D"MsoNormal">On Tue, 3 Aug 2021 at 02:56, Chen, Guchun &lt;<a hre=
f=3D"mailto:Guchun.Chen@amd.com" target=3D"_blank">Guchun.Chen@amd.com</a>&=
gt; wrote:<o:p></o:p></p>
</div>
<blockquote style=3D"border:none;border-left:solid #CCCCCC 1.0pt;padding:0i=
n 0in 0in 6.0pt;margin-left:4.8pt;margin-top:5.0pt;margin-right:0in;margin-=
bottom:5.0pt">
<p class=3D"MsoNormal">[Public]<br>
<br>
Hi Alex,<br>
<br>
I submitted the patch before your message, I will take care of this next ti=
me.<br>
<br>
Regards,<br>
Guchun<br>
<br>
-----Original Message-----<br>
From: Alex Deucher &lt;<a href=3D"mailto:alexdeucher@gmail.com" target=3D"_=
blank">alexdeucher@gmail.com</a>&gt;
<br>
Sent: Monday, August 2, 2021 9:35 PM<br>
To: Chen, Guchun &lt;<a href=3D"mailto:Guchun.Chen@amd.com" target=3D"_blan=
k">Guchun.Chen@amd.com</a>&gt;<br>
Cc: Christian K=F6nig &lt;<a href=3D"mailto:ckoenig.leichtzumerken@gmail.co=
m" target=3D"_blank">ckoenig.leichtzumerken@gmail.com</a>&gt;;
<a href=3D"mailto:amd-gfx@lists.freedesktop.org" target=3D"_blank">amd-gfx@=
lists.freedesktop.org</a>; Gao, Likun &lt;<a href=3D"mailto:Likun.Gao@amd.c=
om" target=3D"_blank">Likun.Gao@amd.com</a>&gt;; Koenig, Christian &lt;<a h=
ref=3D"mailto:Christian.Koenig@amd.com" target=3D"_blank">Christian.Koenig@=
amd.com</a>&gt;;
 Zhang, Hawking &lt;<a href=3D"mailto:Hawking.Zhang@amd.com" target=3D"_bla=
nk">Hawking.Zhang@amd.com</a>&gt;; Deucher, Alexander &lt;<a href=3D"mailto=
:Alexander.Deucher@amd.com" target=3D"_blank">Alexander.Deucher@amd.com</a>=
&gt;<br>
Subject: Re: [PATCH] drm/amdgpu: avoid over-handle of fence driver fini in =
s3 test (v2)<br>
<br>
On Mon, Aug 2, 2021 at 4:23 AM Chen, Guchun &lt;<a href=3D"mailto:Guchun.Ch=
en@amd.com" target=3D"_blank">Guchun.Chen@amd.com</a>&gt; wrote:<br>
&gt;<br>
&gt; [Public]<br>
&gt;<br>
&gt; Thank you, Christian.<br>
&gt;<br>
&gt; Regarding fence_drv.initialized, it looks to a bit redundant, anyway l=
et me look into this more.<br>
<br>
Does this patch fix this bug?<br>
<a href=3D"https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2=
F%2Fgitlab.freedesktop.org%2Fdrm%2Famd%2F-%2Fissues%2F1668&amp;data=3D04%7C=
01%7CGuchun.Chen%40amd.com%7C82f9e022b7d54387f0dd08d961eda83b%7C3dd8961fe48=
84e608e11a82d994e183d%7C0%7C0%7C637648495656963126%7CUnknown%7CTWFpbGZsb3d8=
eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&a=
mp;sdata=3DLEUfvxvXNo5BSxy9ZWMG2sCmhS0%2FJN3boUh6c1kOTXo%3D&amp;reserved=3D=
0" target=3D"_blank">https://nam11.safelinks.protection.outlook.com/?url=3D=
https%3A%2F%2Fgitlab.freedesktop.org%2Fdrm%2Famd%2F-%2Fissues%2F1668&amp;am=
p;data=3D04%7C01%7CGuchun.Chen%40amd.com%7C2bf8bebf5b424751572408d955ba66e8=
%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637635081353279181%7CUnknown%=
7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6M=
n0%3D%7C1000&amp;amp;sdata=3DFuAo44Ws5SnuCxt45A%2Fqmu%2B3OfEkat1G%2BixO8G9u=
DVc%3D&amp;amp;reserved=3D0</a><br>
<br>
If so, please add:<br>
Bug: <a href=3D"https://nam11.safelinks.protection.outlook.com/?url=3Dhttps=
%3A%2F%2Fgitlab.freedesktop.org%2Fdrm%2Famd%2F-%2Fissues%2F1668&amp;data=3D=
04%7C01%7CGuchun.Chen%40amd.com%7C82f9e022b7d54387f0dd08d961eda83b%7C3dd896=
1fe4884e608e11a82d994e183d%7C0%7C0%7C637648495656973118%7CUnknown%7CTWFpbGZ=
sb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1=
000&amp;sdata=3Dw0cgvYWrUdxKUmIavnhArY2DkS2IYxuWLb%2FYHNB0%2BmM%3D&amp;rese=
rved=3D0" target=3D"_blank">
https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgitlab.=
freedesktop.org%2Fdrm%2Famd%2F-%2Fissues%2F1668&amp;amp;data=3D04%7C01%7CGu=
chun.Chen%40amd.com%7C2bf8bebf5b424751572408d955ba66e8%7C3dd8961fe4884e608e=
11a82d994e183d%7C0%7C0%7C637635081353279181%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3DFuAo44Ws5SnuCxt45A%2Fqmu%2B3OfEkat1G%2BixO8G9uDVc%3D&amp;amp;reserv=
ed=3D0</a><br>
to the commit message.<br>
<br>
Alex<br>
<br>
&gt;<br>
&gt; Regards,<br>
&gt; Guchun<br>
&gt;<br>
&gt; -----Original Message-----<br>
&gt; From: Christian K=F6nig &lt;<a href=3D"mailto:ckoenig.leichtzumerken@g=
mail.com" target=3D"_blank">ckoenig.leichtzumerken@gmail.com</a>&gt;<br>
&gt; Sent: Monday, August 2, 2021 2:56 PM<br>
&gt; To: Chen, Guchun &lt;<a href=3D"mailto:Guchun.Chen@amd.com" target=3D"=
_blank">Guchun.Chen@amd.com</a>&gt;;
<a href=3D"mailto:amd-gfx@lists.freedesktop.org" target=3D"_blank">amd-gfx@=
lists.freedesktop.org</a>;
<br>
&gt; Gao, Likun &lt;<a href=3D"mailto:Likun.Gao@amd.com" target=3D"_blank">=
Likun.Gao@amd.com</a>&gt;; Koenig, Christian
<br>
&gt; &lt;<a href=3D"mailto:Christian.Koenig@amd.com" target=3D"_blank">Chri=
stian.Koenig@amd.com</a>&gt;; Zhang, Hawking &lt;<a href=3D"mailto:Hawking.=
Zhang@amd.com" target=3D"_blank">Hawking.Zhang@amd.com</a>&gt;;
<br>
&gt; Deucher, Alexander &lt;<a href=3D"mailto:Alexander.Deucher@amd.com" ta=
rget=3D"_blank">Alexander.Deucher@amd.com</a>&gt;<br>
&gt; Subject: Re: [PATCH] drm/amdgpu: avoid over-handle of fence driver <br=
>
&gt; fini in s3 test (v2)<br>
&gt;<br>
&gt; Am 02.08.21 um 07:16 schrieb Guchun Chen:<br>
&gt; &gt; In amdgpu_fence_driver_hw_fini, no need to call drm_sched_fini to=
 <br>
&gt; &gt; stop scheduler in s3 test, otherwise, fence related failure will =
<br>
&gt; &gt; arrive after resume. To fix this and for a better clean up, move =
<br>
&gt; &gt; drm_sched_fini from fence_hw_fini to fence_sw_fini, as it's part =
of <br>
&gt; &gt; driver shutdown, and should never be called in hw_fini.<br>
&gt; &gt;<br>
&gt; &gt; v2: rename amdgpu_fence_driver_init to amdgpu_fence_driver_sw_ini=
t, <br>
&gt; &gt; to keep sw_init and sw_fini paired.<br>
&gt; &gt;<br>
&gt; &gt; Fixes: cd87a6dcf6af drm/amdgpu: adjust fence driver enable sequen=
ce<br>
&gt; &gt; Suggested-by: Christian K=F6nig &lt;<a href=3D"mailto:christian.k=
oenig@amd.com" target=3D"_blank">christian.koenig@amd.com</a>&gt;<br>
&gt; &gt; Signed-off-by: Guchun Chen &lt;<a href=3D"mailto:guchun.chen@amd.=
com" target=3D"_blank">guchun.chen@amd.com</a>&gt;<br>
&gt;<br>
&gt; It's a bit ambiguous now what fence_drv.initialized means, but I think=
 we can live with that for now.<br>
&gt;<br>
&gt; Patch is Reviewed-by: Christian K=F6nig &lt;<a href=3D"mailto:christia=
n.koenig@amd.com" target=3D"_blank">christian.koenig@amd.com</a>&gt;.<br>
&gt;<br>
&gt; Regards,<br>
&gt; Christian.<br>
&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;&nbsp; &nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |&nbsp; 5 =
++---<br>
&gt; &gt;&nbsp; &nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c&nbsp; | 12 =
+++++++-----<br>
&gt; &gt;&nbsp; &nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h&nbsp; &nbsp;=
|&nbsp; 4 ++--<br>
&gt; &gt;&nbsp; &nbsp;3 files changed, 11 insertions(+), 10 deletions(-)<br=
>
&gt; &gt;<br>
&gt; &gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<br>
&gt; &gt; b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<br>
&gt; &gt; index b1d2dc39e8be..9e53ff851496 100644<br>
&gt; &gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<br>
&gt; &gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<br>
&gt; &gt; @@ -3646,9 +3646,9 @@ int amdgpu_device_init(struct amdgpu_device=
 <br>
&gt; &gt; *adev,<br>
&gt; &gt;<br>
&gt; &gt;&nbsp; &nbsp;fence_driver_init:<br>
&gt; &gt;&nbsp; &nbsp; &nbsp; &nbsp;/* Fence driver */<br>
&gt; &gt; -&nbsp; &nbsp; &nbsp;r =3D amdgpu_fence_driver_init(adev);<br>
&gt; &gt; +&nbsp; &nbsp; &nbsp;r =3D amdgpu_fence_driver_sw_init(adev);<br>
&gt; &gt;&nbsp; &nbsp; &nbsp; &nbsp;if (r) {<br>
&gt; &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;dev_err(adev-&gt=
;dev, &quot;amdgpu_fence_driver_init failed\n&quot;);<br>
&gt; &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;dev_err(adev-&gt=
;dev, &quot;amdgpu_fence_driver_sw_init <br>
&gt; &gt; + failed\n&quot;);<br>
&gt; &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;amdgpu_vf_e=
rror_put(adev, AMDGIM_ERROR_VF_FENCE_INIT_FAIL, 0, 0);<br>
&gt; &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;goto failed=
;<br>
&gt; &gt;&nbsp; &nbsp; &nbsp; &nbsp;}<br>
&gt; &gt; @@ -3988,7 +3988,6 @@ int amdgpu_device_resume(struct drm_device =
*dev, bool fbcon)<br>
&gt; &gt;&nbsp; &nbsp; &nbsp; &nbsp;}<br>
&gt; &gt;&nbsp; &nbsp; &nbsp; &nbsp;amdgpu_fence_driver_hw_init(adev);<br>
&gt; &gt;<br>
&gt; &gt; -<br>
&gt; &gt;&nbsp; &nbsp; &nbsp; &nbsp;r =3D amdgpu_device_ip_late_init(adev);=
<br>
&gt; &gt;&nbsp; &nbsp; &nbsp; &nbsp;if (r)<br>
&gt; &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return r;<b=
r>
&gt; &gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c<br>
&gt; &gt; b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c<br>
&gt; &gt; index 49c5c7331c53..7495911516c2 100644<br>
&gt; &gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c<br>
&gt; &gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c<br>
&gt; &gt; @@ -498,7 +498,7 @@ int amdgpu_fence_driver_init_ring(struct amdg=
pu_ring *ring,<br>
&gt; &gt;&nbsp; &nbsp;}<br>
&gt; &gt;<br>
&gt; &gt;&nbsp; &nbsp;/**<br>
&gt; &gt; - * amdgpu_fence_driver_init - init the fence driver<br>
&gt; &gt; + * amdgpu_fence_driver_sw_init - init the fence driver<br>
&gt; &gt;&nbsp; &nbsp; * for all possible rings.<br>
&gt; &gt;&nbsp; &nbsp; *<br>
&gt; &gt;&nbsp; &nbsp; * @adev: amdgpu device pointer<br>
&gt; &gt; @@ -509,13 +509,13 @@ int amdgpu_fence_driver_init_ring(struct am=
dgpu_ring *ring,<br>
&gt; &gt;&nbsp; &nbsp; * amdgpu_fence_driver_start_ring().<br>
&gt; &gt;&nbsp; &nbsp; * Returns 0 for success.<br>
&gt; &gt;&nbsp; &nbsp; */<br>
&gt; &gt; -int amdgpu_fence_driver_init(struct amdgpu_device *adev)<br>
&gt; &gt; +int amdgpu_fence_driver_sw_init(struct amdgpu_device *adev)<br>
&gt; &gt;&nbsp; &nbsp;{<br>
&gt; &gt;&nbsp; &nbsp; &nbsp; &nbsp;return 0;<br>
&gt; &gt;&nbsp; &nbsp;}<br>
&gt; &gt;<br>
&gt; &gt;&nbsp; &nbsp;/**<br>
&gt; &gt; - * amdgpu_fence_driver_fini - tear down the fence driver<br>
&gt; &gt; + * amdgpu_fence_driver_hw_fini - tear down the fence driver<br>
&gt; &gt;&nbsp; &nbsp; * for all possible rings.<br>
&gt; &gt;&nbsp; &nbsp; *<br>
&gt; &gt;&nbsp; &nbsp; * @adev: amdgpu device pointer<br>
&gt; &gt; @@ -531,8 +531,7 @@ void amdgpu_fence_driver_hw_fini(struct<br>
&gt; &gt; amdgpu_device *adev)<br>
&gt; &gt;<br>
&gt; &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (!ring |=
| !ring-&gt;fence_drv.initialized)<br>
&gt; &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;continue;<br>
&gt; &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (!ring-&gt;no=
_scheduler)<br>
&gt; &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;drm_sched_fini(&amp;ring-&gt;sched);<br>
&gt; &gt; +<br>
&gt; &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* You can'=
t wait for HW to signal if it's gone */<br>
&gt; &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (!drm_de=
v_is_unplugged(&amp;adev-&gt;ddev))<br>
&gt; &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;r =3D amdgpu_fence_wait_empty(ring); @@ -560,6 <br>
&gt; &gt; +559,9 @@ void amdgpu_fence_driver_sw_fini(struct amdgpu_device *=
adev)<br>
&gt; &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (!ring |=
| !ring-&gt;fence_drv.initialized)<br>
&gt; &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;continue;<br>
&gt; &gt;<br>
&gt; &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (!ring-&gt;no=
_scheduler)<br>
&gt; &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;drm_sched_fini(&amp;ring-&gt;sched);<br>
&gt; &gt; +<br>
&gt; &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;for (j =3D =
0; j &lt;=3D ring-&gt;fence_drv.num_fences_mask; ++j)<br>
&gt; &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;dma_fence_put(ring-&gt;fence_drv.fences[j]);<br>
&gt; &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;kfree(ring-=
&gt;fence_drv.fences); diff --git <br>
&gt; &gt; a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h<br>
&gt; &gt; b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h<br>
&gt; &gt; index 27adffa7658d..9c11ced4312c 100644<br>
&gt; &gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h<br>
&gt; &gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h<br>
&gt; &gt; @@ -106,7 +106,6 @@ struct amdgpu_fence_driver {<br>
&gt; &gt;&nbsp; &nbsp; &nbsp; &nbsp;struct dma_fence&nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; **fences;<br>
&gt; &gt;&nbsp; &nbsp;};<br>
&gt; &gt;<br>
&gt; &gt; -int amdgpu_fence_driver_init(struct amdgpu_device *adev);<br>
&gt; &gt;&nbsp; &nbsp;void amdgpu_fence_driver_force_completion(struct amdg=
pu_ring <br>
&gt; &gt; *ring);<br>
&gt; &gt;<br>
&gt; &gt;&nbsp; &nbsp;int amdgpu_fence_driver_init_ring(struct amdgpu_ring =
*ring, @@<br>
&gt; &gt; -115,9 +114,10 @@ int amdgpu_fence_driver_init_ring(struct amdgpu=
_ring *ring,<br>
&gt; &gt;&nbsp; &nbsp;int amdgpu_fence_driver_start_ring(struct amdgpu_ring=
 *ring,<br>
&gt; &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; struct amdgpu_irq_src =
*irq_src,<br>
&gt; &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; unsigned irq_type);<br=
>
&gt; &gt; +void amdgpu_fence_driver_hw_init(struct amdgpu_device *adev);<br=
>
&gt; &gt;&nbsp; &nbsp;void amdgpu_fence_driver_hw_fini(struct amdgpu_device=
 *adev);<br>
&gt; &gt; +int amdgpu_fence_driver_sw_init(struct amdgpu_device *adev);<br>
&gt; &gt;&nbsp; &nbsp;void amdgpu_fence_driver_sw_fini(struct amdgpu_device=
 *adev); <br>
&gt; &gt; -void amdgpu_fence_driver_hw_init(struct amdgpu_device *adev);<br=
>
&gt; &gt;&nbsp; &nbsp;int amdgpu_fence_emit(struct amdgpu_ring *ring, struc=
t dma_fence **fence,<br>
&gt; &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;unsigned flags);<br>
&gt; &gt;&nbsp; &nbsp;int amdgpu_fence_emit_polling(struct amdgpu_ring *rin=
g, uint32_t *s,<o:p></o:p></p>
</blockquote>
</div>
</blockquote>
</div>
</div>
</body>
</html>

--_000_DM5PR12MB24695E8F2DFE2EE603354D8FF1FF9DM5PR12MB2469namp_--
