Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1642A3FB65F
	for <lists+amd-gfx@lfdr.de>; Mon, 30 Aug 2021 14:49:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A672089C1E;
	Mon, 30 Aug 2021 12:49:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6467188810;
 Mon, 30 Aug 2021 08:28:04 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 1655A68AFE; Mon, 30 Aug 2021 10:28:00 +0200 (CEST)
Date: Mon, 30 Aug 2021 10:28:00 +0200
From: Christoph Hellwig <hch@lst.de>
To: Felix Kuehling <felix.kuehling@amd.com>
Cc: "Sierra Guiza, Alejandro (Alex)" <alex.sierra@amd.com>,
 Christoph Hellwig <hch@lst.de>, akpm@linux-foundation.org,
 linux-mm@kvack.org, rcampbell@nvidia.com,
 linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 jgg@nvidia.com, jglisse@redhat.com
Subject: Re: [PATCH v1 03/14] mm: add iomem vma selection for memory migration
Message-ID: <20210830082800.GA6836@lst.de>
References: <20210825034828.12927-1-alex.sierra@amd.com>
 <20210825034828.12927-4-alex.sierra@amd.com> <20210825074602.GA29620@lst.de>
 <c4241eb3-07d2-c85b-0f48-cce4b8369381@amd.com>
 <a9eb2c4a-d8cc-9553-57b7-fd1622679aaa@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a9eb2c4a-d8cc-9553-57b7-fd1622679aaa@amd.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Mon, 30 Aug 2021 12:49:09 +0000
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

On Thu, Aug 26, 2021 at 06:27:31PM -0400, Felix Kuehling wrote:
> I think we're missing something here. As far as I can tell, all the work
> we did first with DEVICE_GENERIC and now DEVICE_PUBLIC always used
> normal pages. Are we missing something in our driver code that would
> make these PTEs special? I don't understand how that can be, because
> driver code is not really involved in updating the CPU mappings. Maybe
> it's something we need to do in the migration helpers.

It looks like I'm totally misunderstanding what you are adding here
then.  Why do we need any special treatment at all for memory that
has normal struct pages and is part of the direct kernel map?
