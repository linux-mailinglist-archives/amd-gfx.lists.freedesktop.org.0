Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E15346BA452
	for <lists+amd-gfx@lfdr.de>; Wed, 15 Mar 2023 01:52:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F20E810E120;
	Wed, 15 Mar 2023 00:52:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D34D910E120;
 Wed, 15 Mar 2023 00:52:37 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2A6B3B81C3C;
 Wed, 15 Mar 2023 00:52:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F320C4339E;
 Wed, 15 Mar 2023 00:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678841554;
 bh=Pj7Ygwt586tiLVuPtK5dRag7vRC7++AQFNCKq9Gy9z0=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=Et/kRuTBV+ZIKBtShCQa/at6oA3c4ZLqi1g7IHliizz5rWt5+NKQMh5QzCPLiv9D5
 4cQbXNX+csNZ+4gxgcCffiOW6NNDaaN+9RNVXvhlH7QB1evk+KXR4L2V9yUkOKilKi
 C5VTGk60gJqhqSqMYs6RQVZZjJ+wDiX/lJwOlj3ttkTkbSw8tP+BrTBXPgnKwVtQGw
 OX9lFe8xKwfZU8ncSIlSVhsrAYYFEnB/i8LRjUJgbUfP9w2ZEEUSMzL8bYpePOpgVA
 OhF72BjXyaZ9/dHjbY3SxG94as9Na2/0Nw6QFaRQGxCDBtg4fNVd1v9Lvg0MI9WS1z
 HQuXNH2rqyyKA==
Date: Tue, 14 Mar 2023 17:52:30 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [RFC PATCH 1/5] x86/xen: disable swiotlb for xen pvh
In-Reply-To: <ea0e3852-87ba-984b-4010-5eeac3d6c507@suse.com>
Message-ID: <alpine.DEB.2.22.394.2303141747350.863724@ubuntu-linux-20-04-desktop>
References: <20230312120157.452859-1-ray.huang@amd.com>
 <20230312120157.452859-2-ray.huang@amd.com>
 <ea0e3852-87ba-984b-4010-5eeac3d6c507@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Juergen Gross <jgross@suse.com>, Honglei Huang <honglei1.huang@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Huang Rui <ray.huang@amd.com>, Chen Jiqian <Jiqian.Chen@amd.com>,
 Xenia Ragiadakou <burzalodowa@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Julia Zhang <julia.zhang@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Mon, 13 Mar 2023, Jan Beulich wrote:
> On 12.03.2023 13:01, Huang Rui wrote:
> > Xen PVH is the paravirtualized mode and takes advantage of hardware
> > virtualization support when possible. It will using the hardware IOMMU
> > support instead of xen-swiotlb, so disable swiotlb if current domain is
> > Xen PVH.
> 
> But the kernel has no way (yet) to drive the IOMMU, so how can it get
> away without resorting to swiotlb in certain cases (like I/O to an
> address-restricted device)?

I think Ray meant that, thanks to the IOMMU setup by Xen, there is no
need for swiotlb-xen in Dom0. Address translations are done by the IOMMU
so we can use guest physical addresses instead of machine addresses for
DMA. This is a similar case to Dom0 on ARM when the IOMMU is available
(see include/xen/arm/swiotlb-xen.h:xen_swiotlb_detect, the corresponding
case is XENFEAT_not_direct_mapped).

Jurgen, what do you think? Would you rather make xen_swiotlb_detect
common between ARM and x86?
