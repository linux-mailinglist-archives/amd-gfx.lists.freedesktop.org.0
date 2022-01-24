Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4E8498690
	for <lists+amd-gfx@lfdr.de>; Mon, 24 Jan 2022 18:23:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3858A10E589;
	Mon, 24 Jan 2022 17:23:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2033310E589
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Jan 2022 17:23:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id ADD1561303;
 Mon, 24 Jan 2022 17:23:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1C01C340E5;
 Mon, 24 Jan 2022 17:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643045019;
 bh=m/wg/IWT/bVyChMcDytMueNay+ZEXEAwNFpIPOGcW4A=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=CT5aW9G6CuSgV1bcFWriioswASoci6kwqYzjmCSQa3pZh3wo0TTUFlHd+pH35ADqt
 BfPVxG2IZWbROhpEzJGMmICqJ8dPD0sB0HP686ZQqBoUn3dvMwZxNTwN8nuruvCD8W
 t8DNh27n2XK6ZAVYaAIKZx/TpdGPsCQdqivxJPhWDNBSbX4w94yr2b+nU6+toc6HLl
 41fDFkbVAx3tRuAS0+VS6fJ6xcSvWxxF1ywhyPZm1geOlUEr35hx8nmaGpUnHRg3g7
 GzlSG7RwKyAGhcDojCVPLDDN3g6QzsJZC65vg1v/sHpaTK0m1tcqWDPhSz95UxuFSE
 BgBMILOagnNeg==
Date: Mon, 24 Jan 2022 09:23:37 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Build regressions/improvements in v5.17-rc1
Message-ID: <20220124092337.5ecadd71@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
In-Reply-To: <20220124090433.1951e2ea@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
References: <20220123125737.2658758-1-geert@linux-m68k.org>
 <alpine.DEB.2.22.394.2201240851560.2674757@ramsan.of.borg>
 <20220124090433.1951e2ea@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: alsa-devel@alsa-project.org, kvm@vger.kernel.org, netdev@vger.kernel.org,
 linux-um@lists.infradead.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-mips@vger.kernel.org,
 Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>, sparclinux@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "Tobin C. Harding" <me@tobin.cc>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Mon, 24 Jan 2022 09:04:33 -0800 Jakub Kicinski wrote:
> On Mon, 24 Jan 2022 08:55:40 +0100 (CET) Geert Uytterhoeven wrote:
> > >  + /kisskb/src/drivers/net/ethernet/freescale/fec_mpc52xx.c: error: passing argument 2 of 'mpc52xx_fec_set_paddr' discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]:  => 659:29    
> > 
> > powerpc-gcc5/ppc32_allmodconfig

Sent:
https://lore.kernel.org/r/20220124172249.2827138-1-kuba@kernel.org/

> > >  + /kisskb/src/drivers/pinctrl/pinctrl-thunderbay.c: error: assignment discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]:  => 815:8, 815:29    
> > 
> > arm64-gcc5.4/arm64-allmodconfig
> > arm64-gcc8/arm64-allmodconfig  

I take this one back, that's not me.
