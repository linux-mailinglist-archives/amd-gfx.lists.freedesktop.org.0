Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF1F3F5DA3
	for <lists+amd-gfx@lfdr.de>; Tue, 24 Aug 2021 14:08:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEBA789CFA;
	Tue, 24 Aug 2021 12:08:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EF3A89B49;
 Tue, 24 Aug 2021 07:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=u2jjKxNoYoIqkuUBOVaU0g9hA7j5FEUKEzONmfPEFRs=; b=l0RA5+0lIDtpN8Qsm8qgG9uLOs
 8eClxBaokH3TyZM/fu8ykw6ZD3oCED17rxUrpLs0TtHot/9XJECBVSsY9dqwrfZEMuNDPQh43FRwB
 gwr+bd3HMFV1W5C6/t8vtIAK0gchzdE/kqUnfspiLdm9pQGzx1360mkBMMfe+XyJFRijFq2K3ePSr
 Jff3vPErlsbRwyhgZ70I86mOyH8JMJcY3mI4n/qCuMatfUmzB4kKpKhH3faryhLixp+fcY+HXVAOh
 PoC9+BbF8dkfZF5wppyEi6qopLgHXvjed9HLCvhzBV9c0zMcG0Q8n3Oaf7OpZqZFQwTLhSiLC+K35
 CAj2ybqg==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1mIQdm-00AhZQ-Cu; Tue, 24 Aug 2021 07:14:45 +0000
Date: Tue, 24 Aug 2021 08:14:34 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: Christoph Hellwig <hch@infradead.org>, linux-kernel@vger.kernel.org,
 x86@kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, iommu@lists.linux-foundation.org,
 kvm@vger.kernel.org, linux-efi@vger.kernel.org,
 platform-driver-x86@vger.kernel.org,
 linux-graphics-maintainer@vmware.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kexec@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 Brijesh Singh <brijesh.singh@amd.com>,
 Joerg Roedel <joro@8bytes.org>, Andi Kleen <ak@linux.intel.com>,
 Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Tianyu Lan <Tianyu.Lan@microsoft.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Joerg Roedel <jroedel@suse.de>
Subject: Re: [PATCH v2 03/12] x86/sev: Add an x86 version of prot_guest_has()
Message-ID: <YSScWvpXeVXw/ed5@infradead.org>
References: <cover.1628873970.git.thomas.lendacky@amd.com>
 <7d55bac0cf2e73f53816bce3a3097877ed9663f3.1628873970.git.thomas.lendacky@amd.com>
 <YR4p9TqKTLdN1A96@infradead.org>
 <4272eaf5-b654-2669-62ac-ba768acd6b91@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4272eaf5-b654-2669-62ac-ba768acd6b91@amd.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Tue, 24 Aug 2021 12:08:17 +0000
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

On Thu, Aug 19, 2021 at 01:33:09PM -0500, Tom Lendacky wrote:
> I did it as inline originally because the presence of the function will be
> decided based on the ARCH_HAS_PROTECTED_GUEST config. For now, that is
> only selected by the AMD memory encryption support, so if I went out of
> line I could put in mem_encrypt.c. But with TDX wanting to also use it, it
> would have to be in an always built file with some #ifdefs or in its own
> file that is conditionally built based on the ARCH_HAS_PROTECTED_GUEST
> setting (they've already tried building with ARCH_HAS_PROTECTED_GUEST=y
> and AMD_MEM_ENCRYPT not set).
> 
> To take it out of line, I'm leaning towards the latter, creating a new
> file that is built based on the ARCH_HAS_PROTECTED_GUEST setting.

Yes.  In general everytime architectures have to provide the prototype
and not just the implementation of something we end up with a giant mess
sooner or later.  In a few cases that is still warranted due to
performance concerns, but i don't think that is the case here.

> 
> > 
> >> +/* 0x800 - 0x8ff reserved for AMD */
> >> +#define PATTR_SME			0x800
> >> +#define PATTR_SEV			0x801
> >> +#define PATTR_SEV_ES			0x802
> > 
> > Why do we need reservations for a purely in-kernel namespace?
> > 
> > And why are you overoading a brand new generic API with weird details
> > of a specific implementation like this?
> 
> There was some talk about this on the mailing list where TDX and SEV may
> need to be differentiated, so we wanted to reserve a range of values per
> technology. I guess I can remove them until they are actually needed.

In that case add a flag for the differing behavior.  And only add them
when actually needed.  And either way there is absolutely no need to
reserve ranges.

