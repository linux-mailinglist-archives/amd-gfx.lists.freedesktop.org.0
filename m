Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9A42F0E21
	for <lists+amd-gfx@lfdr.de>; Mon, 11 Jan 2021 09:27:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EFEB6E071;
	Mon, 11 Jan 2021 08:27:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14E7D6E913;
 Sat,  9 Jan 2021 09:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=orTrwl6mDAQHr3qpvUBQdkm781G49tmCK2vydKoShek=; b=UwQt0S0ZTez3nYn6wqD4k/xQyg
 oovrXB/K0vpV1JZiwhqQj1Z11RB1FRONgP9z5FT19CugTW+kUMY3fFfUUMrL3e/LeJ9oJx4cWy9XB
 wBiLpGKwChJAXwT8NnJFh3kU4r4uxpP1tL+saoOO9kRd01AcQ3BhdUjrU2qTREpp7X9Q3EC+IaOGL
 fSK7AvLp8274SkrwZdCswjgXOXse5gaUALd4DYZR8vT9PD3u4nwz06dNq4suk3A06E4yWGlvUeyKr
 Ro1UHnY5q8es01SI36HIcp9yrbBbMEBmHG0Tm4V3J0k5iomw0++9icz7l0o+aZ1D41tD+bKaTpcxo
 PKC4WJWg==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1kyAUb-000PHa-89; Sat, 09 Jan 2021 09:25:08 +0000
Date: Sat, 9 Jan 2021 09:25:05 +0000
From: Christoph Hellwig <hch@infradead.org>
To: Christian K??nig <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 1/4] pci: export pci_rebar_get_possible_sizes
Message-ID: <20210109092505.GA95206@infradead.org>
References: <20210105134404.1545-1-christian.koenig@amd.com>
 <20210105134404.1545-2-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210105134404.1545-2-christian.koenig@amd.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Mon, 11 Jan 2021 08:27:21 +0000
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
Cc: bhelgaas@google.com, devspam@moreofthesa.me.uk,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Tue, Jan 05, 2021 at 02:44:01PM +0100, Christian K??nig wrote:
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index e578d34095e9..ef80ed451415 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -3579,6 +3579,7 @@ u32 pci_rebar_get_possible_sizes(struct pci_dev *pdev, int bar)
>  	pci_read_config_dword(pdev, pos + PCI_REBAR_CAP, &cap);
>  	return (cap & PCI_REBAR_CAP_SIZES) >> 4;
>  }
> +EXPORT_SYMBOL(pci_rebar_get_possible_sizes);

EXPORT_SYMBOL_GPL please for such internals.
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
