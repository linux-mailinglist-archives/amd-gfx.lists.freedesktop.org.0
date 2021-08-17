Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A3A3EE70E
	for <lists+amd-gfx@lfdr.de>; Tue, 17 Aug 2021 09:15:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73D9B6E104;
	Tue, 17 Aug 2021 07:15:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9D876E103;
 Tue, 17 Aug 2021 05:49:02 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 140406736F; Tue, 17 Aug 2021 07:49:01 +0200 (CEST)
Date: Tue, 17 Aug 2021 07:49:00 +0200
From: Christoph Hellwig <hch@lst.de>
To: "Sierra Guiza, Alejandro (Alex)" <alex.sierra@amd.com>
Cc: Christoph Hellwig <hch@lst.de>, akpm@linux-foundation.org,
 Felix.Kuehling@amd.com, linux-mm@kvack.org, rcampbell@nvidia.com,
 linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 jgg@nvidia.com, jglisse@redhat.com
Subject: Re: [PATCH v6 05/13] drm/amdkfd: generic type as sys mem on
 migration to ram
Message-ID: <20210817054900.GB4895@lst.de>
References: <20210813063150.2938-1-alex.sierra@amd.com>
 <20210813063150.2938-6-alex.sierra@amd.com> <20210815153825.GB32384@lst.de>
 <694ea624-9dc7-7a25-78a6-308ee0debaea@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <694ea624-9dc7-7a25-78a6-308ee0debaea@amd.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Tue, 17 Aug 2021 07:15:23 +0000
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

On Mon, Aug 16, 2021 at 02:53:18PM -0500, Sierra Guiza, Alejandro (Alex) wrote:
> For above’s condition equal to connected_to_cpu , we’re explicitly 
> migrating from
> device memory to system memory with device generic type. In this type, 
> device PTEs are
> present in CPU page table.
>
> During migrate_vma_collect_pmd walk op at migrate_vma_setup call, there’s 
> a condition
> for present pte that require migrate->flags be set for 
> MIGRATE_VMA_SELECT_SYSTEM.
> Otherwise, the migration for this entry will be ignored.

I think we might need a new SELECT flag here for IOMEM.
