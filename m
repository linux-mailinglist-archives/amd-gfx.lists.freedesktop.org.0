Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 792F56B1902
	for <lists+amd-gfx@lfdr.de>; Thu,  9 Mar 2023 03:05:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A72E310E77E;
	Thu,  9 Mar 2023 02:05:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C33B10E77E
 for <amd-gfx@lists.freedesktop.org>; Thu,  9 Mar 2023 02:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678327547;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NVnJg9ud9qHZSQY8fKEZTCBgDmkyky9isgEKLix5YYA=;
 b=I3nRBkZbBMK2njmtx5l6qpta5djRGGunR2PLPqsIlg2A1Z1w5MHiiekOE80OnOa7WX2+VJ
 MT8+HkjJKpmI3fKul72b9g2KEg1rvw2moAAhEsYpzKwXw5ZfFF9ikDbX3xJJFeHU3sHPj8
 tAur32rSTH479mvdQJkB55D9tqaE+A4=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-660-YXR75ERUM3KIY0Yv3s9zdA-1; Wed, 08 Mar 2023 21:05:46 -0500
X-MC-Unique: YXR75ERUM3KIY0Yv3s9zdA-1
Received: by mail-lf1-f69.google.com with SMTP id
 cf37-20020a056512282500b004cfd8133992so93447lfb.11
 for <amd-gfx@lists.freedesktop.org>; Wed, 08 Mar 2023 18:05:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678327545;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NVnJg9ud9qHZSQY8fKEZTCBgDmkyky9isgEKLix5YYA=;
 b=sQeVkglLl2afOjqgK6opZenzVJUM0RshyUD27zDpRFuB87aU+J+fcctoLD1aUmFKWL
 c6fE2+iJFabEEV4N8I5K7Cowr/8OYQS6jRX3JPCblV2eYmGLzvcXH7n6SxQZc7ncEL4+
 /M/jyx8Ib3vgp3f0UJXgBtaSckfsU8xyQUXiCSBbdozjQi/0Crrf8FjmQePuUzCF4bRo
 tNpdo2d9nUt/z8QqynteT1MlUm+b8Ie2z70e+fX2D6nAmAYHU7VMp/WfNc7A0PjjiLTj
 CHb+ybwaiP6EVTNiO2fHUCsyl7qcW9V2Az4Lf+pxYB2P6zCDiQ4nLuAiM/HhEPhGlcZX
 10tg==
X-Gm-Message-State: AO0yUKWyyFXgexD14nD4e9z2oyt6gTY2C5WaO5sfVBHbcPBVXhXDI4gq
 Vi57zEAMRX6XOZ2ZXT3kWUCzmN1vK0/FO1l8u+nnb9QV9GgIJdRlLWwRPJbNxwR6m+YTf0I8zkq
 SY9wMtW851Jts+vdS6l60x6v4LJCiqEkb+oy53WIv8g==
X-Received: by 2002:a05:651c:314:b0:295:944c:f335 with SMTP id
 a20-20020a05651c031400b00295944cf335mr6264328ljp.1.1678327544963; 
 Wed, 08 Mar 2023 18:05:44 -0800 (PST)
X-Google-Smtp-Source: AK7set8KBXhHaUyp4/NajLf/d+c+zQU6STuEuYbkorTAcbCSNLt64KTJvRqTUsOQ/B3j3mPvMIeGanv7ulC89B5d9Ig=
X-Received: by 2002:a05:651c:314:b0:295:944c:f335 with SMTP id
 a20-20020a05651c031400b00295944cf335mr6264320ljp.1.1678327544641; Wed, 08 Mar
 2023 18:05:44 -0800 (PST)
MIME-Version: 1.0
References: <20230307151107.49649-1-harry.wentland@amd.com>
 <20230307151107.49649-15-harry.wentland@amd.com>
In-Reply-To: <20230307151107.49649-15-harry.wentland@amd.com>
From: Sebastian Wick <sebastian.wick@redhat.com>
Date: Thu, 9 Mar 2023 03:05:33 +0100
Message-ID: <CA+hFU4zB+dNPLk2rPnBw6Z+UG0W2VB6iCJMXuM22piLUrASiXg@mail.gmail.com>
Subject: Re: [PATCH v3 14/17] drm/amd/display: Add debugfs for testing output
 colorspace
To: Harry Wentland <harry.wentland@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Joshua Ashton <joshua@froggi.es>, Pekka Paalanen <ppaalanen@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Vitaly.Prosyak@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Tue, Mar 7, 2023 at 4:12=E2=80=AFPM Harry Wentland <harry.wentland@amd.c=
om> wrote:
>
> In order to IGT test colorspace we'll want to print
> the currently enabled colorspace on a stream. We add
> a new debugfs to do so, using the same scheme as
> current bpc reporting.
>
> This might also come in handy when debugging display
> issues.
>
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> Cc: Sebastian Wick <sebastian.wick@redhat.com>
> Cc: Vitaly.Prosyak@amd.com
> Cc: Joshua Ashton <joshua@froggi.es>
> Cc: dri-devel@lists.freedesktop.org
> Cc: amd-gfx@lists.freedesktop.org
> Reviewed-By: Joshua Ashton <joshua@froggi.es>
> ---
>  .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/=
drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> index 4a5dae578d97..f0022c16b708 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> @@ -906,6 +906,61 @@ static int amdgpu_current_bpc_show(struct seq_file *=
m, void *data)
>  }
>  DEFINE_SHOW_ATTRIBUTE(amdgpu_current_bpc);
>
> +/*
> + * Returns the current bpc for the crtc.
> + * Example usage: cat /sys/kernel/debug/dri/0/crtc-0/amdgpu_current_colo=
rspace
> + */
> +static int amdgpu_current_colorspace_show(struct seq_file *m, void *data=
)
> +{
> +       struct drm_crtc *crtc =3D m->private;
> +       struct drm_device *dev =3D crtc->dev;
> +       struct dm_crtc_state *dm_crtc_state =3D NULL;
> +       int res =3D -ENODEV;
> +
> +       mutex_lock(&dev->mode_config.mutex);
> +       drm_modeset_lock(&crtc->mutex, NULL);
> +       if (crtc->state =3D=3D NULL)
> +               goto unlock;
> +
> +       dm_crtc_state =3D to_dm_crtc_state(crtc->state);
> +       if (dm_crtc_state->stream =3D=3D NULL)
> +               goto unlock;
> +
> +       switch (dm_crtc_state->stream->output_color_space) {
> +       case COLOR_SPACE_SRGB:
> +               seq_printf(m, "RGB");
> +               break;

Why does it print "RGB" when it says the color space is sRGB? Looking
at the value when I didn't specify any color space it says RGB. Why is
your default color space sRGB?


> +       case COLOR_SPACE_YCBCR601:
> +       case COLOR_SPACE_YCBCR601_LIMITED:
> +               seq_printf(m, "BT601_YCC");
> +               break;
> +       case COLOR_SPACE_YCBCR709:
> +       case COLOR_SPACE_YCBCR709_LIMITED:
> +               seq_printf(m, "BT709_YCC");
> +               break;
> +       case COLOR_SPACE_ADOBERGB:
> +               seq_printf(m, "opRGB");
> +               break;
> +       case COLOR_SPACE_2020_RGB_FULLRANGE:
> +               seq_printf(m, "BT2020_RGB");
> +               break;
> +       case COLOR_SPACE_2020_YCBCR:
> +               seq_printf(m, "BT2020_YCC");
> +               break;
> +       default:
> +               goto unlock;
> +       }
> +       res =3D 0;
> +
> +unlock:
> +       drm_modeset_unlock(&crtc->mutex);
> +       mutex_unlock(&dev->mode_config.mutex);
> +
> +       return res;
> +}
> +DEFINE_SHOW_ATTRIBUTE(amdgpu_current_colorspace);
> +
> +
>  /*
>   * Example usage:
>   * Disable dsc passthrough, i.e.,: have dsc decoding at converver, not e=
xternal RX
> @@ -3235,6 +3290,8 @@ void crtc_debugfs_init(struct drm_crtc *crtc)
>  #endif
>         debugfs_create_file("amdgpu_current_bpc", 0644, crtc->debugfs_ent=
ry,
>                             crtc, &amdgpu_current_bpc_fops);
> +       debugfs_create_file("amdgpu_current_colorspace", 0644, crtc->debu=
gfs_entry,
> +                           crtc, &amdgpu_current_colorspace_fops);
>  }
>
>  /*
> --
> 2.39.2
>

