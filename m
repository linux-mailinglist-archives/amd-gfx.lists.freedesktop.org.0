Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6FB3D8EF2
	for <lists+amd-gfx@lfdr.de>; Wed, 28 Jul 2021 15:24:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F6646E8BE;
	Wed, 28 Jul 2021 13:24:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 519D16E8BE;
 Wed, 28 Jul 2021 13:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=bU/Ms46JtnXaVrVhQUyi3qsSgcv2ZUBgkJZ69baP/Pk=; b=l/t/Xn+txpO1+X8wtS8Uk4aaqG
 m2+T0SHpVqEnt0/9mZr65K2ueB1kLi0Gx/E9Ov/NZNfcfbm0aSIoCXUBZDMdD7FMkHtRpiECduJr7
 Rt4ArgG6CcLFJpfB7mhR9ochKMyUK4sUQhYvpLwmW49Gs9J06Mvyg5y94GM6d6rLaXR9BaAbWOIpZ
 10T8RMs/K27IkXLp/vjCX+SQ8wtLiH+hDMOJw4D/h2g1l8zP6PGPE8V75qPmB6DklI1zsDwON4VTT
 tuN/D97KN3CBoRNqQG3rooTGaJ8SPBZlGmhA5MCb/K3ZPko/3eWBLi9x75g/uvwD+FrvCC64M+RgR
 Pk0dHV9A==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1m8jR9-00G4xh-78; Wed, 28 Jul 2021 13:17:52 +0000
Date: Wed, 28 Jul 2021 14:17:27 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Tom Lendacky <thomas.lendacky@amd.com>
Subject: Re: [PATCH 01/11] mm: Introduce a function to check for
 virtualization protection features
Message-ID: <YQFY5/cq2thyHzUe@infradead.org>
References: <cover.1627424773.git.thomas.lendacky@amd.com>
 <cbc875b1d2113225c2b44a2384d5b303d0453cf7.1627424774.git.thomas.lendacky@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cbc875b1d2113225c2b44a2384d5b303d0453cf7.1627424774.git.thomas.lendacky@amd.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Wed, 28 Jul 2021 13:24:24 +0000
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
Cc: linux-s390@vger.kernel.org, linux-efi@vger.kernel.org,
 Tianyu Lan <Tianyu.Lan@microsoft.com>, kvm@vger.kernel.org, x86@kernel.org,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 iommu@lists.linux-foundation.org, Andi Kleen <ak@linux.intel.com>,
 linux-graphics-maintainer@vmware.com, dri-devel@lists.freedesktop.org,
 Brijesh Singh <brijesh.singh@amd.com>, linux-fsdevel@vger.kernel.org,
 Borislav Petkov <bp@alien8.de>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Tue, Jul 27, 2021 at 05:26:04PM -0500, Tom Lendacky via iommu wrote:
> In prep for other protected virtualization technologies, introduce a
> generic helper function, prot_guest_has(), that can be used to check
> for specific protection attributes, like memory encryption. This is
> intended to eliminate having to add multiple technology-specific checks
> to the code (e.g. if (sev_active() || tdx_active())).

So common checks obviously make sense, but I really hate the stupid
multiplexer.  Having one well-documented helper per feature is much
easier to follow.

> +#define PATTR_MEM_ENCRYPT		0	/* Encrypted memory */
> +#define PATTR_HOST_MEM_ENCRYPT		1	/* Host encrypted memory */
> +#define PATTR_GUEST_MEM_ENCRYPT		2	/* Guest encrypted memory */
> +#define PATTR_GUEST_PROT_STATE		3	/* Guest encrypted state */

The kerneldoc comments on these individual helpers will give you plenty
of space to properly document what they indicate and what a (potential)
caller should do based on them.  Something the above comments completely
fail to.
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
