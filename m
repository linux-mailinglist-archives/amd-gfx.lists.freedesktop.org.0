Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E24C592B4C8
	for <lists+amd-gfx@lfdr.de>; Tue,  9 Jul 2024 12:09:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B29010E4EA;
	Tue,  9 Jul 2024 10:09:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="WQpZqsXt";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63DC210E507
 for <amd-gfx@lists.freedesktop.org>; Tue,  9 Jul 2024 10:09:16 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4210f0bb857so5842075e9.1
 for <amd-gfx@lists.freedesktop.org>; Tue, 09 Jul 2024 03:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1720519754; x=1721124554; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=N116s5bsFDgCuOUDWfC538633m2LGema8YibI/w3XO0=;
 b=WQpZqsXtie/AeY6O43d+LNyBQ6kKRwU56KgeYcLx8pe5fLR3UWephB6j3cqtQVWN5y
 aHFEh/M5CQb1vyl8ngUZf+361Qcuf+5pbUgZJlqcTrhErNqKKhmV/CenI+qK87z1SAlb
 itO/TVHpIT56mDD0h9K2djC5NKVPIbi8DyI5g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720519754; x=1721124554;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N116s5bsFDgCuOUDWfC538633m2LGema8YibI/w3XO0=;
 b=q/oVJIibiJADHqeFN3u6Obzy6PiVmjr54M51J0RqgBpCs8huwEZYrgEt46sBM4aMAr
 jkXwyRHkhv1F0lg24X4EcSCRzdFTPOQCeLzw1RJv0Yy/5MWH7XuEOXDN8NdNpxwYY6/l
 P2iR+uHaJ2l+PcQkUERz12Hf8Me3lgK2t7nx+xLhl+D9i4mATaaoT2ISyX94D7bP3CMD
 DDptfNx6z9LZOh/jZa4hsll1ojoNOq/lvZ0Mmf4J2QfKitACeM2wtHDyGpeXeXOxSA8z
 tKliz3nhxDmcmckCXcg2BEgnG24rjb5KowodInc7z7qW9EK9Ba3CHifu/L+dwE4cJs2y
 d5xw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTKJa6Q9NfqU1hgC0he/89MFdJfP4TEb3u8+M0iV2iOEB/XL/beAwXZUgeyWUZwaGOmvCYZS1aEV1i2u8NUP7eIfZHFZaPA9kxbVozpw==
X-Gm-Message-State: AOJu0Yzi5pnoU3teUiSylxar4jmpvbgoBa6x3btitLVC1U5O6CulAKqK
 iE6iWNizwNifvsV9ItYD8N87yQsCdoOz8DWIWwzgwf9gw0R8Dkox6CuLrsWBAiM=
X-Google-Smtp-Source: AGHT+IE3mFJrI0mQL4jaEJ2DSbAXMKWTEqEY8de3yAEaCaTUU3lsXsEV6aU+P50/ApWw/4SGjslzsA==
X-Received: by 2002:a05:6000:4023:b0:366:eb60:bcf2 with SMTP id
 ffacd0b85a97d-367ceac5047mr1351844f8f.4.1720519754446; 
 Tue, 09 Jul 2024 03:09:14 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cdfab7d4sm2067803f8f.113.2024.07.09.03.09.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jul 2024 03:09:14 -0700 (PDT)
Date: Tue, 9 Jul 2024 12:09:12 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Hamza Mahfooz <hamza.mahfooz@amd.com>
Cc: dri-devel@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <rodrigo.siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Hung <alex.hung@amd.com>, Wayne Lin <wayne.lin@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH 2/2] drm/amd/display: use drm_crtc_set_vblank_offdelay()
Message-ID: <Zo0MSB7eSp1H0iPI@phenom.ffwll.local>
References: <20240708202907.383917-1-hamza.mahfooz@amd.com>
 <20240708202907.383917-2-hamza.mahfooz@amd.com>
 <Zo0Dm_XeF3dMqK1C@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zo0Dm_XeF3dMqK1C@phenom.ffwll.local>
X-Operating-System: Linux phenom 6.9.7-amd64 
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

On Tue, Jul 09, 2024 at 11:32:11AM +0200, Daniel Vetter wrote:
> On Mon, Jul 08, 2024 at 04:29:07PM -0400, Hamza Mahfooz wrote:
> > Hook up drm_crtc_set_vblank_offdelay() in amdgpu_dm, so that we can
> > enable PSR more quickly for displays that support it.
> > 
> > Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
> > ---
> >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 30 ++++++++++++++-----
> >  1 file changed, 22 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > index fdbc9b57a23d..ee6c31e9d3c4 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > @@ -8231,7 +8231,7 @@ static int amdgpu_dm_encoder_init(struct drm_device *dev,
> >  
> >  static void manage_dm_interrupts(struct amdgpu_device *adev,
> >  				 struct amdgpu_crtc *acrtc,
> > -				 bool enable)
> > +				 struct dm_crtc_state *acrtc_state)
> >  {
> >  	/*
> >  	 * We have no guarantee that the frontend index maps to the same
> > @@ -8239,12 +8239,25 @@ static void manage_dm_interrupts(struct amdgpu_device *adev,
> >  	 *
> >  	 * TODO: Use a different interrupt or check DC itself for the mapping.
> >  	 */
> > -	int irq_type =
> > -		amdgpu_display_crtc_idx_to_irq_type(
> > -			adev,
> > -			acrtc->crtc_id);
> > +	int irq_type = amdgpu_display_crtc_idx_to_irq_type(adev,
> > +							   acrtc->crtc_id);
> > +	struct dc_crtc_timing *timing;
> > +	int offdelay;
> > +
> > +	if (acrtc_state) {
> > +		timing = &acrtc_state->stream->timing;
> > +
> > +		/* at least 2 frames */
> > +		offdelay = 2000 / div64_u64(div64_u64((timing->pix_clk_100hz *
> > +						       (uint64_t)100),
> > +						      timing->v_total),
> > +					    timing->h_total) + 1;
> 
> Yeah, _especially_ when you have a this short timeout your really have to
> instead fix the vblank driver code properly so you can enable
> vblank_disable_immediate. This is just cheating :-)

Michel mentioned on irc that DC had immediate vblank disabling, but this
was reverted with f64e6e0b6afe ("Revert "drm/amdgpu/display: set
vblank_disable_immediate for DC"").

I haven't looked at the details of the bug report, but stuttering is
exactly what happens when the driver's vblank code has these races. Going
for a very low timeout instead of zero just means it's a bit harder to hit
the issue, and much, much harder to debug properly.

So yeah even more reasons to look at the underlying root-cause here I
think.
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
