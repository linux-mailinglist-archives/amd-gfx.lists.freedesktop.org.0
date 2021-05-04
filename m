Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A376372CF3
	for <lists+amd-gfx@lfdr.de>; Tue,  4 May 2021 17:30:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FAEC6EB26;
	Tue,  4 May 2021 15:30:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-41104.protonmail.ch (mail-41104.protonmail.ch
 [185.70.41.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21AC26EB31
 for <amd-gfx@lists.freedesktop.org>; Tue,  4 May 2021 15:30:31 +0000 (UTC)
Received: from mail-03.mail-europe.com (mail-0301.mail-europe.com
 [188.165.51.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail-41104.protonmail.ch (Postfix) with ESMTPS id 4FZP1K1JMpz4x0vY
 for <amd-gfx@lists.freedesktop.org>; Tue,  4 May 2021 15:30:29 +0000 (UTC)
Authentication-Results: mail-41104.protonmail.ch;
 dkim=pass (2048-bit key) header.d=emersion.fr header.i=@emersion.fr
 header.b="bs+YBMRd"
Date: Tue, 04 May 2021 15:30:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1620142224;
 bh=3PaFEi1gLi5zWnztRiMsF6M2fViZYlg3y6pv3CIa5cA=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=bs+YBMRd602xSBdT0BhdFa6Dr77bN6PR6h5uAldgRA4AWTcoDr440A0HYObn9eP1U
 X3oXl3txNIXhVQHuqoAsVYODihfevBo5sGw2cG3YJZheLlywfYq4BZx/jaUqSnoJG3
 2PL8Ez1GkydvfTlusOQ4LP9GUy16neV/H5oRRXjTEOfwTcgE2grRmYdsZ68n3kn+2m
 r8mWK0DtJMIhSjmqUdLczy7PCusSHxs1EJWEuba9lu/LGa5Qe+SBc/pcGZFDiSv1Ir
 sLjNqCS5PYuVQECxOB7ItNwKu3yNgQ3cFOsczeD3VxMECEJzHy6e4fbLfgd/cuKsV7
 CRUJKNPJqyALA==
To: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/amdgpu: Use device specific BO size & stride check.
Message-ID: <J9MJA2kk2-TH5Ko6PeZ7Zy5M05IgxGfrLKkKLmpR2Wx2g82c2nO32aycv-Cr-VEKXmCyT-0W5WLcXqCDHRLZ4W8pS3gcY0qH_rfMuN2SoPA=@emersion.fr>
In-Reply-To: <20210504094334.1162856-1-bas@basnieuwenhuizen.nl>
References: <20210504094334.1162856-1-bas@basnieuwenhuizen.nl>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: alexdeucher@gmail.com, markyacoub@chromium.org, michel@daenzer.net,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Tuesday, May 4th, 2021 at 11:43 AM, Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl> wrote:

> The builtin size check isn't really the right thing for AMD
> modifiers due to a couple of reasons:
>
> 1) In the format structs we don't do set any of the tilesize / blocks
> etc. to avoid having format arrays per modifier/GPU
> 2) The pitch on the main plane is pixel_pitch * bytes_per_pixel even
> for tiled ...
> 3) The pitch for the DCC planes is really the pixel pitch of the main
> surface that would be covered by it ...
>
> Note that we only handle GFX9+ case but we do this after converting
> the implicit modifier to an explicit modifier, so on GFX9+ all
> framebuffers should be checked here.

Thanks for the updated patch! It fixes the regressions I've got with
my modifier-aware user-space compositors.

Tested-by: Simon Ser <contact@emersion.fr>

> There is a TODO about DCC alignment, but it isn't worse than before
> and I'd need to dig a bunch into the specifics. Getting this out in
> a reasonable timeframe to make sure it gets the appropriate testing
> seemed more important.
>
> Finally as I've found that debugging addfb2 failures is a pita I was
> generous adding explicit error messages to every failure case.

Very good idea!
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
