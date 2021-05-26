Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB713919DA
	for <lists+amd-gfx@lfdr.de>; Wed, 26 May 2021 16:19:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B21976ED0E;
	Wed, 26 May 2021 14:19:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A46786ED0E
 for <amd-gfx@lists.freedesktop.org>; Wed, 26 May 2021 14:19:37 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id
 u4-20020a05600c00c4b02901774b80945cso613741wmm.3
 for <amd-gfx@lists.freedesktop.org>; Wed, 26 May 2021 07:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Fd6nzj5knONQa8xaaRkUOjhIO6yeSMVJ8izD6cgCrTo=;
 b=N/W8jLxkeP7ghrV1tM1xLUJgDv9+bnO41QgPHMpdy5aX6LQM4XoxM3BNoS3qL1jxe8
 gguH9BeXsIeQqf9Vxi6IxmgD/j153/kJgqNw9NGVO9cLKxEbqFHbHhKNsvzDj8bxtmLZ
 fnsjNyXFJeZt/5zsGOGzZL0oWXYkf42VD3JSyCA+xks35ZgTMI0rOuyG5RpZqr/VCzZ0
 OmM6u+0+CFrbJbDD2qRCcbbp4aYaLcAihxVZQ05BzAzE2LVb0HEpJEkYWBa3m0sIar6F
 RT7hDlZQKlg27t9wh2nWfLwL24hFiQYJjQqC3YsBX9yzADlEFEa3sWGo2Zb6pRhlpe9v
 NgMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Fd6nzj5knONQa8xaaRkUOjhIO6yeSMVJ8izD6cgCrTo=;
 b=Gw7q6By66dBbQAI48ZiMvHp5nzAj4ZOfuHxPeE5E4gZ5XdXF7Z6bSdbg27/2yLxl0j
 ajA2982JFV4FuWVusbxhKzu95cGlDEE7nJuo3Uk5YFtVfTJbq/bsaqSfz/yS4qbCLuUg
 +QpaYdyiUq6dTaGFE/wiexuLMpzxeLAYC/71rcDT5orc5KV5KZpnaGyPa41u36XxP+Jx
 tE07/yyF4/GiXAAGL5eJb00mfkezhcWCujrQEU3DwDuKQzPWmOwpo2/WnB6IjnGORwMp
 xfWoQie+t3qlLAcBEHxDHNA8EFPJOwonexY/z292PhVysffbnz3owPFPq+GHtl77PsX5
 AsiQ==
X-Gm-Message-State: AOAM532WOzXK2zaSIb9eNfAj5b7ED2IX2aF63Y0hrOCr5K9jEpGu6MmS
 UFFSYv0M1NZfJG/1jGD0JqBmv4Wd5HDAavJWSthNmLIbxRFlcnX8o347mQ==
X-Google-Smtp-Source: ABdhPJzXAycC9oUv+yRRO7tKogSLlo8B7XEBl0S36nPJP/7o7kHzGtOgDvfheKQTVAYGhzEtNttgLftY1V4Z10LT8tw=
X-Received: by 2002:a7b:c849:: with SMTP id c9mr3726978wml.84.1622038776179;
 Wed, 26 May 2021 07:19:36 -0700 (PDT)
MIME-Version: 1.0
From: Smith John <ls.cat.kth@gmail.com>
Date: Wed, 26 May 2021 22:19:25 +0800
Message-ID: <CAGztBWUH8E-=n6UCGAixBcsb=3RN78XMWgwvuaYOO=tF3rpdWw@mail.gmail.com>
Subject: [amdgpu] question about HWS pipe multiplexing mechanism
To: amd-gfx@lists.freedesktop.org
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
Content-Type: multipart/mixed; boundary="===============1637755120=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1637755120==
Content-Type: multipart/alternative; boundary="00000000000010f2b605c33c55f6"

--00000000000010f2b605c33c55f6
Content-Type: text/plain; charset="UTF-8"

Hi! I learned that each pipe can manage multiple hardware queues from the
previous discussion:
https://lists.freedesktop.org/archives/amd-gfx/2018-February/019034.html .
And I had a few questions about the details.
I was wondering that how a pipe switches between the hardware queues belong
to it:
1. Dose the pipe process a queue continuously until the queue is empty? Or
Dose it use round-robin with time-sharing between those hardware queues?
2. If the former, is it possible that some hardware queues suffer from
starvation?
3. The previous discussion said that, at the same time, only one kernel can
be running on each pipe.  If the pipe used round-robin,  did it incur
the "compute
wave save/restore"(CWSR) when the pipe switch from a hardware queue that
has a running kernel to another hardware queue?

--00000000000010f2b605c33c55f6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi! I learned that each pipe can manage multiple hardware =
queues from the previous discussion:=C2=A0<div><a href=3D"https://lists.fre=
edesktop.org/archives/amd-gfx/2018-February/019034.html">https://lists.free=
desktop.org/archives/amd-gfx/2018-February/019034.html</a> . And I had a fe=
w questions about the details.</div><div>I was wondering that how a pipe sw=
itches between the hardware queues belong to it:=C2=A0</div><div>1. Dose th=
e pipe process a queue=C2=A0continuously until the queue is empty? Or Dose =
it use round-robin with time-sharing between those hardware queues?</div><d=
iv>2. If the former, is it possible that some hardware queues suffer from s=
tarvation?</div><div>3. The previous discussion said that, at the same time=
, only one kernel can be running on each pipe.=C2=A0

If the pipe used round-robin,=C2=A0 did it incur the &quot;<span style=3D"c=
olor:rgb(0,0,0);white-space:pre-wrap">compute wave save/restore&quot;(CWSR)=
 when the pipe switch from a hardware queue that has a running kernel to an=
other hardware queue?=20
</span></div></div>

--00000000000010f2b605c33c55f6--

--===============1637755120==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--===============1637755120==--
