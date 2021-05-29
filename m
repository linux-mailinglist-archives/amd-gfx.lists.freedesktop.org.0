Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 012BE394B9B
	for <lists+amd-gfx@lfdr.de>; Sat, 29 May 2021 12:20:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C0A86EB09;
	Sat, 29 May 2021 10:20:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 029786E0DB;
 Sat, 29 May 2021 06:38:32 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id DF14B68AFE; Sat, 29 May 2021 08:38:28 +0200 (CEST)
Date: Sat, 29 May 2021 08:38:28 +0200
From: Christoph Hellwig <hch@lst.de>
To: Felix Kuehling <felix.kuehling@gmail.com>
Subject: Re: [RFC PATCH 1/5] drm/amdkfd: add SPM support for SVM
Message-ID: <20210529063828.GA15834@lst.de>
References: <20210527230809.3701-1-Felix.Kuehling@amd.com>
 <20210527230809.3701-2-Felix.Kuehling@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210527230809.3701-2-Felix.Kuehling@amd.com>
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
Cc: Alex Sierra <alex.sierra@amd.com>, felix.kuehling@amd.com,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org, jglisse@redhat.com,
 amd-gfx@lists.freedesktop.org, jgg@nvidia.com, akpm@linux-foundation.org,
 hch@lst.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Thu, May 27, 2021 at 07:08:05PM -0400, Felix Kuehling wrote:
> diff --git a/kernel/resource.c b/kernel/resource.c
> index 627e61b0c124..da137553b83e 100644
> --- a/kernel/resource.c
> +++ b/kernel/resource.c
> @@ -783,7 +783,7 @@ struct resource *lookup_resource(struct resource *root, resource_size_t start)
>  
>  	return res;
>  }
> -
> +EXPORT_SYMBOL(lookup_resource);

NAK on hiding random exports in a driver patch.  This needs to be a proper
patch with a proper rationale, a kerneldoc comment and use
EXPORT_SYMBOL_GPL.  And even then it smells rather fishy, but I'll wait
for the rationale.
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
