Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9FFA4215E
	for <lists+amd-gfx@lfdr.de>; Mon, 24 Feb 2025 14:43:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D8A310E4DD;
	Mon, 24 Feb 2025 13:42:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="u43xayBR";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0F3410E140
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Feb 2025 04:49:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D77305C48CE
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Feb 2025 04:48:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F37EC4CEDD
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Feb 2025 04:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740372547;
 bh=+tSJ/CV4ag5BPKgIT4cToWUp7lkZ5lgsFJpGIxZN57M=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=u43xayBRuDT1amaEhIlS+UCRwX8Mam6i+p5yVxHpcFuutIHvkMqeZ7lTbM6Z6Y5D7
 D2L5lSGNzHwiYGAP/i9yUyERel+AheT0lbqq6QgUZPC5G9/oUgLUCHqiw4Q9Y1iB/N
 bR+oWtDZGyCMFDb4xv49jx0RLLKQxUZUXhmJLR6QL5vtHNMJWKRduGVHU/ALeEK23l
 Bb3cofOCUx3ljHx0Qt2WyWY3E5QE2wBsnr/mf6Zwo+ShJCiRKTzcTWi1DLhc355I8O
 X/WQScK41usyfP+ai1Ch4TeKZ94aty2mp9rmk/ZqTL9D+ZN2EmGZ3VyUyhs7HCevdF
 Yn0ElJ4srIHIQ==
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-abb97e15bcbso609289766b.0
 for <amd-gfx@lists.freedesktop.org>; Sun, 23 Feb 2025 20:49:07 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVDyGluRmOpadYfMe44ourC9ZKmlemIceoK+LuULRvNObKtmVX9pnMEU0sFHemYWVSQqmX+7gKB@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwT94zwmxAfWZ8tt/GdhB6pz/O4OoxldxUWwAUX/c1aUmCRSsKf
 cazJiah66a0F3WA/cRBMEHRzYLfY0mas6yKTlrLmeWyVtLtYtsSC2sgpQL+WXju1W2WFzWNY2Jr
 DYtDME1R7B6ze7g3Q8K0mDC6YE0s=
X-Google-Smtp-Source: AGHT+IEKW5vIXjTzOHrompLOAPwklgOd0a+ZAbqn71KeUOAndWapGBnmaG5irOdKpG3m5J7DZWq2c8pb6BBiBzlLQ8U=
X-Received: by 2002:a17:906:c0c:b0:abc:ad5:eee1 with SMTP id
 a640c23a62f3a-abc0ad5f0a6mr1104615966b.3.1740372545953; Sun, 23 Feb 2025
 20:49:05 -0800 (PST)
MIME-Version: 1.0
References: <20250114132856.19463-1-yangtiezhu@loongson.cn>
In-Reply-To: <20250114132856.19463-1-yangtiezhu@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 24 Feb 2025 12:48:59 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4giTorYbo4uL_KNL1MmHWfWKX8EnhKdC_Yz0_sX17PvA@mail.gmail.com>
X-Gm-Features: AWEUYZmN-OTr9hSy8TtD6Pr3OSYtzFaOXORrLZ6CEn7dpUO4IxI5WYWdY8z04ys
Message-ID: <CAAhV-H4giTorYbo4uL_KNL1MmHWfWKX8EnhKdC_Yz0_sX17PvA@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] drm/amd/display: Stop control flow if the divisior
 is zero
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Nathan Chancellor <nathan@kernel.org>, 
 Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 loongarch@lists.linux.dev, 
 amd-gfx@lists.freedesktop.org, llvm@lists.linux.dev, 
 linux-kernel@vger.kernel.org
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

On Tue, Jan 14, 2025 at 9:29=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> As far as I can tell, with the current existing macro definitions, there
> is no better way to do the minimal and proper changes to stop the control
> flow if the divisior is zero.
>
> In order to keep the current ability for the aim of debugging and avoid
> printing the warning message twice, it is better to only use ASSERT_BUG()
> and SPL_ASSERT_BUG() directly after doing the following two steps:
>
> (1) Add ASSERT_BUG() macro definition
> (2) Add SPL_ASSERT_BUG() macro definition
>
> This version is based on 6.13-rc7, tested on x86 and LoongArch.
Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>

>
> Tiezhu Yang (3):
>   drm/amd/display: Add ASSERT_BUG() macro definition
>   drm/amd/display: Add SPL_ASSERT_BUG() macro definition
>   drm/amd/display: Harden callers of division functions
>
>  drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.c  |  2 +-
>  drivers/gpu/drm/amd/display/dc/os_types.h           |  7 +++++++
>  drivers/gpu/drm/amd/display/dc/spl/spl_debug.h      | 11 +++++++++++
>  drivers/gpu/drm/amd/display/dc/spl/spl_fixpt31_32.c |  2 +-
>  4 files changed, 20 insertions(+), 2 deletions(-)
>
> --
> 2.42.0
>
>
