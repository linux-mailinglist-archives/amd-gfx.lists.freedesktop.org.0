Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 652796B1878
	for <lists+amd-gfx@lfdr.de>; Thu,  9 Mar 2023 02:06:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C153110E16A;
	Thu,  9 Mar 2023 01:06:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F44710E16A
 for <amd-gfx@lists.freedesktop.org>; Thu,  9 Mar 2023 01:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678323970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cc7Q9i986aGijfp4Q179fww/WfL6nfVZNB2tePOH1Qk=;
 b=AoDZ6fCC+WbUk4oBkY39G94FAqzytqdAY0TQXV3GmRXxNkne9yNAsY/zalvwEeTzG/dC/k
 JzGHbwAw0WggMenJY4J9X1TdYzIBWOwCyhdbifQr2uNsaR7QyDMrRa1acDyj+9xIs/NtDX
 romvzb9NkMSNLlC1tuZoN6ZcvgBARFg=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-627-JSMWsGDBMaK1pKI4f8fwdw-1; Wed, 08 Mar 2023 20:06:08 -0500
X-MC-Unique: JSMWsGDBMaK1pKI4f8fwdw-1
Received: by mail-lj1-f199.google.com with SMTP id
 y8-20020a2e3208000000b002934f71de00so61887ljy.13
 for <amd-gfx@lists.freedesktop.org>; Wed, 08 Mar 2023 17:06:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678323967;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Cc7Q9i986aGijfp4Q179fww/WfL6nfVZNB2tePOH1Qk=;
 b=EkJSeACtihW4ILLCY944CYJ3agil2mv2/GQq384CimN8Kuse8KCzw7sM7vnQ6AdlEt
 ZS1UwsIW3ZiF1+uYX96sVkfw8+h0hOOzKFbn62sGQx0XJjdkaCJMXFmaIIls41tXpABw
 y/nr4PaL8oEvgviY1MlNyBEYJQ87CPtiiQtZuRCOqVhaRNv89SQgVmtyRFYb0SDrQkzq
 yEbhm4rlqc1JM0qEKaC9o/uGxEtLy2w3nSCPEb3axoOvhJWlwy2aRfbsrvLihLDNEbBa
 s9r9aEaJ3LxEfkof0I9GfvjqFK5v+aEoq8PCDXS5AnhUD5TgXHPwHxlxuG0qxbxzzUN8
 EEzg==
X-Gm-Message-State: AO0yUKWZGSQhPr29tXlxtsYeKw1YgaeDQgwEnVVSeY6EjVCpxMIMkp+3
 PeBbBA0TEa52gnsO+nOFQpDZA7lQymBJTFpCCbtOUj3OvW9mrXfntEe0bs2ZDv8PDGjKFkCSBfc
 Cj0yhPU1OlPp+JbQd32YLZNqYMUn3z6zc9jw0DfW/Cw==
X-Received: by 2002:a05:651c:2322:b0:295:93eb:bab1 with SMTP id
 bi34-20020a05651c232200b0029593ebbab1mr6240049ljb.1.1678323967272; 
 Wed, 08 Mar 2023 17:06:07 -0800 (PST)
X-Google-Smtp-Source: AK7set92Ku4w1sPzwiPsJHZEU0DOBc3sZSlBwJE9Is5QGg7H62LNSZxj6QfNLSlv2BOp6po8Bsim4ubmlXo9xPSaKVo=
X-Received: by 2002:a05:651c:2322:b0:295:93eb:bab1 with SMTP id
 bi34-20020a05651c232200b0029593ebbab1mr6240048ljb.1.1678323966974; Wed, 08
 Mar 2023 17:06:06 -0800 (PST)
MIME-Version: 1.0
References: <20230307151107.49649-1-harry.wentland@amd.com>
 <20230307151107.49649-4-harry.wentland@amd.com>
 <20230308110943.4dbb6afc@eldfell>
In-Reply-To: <20230308110943.4dbb6afc@eldfell>
From: Sebastian Wick <sebastian.wick@redhat.com>
Date: Thu, 9 Mar 2023 02:05:55 +0100
Message-ID: <CA+hFU4y3ekw3wAP2CJaKGF3A-a5hk+rSGZFOsUeZgErvzyf4iQ@mail.gmail.com>
Subject: Re: [PATCH v3 03/17] drm/connector: Deprecate split for BT.2020 in
 drm_colorspace enum
To: Pekka Paalanen <ppaalanen@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Uma Shankar <uma.shankar@intel.com>, amd-gfx@lists.freedesktop.org,
 Harry Wentland <harry.wentland@amd.com>, Joshua Ashton <joshua@froggi.es>,
 Vitaly.Prosyak@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Wed, Mar 8, 2023 at 10:09=E2=80=AFAM Pekka Paalanen <ppaalanen@gmail.com=
> wrote:
>
> On Tue, 7 Mar 2023 10:10:53 -0500
> Harry Wentland <harry.wentland@amd.com> wrote:
>
> > From: Joshua Ashton <joshua@froggi.es>
> >
> > Userspace has no way of controlling or knowing the pixel encoding
> > currently, so there is no way for it to ever get the right values here.
> >
> > When we do add pixel_encoding control from userspace,we can pick the
> > right value for the colorimetry packet based on the
> > pixel_encoding + the colorspace.
> >
> > Let's deprecate these values, and have one BT.2020 colorspace entry
> > that userspace can use.
> >
> > v2:
> >  - leave CYCC alone for now; it serves a purpose
> >  - leave BT2020_RGB the new default BT2020
> >
> > Signed-off-by: Joshua Ashton <joshua@froggi.es>
> > Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> > Reviewed-by: Harry Wentland <harry.wentland@amd.com>
> >
> > Cc: Pekka Paalanen <ppaalanen@gmail.com>
> > Cc: Sebastian Wick <sebastian.wick@redhat.com>
> > Cc: Vitaly.Prosyak@amd.com
> > Cc: Uma Shankar <uma.shankar@intel.com>
> > Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> > Cc: Joshua Ashton <joshua@froggi.es>
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: amd-gfx@lists.freedesktop.org
> > ---
> >  drivers/gpu/drm/display/drm_hdmi_helper.c |  7 +++----
> >  drivers/gpu/drm/drm_connector.c           |  8 ++++----
> >  drivers/gpu/drm/i915/display/intel_dp.c   | 14 +++++++-------
> >  include/drm/drm_connector.h               | 15 +++++++++------
> >  4 files changed, 23 insertions(+), 21 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/display/drm_hdmi_helper.c b/drivers/gpu/dr=
m/display/drm_hdmi_helper.c
> > index faf5e9efa7d3..05a0d03ffcda 100644
> > --- a/drivers/gpu/drm/display/drm_hdmi_helper.c
> > +++ b/drivers/gpu/drm/display/drm_hdmi_helper.c
> > @@ -97,8 +97,7 @@ EXPORT_SYMBOL(drm_hdmi_infoframe_set_hdr_metadata);
> >  #define HDMI_COLORIMETRY_OPYCC_601           (C(3) | EC(3) | ACE(0))
> >  #define HDMI_COLORIMETRY_OPRGB                       (C(3) | EC(4) | A=
CE(0))
> >  #define HDMI_COLORIMETRY_BT2020_CYCC         (C(3) | EC(5) | ACE(0))
> > -#define HDMI_COLORIMETRY_BT2020_RGB          (C(3) | EC(6) | ACE(0))
> > -#define HDMI_COLORIMETRY_BT2020_YCC          (C(3) | EC(6) | ACE(0))
> > +#define HDMI_COLORIMETRY_BT2020                      (C(3) | EC(6) | A=
CE(0))
> >  #define HDMI_COLORIMETRY_DCI_P3_RGB_D65              (C(3) | EC(7) | A=
CE(0))
> >  #define HDMI_COLORIMETRY_DCI_P3_RGB_THEATER  (C(3) | EC(7) | ACE(1))
> >
> > @@ -112,8 +111,8 @@ static const u32 hdmi_colorimetry_val[] =3D {
> >       [DRM_MODE_COLORIMETRY_OPYCC_601] =3D HDMI_COLORIMETRY_OPYCC_601,
> >       [DRM_MODE_COLORIMETRY_OPRGB] =3D HDMI_COLORIMETRY_OPRGB,
> >       [DRM_MODE_COLORIMETRY_BT2020_CYCC] =3D HDMI_COLORIMETRY_BT2020_CY=
CC,
> > -     [DRM_MODE_COLORIMETRY_BT2020_RGB] =3D HDMI_COLORIMETRY_BT2020_RGB=
,
> > -     [DRM_MODE_COLORIMETRY_BT2020_YCC] =3D HDMI_COLORIMETRY_BT2020_YCC=
,
> > +     [DRM_MODE_COLORIMETRY_BT2020_DEPRECATED] =3D HDMI_COLORIMETRY_BT2=
020,
> > +     [DRM_MODE_COLORIMETRY_BT2020] =3D HDMI_COLORIMETRY_BT2020,
> >  };
> >
> >  #undef C
> > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_conn=
ector.c
> > index 61c29ce74b03..fe7eab15f727 100644
> > --- a/drivers/gpu/drm/drm_connector.c
> > +++ b/drivers/gpu/drm/drm_connector.c
> > @@ -1031,9 +1031,9 @@ static const struct drm_prop_enum_list hdmi_color=
spaces[] =3D {
> >       /* Colorimetry based on ITU-R BT.2020 */
> >       { DRM_MODE_COLORIMETRY_BT2020_CYCC, "BT2020_CYCC" },
> >       /* Colorimetry based on ITU-R BT.2020 */
> > -     { DRM_MODE_COLORIMETRY_BT2020_RGB, "BT2020_RGB" },
> > +     { DRM_MODE_COLORIMETRY_BT2020, "BT2020" },
> >       /* Colorimetry based on ITU-R BT.2020 */
> > -     { DRM_MODE_COLORIMETRY_BT2020_YCC, "BT2020_YCC" },
> > +     { DRM_MODE_COLORIMETRY_BT2020_DEPRECATED, "BT2020_DEPRECATED" },
> >       /* Added as part of Additional Colorimetry Extension in 861.G */
> >       { DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65, "DCI-P3_RGB_D65" },
> >       { DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER, "DCI-P3_RGB_Theater" }=
,
> > @@ -1054,7 +1054,7 @@ static const struct drm_prop_enum_list dp_colorsp=
aces[] =3D {
> >       /* Colorimetry based on SMPTE RP 431-2 */
> >       { DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65, "DCI-P3_RGB_D65" },
> >       /* Colorimetry based on ITU-R BT.2020 */
> > -     { DRM_MODE_COLORIMETRY_BT2020_RGB, "BT2020_RGB" },
> > +     { DRM_MODE_COLORIMETRY_BT2020, "BT2020" },
> >       { DRM_MODE_COLORIMETRY_BT601_YCC, "BT601_YCC" },
> >       { DRM_MODE_COLORIMETRY_BT709_YCC, "BT709_YCC" },
> >       /* Standard Definition Colorimetry based on IEC 61966-2-4 */
> > @@ -1068,7 +1068,7 @@ static const struct drm_prop_enum_list dp_colorsp=
aces[] =3D {
> >       /* Colorimetry based on ITU-R BT.2020 */
> >       { DRM_MODE_COLORIMETRY_BT2020_CYCC, "BT2020_CYCC" },
> >       /* Colorimetry based on ITU-R BT.2020 */
> > -     { DRM_MODE_COLORIMETRY_BT2020_YCC, "BT2020_YCC" },
> > +     { DRM_MODE_COLORIMETRY_BT2020_DEPRECATED, "BT2020_DEPRECATED" },
>
> Let's hope no-one complains about missing the old string names in UABI. :=
-)
>
> Actually, you should write in the commit message why removing old names
> is fine.

Uhm, yeah, I'm just going to do that. This breaks my code! Mutter
actually uses the strings and not the values.

It's still not clear to me if we want to break backwards compatibility
or not. This patch definitely does break backwards compatibility but
it also doesn't get rid of all the other crap, so it's the worst of
both worlds.

> >  };
> >
> >  /**
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/=
i915/display/intel_dp.c
> > index c9be61d2348e..be100a193bf5 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> > @@ -1766,11 +1766,11 @@ static void intel_dp_compute_vsc_colorimetry(co=
nst struct intel_crtc_state *crtc
> >       case DRM_MODE_COLORIMETRY_BT2020_CYCC:
> >               vsc->colorimetry =3D DP_COLORIMETRY_BT2020_CYCC;
> >               break;
> > -     case DRM_MODE_COLORIMETRY_BT2020_RGB:
> > -             vsc->colorimetry =3D DP_COLORIMETRY_BT2020_RGB;
> > -             break;
> > -     case DRM_MODE_COLORIMETRY_BT2020_YCC:
> > -             vsc->colorimetry =3D DP_COLORIMETRY_BT2020_YCC;
> > +     case DRM_MODE_COLORIMETRY_BT2020_DEPRECATED:
> > +     case DRM_MODE_COLORIMETRY_BT2020:
> > +             vsc->colorimetry =3D vsc->pixelformat =3D=3D DP_PIXELFORM=
AT_RGB
> > +                     ? DP_COLORIMETRY_BT2020_RGB
> > +                     : DP_COLORIMETRY_BT2020_YCC;
> >               break;
> >       case DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65:
> >       case DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER:
> > @@ -3043,9 +3043,9 @@ intel_dp_needs_vsc_sdp(const struct intel_crtc_st=
ate *crtc_state,
> >       switch (conn_state->colorspace) {
> >       case DRM_MODE_COLORIMETRY_SYCC_601:
> >       case DRM_MODE_COLORIMETRY_OPYCC_601:
> > -     case DRM_MODE_COLORIMETRY_BT2020_YCC:
> > -     case DRM_MODE_COLORIMETRY_BT2020_RGB:
> >       case DRM_MODE_COLORIMETRY_BT2020_CYCC:
> > +     case DRM_MODE_COLORIMETRY_BT2020_DEPRECATED:
> > +     case DRM_MODE_COLORIMETRY_BT2020:
> >               return true;
> >       default:
> >               break;
> > diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> > index bb078666dc34..3e2e1bc7aa04 100644
> > --- a/include/drm/drm_connector.h
> > +++ b/include/drm/drm_connector.h
> > @@ -409,12 +409,15 @@ enum drm_privacy_screen_status {
> >   * @DRM_MODE_COLORIMETRY_BT2020_CYCC:
> >   *   (HDMI, DP)
> >   *   ITU-R BT.2020 Y'c C'bc C'rc (constant luminance) colorimetry form=
at
> > - * @DRM_MODE_COLORIMETRY_BT2020_RGB:
> > + * @DRM_MODE_COLORIMETRY_BT2020:
> >   *   (HDMI, DP)
> > - *   ITU-R BT.2020 R' G' B' colorimetry format
> > - * @DRM_MODE_COLORIMETRY_BT2020_YCC:
> > + *   ITU-R BT.2020 [R' G' B'] or
> > + *    ITU-R BT.2020 [Y' C'b C'r] or
> > + *   ITU-R BT.2020 [Y'c C'bc C'rc] (linear)
>
> Drop the constant luminance variant from this value's doc.
>
> > + *   colorimetry format
> > + * @DRM_MODE_COLORIMETRY_BT2020_DEPRECATED:
> >   *   (HDMI, DP)
> > - *   ITU-R BT.2020 Y' C'b C'r colorimetry format
> > + *   deprecated; same as DRM_MODE_COLORIMETRY_BT2020
> >   * @DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65:
> >   *   (HDMI)
> >   *   SMPTE ST 2113 P3D65 colorimetry format
> > @@ -448,8 +451,8 @@ enum drm_colorspace {
> >       DRM_MODE_COLORIMETRY_OPYCC_601          =3D 6,
> >       DRM_MODE_COLORIMETRY_OPRGB              =3D 7,
> >       DRM_MODE_COLORIMETRY_BT2020_CYCC        =3D 8,
> > -     DRM_MODE_COLORIMETRY_BT2020_RGB         =3D 9,
> > -     DRM_MODE_COLORIMETRY_BT2020_YCC         =3D 10,
> > +     DRM_MODE_COLORIMETRY_BT2020             =3D 9,
> > +     DRM_MODE_COLORIMETRY_BT2020_DEPRECATED  =3D 10,
> >       /* Additional Colorimetry extension added as part of CTA 861.G */
> >       DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65     =3D 11,
> >       DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER =3D 12,
>
> With the caveat noted and nitpick fixed:
> Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
>
>
> Thanks,
> pq

