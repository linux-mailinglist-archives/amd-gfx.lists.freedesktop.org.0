Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 898193ECF24
	for <lists+amd-gfx@lfdr.de>; Mon, 16 Aug 2021 09:14:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6061D89C46;
	Mon, 16 Aug 2021 07:14:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E2EA6E8D0;
 Sat, 14 Aug 2021 15:24:31 +0000 (UTC)
Received: from zn.tnic (p200300ec2f1db9002f4996680da31890.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f1d:b900:2f49:9668:da3:1890])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 8C4181EC0570;
 Sat, 14 Aug 2021 17:24:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1628954665;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=sbUZXYrGBCnkdsaMVDuLw+c4h20LmEtsdOYx/LANX0Q=;
 b=C00yjn7cBmQqRpOaWrEEj5l68AxFibYiJHAi3z1eBk5RnJifb6ywdjAO9bEEyQcQGDqW2O
 EISCtsZnVhg2cwZvHYBEu32siB+BgLQO9Fc7VRjIta+kozXWnAdLDck7yaUcVc1AXUpVdO
 qhH8pNHGUmDKEa/M9P+kxf+ZpIhdVbo=
Date: Sat, 14 Aug 2021 17:25:03 +0200
From: Borislav Petkov <bp@alien8.de>
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 iommu@lists.linux-foundation.org, kvm@vger.kernel.org,
 linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-graphics-maintainer@vmware.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kexec@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, Brijesh Singh <brijesh.singh@amd.com>,
 Joerg Roedel <joro@8bytes.org>, Andi Kleen <ak@linux.intel.com>,
 Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Tianyu Lan <Tianyu.Lan@microsoft.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v2 01/12] x86/ioremap: Selectively build arch override
 encryption functions
Message-ID: <YRfgTzhKCn7otSzy@zn.tnic>
References: <cover.1628873970.git.thomas.lendacky@amd.com>
 <a4338245609a6be63b162e3516d3f6614db782a4.1628873970.git.thomas.lendacky@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a4338245609a6be63b162e3516d3f6614db782a4.1628873970.git.thomas.lendacky@amd.com>
X-Mailman-Approved-At: Mon, 16 Aug 2021 07:13:01 +0000
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

On Fri, Aug 13, 2021 at 11:59:20AM -0500, Tom Lendacky wrote:
> In prep for other uses of the prot_guest_has() function besides AMD's
> memory encryption support, selectively build the AMD memory encryption
> architecture override functions only when CONFIG_AMD_MEM_ENCRYPT=y. These
> functions are:
> - early_memremap_pgprot_adjust()
> - arch_memremap_can_ram_remap()
> 
> Additionally, routines that are only invoked by these architecture
> override functions can also be conditionally built. These functions are:
> - memremap_should_map_decrypted()
> - memremap_is_efi_data()
> - memremap_is_setup_data()
> - early_memremap_is_setup_data()
> 
> And finally, phys_mem_access_encrypted() is conditionally built as well,
> but requires a static inline version of it when CONFIG_AMD_MEM_ENCRYPT is
> not set.
> 
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: Andy Lutomirski <luto@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
> ---
>  arch/x86/include/asm/io.h | 8 ++++++++
>  arch/x86/mm/ioremap.c     | 2 +-
>  2 files changed, 9 insertions(+), 1 deletion(-)

LGTM.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
