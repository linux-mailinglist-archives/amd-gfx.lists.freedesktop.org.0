Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB86943770
	for <lists+amd-gfx@lfdr.de>; Wed, 31 Jul 2024 22:55:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6100D10E6CA;
	Wed, 31 Jul 2024 20:55:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="k4OFa/iQ";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A79610E6CA
 for <amd-gfx@lists.freedesktop.org>; Wed, 31 Jul 2024 20:55:27 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-36841f56cf6so761804f8f.3
 for <amd-gfx@lists.freedesktop.org>; Wed, 31 Jul 2024 13:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1722459326; x=1723064126; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=czXRHy0hc+wPP5wtP/ukRAF9X8vY1DORbIlGLuoSDRQ=;
 b=k4OFa/iQm/IiLoQ2G804fzGTCcvTJC8JDwbzc6XW9RrpJooWZgwS8HNxf2EuR68/S/
 l8B1Gbqba79aSkRaxB/pTc+zIJ+bZqhNBVkneOUfDMM9m53mMXF3Tw1h3bKkucJBY2SN
 mva9KK9XrU/YUsVgAUuWPJgMta60eMzPIpauo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722459326; x=1723064126;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=czXRHy0hc+wPP5wtP/ukRAF9X8vY1DORbIlGLuoSDRQ=;
 b=a/BYvZi9G2P1RxybXmOXsRotJ6fmBxVclueLt4kjZgVm6xgQ0HvP3P8AJA3NuZk1eR
 iElWmYt6Ri7ko3lfZuNl2Ut7f+UrBgxD7KYS//n/ok+KXeapyHpUoA/Qfp7nbNviXvoq
 DqEDmBXWny3Kdxdp+bG4gaqhLup+Sj7z0oYDrFAgcuDTya9HZTi1ohuXLGkDulowyyvS
 zDpnTM53x8xriZrTg3l/oYyfBZrHTc1FdePmwHVvQAp2vNES7r2cgL/QPxVynAA8hW2E
 BHlv9wSSFGDVIJauWmAia/6QGfAecTrE45EvXm83mKs9JSLgi+oOzsRf8TVhUVzXeOVG
 A6vg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPxHIAqbYrKENMGxKXL4a7lycF1hWNeQUqy/hL4TsTXKqa7ddeSMwfxw+kM2PK1cr2Ks9o20YG@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/ya83Ovr2n9dsSDesp1+px8Otd1SbINhutODRVu/ot00DG1qJ
 N7W6D3GI+Id7pvyoeB5YLvkkF+FU5+zXeTZ26m7O0BBKE0TqytWVJFGaNeAUbUc=
X-Google-Smtp-Source: AGHT+IFn6J60Ck+bfFIRb4T0kdCPpvHeHtGytipJFG8R9nAZz1MYoHJtc6h7xwQvbxy+k2zbiO/M8A==
X-Received: by 2002:a05:6000:1542:b0:366:ea51:be79 with SMTP id
 ffacd0b85a97d-36baaf4edd0mr199684f8f.6.1722459326061; 
 Wed, 31 Jul 2024 13:55:26 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36b36858179sm17957622f8f.88.2024.07.31.13.55.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Jul 2024 13:55:25 -0700 (PDT)
Date: Wed, 31 Jul 2024 22:55:23 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Matt Hartley <matt.hartley@gmail.com>, Kieran Levin <ktl@framework.net>,
 Hans de Goede <hdegoede@redhat.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dustin Howett <dustin@howett.net>
Subject: Re: [PATCH v3 0/2] drm: minimum backlight overrides and
 implementation for amdgpu
Message-ID: <Zqqku_zS7CpPGbzW@phenom.ffwll.local>
Mail-Followup-To: Jani Nikula <jani.nikula@linux.intel.com>,
 Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Matt Hartley <matt.hartley@gmail.com>,
 Kieran Levin <ktl@framework.net>,
 Hans de Goede <hdegoede@redhat.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dustin Howett <dustin@howett.net>
References: <20240731-amdgpu-min-backlight-quirk-v3-0-46d40bb21a62@weissschuh.net>
 <87v80lwjcz.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87v80lwjcz.fsf@intel.com>
X-Operating-System: Linux phenom 6.9.10-amd64 
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

On Wed, Jul 31, 2024 at 08:40:12PM +0300, Jani Nikula wrote:
> On Wed, 31 Jul 2024, Thomas Wei�schuh <linux@weissschuh.net> wrote:
> > The value of "min_input_signal" returned from ATIF on a Framework AMD 13
> > is "12". This leads to a fairly bright minimum display backlight.
> >
> > Add a generic override helper for the user to override the settings
> > provided by the firmware through the kernel cmdline.
> > Also add amdgpu as a user of that helper.
> >
> > One solution would be a fixed firmware version, which was announced but
> > has no timeline.
> 
> The flip side is that if we add this now, it pretty much has a timeline:
> We'll have to carry and support it forever.
> 
> It's not a great prospect for something so specific. Not to mention that
> the limits are generally there for electrical minimums that should not
> be overridden. And before you know it, we'll have bug reports about
> flickering screens...

Yeah I think for this specific case where a fixed firmware is already
kinda promised, a quirk is the right fix. Otherwise we open up a can of
worms here ... so personally I like v2 a lot more.
-Sima

> 
> BR,
> Jani.
> 
> 
> >
> > This helper does conflict with the mode override via the cmdline.
> > Only one can be specified.
> > IMO the mode override can be extended to also handle "min-brightness"
> > when that becomes necessary.
> >
> > ---
> > Changes in v3:
> > - Switch to cmdline override parameter
> > - Link to v2: https://lore.kernel.org/r/20240623-amdgpu-min-backlight-quirk-v2-0-cecf7f49da9b@weissschuh.net
> >
> > Changes in v2:
> > - Introduce proper drm backlight quirk infrastructure
> > - Quirk by EDID and DMI instead of only DMI
> > - Limit quirk to only single Framework 13 matte panel
> > - Link to v1: https://lore.kernel.org/r/20240610-amdgpu-min-backlight-quirk-v1-1-8459895a5b2a@weissschuh.net
> >
> > ---
> > Thomas Wei�schuh (2):
> >       drm/connector: add drm_connector_get_cmdline_min_brightness_override()
> >       drm/amd/display: implement minimum brightness override
> >
> >  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  6 ++++
> >  drivers/gpu/drm/drm_connector.c                   | 34 +++++++++++++++++++++++
> >  include/drm/drm_connector.h                       |  2 ++
> >  3 files changed, 42 insertions(+)
> > ---
> > base-commit: 36821612eb3091a21f7f4a907b497064725080c3
> > change-id: 20240610-amdgpu-min-backlight-quirk-8402fd8e736a
> >
> > Best regards,
> 
> -- 
> Jani Nikula, Intel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
