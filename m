Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA00374F71
	for <lists+amd-gfx@lfdr.de>; Thu,  6 May 2021 08:37:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 353146EC9D;
	Thu,  6 May 2021 06:37:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCFCB6EC9D;
 Thu,  6 May 2021 06:37:07 +0000 (UTC)
IronPort-SDR: sIzkhP3bhZAz5ni3TSXRYHvBhFqLpOygExbeKaiIvpD31sTN0wivLyNmwpH16clHiwf9pstky4
 FKtcdYJYjqQA==
X-IronPort-AV: E=McAfee;i="6200,9189,9975"; a="219270229"
X-IronPort-AV: E=Sophos;i="5.82,276,1613462400"; d="scan'208";a="219270229"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 23:37:07 -0700
IronPort-SDR: TamvkOV3vH3us829oXeRO+W012meaTmIVUxgqa5yHMs6163xf0QjRogBLw3GnUJFHbQtNPqIO7
 ISqlBFy5wphQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,276,1613462400"; d="scan'208";a="469322810"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga001.jf.intel.com with SMTP; 05 May 2021 23:37:03 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 06 May 2021 09:37:02 +0300
Date: Thu, 6 May 2021 09:37:02 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Mario Kleiner <mario.kleiner.de@gmail.com>
Subject: Re: [PATCH 1/5] drm/fourcc: Add 16 bpc fixed point framebuffer
 formats.
Message-ID: <YJOOjpyPshTbIY8U@intel.com>
References: <20210319210317.32369-1-mario.kleiner.de@gmail.com>
 <20210319210317.32369-2-mario.kleiner.de@gmail.com>
 <YFUUm0atqi3ox17k@intel.com>
 <CAEsyxyhxBVp0yFrRc9Zq9D0b62Tdf+-6oWc+Y6AwHTSFWX5g1w@mail.gmail.com>
 <YFVZa0sU7ciMQIX2@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YFVZa0sU7ciMQIX2@intel.com>
X-Patchwork-Hint: comment
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Sat, Mar 20, 2021 at 04:09:47AM +0200, Ville Syrj=E4l=E4 wrote:
> On Fri, Mar 19, 2021 at 10:45:10PM +0100, Mario Kleiner wrote:
> > On Fri, Mar 19, 2021 at 10:16 PM Ville Syrj=E4l=E4
> > <ville.syrjala@linux.intel.com> wrote:
> > >
> > > On Fri, Mar 19, 2021 at 10:03:13PM +0100, Mario Kleiner wrote:
> > > > These are 16 bits per color channel unsigned normalized formats.
> > > > They are supported by at least AMD display hw, and suitable for
> > > > direct scanout of Vulkan swapchain images in the format
> > > > VK_FORMAT_R16G16B16A16_UNORM.
> > > >
> > > > Signed-off-by: Mario Kleiner <mario.kleiner.de@gmail.com>
> > > > ---
> > > >  drivers/gpu/drm/drm_fourcc.c  | 4 ++++
> > > >  include/uapi/drm/drm_fourcc.h | 7 +++++++
> > > >  2 files changed, 11 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fou=
rcc.c
> > > > index 03262472059c..ce13d2be5d7b 100644
> > > > --- a/drivers/gpu/drm/drm_fourcc.c
> > > > +++ b/drivers/gpu/drm/drm_fourcc.c
> > > > @@ -203,6 +203,10 @@ const struct drm_format_info *__drm_format_inf=
o(u32 format)
> > > >               { .format =3D DRM_FORMAT_ARGB16161616F,   .depth =3D =
0,  .num_planes =3D 1, .cpp =3D { 8, 0, 0 }, .hsub =3D 1, .vsub =3D 1, .has=
_alpha =3D true },
> > > >               { .format =3D DRM_FORMAT_ABGR16161616F,   .depth =3D =
0,  .num_planes =3D 1, .cpp =3D { 8, 0, 0 }, .hsub =3D 1, .vsub =3D 1, .has=
_alpha =3D true },
> > > >               { .format =3D DRM_FORMAT_AXBXGXRX106106106106, .depth=
 =3D 0, .num_planes =3D 1, .cpp =3D { 8, 0, 0 }, .hsub =3D 1, .vsub =3D 1, =
.has_alpha =3D true },
> > > > +             { .format =3D DRM_FORMAT_XRGB16161616,    .depth =3D =
0,  .num_planes =3D 1, .cpp =3D { 8, 0, 0 }, .hsub =3D 1, .vsub =3D 1 },
> > > > +             { .format =3D DRM_FORMAT_XBGR16161616,    .depth =3D =
0,  .num_planes =3D 1, .cpp =3D { 8, 0, 0 }, .hsub =3D 1, .vsub =3D 1 },
> > > > +             { .format =3D DRM_FORMAT_ARGB16161616,    .depth =3D =
0,  .num_planes =3D 1, .cpp =3D { 8, 0, 0 }, .hsub =3D 1, .vsub =3D 1, .has=
_alpha =3D true },
> > > > +             { .format =3D DRM_FORMAT_ABGR16161616,    .depth =3D =
0,  .num_planes =3D 1, .cpp =3D { 8, 0, 0 }, .hsub =3D 1, .vsub =3D 1, .has=
_alpha =3D true },
> > > >               { .format =3D DRM_FORMAT_RGB888_A8,       .depth =3D =
32, .num_planes =3D 2, .cpp =3D { 3, 1, 0 }, .hsub =3D 1, .vsub =3D 1, .has=
_alpha =3D true },
> > > >               { .format =3D DRM_FORMAT_BGR888_A8,       .depth =3D =
32, .num_planes =3D 2, .cpp =3D { 3, 1, 0 }, .hsub =3D 1, .vsub =3D 1, .has=
_alpha =3D true },
> > > >               { .format =3D DRM_FORMAT_XRGB8888_A8,     .depth =3D =
32, .num_planes =3D 2, .cpp =3D { 4, 1, 0 }, .hsub =3D 1, .vsub =3D 1, .has=
_alpha =3D true },
> > > > diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_f=
ourcc.h
> > > > index f76de49c768f..f7156322aba5 100644
> > > > --- a/include/uapi/drm/drm_fourcc.h
> > > > +++ b/include/uapi/drm/drm_fourcc.h
> > > > @@ -168,6 +168,13 @@ extern "C" {
> > > >  #define DRM_FORMAT_RGBA1010102       fourcc_code('R', 'A', '3', '0=
') /* [31:0] R:G:B:A 10:10:10:2 little endian */
> > > >  #define DRM_FORMAT_BGRA1010102       fourcc_code('B', 'A', '3', '0=
') /* [31:0] B:G:R:A 10:10:10:2 little endian */
> > > >
> > > > +/* 64 bpp RGB */
> > > > +#define DRM_FORMAT_XRGB16161616      fourcc_code('X', 'R', '4', '8=
') /* [63:0] x:R:G:B 16:16:16:16 little endian */
> > > > +#define DRM_FORMAT_XBGR16161616      fourcc_code('X', 'B', '4', '8=
') /* [63:0] x:B:G:R 16:16:16:16 little endian */
> > > > +
> > > > +#define DRM_FORMAT_ARGB16161616      fourcc_code('A', 'R', '4', '8=
') /* [63:0] A:R:G:B 16:16:16:16 little endian */
> > > > +#define DRM_FORMAT_ABGR16161616      fourcc_code('A', 'B', '4', '8=
') /* [63:0] A:B:G:R 16:16:16:16 little endian */
> > >
> > > These look reasonable enough to me. IIRC we should be able to expose
> > > them on some recent Intel hw as well.
> > >
> > > Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > >
> > =

> > Thanks Ville!
> > =

> > Indeed i looked over the Intel PRM's, and while fp16 support seems to
> > be rather recent (Gen8? Gen9? Gen10? Can't remember atm.), iirc, I
> > found references to rgb16 fixed point back to gen5 / Ironlake.
> =

> fp16 has been around since forever (gen4+)
> uint16 is much more recent, IIRC is something ~glk+

FYI I just hacked something together for i915:
git://github.com/vsyrjala/linux.git uint16

Tests seem to pass on a glk here at least.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
