Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE75A9F62AE
	for <lists+amd-gfx@lfdr.de>; Wed, 18 Dec 2024 11:21:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2464210E3B4;
	Wed, 18 Dec 2024 10:21:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="CAOoW0+I";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C62D10E3B4
 for <amd-gfx@lists.freedesktop.org>; Wed, 18 Dec 2024 10:21:25 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-385d7b4da2bso5893119f8f.1
 for <amd-gfx@lists.freedesktop.org>; Wed, 18 Dec 2024 02:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1734517284; x=1735122084; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=FV9RIAFVRvDFDmdMsVZu4X1o1igpKV8FsMbYCMRCHMA=;
 b=CAOoW0+IxvpzfuGHMqUQnXQilDBlvwNyP8lqLiHuqmIjepPNxaTpjIrmKi8DY3zacx
 6+SsI6ZFj3J2TxzauX7k6O52H2xhucp6CnoAu1cCH9WwYwvHS7u0Ib50SOUqqJedt2ka
 4Pcd6H9uf9Z8dqIP+beDnyKfPi2GtdgatWxyc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734517284; x=1735122084;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FV9RIAFVRvDFDmdMsVZu4X1o1igpKV8FsMbYCMRCHMA=;
 b=Y3Q5ecE1780tP1oKxhbw09emEgGnrRyrKtyPVziKRUqtwhVemy+hvcRxFGKssPkKKC
 Z5ZRynpJshyPuxRcAWine66omgHVB8hq8yXsDMigsJf4ueW1jxE2LAxUAeflkDK5hl3i
 n8LqIVjfLHHCuUKQ2uv8WHB6BR3Ic5092xBRzwceQdSpRE7KWcx6/rIGMOkwzBW/iQVR
 ijv5skK/eC1Cv4QTxKl8tKvf1SshtI4OcGvAx4MzAN63+vBzRnVXoeHS5TKRFPUdN2E4
 3IAAU5fsPmbZ1C3+B2B0BnS0kWd5sFq8pM6LpoWKv6OY1HOZCXU3byZ7HHorIgHF3zMj
 CFkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXf6Ao9EuE6aNB6bLcn5+pgThiyIo/Ytr0W+3que2eUOrcC+0Wl8m9rSVw0w/VCTHKfQmZ8Es3E@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw8niSbhodvOPzSyGRrfGCHq7UC8UqA6e17VexNIRxnSnJuHJif
 JuRaqtybRB0nwmAZ47Wf6rHCPmsIJT8SYKkCfuFDVe6LMTHAnapgmBmLfiz4eOo=
X-Gm-Gg: ASbGncuvPcW0CmHzUrbMhoRrH7j0w4aOSqyJSpTHf7JHq0RSNSv/yaVjI4v0/s42TS2
 DK+kX2KYpwFZicI0pRTqn68jGxAH+YwOuLRTWpw2VLTCD9cTut3I62nyEJDOtlV9wbglYNgLyDr
 NCyUPhPZIUwOu6M/kfOk/DV84whx9gzM3KRMv3be2vcEv6E0ZzdwNW1NH3Fb8GDDkvCdqW5H1c/
 A4r02TkixQihelh4+plG0mcOhfgJhodaV5b7gSSwROaZSLU2YEudWKLj3MMSphZx+38
X-Google-Smtp-Source: AGHT+IElOtM316I14yY/dMyCp6WFt9+JX/S9AUavKdsLuUrnsCfTAB+Iz6Xb9Ew/NaQh1GkQYNaxzg==
X-Received: by 2002:adf:9788:0:b0:385:f909:eb2c with SMTP id
 ffacd0b85a97d-388e4db328cmr1764566f8f.38.1734517284228; 
 Wed, 18 Dec 2024 02:21:24 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-388c801a7c8sm13916066f8f.49.2024.12.18.02.21.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 02:21:23 -0800 (PST)
Date: Wed, 18 Dec 2024 11:21:21 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Marek =?utf-8?B?T2zFocOhaw==?= <maraeo@gmail.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>,
 Lucas Stach <l.stach@pengutronix.de>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel.daenzer@mailbox.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>
Subject: Re: [PATCH] drm/fourcc: add LINEAR modifiers with an exact pitch
 alignment
Message-ID: <Z2KiIY093-AkUBW5@phenom.ffwll.local>
References: <CAAxE2A5BkF13bFt8_UnuiqPM8W-ZESgmKEjqqGfv=DGzSfJ7aQ@mail.gmail.com>
 <340ed70a-a576-43c6-86ff-9b58ed513c72@mailbox.org>
 <a42981617e880d48e9614c9ab5a8892f7ae0a315.camel@pengutronix.de>
 <Z2A-1i6YiPSjdUnP@phenom.ffwll.local>
 <CAAxE2A7BnDR4LafUzS-JofF7=jvnMU6osiKx14Ce7mwFjynGbA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAxE2A7BnDR4LafUzS-JofF7=jvnMU6osiKx14Ce7mwFjynGbA@mail.gmail.com>
X-Operating-System: Linux phenom 6.12.3-amd64 
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Mon, Dec 16, 2024 at 04:58:20PM -0500, Marek Olšák wrote:
> On Mon, Dec 16, 2024 at 9:53 AM Simona Vetter <simona.vetter@ffwll.ch>
> wrote:
> 
> > On Mon, Dec 16, 2024 at 11:46:13AM +0100, Lucas Stach wrote:
> > > Am Montag, dem 16.12.2024 um 10:27 +0100 schrieb Michel Dänzer:
> > > > On 2024-12-15 21:53, Marek Olšák wrote:
> > > > > The comment explains the problem with DRM_FORMAT_MOD_LINEAR.
> > > > >
> > > > > Signed-off-by: Marek Olšák <marek.olsak@amd.com <mailto:
> > marek.olsak@amd.com>>
> > > > >
> > > > > diff --git a/include/uapi/drm/drm_fourcc.h
> > b/include/uapi/drm/drm_fourcc.h
> > > > > index 78abd819fd62e..8ec4163429014 100644
> > > > > --- a/include/uapi/drm/drm_fourcc.h
> > > > > +++ b/include/uapi/drm/drm_fourcc.h
> > > > > @@ -484,9 +484,27 @@ extern "C" {
> > > > >   * modifier (e.g. not setting DRM_MODE_FB_MODIFIERS in the
> > DRM_ADDFB2 ioctl),
> > > > >   * which tells the driver to also take driver-internal information
> > into account
> > > > >   * and so might actually result in a tiled framebuffer.
> > > > > + *
> > > > > + * WARNING:
> > > > > + * There are drivers out there that expose DRM_FORMAT_MOD_LINEAR,
> > but only
> > > > > + * support a certain pitch alignment and can't import images with
> > this modifier
> > > > > + * if the pitch alignment isn't exactly the one supported. They can
> > however
> > > > > + * allocate images with this modifier and other drivers can import
> > them only
> > > > > + * if they support the same pitch alignment. Thus,
> > DRM_FORMAT_MOD_LINEAR is
> > > > > + * fundamentically incompatible across devices and is the only
> > modifier that
> > > > > + * has a chance of not working. The PITCH_ALIGN modifiers should be
> > used
> > > > > + * instead.
> > > > >   */
> > > > >  #define DRM_FORMAT_MOD_LINEAR  fourcc_mod_code(NONE, 0)
> > > > >
> > > > > +/* Linear layout modifiers with an explicit pitch alignment in
> > bytes.
> > > > > + * Exposing this modifier requires that the pitch alignment is
> > exactly
> > > > > + * the number in the definition.
> > > > > + */
> > > > > +#define DRM_FORMAT_MOD_LINEAR_PITCH_ALIGN_64B fourcc_mod_code(NONE,
> > 1)
> > > >
> > > > It's not clear what you mean by "requires that the pitch alignment is
> > exactly
> > > > the number in the definition", since a pitch which is aligned to 256
> > bytes is
> > > > also aligned to 128 & 64 bytes. Do you mean the pitch must be exactly
> > the width
> > > > rounded up to the next / smallest possible multiple of the specified
> > number of bytes?
> > >
> > > I guess that's the intention here, as some AMD GPUs apparently have
> > > this limitation that they need an exact aligned pitch.
> > >
> > > If we open the can of worms to overhaul the linear modifier, I think it
> > > would make sense to also add modifiers for the more common restriction,
> > > where the pitch needs to be aligned to a specific granule, but the
> > > engine doesn't care if things get overaligned to a multiple of the
> > > granule. Having both sets would probably make it easier for the reader
> > > to see the difference to the exact pitch modifiers proposed in this
> > > patch.
> >
> > Yeah I think with linear modifiers that sepcificy alignment limitations we
> > need to be _extremely_ precise in what exactly is required, and what not.
> > There's all kinds of hilarious stuff that might be incompatible, and if we
> > don't mind those we're right back to the "everyone agrees on what linear
> > means" falacy.
> >
> > So if pitch must be a multiple of 64, but cannot be a multiple of 128
> > (because the hw does not cope with the padding, then that's important).
> > Other things are alignment constraints on the starting point, and any
> > padding you need to add at the bottom (yeah some hw overscans and gets
> > pissed if there's not memory there). So I think it's best to go overboard
> > here with verbosity.
> >
> > There's also really funny stuff like power-of-two alignment and things
> > like that, but I guess we'll get there if that's ever needed. That's also
> > why I think we don't need to add all possible linear modifiers from the
> > start, unless there's maybe too much confusion with stuff like "exactly
> > 64b aligned pitch" and "at least 64b aligned pitch, but you can add lots
> > of padding if you feel like".
> >
> 
> Would it be possible and acceptable to require that the offset alignment is
> always 4K and the slice padding is also always 4K to simplify those
> constraints?

For modifiers in general my take is to try to as closely and exhaustively
as possible document the actual hw requirements, and not try to be clever.
I fear otherwise we'll end up in a case of "works for my case" and then
someone uses modifiers in a novel way and it again falls apart.

But also worst case we'll just deprecate underdefinied modifiers and roll
out new ones (like here), if we've missed a corner case. It happens.

If that means we'll end up with modifiers that are strict subsets you can
just add more modifiers to drivers to make things work. Or if there's
awkward overlaps, we can make a new linear modifier with the common
constraints and roll them to all drivers that want to interop. So
shouldn't be an issue if we encounter interop incompatibilites, I just
feel that trying to worry about this preemptively could likely lead to
more trouble and not actually solve any real ones that will pop up in the
future. Because accurately predicting the future is just too hard.
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
