Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84DBE3ECF15
	for <lists+amd-gfx@lfdr.de>; Mon, 16 Aug 2021 09:13:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B1F589C08;
	Mon, 16 Aug 2021 07:13:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2047389CA2;
 Sun, 15 Aug 2021 15:38:28 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 38F4867357; Sun, 15 Aug 2021 17:38:26 +0200 (CEST)
Date: Sun, 15 Aug 2021 17:38:25 +0200
From: Christoph Hellwig <hch@lst.de>
To: Alex Sierra <alex.sierra@amd.com>
Cc: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, hch@lst.de, jgg@nvidia.com,
 jglisse@redhat.com
Subject: Re: [PATCH v6 05/13] drm/amdkfd: generic type as sys mem on
 migration to ram
Message-ID: <20210815153825.GB32384@lst.de>
References: <20210813063150.2938-1-alex.sierra@amd.com>
 <20210813063150.2938-6-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210813063150.2938-6-alex.sierra@amd.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Mon, 16 Aug 2021 07:13:01 +0000
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

On Fri, Aug 13, 2021 at 01:31:42AM -0500, Alex Sierra wrote:
>  	migrate.vma = vma;
>  	migrate.start = start;
>  	migrate.end = end;
> -	migrate.flags = MIGRATE_VMA_SELECT_DEVICE_PRIVATE;
>  	migrate.pgmap_owner = SVM_ADEV_PGMAP_OWNER(adev);
>  
> +	if (adev->gmc.xgmi.connected_to_cpu)
> +		migrate.flags = MIGRATE_VMA_SELECT_SYSTEM;
> +	else
> +		migrate.flags = MIGRATE_VMA_SELECT_DEVICE_PRIVATE;

It's been a while since I touched this migrate code, but doesn't this
mean that if the range already contains system memory the migration
now won't do anything? for the connected_to_cpu case?
