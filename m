Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDE97923AE
	for <lists+amd-gfx@lfdr.de>; Tue,  5 Sep 2023 16:52:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48C9010E54D;
	Tue,  5 Sep 2023 14:52:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E44F10E551
 for <amd-gfx@lists.freedesktop.org>; Tue,  5 Sep 2023 14:52:48 +0000 (UTC)
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-372-lnxbgMvDPc-QCuJ5zR2xxA-1; Tue, 05 Sep 2023 10:52:45 -0400
X-MC-Unique: lnxbgMvDPc-QCuJ5zR2xxA-1
Received: by mail-il1-f200.google.com with SMTP id
 e9e14a558f8ab-34df008b0b4so15754185ab.1
 for <amd-gfx@lists.freedesktop.org>; Tue, 05 Sep 2023 07:52:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693925565; x=1694530365;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=klLyCH+/rZQLSXpVNPH8e0sfHO/gz4bHny9eZkg3wb8=;
 b=NJXI1yQbNHZ0N4i/pB1+uZmBaaolCNHoozwut/Ym6Pv88UI6q5hJ1T7WhA+0V8Baz0
 DCL66gbqPV4r4h3PXFf15bXIu264oVUrc044C9xuMLEvxM35PWkIps6oy9+rsQc+JBav
 fkscxJ1IaNIH/G1vPKUwEFnI6ah0TVIS7Eo4sH4DiQMbtnNIQVwBkiXiMs8aFQBuxxiX
 SbOfywiXoadBXrPfCjFw/wlpdK9SdXb89djCaqgwHnqJza6bVzi9UbVkkZcaTjfMCl7I
 Q9QdV6bQJhvVwZngIljI4W1KEXqST0lLI3AMOL/AUjvuHKKXXcgqi+DeCSmHRJ46KR9j
 TtaA==
X-Gm-Message-State: AOJu0YyWqhB+j3lld3+Z8YfZGdd1JdLEOJ0yEgFVutgAd4ZbaiRsv0Jb
 lgN1goLCN+pq33isqqiqCjZUEidBnwgV46Jq32sJ4n7kaxIztpddYpQwPhY9O0vpwmgbvtCHapp
 pUCijus8fOKtzw7sTYz2F4DztlQ==
X-Received: by 2002:a05:6e02:f94:b0:34f:1de2:150a with SMTP id
 v20-20020a056e020f9400b0034f1de2150amr3311630ilo.9.1693925565027; 
 Tue, 05 Sep 2023 07:52:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqMN4rRQuc7MxjlhBxrXzdipuAgTC1ZIBNcH5MY3K6vAQBnfx3fyFu0UqPkhZtlNZh3SkN8w==
X-Received: by 2002:a05:6e02:f94:b0:34f:1de2:150a with SMTP id
 v20-20020a056e020f9400b0034f1de2150amr3311613ilo.9.1693925564783; 
 Tue, 05 Sep 2023 07:52:44 -0700 (PDT)
Received: from redhat.com ([38.15.60.12]) by smtp.gmail.com with ESMTPSA id
 p8-20020a92c608000000b00345b34fcf34sm4189494ilm.38.2023.09.05.07.52.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Sep 2023 07:52:44 -0700 (PDT)
Date: Tue, 5 Sep 2023 08:52:43 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: Re: [RFC, drm-misc-next v4 0/9] PCI/VGA: Allowing the user to
 select the primary video adapter at boot time
Message-ID: <20230905085243.4b22725e.alex.williamson@redhat.com>
In-Reply-To: <20230904195724.633404-1-sui.jingfeng@linux.dev>
References: <20230904195724.633404-1-sui.jingfeng@linux.dev>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Sui Jingfeng <suijingfeng@loongson.cn>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Tue,  5 Sep 2023 03:57:15 +0800
Sui Jingfeng <sui.jingfeng@linux.dev> wrote:

> From: Sui Jingfeng <suijingfeng@loongson.cn>
> 
> On a machine with multiple GPUs, a Linux user has no control over which
> one is primary at boot time. This series tries to solve above mentioned
> problem by introduced the ->be_primary() function stub. The specific
> device drivers can provide an implementation to hook up with this stub by
> calling the vga_client_register() function.
> 
> Once the driver bound the device successfully, VGAARB will call back to
> the device driver. To query if the device drivers want to be primary or
> not. Device drivers can just pass NULL if have no such needs.
> 
> Please note that:
> 
> 1) The ARM64, Loongarch, Mips servers have a lot PCIe slot, and I would
>    like to mount at least three video cards.
> 
> 2) Typically, those non-86 machines don't have a good UEFI firmware
>    support, which doesn't support select primary GPU as firmware stage.
>    Even on x86, there are old UEFI firmwares which already made undesired
>    decision for you.
> 
> 3) This series is attempt to solve the remain problems at the driver level,
>    while another series[1] of me is target to solve the majority of the
>    problems at device level.
> 
> Tested (limited) on x86 with four video card mounted, Intel UHD Graphics
> 630 is the default boot VGA, successfully override by ast2400 with
> ast.modeset=10 append at the kernel cmd line.
> 
> $ lspci | grep VGA
> 
>  00:02.0 VGA compatible controller: Intel Corporation CoffeeLake-S GT2 [UHD Graphics 630]

In all my previous experiments with VGA routing and IGD I found that
IGD can't actually release VGA routing and Intel confirmed the hardware
doesn't have the ability to do so.  It will always be primary from a
VGA routing perspective.  Was this actually tested with non-UEFI?

I suspect it might only work in UEFI mode where we probably don't
actually have a dependency on VGA routing.  This is essentially why
vfio requires UEFI ROMs when assigning GPUs to VMs, VGA routing is too
broken to use on Intel systems with IGD.  Thanks,

Alex

>  01:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] Caicos XTX [Radeon HD 8490 / R5 235X OEM]
>  04:00.0 VGA compatible controller: ASPEED Technology, Inc. ASPEED Graphics Family (rev 30)
>  05:00.0 VGA compatible controller: NVIDIA Corporation GK208B [GeForce GT 720] (rev a1)
> 
> $ sudo dmesg | grep vgaarb
> 
>  pci 0000:00:02.0: vgaarb: setting as boot VGA device
>  pci 0000:00:02.0: vgaarb: VGA device added: decodes=io+mem,owns=io+mem,locks=none
>  pci 0000:01:00.0: vgaarb: VGA device added: decodes=io+mem,owns=none,locks=none
>  pci 0000:04:00.0: vgaarb: VGA device added: decodes=io+mem,owns=none,locks=none
>  pci 0000:05:00.0: vgaarb: VGA device added: decodes=io+mem,owns=none,locks=none
>  vgaarb: loaded
>  ast 0000:04:00.0: vgaarb: Override as primary by driver
>  i915 0000:00:02.0: vgaarb: changed VGA decodes: olddecodes=io+mem,decodes=none:owns=io+mem
>  radeon 0000:01:00.0: vgaarb: changed VGA decodes: olddecodes=io+mem,decodes=none:owns=none
>  ast 0000:04:00.0: vgaarb: changed VGA decodes: olddecodes=io+mem,decodes=none:owns=none
> 
> v2:
> 	* Add a simple implemment for drm/i915 and drm/ast
> 	* Pick up all tags (Mario)
> v3:
> 	* Fix a mistake for drm/i915 implement
> 	* Fix patch can not be applied problem because of merge conflect.
> v4:
> 	* Focus on solve the real problem.
> 
> v1,v2 at https://patchwork.freedesktop.org/series/120059/
>    v3 at https://patchwork.freedesktop.org/series/120562/
> 
> [1] https://patchwork.freedesktop.org/series/122845/
> 
> Sui Jingfeng (9):
>   PCI/VGA: Allowing the user to select the primary video adapter at boot
>     time
>   drm/nouveau: Implement .be_primary() callback
>   drm/radeon: Implement .be_primary() callback
>   drm/amdgpu: Implement .be_primary() callback
>   drm/i915: Implement .be_primary() callback
>   drm/loongson: Implement .be_primary() callback
>   drm/ast: Register as a VGA client by calling vga_client_register()
>   drm/hibmc: Register as a VGA client by calling vga_client_register()
>   drm/gma500: Register as a VGA client by calling vga_client_register()
> 
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    | 11 +++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       | 13 ++++-
>  drivers/gpu/drm/ast/ast_drv.c                 | 31 ++++++++++
>  drivers/gpu/drm/gma500/psb_drv.c              | 57 ++++++++++++++++++-
>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   | 15 +++++
>  drivers/gpu/drm/i915/display/intel_vga.c      | 15 ++++-
>  drivers/gpu/drm/loongson/loongson_module.c    |  2 +-
>  drivers/gpu/drm/loongson/loongson_module.h    |  1 +
>  drivers/gpu/drm/loongson/lsdc_drv.c           | 10 +++-
>  drivers/gpu/drm/nouveau/nouveau_vga.c         | 11 +++-
>  drivers/gpu/drm/radeon/radeon_device.c        | 10 +++-
>  drivers/pci/vgaarb.c                          | 43 ++++++++++++--
>  drivers/vfio/pci/vfio_pci_core.c              |  2 +-
>  include/linux/vgaarb.h                        |  8 ++-
>  14 files changed, 210 insertions(+), 19 deletions(-)
> 

