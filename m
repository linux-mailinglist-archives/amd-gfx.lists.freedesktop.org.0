Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2647A80362A
	for <lists+amd-gfx@lfdr.de>; Mon,  4 Dec 2023 15:14:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63C6210E1E6;
	Mon,  4 Dec 2023 14:14:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9062A10E1E6;
 Mon,  4 Dec 2023 14:14:18 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-1fafbefe710so1833153fac.2; 
 Mon, 04 Dec 2023 06:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701699258; x=1702304058; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0I6C4lHtAjdDOgBRB1tna7Hi6HkljA5Ej+x6ZNqkNO8=;
 b=Iki/vP5ytvBc3/MR29Lvp0haxbcR1813HfQYmsSH49/sGNOiRalFQMg5NLnzSYPnbX
 yxNfkQ5Ymw7mvQncTd42qOBenjJm2kEfWe3mNzO6dwppQrQXVp8ROE9ILBuI/IA2lecb
 iQebuUtym/KQ+250GkoetpFTqEYCnmEtvdXJeE0I9R+gCLDF2GEoHpf9zQ28RsVVHk7A
 kwY+g6oBxFnaLpxjNhDus+u9FXIeeHGQr+AS0ZhOi6ibCI4UnPm98O8dQ0Z4Gf1ZrVMq
 Odwpj4ocKex9oEIsqC8LHIDzKuuXJvtJifkV67QkaNHimmd/i1v6IdRmkxOOOkeTVv75
 mT5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701699258; x=1702304058;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0I6C4lHtAjdDOgBRB1tna7Hi6HkljA5Ej+x6ZNqkNO8=;
 b=v402QbB6dp/g3XTbmwupIgjcVt0dFR/DIOCOY/KyAOaQkCcjDVjMtwU87AYufC1E52
 L+lqPde4NuaPNbhHIXj/B5lNSg9AmtSCk+xEiJLNXMgmxjXzvqowXZMKBFS0L8ubKIv7
 /YxhOzLvFDD4sFdQ4UBQYsl2lyNeu85Cfh83xD5x7noR/dH8ktm3tY2g7vXDL/UexiPY
 Q7lkv4z2UTZjq0flrvLiwcOdFyxGkKZAQlAyvq3SONsq6aSZ64IfFthRnCs/tpg7PPT3
 35n14VbmFwzXlIgBYKGcpIGelnAhCCtQj/iU6uQT0ad0hEpStGmAfHNvXeZcrofMSG2N
 0COg==
X-Gm-Message-State: AOJu0YzAJZYrHY7YAF1O+SPmqDsjDGULHmz16Jw9cxIaHgnORFO2Dsde
 DcTelqToeDTYjp5Wbj2U8FBRpT7fKhmCw74EEC8=
X-Google-Smtp-Source: AGHT+IFEu8TprTdadCbPaDT3i4fWi2XekDqfyNrrQK6RXnb0qoLqCmgcb28e4hgbpi0Bnkuu5MH6XObjr5/U/0yDe2g=
X-Received: by 2002:a05:6870:d3cd:b0:1f9:fa57:f72a with SMTP id
 l13-20020a056870d3cd00b001f9fa57f72amr7540705oag.38.1701699256359; Mon, 04
 Dec 2023 06:14:16 -0800 (PST)
MIME-Version: 1.0
References: <87edgv4x3i.fsf@vps.thesusis.net>
 <559d0fa5-953a-4a97-b03b-5eb1287c83d8@leemhuis.info>
 <CAPM=9tw-8pQWFso0zuLqpsqd5BSHWtc4As9ttdjY-DDr70EMqQ@mail.gmail.com>
 <bdb238b6-60c7-4f26-81d0-9e62cd5dd326@gmail.com>
 <CADnq5_NVGS1XykxGxpcu_bpPbzboCUJQkcCF3r+0N9a23KUgiQ@mail.gmail.com>
 <96e2e13c-f01c-4baf-a9a3-cbaa48fb10c7@amd.com>
 <CADnq5_NBfeAXEyQw0gnSd67=tR-bUKg8w=10+4z9pGGuRnP9uw@mail.gmail.com>
 <87jzq2ixtm.fsf@vps.thesusis.net>
 <CADnq5_Ou-MVVm0rdWDmDnJNLkWUayXzO26uCEtz3ucNa4Ghy2w@mail.gmail.com>
 <95fe9b5b-05ce-4462-9973-9aca306bc44f@gmail.com>
 <CADnq5_MYEWx=e1LBLeVs0UbR5_xEScjDyw_-75mLe8RAMnqh6g@mail.gmail.com>
 <CADnq5_OC=JFpGcN0oGbTF5xYEt4X3r0=jEY6hJ12W8CzYq1+cA@mail.gmail.com>
 <9595b8bf-e64d-4926-9263-97e18bcd7d05@gmail.com>
 <CADnq5_N6DF-huOzgaVygvS5N_j_oNUEC1aa4zRsZTzx8GOD_aw@mail.gmail.com>
 <CADnq5_PgMxoW=4iabtgeHydwye-6DvwvCyETdfBToEpuYWocmA@mail.gmail.com>
 <CADnq5_P0S7Jem0e4K6mG2+bboG8P56nELaGC1p4Pfx-8eV-BjQ@mail.gmail.com>
 <CADnq5_Oy6RMyJ52TbsxVjZ=0p=wYJHduE4X8B3DiYnqHYJUAvw@mail.gmail.com>
 <87edg3koka.fsf@vps.thesusis.net>
In-Reply-To: <87edg3koka.fsf@vps.thesusis.net>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 4 Dec 2023 09:14:04 -0500
Message-ID: <CADnq5_PtSV1C6Up78XX8ejExqaiM-wzHVFhCRtxboS1Y4cF-Ow@mail.gmail.com>
Subject: Re: Radeon regression in 6.6 kernel
To: Phillip Susi <phill@thesusis.net>
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
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
 Luben Tuikov <ltuikov89@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Danilo Krummrich <dakr@redhat.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Sun, Dec 3, 2023 at 3:40=E2=80=AFPM Phillip Susi <phill@thesusis.net> wr=
ote:
>
> Alex Deucher <alexdeucher@gmail.com> writes:
>
> > Phillip,
> >
> > Can you test this patch?  I was not able to repro the issue on the
> > navi2x card I had handy, but I think it should fix it.
>
> I pulled -rc4 and it still had the problem.  I applied this patch, and
> yes, it fixed it!
>

Great!  I'll include it this week.

Alex
