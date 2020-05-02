Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 032C11C23D7
	for <lists+amd-gfx@lfdr.de>; Sat,  2 May 2020 09:27:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88A136E02F;
	Sat,  2 May 2020 07:27:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB5B06E02F
 for <amd-gfx@lists.freedesktop.org>; Sat,  2 May 2020 07:27:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6B6B0AC91;
 Sat,  2 May 2020 07:27:32 +0000 (UTC)
Date: Sat, 02 May 2020 09:27:31 +0200
Message-ID: <s5h368iiyos.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH 0/1] Fiji GPU audio register timeout when in BACO state
In-Reply-To: <20200502071728.fn2fcqvt6aies3zu@wunner.de>
References: <PSXP216MB043822350CDE9E7EEA37730880AD0@PSXP216MB0438.KORP216.PROD.OUTLOOK.COM>
 <CADnq5_MCQ7xHY=yhNtRW=ze0LRPzxuu-Mm7pD4kFa5R52UrGSw@mail.gmail.com>
 <s5h1ro6jn0v.wl-tiwai@suse.de>
 <CADnq5_Mjb_FnNOzjUfJZ7GSDzi-+Cfc1ZTuqm7UWCWVvY6DU_w@mail.gmail.com>
 <s5hwo5xj98v.wl-tiwai@suse.de>
 <PSXP216MB0438FE3E1CA577805BEC23C880AA0@PSXP216MB0438.KORP216.PROD.OUTLOOK.COM>
 <s5hh7x0kiwb.wl-tiwai@suse.de>
 <PSXP216MB04381A30909F66867E6B6BCC80AA0@PSXP216MB0438.KORP216.PROD.OUTLOOK.COM>
 <s5h1ro4kgog.wl-tiwai@suse.de> <s5h7dxuizep.wl-tiwai@suse.de>
 <20200502071728.fn2fcqvt6aies3zu@wunner.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI/1.14.6 (Maruoka)
 FLIM/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL/10.8 Emacs/25.3
 (x86_64-suse-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI 1.14.6 - "Maruoka")
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
Cc: "Zhou, David\(ChunMing\)" <David1.Zhou@amd.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Nicholas Johnson <nicholas.johnson-opensource@outlook.com.au>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Takashi Iwai <tiwai@suse.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, Alex Deucher <alexdeucher@gmail.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Sat, 02 May 2020 09:17:28 +0200,
Lukas Wunner wrote:
> 
> On Sat, May 02, 2020 at 09:11:58AM +0200, Takashi Iwai wrote:
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > @@ -673,6 +673,12 @@ static int amdgpu_dm_audio_component_bind(struct device *kdev,
> >  	struct amdgpu_device *adev = dev->dev_private;
> >  	struct drm_audio_component *acomp = data;
> >  
> > +	if (!device_link_add(hda_kdev, kdev, DL_FLAG_STATELESS |
> > +			     DL_FLAG_PM_RUNTIME)) {
> > +		DRM_ERROR("DM: cannot add device link to audio device\n");
> > +		return -ENOMEM;
> > +	}
> > +
> 
> Doesn't this duplicate drivers/pci/quirks.c:quirk_gpu_hda() ?

Gah, you're right, that was the place I overlooked.
It was a typical "false Eureka right-after-wakeup" phenomenon :)
Need a vaccine aka coffee...

So the runtime PM dependency must be already placed there, and the
problem is not the lack of the dependency tree but the really other
timing issue.  Back to square.


thanks,

Takashi
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
