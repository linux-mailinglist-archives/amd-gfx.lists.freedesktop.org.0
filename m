Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C90295F69
	for <lists+amd-gfx@lfdr.de>; Thu, 22 Oct 2020 15:10:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8B276E1BB;
	Thu, 22 Oct 2020 13:10:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7145B6E1F8
 for <amd-gfx@lists.freedesktop.org>; Thu, 22 Oct 2020 13:10:01 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id y12so2321299wrp.6
 for <amd-gfx@lists.freedesktop.org>; Thu, 22 Oct 2020 06:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=40DYRYMfgzrsy1TMtGmacDBn/vNblsFfZiDMjTT5Fmg=;
 b=lmUUo5xC2AemmOL/3VYrgNTQZQiRpwL6im4EAf+M9qq8S8Crjofs7zfnEZ9mSi+Cgc
 NgDQYdC+joNmv5serev8uEjR/j1/UtSBaR7h3Ri3lAff/MpsIEmUJkRBLF+0A+gKIVQJ
 /07mElyshTdNMDHJZe1RRdz8bUtvS1L4fzMV8lE+XDLsuthyOn+7rYJUq3mVRp4vUB5t
 jC259tEDKhPmYQ3oxF74y89bizCG3gi8WUzG9gyUqEavvuW67ESUkYxfREdDdxAkdkym
 5fVJI6GezftX2QowVwuVU8NbdjLitvBxc+Ox//H9u13DNczr1rn8X4tAbC0/ogI0DueQ
 4P+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=40DYRYMfgzrsy1TMtGmacDBn/vNblsFfZiDMjTT5Fmg=;
 b=eA5QskGMwDpq/49GCgUlGpDyrsJpJSuNBW2sOnN9ujWh//QeqCkGbUIT35O4XI2PXE
 qGbWZ1Ou0yUlcNyzKp37JOwpx9yeExg+JXJRUjWFIsJNcPwvZXLaX8jEcWpV7mFrxWVq
 UBtWnavxAiPjgOar2JqnfCWzseQHNWiy47jaUkZBlztd+8j8zwQmIKWDhAps5xe3l1Zn
 PIFylq0RbALS3/+vIwmCMKXq9i1Sgk1sUidCU6C2ph1otbYS+okHwZPzm+q4aNBKDN5S
 vSUqAq34kSoim+0tXd7+0E2MyoYX1xFgihfeb0i1VAPiZrqUTKOw36DVTGVB2V4s9hdx
 zGCA==
X-Gm-Message-State: AOAM5309Ov4gp0lS6cQLjNRkoFlr9l/DQdNloJuZ7gdArqRABLbVSIfp
 LcT1+IswBjJizoRpy+G8z9yfTWbJAQ7EOWHOSSE=
X-Google-Smtp-Source: ABdhPJzUj8H/HnOJj7H9Kdx7QzospmE4ctW0poLw2wJZc8fVTrfqtg/EXLEUM59Rvm+ppFT4jE1gZKq5q5Hm01/npuo=
X-Received: by 2002:adf:dd8f:: with SMTP id x15mr2865308wrl.124.1603372199935; 
 Thu, 22 Oct 2020 06:09:59 -0700 (PDT)
MIME-Version: 1.0
References: <20201021064455.14935-1-kenneth.feng@amd.com>
 <CADnq5_PdS8M3i9uQ3JTUE-idGJxVCk_k5N=Sgvsj4VJGFKn_vA@mail.gmail.com>
 <CADnq5_NLyQ2jOW0ZkYMXcAX-snqHvUzNRYtrDRZbhN7qe0_5Zg@mail.gmail.com>
 <CADnq5_M_ry9EHp2b1ycBzD4oTsfVJxFtSGoRvq2EfJiN6Qczmg@mail.gmail.com>
 <DM5PR12MB16579B5849FB6719ADFE7C2D8E1D0@DM5PR12MB1657.namprd12.prod.outlook.com>
 <DM5PR12MB1657C41033410DB1F57995F28E1D0@DM5PR12MB1657.namprd12.prod.outlook.com>
 <CADnq5_MR3O_T-jSziUMdJWU=eipX+55Km3WSLzP9+Eudygayvg@mail.gmail.com>
 <DM5PR12MB165756ABF941252F123C03BD8E1D0@DM5PR12MB1657.namprd12.prod.outlook.com>
 <CADnq5_M6V=-YDX5QJp-HEA2k=5HPh57zyj8tr+oVXgOo_sQUcg@mail.gmail.com>
 <DM5PR12MB1657848807541F7E6214AC3D8E1D0@DM5PR12MB1657.namprd12.prod.outlook.com>
 <CADnq5_PhA1bJp-3Pctjn_L9=TFU=y_Kuw7Sz42Tcdv1VoiUz8Q@mail.gmail.com>
 <CADnq5_OjACqye7L_EdbYusTTmT5oTHmMctOr0ubyHm6PtuhT5g@mail.gmail.com>
 <CADnq5_Ms5GDsOiqMRWcimgTGJzZaBWjnVf2zcFLeX0xPRZbCww@mail.gmail.com>
 <DM5PR12MB165725B0FC52EA5F5BBD1BFB8E1D0@DM5PR12MB1657.namprd12.prod.outlook.com>
In-Reply-To: <DM5PR12MB165725B0FC52EA5F5BBD1BFB8E1D0@DM5PR12MB1657.namprd12.prod.outlook.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 22 Oct 2020 09:09:48 -0400
Message-ID: <CADnq5_PJAhNM27Qqn12E2RNCc=d7kdi6ynwxqm1m+rQHj=Za_Q@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: fix the wrong fan speed in fan1_input
To: "Feng, Kenneth" <Kenneth.Feng@amd.com>
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
Cc: "Gao, Likun" <Likun.Gao@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Thu, Oct 22, 2020 at 2:10 AM Feng, Kenneth <Kenneth.Feng@amd.com> wrote:
>
> [AMD Official Use Only - Internal Distribution Only]
>
> Hi Alex,
> As I confirmed, this is Arcturus specific.
> On Arcturus we don't have fan control feature and the fan speed is always 0 from the metrics table.
> For navi series, I'm sure we don't need it. Looks like we can't just revert it.

Ok, I guess we can just do a partial revert then.

Alex


> Thanks.
>
>
>
> -----Original Message-----
> From: Alex Deucher <alexdeucher@gmail.com>
> Sent: Thursday, October 22, 2020 1:19 PM
> To: Feng, Kenneth <Kenneth.Feng@amd.com>
> Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>; Gao, Likun <Likun.Gao@amd.com>
> Subject: Re: [PATCH] drm/amd/pm: fix the wrong fan speed in fan1_input
>
> [CAUTION: External Email]
>
> On Thu, Oct 22, 2020 at 1:06 AM Alex Deucher <alexdeucher@gmail.com> wrote:
> >
> > On Thu, Oct 22, 2020 at 1:05 AM Alex Deucher <alexdeucher@gmail.com> wrote:
> > >
> > > On Thu, Oct 22, 2020 at 1:01 AM Feng, Kenneth <Kenneth.Feng@amd.com> wrote:
> > > >
> > > > [AMD Official Use Only - Internal Distribution Only]
> > > >
> > > > Hi Alex,
> > > > The speed is not 0 in the below scenario if the rpm is got from the metrics table on navi10.
> > > > The possibility is that you were using an old firmware. The
> > > > firmware on my system is 0x002a3e00 Can you remember the version when you saw the problem?
> > >
> > > SMC feature version: 0, firmware version: 0x002a3600
> >
> > Actually, I'm not sure.  It might have been updated since the last
> > time I tested this.
>
> If you can confirm it's working on all the asics with the latest firmware, maybe it makes more sense to just revert this commit:
>
> commit 3033e9f1c2de0eca89e9a98c7e307820f3fc953e
> Author: Alex Deucher <alexander.deucher@amd.com>
> Date:   Thu Aug 27 00:12:38 2020 -0400
>
>     drm/amdgpu/swsmu: handle manual fan readback on SMU11
>
>     Need to read back from registers for manual mode rather than
>     using the metrics table.
>
>     Bug: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fdrm%2Famd%2F-%2Fissues%2F1164&amp;data=04%7C01%7CKenneth.Feng%40amd.com%7C7b20871a843e41a5038408d8764a0d51%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637389407704795887%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=2jEFoU62zbGIwEACv3C6xAmyNgIQ4q1kbBfNQ3Ztm7E%3D&amp;reserved=0
>     Reviewed-by: Evan Quan <evan.quan@amd.com>
>     Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>
> Alex
>
> >
> > Alex
> >
> >
> > >
> > > Alex
> > >
> > > > Thanks.
> > > > # echo 1 >
> > > > devices/pci0000:00/0000:00:01.1/0000:02:00.0/0000:03:00.0/0000:04:
> > > > 00.0/hwmon/hwmon3/pwm1_enable # echo 125 >
> > > > devices/pci0000:00/0000:00:01.1/0000:02:00.0/0000:03:00.0/0000:04:
> > > > 00.0/hwmon/hwmon3/pwm1 # cat
> > > > devices/pci0000:00/0000:00:01.1/0000:02:00.0/0000:03:00.0/0000:04:
> > > > 00.0/hwmon/hwmon3/pwm1
> > > > 109
> > > >
> > > >
> > > >
> > > >
> > > >
> > > >
> > > > -----Original Message-----
> > > > From: Alex Deucher <alexdeucher@gmail.com>
> > > > Sent: Thursday, October 22, 2020 11:28 AM
> > > > To: Feng, Kenneth <Kenneth.Feng@amd.com>
> > > > Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>; Gao, Likun
> > > > <Likun.Gao@amd.com>
> > > > Subject: Re: [PATCH] drm/amd/pm: fix the wrong fan speed in
> > > > fan1_input
> > > >
> > > > [CAUTION: External Email]
> > > >
> > > > On Wed, Oct 21, 2020 at 11:16 PM Feng, Kenneth <Kenneth.Feng@amd.com> wrote:
> > > > >
> > > > > [AMD Official Use Only - Internal Distribution Only]
> > > > >
> > > > > Hi Alex,
> > > > > After reboot, It is also not read back correctly as below.
> > > > > # echo 1 >
> > > > > devices/pci0000:00/0000:00:01.1/0000:02:00.0/0000:03:00.0/0000:0
> > > > > 4:00.0 /hwmon/hwmon3/fan1_enable s# cat
> > > > > devices/pci0000:00/0000:00:01.1/0000:02:00.0/0000:03:00.0/0000:0
> > > > > 4:00.0
> > > > > /hwmon/hwmon3/fan1_input
> > > > > 183105
> > > > > # cat
> > > > > devices/pci0000:00/0000:00:01.1/0000:02:00.0/0000:03:00.0/0000:0
> > > > > 4:00.0
> > > > > /hwmon/hwmon3/fan1_enable
> > > > > 1
> > > > >
> > > >
> > > > What about if you manually set the speed.  E.g., # echo 1 >
> > > > devices/pci0000:00/0000:00:01.1/0000:02:00.0/0000:03:00.0/0000:04:
> > > > 00.0/hwmon/hwmon3/fan1_enable # echo 800 >
> > > > devices/pci0000:00/0000:00:01.1/0000:02:00.0/0000:03:00.0/0000:04:
> > > > 00.0/hwmon/hwmon3/fan1_target # cat
> > > > devices/pci0000:00/0000:00:01.1/0000:02:00.0/0000:03:00.0/0000:04:
> > > > 00.0/hwmon/hwmon3/fan1_input
> > > >
> > > > The problem I ran into on navi1x was setting the fan speed
> > > > manually resulted in 0 for the fan speed in the metrics table.
> > > > E.g.,
> > > >
> > > > # echo 1 >
> > > > devices/pci0000:00/0000:00:01.1/0000:02:00.0/0000:03:00.0/0000:04:
> > > > 00.0/hwmon/hwmon3/pwm1_enable # echo 125 >
> > > > devices/pci0000:00/0000:00:01.1/0000:02:00.0/0000:03:00.0/0000:04:
> > > > 00.0/hwmon/hwmon3/pwm1 # cat
> > > > devices/pci0000:00/0000:00:01.1/0000:02:00.0/0000:03:00.0/0000:04:
> > > > 00.0/hwmon/hwmon3/pwm
> > > >
> > > > See:
> > > > https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2F
> > > > gitlab.freedesktop.org%2Fdrm%2Famd%2F-%2Fissues%2F1164&amp;data=04
> > > > %7C01%7CKenneth.Feng%40amd.com%7C7b20871a843e41a5038408d8764a0d51%
> > > > 7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637389407704795887%7C
> > > > Unknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6
> > > > Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=2jEFoU62zbGIwEACv3C6xAmyNg
> > > > IQ4q1kbBfNQ3Ztm7E%3D&amp;reserved=0
> > > >
> > > > Alex
> > > >
> > > >
> > > > >
> > > > >
> > > > > -----Original Message-----
> > > > > From: Alex Deucher <alexdeucher@gmail.com>
> > > > > Sent: Thursday, October 22, 2020 10:18 AM
> > > > > To: Feng, Kenneth <Kenneth.Feng@amd.com>
> > > > > Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>; Gao, Likun
> > > > > <Likun.Gao@amd.com>
> > > > > Subject: Re: [PATCH] drm/amd/pm: fix the wrong fan speed in
> > > > > fan1_input
> > > > >
> > > > > [CAUTION: External Email]
> > > > >
> > > > > On Wed, Oct 21, 2020 at 9:30 PM Feng, Kenneth <Kenneth.Feng@amd.com> wrote:
> > > > > >
> > > > > > [AMD Official Use Only - Internal Distribution Only]
> > > > > >
> > > > > > Hi Alex,
> > > > > > Navi10 also has this problem as below.
> > > > > > # cat
> > > > > > devices/pci0000:00/0000:00:01.1/0000:02:00.0/0000:03:00.0/0000
> > > > > > :04:00
> > > > > > .0
> > > > > > /hwmon/hwmon3/fan1_input
> > > > > > 1217
> > > > > > # cat
> > > > > > devices/pci0000:00/0000:00:01.1/0000:02:00.0/0000:03:00.0/0000
> > > > > > :04:00
> > > > > > .0
> > > > > > /hwmon/hwmon3/fan1_enable
> > > > > > 0
> > > > > > # echo 1 >
> > > > > > devices/pci0000:00/0000:00:01.1/0000:02:00.0/0000:03:00.0/0000
> > > > > > :04:00
> > > > > > .0
> > > > > > /hwmon/hwmon3/fan1_enable # cat
> > > > > > devices/pci0000:00/0000:00:01.1/0000:02:00.0/0000:03:00.0/0000
> > > > > > :04:00
> > > > > > .0
> > > > > > /hwmon/hwmon3/fan1_enable
> > > > > > 1
> > > > > > s# cat
> > > > > > devices/pci0000:00/0000:00:01.1/0000:02:00.0/0000:03:00.0/0000
> > > > > > :04:00
> > > > > > .0
> > > > > > /hwmon/hwmon3/fan1_input
> > > > > > 183105
> > > > > >
> > > > > > In AGM, the rpm is 1800.
> > > > >
> > > > > Does it read back correctly if you manually set the fan rpm first before reading it back?
> > > > >
> > > > > Alex
> > > > >
> > > > >
> > > > > >
> > > > > >
> > > > > >
> > > > > > -----Original Message-----
> > > > > > From: Feng, Kenneth
> > > > > > Sent: Thursday, October 22, 2020 9:11 AM
> > > > > > To: Alex Deucher <alexdeucher@gmail.com>
> > > > > > Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>; Gao, Likun
> > > > > > <Likun.Gao@amd.com>
> > > > > > Subject: RE: [PATCH] drm/amd/pm: fix the wrong fan speed in
> > > > > > fan1_input
> > > > > >
> > > > > > [AMD Official Use Only - Internal Distribution Only]
> > > > > >
> > > > > > Hi Alex,
> > > > > > Right, smu_v11_0_get_fan_speed_rpm() is not correct for sienna cichlid when it's in manual mode.
> > > > > > An example is that in my system, the rpm is about 1800 in manual mode, confirmed with AGM and the internal smu fw scoreboard.
> > > > > > But the fan1_input shows about 180000, which is way more than the real value.
> > > > > > If you see the value from the metrics table is 0 on navi10, maybe it's the real rpm since we still have 0 rpm feature.
> > > > > > I can double check the navi10.
> > > > > > Thanks.
> > > > > >
> > > > > >
> > > > > > -----Original Message-----
> > > > > > From: Alex Deucher <alexdeucher@gmail.com>
> > > > > > Sent: Thursday, October 22, 2020 2:47 AM
> > > > > > To: Feng, Kenneth <Kenneth.Feng@amd.com>
> > > > > > Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>; Gao, Likun
> > > > > > <Likun.Gao@amd.com>
> > > > > > Subject: Re: [PATCH] drm/amd/pm: fix the wrong fan speed in
> > > > > > fan1_input
> > > > > >
> > > > > > [CAUTION: External Email]
> > > > > >
> > > > > > On Wed, Oct 21, 2020 at 9:40 AM Alex Deucher <alexdeucher@gmail.com> wrote:
> > > > > > >
> > > > > > > On Wed, Oct 21, 2020 at 9:01 AM Alex Deucher <alexdeucher@gmail.com> wrote:
> > > > > > > >
> > > > > > > > On Wed, Oct 21, 2020 at 2:45 AM Kenneth Feng <kenneth.feng@amd.com> wrote:
> > > > > > > > >
> > > > > > > > > fix the wrong fan speed in fan1_input when the fan control mode is manual.
> > > > > > > > > the fan speed value is not correct when we set manual mode to fan1_enalbe - 1.
> > > > > > > > > since the fan speed in the metrics table always reflects
> > > > > > > > > the real fan speed,we can fetch the fan speed for both auto and manual mode.
> > > > > > > > >
> > > > > > > > > Signed-off-by: Kenneth Feng <kenneth.feng@amd.com>
> > > > > > > >
> > > > > > > > NACK.  At least on the navi boards I have, the metrics
> > > > > > > > table fan speed reads back 0 when the fan is in manual
> > > > > > > > mode.  That's why I changed this in the first place.
> > > > > > >
> > > > > > > Nevermind, I was thinking about navi1x.  If this is working
> > > > > > > correctly on sienna cichlid, please ignore me.
> > > > > >
> > > > > > That said, I don't see why the current code should not work.  Maybe a bug elsewhere?  Is smu_v11_0_get_fan_speed_rpm() incorrect for sienna cichlid?
> > > > > >
> > > > > > Alex
> > > > > >
> > > > > > >
> > > > > > > Alex
> > > > > > >
> > > > > > >
> > > > > > > >
> > > > > > > > Alex
> > > > > > > >
> > > > > > > >
> > > > > > > > > ---
> > > > > > > > >  .../gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c   | 11 +++--------
> > > > > > > > >  1 file changed, 3 insertions(+), 8 deletions(-)
> > > > > > > > >
> > > > > > > > > diff --git
> > > > > > > > > a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.
> > > > > > > > > c
> > > > > > > > > b/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.
> > > > > > > > > c index 496abc31b07e..27b6cade9ade 100644
> > > > > > > > > ---
> > > > > > > > > a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.
> > > > > > > > > c
> > > > > > > > > +++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_
> > > > > > > > > +++ ppt.c
> > > > > > > > > @@ -1171,14 +1171,9 @@ static int sienna_cichlid_get_fan_speed_rpm(struct smu_context *smu,
> > > > > > > > >         if (!speed)
> > > > > > > > >                 return -EINVAL;
> > > > > > > > >
> > > > > > > > > -       switch (smu_v11_0_get_fan_control_mode(smu)) {
> > > > > > > > > -       case AMD_FAN_CTRL_AUTO:
> > > > > > > > > -               return sienna_cichlid_get_smu_metrics_data(smu,
> > > > > > > > > -                                                          METRICS_CURR_FANSPEED,
> > > > > > > > > -                                                          speed);
> > > > > > > > > -       default:
> > > > > > > > > -               return smu_v11_0_get_fan_speed_rpm(smu, speed);
> > > > > > > > > -       }
> > > > > > > > > +       return sienna_cichlid_get_smu_metrics_data(smu,
> > > > > > > > > +                                               METRICS_CURR_FANSPEED,
> > > > > > > > > +                                               speed);
> > > > > > > > >  }
> > > > > > > > >
> > > > > > > > >  static int sienna_cichlid_get_fan_parameters(struct
> > > > > > > > > smu_context
> > > > > > > > > *smu)
> > > > > > > > > --
> > > > > > > > > 2.17.1
> > > > > > > > >
> > > > > > > > > _______________________________________________
> > > > > > > > > amd-gfx mailing list
> > > > > > > > > amd-gfx@lists.freedesktop.org
> > > > > > > > > https://nam11.safelinks.protection.outlook.com/?url=http
> > > > > > > > > s%3A%252
> > > > > > > > > F%25
> > > > > > > > > 2F
> > > > > > > > > lists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp
> > > > > > > > > ;data=
> > > > > > > > > 04
> > > > > > > > > %7
> > > > > > > > > C01%7Ckenneth.feng%40amd.com%7Cd8e969f4b63e4897a3df08d87
> > > > > > > > > 5f1b05
> > > > > > > > > 0%
> > > > > > > > > 7C
> > > > > > > > > 3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C6373890281906
> > > > > > > > > 09906%
> > > > > > > > > 7C
> > > > > > > > > Un
> > > > > > > > > known%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIi
> > > > > > > > > LCJBTi
> > > > > > > > > I6
> > > > > > > > > Ik
> > > > > > > > > 1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=KomP2H%2FadKJChDbN
> > > > > > > > > vNPQlT
> > > > > > > > > ot
> > > > > > > > > mE
> > > > > > > > > WrhutsQCHfiRIjNUY%3D&amp;reserved=0
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
