Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4550AB0B6BC
	for <lists+amd-gfx@lfdr.de>; Sun, 20 Jul 2025 17:33:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CE2E10E37E;
	Sun, 20 Jul 2025 15:32:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=hacktheplanet.fi header.i=@hacktheplanet.fi header.b="YeiRoC5A";
	dkim=pass (2048-bit key; unprotected) header.d=hacktheplanet.fi header.i=@hacktheplanet.fi header.b="mGGitpLg";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com
 [91.218.175.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24FCC10E1B4
 for <amd-gfx@lists.freedesktop.org>; Sun, 20 Jul 2025 09:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; s=gibson; bh=c6xLT7R4rsPrc
 ZoIIXPvKmVYK+4perYCo/WWrcY3+H8=;
 h=in-reply-to:references:subject:cc:
 to:from:date; d=hacktheplanet.fi; b=YeiRoC5Aqj4UkkdNbZyb6sXT/F6KQ+wqRL
 otau/GYjH8fD9pvDfwmEvtwJrjHiKTzAyHOhElCTYvtzSlovQn+PlKYAYS5B2298BumJip
 Mzex9m1PL+GMIsynAHVwiyid4K4oGjN2iwL8nvksXG9y6NSgnjbtqyiMkC6F2XtlV18/un
 Y9Zse3+h2ycny7P68tygZ88Fqx5cx9sbtnd4vQXw6WL30/CjhW2aWTcToxWzE6EzbHjVBz
 HCJhIUo4sN4bvBpR/9uI08nSeDG87mCHtnVldqSCUy2FAfe8tlbhwigl/Jn32warU6ReKF
 5gf4cmumh/8pzDXnIggAwrviy/JQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hacktheplanet.fi;
 s=key1; t=1753004100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WuGfig2RuolkoRHs6+n/AApMMpUjfPdDzkJW9yTyPJM=;
 b=mGGitpLg4MMvtETi8+65DMmcDXb0Aj5ya/nj3u+oeI3RhNiNX8S+si8C/a3YQDrGx6q1FA
 Idhd2mKJ8jMMDmCUtUgA+DJXCjwOC6opzp5X7pwAoQQX4RRuNNRNgTpoxPUgeQynF2ibon
 M5bpsOUW2DD+K4Z5Ic7qfmfr4Kyg5G968ygo2cF67kycyB8or7tN6s0zLr65y8Ob0JPm0v
 62lfmCcNJk4yyAgPuto25VJdYvNPtYJFeElsVdXhrpibCKmTC+syHv2/Gvx6YA9pbBP5ga
 PI4UpAhqtKSBInDEL6P+XlwFFppH/OaQulP9OyGB0jfj9ydJBeMXXY2GrZGXkQ==
Date: Sun, 20 Jul 2025 18:34:50 +0900
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Lauri Tirkkonen <lauri@hacktheplanet.fi>
To: Mario Limonciello <superm1@kernel.org>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev,
 amd-gfx@lists.freedesktop.org, Wayne Lin <wayne.lin@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [REGRESSION] drm/amd/display: backlight brightness set to 0 at
 amdgpu initialization
Message-ID: <aHy4Ols-BZ3_UgQQ@hacktheplanet.fi>
References: <aHn33vgj8bM4s073@hacktheplanet.fi>
 <d92458bf-fc2b-47bf-b664-9609a3978646@kernel.org>
 <aHpb4ZTZ5FoOBUrZ@hacktheplanet.fi>
 <46de4f2a-8836-42cd-a621-ae3e782bf253@kernel.org>
 <aHru-sP7S2ufH7Im@hacktheplanet.fi>
 <664c5661-0fa8-41db-b55d-7f1f58e40142@kernel.org>
 <aHr--GxhKNj023fg@hacktheplanet.fi>
 <f12cfe85-3597-4cf7-9236-3e00f16c3c38@kernel.org>
 <cc7a41dc-066a-41c8-a271-7e4c92088d65@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cc7a41dc-066a-41c8-a271-7e4c92088d65@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Sun, 20 Jul 2025 15:32:54 +0000
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

On Sat, Jul 19 2025 12:39:45 -0500, Mario Limonciello wrote:
> On 7/19/25 10:25 AM, Mario Limonciello wrote:
> > 
> > 
> > On 7/18/25 9:12 PM, Lauri Tirkkonen wrote:
> > > On Fri, Jul 18 2025 20:14:08 -0500, Mario Limonciello wrote:
> > > > OK, I think we need to do two things to figure out what's going on.
> > > > 
> > > > 1) Let's shift over to 6.16-rc6.  Once we've got a handle on the
> > > > situation
> > > > there we can iron out if there are other patches missing or this is also
> > > > broken for you in 6.16.  If it's not working as expected there either we
> > > > need it fixed there first anyway.
> > > 
> > > Same behavior on 6.16-rc6: brightness is set to 0 (max 399000),
> > > minimally visible.
> > > 
> > > > 2) The starting brightness I don't expect to be "0".  We need to
> > > > see what
> > > > values were read out from the firmware. There is a debugging
> > > > message we can
> > > > catch if you boot with drm.debug=0x106.  Keep in mind you
> > > > probably need to
> > > > increase log_buf_len if your ring buffer is set too small too.
> > > > 
> > > > https://github.com/torvalds/linux/
> > > > commit/4b61b8a390511a1864f26cc42bab72881e93468d
> > > > 
> > > > PS: I would rather you add logs into a gist, pastebin or a bug
> > > > somewhere if
> > > > you can.
> > > 
> > > [    3.210757] amdgpu 0000:03:00.0:
> > > [drm:amdgpu_dm_connector_late_register [amdgpu]] Backlight caps:
> > > min: 1000, max: 400000, ac 100, dc 32
> > > 
> > > full dmesg: https://termbin.com/o2q3
> > > 
> > 
> > Thanks for sharing.  Can you get me an updated output with
> > drm.debug=0x106 set and with this applied?  I want to see what values
> > were set.
> > 
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/
> > drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > index 5df7f8c34231..cdc43cfb39dd 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > @@ -10489,8 +10489,12 @@ static void amdgpu_dm_atomic_commit_tail(struct
> > drm_atomic_state *state)
> >          /* restore the backlight level */
> >          for (i = 0; i < dm->num_of_edps; i++) {
> >                  if (dm->backlight_dev[i] &&
> > -                   (dm->actual_brightness[i] != dm->brightness[i]))
> > +                   (dm->actual_brightness[i] != dm->brightness[i])) {
> > +                       drm_WARN(adev_to_drm(adev), true,
> > +                                       "Backlight level %d does not
> > match actual brightness %d for edp %d\n",
> > +                                       dm->brightness[i], dm-
> > >actual_brightness[i], i);
> >                          amdgpu_dm_backlight_set_level(dm, i, dm-
> > >brightness[i]);
> > +                   }
> >          }
> > 
> >          /*
> > 
> > Also, does turning off custom brightness curves
> > (amdgpu.dcdebugmask=0x40000) help?
> > 
> 
> In advance of getting that updated log; I have a theory what's going on.  I
> think the first value programmed to brightness happens as part of that very
> first modeset.
> 
> If that's what's going on, then I think doing an explicit programming cycle
> at the backlight registration will help.  Here's a potential patch.
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index b19e7964060d..4b99efbaf481 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -4996,6 +4996,8 @@ amdgpu_dm_register_backlight_device(struct
> amdgpu_dm_connector *aconnector)
>                 dm->backlight_dev[aconnector->bl_idx] = NULL;
>         } else
>                 drm_dbg_driver(drm, "DM: Registered Backlight device: %s\n",
> bl_name);
> +
> + amdgpu_dm_backlight_update_status(dm->backlight_dev[aconnector->bl_idx]);
>  }
> 
>  static int initialize_plane(struct amdgpu_display_manager *dm,

This patch was malformed, so I applied it manually. It didn't help
though - brightness still zero.

I came up with a patch that does help; will post in this thread shortly.

-- 
Lauri Tirkkonen | lotheac @ IRCnet
