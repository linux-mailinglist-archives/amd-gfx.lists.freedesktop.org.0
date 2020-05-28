Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A62181E6715
	for <lists+amd-gfx@lfdr.de>; Thu, 28 May 2020 18:06:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3393D6E59F;
	Thu, 28 May 2020 16:06:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0D406E59F
 for <amd-gfx@lists.freedesktop.org>; Thu, 28 May 2020 16:06:53 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id j21so13655640pgb.7
 for <amd-gfx@lists.freedesktop.org>; Thu, 28 May 2020 09:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VWGvUP+beaa9dP4JHyaB4pcppqIGVbgqmyFHW6B3Xho=;
 b=RwM6JgFwwJPzJeShrV70TtwMM9Kb5W7/QyZ6lUyF4pS8bGg/nh3dYWnDzicDzQyxqw
 GpOYHKPja1o4V/qdZ4eKpOCE7n3OC8+uq+3pgaFTfziM5/5vUkPAiuiHX9C4KeFBXFEm
 p3z6z8uRO5UPX8vcRZjSAzfAZu70Sx+W7s56nTT9JwYKRw1FXCu8JJ9FDHGS8y2G8/X2
 3ykY+sPNRDB80GyL/Eg4mCY9Hlin5wdHz3BlZD7X4AbwBwIp/01UaZ2MvaGvspnalKHK
 KxECM8u8Q7VLiGfUK0F0SxmZj8dpgcM36vptPE9WrmtMNPBRr2xEdVmJqrqG0YjNxQgi
 lPRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VWGvUP+beaa9dP4JHyaB4pcppqIGVbgqmyFHW6B3Xho=;
 b=TOfvVNLFz1Aw5+D9HnQ1Aj6biX1HfUALUhSjNAanbJVSXXgBJvNLlt9W/RIoJOIRyy
 px/tgrOnuxDJRb1XCrd9uGZnC/d6bletCEA3i5KkayVlKoM/y4nbQTZePp07Dxf/LN/T
 YDJpbyJafYNzJfNIdPYJEfa96y/MfBdLVJyOwMXsk3X9oRaPp5mpOLP06ii/gn1THMjK
 Tvg+a34MCfRMKsUHIhjvdOsVB5tC6fWtITRN3mY5lwhgQVXCR/WVAsX6KUDXvZ4lFM7s
 TsHBgbfsQsTvX68UNKrO/Ww+pNK+CDa2b5ZJiaUcImV6hLOVGpYmsLsasdhbXormKfUm
 Qoww==
X-Gm-Message-State: AOAM531nVbKbnfwIejXFC5d/8ajybN0PyLUi6fyskcQqw8ZbWzTwurv5
 tcJjXDMH66b58J81HJThRuml5QrMD6+6hpUhSRg=
X-Google-Smtp-Source: ABdhPJyy7igApRp9vgWCp74Evxja4tNPUOXcUAVGMX6U3GHGWNGtdX35imtyIMwGlNI+zcpllQoFrJiEaSA+VDXpKI0=
X-Received: by 2002:aa7:8c0b:: with SMTP id c11mr3202406pfd.262.1590682013209; 
 Thu, 28 May 2020 09:06:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAAxE2A5Kv9oB7TnoAKSLfuB7unYZzgggSY=BaNyHZq0Fvi+5Qw@mail.gmail.com>
 <CAAxE2A7wy4CBevdHwQzGgYFZHkEUP4Fokj2CzET9GmJWHA+kww@mail.gmail.com>
 <1b4cc0a0-b690-3f54-d983-76975fe788bf@gmail.com>
 <e2f2843b-db9f-bba3-1925-55af2a68432d@daenzer.net>
 <1adb6ee4-7472-fa3e-fd67-6e5c6668cbc3@amd.com>
In-Reply-To: <1adb6ee4-7472-fa3e-fd67-6e5c6668cbc3@amd.com>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Thu, 28 May 2020 12:06:16 -0400
Message-ID: <CAAxE2A4-5RT==eUzsO+jciucJ1t1aw+Fb=zoi9YB9q2fz1ZaSQ@mail.gmail.com>
Subject: Re: amdgpu doesn't do implicit sync, requires drivers to do it in IBs
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Content-Type: multipart/mixed; boundary="===============1707688636=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1707688636==
Content-Type: multipart/alternative; boundary="000000000000591a6f05a6b78471"

--000000000000591a6f05a6b78471
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2020 at 10:40 AM Christian K=C3=B6nig <christian.koenig@amd=
.com>
wrote:

> Am 28.05.20 um 12:06 schrieb Michel D=C3=A4nzer:
> > On 2020-05-28 11:11 a.m., Christian K=C3=B6nig wrote:
> >> Well we still need implicit sync [...]
> > Yeah, this isn't about "we don't want implicit sync", it's about "amdgp=
u
> > doesn't ensure later jobs fully see the effects of previous implicitly
> > synced jobs", requiring userspace to do pessimistic flushing.
>
> Yes, exactly that.
>
> For the background: We also do this flushing for explicit syncs. And
> when this was implemented 2-3 years ago we first did the flushing for
> implicit sync as well.
>
> That was immediately reverted and then implemented differently because
> it caused severe performance problems in some use cases.
>
> I'm not sure of the root cause of this performance problems. My
> assumption was always that we then insert to many pipeline syncs, but
> Marek doesn't seem to think it could be that.
>
> On the one hand I'm rather keen to remove the extra handling and just
> always use the explicit handling for everything because it simplifies
> the kernel code quite a bit. On the other hand I don't want to run into
> this performance problem again.
>
> Additional to that what the kernel does is a "full" pipeline sync, e.g.
> we busy wait for the full hardware pipeline to drain. That might be
> overkill if you just want to do some flushing so that the next shader
> sees the stuff written, but I'm not an expert on that.
>

Do we busy-wait on the CPU or in WAIT_REG_MEM?

WAIT_REG_MEM is what UMDs do and should be faster.

Marek

--000000000000591a6f05a6b78471
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Thu, May 28, 2020 at 10:40 AM Christian K=C3=B6nig &lt;<a href=3D=
"mailto:christian.koenig@amd.com">christian.koenig@amd.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">Am 28.05.20 um 12=
:06 schrieb Michel D=C3=A4nzer:<br>
&gt; On 2020-05-28 11:11 a.m., Christian K=C3=B6nig wrote:<br>
&gt;&gt; Well we still need implicit sync [...]<br>
&gt; Yeah, this isn&#39;t about &quot;we don&#39;t want implicit sync&quot;=
, it&#39;s about &quot;amdgpu<br>
&gt; doesn&#39;t ensure later jobs fully see the effects of previous implic=
itly<br>
&gt; synced jobs&quot;, requiring userspace to do pessimistic flushing.<br>
<br>
Yes, exactly that.<br>
<br>
For the background: We also do this flushing for explicit syncs. And <br>
when this was implemented 2-3 years ago we first did the flushing for <br>
implicit sync as well.<br>
<br>
That was immediately reverted and then implemented differently because <br>
it caused severe performance problems in some use cases.<br>
<br>
I&#39;m not sure of the root cause of this performance problems. My <br>
assumption was always that we then insert to many pipeline syncs, but <br>
Marek doesn&#39;t seem to think it could be that.<br>
<br>
On the one hand I&#39;m rather keen to remove the extra handling and just <=
br>
always use the explicit handling for everything because it simplifies <br>
the kernel code quite a bit. On the other hand I don&#39;t want to run into=
 <br>
this performance problem again.<br>
<br>
Additional to that what the kernel does is a &quot;full&quot; pipeline sync=
, e.g. <br>
we busy wait for the full hardware pipeline to drain. That might be <br>
overkill if you just want to do some flushing so that the next shader <br>
sees the stuff written, but I&#39;m not an expert on that.<br></blockquote>=
<div><br></div><div>Do we busy-wait on the CPU or in WAIT_REG_MEM?</div><di=
v><br></div><div>WAIT_REG_MEM is what UMDs do and should be faster.</div><d=
iv><br></div><div>Marek</div></div></div>

--000000000000591a6f05a6b78471--

--===============1707688636==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--===============1707688636==--
