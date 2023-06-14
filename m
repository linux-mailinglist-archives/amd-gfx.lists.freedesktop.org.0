Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4121F71117D
	for <lists+amd-gfx@lfdr.de>; Thu, 25 May 2023 18:59:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB7FE10E474;
	Thu, 25 May 2023 16:59:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72DB210E474
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 May 2023 16:59:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DB87F644BB;
 Thu, 25 May 2023 16:59:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF06EC433EF;
 Thu, 25 May 2023 16:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685033968;
 bh=rLVwX2Fh0QB0LgkZak2D9IVogY/tBac/1r3AeGtGGmg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XXH7KqivMGfvqfcH8xmAUjPUJFBAbKcx8aSLF7dI6ht0adZxyvekzdst069XBBR1N
 npG4l649RhkL6CIrLUVjj6No9D6faSwr2iWyF492Fs/0nST5T7dzvizrVt4K4NMf0J
 2IRtHaPv/SCAts5i2OvSuo8JrizZ/OvOdZuQY7DtscylOoqbn4DTKhd2jQMKuzO1n7
 lOkvSbmfzEyqDU3LarCccjhO7K8IqHVefX8iY8QHiMVjvHmR+q4XLkjngm8hUCEgB0
 8TzeJKr61dAYl9vypUXIJaQG7GIAE0sMzJXclLqCTv8ZZpy5zfq3dGnit2jcsTugB2
 pllLNVEqciCEQ==
Date: Thu, 25 May 2023 09:59:26 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Mark mmhub_v1_8_mmea_err_status_reg as
 __maybe_unused
Message-ID: <20230525165926.GA553183@dev-arch.thelio-3990X>
References: <20230519124438.365184-1-srinivasan.shanmugam@amd.com>
 <20230525152247.GA187374@dev-arch.thelio-3990X>
 <c25b9e4b-535e-801b-12c3-8d4415c321ff@amd.com>
 <20230525162911.GA552113@dev-arch.thelio-3990X>
 <CADnq5_Ndax1krkonfeBt4=iW5Kfh-nW+M_UhqVJV9gUQC2JEBw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADnq5_Ndax1krkonfeBt4=iW5Kfh-nW+M_UhqVJV9gUQC2JEBw@mail.gmail.com>
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
Cc: llvm@lists.linux.dev, Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, amd-gfx@lists.freedesktop.org,
 Luben Tuikov <luben.tuikov@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Thu, May 25, 2023 at 12:42:05PM -0400, Alex Deucher wrote:
> On Thu, May 25, 2023 at 12:29 PM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > On Thu, May 25, 2023 at 12:26:56PM -0400, Luben Tuikov wrote:
> > > On 2023-05-25 11:22, Nathan Chancellor wrote:
> > > > On Fri, May 19, 2023 at 06:14:38PM +0530, Srinivasan Shanmugam wrote:
> > > >> Silencing the compiler from below compilation error:
> > > >>
> > > >> drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c:704:23: error: variable 'mmhub_v1_8_mmea_err_status_reg' is not needed and will not be emitted [-Werror,-Wunneeded-internal-declaration]
> > > >> static const uint32_t mmhub_v1_8_mmea_err_status_reg[] = {
> > > >>                       ^
> > > >> 1 error generated.
> > > >>
> > > >> Mark the variable as __maybe_unused to make it clear to clang that this
> > > >> is expected, so there is no more warning.
> > > >>
> > > >> Cc: Christian König <christian.koenig@amd.com>
> > > >> Cc: Lijo Lazar <lijo.lazar@amd.com>
> > > >> Cc: Luben Tuikov <luben.tuikov@amd.com>
> > > >> Cc: Alex Deucher <alexander.deucher@amd.com>
> > > >> Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
> > > >
> > > > Traditionally, this attribute would go between the [] and =, but that is
> > > > a nit. Can someone please pick this up to unblock our builds on -next?
> > > >
> > > > Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> > >
> > > I'll pick this up, fix it, and submit to amd-staging-drm-next.
> >
> > Thanks a lot :)
> >
> > > Which -next are you referring to, Nathan?
> >
> > linux-next, this warning breaks the build when -Werror is enabled, such
> > as with allmodconfig:
> >
> > https://storage.tuxsuite.com/public/clangbuiltlinux/continuous-integration2/builds/2QHtlCTz2JL0yXNpRB5hVmiP9lq/build.log
> >
> 
> Srinivasan has already pushed it.  I'll push it out once CI has
> completed.  We are trying to figure out the best way to enable -WERROR
> in our CI system as it is almost always broken depending on what
> compiler you are using.  Also, I'm not sure fixing these is always
> better.  A lot of these warnings seem spurious and in a lot of cases
> the "fix" doesn't really improve the code, it just silences a warning.
> As one of my coworkers put it, there is a reason warnings are not
> errors.

I do not necessarily disagree with that final sentiment but at the end
of the day, it is pointing out a potential problem ("this variable is
only used in a compile time context, is that what you intended or not?")
and the solution is either to fix the code so that it works as initially
intended or you silence the warning because you know it is not actually
a problem. There are always going to be false positives, otherwise they
would just always be hard errors, but that does not mean that they are
not worth listening to, which is why Linus insists on -Werror being a
thing. We can opt out of -Werror for our CI but that does not change the
fact it is default enabled with allmodconfig, so that is how most people
will test.

Cheers,
Nathan
