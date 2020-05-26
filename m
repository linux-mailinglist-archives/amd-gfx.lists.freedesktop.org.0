Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C38F61B64DD
	for <lists+amd-gfx@lfdr.de>; Thu, 23 Apr 2020 21:55:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E19B76E9B8;
	Thu, 23 Apr 2020 19:55:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCD086E9B8
 for <amd-gfx@lists.freedesktop.org>; Thu, 23 Apr 2020 19:55:44 +0000 (UTC)
Received: from localhost (mobile-166-175-187-210.mycingular.net
 [166.175.187.210])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 328C820728;
 Thu, 23 Apr 2020 19:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587671744;
 bh=w+Gr4aL6+GUsaxk5mbOujICYqjP6mp6V8eJFr3DAi8c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=LEFhNsqS9MWcxnRtf9yNHsQ8brs8pDRRjfbvUeMtzRYh5hT+kEjpXEFYHCWEFdTCa
 WdJYNrCj3BfwFml0StqTLBvA6e61MlN7delxIAvqNeJSbKE3EaPS8jJ6nuD5CogOhS
 5fV55bi1cCMac8S8781gvMPA77FwOg6FSe19QEJ0=
Date: Thu, 23 Apr 2020 14:55:42 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH] PCI/P2PDMA: Add additional AMD ZEN root ports to the
 whitelist
Message-ID: <20200423195542.GA216882@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200406194201.846411-1-alexander.deucher@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, linux-pci@vger.kernel.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Mon, Apr 06, 2020 at 03:42:01PM -0400, Alex Deucher wrote:
> According to the hw architect, pre-ZEN parts support
> p2p writes and ZEN parts support both p2p reads and writes.
> =

> Add entries for Zen parts Raven (0x15d0) and Renoir (0x1630).
> =

> Cc: Christian K=F6nig <christian.koenig@amd.com>
> Acked-by: Christian K=F6nig <christian.koenig@amd.com>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>

Applied with Huang's ack to pci/p2pdma for v5.8, thanks!

> ---
>  drivers/pci/p2pdma.c | 2 ++
>  1 file changed, 2 insertions(+)
> =

> diff --git a/drivers/pci/p2pdma.c b/drivers/pci/p2pdma.c
> index 9a8a38384121..91a4c987399d 100644
> --- a/drivers/pci/p2pdma.c
> +++ b/drivers/pci/p2pdma.c
> @@ -282,6 +282,8 @@ static const struct pci_p2pdma_whitelist_entry {
>  } pci_p2pdma_whitelist[] =3D {
>  	/* AMD ZEN */
>  	{PCI_VENDOR_ID_AMD,	0x1450,	0},
> +	{PCI_VENDOR_ID_AMD,	0x15d0,	0},
> +	{PCI_VENDOR_ID_AMD,	0x1630,	0},
>  =

>  	/* Intel Xeon E5/Core i7 */
>  	{PCI_VENDOR_ID_INTEL,	0x3c00, REQ_SAME_HOST_BRIDGE},
> -- =

> 2.25.1
> =

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
