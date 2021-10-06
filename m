Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A6E4246B9
	for <lists+amd-gfx@lfdr.de>; Wed,  6 Oct 2021 21:36:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 483FB6EE1E;
	Wed,  6 Oct 2021 19:36:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B27246EE1B
 for <amd-gfx@lists.freedesktop.org>; Wed,  6 Oct 2021 19:32:43 +0000 (UTC)
Received: from zn.tnic (p200300ec2f0d36003dde9a53b36f1ff2.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0d:3600:3dde:9a53:b36f:1ff2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 3AA8C1EC0409;
 Wed,  6 Oct 2021 21:32:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1633548762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=Sy4WTY2NLRXQm2Nup8BPLSSFgX15mIq3h1FN9sZbFd0=;
 b=I1k1hpqhGNKjHStuR7EfXqYlP8rRtm3P47neiuhEosVO+7H73fbwRusx/sXBsqtDOwabC5
 oES1k4Zc3BRn9zC+eO/Zhn2/0BWs/baLRrRbupoH1DMhgMVupggIUAJYoRH8o7CEZVd2tA
 8PdyjhdbUkV+jCOOkM1Gt75ffgj7Wvg=
Date: Wed, 6 Oct 2021 21:32:38 +0200
From: Borislav Petkov <bp@alien8.de>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
 Paul Menzel <pmenzel@molgen.mpg.de>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, X86 ML <x86@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Subject: Re: `AMD_MEM_ENCRYPT_ACTIVE_BY_DEFAULT=y` causes AMDGPU to fail on
 Ryzen: amdgpu: SME is not compatible with RAVEN
Message-ID: <YV351s3Fyhnmen9g@zn.tnic>
References: <8bbacd0e-4580-3194-19d2-a0ecad7df09c@molgen.mpg.de>
 <CADnq5_ONNvuvTbiJDFfRwfnPUBeAqPmDJRmESDYG_7CymikJpQ@mail.gmail.com>
 <YV1vcKpRvF9WTwAo@zn.tnic>
 <CADnq5_N5+SEW4JyXLc=FdSHnSbXrGKWjEw4vW1Jxv9-KdWf+Jg@mail.gmail.com>
 <96f6dbed-b027-c65e-6888-c0e8630cc006@amd.com>
 <YV3hbK/uhChK5Pse@zn.tnic>
 <CADnq5_NgR7tdyeGOdqHCGRMd9DCTJwcRfBXaZcOQDJbEeypf2A@mail.gmail.com>
 <CADnq5_M2y1tUAcUPNOrmB=pHfBGtnqMtTrw24ZC45202hg-kYw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CADnq5_M2y1tUAcUPNOrmB=pHfBGtnqMtTrw24ZC45202hg-kYw@mail.gmail.com>
X-Mailman-Approved-At: Wed, 06 Oct 2021 19:36:17 +0000
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

On Wed, Oct 06, 2021 at 02:21:40PM -0400, Alex Deucher wrote:
> And just another general comment, swiotlb + bounce buffers isn't
> really useful on GPUs.  You may have 10-100s of MBs of memory mapped
> long term into the GPU's address space for random access.  E.g., you
> may have buffers in system memory that the display hardware is
> actively scanning out of.  For GPUs you should really only enable SME
> if IOMMU is enabled in remapping mode.  But that is probably beyond
> the discussion here.

Right, but insights into how these things work (or don't work) together
are always welcome. And yes, as 2cc13bb4f59f says:

    "... The bounce buffer
    code has an upper limit of 256kb for the size of DMA
    allocations, which is too small for certain devices and
    causes them to fail."

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
