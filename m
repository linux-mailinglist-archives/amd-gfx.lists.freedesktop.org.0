Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8DD34200C
	for <lists+amd-gfx@lfdr.de>; Fri, 19 Mar 2021 15:47:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D18306EA37;
	Fri, 19 Mar 2021 14:47:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D8776EA48
 for <amd-gfx@lists.freedesktop.org>; Fri, 19 Mar 2021 14:38:03 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id g1so3049542plg.7
 for <amd-gfx@lists.freedesktop.org>; Fri, 19 Mar 2021 07:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=r8t+Haw8hnnyPI1A8ckYO+AnKAwkWRp0vTVGtS6IUlo=;
 b=VHOSnptigraQrnHtiYP3M5TJPLgguQqQNkJ+HKd6uE/tEHIW1D2lCZYt4kluq/2Uyo
 +XIW78QJtL/XDkFFfwtHiv31BNMpBs+3fONQIb0wj4848a0o8Nvc/e4aIs0pkwMAblku
 GAA/cn8GOMk3KVKy/PN5Y9R5fA0FccSOupDMtLD/c+JgPqJU+pGEvGd/d/0DTs1kvd7J
 qgE7tuYaHWJfSY2oUN6QbFQCwn8sw2WEPS2upkrhFubBrn4vhwpswSpZuAJ3eAIGGZuV
 9H9YKEuPCTliyuPzVKa5nnr7CvtuIstrFaSr+ovqhzSSSqV17hqiKOimHpNyb8R1EJ3b
 IPWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r8t+Haw8hnnyPI1A8ckYO+AnKAwkWRp0vTVGtS6IUlo=;
 b=L0AMp+e21ZY+mIR01IejK2YvGl7qBLy35qWNE1DpPTdjmgYhYG8XFrx97KGhccy4gP
 f2zCVZtDAgGL8St0GBA5lFzhI8eFHQJJvWoNKnn5STrhU5eEXHzs4TcjOFTwNO6hNfYH
 u7aowZnHUYffA9sGpMRor+tGsdraIYOrp0bYQArv4BdrwXyuUMZy4OKJp62xM6P8i/jV
 4newK6xxxN918IQpQkXQph0UR8T43Jc/Z6F2VkacY2/neVz2G5QWz3TwJtGS9tG6XQ9N
 UA4+Lo6WBfdL+15FaKD4Nms3dSD+oAgIstF7LeXSbUMYHzb01fzhNerCTmYtPbAHcTyO
 a11g==
X-Gm-Message-State: AOAM533GnU4HGB57f1quCeFv33sCGPIKgoo74eFIP8C+ekcvduTUc1uc
 +4q7RfVcBXMPMkZ9c+Z+T2jd2xZ2uxFGdoRNEr1Rsg==
X-Google-Smtp-Source: ABdhPJw8c9CchTDySBs3NZLqT/TkgcU8jgQYXzTtozt8IS+78Ccw8naSaLYw4NWbogbCmYjnH85XuIvZ55HTa3abjoE=
X-Received: by 2002:a17:902:7d8d:b029:e6:4061:b767 with SMTP id
 a13-20020a1709027d8db02900e64061b767mr14682850plm.32.1616164682659; Fri, 19
 Mar 2021 07:38:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210219215326.2227596-1-lyude@redhat.com>
 <20210219215326.2227596-10-lyude@redhat.com>
In-Reply-To: <20210219215326.2227596-10-lyude@redhat.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Fri, 19 Mar 2021 15:37:51 +0100
Message-ID: <CAG3jFyvW3YxG8jNq9krRJmWUbTFc3sXNXTjnsY0Pmgky6GJgQQ@mail.gmail.com>
Subject: Re: [PATCH 09/30] drm/bridge/analogix/anx78xx: Cleanup on error in
 anx78xx_bridge_attach()
To: Lyude Paul <lyude@redhat.com>
X-Mailman-Approved-At: Fri, 19 Mar 2021 14:47:10 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Jonas Karlman <jonas@kwiboo.se>, open list <linux-kernel@vger.kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Torsten Duwe <duwe@lst.de>,
 amd-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Hey Lyude,

Thanks for the patch, it looks good to me.

Reviewed-by: Robert Foss <robert.foss@linaro.org>

On Fri, 19 Feb 2021 at 22:56, Lyude Paul <lyude@redhat.com> wrote:
>
> Just another issue I noticed while correcting usages of
> drm_dp_aux_init()/drm_dp_aux_register() around the tree. If any of the
> steps in anx78xx_bridge_attach() fail, we end up leaking resources. So,
> let's fix that (and fix leaking a DP AUX adapter in the process) by
> unrolling on errors.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
> index 338dd8531d4b..f20558618220 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
> @@ -918,7 +918,7 @@ static int anx78xx_bridge_attach(struct drm_bridge *bridge,
>                                  DRM_MODE_CONNECTOR_DisplayPort);
>         if (err) {
>                 DRM_ERROR("Failed to initialize connector: %d\n", err);
> -               return err;
> +               goto aux_unregister;
>         }
>
>         drm_connector_helper_add(&anx78xx->connector,
> @@ -930,16 +930,21 @@ static int anx78xx_bridge_attach(struct drm_bridge *bridge,
>                                            bridge->encoder);
>         if (err) {
>                 DRM_ERROR("Failed to link up connector to encoder: %d\n", err);
> -               return err;
> +               goto connector_cleanup;
>         }
>
>         err = drm_connector_register(&anx78xx->connector);
>         if (err) {
>                 DRM_ERROR("Failed to register connector: %d\n", err);
> -               return err;
> +               goto connector_cleanup;
>         }
>
>         return 0;
> +connector_cleanup:
> +       drm_connector_cleanup(&anx78xx->connector);
> +aux_unregister:
> +       drm_dp_aux_unregister(&anx78xx->aux);
> +       return err;
>  }
>
>  static void anx78xx_bridge_detach(struct drm_bridge *bridge)
> --
> 2.29.2
>
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
