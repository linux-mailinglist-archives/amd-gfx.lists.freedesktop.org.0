Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6339F34AC
	for <lists+amd-gfx@lfdr.de>; Mon, 16 Dec 2024 16:39:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2F3210E1C2;
	Mon, 16 Dec 2024 15:39:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FmB3d/UV";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D7FD10E27F
 for <amd-gfx@lists.freedesktop.org>; Mon, 16 Dec 2024 15:39:34 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id
 3f1490d57ef6-e46ac799015so1768212276.0
 for <amd-gfx@lists.freedesktop.org>; Mon, 16 Dec 2024 07:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734363573; x=1734968373; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XE8Rp1QeAFeNcwGnjINgL1qZo7r+EId51k/PevPG3+0=;
 b=FmB3d/UV5abFEaEi1IURSo7CR4wq33KDmBWQwEciKcFGkOwZSDf/3efB9WYcSW9afu
 lh4Rt7Ek2cuhpKO4yl3thgizcVS1zgpTjhgouOseSQaaieZaDzx7Id+LHIvg3IDr1Ucm
 oeL7Vh33XiNpUnDSQdeOS/vD1yDqIgeUrerAG1t9rUPzZM2iR/CCVxcaqte8luMnBXy6
 cn28j2fRubBL8gtdY8eFTmD6aP/QcCqX3pWH16bkt3e9R4s1uvh4DArLK9LMtDgwJve6
 MSqXBPUmVQdTi14sncB2aH+USLrtfro5gYPw92VeoBjxFjtsCIme9QndaMqJXcpzAx+O
 /I9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734363573; x=1734968373;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XE8Rp1QeAFeNcwGnjINgL1qZo7r+EId51k/PevPG3+0=;
 b=VOeYQnMY138uRmvcbIKnygWe1YeS+yMYVVfkpx5qh52xYAM/+uv31xdIiETofXI/gA
 q2JX7Uptaj5wonaIq4gV/l30/323kRZXfJHLqqCdGvBhZmfg889AblCwrdDvoJstZ9QK
 1oz4xeTOgfOkesPqnmR4JfHLdkbhVrSRrcmI7xHZTLFt/pdUqFJHMZrpWm4OySEE0Xu9
 rlEbZMIjf0P1rk17fXOw+pDo3MjBAljZL44gSA404zGm9VibtE8/QIhOKLGmG+9+KQSI
 etGeqgDbFjjYQgRXj7XJXktYJEeicV1rQCdZfbhXnQqFwmOprbuKnUB20XBDf9rbMSvZ
 GDlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdiuzPkvzIdKw+fMiM+yqgH3FTO7u8SgOz0Tb0KydF6rKHqbLOykJ4873f75WlB1CMorBgWnVv@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwO4a5DS7/F/8tO6MrgrJHxjL3tVCFj2Ld1vCI+jwkHF11L1l3e
 mQhgE5s7oAmbNySeaR2vENZFtBwHtdMEihIWsDA27fBhEkf/9It+/gEosPjpoPBD1uJnognh/E2
 lh9PYbWbFZ4/O+WGDpS1LO5/H07WQl+i8ZmcBvw==
X-Gm-Gg: ASbGncvImaNFrJUgPYv6l0EdstLC5deJDz89UH2NnMFnFvpHbfPR+eEC+lRnbWxku4q
 uvhWl+FD9RPH5aXlhrdxdC0Gk6CZzuQL1JkFknm5qcL9VJTjmZZjq
X-Google-Smtp-Source: AGHT+IG+H16BKk2N9qAAZI58ZkiAMWnWq2KJ5i2xrkWhHJZG86PFBQyzzbHk+XT6vSRTQXHuY/aP5XO15EqLEv61aT4=
X-Received: by 2002:a05:6902:70b:b0:e33:1096:f2e1 with SMTP id
 3f1490d57ef6-e434fd23319mr9276225276.40.1734363573390; Mon, 16 Dec 2024
 07:39:33 -0800 (PST)
MIME-Version: 1.0
References: <20241206-drm-connector-eld-mutex-v2-0-c9bce1ee8bea@linaro.org>
 <20241206-drm-connector-eld-mutex-v2-4-c9bce1ee8bea@linaro.org>
 <pgi7p3aemxm3db2k27vi5euh6q6ppayrw6y7tcfeq4g5z23hzr@xousag2qhobp>
 <fc8e80dd-bcea-4515-b446-158649719569@amd.com>
 <CAA8EJpoR8HYq9ATDfmR5ksSnttBzj=DY+BKp5=OuVNF1WDJ-fg@mail.gmail.com>
 <CADnq5_M8jC2w=XWB4BG+id60zfGFMMkSegmeg-y=VpSHC+FvFQ@mail.gmail.com>
In-Reply-To: <CADnq5_M8jC2w=XWB4BG+id60zfGFMMkSegmeg-y=VpSHC+FvFQ@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 16 Dec 2024 17:39:22 +0200
Message-ID: <CAA8EJpqYs92T9x3omDa5XR21GC04Kcc75eVRr6w3pt0W7qPX-w@mail.gmail.com>
Subject: Re: [PATCH v2 04/10] drm/amd/display: use eld_mutex to protect access
 to connector->eld
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Harry Wentland <harry.wentland@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Phong LE <ple@baylibre.com>, 
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Mon, 16 Dec 2024 at 17:32, Alex Deucher <alexdeucher@gmail.com> wrote:
>
> On Mon, Dec 16, 2024 at 10:12=E2=80=AFAM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Mon, 16 Dec 2024 at 16:53, Harry Wentland <harry.wentland@amd.com> w=
rote:
> > >
> > >
> > >
> > > On 2024-12-10 16:20, Dmitry Baryshkov wrote:
> > > > On Fri, Dec 06, 2024 at 11:43:07AM +0200, Dmitry Baryshkov wrote:
> > > >> Reading access to connector->eld can happen at the same time the
> > > >> drm_edid_to_eld() updates the data. Take the newly added eld_mutex=
 in
> > > >> order to protect connector->eld from concurrent access.
> > > >>
> > > >> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> > > >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > >> ---
> > > >>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 ++
> > > >>  1 file changed, 2 insertions(+)
> > > >
> > > > Harry, Leo, Rodrigo, Alex, Christian, Xinhui, any response to this =
one
> > > > and to the radeon patches? I'd like to be able to pick the series f=
or
> > > > drm-misc and these two are not reviewed by you.
> > > >
> > > >>
> > > >> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/d=
rivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > > >> index 19a58630e774029767bf2a27eb4ddf17e3c21129..04c68c320252b5ce96=
47f0606fb86fe57f347639 100644
> > > >> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > > >> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > > >> @@ -1037,8 +1037,10 @@ static int amdgpu_dm_audio_component_get_el=
d(struct device *kdev, int port,
> > > >>                      continue;
> > > >>
> > > >>              *enabled =3D true;
> > > >> +            mutex_lock(&connector->eld_mutex);
> > > >>              ret =3D drm_eld_size(connector->eld);
> > > >>              memcpy(buf, connector->eld, min(max_bytes, ret));
> > > >> +            mutex_unlock(&connector->eld_mutex);
> > >
> > > All of this is wrapped by the adev->dm.audio_lock mutex. It might
> > > be safer to modify the audio_lock mutex so it only guards the
> > > aconnector->audio_inst access.
> > >
> > > But I don't see any way these mutexes would otherwise interact,
> > > so this change should be good as-is.
> > >
> > > Reviewed-by: Harry Wentland <harry.wentland@amd.com>
> >
> > Would you ack it to merge it through drm-misc? Or would you prefer to
> > pick up those two patches after merging drm-misc-next once the rest of
> > the series lands?
>
> Merging through drm-misc is fine with me.

Thanks!

>
> Thanks,
>
> Alex
>
> >
> > >
> > > Harry
> > >
> > > >>
> > > >>              break;
> > > >>      }
> > > >>
> > > >> --
> > > >> 2.39.5
> > > >>
> > > >
> > >
> >
> >
> > --
> > With best wishes
> > Dmitry



--=20
With best wishes
Dmitry
