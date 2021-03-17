Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 541C233EB7C
	for <lists+amd-gfx@lfdr.de>; Wed, 17 Mar 2021 09:29:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B71846E4EC;
	Wed, 17 Mar 2021 08:29:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail2.protonmail.ch (mail2.protonmail.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98A9C6E4EC
 for <amd-gfx@lists.freedesktop.org>; Wed, 17 Mar 2021 08:29:23 +0000 (UTC)
Date: Wed, 17 Mar 2021 08:29:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1615969761;
 bh=QC4dZZ3aBbeC7Kz8+2xjUMyIqILRwvnjxiKWeBxi5ns=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=A1KC/rMdtoASJ51bug1yJz+THFVc/ujxtDy1XzZMDraGBnuMr5sOgCZ3MIbWdZQny
 hO41tCEYxszNVxLK7J9EPKitf/rQq3mztvwyqftoVA3A2rt8xBOqo7tq4XTYpW0PZU
 hpPzYXZuCXGskXkpsoacGXCHc1O5QOzLzV45GoyZJwWHh56hEiCjd0E0+jyoxMRtRz
 +5U4Qyh4TRHksJNqkg0T50PgaKtrhbUZ9N7wT30++O4Pkm3AkseOHrahkaZr0P/j89
 ssL+g+MmVXlf/fsNHp21D3uvzkejqsyJI4MdlP1IF5Y1TehYrlnE+rfsbVnE6xUoVw
 p4izIvpGZqiBQ==
To: Sefa Eyeoglu <contact@scrumplex.net>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/amd/display: check fb of primary plane
Message-ID: <BXflth5n3xasxoEuCG2MmbmwEVxpajiLTSqLdyoFxMsugaQUqpvAvZENKxcrhoHY1z0D0NkWBxQa83qUOm8Eg5EOLUhbWoQ7P7y5iblbLwg=@emersion.fr>
In-Reply-To: <20210316215006.18769-1-contact@scrumplex.net>
References: <20210316215006.18769-1-contact@scrumplex.net>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Tuesday, March 16th, 2021 at 10:50 PM, Sefa Eyeoglu <contact@scrumplex.net> wrote:

> Sometimes the primary plane might not be initialized (yet), which
> causes dm_check_crtc_cursor to divide by zero.
> Apparently a weird state before a S3-suspend causes the aforementioned
> divide-by-zero error when resuming from S3.  This was explained in
> bug 212293 on Bugzilla.
>
> To avoid this divide-by-zero error we check if the primary plane's fb
> isn't NULL.  If it's NULL the src_w and src_h attributes will be 0,
> which would cause a divide-by-zero.
>
> This fixes Bugzilla report 212293
> https://bugzilla.kernel.org/show_bug.cgi?id=212293
>
> Fixes: 12f4849a1cfd69f3 ("drm/amd/display: check cursor scaling")
> Signed-off-by: Sefa Eyeoglu <contact@scrumplex.net>

Thanks for the fix! In theory we should return -EINVAL here, because we can't
enable the cursor plane without the primary plane. But that would break the
legacy API translation layer in DRM core, which expects that planes can always
be disabled individually.

So this is:

Reviewed-by: Simon Ser <contact@emersion.fr>
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
