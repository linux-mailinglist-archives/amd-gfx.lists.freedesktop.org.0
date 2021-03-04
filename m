Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A190A32CBCA
	for <lists+amd-gfx@lfdr.de>; Thu,  4 Mar 2021 06:20:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E4856E48C;
	Thu,  4 Mar 2021 05:20:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 786296E48C
 for <amd-gfx@lists.freedesktop.org>; Thu,  4 Mar 2021 05:20:16 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id g8so22439339otk.4
 for <amd-gfx@lists.freedesktop.org>; Wed, 03 Mar 2021 21:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=69bLTD/nMfQahuNeUWdBr6owdnNPsL+rRZ9wJx5EB58=;
 b=J0WNfJZaz3ETv5uAbfQDkRLgkt9dYhAi0eN9QnUDurNYs0FmEUk5ABa8uiDhPmFxoD
 FXwfIPFurlbl4RM8Flv144TvR+aSQey/reE4M1D1c/962FEX16b3jaCZ+q6PoRVXaJbr
 49aoAK0udsuvQjeYAEXl/EyrDsHsS8U6JJHmSuPx8pO7Z3EK1e9NcYQgQbFuoGZMEN06
 zZUiNP39tYx1SS/mqyjZpB/iNi5Sp36tzvYQvAS2AIqhceA8kJi/rNl4gb5z+iuxawzI
 6YBucF11LVViy2RdD1A+owNMbimbWFrHLrpdbSiAZpS/64tuQ2bvnAuwuHQoMTN/FGqJ
 AbtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=69bLTD/nMfQahuNeUWdBr6owdnNPsL+rRZ9wJx5EB58=;
 b=pDijPO03zlgqDXiynwOxA48QxQAh/51jWgVDL6DHcemzGi38an1XXbvNtqJMmcPwsz
 G3tre9N3YoTvWD8g7WnhdX0t3lg2yPJW0vYOgfWCi002ice9XpC8FzYEltLs+/SWaaqf
 W0N8iiWXOlfYcf1smLe9cJHT1TlS7C3vTTDoEewhG1L1VpK+iBz3m+1r4i5+opFqrh8R
 4DVB9F+wy/ZduRZSFsymCTmlG48oS2Cqlk7IGdMz/BB2wUtfOndWCSegW2zm3Q9gBIzX
 WhGK6h2U8aklLdv6asko67ET5ovYJNj2dRebW/UqOaDllAfmfEIC4IXWhrMvh2LSuWru
 QpOQ==
X-Gm-Message-State: AOAM5315rLQw3RRHzwCA+3fq0cGoVN5Snv0U2EK/IXkuo2OyQicIDkue
 Ps6ui3PjhRSNtdSBlsi0D854R2YdfMy5C3L0Dfc=
X-Google-Smtp-Source: ABdhPJxzkkI8pF6fpV4UBlks7ub0My/6MqBEeVtzCdYpRPEOTZM5dmQ3FYnqHjGVvZjS4Dp1q66uC/yuBvMFRmDSHs0=
X-Received: by 2002:a05:6830:408f:: with SMTP id
 x15mr2282262ott.132.1614835215685; 
 Wed, 03 Mar 2021 21:20:15 -0800 (PST)
MIME-Version: 1.0
References: <20210304035824.37796-1-Feifei.Xu@amd.com>
 <CADnq5_Njn_yvVasKGcQi61rZbi1cxv-G46iTCH0xojkfH4gFeA@mail.gmail.com>
 <DM6PR12MB460311EFEB28302D41C4CD79FE979@DM6PR12MB4603.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB460311EFEB28302D41C4CD79FE979@DM6PR12MB4603.namprd12.prod.outlook.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 4 Mar 2021 00:20:04 -0500
Message-ID: <CADnq5_OrL7bdJd-Qo9YAdsBGCQYt7o=Trf7iiTFjeP4uvif3tA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: simplify the sdma 4_x MGCG/MGLS logic.
To: "Xu, Feifei" <Feifei.Xu@amd.com>
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Wed, Mar 3, 2021 at 11:44 PM Xu, Feifei <Feifei.Xu@amd.com> wrote:
>
> [AMD Official Use Only - Internal Distribution Only]
>
> Thanks. The VegaM still need to be rule out.

VegaM is SDMA 3.x.

Alex

>
> Thanks,
> Feifei
>
> -----Original Message-----
> From: Alex Deucher <alexdeucher@gmail.com>
> Sent: Thursday, March 4, 2021 12:12 PM
> To: Xu, Feifei <Feifei.Xu@amd.com>
> Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>
> Subject: Re: [PATCH] drm/amdgpu: simplify the sdma 4_x MGCG/MGLS logic.
>
> On Wed, Mar 3, 2021 at 10:58 PM Feifei Xu <Feifei.Xu@amd.com> wrote:
> >
> > SDMA 4_x asics share the same MGCG/MGLS setting.
> >
> > Signed-off-by: Feifei Xu <Feifei.Xu@amd.com>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c | 12 +-----------
> >  1 file changed, 1 insertion(+), 11 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
> > b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
> > index 3bede8a70d7e..f46169c048fd 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
> > @@ -2271,21 +2271,11 @@ static int sdma_v4_0_set_clockgating_state(void *handle,
> >         if (amdgpu_sriov_vf(adev))
> >                 return 0;
> >
> > -       switch (adev->asic_type) {
> > -       case CHIP_VEGA10:
> > -       case CHIP_VEGA12:
> > -       case CHIP_VEGA20:
> > -       case CHIP_RAVEN:
> > -       case CHIP_ARCTURUS:
> > -       case CHIP_RENOIR:
> > -       case CHIP_ALDEBARAN:
> > +       if (adev->asic_type >= CHIP_VEGA10){
>
> Need a space between ) and {.  That said, do we even need to check the asic type here at all?  I think this applies to all chips that have sdma4.
>
> Alex
>
> >                 sdma_v4_0_update_medium_grain_clock_gating(adev,
> >                                 state == AMD_CG_STATE_GATE);
> >                 sdma_v4_0_update_medium_grain_light_sleep(adev,
> >                                 state == AMD_CG_STATE_GATE);
> > -               break;
> > -       default:
> > -               break;
> >         }
> >         return 0;
> >  }
> > --
> > 2.25.1
> >
> > _______________________________________________
> > amd-gfx mailing list
> > amd-gfx@lists.freedesktop.org
> > https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flist
> > s.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=04%7C01%7CFe
> > ifei.Xu%40amd.com%7C67eba26e9d7a4ea88e9b08d8dec3af22%7C3dd8961fe4884e6
> > 08e11a82d994e183d%7C0%7C0%7C637504279325196042%7CUnknown%7CTWFpbGZsb3d
> > 8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C
> > 1000&amp;sdata=jUa2v%2BB6NICmTSr9Zdt0MQdjd1oIXYOzDYloTzUstz0%3D&amp;re
> > served=0
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
