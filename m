Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A69A727DF18
	for <lists+amd-gfx@lfdr.de>; Wed, 30 Sep 2020 05:45:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D5306E4CF;
	Wed, 30 Sep 2020 03:45:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2088.outbound.protection.outlook.com [40.107.237.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C81E6E0C8
 for <amd-gfx@lists.freedesktop.org>; Wed, 30 Sep 2020 03:45:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nKB8Rmg2hcaGHJqeJmV4un1c9wWRbXePQPDMiEsfus4eXWdYdjvghnrSZyqblia8bJo/rWlPeGFgWOkBuHjytFnlbXzMScJk826OLKPdJtQExYZ2RkVTIM96w1pLKCU6Ra8Y31vMXoqlJrzmHcbjM/ad5l/UysrqtI/ZUwJ2iVDxB2vmWdaHwRzqcSRwh5XsgTlJTPd1i00U/jF9BlQXjmYkIjLbyvoOiv6d8LNvqX/D7QxNleVbzKCZ1t0BgOdrNRQT6WoKAWB+UlITrr0D0k5NbzI3j9SmhKyPZA2L5hlhlM8CbmyyR2oIXAEE9r58JxxVvDLQXW6Oz9ke1uJPnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CYWhb0zaSPZAKFQcJcQBSc8ZdaG4kANWA9MkUtdOwXw=;
 b=d62r0MUX+Vn5toZiK51VIx7rJZ9mAQUlz/dFHb+JyFNsIGq8LnLxOkpa+mUZTtVkvKzbKkZPaJs5OGD1mMz2CZI2XFY844revf2YseXgpzW3aXGjO2F9QzhiSGFWvcnCpBgLdLBU0CSHC3c5uB8xxCVRHYGWm4zNkpHr+e9mknG2X557vzRiZx+bzb40HmAGWSoNuXcQg4TLhmhKhTGhBrQhMyQ0G8zHXG5VPQsb1hyiU/GEBlW/4Bd5na7aVHujN15BuDvyPQzJMReu5lQmv/3WruG4GcZODQi3S4Sw2+67GBj3Ja4TO65FHm+z3ilBkqvOiN0IIPk2Rn8w277ogg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CYWhb0zaSPZAKFQcJcQBSc8ZdaG4kANWA9MkUtdOwXw=;
 b=BUHzYVtWqFjOof9n24WmBPmzet3KOjoAgN90zy3imQSlwgDF2L4ffFPDcR0DmKqRDXBxpp35INdg8MZ+DvUArIHe7aT4O5syzdugZaQuqKxurhvnpWCU9HlmodHXHdZG7Aw162F4GrxpSHPvt7g+WpZgo3Gc34MtDEPBddmqLaE=
Received: from DM6PR12MB2619.namprd12.prod.outlook.com (2603:10b6:5:45::18) by
 DM6PR12MB4387.namprd12.prod.outlook.com (2603:10b6:5:2ac::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.32; Wed, 30 Sep 2020 03:45:50 +0000
Received: from DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::bcb1:de80:f60c:8118]) by DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::bcb1:de80:f60c:8118%5]) with mapi id 15.20.3433.032; Wed, 30 Sep 2020
 03:45:50 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, Dirk Gouders <dirk@gouders.net>
Subject: RE: amdgpu: call trace introduced in 5.9-rc1 for Lenovo L14 Renoir
Thread-Topic: amdgpu: call trace introduced in 5.9-rc1 for Lenovo L14 Renoir
Thread-Index: AQHWkOczbHYvjn6u0EeoMntKLwp+uql2L5YMgABALoCAACW3H4AAMiMagAF+0ACAA/Vtz4ADdOCAgADlESA=
Date: Wed, 30 Sep 2020 03:45:50 +0000
Message-ID: <DM6PR12MB2619587CFB99F34FB0CFF8C7E4330@DM6PR12MB2619.namprd12.prod.outlook.com>
References: <ghh7rqvtc1.fsf@gouders.net> <gha6xg237c.fsf@gouders.net>
 <CADnq5_PD-8rULVhDb-nAfonpm1ptQuCGh4520Gs_nrBN6g+4hA@mail.gmail.com>
 <ghd02cjpgk.fsf@gouders.net> <ghlfh0s2id.fsf@gouders.net>
 <CADnq5_OuRMgTNtycOr+vOd2pDzENcc1=4WvsQX31dUez0hoNtQ@mail.gmail.com>
 <ghtuvjfulx.fsf@gouders.net>
 <CADnq5_Nz_BG=QL0xN-j4k=Zf4R_F65zDKzD=OJ+kC_7XQYaMGw@mail.gmail.com>
In-Reply-To: <CADnq5_Nz_BG=QL0xN-j4k=Zf4R_F65zDKzD=OJ+kC_7XQYaMGw@mail.gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ActionId=cf9dcbb1-59b7-4045-84d0-87cc0e215c41;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=0;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal
 Use Only - Unrestricted;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2020-09-30T03:43:05Z;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [58.247.170.242]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c76e79bc-f935-49f1-a2a0-08d864f3532c
x-ms-traffictypediagnostic: DM6PR12MB4387:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB43871DBC1299999E14C994ABE4330@DM6PR12MB4387.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:989;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1cZmvtp/4FzMl3/JCsI9HSmFxiq01OeohM6NGBHyMBH+worPhUivNNTPkRic7C5rAxt8jC91NNtc7ezcGyGlhKinjG34+bsuYH3oM74EnG129LOhQkc6ifqAlvvQnYB6N+y7YD67wfm5UjIaiWEvpqAaqH3ZtOrCTxFoy7403OmvqjTiP8tt4HYbG3mDWgHJwmJhtLSHAmPsto+EqwocC5gQttPgBjAUKwPLJa4qhBrhZ+WqemFI8cQch+rPYOM8t5S6QPDNVs2iheyaSb8x5W9NBCGwK8eym2gh+sBg5vvxBknNLH5CaM6HWJcxhAK8dvzqIe7+GYmJqghkoIRkNh91UTDwh1sTUcZ++NExrH56TZLJyTlcTsIlWzVGFKDGqDhySKuT5qjeb9oP8tor4A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2619.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(346002)(376002)(366004)(39860400002)(83380400001)(5660300002)(966005)(64756008)(66446008)(66476007)(66946007)(66556008)(8676002)(55016002)(53546011)(6506007)(4326008)(26005)(71200400001)(86362001)(76116006)(186003)(30864003)(52536014)(8936002)(33656002)(316002)(7696005)(2906002)(54906003)(478600001)(45080400002)(110136005)(83080400001)(9686003)(559001)(579004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: OkxlWMsO9Kq3+TsrzHhY7ZjbWMYTlvlUraPJHofZoKhXzrpz3Xf1itbgiDkMbtp9nQQ23jcSXWxsCQPmIRP1r8kX71h8zSxKWnGx9RLs05O1W0oPsvPjfxnXXjlvPBcKLKuJ1IigqgoP9VE/cHV9wqNUtCceJecPsJKmz7xcFV5Ax9M/D8aB+25h1OyoLSukudlyzslwgtBT6KYIVl9yRMTqdcVkbk3YJtxJ3ZZCEhf/I1YbY+eFvQvagKmKo/mQJEswl0SEDYLi5KtKngfJiOpHXDUay1jvfPrLDTr+q/A9tSyOH/Y4dwiTW1oFKnPw6kA+PIan83EFCYbcfAuI9YvmC1l9G4wfknK1xNu/pAWeHyZF46yazSb7XV6ag73/qhyVepiZ2t/sBn5zTPm/PYDidpcjPYH5OxM4mTGhi5bM+3/V44EyjfiWHbdeFKzJvGRsLF2qq1IzLqpYwQaUwSsIt0aH5JAlKVpNUbt3BUQXdb/5Jmj/XJ4a/+ag+WsuSZcGsZRwxLaZODubzxITtdC1B7UIq31ZfJgPoho7kZcGZqFFE2frjCfLBOkng937schFV8KTDSAzB4ww7pxpvcb7exNDhJnRG9ykzO/OxU6GS6+y1HqTMwhZTlpb8K3KXsu6+I2iuosxD5u4uCIMbw==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2619.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c76e79bc-f935-49f1-a2a0-08d864f3532c
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2020 03:45:50.6920 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xfOe8zRKZ2/vqJGY7Pzw/F6cfCWGTVM+CevJZQ1n6UEdqz1LCkD1VfRPP+b55n7n
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4387
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

[AMD Official Use Only - Internal Distribution Only]

Thanks, I will send out a fix for this.

During DC hw init, pp_smu->rn_funcs.get_dpm_clock_table is called.
However, the dpm_clock_table is not setup yet at that time.
And that will trigger NULL pointer dereference.

BR
Evan
-----Original Message-----
From: Alex Deucher <alexdeucher@gmail.com>
Sent: Tuesday, September 29, 2020 10:03 PM
To: Dirk Gouders <dirk@gouders.net>; Quan, Evan <Evan.Quan@amd.com>
Cc: Kuehling, Felix <Felix.Kuehling@amd.com>; LKML <linux-kernel@vger.kernel.org>; amd-gfx list <amd-gfx@lists.freedesktop.org>
Subject: Re: amdgpu: call trace introduced in 5.9-rc1 for Lenovo L14 Renoir

On Sun, Sep 27, 2020 at 5:18 AM Dirk Gouders <dirk@gouders.net> wrote:
>
> Alex Deucher <alexdeucher@gmail.com> writes:
>
> > On Wed, Sep 23, 2020 at 3:45 PM Dirk Gouders <dirk@gouders.net> wrote:
> >>
> >> Dirk Gouders <dirk@gouders.net> writes:
> >>
> >> > Alex Deucher <alexdeucher@gmail.com> writes:
> >> >
> >> >> On Wed, Sep 23, 2020 at 8:54 AM Dirk Gouders <dirk@gouders.net> wrote:
> >> >>>
> >> >>> Dirk Gouders <dirk@gouders.net> writes:
> >> >>>
> >> >>> > Hi,
> >> >>> >
> >> >>> > I noticed a call trace (attached) when starting my machine
> >> >>> > (ThinkPad L14).  This machine is new and I am still working
> >> >>> > on it's configuration but visually noticeable is that
> >> >>> > scrolling in xterms with SHIFT-PgUp/PgDn is broken.  Using the mouse wheel works.
> >> >>> >
> >> >>> > It seems the call trace has been introduced between 5.8 and
> >> >>> > 5.9-rc1 and I tried to bisect this but always end in
> >> >>> > situations where I dont't find a bootable commit around the
> >> >>> > current bisect position.  Mainly the machine then hangs when udevd is started.
> >> >>>
> >> >>> I fixed my netconsole setup (had to use a switch instead of the
> >> >>> ports of a FritzBox) and tried a bisect, again (log below).
> >> >>> With the commits between the earliest bad and latest good
> >> >>> commits I marked, my machine does not boot and hangs very early with the message:
> >> >>>
> >> >>>         fb0: switching to amdgpudrmfb from EFI VGA
> >> >>>
> >> >>> That was introduced with
> >> >>>
> >> >>>         c1cf79ca5ced drm/amdgpu: use IP discovery table for
> >> >>> renoir
> >> >>>
> >> >>> and ended with a commit that instead produces the call trace
> >> >>>
> >> >>>         b6df946ef4b5 drm/amdgpu: fix the nullptr issue as for PWR IP not
> >> >>>                      existing in discovery table
> >> >>>
> >> >>> I was hoping to get further with the bisect but have no idea
> >> >>> how to avoid the early hangs.
> >> >>
> >> >> You can disable use of the IP discovery table by setting
> >> >> amdgpu.discovery=0 on the kernel command line in grub.
> >> >
> >> > I tried that with b770f04ba2ee (next step in bisect), but no
> >> > success with this option, unfortunately.
> >> >
> >> > I'm not using grub but directly booting from UEFI using CONFIG_CMDLINE.
> >> > Any other option I am using (root, loglevel and netconsole) works
> >> > as expected and I veryfied that "amdgpu.discovery=0" is included
> >> > in vmlinux.
> >>
> >> Apologies if I'm causing too much noise.
> >>
> >> While thinking about this I recalled that I changed amdgpu from
> >> modular to static when I had problems with netconsole.  I changed
> >> it back to modular to see if that helps and I get the earlier
> >> mentioned hangs later in the boot process when udevd starts and netconsole is up working.
> >> This enables me to inspect boot messages and I tested with
> >> amdgpu.discovery=0:
> >>
> >> 5,175,49060,-;Kernel command line: root=PARTLABEL=system1 amdgpu.discovery=0 loglevel=15 netconsole=...
> >>
> >> I'm afraid I now get traces that commit b6df946ef4b5 (drm/amdgpu:
> >> fix the nullptr issue as for PWR IP not existing in discovery
> >> table) is fixing (output attached below) and I cannot decide how to
> >> continue with bisecting...
> >
> > You get the issue with discovery=0?  You can try skipping that
> > commit (mark as skip) to finish the bisection.
>
> I get issues with both, amdgpu.discovery={0,1}.  With "0" I hit the
> NULL pointer dereference in soc15_set_ip_blocks() and with "1" I hit
> the assert in rn_clk_mgr_helper_populate_bw_params().
>
> I only noticed the issue with "0" after you told me about
> amdgpu.discovery, so I continued to find the commit that introduced
> the issue with "1".
>
> Using bisect skip alone did not help but keeping b6df946ef4b5
> (drm/amdgpu: fix the nullptr issue as for PWR IP not existing in
> discovery table) in the working tree made the bisect session much more
> straight forward.
>
> It resulted in 02cf91c113ea (drm/amd/powerplay: postpone operations
> not required for hw setup to late_init) as the first bad commit.
>
> Not that I understand anything about the driver but I wanted to know
> if that commit really is causing the issue.  So, I tried to move back
> some initialization code from smu_late_init() to smu_smc_hw_setup()
> (diff
> below) and with that the issue is gone.  I'm not sure if you prefer a
> full dmesg output, for now I'll append the [drm] part.

@Quan, Evan Any ideas?

Thanks!

Alex


>
> Dirk
>
> = diff =============================================================
> diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
> b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
> index 63f945f9f331..9f5395b0f3d4 100644
> --- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
> +++ b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
> @@ -479,23 +479,6 @@ static int smu_late_init(void *handle)
>                 return ret;
>         }
>
> -       /*
> -        * Set initialized values (get from vbios) to dpm tables context such as
> -        * gfxclk, memclk, dcefclk, and etc. And enable the DPM feature for each
> -        * type of clks.
> -        */
> -       ret = smu_set_default_dpm_table(smu);
> -       if (ret) {
> -               dev_err(adev->dev, "Failed to setup default dpm clock tables!\n");
> -               return ret;
> -       }
> -
> -       ret = smu_populate_umd_state_clk(smu);
> -       if (ret) {
> -               dev_err(adev->dev, "Failed to populate UMD state clocks!\n");
> -               return ret;
> -       }
> -
>         ret = smu_get_asic_power_limits(smu);
>         if (ret) {
>                 dev_err(adev->dev, "Failed to get asic power
> limits!\n"); @@ -892,6 +875,23 @@ static int smu_smc_hw_setup(struct smu_context *smu)
>                 return ret;
>         }
>
> +       /*
> +        * Set initialized values (get from vbios) to dpm tables context such as
> +        * gfxclk, memclk, dcefclk, and etc. And enable the DPM feature for each
> +        * type of clks.
> +        */
> +       ret = smu_set_default_dpm_table(smu);
> +       if (ret) {
> +               dev_err(adev->dev, "Failed to setup default dpm clock tables!\n");
> +               return ret;
> +       }
> +
> +       ret = smu_populate_umd_state_clk(smu);
> +       if (ret) {
> +               dev_err(adev->dev, "Failed to populate UMD state clocks!\n");
> +               return ret;
> +       }
> +
>         /* smu_dump_pptable(smu); */
>         /*
>          * Copy pptable bo in the vram to smc with SMU MSGs such as
>
> = dmesg ================================================================
> [    5.696659] [drm] amdgpu kernel modesetting enabled.
> [    5.697123] [drm] initializing kernel modesetting (RENOIR 0x1002:0x1636 0x17AA:0x507E 0xC3).
> [    5.697530] [drm] register mmio base: 0xFD300000
> [    5.697531] [drm] register mmio size: 524288
> [    5.697534] [drm] PCIE atomic ops is not supported
> [    5.698690] [drm] add ip block number 0 <soc15_common>
> [    5.698691] [drm] add ip block number 1 <gmc_v9_0>
> [    5.698691] [drm] add ip block number 2 <vega10_ih>
> [    5.698692] [drm] add ip block number 3 <psp>
> [    5.698692] [drm] add ip block number 4 <smu>
> [    5.698693] [drm] add ip block number 5 <gfx_v9_0>
> [    5.698694] [drm] add ip block number 6 <sdma_v4_0>
> [    5.698694] [drm] add ip block number 7 <dm>
> [    5.698695] [drm] add ip block number 8 <vcn_v2_0>
> [    5.698695] [drm] add ip block number 9 <jpeg_v2_0>
> [    5.698739] [drm] VCN decode is enabled in VM mode
> [    5.698739] [drm] VCN encode is enabled in VM mode
> [    5.698739] [drm] JPEG decode is enabled in VM mode
> [    5.698771] [drm] vm size is 262144 GB, 4 levels, block size is 9-bit, fragment size is 9-bit
> [    5.698783] [drm] Detected VRAM RAM=512M, BAR=512M
> [    5.698784] [drm] RAM width 64bits DDR4
> [    5.701819] [drm] amdgpu: 512M of VRAM memory ready
> [    5.701822] [drm] amdgpu: 3072M of GTT memory ready.
> [    5.701824] [drm] GART: num cpu pages 262144, num gpu pages 262144
> [    5.701952] [drm] PCIE GART of 1024M enabled (table at 0x000000F400900000).
> [    5.722108] [drm] Loading DMUB firmware via PSP: version=0x00000000
> [    5.722118] [drm] Found VCN firmware Version ENC: 1.7 DEC: 4 VEP: 0 Revision: 17
> [    5.722123] [drm] PSP loading VCN firmware
> [    6.348416] [drm] reserve 0x400000 from 0xf41f800000 for PSP TMR
> [    6.883433] [drm] kiq ring mec 2 pipe 1 q 0
> [    6.884348] [drm] Display Core initialized with v3.2.95!
> [    6.897512] [drm] DMUB hardware initialized: version=0x01000000
> [    7.039831] [drm] DP Alt mode state on HPD: 0
> [    7.241053] [drm] Alt mode has timed out after 201 ms
> [    7.241121] [drm] DP Alt mode state on HPD: 0
> [    7.442382] [drm] Alt mode has timed out after 201 ms
> [    7.483120] [drm] VCN decode and encode initialized successfully(under DPG Mode).
> [    7.483139] [drm] JPEG decode initialized successfully.
> [    7.485188] [drm] fb mappable at 0x410CA0000
> [    7.485189] [drm] vram apper at 0x410000000
> [    7.485189] [drm] size 8294400
> [    7.485190] [drm] fb depth is 24
> [    7.485190] [drm]    pitch is 7680
> [    7.667324] amdgpu 0000:06:00.0: [drm] fb0: amdgpudrmfb frame buffer device
> [    7.705209] [drm] Initialized amdgpu 3.39.0 20150101 for 0000:06:00.0 on minor 0
> ======================================================================
> ==
>
> >
> > Alex
> >
> >>
> >> Dirk
> >>
> >> 1,840,5418458,-;BUG: kernel NULL pointer dereference, address:
> >> 0000000000000008
> >> 1,841,5418472,-;#PF: supervisor read access in kernel mode
> >> 1,842,5418474,-;#PF: error_code(0x0000) - not-present page
> >> 6,843,5418476,-;PGD 0 P4D 0
> >> 4,844,5418480,-;Oops: 0000 [#1] SMP NOPTI
> >> 4,845,5418483,-;CPU: 3 PID: 744 Comm: udevd Not tainted
> >> 5.7.0-rc2-x86_64-01641-gb770f04ba2ee #216 4,846,5418486,-;Hardware
> >> name: LENOVO 20U50008GE/20U50008GE, BIOS R19ET26W (1.10 )
> >> 06/22/2020
> >> 4,847,5418559,-;RIP: 0010:nbio_v7_0_get_rev_id+0x9/0x1b [amdgpu]
> >> 4,848,5418562,-;Code: 5d 41 5d 41 5e e9 9a f0 f9 ff 48 8b 87 e8 5f
> >> 01 00 31 d2 8b 70 08 81 c6 c3 00 00 00 e9 9d ef f9 ff 48 8b 87 e8
> >> 5f
> >> 01 00 31 d2 <8b> 70 08 83 c6 0f e8 89 ef f9 ff c1 e8 18 83 e0 0f c3
> >> 49 89 f8 48
> >> 4,849,5418566,-;RSP: 0018:ffffc900011dba90 EFLAGS: 00010246
> >> 4,850,5418568,-;RAX: 0000000000000000 RBX: 0000000fffffffe0 RCX:
> >> 0000000000000018
> >> 4,851,5418571,-;RDX: 0000000000000000 RSI: ffffffffa0970e20 RDI:
> >> ffff8883f5540000
> >> 4,852,5418573,-;RBP: ffff8883f5540000 R08: 0000000000000001 R09:
> >> 0000000000000000
> >> 4,853,5418575,-;R10: 0000000000000000 R11: 0000000000000048 R12:
> >> 00000000ffffffea
> >> 4,854,5418577,-;R13: 7fffffffffffffff R14: ffff8883f9486800 R15:
> >> ffffc900011dbe98
> >> 4,855,5418580,-;FS:  00007f750db3dd80(0000)
> >> GS:ffff88840ecc0000(0000) knlGS:0000000000000000
> >> 4,856,5418583,-;CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> >> 4,857,5418586,-;CR2: 0000000000000008 CR3: 00000003f9728000 CR4:
> >> 0000000000340ee0 4,858,5418588,-;Call Trace:
> >> 4,859,5418660,-; soc15_set_ip_blocks+0x105/0x4fd [amdgpu]
> >> 4,860,5418714,-; amdgpu_device_init+0xcab/0x1862 [amdgpu]
> >> 4,861,5418720,-; ? __kmalloc+0xb2/0xc4 4,862,5418766,-;
> >> amdgpu_driver_load_kms+0x41/0x178 [amdgpu] 4,863,5418813,-;
> >> amdgpu_pci_probe+0x147/0x1c7 [amdgpu] 4,864,5418818,-;
> >> pci_device_probe+0xc6/0x135 4,865,5418822,-;
> >> really_probe+0x157/0x2d1 4,866,5418825,-;
> >> driver_probe_device+0x97/0xcc 4,867,5418828,-;
> >> device_driver_attach+0x37/0x50 4,868,5418830,-;
> >> __driver_attach+0x92/0x9a 4,869,5418833,-; ?
> >> device_driver_attach+0x50/0x50 4,870,5418835,-;
> >> bus_for_each_dev+0x70/0xa6 4,871,5418838,-;
> >> bus_add_driver+0x103/0x1b4 4,872,5418840,-;
> >> driver_register+0x99/0xd2 4,873,5418842,-; ? 0xffffffffa09dc000
> >> 4,874,5418846,-; do_one_initcall+0x8a/0x195 4,875,5418849,-; ?
> >> kmem_cache_alloc_trace+0x84/0x93 4,876,5418852,-;
> >> do_init_module+0x56/0x1df 4,877,5418855,-;
> >> load_module+0x1bf2/0x2107 4,878,5418858,-; ?
> >> __do_sys_finit_module+0x8f/0xb6 4,879,5418860,-;
> >> __do_sys_finit_module+0x8f/0xb6 4,880,5418863,-;
> >> do_syscall_64+0x72/0x7f 4,881,5418867,-;
> >> entry_SYSCALL_64_after_hwframe+0x44/0xa9
> >> 4,882,5418870,-;RIP: 0033:0x7f750dc4d919
> >> 4,883,5418873,-;Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44
> >> 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b
> >> 4c
> >> 24 08 0f 05 <48> 3d 01
> >> f0 ff ff 73 01 c3 48 8b 0d 47 05 0c 00 f7 d8 64 89 01 48
> >> 4,884,5418878,-;RSP: 002b:00007fff47b3ce28 EFLAGS: 00000246
> >> ORIG_RAX: 0000000000000139
> >> 4,885,5418881,-;RAX: ffffffffffffffda RBX: 0000564d79f6cab0 RCX:
> >> 00007f750dc4d919
> >> 4,886,5418883,-;RDX: 0000000000000000 RSI: 0000564d79f4bf30 RDI:
> >> 000000000000000d
> >> 4,887,5418886,-;RBP: 0000000000020000 R08: 0000000000000000 R09:
> >> 00007fff47b3cf90
> >> 4,888,5418888,-;R10: 000000000000000d R11: 0000000000000246 R12:
> >> 0000564d79f4bf30
> >> 4,889,5418890,-;R13: 0000000000000000 R14: 0000564d79f4bc40 R15:
> >> 0000564d79f6cab0 4,890,5418893,-;Modules linked in:
> >> snd_hda_codec_realtek(+) wmi_bmof
> >> iwlwifi(+) snd_hda_codec_generic snd_hda_codec_hdmi amdgpu(+)
> >> snd_hda_intel cfg80211 snd_i ntel_dspcfg snd_hda_codec gpu_sched
> >> aesni_intel(+) ttm ccp snd_hda_core sdhci_pci tpm_crb rng_core
> >> snd_pcm cqhci sdhci xhci_pci mmc_core drm_kms_helper sha1_ge neric
> >> snd_timer xhci_hcd thinkpad_acpi(+) i2c_piix4 nvram snd soundcore
> >> battery ledtrig_audio rfkill ac video tpm_tis tpm_tis_core tpm wmi
> >> acpi_cpufreq pinctrl _amd button efivarfs
> >> 4,891,5418914,-;CR2: 0000000000000008 4,892,5418917,-;---[ end
> >> trace 3112fb5c01e68aa6 ]---
> >> 4,893,5418967,-;RIP: 0010:nbio_v7_0_get_rev_id+0x9/0x1b [amdgpu]
> >> 4,894,5418970,-;Code: 5d 41 5d 41 5e e9 9a f0 f9 ff 48 8b 87 e8 5f
> >> 01 00 31 d2 8b 70 08 81 c6 c3 00 00 00 e9 9d ef f9 ff 48 8b 87 e8
> >> 5f
> >> 01 00 31 d2 <8b> 70 08 83 c6 0f e8 89 ef f9 ff c1 e8 18 83 e0 0f c3
> >> 49 89 f8 48
> >> 4,895,5418974,-;RSP: 0018:ffffc900011dba90 EFLAGS: 00010246
> >> 4,896,5418976,-;RAX: 0000000000000000 RBX: 0000000fffffffe0 RCX:
> >> 0000000000000018
> >> 4,897,5418979,-;RDX: 0000000000000000 RSI: ffffffffa0970e20 RDI:
> >> ffff8883f5540000
> >> 4,898,5418981,-;RBP: ffff8883f5540000 R08: 0000000000000001 R09:
> >> 0000000000000000
> >> 4,899,5418983,-;R10: 0000000000000000 R11: 0000000000000048 R12:
> >> 00000000ffffffea
> >> 4,900,5418985,-;R13: 7fffffffffffffff R14: ffff8883f9486800 R15:
> >> ffffc900011dbe98
> >> 4,901,5418988,-;FS:  00007f750db3dd80(0000)
> >> GS:ffff88840ecc0000(0000) knlGS:0000000000000000
> >> 4,902,5418990,-;CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> >> 4,903,5418992,-;CR2: 0000000000000008 CR3: 00000003f9728000 CR4:
> >> 0000000000340ee0
> >> 28,904,5419847,-;udevd[689]: worker [744] terminated by signal 9
> >> (Killed)
> >> 27,905,5419862,-;udevd[689]: worker [744] failed while handling '/devices/pci0000:00/0000:00:08.1/0000:06:00.0'
> >>
> >>
> >> > Dirk
> >> >
> >> >>
> >> >> Alex
> >> >>
> >> >>
> >> >>>
> >> >>> Dirk
> >> >>>
> >> >>> = bisect log
> >> >>> ===========================================================
> >> >>> git bisect start
> >> >>> # bad: [9123e3a74ec7b934a4a099e98af6a61c2f80bbf5] Linux 5.9-rc1
> >> >>> git bisect bad 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5
> >> >>> # good: [bcf876870b95592b52519ed4aafcf9d95999bc9c] Linux 5.8
> >> >>> git bisect good bcf876870b95592b52519ed4aafcf9d95999bc9c
> >> >>> # bad: [8186749621ed6b8fc42644c399e8c755a2b6f630] Merge tag
> >> >>> 'drm-next-2020-08-06' of git://anongit.freedesktop.org/drm/drm
> >> >>> git bisect bad 8186749621ed6b8fc42644c399e8c755a2b6f630
> >> >>> # good: [2324d50d051ec0f14a548e78554fb02513d6dcef] Merge tag
> >> >>> 'docs-5.9' of git://git.lwn.net/linux git bisect good
> >> >>> 2324d50d051ec0f14a548e78554fb02513d6dcef
> >> >>> # bad: [54d44bfc56308d105b0da37392d8398bdc9d4745] drm/nouveau/nvif:
> >> >>> give every disp object a human-readable identifier git bisect
> >> >>> bad 54d44bfc56308d105b0da37392d8398bdc9d4745
> >> >>> # bad: [9555152beb1143c85c03f9b9de59863cbbe89f4b] Merge tag
> >> >>> 'amd-drm-next-5.9-2020-07-01' of
> >> >>> git://people.freedesktop.org/~agd5f/linux into drm-next git
> >> >>> bisect bad 9555152beb1143c85c03f9b9de59863cbbe89f4b
> >> >>> # bad: [dfd991794685b1228387214f28630b6e94e56944] drm/amd/display: Not doing bios data pack.
> >> >>> git bisect bad dfd991794685b1228387214f28630b6e94e56944
> >> >>> # good: [ba806f98f868ce107aa9c453fef751de9980e4af] drm/radeon:
> >> >>> disable AGP by default git bisect good
> >> >>> ba806f98f868ce107aa9c453fef751de9980e4af
> >> >>> # good: [97d798b276e94a366dfb03d62bc90d4742ab3a31] drm/amdgpu:
> >> >>> simplify ATIF backlight handling git bisect good
> >> >>> 97d798b276e94a366dfb03d62bc90d4742ab3a31
> >> >>> # good: [ac4e189a5623579c023c9cf8006422aef2a487b4]
> >> >>> drm/amdgpu/gfx10: add navi12 to gfxoff case git bisect good
> >> >>> ac4e189a5623579c023c9cf8006422aef2a487b4
> >> >>> # good: [70534d1ee89ceadd03292d0c2da4dd4020189678] drm/amdgpu:
> >> >>> simplify raven and renoir checks git bisect good
> >> >>> 70534d1ee89ceadd03292d0c2da4dd4020189678
> >> >>> # good: [4541ea81edde6ce9a1d9be082489aca7e8e7e1dc]
> >> >>> drm/[radeon|amdgpu]: Replace one-element array and use
> >> >>> struct_size() helper git bisect good
> >> >>> 4541ea81edde6ce9a1d9be082489aca7e8e7e1dc
> >> >>> # good: [84034ad4c0c0813c1350b43087eed036066edd5a]
> >> >>> drm/amd/display: combine public interfaces into single header
> >> >>> git bisect good 84034ad4c0c0813c1350b43087eed036066edd5a
> >> >>> # good: [4f1fad0e9dbd762497df7c79309697ed8b2b6cfc]
> >> >>> drm/amd/powerplay: stop thermal IRQs on suspend git bisect good
> >> >>> 4f1fad0e9dbd762497df7c79309697ed8b2b6cfc
> >> >>> # good: [4292b0b2026bc10bced32636ea02dd8eed00cea9] drm/amdgpu:
> >> >>> clean up discovery testing git bisect good
> >> >>> 4292b0b2026bc10bced32636ea02dd8eed00cea9
> >> >>> # bad: [c0838cbee2d05c3eb8a2b5a3d1ce706a73008044] drm/amd/display: Revert "enable plane if plane_status changed"
> >> >>> git bisect bad c0838cbee2d05c3eb8a2b5a3d1ce706a73008044
> >> >>> # bad: [651a146526a04993c5bebf0e19cd9256f5e6511d]
> >> >>> drm/amdgpu/jpeg: fix race condition issue for jpeg start git
> >> >>> bisect bad 651a146526a04993c5bebf0e19cd9256f5e6511d
> >> >>> # bad: [3bda8acd974e362069e291a78c59a10624debc6e]
> >> >>> drm/amdgpu/sriov: Add clear vf fw support git bisect bad
> >> >>> 3bda8acd974e362069e291a78c59a10624debc6e
> >> >>> # bad: [b6df946ef4b5ae29183b2fdb2d12c381c757b3fb] drm/amdgpu:
> >> >>> fix the nullptr issue as for PWR IP not existing in discovery
> >> >>> table git bisect bad b6df946ef4b5ae29183b2fdb2d12c381c757b3fb
> >> >>> ===============================================================
> >> >>> =========
> >> >>>
> >> >>>
> >> >>> > Please let me know if I can help with further information.
> >> >>> >
> >> >>> > Dirk
> >> >>> >
> >> >>> > = lspci -vk
> >> >>> > ============================================================
> >> >>> >
> >> >>> > 06:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] Renoir (rev c3) (prog-if 00 [VGA controller])
> >> >>> >         Subsystem: Lenovo Renoir
> >> >>> >         Flags: bus master, fast devsel, latency 0, IRQ 64
> >> >>> >         Memory at 460000000 (64-bit, prefetchable) [size=256M]
> >> >>> >         Memory at 470000000 (64-bit, prefetchable) [size=2M]
> >> >>> >         I/O ports at 1000 [size=256]
> >> >>> >         Memory at fd300000 (32-bit, non-prefetchable) [size=512K]
> >> >>> >         Capabilities: [48] Vendor Specific Information: Len=08 <?>
> >> >>> >         Capabilities: [50] Power Management version 3
> >> >>> >         Capabilities: [64] Express Legacy Endpoint, MSI 00
> >> >>> >         Capabilities: [a0] MSI: Enable- Count=1/4 Maskable- 64bit+
> >> >>> >         Capabilities: [c0] MSI-X: Enable+ Count=4 Masked-
> >> >>> >         Capabilities: [100] Vendor Specific Information: ID=0001 Rev=1 Len=010 <?>
> >> >>> >         Capabilities: [270] Secondary PCI Express
> >> >>> >         Capabilities: [2b0] Address Translation Service (ATS)
> >> >>> >         Capabilities: [2c0] Page Request Interface (PRI)
> >> >>> >         Capabilities: [2d0] Process Address Space ID (PASID)
> >> >>> >         Capabilities: [400] Data Link Feature <?>
> >> >>> >         Capabilities: [410] Physical Layer 16.0 GT/s <?>
> >> >>> >         Capabilities: [440] Lane Margining at the Receiver <?>
> >> >>> >         Kernel driver in use: amdgpu
> >> >>> >         Kernel modules: amdgpu
> >> >>> >
> >> >>> > = call trace
> >> >>> > ===========================================================
> >> >>> >
> >> >>> > [    5.181468] amdgpu 0000:06:00.0: amdgpu: SMU is initialized successfully!
> >> >>> > [    5.182857] [drm] kiq ring mec 2 pipe 1 q 0
> >> >>> > [    5.183374] ------------[ cut here ]------------
> >> >>> > [    5.183448] WARNING: CPU: 1 PID: 684 at drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn21/rn_clk_mgr.c:716 rn_clk_mgr_construct+0x242/0x389 [amdgpu]
> >> >>> > [    5.183449] Modules linked in: btusb btrtl btbcm btintel bluetooth ecdh_generic ecc iwlmvm mac80211 libarc4 wmi_bmof crct10dif_pclmul snd_hda_codec_realtek
> >> >>> > crc32c_intel iwlwifi snd_hda_codec_generic amdgpu(+) tpm_crb
> >> >>> > snd_hda_codec_hdmi gpu_sched i2c_algo_bit ttm sdhci_pci
> >> >>> > aesni_intel drm_kms_helper cqhci sdhci ccp  syscopyarea
> >> >>> > snd_hda_intel sysfillrect tpm_tis snd_intel_dspcfg sysimgblt xhci_pci tpm_tis_core fb_sys_fops r8169 snd_hda_codec mmc_core snd_hda_core xhci_hcd thinkpad_acpi cfg80211 realtek drm snd_pcm rng_core mdio_devres sha1_generic snd_timer nvram libphy i2c_piix4 snd k10temp soundcore ledtrig_audio rfkill tpm hw mon wmi battery ac video backlight pinctrl_amd acpi_cpufreq button efivarfs
> >> >>> > [    5.183470] CPU: 1 PID: 684 Comm: udevd Not tainted 5.9.0-rc6-x86_64+ #170
> >> >>> > [    5.183471] Hardware name: LENOVO 20U50008GE/20U50008GE, BIOS R19ET26W (1.10 ) 06/22/2020
> >> >>> > [    5.183531] RIP: 0010:rn_clk_mgr_construct+0x242/0x389 [amdgpu]
> >> >>> > [    5.183533] Code: 30 4d 85 c9 74 26 ba 03 00 00 00 83 bc d4 a8 00 00 00 00 89 d6 74 0a 83 bc d4 ac 00 00 00 00 75 40 48 ff ca 48 83 fa ff 75 e1 <0f> 0b 83 7
> >> >>> > b 20 01 0f 84 13 01 00 00 81 bd e8 00 00 00 ff 14 37 00
> >> >>> > [    5.183533] RSP: 0018:ffffc9000111f798 EFLAGS: 00010246
> >> >>> > [    5.183534] RAX: ffff8883fc1d8e00 RBX: ffff8883f925c9c0 RCX: 0000000000000000
> >> >>> > [    5.183535] RDX: ffffffffffffffff RSI: 0000000000000000 RDI: ffff8883f8da70c8
> >> >>> > [    5.183535] RBP: ffff8883fe8da000 R08: 0000000000000000 R09: ffff8883f724fc00
> >> >>> > [    5.183535] R10: 7fc9117fffffffff R11: ffff8883f925c9c0 R12: ffff8883f925c900
> >> >>> > [    5.183536] R13: ffff8883f5980000 R14: 0000000000000000 R15: 0000000000000001
> >> >>> > [    5.183537] FS:  00007f9e31a83d80(0000) GS:ffff88840ec40000(0000) knlGS:0000000000000000
> >> >>> > [    5.183537] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> >> >>> > [    5.183538] CR2: 000055fdf9ec5568 CR3: 00000003fb2b6000 CR4: 0000000000350ee0
> >> >>> > [    5.183538] Call Trace:
> >> >>> > [    5.183595]  dc_clk_mgr_create+0x135/0x18b [amdgpu]
> >> >>> > [    5.183651]  dc_create+0x238/0x5e3 [amdgpu]
> >> >>> > [    5.183708]  amdgpu_dm_init+0x167/0x1101 [amdgpu]
> >> >>> > [    5.183762]  dm_hw_init+0xa/0x17 [amdgpu]
> >> >>> > [    5.183805]  amdgpu_device_init+0x1566/0x1853 [amdgpu]
> >> >>> > [    5.183811]  ? __kmalloc+0xad/0xbf
> >> >>> > [    5.183852]  ? amdgpu_driver_load_kms+0x1c/0x17f [amdgpu]
> >> >>> > [    5.183892]  amdgpu_driver_load_kms+0x41/0x17f [amdgpu]
> >> >>> > [    5.183959]  amdgpu_pci_probe+0x139/0x1c0 [amdgpu]
> >> >>> > [    5.183967]  pci_device_probe+0xc6/0x135
> >> >>> > [    5.183971]  really_probe+0x157/0x32a
> >> >>> > [    5.183974]  driver_probe_device+0x63/0x97
> >> >>> > [    5.183976]  device_driver_attach+0x37/0x50
> >> >>> > [    5.183978]  __driver_attach+0x92/0x9a
> >> >>> > [    5.183980]  ? device_driver_attach+0x50/0x50
> >> >>> > [    5.183983]  bus_for_each_dev+0x70/0xa6
> >> >>> > [    5.183986]  bus_add_driver+0x103/0x1b4
> >> >>> > [    5.183988]  driver_register+0x99/0xd2
> >> >>> > [    5.183990]  ? 0xffffffffa0b2f000
> >> >>> > [    5.183993]  do_one_initcall+0x8a/0x195
> >> >>> > [    5.183997]  ? kmem_cache_alloc_trace+0x80/0x8f
> >> >>> > [    5.184002]  do_init_module+0x56/0x1e8
> >> >>> > [    5.184005]  load_module+0x1c2c/0x2139
> >> >>> > [    5.184010]  ? __do_sys_finit_module+0x8f/0xb6
> >> >>> > [    5.184012]  __do_sys_finit_module+0x8f/0xb6
> >> >>> > [    5.184017]  do_syscall_64+0x5d/0x6a
> >> >>> > [    5.184021]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> >> >>> > [    5.184023] RIP: 0033:0x7f9e31b93919
> >> >>> > [    5.184026] Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 47 05 0c 00 f7 d8 64 89 01 48
> >> >>> > [    5.184028] RSP: 002b:00007fff315a0fa8 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
> >> >>> > [    5.184030] RAX: ffffffffffffffda RBX: 000055fdf9eebde0 RCX: 00007f9e31b93919
> >> >>> > [    5.184031] RDX: 0000000000000000 RSI: 00007f9e31c6a91d RDI: 0000000000000013
> >> >>> > [    5.184032] RBP: 0000000000020000 R08: 0000000000000000 R09: 00007fff315a1110
> >> >>> > [    5.184033] R10: 0000000000000013 R11: 0000000000000246 R12: 00007f9e31c6a91d
> >> >>> > [    5.184034] R13: 0000000000000000 R14: 000055fdf9ed8060 R15: 000055fdf9eebde0
> >> >>> > [    5.184037] ---[ end trace a782862b8da91b8d ]---
> >> >>> _______________________________________________
> >> >>> amd-gfx mailing list
> >> >>> amd-gfx@lists.freedesktop.org
> >> >>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F
> >> >>> %2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;dat
> >> >>> a=02%7C01%7CEvan.Quan%40amd.com%7C5b4c21afeec94502335908d864806
> >> >>> f69%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C63736985007907
> >> >>> 3128&amp;sdata=yxfuY69Asx%2FaV4sTJawgj9BjmdwDzdRXKw5UItZlHmo%3D
> >> >>> &amp;reserved=0
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
