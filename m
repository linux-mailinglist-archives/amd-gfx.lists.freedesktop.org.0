Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A35E2AC659
	for <lists+amd-gfx@lfdr.de>; Mon,  9 Nov 2020 21:52:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5F13894DE;
	Mon,  9 Nov 2020 20:52:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 090E7894DD;
 Mon,  9 Nov 2020 20:52:40 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 6C7A220037;
 Mon,  9 Nov 2020 21:52:37 +0100 (CET)
Date: Mon, 9 Nov 2020 21:52:36 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 17/19] drm/radeon/radeon_kms: Fix misnaming of
 'radeon_info_ioctl's dev param
Message-ID: <20201109205236.GA1952447@ravnborg.org>
References: <20201106214949.2042120-1-lee.jones@linaro.org>
 <20201106214949.2042120-18-lee.jones@linaro.org>
 <CADnq5_Nys7igVo3sgzK0D4hnm=RHMrEM7Xty80jGROu_sy5svA@mail.gmail.com>
 <20201109195557.GA1940813@ravnborg.org>
 <20201109201013.GC2063125@dell>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201109201013.GC2063125@dell>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VbvZwmh9 c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=8nJEP1OIZ-IA:10 a=KKAkSRfTAAAA:8 a=zd2uoN0lAAAA:8 a=e5mUnYsNAAAA:8
 a=MD3Tup5W8YOSqjGhFEoA:9 a=wPNLvfGTeEIA:10 a=cvBusfyB2V15izCimMoJ:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexdeucher@gmail.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Mon, Nov 09, 2020 at 08:10:13PM +0000, Lee Jones wrote:
> On Mon, 09 Nov 2020, Sam Ravnborg wrote:
> =

> > Hi Alex,
> > On Mon, Nov 09, 2020 at 02:50:35PM -0500, Alex Deucher wrote:
> > > On Fri, Nov 6, 2020 at 4:50 PM Lee Jones <lee.jones@linaro.org> wrote:
> > > >
> > > > Fixes the following W=3D1 kernel build warning(s):
> > > >
> > > >  drivers/gpu/drm/radeon/radeon_kms.c:226: warning: Function paramet=
er or member 'dev' not described in 'radeon_info_ioctl'
> > > >  drivers/gpu/drm/radeon/radeon_kms.c:226: warning: Excess function =
parameter 'rdev' description in 'radeon_info_ioctl'
> > > >
> > > > Cc: Alex Deucher <alexander.deucher@amd.com>
> > > > Cc: "Christian K=F6nig" <christian.koenig@amd.com>
> > > > Cc: David Airlie <airlied@linux.ie>
> > > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > > Cc: amd-gfx@lists.freedesktop.org
> > > > Cc: dri-devel@lists.freedesktop.org
> > > > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > > > ---
> > > >  drivers/gpu/drm/radeon/radeon_kms.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/radeon/radeon_kms.c b/drivers/gpu/drm/=
radeon/radeon_kms.c
> > > > index 0d8fbabffcead..21c206795c364 100644
> > > > --- a/drivers/gpu/drm/radeon/radeon_kms.c
> > > > +++ b/drivers/gpu/drm/radeon/radeon_kms.c
> > > > @@ -213,7 +213,7 @@ static void radeon_set_filp_rights(struct drm_d=
evice *dev,
> > > >  /**
> > > >   * radeon_info_ioctl - answer a device specific request.
> > > >   *
> > > > - * @rdev: radeon device pointer
> > > > + * @dev: radeon device pointer
> > > =

> > > This should be:
> > > + * @dev: drm device pointer
> > =

> > good spot. I am continuing the work on radeon and will post a patchset
> > that contains only radeon fixes with Lee's patches and a few more by me.
> > I will fix the above.
> =

> What do you mean by "continuing on"?
> =

> How will you prevent your work from conflicting with my current effort?

Quoting from previous mail in this thread:

  "
  > > How would you like me to move forward?
  >
  > Fix the thousand of warnings in other places :-)
  > I will take a look at radeon and post a new series based on your work
  > with all W=3D1 warnings fixed.

  I'll drop this patch and carry on ploughing through the rest of them.
"

Here I promised you to fix all warnings in the radeon driver.
And despite this being more work than anticipated a promise is a
promise. So therefore I started working on this.

If you want to do the rest of the radeon driver you are welcome and I
will gladly drop this again. Just let me know your preference.

	Sam
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
