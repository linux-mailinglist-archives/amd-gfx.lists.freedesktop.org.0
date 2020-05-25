Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF37A1E1792
	for <lists+amd-gfx@lfdr.de>; Tue, 26 May 2020 00:05:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F3C289AC0;
	Mon, 25 May 2020 22:05:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CF6F89AC3
 for <amd-gfx@lists.freedesktop.org>; Mon, 25 May 2020 22:05:51 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id ci21so373610pjb.3
 for <amd-gfx@lists.freedesktop.org>; Mon, 25 May 2020 15:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=a7nf/8KpSpgmSY+VEGWjll96CuPv2tIf39JemHACZ0c=;
 b=R7jOYQMUm/sKEiI6IqNdcx2+4tusVbfPnaK/UXgZQ7F3AvDBAXH8bE7SPPxpQjNma3
 OKTqfejVGyMCmi8U69CmwpZkMOUUitly1uerf+K9RVGYeRKK8Ho7ahFSqFLT5pf2h1LD
 LmlMVSxJQXD70r12RchgVudvpkMQ0RxwehIJBR8MoAK2olkd4mY2jD2oHD2fiRF0GdON
 V4sN/rDPHayR+LXn7oS50o1nxWzKy5m0NltA+2anZeMT+3iNnuXUgBCz3lGEnLbb4z92
 5Dz783FTAUBcTQi/6wK0aCv1nMKrK8gD7U7IH4QhWDnKDaeS4r98ZlyjoWed5z4ExisL
 d21A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=a7nf/8KpSpgmSY+VEGWjll96CuPv2tIf39JemHACZ0c=;
 b=Z5jIWwOk0zTwjRnThNQX7Tg4tD4JJTFghgkUHul14dK64l57yvXpOv9jJcwRu4kauy
 SYWGMcHiD3wMaFcAzqGm89o6e0ZmvThBddvxAArE29RWkFQIXkxi+wmNzhSdkKW9d79i
 WZASA6Qu5Ur6w0kZRx3RbSqXJdHvsQREqR8KTGG+qil+yFGQqdq59LjpJzkZBSSHzCCL
 W2BwwhQXkCUBU6TjXtcyPmGGK2Dhn6tKFUv8jNwzMBur+ZhYId+qEusaU1mvnEXlrQt4
 vs4RzjeYI7dPfdbhdlie+PG/YEnHKec1u1Y+iA/K+DvXFmbPMGcE/USfF7NunN3apGz5
 bNFA==
X-Gm-Message-State: AOAM533BBunspWFe4YQSZYnPBfV76vronpFaSuHmySv835Blve3pTEOQ
 jn9XkUyWkH9r4bfrlPCWzIv/laYiVPucKbTd7/sXbQ==
X-Google-Smtp-Source: ABdhPJzNLrrHx52riKKrEwR5aaYjAJwZnw0m7N9rmzPmnoP7NDRGphBFzcQf+lezAPgx5N4e2afjqMTzDjh7TiusxpU=
X-Received: by 2002:a17:902:9007:: with SMTP id
 a7mr31408186plp.194.1590444350698; 
 Mon, 25 May 2020 15:05:50 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Mon, 25 May 2020 18:05:14 -0400
Message-ID: <CAAxE2A5Kv9oB7TnoAKSLfuB7unYZzgggSY=BaNyHZq0Fvi+5Qw@mail.gmail.com>
Subject: amdgpu doesn't do implicit sync, requires drivers to do it in IBs
To: amd-gfx mailing list <amd-gfx@lists.freedesktop.org>, 
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============0422685183=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0422685183==
Content-Type: multipart/alternative; boundary="0000000000008ef8c905a6802eb9"

--0000000000008ef8c905a6802eb9
Content-Type: text/plain; charset="UTF-8"

Hi Christian,

Bas and Michel wanted to discuss this. The main disadvantage of no implicit
(pipeline) sync within the same queue is that we get lower performance and
lower GPU utilization in some cases.

We actually never really needed the kernel to have implicit sync, because
all user mode drivers contained hacks to work without it.

Marek

--0000000000008ef8c905a6802eb9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Christian,</div><div><br></div><div>Bas and Michel=
 wanted to discuss this. The main disadvantage of no implicit (pipeline) sy=
nc within the same queue is that we get lower performance and lower GPU uti=
lization in some cases.<br></div><div><br></div><div>We actually never real=
ly needed the kernel to have implicit sync, because all user mode drivers c=
ontained hacks to work without it.</div><div><br></div><div>Marek<br></div>=
</div>

--0000000000008ef8c905a6802eb9--

--===============0422685183==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--===============0422685183==--
