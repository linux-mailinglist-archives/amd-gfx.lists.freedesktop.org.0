Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FA52C18B3
	for <lists+amd-gfx@lfdr.de>; Mon, 23 Nov 2020 23:46:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57F246E0FD;
	Mon, 23 Nov 2020 22:46:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 293236E0FD;
 Mon, 23 Nov 2020 22:46:55 +0000 (UTC)
Received: from embeddedor (187-162-31-110.static.axtel.net [187.162.31.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C3679206D8;
 Mon, 23 Nov 2020 22:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606171614;
 bh=/WEVdieGBFCx4qZKD2FUBdtDNT2T0D1Sm+x85x7P1ek=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qvoQhlt+pCN08nREhEj9uDSnMNJLM2KHWqC6HIbPbDHSSayMveWmpf3MKWmHkBbCC
 xQKZcciv7WP6mbXcdAdzFbLc77LfTvq8Btxvwe1kW4uKtMvRLfFFyv2UmfXTi3VcPM
 XK3oegEtQhNcFNpvl+MIeRf2bAuUBA48tWazPxh0=
Date: Mon, 23 Nov 2020 16:47:08 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH 028/141] drm/amd/display: Fix fall-through warnings for
 Clang
Message-ID: <20201123224708.GH21644@embeddedor>
References: <cover.1605896059.git.gustavoars@kernel.org>
 <9ac81a4aab74e0b3317172e66a985fe6d1ae4e1b.1605896059.git.gustavoars@kernel.org>
 <CADnq5_Ow_b35AuCGO=LncniDDcwSeS9fSpUiJd+vZYfc29TM0g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADnq5_Ow_b35AuCGO=LncniDDcwSeS9fSpUiJd+vZYfc29TM0g@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>, Leo Li <sunpeng.li@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, linux-hardening@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Fri, Nov 20, 2020 at 05:45:07PM -0500, Alex Deucher wrote:
> On Fri, Nov 20, 2020 at 1:28 PM Gustavo A. R. Silva
> <gustavoars@kernel.org> wrote:
> >
> > In preparation to enable -Wimplicit-fallthrough for Clang, fix multiple
> > warnings by explicitly adding multiple break statements instead of just
> > letting the code fall through to the next case.
> >
> > Link: https://github.com/KSPP/linux/issues/115
> > Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> 
> Applied.  Thanks!

Thanks, Alex.
--
Gustavo
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
