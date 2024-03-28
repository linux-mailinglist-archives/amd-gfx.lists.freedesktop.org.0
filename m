Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFBAB88C2C3
	for <lists+amd-gfx@lfdr.de>; Tue, 26 Mar 2024 13:58:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F60710EF61;
	Tue, 26 Mar 2024 12:58:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="tB1ZpUTW";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6407710E1D3
 for <amd-gfx@lists.freedesktop.org>; Tue, 26 Mar 2024 08:28:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5AAC661281;
 Tue, 26 Mar 2024 08:28:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 637A1C43390;
 Tue, 26 Mar 2024 08:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1711441689;
 bh=z8NWPUYJmsGr2kxmH7x6UVeDQ82FujFPnCIU10rlyEk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tB1ZpUTW2ejyYSpF1sL5KF9xdmawbP/bYgHV0o8zoCnWbYB+zWxgVfZC9VmmsDxRe
 9Li/QYAVZZ9cYAApZZOLdhuOLhHI/0HdpUGvFYKlCdmhgYPyyoiFNzVBKPNxFotoDc
 dZFP5wMuDVQ0yHno98bexW+DaBUriDW9d2uLr37A=
Date: Tue, 26 Mar 2024 09:28:06 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Damien Le Moal <dlemoal@kernel.org>
Cc: linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 Manivannan Sadhasivami <manivannan.sadhasivam@linaro.org>,
 linux-scsi@vger.kernel.org,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-serial@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>,
 platform-driver-x86@vger.kernel.org, ntb@lists.linux.dev,
 Lee Jones <lee@kernel.org>, David Airlie <airlied@gmail.com>,
 amd-gfx@lists.freedesktop.org, Jason Gunthorpe <jgg@ziepe.ca>,
 linux-rdma@vger.kernel.org, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/28] tty: 8250_pci: Use PCI_IRQ_INTX
Message-ID: <2024032658-rescuer-dial-49da@gregkh>
References: <20240325070944.3600338-1-dlemoal@kernel.org>
 <20240325070944.3600338-7-dlemoal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240325070944.3600338-7-dlemoal@kernel.org>
X-Mailman-Approved-At: Tue, 26 Mar 2024 12:58:37 +0000
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

On Mon, Mar 25, 2024 at 04:09:17PM +0900, Damien Le Moal wrote:
> Use the macro PCI_IRQ_INTX instead of the deprecated PCI_IRQ_LEGACY
> macro.
> 
> Signed-off-by: Damien Le Moal <dlemoal@kernel.org>

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
