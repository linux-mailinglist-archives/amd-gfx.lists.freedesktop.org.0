Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F5E53A7E0
	for <lists+amd-gfx@lfdr.de>; Wed,  1 Jun 2022 16:04:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95D3210EB4D;
	Wed,  1 Jun 2022 14:04:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D494510E887
 for <amd-gfx@lists.freedesktop.org>; Wed,  1 Jun 2022 08:27:04 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id f21so2146727ejh.11
 for <amd-gfx@lists.freedesktop.org>; Wed, 01 Jun 2022 01:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=suGTguNgHNwFoVKJnInY/A0FAKDNS8MrOyf97TQ0XqE=;
 b=Kz8kZXot4lBQ750zIIvzF3+bHcnNBQtqQzQ1b2o8YXiovCx4t37CQJaYYLktnNzNWJ
 oiuAIk4+P0ht5DpbHp+/pH42JI/DYgbAj/NglXOGybp75vRdDPoI+c7MEl2u+BKuUcEg
 G0ED2t7sW1NRpNK8E9QGxnmiTuZCCtBR+LrDM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=suGTguNgHNwFoVKJnInY/A0FAKDNS8MrOyf97TQ0XqE=;
 b=rq65EGsPcoSAoUFzM4n9OIAD1kKgNdTkwi1/g7pjOagOgulXNF+CjfGzgdZdrem8NB
 dR1HW77eEkn1KaUV9vnL0VFqwv62cmwuZxxlFMYdNaoEEMqdqNGR+Y7FTA+rBE3Z4mgj
 0JWyeaXtxr4me4Ua200+LHoGrl7S7mda6F2uTttwBK0+OsWZ9TSFBLffG9YLEjkCTyRS
 HUGMo/tXV9SW//NSsHC+RYOx5Tkohy2JtpQmc8DNRCM3ueeLiKhKdkAkdJEQ08MtDq8D
 OvAS3hLrt9G9+85a5ex4zNE8UM5hHdXQFyjWa0lGNv80rKgzNT/3JHR6zuIuvl5FqbyB
 M/Mg==
X-Gm-Message-State: AOAM5309Uds9p+0nqHKRxopgUt9oICPo1kdL0Y/MaSo7xNin/wGB8iof
 WM2iFyTMpT1XXKGewGpvnC0yKwPtH82P4+wbo97Ncg==
X-Google-Smtp-Source: ABdhPJzKyQ9RhDDQ9wnQwF0m5mvEJpb5dxyTIDWPhvbLIROaZRgzrB121HfZ6Kvw/3Mtkh8DpWUjMyD3cSjoY6y1xU0=
X-Received: by 2002:a17:906:d7ba:b0:6fe:a119:c4ac with SMTP id
 pk26-20020a170906d7ba00b006fea119c4acmr54450591ejb.129.1654072023238; Wed, 01
 Jun 2022 01:27:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220530081910.3947168-1-hsinyi@chromium.org>
 <a8d1fe13-e747-016a-2d45-bfb50f23f2d9@redhat.com>
 <CAJMQK-iM-ip7edA2mBOhp-8maWKG5+kTceZUM5U6BOLLBq1H4Q@mail.gmail.com>
 <5ba0b86a-fa9c-ed97-3b43-7814599deab5@redhat.com>
In-Reply-To: <5ba0b86a-fa9c-ed97-3b43-7814599deab5@redhat.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Wed, 1 Jun 2022 16:26:37 +0800
Message-ID: <CAJMQK-iYy1ONRF-4Y5DriogsJX3F0MD_951pdKK0rpT3j=keYw@mail.gmail.com>
Subject: Re: [PATCH v10 0/4] Separate panel orientation property creating and
 value setting
To: Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 01 Jun 2022 14:04:05 +0000
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, amd-gfx@lists.freedesktop.org,
 Harry Wentland <harry.wentland@amd.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 intel-gfx@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org, Simon Ser <contact@emersion.fr>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Tue, May 31, 2022 at 6:56 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 5/30/22 13:34, Hsin-Yi Wang wrote:
> > On Mon, May 30, 2022 at 4:53 PM Hans de Goede <hdegoede@redhat.com> wrote:
> >>
> >> Hi,
> >>
> >> On 5/30/22 10:19, Hsin-Yi Wang wrote:
> >>> Some drivers, eg. mtk_drm and msm_drm, rely on the panel to set the
> >>> orientation. Panel calls drm_connector_set_panel_orientation() to create
> >>> orientation property and sets the value. However, connector properties
> >>> can't be created after drm_dev_register() is called. The goal is to
> >>> separate the orientation property creation, so drm drivers can create it
> >>> earlier before drm_dev_register().
> >>
> >> Sorry for jumping in pretty late in the discussion (based on the v10
> >> I seem to have missed this before).
> >>
> >> This sounds to me like the real issue here is that drm_dev_register()
> >> is getting called too early?
> >>
> > Right.
> >
> >> To me it seems sensible to delay calling drm_dev_register() and
> >> thus allowing userspace to start detecting available displays +
> >> features until after the panel has been probed.
> >>
> >
> > Most panels set this value very late, in .get_modes callback (since it
> > is when the connector is known), though the value was known during
> > panel probe.
>
> Hmm I would expect the main drm/kms driver to register the drm_connector
> object after probing the panel, right ?
>
> So maybe this is a problem with the panel API? How about adding
> separate callback to the panel API to get the orientation, which the
> main drm/kms driver can then call before registering the connector ?
>
> And then have the main drm/kms driver call
> drm_connector_set_panel_orientation() with the returned orientation
> on the connecter before registering it.
>
> The new get_orientation callback for the panel should of course
> be optional (IOW amy be NULL), so we probably want a small
> helper for drivers using panel (sub)drivers to take care of
> the process of getting the panel orientation from the panel
> (if supported) and then setting it on the connector.
>

Hi Hans,

Thanks for the suggestion. I've sent a new version for this:
https://patchwork.kernel.org/project/dri-devel/patch/20220601081823.1038797-2-hsinyi@chromium.org/

Panel can implement the optional callback to return the orientation
property, while drm/kms driver will call a drm API to get the value
then they can call drm_connector_set_panel_orientation().
Panel .get_mode will still call drm_connector_set_panel_orientation()
but now it will be a no-op as the value was set by drm/kms driver
previously.

This is similar to the small patch below:
https://patchwork.kernel.org/project/linux-mediatek/patch/20220530113033.124072-1-hsinyi@chromium.org/
But it's now using the panel API.

>
> > I think we can also let drm check if they have remote panel nodes: If
> > there is a panel and the panel sets the orientation, let the drm read
> > this value and set the property. Does this workflow sound reasonable?
> >
> > The corresponding patch to implement this:
> > https://patchwork.kernel.org/project/linux-mediatek/patch/20220530113033.124072-1-hsinyi@chromium.org/
>
> That is a suprisingly small patch (which is good). I guess that
> my suggestion to add a new panel driver callback to get
> the orientation would be a bit bigget then this. Still I think
> that that would be a bit cleaner, as it would also solve this
> for cases where the orientation comes from the panel itself
> (through say some EDID extenstion) rather then from devicetree.
>
> Still I think either way should be acceptable upstream.
>
> Opinions from other drm devs on the above are very much welcome!
>
> Your small patch nicely avoids the probe ordering problem,
> so it is much better then this patch series.
>
> Regards,
>
> Hans
>
>
>
> >
> > Thanks
> >
> >> I see a devicetree patch in this series, so I guess that the panel
> >> is described in devicetree. Especially in the case of devicetree
> >> I would expect the kernel to have enough info to do the right
> >> thing and make sure the panel is probed before calling
> >> drm_dev_register() ?
> >>
> >> Regards,
> >>
> >> Hans
> >>
> >>
> >>
> >>
> >>>
> >>> After this series, drm_connector_set_panel_orientation() works like
> >>> before. It won't affect existing callers of
> >>> drm_connector_set_panel_orientation(). The only difference is that
> >>> some drm drivers can call drm_connector_init_panel_orientation_property()
> >>> earlier.
> >>>
> >>> Hsin-Yi Wang (4):
> >>>   gpu: drm: separate panel orientation property creating and value
> >>>     setting
> >>>   drm/mediatek: init panel orientation property
> >>>   drm/msm: init panel orientation property
> >>>   arm64: dts: mt8183: Add panel rotation
> >>>
> >>>  .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi |  1 +
> >>>  drivers/gpu/drm/drm_connector.c               | 58 ++++++++++++++-----
> >>>  drivers/gpu/drm/mediatek/mtk_dsi.c            |  7 +++
> >>>  drivers/gpu/drm/msm/dsi/dsi_manager.c         |  4 ++
> >>>  include/drm/drm_connector.h                   |  2 +
> >>>  5 files changed, 59 insertions(+), 13 deletions(-)
> >>>
> >>
> >
>
