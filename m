Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A9D5A656A
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Aug 2022 15:48:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EB0710E02C;
	Tue, 30 Aug 2022 13:48:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22E6B10E02C
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Aug 2022 13:48:24 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 z22-20020a056830129600b0063711f456ceso8081040otp.7
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Aug 2022 06:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=PvfjspqduObDzlGa7VmkiKnW5ThPPDax2LcXL1lI6jg=;
 b=pQhSNIvcNgsdWa/iOphyH+ZQKYcwa066Vi2NvTvpHLSV1hydXpfYhQxKiAT2BGom5G
 UVlPfTwH2EEp9F4NFwiXi3uHFJhF4w71BFxghE+6CJjZyM+8GCa+mFqkvVtRteKtExqx
 HQ6idyZf1ZiuHgNp29aM+5w1m+APpK4eSNMG12dEc/xnQtmboY3hMuQYmde+tjjbWmPh
 3EF+iVSTY8zoH4v0JU9RnWfogkXki4djs5cLBz+PgfptGobtRVut1qWJSJ/0MZB+fuwH
 WDfRb//8Z6tJA5hGMNGhBFF7lWYivcodAg4eYL7UvZA2x0vHCD5Tpc5C4oGHA+/zhn5O
 Zvlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=PvfjspqduObDzlGa7VmkiKnW5ThPPDax2LcXL1lI6jg=;
 b=CZQ5NK9cQXTOuq0tT70vpOFrov1IDbhwGBc//7w9hhEmN0+Jm/jc3u2+sQA7YtmmYQ
 /MxxGEkeppskGHpMQ5CCjCAVeIY2srNNQ7/sXvHZSujKOSBfxOfeKhHlXhU0FTUTnOwE
 t4aOtbdWdG0pWdZg5APEQPmyfRJ7/3jSnNGqm159bVQqgcAGELepGOeVFzBCaYacEO5G
 7fZkwCYWzeNuxHFN8Jl47H7ckMFRiEMgVfQGnTULhUyKbW06nW+zS5yEIzhyviloxtd3
 9Q57BaUOyIuH9hMt0D7IFlo6AwLe192WLIi152VZnpC1YEzbmmGsas7TAj/HFtAdgnx+
 vPjQ==
X-Gm-Message-State: ACgBeo2Qag0EEdLa9oeXWT/NhGB2ltOIToVBVxqf/Dj1xSffrgO0VSDV
 RoI0hRx5HU6fCXDdVlKKuRxHMARfrjo5aYmmDN0=
X-Google-Smtp-Source: AA6agR4RD5t1gWtj/0bSorfzGNVgFzu+mFzsdz96Fs681IFYXNIBC2CFKTnF+A/C5ypR1oFH+1QIzJL4iJpVObAHxns=
X-Received: by 2002:a9d:6ad7:0:b0:636:f76b:638a with SMTP id
 m23-20020a9d6ad7000000b00636f76b638amr8753947otq.233.1661867303321; Tue, 30
 Aug 2022 06:48:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220829081752.1258274-1-lijo.lazar@amd.com>
 <CADnq5_O=3u1Z4kH_5A+UsynQ31Grh-=j=3+hPWo398kfMi411w@mail.gmail.com>
 <3b2a9a8f-dedf-2781-0023-d6bd64f16d65@amd.com>
In-Reply-To: <3b2a9a8f-dedf-2781-0023-d6bd64f16d65@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 30 Aug 2022 09:48:11 -0400
Message-ID: <CADnq5_P0=+NNk2v_VOxyjOVSnY55SY=OX40xD5Bx6etspREnfA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/amdgpu: Move HDP remapping earlier during init
To: "Lazar, Lijo" <lijo.lazar@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Felix.Kuehling@amd.com, stable@vger.kernel.org, tseewald@gmail.com,
 helgaas@kernel.org, amd-gfx@lists.freedesktop.org, Alexander.Deucher@amd.com,
 sr@denx.de, Christian.Koenig@amd.com, Hawking.Zhang@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Tue, Aug 30, 2022 at 12:05 AM Lazar, Lijo <lijo.lazar@amd.com> wrote:
>
>
>
> On 8/29/2022 10:20 PM, Alex Deucher wrote:
> > On Mon, Aug 29, 2022 at 4:18 AM Lijo Lazar <lijo.lazar@amd.com> wrote:
> >>
> >> HDP flush is used early in the init sequence as part of memory control=
ler
> >> block initialization. Hence remapping of HDP registers needed for flus=
h
> >> needs to happen earlier.
> >>
> >> This also fixes the Unsupported Request error reported through AER dur=
ing
> >> driver load. The error happens as a write happens to the remap offset
> >> before real remapping is done.
> >>
> >> Link: https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2=
F%2Fbugzilla.kernel.org%2Fshow_bug.cgi%3Fid%3D216373&amp;data=3D05%7C01%7Cl=
ijo.lazar%40amd.com%7C0882d00080124386814a08da89de9bcd%7C3dd8961fe4884e608e=
11a82d994e183d%7C0%7C0%7C637973886457404198%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C=
&amp;sdata=3DdC%2BCY22cfix1VCcQINrvNWI5XW%2BYV5lleJX3Ju9A6Iw%3D&amp;reserve=
d=3D0
> >>
> >> The error was unnoticed before and got visible because of the commit
> >> referenced below. This doesn't fix anything in the commit below, rathe=
r
> >> fixes the issue in amdgpu exposed by the commit. The reference is only
> >> to associate this commit with below one so that both go together.
> >>
> >> Fixes: 8795e182b02d ("PCI/portdrv: Don't disable AER reporting in get_=
port_device_capability()")
> >>
> >> Reported-by: Tom Seewald <tseewald@gmail.com>
> >> Signed-off-by: Lijo Lazar <lijo.lazar@amd.com>
> >> Cc: stable@vger.kernel.org
> >
> > How about something like the attached patch rather than these two
> > patches?  It's a bit bigger but seems cleaner and more defensive in my
> > opinion.
> >
>
> Whenever device goes to suspend/reset and then comes back, remap offset
> has to be set back to 0 to make sure it doesn't use the wrong offset
> when the register assumes default values again.
>
> To avoid the if-check in hdp_flush (which is more frequent), another way
> is to initialize the remap offset to default offset during early init
> and hw fini/suspend sequences. It won't be obvious (even with this
> patch) as to when remap offset vs default offset is used though.

On resume, the common IP is resumed first so it will always be set.
The only case that is a problem is init because we init GMC out of
order.  We could init common before GMC in amdgpu_device_ip_init().  I
think that should be fine, but I wasn't sure if there might be some
fallout from that on certain cards.

Alex

>
> Thanks,
> Lijo
>
> > Alex
> >
> >> ---
> >> v2:
> >>          Take care of IP resume cases (Alex Deucher)
> >>          Add NULL check to nbio.funcs to cover older (GFXv8) ASICs (Fe=
lix Kuehling)
> >>          Add more details in commit message and associate with AER pat=
ch (Bjorn
> >> Helgaas)
> >>
> >>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 24 ++++++++++++++++++++=
++
> >>   drivers/gpu/drm/amd/amdgpu/nv.c            |  6 ------
> >>   drivers/gpu/drm/amd/amdgpu/soc15.c         |  6 ------
> >>   drivers/gpu/drm/amd/amdgpu/soc21.c         |  6 ------
> >>   4 files changed, 24 insertions(+), 18 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/=
drm/amd/amdgpu/amdgpu_device.c
> >> index ce7d117efdb5..e420118769a5 100644
> >> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> >> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> >> @@ -2334,6 +2334,26 @@ static int amdgpu_device_init_schedulers(struct=
 amdgpu_device *adev)
> >>          return 0;
> >>   }
> >>
> >> +/**
> >> + * amdgpu_device_prepare_ip - prepare IPs for hardware initialization
> >> + *
> >> + * @adev: amdgpu_device pointer
> >> + *
> >> + * Any common hardware initialization sequence that needs to be done =
before
> >> + * hw init of individual IPs is performed here. This is different fro=
m the
> >> + * 'common block' which initializes a set of IPs.
> >> + */
> >> +static void amdgpu_device_prepare_ip(struct amdgpu_device *adev)
> >> +{
> >> +       /* Remap HDP registers to a hole in mmio space, for the purpos=
e
> >> +        * of exposing those registers to process space. This needs to=
 be
> >> +        * done before hw init of ip blocks to take care of HDP flush
> >> +        * operations through registers during hw_init.
> >> +        */
> >> +       if (adev->nbio.funcs && adev->nbio.funcs->remap_hdp_registers =
&&
> >> +           !amdgpu_sriov_vf(adev))
> >> +               adev->nbio.funcs->remap_hdp_registers(adev);
> >> +}
> >>
> >>   /**
> >>    * amdgpu_device_ip_init - run init for hardware IPs
> >> @@ -2376,6 +2396,8 @@ static int amdgpu_device_ip_init(struct amdgpu_d=
evice *adev)
> >>                                  DRM_ERROR("amdgpu_vram_scratch_init f=
ailed %d\n", r);
> >>                                  goto init_failed;
> >>                          }
> >> +
> >> +                       amdgpu_device_prepare_ip(adev);
> >>                          r =3D adev->ip_blocks[i].version->funcs->hw_i=
nit((void *)adev);
> >>                          if (r) {
> >>                                  DRM_ERROR("hw_init %d failed %d\n", i=
, r);
> >> @@ -3058,6 +3080,7 @@ static int amdgpu_device_ip_reinit_early_sriov(s=
truct amdgpu_device *adev)
> >>                  AMD_IP_BLOCK_TYPE_IH,
> >>          };
> >>
> >> +       amdgpu_device_prepare_ip(adev);
> >>          for (i =3D 0; i < adev->num_ip_blocks; i++) {
> >>                  int j;
> >>                  struct amdgpu_ip_block *block;
> >> @@ -3139,6 +3162,7 @@ static int amdgpu_device_ip_resume_phase1(struct=
 amdgpu_device *adev)
> >>   {
> >>          int i, r;
> >>
> >> +       amdgpu_device_prepare_ip(adev);
> >>          for (i =3D 0; i < adev->num_ip_blocks; i++) {
> >>                  if (!adev->ip_blocks[i].status.valid || adev->ip_bloc=
ks[i].status.hw)
> >>                          continue;
> >> diff --git a/drivers/gpu/drm/amd/amdgpu/nv.c b/drivers/gpu/drm/amd/amd=
gpu/nv.c
> >> index b3fba8dea63c..3ac7fef74277 100644
> >> --- a/drivers/gpu/drm/amd/amdgpu/nv.c
> >> +++ b/drivers/gpu/drm/amd/amdgpu/nv.c
> >> @@ -1032,12 +1032,6 @@ static int nv_common_hw_init(void *handle)
> >>          nv_program_aspm(adev);
> >>          /* setup nbio registers */
> >>          adev->nbio.funcs->init_registers(adev);
> >> -       /* remap HDP registers to a hole in mmio space,
> >> -        * for the purpose of expose those registers
> >> -        * to process space
> >> -        */
> >> -       if (adev->nbio.funcs->remap_hdp_registers && !amdgpu_sriov_vf(=
adev))
> >> -               adev->nbio.funcs->remap_hdp_registers(adev);
> >>          /* enable the doorbell aperture */
> >>          nv_enable_doorbell_aperture(adev, true);
> >>
> >> diff --git a/drivers/gpu/drm/amd/amdgpu/soc15.c b/drivers/gpu/drm/amd/=
amdgpu/soc15.c
> >> index fde6154f2009..a0481e37d7cf 100644
> >> --- a/drivers/gpu/drm/amd/amdgpu/soc15.c
> >> +++ b/drivers/gpu/drm/amd/amdgpu/soc15.c
> >> @@ -1240,12 +1240,6 @@ static int soc15_common_hw_init(void *handle)
> >>          soc15_program_aspm(adev);
> >>          /* setup nbio registers */
> >>          adev->nbio.funcs->init_registers(adev);
> >> -       /* remap HDP registers to a hole in mmio space,
> >> -        * for the purpose of expose those registers
> >> -        * to process space
> >> -        */
> >> -       if (adev->nbio.funcs->remap_hdp_registers && !amdgpu_sriov_vf(=
adev))
> >> -               adev->nbio.funcs->remap_hdp_registers(adev);
> >>
> >>          /* enable the doorbell aperture */
> >>          soc15_enable_doorbell_aperture(adev, true);
> >> diff --git a/drivers/gpu/drm/amd/amdgpu/soc21.c b/drivers/gpu/drm/amd/=
amdgpu/soc21.c
> >> index 55284b24f113..16b447055102 100644
> >> --- a/drivers/gpu/drm/amd/amdgpu/soc21.c
> >> +++ b/drivers/gpu/drm/amd/amdgpu/soc21.c
> >> @@ -660,12 +660,6 @@ static int soc21_common_hw_init(void *handle)
> >>          soc21_program_aspm(adev);
> >>          /* setup nbio registers */
> >>          adev->nbio.funcs->init_registers(adev);
> >> -       /* remap HDP registers to a hole in mmio space,
> >> -        * for the purpose of expose those registers
> >> -        * to process space
> >> -        */
> >> -       if (adev->nbio.funcs->remap_hdp_registers)
> >> -               adev->nbio.funcs->remap_hdp_registers(adev);
> >>          /* enable the doorbell aperture */
> >>          soc21_enable_doorbell_aperture(adev, true);
> >>
> >> --
> >> 2.25.1
> >>
