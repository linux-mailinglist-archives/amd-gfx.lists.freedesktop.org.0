Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 324C2A3359E
	for <lists+amd-gfx@lfdr.de>; Thu, 13 Feb 2025 03:51:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24E8810E067;
	Thu, 13 Feb 2025 02:51:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="j7tJK2xe";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEFC610E067
 for <amd-gfx@lists.freedesktop.org>; Thu, 13 Feb 2025 02:51:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 7392BA41D5F;
 Thu, 13 Feb 2025 02:49:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41C93C4CEDF;
 Thu, 13 Feb 2025 02:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739415070;
 bh=D5FcE6li1n/xmFgPW5rMrv2CGWOnvJjA2ZyGHpiMP3s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=j7tJK2xe+nnWqa4qPU/UsuL/Q4BwMQEI2HZQLC+ATf7gUiSqwfjzBxd/B/7jWw3p8
 cma792rh/j3zQIfS1W0+irVN3oOrAPOtcDBkvM0I6zLATOj4VxZOD9kEsN9hQCVzBW
 XxWktZaiyb6Fed6z3whVITTd+srup/hjWndKH18MRohkBCPrJtdISkNFI+uarcudXT
 u0euR+v1BuiRMsyFIeBDoDqKMg4YG/oq9Hnz02DyYkJ15UfiXD1ARrDBB1pIzbU3FG
 Z8PlLf2Ah+GvvvAdvhqIqne7J6Ki/8GT9KoQsf0R1yx4+MF2wXnNJV97Do7ltHUaAZ
 TYvN0yT+auVDg==
Date: Wed, 12 Feb 2025 18:51:08 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>,
 Peter Zijlstra <peterz@infradead.org>, loongarch@lists.linux.dev,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/9] Add jump table support for objtool on LoongArch
Message-ID: <20250213025108.svqgj5nzseqs6qox@jpoimboe>
References: <20241217010905.13054-1-yangtiezhu@loongson.cn>
 <ef1e3e7c-0117-175c-5a85-091382696748@loongson.cn>
 <20250115013444.anzoct6gvs56m225@jpoimboe>
 <4612bfd8-442e-fecb-240f-46e735b48540@loongson.cn>
 <20250210212653.oidcl4aqyrcu3yzi@jpoimboe>
 <CAAhV-H7MVDj0CbXfwveb7GDn+D=O4N6oUT6rpGrbGmYPLPpRPg@mail.gmail.com>
 <20250211233056.q47mp5askk7qrxcp@jpoimboe>
 <CAAhV-H563HcK2bck2k+VLTvrf0C7=cEMr8BJpQhFdJNc+dFOUw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAAhV-H563HcK2bck2k+VLTvrf0C7=cEMr8BJpQhFdJNc+dFOUw@mail.gmail.com>
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

On Wed, Feb 12, 2025 at 03:22:45PM +0800, Huacai Chen wrote:
> > The new series now has 7 patches:
> >
> > Tiezhu Yang (7):
> >   objtool: Handle various symbol types of rodata
> >   objtool: Handle different entry size of rodata
> >   objtool: Handle PC relative relocation type
> >   objtool/LoongArch: Add support for switch table
> >   objtool/LoongArch: Add support for goto table
> >   LoongArch: Enable jump table for objtool
> >   LoongArch: Convert unreachable() to BUG()
> >
> > I was planning on queueing all 7.
> >
> > In particular, patch 6 should stay with the objtool patches since
> > they're directly related.
> >
> > But I was also just going to grab 7 as well.
> >
> > Please let me know if you disagree.
> What about you merge the first 5 patches, and then I merge the last 2
> to the loongarch tree? (I prefer to merge the whole series to the
> loongarch tree with your acked-by, but that may be inconvenient to
> you).

I want the first 5 patches to go through the -tip tree because we'll
have other patches depending on them.

I'll go ahead and take the first 5.

If you take in patches 6 & 7 separately, that might introduce a lot of
warnings.  But it's up to you.

For patches 6 & 7:

Acked-by: Josh Poimboeuf <jpoimboe@kernel.org>

-- 
Josh
