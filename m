Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCDA3E92EF
	for <lists+amd-gfx@lfdr.de>; Wed, 11 Aug 2021 15:46:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F28B4898A8;
	Wed, 11 Aug 2021 13:46:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9EE06E12D
 for <amd-gfx@lists.freedesktop.org>; Wed, 11 Aug 2021 12:19:07 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id z2so5315519lft.1
 for <amd-gfx@lists.freedesktop.org>; Wed, 11 Aug 2021 05:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shutemov-name.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=QRfjFOudnOiwA+M7/UAaVDTJpihSFBYjea6mHo6NSYA=;
 b=FrdABWFOYFHYVQYvsn9eIFG1XXIqUnaFBCPEPrWXTbkImjcaYqnfbbDKJbjXTj8n2z
 XKpeeMl+HDYMaw1njH7BCzSmXb2GWH1pBn4+E1w1Zkax9zqjTCMN0ceFLpN0oNSL7p4h
 tTOYo06jVnb3EuSp9CAkw3RajLjCGRh5DcWWOVaUC3oCLa3fiXHjMHrKiPKxkbd9MHf4
 XWiG9YDES/j+Q6K8AbBgatHhy3Ey7EF4Mw9l8egNLjOvPiIJBkLqlDJHfGJd1OD2IwY9
 /Dj5oeYRUTA55X3eykWwXtvq+RdRhaXu8H17iGSYXfRtDXdJr3ACYPa147h4M5kexh1Q
 1YFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=QRfjFOudnOiwA+M7/UAaVDTJpihSFBYjea6mHo6NSYA=;
 b=Z8TF0umJGG2BIliudY8oxa7I5vLWFUoTYNSnWjbRSvmChd3F0JiNMMT//nFOMudA5U
 yqW9nBuSVt2Gk2+/LK8CjmtvyqqtMIt7zwfGGht2C+/1wrBAnew+1KJhXegDxfO/8PPN
 3IxKlT55bRezrhIetnwug3Nrk2zm8zio/hsb+pUQHBjVrKNevhT/ZwiciXH88Z1msRJi
 ZkCwieG0THStyl9FOTbNGFszzOBqzEDk8QFfkvykoSbCUJ/Zsq7PO3S7m4Magmpxq0ZI
 VEbv0bFeLO3a3fFubnNuFejO3/8ED5n8RGXHLOyRmkAZh/p3rNyN0rbMkCJeSdSgxuVY
 WRNQ==
X-Gm-Message-State: AOAM531OQ6Ev0CAIcpWXM1jfpH059OO+mWdTy9UNg3U8HA9casGdg/Bj
 /d6E1qkrKz+T6ZlyoHu4Q4Qjow==
X-Google-Smtp-Source: ABdhPJwYqCmmrayYkwT8dKOh/tHUuUvcGTl6bQD02skpgV77PxIfPFHOo1k2HSgXk2Z2qwWhaj6ksA==
X-Received: by 2002:ac2:50d8:: with SMTP id h24mr4762329lfm.631.1628684346244; 
 Wed, 11 Aug 2021 05:19:06 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
 by smtp.gmail.com with ESMTPSA id w7sm2337599lft.285.2021.08.11.05.19.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 05:19:05 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
 id A68EB102A2E; Wed, 11 Aug 2021 15:19:17 +0300 (+03)
Date: Wed, 11 Aug 2021 15:19:17 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: "Kuppuswamy, Sathyanarayanan" <sathyanarayanan.kuppuswamy@linux.intel.com>,
 linux-kernel@vger.kernel.org, x86@kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 iommu@lists.linux-foundation.org, kvm@vger.kernel.org,
 linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-graphics-maintainer@vmware.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kexec@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 Brijesh Singh <brijesh.singh@amd.com>,
 Joerg Roedel <joro@8bytes.org>, Andi Kleen <ak@linux.intel.com>,
 Tianyu Lan <Tianyu.Lan@microsoft.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Will Deacon <will@kernel.org>, Dave Young <dyoung@redhat.com>,
 Baoquan He <bhe@redhat.com>
Subject: Re: [PATCH 07/11] treewide: Replace the use of mem_encrypt_active()
 with prot_guest_has()
Message-ID: <20210811121917.ghxi7g4mctuybhbk@box.shutemov.name>
References: <cover.1627424773.git.thomas.lendacky@amd.com>
 <029791b24c6412f9427cfe6ec598156c64395964.1627424774.git.thomas.lendacky@amd.com>
 <166f30d8-9abb-02de-70d8-6e97f44f85df@linux.intel.com>
 <4b885c52-f70a-147e-86bd-c71a8f4ef564@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4b885c52-f70a-147e-86bd-c71a8f4ef564@amd.com>
X-Mailman-Approved-At: Wed, 11 Aug 2021 13:46:14 +0000
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

On Tue, Aug 10, 2021 at 02:48:54PM -0500, Tom Lendacky wrote:
> On 8/10/21 1:45 PM, Kuppuswamy, Sathyanarayanan wrote:
> > 
> > 
> > On 7/27/21 3:26 PM, Tom Lendacky wrote:
> >> diff --git a/arch/x86/kernel/head64.c b/arch/x86/kernel/head64.c
> >> index de01903c3735..cafed6456d45 100644
> >> --- a/arch/x86/kernel/head64.c
> >> +++ b/arch/x86/kernel/head64.c
> >> @@ -19,7 +19,7 @@
> >> � #include <linux/start_kernel.h>
> >> � #include <linux/io.h>
> >> � #include <linux/memblock.h>
> >> -#include <linux/mem_encrypt.h>
> >> +#include <linux/protected_guest.h>
> >> � #include <linux/pgtable.h>
> >> � � #include <asm/processor.h>
> >> @@ -285,7 +285,7 @@ unsigned long __head __startup_64(unsigned long
> >> physaddr,
> >> ������ * there is no need to zero it after changing the memory encryption
> >> ������ * attribute.
> >> ������ */
> >> -��� if (mem_encrypt_active()) {
> >> +��� if (prot_guest_has(PATTR_MEM_ENCRYPT)) {
> >> ��������� vaddr = (unsigned long)__start_bss_decrypted;
> >> ��������� vaddr_end = (unsigned long)__end_bss_decrypted;
> > 
> > 
> > Since this change is specific to AMD, can you replace PATTR_MEM_ENCRYPT with
> > prot_guest_has(PATTR_SME) || prot_guest_has(PATTR_SEV). It is not used in
> > TDX.
> 
> This is a direct replacement for now.

With current implementation of prot_guest_has() for TDX it breaks boot for
me.

Looking at code agains, now I *think* the reason is accessing a global
variable from __startup_64() inside TDX version of prot_guest_has().

__startup_64() is special. If you access any global variable you need to
use fixup_pointer(). See comment before __startup_64().

I'm not sure how you get away with accessing sme_me_mask directly from
there. Any clues? Maybe just a luck and complier generates code just right
for your case, I donno.

A separate point is that TDX version of prot_guest_has() relies on
cpu_feature_enabled() which is not ready at this point.

I think __bss_decrypted fixup has to be done if sme_me_mask is non-zero.
Or just do it uncoditionally because it's NOP for sme_me_mask == 0.

> I think the change you're requesting
> should be done as part of the TDX support patches so it's clear why it is
> being changed.
> 
> But, wouldn't TDX still need to do something with this shared/unencrypted
> area, though? Or since it is shared, there's actually nothing you need to
> do (the bss decrpyted section exists even if CONFIG_AMD_MEM_ENCRYPT is not
> configured)?

AFAICS, only kvmclock uses __bss_decrypted. We don't enable kvmclock in
TDX at the moment. It may change in the future.

-- 
 Kirill A. Shutemov
