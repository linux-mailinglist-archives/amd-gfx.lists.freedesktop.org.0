Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4360A88ACC7
	for <lists+amd-gfx@lfdr.de>; Mon, 25 Mar 2024 18:59:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ED9210EA61;
	Mon, 25 Mar 2024 17:59:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fftc+ZYk";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AE6C10E9F4
 for <amd-gfx@lists.freedesktop.org>; Mon, 25 Mar 2024 17:59:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 805E0CE1B3F;
 Mon, 25 Mar 2024 17:59:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BB4DC433C7;
 Mon, 25 Mar 2024 17:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711389583;
 bh=wXPwR8AWQ/l5POkeyRm4pjnxElVQugxHc5xn97XdOt8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=fftc+ZYkkbAwFHlbCa37SyMisbtr/6H45opy0Mf+j5xkS4yQN6nnqvgzKIwN5cMkS
 JGU7aXj8A44g1kqohrtMvyr8BQtkUKYBcOayA6qCJgtTMwTf/kelwo9pOgN/8QnLsu
 UIE6DWfAS1/sVyHXWVKOrMu+RyfOd97ka0hzS3t6wyaEXAFGZi62fjzM3UJynqbbgU
 H0lYPyz92L3C3sMx1f4eQH4DhoUNr+56b45xuwEGRsR2xenSlkm1nQPE1Iz9puf+bD
 H1LGwlI9nP2qDWP/0zv6RAwWAEhOMg0Ubz9A62rXnjwgOVqq9DoYLXgjg373B75r7y
 KgU8mvhg/2W5A==
Date: Mon, 25 Mar 2024 12:59:41 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Damien Le Moal <dlemoal@kernel.org>
Cc: linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 Manivannan Sadhasivami <manivannan.sadhasivam@linaro.org>,
 linux-scsi@vger.kernel.org,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-serial@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>,
 platform-driver-x86@vger.kernel.org, ntb@lists.linux.dev,
 Lee Jones <lee@kernel.org>, David Airlie <airlied@gmail.com>,
 amd-gfx@lists.freedesktop.org, Jason Gunthorpe <jgg@ziepe.ca>,
 linux-rdma@vger.kernel.org, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/28] Remove PCI_IRQ_LEGACY
Message-ID: <20240325175941.GA1443646@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240325070944.3600338-1-dlemoal@kernel.org>
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

On Mon, Mar 25, 2024 at 04:09:11PM +0900, Damien Le Moal wrote:
> This patch series removes the use of the depracated PCI_IRQ_LEGACY macro
> and replace it with PCI_IRQ_INTX. No functional change.
> 
> Damien Le Moal (28):
>   PCI: msi: Use PCI_IRQ_INTX
>   PCI: portdrv: Use PCI_IRQ_INTX
>   PCI: documentation: Use PCI_IRQ_INTX
>   sound: intel: Use PCI_IRQ_INTX
>   usb: hcd-pci: Use PCI_IRQ_INTX
>   tty: 8250_pci: Use PCI_IRQ_INTX
>   platform: intel_ips: Use PCI_IRQ_INTX
>   ntb: Use PCI_IRQ_INTX
>   mfd: intel-lpss-pci: Use PCI_IRQ_INTX
>   drm: amdgpu: Use PCI_IRQ_INTX
>   infiniband: qib: Use PCI_IRQ_INTX
>   infiniband: vmw_pvrdma: Use PCI_IRQ_INTX
>   misc: vmci_guest: Use PCI_IRQ_ALL_TYPES
>   net: xgbe: Use PCI_IRQ_INTX
>   net: aquantia atlantic: Use PCI_IRQ_INTX
>   net: atheros: alx: Use PCI_IRQ_INTX
>   net: realtek: r8169: Use PCI_IRQ_INTX
>   net: wangxun: Use PCI_IRQ_INTX
>   net: wireless: ath10k: Use references to INTX instead of LEGACY
>   net wireless; realtec: Use PCI_IRQ_INTX
>   scsi: arcmsr: Use PCI_IRQ_INTX
>   scsi: hpsa: Use PCI_IRQ_INTX
>   scsi: ipr: Use PCI_IRQ_INTX
>   scsi: megaraid: Use PCI_IRQ_INTX
>   scsi: mpt3sas: Use PCI_IRQ_INTX
>   scsi: pmcraid: Use PCI_IRQ_INTX
>   scsi: vmw_pvscsi: Do not use PCI_IRQ_LEGACY
>   PCI: Remove PCI_IRQ_LEGACY
> 
>  Documentation/PCI/msi-howto.rst               |  2 +-
>  Documentation/PCI/pci.rst                     |  2 +-
>  .../translations/zh_CN/PCI/msi-howto.rst      |  2 +-
>  Documentation/translations/zh_CN/PCI/pci.rst  |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c       |  2 +-
>  drivers/infiniband/hw/qib/qib_iba7220.c       |  2 +-
>  drivers/infiniband/hw/qib/qib_iba7322.c       |  5 ++-
>  drivers/infiniband/hw/qib/qib_pcie.c          |  2 +-
>  .../infiniband/hw/vmw_pvrdma/pvrdma_main.c    |  2 +-
>  drivers/mfd/intel-lpss-pci.c                  |  2 +-
>  drivers/misc/vmw_vmci/vmci_guest.c            |  3 +-
>  drivers/net/ethernet/amd/xgbe/xgbe-pci.c      |  2 +-
>  .../net/ethernet/aquantia/atlantic/aq_cfg.h   |  2 +-
>  .../net/ethernet/aquantia/atlantic/aq_hw.h    |  2 +-
>  .../net/ethernet/aquantia/atlantic/aq_nic.c   |  2 +-
>  .../ethernet/aquantia/atlantic/aq_pci_func.c  |  9 ++---
>  .../aquantia/atlantic/hw_atl/hw_atl_a0.c      |  2 +-
>  .../aquantia/atlantic/hw_atl/hw_atl_b0.c      |  2 +-
>  .../aquantia/atlantic/hw_atl2/hw_atl2.c       |  2 +-
>  drivers/net/ethernet/atheros/alx/main.c       |  2 +-
>  drivers/net/ethernet/realtek/r8169_main.c     |  2 +-
>  drivers/net/ethernet/wangxun/libwx/wx_lib.c   |  8 ++---
>  drivers/net/wireless/ath/ath10k/ahb.c         | 18 +++++-----
>  drivers/net/wireless/ath/ath10k/pci.c         | 36 +++++++++----------
>  drivers/net/wireless/ath/ath10k/pci.h         |  6 ++--
>  drivers/net/wireless/realtek/rtw88/pci.c      |  2 +-
>  drivers/net/wireless/realtek/rtw89/pci.c      |  2 +-
>  drivers/ntb/hw/idt/ntb_hw_idt.c               |  2 +-
>  drivers/pci/msi/api.c                         |  8 ++---
>  drivers/pci/pcie/portdrv.c                    |  8 ++---
>  drivers/platform/x86/intel_ips.c              |  2 +-
>  drivers/scsi/arcmsr/arcmsr_hba.c              |  2 +-
>  drivers/scsi/hpsa.c                           |  2 +-
>  drivers/scsi/ipr.c                            |  2 +-
>  drivers/scsi/megaraid/megaraid_sas_base.c     |  4 +--
>  drivers/scsi/mpt3sas/mpt3sas_base.c           |  2 +-
>  drivers/scsi/pmcraid.c                        |  2 +-
>  drivers/scsi/vmw_pvscsi.c                     |  2 +-
>  drivers/tty/serial/8250/8250_pci.c            |  2 +-
>  drivers/usb/core/hcd-pci.c                    |  3 +-
>  include/linux/pci.h                           |  7 ++--
>  sound/soc/intel/avs/core.c                    |  2 +-
>  42 files changed, 84 insertions(+), 91 deletions(-)

I applied all these to pci/enumeration for v6.10, thanks!

I added acks and reviewed-by and will update if we receive more, and
adjusted subject lines to add "... instead of PCI_IRQ_LEGACY" and in
some cases to match history of the file.

Bjorn
