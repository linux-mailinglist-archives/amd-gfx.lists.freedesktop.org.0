Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1865789F0
	for <lists+amd-gfx@lfdr.de>; Mon, 18 Jul 2022 20:59:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A69D10EFA6;
	Mon, 18 Jul 2022 18:59:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73F7510EFA6
 for <amd-gfx@lists.freedesktop.org>; Mon, 18 Jul 2022 18:59:18 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id b11so22975431eju.10
 for <amd-gfx@lists.freedesktop.org>; Mon, 18 Jul 2022 11:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=slpfovSxwH69MidbtOJcRY7uDQ6H4tBu5oDj8UdArpM=;
 b=ZBid+pAuHLootIpQ3LlrGlDWrvmgPtUN7AWBITQq4lkFGus1FxoKm70PWD/0QEEFmr
 Y1n8YB8A1dzrVRX4yR015vt3T87P20UqfcJeF4BIa0rSw5b/kYQT7GMapYpYRnqfXDWX
 frjLvOf8JgDbK1xGLbIDMVQq/gsEhmkcX9yED3NDZSHwgi5DguKXMo9suK9Dmi19G4xS
 j7OiA5YAdwQftYn5l1vv2wFBax+g8vmZzMZT0RUA2TkEX3KwDw5eSS2pazJZmCcZrDck
 MWozrVFaSRPqcsLY1IfkYS8Cqfd4aODloSdhMxWFjj79H6rTbws8y7+NxbdjeQiiuPUU
 B1AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=slpfovSxwH69MidbtOJcRY7uDQ6H4tBu5oDj8UdArpM=;
 b=rwP/kU9s9axC7UFItSQsAd+WJSHB8lY+CNixKJUOKpYqERrfGa17xmQWERHftLMIkG
 QDoMG09+ZO8jSzE6fnpKWBqYwAlawgOmtpWmuHlefvcRn7pOkR2RxFa+MKeOaM6ofcCS
 XFfcW+2aVCYDMXDMlNXtecrgSvsoYXqVAdhmsxlt5tin093XZUlpcilLRsSAC0fL2TC/
 OKWJPPpJr0Gud2K/7qrq4mPQmhRGD9k1+PA5Zbt4PLCo0e/HXml5U2sKnf8Dtm6bQsQg
 kUYk+wNWWPj9W3UYaxeYEL/9iL+OJFZjl0/NhwMYaEowcAM0Lc5205GXTX7il5Q3Snbk
 kuLg==
X-Gm-Message-State: AJIora/Rh/IsPhAhPlRitM9H97Bk/Z4hcdhCsjG28VLg6eo39U4YB7QW
 eQrMAiTFqkL9rwiq150xTIzKWGCZQsWvA8neEW8=
X-Google-Smtp-Source: AGRyM1uQZwoFvVHeSTMnTXBRgwIxT/NZ/PA/c59d2WUkP+agcYAww0Uht4SdtramGRzjUzzaTK8yd/mqI/nJOun+DTE=
X-Received: by 2002:a17:907:1623:b0:72b:64e3:878a with SMTP id
 hb35-20020a170907162300b0072b64e3878amr27789024ejc.185.1658170757048; Mon, 18
 Jul 2022 11:59:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220714164507.561751-1-mairacanal@riseup.net>
 <20220714164507.561751-8-mairacanal@riseup.net>
In-Reply-To: <20220714164507.561751-8-mairacanal@riseup.net>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 18 Jul 2022 14:59:05 -0400
Message-ID: <CADnq5_NwQWjGvMVxqPG1LcJkCV1MMJt9d25sXFkFQ8zUDw0sng@mail.gmail.com>
Subject: Re: [PATCH 08/12] drm/amd/display: Remove unused variables from
 dcn10_stream_encoder
To: =?UTF-8?B?TWHDrXJhIENhbmFs?= <mairacanal@riseup.net>
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
Cc: Magali Lemes <magalilemes00@gmail.com>, Leo Li <sunpeng.li@amd.com>,
 Tales Lelo da Aparecida <tales.aparecida@gmail.com>,
 xinhui pan <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Melissa Wen <mwen@igalia.com>, David Airlie <airlied@linux.ie>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Daniel Vetter <daniel@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>,
 Isabella Basso <isabbasso@riseup.net>, andrealmeid@riseup.net,
 Harry Wentland <harry.wentland@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Thu, Jul 14, 2022 at 12:46 PM Ma=C3=ADra Canal <mairacanal@riseup.net> w=
rote:
>
> The variable regval from the function enc1_update_generic_info_packet
> and the variables dynamic_range_rgb and dynamic_range_ycbcr from the
> function enc1_stream_encoder_dp_set_stream_attribute are not currently
> used.
>
> This was pointed by clang with the following warnings:
>
> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_stream_encoder.c:62:=
11:
> warning: variable 'regval' set but not used [-Wunused-but-set-variable]
>         uint32_t regval;
>                  ^
> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_stream_encoder.c:262=
:10:
> warning: variable 'dynamic_range_rgb' set but not used [-Wunused-but-set-=
variable]
>         uint8_t dynamic_range_rgb =3D 0; /*full range*/
>                 ^
> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_stream_encoder.c:263=
:10:
> warning: variable 'dynamic_range_ycbcr' set but not used [-Wunused-but-se=
t-variable]
>         uint8_t dynamic_range_ycbcr =3D 1; /*bt709*/
>                 ^
> 3 warnings generated.
>
> Signed-off-by: Ma=C3=ADra Canal <mairacanal@riseup.net>
> ---
>  .../drm/amd/display/dc/dcn10/dcn10_stream_encoder.c    | 10 ----------
>  1 file changed, 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_stream_encoder.c =
b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_stream_encoder.c
> index c99c6fababa9..484e7cdf00b8 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_stream_encoder.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_stream_encoder.c
> @@ -59,7 +59,6 @@ void enc1_update_generic_info_packet(
>         uint32_t packet_index,
>         const struct dc_info_packet *info_packet)
>  {
> -       uint32_t regval;
>         /* TODOFPGA Figure out a proper number for max_retries polling fo=
r lock
>          * use 50 for now.
>          */
> @@ -88,7 +87,6 @@ void enc1_update_generic_info_packet(
>         REG_UPDATE(AFMT_VBI_PACKET_CONTROL, AFMT_GENERIC_CONFLICT_CLR, 1)=
;
>
>         /* choose which generic packet to use */
> -       regval =3D REG_READ(AFMT_VBI_PACKET_CONTROL);
>         REG_UPDATE(AFMT_VBI_PACKET_CONTROL,
>                         AFMT_GENERIC_INDEX, packet_index);
>
> @@ -259,8 +257,6 @@ void enc1_stream_encoder_dp_set_stream_attribute(
>         uint32_t h_back_porch;
>         uint8_t synchronous_clock =3D 0; /* asynchronous mode */
>         uint8_t colorimetry_bpc;
> -       uint8_t dynamic_range_rgb =3D 0; /*full range*/
> -       uint8_t dynamic_range_ycbcr =3D 1; /*bt709*/
>         uint8_t dp_pixel_encoding =3D 0;
>         uint8_t dp_component_depth =3D 0;
>
> @@ -372,18 +368,15 @@ void enc1_stream_encoder_dp_set_stream_attribute(
>         switch (output_color_space) {
>         case COLOR_SPACE_SRGB:
>                 misc1 =3D misc1 & ~0x80; /* bit7 =3D 0*/
> -               dynamic_range_rgb =3D 0; /*full range*/
>                 break;
>         case COLOR_SPACE_SRGB_LIMITED:
>                 misc0 =3D misc0 | 0x8; /* bit3=3D1 */
>                 misc1 =3D misc1 & ~0x80; /* bit7 =3D 0*/
> -               dynamic_range_rgb =3D 1; /*limited range*/
>                 break;
>         case COLOR_SPACE_YCBCR601:
>         case COLOR_SPACE_YCBCR601_LIMITED:
>                 misc0 =3D misc0 | 0x8; /* bit3=3D1, bit4=3D0 */
>                 misc1 =3D misc1 & ~0x80; /* bit7 =3D 0*/
> -               dynamic_range_ycbcr =3D 0; /*bt601*/
>                 if (hw_crtc_timing.pixel_encoding =3D=3D PIXEL_ENCODING_Y=
CBCR422)
>                         misc0 =3D misc0 | 0x2; /* bit2=3D0, bit1=3D1 */
>                 else if (hw_crtc_timing.pixel_encoding =3D=3D PIXEL_ENCOD=
ING_YCBCR444)
> @@ -393,15 +386,12 @@ void enc1_stream_encoder_dp_set_stream_attribute(
>         case COLOR_SPACE_YCBCR709_LIMITED:
>                 misc0 =3D misc0 | 0x18; /* bit3=3D1, bit4=3D1 */
>                 misc1 =3D misc1 & ~0x80; /* bit7 =3D 0*/
> -               dynamic_range_ycbcr =3D 1; /*bt709*/
>                 if (hw_crtc_timing.pixel_encoding =3D=3D PIXEL_ENCODING_Y=
CBCR422)
>                         misc0 =3D misc0 | 0x2; /* bit2=3D0, bit1=3D1 */
>                 else if (hw_crtc_timing.pixel_encoding =3D=3D PIXEL_ENCOD=
ING_YCBCR444)
>                         misc0 =3D misc0 | 0x4; /* bit2=3D1, bit1=3D0 */
>                 break;
>         case COLOR_SPACE_2020_RGB_LIMITEDRANGE:
> -               dynamic_range_rgb =3D 1; /*limited range*/
> -               break;
>         case COLOR_SPACE_2020_RGB_FULLRANGE:
>         case COLOR_SPACE_2020_YCBCR:
>         case COLOR_SPACE_XR_RGB:
> --
> 2.36.1
>
