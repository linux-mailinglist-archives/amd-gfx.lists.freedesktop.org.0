Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D68423F2D
	for <lists+amd-gfx@lfdr.de>; Wed,  6 Oct 2021 15:29:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82AF96E49F;
	Wed,  6 Oct 2021 13:29:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CF606E52E
 for <amd-gfx@lists.freedesktop.org>; Wed,  6 Oct 2021 09:42:19 +0000 (UTC)
Received: from zn.tnic (p200300ec2f0d3600b8444335b766c15f.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0d:3600:b844:4335:b766:c15f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id E9C511EC0390;
 Wed,  6 Oct 2021 11:42:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1633513337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=JKschoGOfSrt9RWijP/dk9HNvjRwYLO9J34qvRJjSWk=;
 b=bu4OkrIp7BBVQZFxdiS0wDK3iF/wGLEpGlbXaOG97x54XWGp6GJtB1lHIIbxcb7gFoGnu4
 cPtnsJAAoXOoAtRbSbkbjEcTmyxQn20s/axIldCSBoIAk2GUzPTOLd4vvLenZ8mZsBnyXj
 KKGfblj+Y8d1R8yja1WwyHF1eR1wHQg=
Date: Wed, 6 Oct 2021 11:42:08 +0200
From: Borislav Petkov <bp@alien8.de>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, X86 ML <x86@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Subject: Re: `AMD_MEM_ENCRYPT_ACTIVE_BY_DEFAULT=y` causes AMDGPU to fail on
 Ryzen: amdgpu: SME is not compatible with RAVEN
Message-ID: <YV1vcKpRvF9WTwAo@zn.tnic>
References: <8bbacd0e-4580-3194-19d2-a0ecad7df09c@molgen.mpg.de>
 <CADnq5_ONNvuvTbiJDFfRwfnPUBeAqPmDJRmESDYG_7CymikJpQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CADnq5_ONNvuvTbiJDFfRwfnPUBeAqPmDJRmESDYG_7CymikJpQ@mail.gmail.com>
X-Mailman-Approved-At: Wed, 06 Oct 2021 13:29:22 +0000
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

On Tue, Oct 05, 2021 at 10:48:15AM -0400, Alex Deucher wrote:
> It's not incompatible per se, but SEM requires the IOMMU be enabled
> because the C bit used for encryption is beyond the dma_mask of most
> devices.  If the C bit is not set, the en/decryption for DMA doesn't
> occur.  So you need IOMMU to be enabled in remapping mode to use SME
> with most devices.  Raven has further requirements in that it requires
> IOMMUv2 functionality to support some features which currently uses a
> direct mapping in the IOMMU and hence the C bit is not properly
> handled.

So lemme ask you this: do Raven-containing systems exist out there which
don't have IOMMUv2 functionality and which can cause boot failures when
SME is enabled in the kernel .config?

IOW, can we handle this at boot time properly, i.e., disable SME if we
detect Raven or IOMMUv2 support is missing?

If not, then we really will have to change the default.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
