Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D08A76B18D4
	for <lists+amd-gfx@lfdr.de>; Thu,  9 Mar 2023 02:40:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4FF310E774;
	Thu,  9 Mar 2023 01:40:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EF6510E774
 for <amd-gfx@lists.freedesktop.org>; Thu,  9 Mar 2023 01:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678325997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=By/07Kbxf41wpVUq6Du8LRnA7SSfUoBrDX+ktVEfZ7o=;
 b=hfG/45LJ9EMTrM5atbyubVP96TC+zgHCxRAE70SA1o/IwC72q+/fdmG6Uo1cnxS2vkSqf9
 J3e1sQ7+ohpvSA+HfR25k5+T+d1zzVK5PTji8z1lLok96uj1a1+Au/Mi88zaC5zRFZGetA
 8dh5ajRa8G1M8u/TNqdBzITL5VanlFc=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-168-Flih5enIOeqi6jEsHu9tpA-1; Wed, 08 Mar 2023 20:39:56 -0500
X-MC-Unique: Flih5enIOeqi6jEsHu9tpA-1
Received: by mail-lf1-f72.google.com with SMTP id
 g33-20020a0565123ba100b004dc6259b7acso84877lfv.6
 for <amd-gfx@lists.freedesktop.org>; Wed, 08 Mar 2023 17:39:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678325994;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=By/07Kbxf41wpVUq6Du8LRnA7SSfUoBrDX+ktVEfZ7o=;
 b=vJt0RSGf5XO86YuLScvfk0uK8PhyiD2TBsrdhyOIxAimM/ljQwmiaBbo1WzJlG7tdY
 +a1QkYvLhTYQm4oLuMi3RAV6ZwKOygzzI5h+TsZ2zGKOIccse2CBMnU+ugF68p9sKYA3
 b6y9eGadrjtvJyevUVOtMn1qZrp75fv2wcerkUPg4iuQjPCTPc3LC/XGmfF6m6SIIcy7
 aUQKwNETyg8caiHXjO/2k21tIXqaxOOxxkyGqHtpMXO4+hLY3NDAo7ooUmR2SKPGb2jo
 EYYVV6gbQILBUH0m0bNH7Tiu/lffX7j/0JIRraNzzfJ0VqSoGnf2djLQ7jCeXbaO8Q5I
 3p9Q==
X-Gm-Message-State: AO0yUKUv/A+3v+Q5wJEh0mUhpuH5PWQqcdQErgW/RrMIGAWObN/FDM+Z
 FjhEUHs9HrshtmtCuEvsg+h5fJ2rPv00fCpltpu/tkpBRgPfQQStUcjfdN4dkEYSSo2piSpwl3e
 5jfO9adeyj4jAlL6OXFBrUKlyVKeJCVPspgguPVJfVA==
X-Received: by 2002:ac2:55ad:0:b0:4dc:807a:d148 with SMTP id
 y13-20020ac255ad000000b004dc807ad148mr6384296lfg.7.1678325994660; 
 Wed, 08 Mar 2023 17:39:54 -0800 (PST)
X-Google-Smtp-Source: AK7set+eoeZxuVD7mSNfhFK1EpnOdRYCUdglHz7pV4PhAhr8NefVXipt1R1PUobyVHWukWWFBLj5AMNmY1Ufi63r0vY=
X-Received: by 2002:ac2:55ad:0:b0:4dc:807a:d148 with SMTP id
 y13-20020ac255ad000000b004dc807ad148mr6384288lfg.7.1678325994349; Wed, 08 Mar
 2023 17:39:54 -0800 (PST)
MIME-Version: 1.0
References: <20230307151107.49649-1-harry.wentland@amd.com>
 <20230307151107.49649-6-harry.wentland@amd.com>
In-Reply-To: <20230307151107.49649-6-harry.wentland@amd.com>
From: Sebastian Wick <sebastian.wick@redhat.com>
Date: Thu, 9 Mar 2023 02:39:43 +0100
Message-ID: <CA+hFU4x-zfFbAvc7RJ_FjDXyYD6kLzuCxZ9KNAntxXORBY2Tpw@mail.gmail.com>
Subject: Re: [PATCH v3 05/17] drm/connector: Use common colorspace_names array
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
Cc: Jani Nikula <jani.nikula@linux.intel.com>, dri-devel@lists.freedesktop.org,
 Pekka Paalanen <ppaalanen@gmail.com>, Uma Shankar <uma.shankar@intel.com>,
 amd-gfx@lists.freedesktop.org, Joshua Ashton <joshua@froggi.es>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Vitaly.Prosyak@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Tue, Mar 7, 2023 at 4:12=E2=80=AFPM Harry Wentland <harry.wentland@amd.c=
om> wrote:
>
> We an use bitfields to track the support ones for HDMI
> and DP. This allows us to print colorspaces in a consistent
> manner without needing to know whether we're dealing with
> DP or HDMI.
>
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> Cc: Sebastian Wick <sebastian.wick@redhat.com>
> Cc: Vitaly.Prosyak@amd.com
> Cc: Uma Shankar <uma.shankar@intel.com>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Cc: Joshua Ashton <joshua@froggi.es>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: amd-gfx@lists.freedesktop.org
> ---
>  drivers/gpu/drm/drm_connector.c | 131 +++++++++++++++++++-------------
>  include/drm/drm_connector.h     |   1 +
>  2 files changed, 78 insertions(+), 54 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connec=
tor.c
> index ff4af48c029a..7649f0ac454f 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -1012,64 +1012,70 @@ static const struct drm_prop_enum_list drm_dp_sub=
connector_enum_list[] =3D {
>  DRM_ENUM_NAME_FN(drm_get_dp_subconnector_name,
>                  drm_dp_subconnector_enum_list)
>
> -static const struct drm_prop_enum_list hdmi_colorspaces[] =3D {
> +
> +static const char * const colorspace_names[] =3D {
>         /* For Default case, driver will set the colorspace */
> -       { DRM_MODE_COLORIMETRY_DEFAULT, "Default" },
> +       [DRM_MODE_COLORIMETRY_DEFAULT] =3D "Default",
>         /* Standard Definition Colorimetry based on CEA 861 */
> -       { DRM_MODE_COLORIMETRY_SMPTE_170M_YCC, "SMPTE_170M_YCC" },
> -       { DRM_MODE_COLORIMETRY_BT709_YCC, "BT709_YCC" },
> +       [DRM_MODE_COLORIMETRY_SMPTE_170M_YCC] =3D "SMPTE_170M_YCC",
> +       [DRM_MODE_COLORIMETRY_BT709_YCC] =3D "BT709_YCC",
>         /* Standard Definition Colorimetry based on IEC 61966-2-4 */
> -       { DRM_MODE_COLORIMETRY_XVYCC_601, "XVYCC_601" },
> +       [DRM_MODE_COLORIMETRY_XVYCC_601] =3D "XVYCC_601",
>         /* High Definition Colorimetry based on IEC 61966-2-4 */
> -       { DRM_MODE_COLORIMETRY_XVYCC_709, "XVYCC_709" },
> +       [DRM_MODE_COLORIMETRY_XVYCC_709] =3D "XVYCC_709",
>         /* Colorimetry based on IEC 61966-2-1/Amendment 1 */
> -       { DRM_MODE_COLORIMETRY_SYCC_601, "SYCC_601" },
> +       [DRM_MODE_COLORIMETRY_SYCC_601] =3D "SYCC_601",
>         /* Colorimetry based on IEC 61966-2-5 [33] */
> -       { DRM_MODE_COLORIMETRY_OPYCC_601, "opYCC_601" },
> +       [DRM_MODE_COLORIMETRY_OPYCC_601] =3D "opYCC_601",
>         /* Colorimetry based on IEC 61966-2-5 */
> -       { DRM_MODE_COLORIMETRY_OPRGB, "opRGB" },
> +       [DRM_MODE_COLORIMETRY_OPRGB] =3D "opRGB",
>         /* Colorimetry based on ITU-R BT.2020 */
> -       { DRM_MODE_COLORIMETRY_BT2020_CYCC, "BT2020_CYCC" },
> +       [DRM_MODE_COLORIMETRY_BT2020_CYCC] =3D "BT2020_CYCC",
>         /* Colorimetry based on ITU-R BT.2020 */
> -       { DRM_MODE_COLORIMETRY_BT2020, "BT2020" },
> +       [DRM_MODE_COLORIMETRY_BT2020] =3D "BT2020",
>         /* Colorimetry based on ITU-R BT.2020 */
> -       { DRM_MODE_COLORIMETRY_BT2020_DEPRECATED, "BT2020_DEPRECATED" },
> -       /* Added as part of Additional Colorimetry Extension in 861.G */
> -       { DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65, "DCI-P3_RGB_D65" },
> -       { DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER, "DCI-P3_RGB_Theater" }=
,
> +       [DRM_MODE_COLORIMETRY_BT2020_DEPRECATED] =3D "BT2020_DEPRECATED",
> +       /* Colorimetry based on SMPTE RP 431-2 */
> +       [DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65] =3D "P3_RGB_D65",
> +       [DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER] =3D "P3_RGB_Theater",
> +       [DRM_MODE_COLORIMETRY_RGB_WIDE_FIXED] =3D "RGB_WIDE_FIXED",
> +       /* Colorimetry based on scRGB (IEC 61966-2-2) */
> +       [DRM_MODE_COLORIMETRY_RGB_WIDE_FLOAT] =3D "RGB_WIDE_FLOAT",
> +       [DRM_MODE_COLORIMETRY_BT601_YCC] =3D "BT601_YCC",
>  };
>
> +static const u32 hdmi_colorspaces =3D
> +       BIT(DRM_MODE_COLORIMETRY_SMPTE_170M_YCC) |
> +       BIT(DRM_MODE_COLORIMETRY_BT709_YCC) |
> +       BIT(DRM_MODE_COLORIMETRY_XVYCC_601) |
> +       BIT(DRM_MODE_COLORIMETRY_XVYCC_709) |
> +       BIT(DRM_MODE_COLORIMETRY_SYCC_601) |
> +       BIT(DRM_MODE_COLORIMETRY_OPYCC_601) |
> +       BIT(DRM_MODE_COLORIMETRY_OPRGB) |
> +       BIT(DRM_MODE_COLORIMETRY_BT2020_CYCC) |
> +       BIT(DRM_MODE_COLORIMETRY_BT2020) |
> +       BIT(DRM_MODE_COLORIMETRY_BT2020_DEPRECATED) |
> +       BIT(DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65) |
> +       BIT(DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER);
> +
>  /*
>   * As per DP 1.4a spec, 2.2.5.7.5 VSC SDP Payload for Pixel Encoding/Col=
orimetry
>   * Format Table 2-120
>   */
> -static const struct drm_prop_enum_list dp_colorspaces[] =3D {
> -       /* For Default case, driver will set the colorspace */
> -       { DRM_MODE_COLORIMETRY_DEFAULT, "Default" },
> -       { DRM_MODE_COLORIMETRY_RGB_WIDE_FIXED, "RGB_Wide_Gamut_Fixed_Poin=
t" },
> -       /* Colorimetry based on scRGB (IEC 61966-2-2) */
> -       { DRM_MODE_COLORIMETRY_RGB_WIDE_FLOAT, "RGB_Wide_Gamut_Floating_P=
oint" },
> -       /* Colorimetry based on IEC 61966-2-5 */
> -       { DRM_MODE_COLORIMETRY_OPRGB, "opRGB" },
> -       /* Colorimetry based on SMPTE RP 431-2 */
> -       { DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65, "DCI-P3_RGB_D65" },
> -       /* Colorimetry based on ITU-R BT.2020 */
> -       { DRM_MODE_COLORIMETRY_BT2020, "BT2020" },
> -       { DRM_MODE_COLORIMETRY_BT601_YCC, "BT601_YCC" },
> -       { DRM_MODE_COLORIMETRY_BT709_YCC, "BT709_YCC" },
> -       /* Standard Definition Colorimetry based on IEC 61966-2-4 */
> -       { DRM_MODE_COLORIMETRY_XVYCC_601, "XVYCC_601" },
> -       /* High Definition Colorimetry based on IEC 61966-2-4 */
> -       { DRM_MODE_COLORIMETRY_XVYCC_709, "XVYCC_709" },
> -       /* Colorimetry based on IEC 61966-2-1/Amendment 1 */
> -       { DRM_MODE_COLORIMETRY_SYCC_601, "SYCC_601" },
> -       /* Colorimetry based on IEC 61966-2-5 [33] */
> -       { DRM_MODE_COLORIMETRY_OPYCC_601, "opYCC_601" },
> -       /* Colorimetry based on ITU-R BT.2020 */
> -       { DRM_MODE_COLORIMETRY_BT2020_CYCC, "BT2020_CYCC" },
> -       /* Colorimetry based on ITU-R BT.2020 */
> -       { DRM_MODE_COLORIMETRY_BT2020_DEPRECATED, "BT2020_DEPRECATED" },
> -};
> +static const u32 dp_colorspaces =3D
> +       BIT(DRM_MODE_COLORIMETRY_RGB_WIDE_FIXED) |
> +       BIT(DRM_MODE_COLORIMETRY_RGB_WIDE_FLOAT) |
> +       BIT(DRM_MODE_COLORIMETRY_OPRGB) |
> +       BIT(DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65) |
> +       BIT(DRM_MODE_COLORIMETRY_BT2020) |
> +       BIT(DRM_MODE_COLORIMETRY_BT601_YCC) |
> +       BIT(DRM_MODE_COLORIMETRY_BT709_YCC) |
> +       BIT(DRM_MODE_COLORIMETRY_XVYCC_601) |
> +       BIT(DRM_MODE_COLORIMETRY_XVYCC_709) |
> +       BIT(DRM_MODE_COLORIMETRY_SYCC_601) |
> +       BIT(DRM_MODE_COLORIMETRY_OPYCC_601) |
> +       BIT(DRM_MODE_COLORIMETRY_BT2020_CYCC) |
> +       BIT(DRM_MODE_COLORIMETRY_BT2020_DEPRECATED);
>
>  /**
>   * DOC: standard connector properties
> @@ -1972,30 +1978,49 @@ EXPORT_SYMBOL(drm_mode_create_aspect_ratio_proper=
ty);
>   */
>
>  static int drm_mode_create_colorspace_property(struct drm_connector *con=
nector,
> -                                       const struct drm_prop_enum_list *=
colorspaces,
> -                                       int size)
> +                                       u32 supported_colorspaces)
>  {
>         struct drm_device *dev =3D connector->dev;
> +       u32 colorspaces =3D supported_colorspaces | BIT(DRM_MODE_COLORIME=
TRY_DEFAULT);
> +       struct drm_prop_enum_list enum_list[DRM_MODE_COLORIMETRY_MAX];
> +       int i, len;
>
>         if (connector->colorspace_property)
>                 return 0;
>
> -       if (!colorspaces)
> -               return 0;
> +       if (!supported_colorspaces)
> +               drm_dbg_kms(dev, "Driver is not passing supported colorsp=
aces on [CONNECTOR:%d:%s]\n",
> +                           connector->base.id, connector->name);
> +
> +       if ((supported_colorspaces & -BIT(DRM_MODE_COLORIMETRY_MAX)) !=3D=
 0)
> +               return -EINVAL;
> +
> +       len =3D 0;
> +       for (i =3D 0; i < DRM_MODE_COLORIMETRY_MAX; i++) {
> +               if (supported_colorspaces !=3D 0 && (colorspaces & BIT(i)=
) =3D=3D 0)
> +                       continue;
> +
> +               enum_list[len].type =3D i;
> +               enum_list[len].name =3D colorspace_names[i];
> +               len++;
> +       }
>
>         connector->colorspace_property =3D
>                 drm_property_create_enum(dev, DRM_MODE_PROP_ENUM, "Colors=
pace",
> -                                       colorspaces,
> -                                       size);
> +                                       enum_list,
> +                                       len);
>
>         if (!connector->colorspace_property)
>                 return -ENOMEM;
>
>         return 0;
>  }
> +
>  /**
>   * drm_mode_create_hdmi_colorspace_property - create hdmi colorspace pro=
perty
>   * @connector: connector to create the Colorspace property on.
> + * @supported_colorspaces: A bitfield of supported colorspaces or 0 for =
all
> + *                         HDMI colorspaces

That belongs in a later patch. Same on drm_mode_create_dp_colorspace_proper=
ty.

>   *
>   * Called by a driver the first time it's needed, must be attached to de=
sired
>   * HDMI connectors.
> @@ -2005,15 +2030,15 @@ static int drm_mode_create_colorspace_property(st=
ruct drm_connector *connector,
>   */
>  int drm_mode_create_hdmi_colorspace_property(struct drm_connector *conne=
ctor)
>  {
> -       return drm_mode_create_colorspace_property(connector,
> -                                                  hdmi_colorspaces,
> -                                                  ARRAY_SIZE(hdmi_colors=
paces));
> +       return drm_mode_create_colorspace_property(connector, hdmi_colors=
paces);
>  }
>  EXPORT_SYMBOL(drm_mode_create_hdmi_colorspace_property);
>
>  /**
>   * drm_mode_create_dp_colorspace_property - create dp colorspace propert=
y
>   * @connector: connector to create the Colorspace property on.
> + * @supported_colorspaces: A bitfield of supported colorspaces or 0 for =
all
> + *                         DP colorspaces
>   *
>   * Called by a driver the first time it's needed, must be attached to de=
sired
>   * DP connectors.
> @@ -2023,9 +2048,7 @@ EXPORT_SYMBOL(drm_mode_create_hdmi_colorspace_prope=
rty);
>   */
>  int drm_mode_create_dp_colorspace_property(struct drm_connector *connect=
or)
>  {
> -       return drm_mode_create_colorspace_property(connector,
> -                                                  dp_colorspaces,
> -                                                  ARRAY_SIZE(dp_colorspa=
ces));
> +       return drm_mode_create_colorspace_property(connector, dp_colorspa=
ces);
>  }
>  EXPORT_SYMBOL(drm_mode_create_dp_colorspace_property);
>
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 3e2e1bc7aa04..46c064d9ffef 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -460,6 +460,7 @@ enum drm_colorspace {
>         DRM_MODE_COLORIMETRY_RGB_WIDE_FIXED     =3D 13,
>         DRM_MODE_COLORIMETRY_RGB_WIDE_FLOAT     =3D 14,
>         DRM_MODE_COLORIMETRY_BT601_YCC          =3D 15,
> +       DRM_MODE_COLORIMETRY_MAX
>  };
>
>  /**
> --
> 2.39.2
>

