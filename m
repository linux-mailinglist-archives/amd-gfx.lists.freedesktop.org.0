Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 796AD40DAAC
	for <lists+amd-gfx@lfdr.de>; Thu, 16 Sep 2021 15:07:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E20326EDA9;
	Thu, 16 Sep 2021 13:07:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46DFF6EAD2;
 Thu, 16 Sep 2021 07:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=2++NPtO3N0EKqFjod0lHOXuAnY0BGUp6aM9ZEKLL5JE=; b=fWRQGikoRH60qW6X6cnfcWri00
 fDV87hJx5JKFIvzB1VghIwXfR96995PVo8kJThgH16NHXA2LcXb/0OUEJDBAk0Bl2qY21EgB/LD6j
 yuWyo9QXuRb+rz8UdmseafctcU4F9oq4wcHZEeHDZVIzPeJnu/6YD92kHFeC+wADiwV5E0NuXTS9x
 jELwwp0a1YxSUBTjc7IgjCeSLvhtV8GlZBWss3rZbkljK+45CzD5XrvvLhnYPJ9BPLbg34ibU5Ghh
 G1NZvE9u3nz/CT9pZxRqgWh1izea0fJlYNRSpJ58AX24QI5uzGRKRidRWQ1bEE28SggGB+0Z9QdPn
 qQ0W6UAQ==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1mQlvQ-00GQBb-Sl; Thu, 16 Sep 2021 07:35:38 +0000
Date: Thu, 16 Sep 2021 08:35:16 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Borislav Petkov <bp@alien8.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>,
 linux-efi@vger.kernel.org, Brijesh Singh <brijesh.singh@amd.com>,
 kvm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linux-s390@vger.kernel.org,
 Andi Kleen <ak@linux.intel.com>, Joerg Roedel <joro@8bytes.org>,
 x86@kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>,
 linux-graphics-maintainer@vmware.com,
 Tom Lendacky <thomas.lendacky@amd.com>,
 Tianyu Lan <Tianyu.Lan@microsoft.com>, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v3 4/8] powerpc/pseries/svm: Add a powerpc version of
 cc_platform_has()
Message-ID: <YULztMRLJ55YLVU9@infradead.org>
References: <cover.1631141919.git.thomas.lendacky@amd.com>
 <9d4fc3f8ea7b325aaa1879beab1286876f45d450.1631141919.git.thomas.lendacky@amd.com>
 <YUCOTIPPsJJpLO/d@zn.tnic> <87lf3yk7g4.fsf@mpe.ellerman.id.au>
 <YUHGDbtiGrDz5+NS@zn.tnic>
 <f8388f18-5e90-5d0f-d681-0b17f8307dd4@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f8388f18-5e90-5d0f-d681-0b17f8307dd4@csgroup.eu>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Thu, 16 Sep 2021 13:06:59 +0000
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

On Wed, Sep 15, 2021 at 07:18:34PM +0200, Christophe Leroy wrote:
> Could you please provide more explicit explanation why inlining such an
> helper is considered as bad practice and messy ?

Because now we get architectures to all subly differ.  Look at the mess
for ioremap and the ioremap* variant.

The only good reason to allow for inlines if if they are used in a hot
path.  Which cc_platform_has is not, especially not on powerpc.
