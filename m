Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5590A394B9F
	for <lists+amd-gfx@lfdr.de>; Sat, 29 May 2021 12:20:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D807F6EDCA;
	Sat, 29 May 2021 10:20:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A97606E0DB;
 Sat, 29 May 2021 06:41:26 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 9ACAB68B05; Sat, 29 May 2021 08:41:24 +0200 (CEST)
Date: Sat, 29 May 2021 08:41:24 +0200
From: Christoph Hellwig <hch@lst.de>
To: Felix Kuehling <felix.kuehling@amd.com>
Subject: Re: [RFC PATCH 0/5] Support DEVICE_GENERIC memory in migrate_vma_*
Message-ID: <20210529064124.GC15834@lst.de>
References: <20210527230809.3701-1-Felix.Kuehling@amd.com>
 <20210528130816.GM1002214@nvidia.com>
 <f0bb142b-ab80-c16e-77dd-c7e1aa88c755@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f0bb142b-ab80-c16e-77dd-c7e1aa88c755@amd.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Sat, 29 May 2021 10:20:31 +0000
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
Cc: Felix Kuehling <felix.kuehling@gmail.com>, amd-gfx@lists.freedesktop.org,
 linux-mm@kvack.org, jglisse@redhat.com, dri-devel@lists.freedesktop.org,
 Jason Gunthorpe <jgg@nvidia.com>, akpm@linux-foundation.org, hch@lst.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Fri, May 28, 2021 at 11:56:36AM -0400, Felix Kuehling wrote:
> Am 2021-05-28 um 9:08 a.m. schrieb Jason Gunthorpe:
> > On Thu, May 27, 2021 at 07:08:04PM -0400, Felix Kuehling wrote:
> >> Now we're trying to migrate data to and from that memory using the
> >> migrate_vma_* helpers so we can support page-based migration in our
> >> unified memory allocations, while also supporting CPU access to those
> >> pages.
> > So you have completely coherent and indistinguishable GPU and CPU
> > memory and the need of migration is basicaly alot like NUMA policy
> > choice - get better access locality?
> 
> Yes. For a typical GPU compute application it means the GPU gets the
> best bandwidth/latency, and the CPU can coherently access the results
> without page faults and migrations. That's especially valuable for
> applications with persistent compute kernels that want to exploit
> concurrency between CPU and GPU.

So why not expose the GPU memory as a CPUless memory node?
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
