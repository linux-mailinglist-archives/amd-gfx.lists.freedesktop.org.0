Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 882DC3F2CBE
	for <lists+amd-gfx@lfdr.de>; Fri, 20 Aug 2021 15:05:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE8246EA88;
	Fri, 20 Aug 2021 13:05:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 461956E832;
 Fri, 20 Aug 2021 04:40:17 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 377B36736F; Fri, 20 Aug 2021 06:40:13 +0200 (CEST)
Date: Fri, 20 Aug 2021 06:40:12 +0200
From: Christoph Hellwig <hch@lst.de>
To: Felix Kuehling <felix.kuehling@amd.com>
Cc: "Sierra Guiza, Alejandro (Alex)" <alex.sierra@amd.com>,
 Ralph Campbell <rcampbell@nvidia.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 hch@lst.de, jgg@nvidia.com, jglisse@redhat.com
Subject: Re: [PATCH v6 02/13] mm: remove extra ZONE_DEVICE struct page refcount
Message-ID: <20210820044012.GA26960@lst.de>
References: <20210813063150.2938-1-alex.sierra@amd.com>
 <20210813063150.2938-3-alex.sierra@amd.com>
 <7b821150-af18-f786-e419-ec245b8cfb1e@nvidia.com>
 <393e9815-838d-5fe6-d6ab-bfe7b543fef6@amd.com>
 <e155ed59-8c3c-4046-e731-f082ee4b10bb@nvidia.com>
 <600a4c43-271d-df98-d3e0-301af0e8d0fe@amd.com>
 <40d4a39e-e874-4ba3-e9bc-42015f0383fa@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <40d4a39e-e874-4ba3-e9bc-42015f0383fa@amd.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Fri, 20 Aug 2021 13:05:32 +0000
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

On Thu, Aug 19, 2021 at 03:59:56PM -0400, Felix Kuehling wrote:
> I got lost trying to understand how DAX counts page references and how
> the PTE_SPECIAL option affects that. Theodore, can you help with this?
> Is there an easy way to test without CONFIG_ARCH_HAS_PTE_SPECIAL on x86,
> or do we need to test on a CPU architecture that doesn't support this
> feature?

I think the right answer is to simplify disallow ZONE_DEVICE pages
if ARCH_HAS_PTE_SPECIAL is not supported.  ARCH_HAS_PTE_SPECIAL is
supported by all modern architecture ports than can make use of
ZONE_DEVICE / dev_pagemap, so we can avoid this pocket of barely
testable code entirely:


diff --git a/mm/Kconfig b/mm/Kconfig
index 40a9bfcd5062e1..2823bbfd1c8c70 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -775,6 +775,7 @@ config ZONE_DMA32
 
 config ZONE_DEVICE
 	bool "Device memory (pmem, HMM, etc...) hotplug support"
+	depends on ARCH_HAS_PTE_SPECIAL
 	depends on MEMORY_HOTPLUG
 	depends on MEMORY_HOTREMOVE
 	depends on SPARSEMEM_VMEMMAP
