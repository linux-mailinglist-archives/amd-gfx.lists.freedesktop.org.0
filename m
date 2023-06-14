Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF43711181
	for <lists+amd-gfx@lfdr.de>; Thu, 25 May 2023 19:00:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB58610E6DA;
	Thu, 25 May 2023 17:00:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4544910E6DA
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 May 2023 17:00:24 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A9DF461A25;
 Thu, 25 May 2023 17:00:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9988C433EF;
 Thu, 25 May 2023 17:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685034023;
 bh=uEqm7vegDWx0f++SeKYVO1Kgggp0a5wgywxBwwsRPrI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CJGIJ/mhmsvRmYNw+vdJJXuepy2CXJw07RRjuHadjutuFpPau9I6FdeQZKKy2oz6X
 3nNPePZl886JaIJoY1n4a+xnIO+UMwBoigIKOuYl9jfsglqTxND4P7Y6fb9Kp5ScXw
 T96mUVguMyRphKxPFKCqJtFrhHyhdUyme7RmVIc0vbQdwTEZoqVS643JeXjIS/iIa2
 LoAtldguBFaTIjpfyOLaknhUwJcJ5UdyOyUzYZW+mXCuZd7L3Wr7uq8ZmrIHwfHd9v
 SGfeu11DeFKTUsAAPsbl31mef+yM0UAwEjhPHxvSXqktv2JVBbebmBVUnmMHtxlTf5
 sSsiXyYl4ZjFw==
Date: Thu, 25 May 2023 10:00:20 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [PATCH] drm/amdgpu: Mark mmhub_v1_8_mmea_err_status_reg as
 __maybe_unused
Message-ID: <20230525170020.GB553183@dev-arch.thelio-3990X>
References: <20230519124438.365184-1-srinivasan.shanmugam@amd.com>
 <20230525152247.GA187374@dev-arch.thelio-3990X>
 <c25b9e4b-535e-801b-12c3-8d4415c321ff@amd.com>
 <20230525162911.GA552113@dev-arch.thelio-3990X>
 <895d3cb4-4813-2ec4-ec1e-f1ad962e17ec@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <895d3cb4-4813-2ec4-ec1e-f1ad962e17ec@amd.com>
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
Cc: Lijo Lazar <lijo.lazar@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>, llvm@lists.linux.dev,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Thu, May 25, 2023 at 12:45:13PM -0400, Luben Tuikov wrote:
> On 2023-05-25 12:29, Nathan Chancellor wrote:
> > On Thu, May 25, 2023 at 12:26:56PM -0400, Luben Tuikov wrote:
> >> On 2023-05-25 11:22, Nathan Chancellor wrote:
> >>> On Fri, May 19, 2023 at 06:14:38PM +0530, Srinivasan Shanmugam wrote:
> >>>> Silencing the compiler from below compilation error:
> >>>>
> >>>> drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c:704:23: error: variable 'mmhub_v1_8_mmea_err_status_reg' is not needed and will not be emitted [-Werror,-Wunneeded-internal-declaration]
> >>>> static const uint32_t mmhub_v1_8_mmea_err_status_reg[] = {
> >>>>                       ^
> >>>> 1 error generated.
> >>>>
> >>>> Mark the variable as __maybe_unused to make it clear to clang that this
> >>>> is expected, so there is no more warning.
> >>>>
> >>>> Cc: Christian K�nig <christian.koenig@amd.com>
> >>>> Cc: Lijo Lazar <lijo.lazar@amd.com>
> >>>> Cc: Luben Tuikov <luben.tuikov@amd.com>
> >>>> Cc: Alex Deucher <alexander.deucher@amd.com>
> >>>> Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
> >>>
> >>> Traditionally, this attribute would go between the [] and =, but that is
> >>> a nit. Can someone please pick this up to unblock our builds on -next?
> >>>
> >>> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> >>
> >> I'll pick this up, fix it, and submit to amd-staging-drm-next.
> > 
> > Thanks a lot :)
> > 
> >> Which -next are you referring to, Nathan?
> > 
> > linux-next, this warning breaks the build when -Werror is enabled, such
> > as with allmodconfig:
> > 
> > https://storage.tuxsuite.com/public/clangbuiltlinux/continuous-integration2/builds/2QHtlCTz2JL0yXNpRB5hVmiP9lq/build.log
> > 
> 
> Hi Nathan,
> 
> Thanks for the pointers.
> 
> Srinivasan has already submitted it to amd-staging-drm-next.
> 
> Seems Alex will push it upstream.
> 
> Not sure who fast you need it, we can send you the commit itself
> for you to git-am if you cannot wait.

Thanks for that extra info. We can just wait for the patch to end up in
-next naturally, we try to avoid applying extra patches when possible.

Cheers,
Nathan
