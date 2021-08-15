Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2A13ECF23
	for <lists+amd-gfx@lfdr.de>; Mon, 16 Aug 2021 09:14:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D39889C2C;
	Mon, 16 Aug 2021 07:14:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFA8A89C93;
 Sun, 15 Aug 2021 09:19:38 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 2576E6736F; Sun, 15 Aug 2021 11:19:36 +0200 (CEST)
Date: Sun, 15 Aug 2021 11:19:35 +0200
From: Christoph Hellwig <hch@lst.de>
To: Alex Sierra <alex.sierra@amd.com>
Cc: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, hch@lst.de, jgg@nvidia.com,
 jglisse@redhat.com
Subject: Re: [PATCH v6 07/13] mm: add generic type support to migrate_vma
 helpers
Message-ID: <20210815091935.GD25067@lst.de>
References: <20210813063150.2938-1-alex.sierra@amd.com>
 <20210813063150.2938-8-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210813063150.2938-8-alex.sierra@amd.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Mon, 16 Aug 2021 07:13:00 +0000
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

On Fri, Aug 13, 2021 at 01:31:44AM -0500, Alex Sierra wrote:
> Device generic type case added for migrate_vma_pages and
> migrate_vma_check_page helpers.
> Both, generic and private device types have the same
> conditions to decide to migrate pages from/to device
> memory.

This reas a little weird mostly because it doesn't use up the line
length nicely:

Add the device generic type case to the migrate_vma_pages and
migrate_vma_check_page helpers.  This new case is handled identically
to the existing device private case.

> +			 * We support migrating to private and generic types for device
> +			 * zone memory.

Don't spill comments over 80 characters.

Otherwise looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>
