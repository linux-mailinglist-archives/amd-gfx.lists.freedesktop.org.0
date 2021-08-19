Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F79E3F1A27
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Aug 2021 15:16:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD8246E908;
	Thu, 19 Aug 2021 13:15:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B37466E89A;
 Thu, 19 Aug 2021 09:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=oIotVKt85Rb4zTbqb/WlmrAVapzeRtWFY/9pBR2nkhM=; b=KCUZCYiGDxEFK9dDcZ5QKZ8bho
 RMy0S/ROV6qOCIEOfE0tI+Td1tg2fq1UVCw4mJQFP3MO5TIgAl4+pgpQiWurXU5AMe38FMxZLBA6N
 akE0NycfmWpAniFPAt2d6OpT4G6TJFyWksA/qRNvncVBm9gEK0po7a5BpinSpT87nkiFz1w46U3KM
 jOTZAQ0XsTPq22JKVNPOo28l3qEoejUAS1U/1rb2Pwk/DMfmsr+qWjiXz8IkeO/Yj4gJ7I6FAzeqg
 lNwOEN78GvZAlBb9KGcP4L625TaSQVaKs8v1zGXZplsdSmmZfUgYAQ/wceqjbToyHb19QRVu6lhDW
 XQHPuWuw==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1mGelR-004tzP-3k; Thu, 19 Aug 2021 09:55:23 +0000
Date: Thu, 19 Aug 2021 10:55:09 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 iommu@lists.linux-foundation.org, kvm@vger.kernel.org,
 linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-graphics-maintainer@vmware.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kexec@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 Brijesh Singh <brijesh.singh@amd.com>,
 Joerg Roedel <joro@8bytes.org>, Andi Kleen <ak@linux.intel.com>,
 Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Tianyu Lan <Tianyu.Lan@microsoft.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH v2 04/12] powerpc/pseries/svm: Add a powerpc version of
 prot_guest_has()
Message-ID: <YR4qfZdkv+91zNZk@infradead.org>
References: <cover.1628873970.git.thomas.lendacky@amd.com>
 <000f627ce20c6504dd8d118d85bd69e7717b752f.1628873970.git.thomas.lendacky@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <000f627ce20c6504dd8d118d85bd69e7717b752f.1628873970.git.thomas.lendacky@amd.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Thu, 19 Aug 2021 13:15:57 +0000
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

On Fri, Aug 13, 2021 at 11:59:23AM -0500, Tom Lendacky wrote:
> +static inline bool prot_guest_has(unsigned int attr)

No reall need to have this inline.  In fact I'd suggest we havea the
prototype in a common header so that everyone must implement it out
of line.
