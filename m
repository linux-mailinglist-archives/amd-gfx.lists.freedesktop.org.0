Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9895882949F
	for <lists+amd-gfx@lfdr.de>; Wed, 10 Jan 2024 09:02:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66D8910E558;
	Wed, 10 Jan 2024 08:01:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [IPv6:2607:f8b0:4864:20::1135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6558610E53D
 for <amd-gfx@lists.freedesktop.org>; Tue,  9 Jan 2024 23:12:48 +0000 (UTC)
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-5f8cf76ef5bso22021087b3.0
 for <amd-gfx@lists.freedesktop.org>; Tue, 09 Jan 2024 15:12:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yngvason.is; s=google; t=1704841967; x=1705446767; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LpxrwuyIpyyju2QtYPMpz+Gmdstpik2FIYHnxal2H/c=;
 b=hjgUEXSY4tqDRLY/23k3Alm0DeMgraYocpKqpvhUlr0/JrtFP64MjZBr09RoLb/8Ug
 +iVNy1h2Mc/LJvPD3VoleLcmRVkLz6xVwEirOrTTuswlMUOWdJAZrql3gbl9MeoJQPct
 pFlw/CoYMU8O4NeXFZ2+w/PIUyhsf0yw6OWmc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704841967; x=1705446767;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LpxrwuyIpyyju2QtYPMpz+Gmdstpik2FIYHnxal2H/c=;
 b=hRR/mjuhgYrxHuVMMwpbYHi1jD7oyYkvhc31XM5jIMoe93GK6cq8y9xn8aJNRjV447
 6HFYoYZJR7ajIe9Qj7cNKS2hUC/MM8qOQQvRybVQL9DfltloPwvTHhMoEadtZV3y0q5F
 xnr57oiIF0lSiAlwmMo1Na6jkZeLPPybXzMOBbFjcXBWfQmNML8zzXrkP7UKgWLbSEz+
 q0+/82IvNoHkshM6dM7LOyHniH5lsTcWjTtHgBk/cv9AsyWZbRcFO1c1qAo9Xhd3ruLW
 ipBk69Efcs1AJ0AIXgRWCguuLt5Tw36EIL6N7NKsWO1z1EspZRZfwXRa1T2VtAyFSsLT
 ahHg==
X-Gm-Message-State: AOJu0YwIwonJAtfbiQAeOIefGKjVTNXET66/3SwXBELAyQ2Vv9A8yZYY
 9HNaguR6x+DmBibFH71xv+CBNwMa++ac5DncOHbPYcnfcKsgzg==
X-Google-Smtp-Source: AGHT+IHjeS8ARWzwyLnzhdFEDGtQ5KzAPUEz3NT2gzsbBI58UWCNH/bG2gx8bvPH2kUetuxWELwNb6f0Mpy8gWKYLog=
X-Received: by 2002:a0d:e848:0:b0:5fa:1942:ee01 with SMTP id
 r69-20020a0de848000000b005fa1942ee01mr220445ywe.61.1704841967457; Tue, 09 Jan
 2024 15:12:47 -0800 (PST)
MIME-Version: 1.0
References: <20240109181104.1670304-1-andri@yngvason.is>
 <20240109181104.1670304-3-andri@yngvason.is>
 <CAPj87rNan8B5urDFkmD_Vti4to6p3NmvXYsTFQTNg-Ue2ieDug@mail.gmail.com>
In-Reply-To: <CAPj87rNan8B5urDFkmD_Vti4to6p3NmvXYsTFQTNg-Ue2ieDug@mail.gmail.com>
From: Andri Yngvason <andri@yngvason.is>
Date: Tue, 9 Jan 2024 23:12:11 +0000
Message-ID: <CAFNQBQwiqqSRqzXAnC035UWCGF3=GGFR5SpDd=biPTOEA+cWbQ@mail.gmail.com>
Subject: Re: [PATCH 2/7] drm/uAPI: Add "active color format" drm property as
 feedback for userspace
To: Daniel Stone <daniel@fooishbar.org>
Content-Type: multipart/alternative; boundary="000000000000de6e41060e8b73ac"
X-Mailman-Approved-At: Wed, 10 Jan 2024 08:01:54 +0000
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Werner Sembach <wse@tuxedocomputers.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, intel-gfx@lists.freedesktop.org,
 Leo Li <sunpeng.li@amd.com>, David Airlie <airlied@gmail.com>,
 dri-devel@lists.freedesktop.org, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Simon Ser <contact@emersion.fr>, amd-gfx@lists.freedesktop.org,
 Harry Wentland <harry.wentland@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--000000000000de6e41060e8b73ac
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

=C3=BEri., 9. jan. 2024 kl. 22:32 skrifa=C3=B0i Daniel Stone <daniel@fooish=
bar.org>:

> On Tue, 9 Jan 2024 at 18:12, Andri Yngvason <andri@yngvason.is> wrote:
> > + * active color format:
> > + *     This read-only property tells userspace the color format
> actually used
> > + *     by the hardware display engine "on the cable" on a connector.
> The chosen
> > + *     value depends on hardware capabilities, both display engine and
> > + *     connected monitor. Drivers shall use
> > + *     drm_connector_attach_active_color_format_property() to install
> this
> > + *     property. Possible values are "not applicable", "rgb",
> "ycbcr444",
> > + *     "ycbcr422", and "ycbcr420".
>
> How does userspace determine what's happened without polling? Will it
> only change after an `ALLOW_MODESET` commit, and be guaranteed to be
> updated after the commit has completed and the event being sent?
> Should it send a HOTPLUG event? Other?
>

Userspace does not determine what's happened without polling. The purpose
of this property is not for programmatic verification that the preferred
property was applied. It is my understanding that it's mostly intended for
debugging purposes. It should only change as a consequence of modesetting,
although I didn't actually look into what happens if you set the "preferred
color format" outside of a modeset.

The way I've implemented things in sway, calling the
"preferred_signal_format" command triggers a modeset with the "preferred
color format" set and calling "get_outputs", immediately queries the
"actual color format" and displays it.

Regards,
Andri

--000000000000de6e41060e8b73ac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Daniel,<br></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">=C3=BEri., 9. jan. 2024 kl.=
 22:32 skrifa=C3=B0i Daniel Stone &lt;<a href=3D"mailto:daniel@fooishbar.or=
g">daniel@fooishbar.org</a>&gt;:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
On Tue, 9 Jan 2024 at 18:12, Andri Yngvason &lt;<a href=3D"mailto:andri@yng=
vason.is" target=3D"_blank">andri@yngvason.is</a>&gt; wrote:<br>
&gt; + * active color format:<br>
&gt; + *=C2=A0 =C2=A0 =C2=A0This read-only property tells userspace the col=
or format actually used<br>
&gt; + *=C2=A0 =C2=A0 =C2=A0by the hardware display engine &quot;on the cab=
le&quot; on a connector. The chosen<br>
&gt; + *=C2=A0 =C2=A0 =C2=A0value depends on hardware capabilities, both di=
splay engine and<br>
&gt; + *=C2=A0 =C2=A0 =C2=A0connected monitor. Drivers shall use<br>
&gt; + *=C2=A0 =C2=A0 =C2=A0drm_connector_attach_active_color_format_proper=
ty() to install this<br>
&gt; + *=C2=A0 =C2=A0 =C2=A0property. Possible values are &quot;not applica=
ble&quot;, &quot;rgb&quot;, &quot;ycbcr444&quot;,<br>
&gt; + *=C2=A0 =C2=A0 =C2=A0&quot;ycbcr422&quot;, and &quot;ycbcr420&quot;.=
<br>
<br>
How does userspace determine what&#39;s happened without polling? Will it<b=
r>
only change after an `ALLOW_MODESET` commit, and be guaranteed to be<br>
updated after the commit has completed and the event being sent?<br>
Should it send a HOTPLUG event? Other?<br></blockquote><div><br></div><div>=
Userspace does not determine what&#39;s happened without polling. The purpo=
se of this property is not for programmatic verification that the preferred=
 property was applied. It is my understanding that it&#39;s mostly intended=
 for debugging purposes. It should only change as a consequence of modesett=
ing, although I didn&#39;t actually look into what happens if you set the &=
quot;preferred color format&quot; outside of a modeset.</div><div><br></div=
><div>The way I&#39;ve implemented things in sway, calling the &quot;prefer=
red_signal_format&quot; command triggers a modeset with the &quot;preferred=
 color format&quot; set and calling &quot;get_outputs&quot;, immediately qu=
eries the &quot;actual color format&quot; and displays it.</div><div><br></=
div><div>Regards,</div><div>Andri<br></div></div></div>

--000000000000de6e41060e8b73ac--
