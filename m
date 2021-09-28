Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D7B41B8E7
	for <lists+amd-gfx@lfdr.de>; Tue, 28 Sep 2021 23:03:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7296C6E995;
	Tue, 28 Sep 2021 21:03:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B9BF6E980;
 Tue, 28 Sep 2021 21:02:01 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10121"; a="310354375"
X-IronPort-AV: E=Sophos;i="5.85,330,1624345200"; d="scan'208";a="310354375"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2021 14:02:00 -0700
X-IronPort-AV: E=Sophos;i="5.85,330,1624345200"; d="scan'208";a="554303878"
Received: from oogunmoy-mobl1.amr.corp.intel.com (HELO
 skuppusw-mobl5.amr.corp.intel.com) ([10.212.221.219])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2021 14:01:58 -0700
Subject: Re: [PATCH v4 0/8] Implement generic cc_platform_has() helper function
To: Borislav Petkov <bp@alien8.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Andi Kleen <ak@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Baoquan He <bhe@redhat.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Daniel Vetter <daniel@ffwll.ch>, Dave Young <dyoung@redhat.com>,
 David Airlie <airlied@linux.ie>, Heiko Carstens <hca@linux.ibm.com>,
 Joerg Roedel <joro@8bytes.org>, "Kirill A. Shutemov" <kirill@shutemov.name>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>, Tom Lendacky <thomas.lendacky@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Vasily Gorbik <gor@linux.ibm.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@infradead.org>,
 x86@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 iommu@lists.linux-foundation.org, kvm@vger.kernel.org,
 linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kexec@lists.infradead.org
References: <20210928191009.32551-1-bp@alien8.de>
 <80593893-c63b-d481-45f1-42a3a6fd762a@linux.intel.com>
 <YVN7vPE/7jecXcJ/@zn.tnic>
 <7319b756-55dc-c4d1-baf6-4686f0156ac4@linux.intel.com>
 <YVOB3mFV1Kj3MXAs@zn.tnic>
From: "Kuppuswamy, Sathyanarayanan"
 <sathyanarayanan.kuppuswamy@linux.intel.com>
Message-ID: <695a3bf6-5382-68df-3ab5-8841b777fca2@linux.intel.com>
Date: Tue, 28 Sep 2021 14:01:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YVOB3mFV1Kj3MXAs@zn.tnic>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 28 Sep 2021 21:03:31 +0000
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



On 9/28/21 1:58 PM, Borislav Petkov wrote:
> On Tue, Sep 28, 2021 at 01:48:46PM -0700, Kuppuswamy, Sathyanarayanan wrote:
>> Just read it. If you want to use cpuid_has_tdx_guest() directly in
>> cc_platform_has(), then you want to rename intel_cc_platform_has() to
>> tdx_cc_platform_has()?
> 
> Why?
> 
> You simply do:
> 
> 	if (cpuid_has_tdx_guest())
> 		intel_cc_platform_has(...);
> 
> and lemme paste from that mail: " ...you should use
> cpuid_has_tdx_guest() instead but cache its result so that you don't
> call CPUID each time the kernel executes cc_platform_has()."
> 
> Makes sense?

Yes. But, since the check is related to TDX, I just want to confirm whether
you are fine with naming the function as intel_*().

Since this patch is going to have dependency on TDX code, I will include
this patch in TDX patch set.

> 

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer
