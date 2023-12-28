Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA3281F694
	for <lists+amd-gfx@lfdr.de>; Thu, 28 Dec 2023 11:02:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CA4D10E0D3;
	Thu, 28 Dec 2023 10:02:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77AED10E080
 for <amd-gfx@lists.freedesktop.org>; Thu, 28 Dec 2023 06:27:24 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id CD2DD68C7B; Thu, 28 Dec 2023 07:20:04 +0100 (CET)
Date: Thu, 28 Dec 2023 07:20:04 +0100
From: Christoph Hellwig <hch@lst.de>
To: Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v2 10/14] riscv: Add support for kernel-mode FPU
Message-ID: <20231228062004.GC12475@lst.de>
References: <20231228014220.3562640-1-samuel.holland@sifive.com>
 <20231228014220.3562640-11-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231228014220.3562640-11-samuel.holland@sifive.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Thu, 28 Dec 2023 10:02:14 +0000
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
Cc: linux-arch@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, loongarch@lists.linux.dev,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Wed, Dec 27, 2023 at 05:42:00PM -0800, Samuel Holland wrote:
> This is motivated by the amdgpu DRM driver, which needs floating-point
> code to support recent hardware. That code is not performance-critical,
> so only provide a minimal non-preemptible implementation for now.
> 
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>
