Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B7145481D
	for <lists+amd-gfx@lfdr.de>; Wed, 17 Nov 2021 15:05:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72D466E226;
	Wed, 17 Nov 2021 14:05:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D28CB6E55C;
 Wed, 17 Nov 2021 09:50:45 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 1EABF68AFE; Wed, 17 Nov 2021 10:50:42 +0100 (CET)
Date: Wed, 17 Nov 2021 10:50:41 +0100
From: Christoph Hellwig <hch@lst.de>
To: Alex Sierra <alex.sierra@amd.com>
Subject: Re: [PATCH v1 1/9] mm: add zone device coherent type memory support
Message-ID: <20211117095041.GA9730@lst.de>
References: <20211115193026.27568-1-alex.sierra@amd.com>
 <20211115193026.27568-2-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211115193026.27568-2-alex.sierra@amd.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Wed, 17 Nov 2021 14:05:14 +0000
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
Cc: rcampbell@nvidia.com, willy@infradead.org, Felix.Kuehling@amd.com,
 apopple@nvidia.com, amd-gfx@lists.freedesktop.org, linux-xfs@vger.kernel.org,
 linux-mm@kvack.org, jglisse@redhat.com, dri-devel@lists.freedesktop.org,
 jgg@nvidia.com, akpm@linux-foundation.org, linux-ext4@vger.kernel.org,
 hch@lst.de
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Mon, Nov 15, 2021 at 01:30:18PM -0600, Alex Sierra wrote:
> @@ -5695,8 +5695,8 @@ static int mem_cgroup_move_account(struct page *page,
>   *   2(MC_TARGET_SWAP): if the swap entry corresponding to this pte is a
>   *     target for charge migration. if @target is not NULL, the entry is stored
>   *     in target->ent.
> - *   3(MC_TARGET_DEVICE): like MC_TARGET_PAGE  but page is MEMORY_DEVICE_PRIVATE
> - *     (so ZONE_DEVICE page and thus not on the lru).
> + *   3(MC_TARGET_DEVICE): like MC_TARGET_PAGE  but page is MEMORY_DEVICE_COHERENT
> + *     or MEMORY_DEVICE_PRIVATE (so ZONE_DEVICE page and thus not on the lru).

Please avoid the overly long line.  But I don't think we we need to mention
the exact enum, but rather do something like:

 *   3(MC_TARGET_DEVICE): like MC_TARGET_PAGE  but page is device memory and
 *     thus not on the lru.

> +	switch (pgmap->type) {
> +	case MEMORY_DEVICE_PRIVATE:
> +	case MEMORY_DEVICE_COHERENT:
>  		/*
>  		 * TODO: Handle HMM pages which may need coordination
>  		 * with device-side memory.

This might be a good opportunity for doing a s/HMM/device/ here.
