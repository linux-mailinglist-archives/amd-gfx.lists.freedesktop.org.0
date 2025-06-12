Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8B7AD9276
	for <lists+amd-gfx@lfdr.de>; Fri, 13 Jun 2025 18:05:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8958810EA30;
	Fri, 13 Jun 2025 16:05:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gcoaEM3d";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com
 [209.85.166.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5B5310E770
 for <amd-gfx@lists.freedesktop.org>; Thu, 12 Jun 2025 11:29:36 +0000 (UTC)
Received: by mail-il1-f170.google.com with SMTP id
 e9e14a558f8ab-3dc729471e3so3092025ab.1
 for <amd-gfx@lists.freedesktop.org>; Thu, 12 Jun 2025 04:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749727776; x=1750332576; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uWFNsEdl/a7j0/+F32K2UCuZPjV+Qs8Q5V9rGStdz2o=;
 b=gcoaEM3d1RtkX6ZKiZC+HqkqxduYdRB0ltSWORRQ31/OFdBrIbLVRg1iqQS6Xpn7E1
 NRtsylOvIpXM8xfBGpVPgHN9puwkDsCSbt01NWpiEK3XmXSGG79VZ9abJ5x2DhSKx5fO
 szcfQbyCUulbEJt7OhU0K3i9Yh6K2AIcN/h0HyoH+4mp+E4u+iSUAGF8giaEBMQUOWZv
 4iCzFHV+Eip/QtuF336Ck569G8JFuiFfTY++XjGHXKH40ue/QbZ4CeyEOHe2LpKQ7QdR
 Y9A8da/UHxuoJySUWxdWT9azaWsYfcBCzkXgMCre6AZvYOKcgtonrcfDqDFPTWswqH3F
 N2Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749727776; x=1750332576;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uWFNsEdl/a7j0/+F32K2UCuZPjV+Qs8Q5V9rGStdz2o=;
 b=T2oXaWX6a1x5PgiolTH+3YndkZ1k+oUUgfJXSTLrHduof4NjQ23BaCNEdi9lfBr2Ia
 XomhOflwVmxJFF/Nzfsa5S9GySyoTHc3AUe2fEpLp4CNKOXxKNkINkwdScKtD1nnl71D
 ClaXQl/P/f3LVn1wAk2yvPLrRtx8kcP4agYzajzIinEOtXcrMgi1M1d38ay24qHn9pB+
 mhj7hXSRAjO1DN3zRIQO1Ma0iiLDdM/Tdnr2jlzVPkQwwPVWYZb9udY0yUfd37dAVrTF
 Rnn7QPKGOe6B+tBT3oZbDDiHH25wq07K9xknlbK3wiuTtyRkdkdwwDuH/OthA6Jwb48z
 rJdQ==
X-Gm-Message-State: AOJu0YxYL9rQ5Z0BW5MFK4WyBQjXD1wUA20LcMrNvKoYzrSgAcCCv9/8
 yvoBiQ8q5jKBtPhxuwmmpXQd2zdWsyTF+lPqhd6YCgqcBIgjgmhDohdJX31l8yXjTqDWs295nO3
 D1DHiw2Hx8dE0EjsGq0HumoICUYLRbCM=
X-Gm-Gg: ASbGnct4Lhuy2f/8RustRa277kBFOOi6PJ+RGf5Dlhlo7P66EFC+WKI7mgnAWRMAdvp
 9nhl2CPuxa7AhmxfNigXhbcKH5BzHQaoTkQl1Bz/7juDE0B66SctVSwtfEpFa0gk2h38yNbOeop
 o06XGzdLU3Orwk/ZQ1bCHaU8c1tjbPYmcP9N3WrN1jcA==
X-Google-Smtp-Source: AGHT+IGnArpk1Ywp54+RTo71bceHyHYW4y8yYiEjZpl8NWFIwqFU5UmsOPrV4puqVz/z9c3mTO/vn2yYGMtjt7GnYVo=
X-Received: by 2002:a05:6e02:1525:b0:3dc:8423:5440 with SMTP id
 e9e14a558f8ab-3ddf4147fbbmr68350515ab.0.1749727776001; Thu, 12 Jun 2025
 04:29:36 -0700 (PDT)
MIME-Version: 1.0
References: <CABH-8xf3sg1CiHWM9nN0a3eSRTF9Lc_vkcZDzbvWZAH0f+Gf2g@mail.gmail.com>
 <CADnq5_MYFt1fS4m3gn-TDSbAot2DpXDZtt0f3DFWJKoPXr3-zg@mail.gmail.com>
In-Reply-To: <CADnq5_MYFt1fS4m3gn-TDSbAot2DpXDZtt0f3DFWJKoPXr3-zg@mail.gmail.com>
From: =?UTF-8?Q?Durmu=C5=9F?= <dozaltay@gmail.com>
Date: Thu, 12 Jun 2025 14:29:25 +0300
X-Gm-Features: AX0GCFsEUaaVxJL3IwmZggXPUqxxSelMMbShHoHZlcXYN-3lc6DVfcMfAzbBWr4
Message-ID: <CABH-8xcnpQ65SZDJJxPmqWP1g_2miQ=1R=OUyJXpO-NKkc7JUw@mail.gmail.com>
Subject: Re: Regression: RX 470 fails to boot with amdgpu.dpm=1 on kernel 6.7+
To: Alex Deucher <alexdeucher@gmail.com>
Cc: amd-gfx@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="0000000000008ad4f606375e3e99"
X-Mailman-Approved-At: Fri, 13 Jun 2025 16:05:52 +0000
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

--0000000000008ad4f606375e3e99
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

i added debug option and this is where to stuck

On Fri, May 30, 2025, 23:29 Alex Deucher <alexdeucher@gmail.com> wrote:

> On Thu, May 22, 2025 at 11:10=E2=80=AFAM Durmu=C5=9F <dozaltay@gmail.com>=
 wrote:
> >
> > Hello,
> >
> > I'm experiencing a critical issue on my system with an AMD RX 470 GPU.
> > When booting with recent kernel versions (6.7.x or newer), the system
> > fails to boot properly unless I explicitly disable Dynamic Power
> > Management (DPM) via the `amdgpu.dpm=3D0` kernel parameter.
> >
> > When DPM is enabled (`amdgpu.dpm=3D1` or omitted, since it's the
> > default), the system either freezes during early boot or fails to
> > initialize the display. However, using the LTS kernel (6.6.x),
> > everything works as expected with DPM enabled.
>
> Are you still having an issue with newer kernels?  E.g., 6.14 or 6.15?
>  I haven't seen any problems with polaris boards here.  If 6.6.x
> works, but 6.7 does not, can you bisect?
>
> Alex
>
> >
> > This seems to be a regression introduced in kernel 6.7 or later, and
> > it specifically affects older GCN4 (Polaris) GPUs like the RX 470.
> > Disabling DPM allows the system to boot, but significantly reduces GPU
> > performance.
> >
> > Things I=E2=80=99ve tried:
> > - Confirmed that the latest `linux-firmware` is installed.
> > - Verified correct firmware files exist under `/lib/firmware/amdgpu/`.
> > - Tested multiple kernels (mainline and LTS).
> > - Using Mesa with ACO (Radeon open driver stack).
> > - System boots fine with LTS kernel (6.6.x) + DPM enabled.
> >
> > System info:
> > - GPU: AMD RX 470 (GCN 4 / Polaris)
> > - Distro: Arch Linux
> > - Kernel (working): linux-lts 6.6.x
> > - Kernel (broken): 6.7.x and newer (currently tested on 6.14.6)
> >
> > Thanks in advance,
> > Durmus Ozaltay
>

--0000000000008ad4f606375e3e99
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><img src=3D"cid:ii_19763e66e9b3b84fd081" style=3D"max-wid=
th: 100%; height: auto;"><br>i added debug option and this is where to stuc=
k</div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr=
" class=3D"gmail_attr">On Fri, May 30, 2025, 23:29 Alex Deucher &lt;<a href=
=3D"mailto:alexdeucher@gmail.com">alexdeucher@gmail.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, May 22, 2025=
 at 11:10=E2=80=AFAM Durmu=C5=9F &lt;<a href=3D"mailto:dozaltay@gmail.com" =
target=3D"_blank" rel=3D"noreferrer">dozaltay@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hello,<br>
&gt;<br>
&gt; I&#39;m experiencing a critical issue on my system with an AMD RX 470 =
GPU.<br>
&gt; When booting with recent kernel versions (6.7.x or newer), the system<=
br>
&gt; fails to boot properly unless I explicitly disable Dynamic Power<br>
&gt; Management (DPM) via the `amdgpu.dpm=3D0` kernel parameter.<br>
&gt;<br>
&gt; When DPM is enabled (`amdgpu.dpm=3D1` or omitted, since it&#39;s the<b=
r>
&gt; default), the system either freezes during early boot or fails to<br>
&gt; initialize the display. However, using the LTS kernel (6.6.x),<br>
&gt; everything works as expected with DPM enabled.<br>
<br>
Are you still having an issue with newer kernels?=C2=A0 E.g., 6.14 or 6.15?=
<br>
=C2=A0I haven&#39;t seen any problems with polaris boards here.=C2=A0 If 6.=
6.x<br>
works, but 6.7 does not, can you bisect?<br>
<br>
Alex<br>
<br>
&gt;<br>
&gt; This seems to be a regression introduced in kernel 6.7 or later, and<b=
r>
&gt; it specifically affects older GCN4 (Polaris) GPUs like the RX 470.<br>
&gt; Disabling DPM allows the system to boot, but significantly reduces GPU=
<br>
&gt; performance.<br>
&gt;<br>
&gt; Things I=E2=80=99ve tried:<br>
&gt; - Confirmed that the latest `linux-firmware` is installed.<br>
&gt; - Verified correct firmware files exist under `/lib/firmware/amdgpu/`.=
<br>
&gt; - Tested multiple kernels (mainline and LTS).<br>
&gt; - Using Mesa with ACO (Radeon open driver stack).<br>
&gt; - System boots fine with LTS kernel (6.6.x) + DPM enabled.<br>
&gt;<br>
&gt; System info:<br>
&gt; - GPU: AMD RX 470 (GCN 4 / Polaris)<br>
&gt; - Distro: Arch Linux<br>
&gt; - Kernel (working): linux-lts 6.6.x<br>
&gt; - Kernel (broken): 6.7.x and newer (currently tested on 6.14.6)<br>
&gt;<br>
&gt; Thanks in advance,<br>
&gt; Durmus Ozaltay<br>
</blockquote></div>

--0000000000008ad4f606375e3e99--
