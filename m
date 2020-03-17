Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5429188787
	for <lists+amd-gfx@lfdr.de>; Tue, 17 Mar 2020 15:31:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3370D6E23B;
	Tue, 17 Mar 2020 14:30:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A9B36E1F3
 for <amd-gfx@lists.freedesktop.org>; Tue, 17 Mar 2020 14:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=r7z/qRxga4zxFQzMbdlVAFmOAN3gxS3gRvlOl2y87r0=; b=MVy9U3XVAq591GDprSJyimjw3a
 dbTEUD0ngTn2Nej8EgDNTrNALQERuyBVfpsfLunyRPNUbY1PGMRVr2DltZEDiGch7j0vrHTNZkc1Y
 LCJOjctwu2vKz4umcibAYl+IwAzVsEqz0BVsiezpct1JcmlF96IFi5umKumVZWXEtMxViJCrXiAq7
 h804aoyrir9DGPrb/nk1+BZPrFzucZtFjS/MvC969Jko6kfKUbbvJWsf3HRj7Y4XJpQLciEzwtmDU
 m1IL5fyjfJjHngHFcMDUqR5qmMWALsFJbBeGCzK1thBoRtJFnN7sndtvsG3MdWcrZIGuT2sTWVl4G
 dNoUZvhw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jEDDV-000097-Qj; Tue, 17 Mar 2020 14:29:13 +0000
Date: Tue, 17 Mar 2020 07:29:13 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Mikel Rychliski <mikel@mikelr.com>
Subject: Re: [PATCH 3/4] drm/radeon: iounmap unused mapping
Message-ID: <20200317142913.GB23471@infradead.org>
References: <20200303033457.12180-1-mikel@mikelr.com>
 <20200303033457.12180-4-mikel@mikelr.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200303033457.12180-4-mikel@mikelr.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Tue, 17 Mar 2020 14:30:57 +0000
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
Cc: "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>, linux-pci@vger.kernel.org,
 Matthew Garrett <matthewgarrett@google.com>, amd-gfx@lists.freedesktop.org,
 Bjorn Helgaas <bhelgaas@google.com>, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Mon, Mar 02, 2020 at 10:34:56PM -0500, Mikel Rychliski wrote:
> Now that pci_platform_rom creates a new mapping to access the ROM
> image, we should remove this mapping after extracting the BIOS.

This and the next patch really need to be folded into the previous
one to avoid regressions (assuming my other suggestion doesn't work
for some reason).
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
