Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A40CA97DD1
	for <lists+amd-gfx@lfdr.de>; Wed, 23 Apr 2025 06:34:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 858B710E1BC;
	Wed, 23 Apr 2025 04:34:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YCmv3kB5";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D64610E3FD
 for <amd-gfx@lists.freedesktop.org>; Wed, 23 Apr 2025 04:34:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E95066135E
 for <amd-gfx@lists.freedesktop.org>; Wed, 23 Apr 2025 04:33:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C283CC4CEE2
 for <amd-gfx@lists.freedesktop.org>; Wed, 23 Apr 2025 04:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745382851;
 bh=ea7Q8NiEYH4CSiqy2JXvGKxiGUwys7CQHgeXQ7Kq7kg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=YCmv3kB5xkOAenSn5ZaJIvQbxmpdoS+GgctOcEnM0cAOOlQvH/CIorPqKDqjPCq/I
 vlFmBnhq5VFO8Y5bPHhSt834Lx3a9FPmDZiZqgD1yMlwYsgWnWfLtztqOL0AxVXHr4
 /Ot1/fbaHVT3WpNokIbQXN2iLVr2fr1hoilXf9UhDDaUV5Re2fTPzKB9nhs+te9634
 Ysl4ueieq/Cv8DV09+eDCvxfMKsCA+lbJMQci2Y1RU/LPL+WMz4VUwWMGhO3wn7jpL
 g9qFpX3ksEji6YgYgQMUc5awJpgeo1A2+gSRghpRnRcVeymSqapQGKGiaM0nBpEUW1
 NysA6yHgg0XUg==
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-ac7bd86f637so101272466b.1
 for <amd-gfx@lists.freedesktop.org>; Tue, 22 Apr 2025 21:34:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXf57UEgVvYXu3WVtAoA4ys7t52FhOoi8be2JW+bYHZr4xlziOgJ39998n7kiv8fkU8HEDwOHB3@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxHnTYE8sQT3+lQCzsbjynC01BjWqP9YhSm8D8yvLqgr8KWA17L
 71ZeiFkbWIAuVl0gEJCGylyT/CZE4/V1tnvE9xLq+88EadCNFScXRyjNpn+frSitP4mqfNIi6jL
 F05nvsWpcRM8kOM6rsUmuLkTMFfA=
X-Google-Smtp-Source: AGHT+IFP4BO5RnwBWtl5S3CIgtOYoe7UWVUS2BO3LLQMxBut432oihK8I+i+Cx67b/gLSDLFoL4uIwA2mE4tKQhesvM=
X-Received: by 2002:a17:907:3e10:b0:ac6:e29b:8503 with SMTP id
 a640c23a62f3a-ace3f255374mr106670466b.1.1745382850396; Tue, 22 Apr 2025
 21:34:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250114132856.19463-1-yangtiezhu@loongson.cn>
 <ab7f1ba8-a49c-41a1-9b6f-ca142fbbe9d2@aosc.io>
In-Reply-To: <ab7f1ba8-a49c-41a1-9b6f-ca142fbbe9d2@aosc.io>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 23 Apr 2025 12:33:59 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7KNuG4hN1F3ctbTL+sz7bbATzKXe610Z9==ApnrX2WXw@mail.gmail.com>
X-Gm-Features: ATxdqUETq2aKApc4tz68VOqLG_bJRT23Khu1nX2atO0OGoEA7vT3p4-N1ptaBoU
Message-ID: <CAAhV-H7KNuG4hN1F3ctbTL+sz7bbATzKXe610Z9==ApnrX2WXw@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] drm/amd/display: Stop control flow if the divisior
 is zero
To: Mingcong Bai <jeffbai@aosc.io>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>,
 Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Huacai Chen <chenhuacai@loongson.cn>, 
 Nathan Chancellor <nathan@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, loongarch@lists.linux.dev, 
 amd-gfx@lists.freedesktop.org, llvm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Kexy Biscuit <kexybiscuit@aosc.io>
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

On Wed, Apr 23, 2025 at 11:48=E2=80=AFAM Mingcong Bai <jeffbai@aosc.io> wro=
te:
>
> Hi all,
>
> =E5=9C=A8 2025/1/14 21:28, Tiezhu Yang =E5=86=99=E9=81=93:
> > As far as I can tell, with the current existing macro definitions, ther=
e
> > is no better way to do the minimal and proper changes to stop the contr=
ol
> > flow if the divisior is zero.
> >
> > In order to keep the current ability for the aim of debugging and avoid
> > printing the warning message twice, it is better to only use ASSERT_BUG=
()
> > and SPL_ASSERT_BUG() directly after doing the following two steps:
> >
> > (1) Add ASSERT_BUG() macro definition
> > (2) Add SPL_ASSERT_BUG() macro definition
> >
> > This version is based on 6.13-rc7, tested on x86 and LoongArch.
> >
> > Tiezhu Yang (3):
> >    drm/amd/display: Add ASSERT_BUG() macro definition
> >    drm/amd/display: Add SPL_ASSERT_BUG() macro definition
> >    drm/amd/display: Harden callers of division functions
> >
> >   drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.c  |  2 +-
> >   drivers/gpu/drm/amd/display/dc/os_types.h           |  7 +++++++
> >   drivers/gpu/drm/amd/display/dc/spl/spl_debug.h      | 11 +++++++++++
> >   drivers/gpu/drm/amd/display/dc/spl/spl_fixpt31_32.c |  2 +-
> >   4 files changed, 20 insertions(+), 2 deletions(-)
> >
>
> Gentle ping on this series...
>
> Harry and Huacai, can you please take a look at this updated series
> (since you have both provided comments on previous revisions?), thank you=
!
I have already given my R-b.

Huacai

>
> Best Regards,
> Mingcong Bai
>
