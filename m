Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A070D72D7A3
	for <lists+amd-gfx@lfdr.de>; Tue, 13 Jun 2023 05:01:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CC8E10E2FD;
	Tue, 13 Jun 2023 03:00:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 132FB10E004;
 Tue, 13 Jun 2023 03:00:41 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8DxDevV24dkQmMEAA--.9387S3;
 Tue, 13 Jun 2023 11:00:37 +0800 (CST)
Received: from openarena.loongson.cn (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8BxC8rV24dkOkAYAA--.60391S2; 
 Tue, 13 Jun 2023 11:00:37 +0800 (CST)
From: Sui Jingfeng <suijingfeng@loongson.cn>
To: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v7 0/8] PCI/VGA: Introduce is_boot_device function callback to
 vga_client_register
Date: Tue, 13 Jun 2023 11:00:27 +0800
Message-Id: <20230613030035.216556-1-suijingfeng@loongson.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxC8rV24dkOkAYAA--.60391S2
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW7ZrWUZF45Zr4kur18tFW3XFc_yoW8trWkpF
 45KF9xAr95JF4akry7Aw4xZFy5Zan7CayfKr9rCw1a93W5Cry8trWqyFWrK34DJrWxAF4r
 tr9xKry7GF1qvrXCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
 6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
 Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE
 14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
 0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
 7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
 C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF
 04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7
 CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jOuc_UUUUU=
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
Cc: linux-fbdev@vger.kernel.org, kvm@vger.kernel.org,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sui Jingfeng <15330273260@189.cn>, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Sui Jingfeng <15330273260@189.cn>

The vga_is_firmware_default() function is arch-dependent, it's probably
wrong if we simply remove the arch guard. As the VRAM BAR which contains
firmware framebuffer may move, while the lfb_base and lfb_size members of
the screen_info does not change accordingly. In short, it should take the
re-allocation of the PCI BAR into consideration.

With the observation that device drivers or video aperture helpers may
have better knowledge about which PCI bar contains the firmware fb,
which could avoid the need to iterate all of the PCI BARs. But as a PCI
function at pci/vgaarb.c, vga_is_firmware_default() is not suitable to
make such an optimization since it is loaded too early.

There are PCI display controllers that don't have a dedicated VRAM bar,
this function will lose its effectiveness in such a case. Luckily, the
device driver can provide an accurate workaround.

Therefore, this patch introduces a callback that allows the device driver
to tell the VGAARB if the device is the default boot device. Also honor
the comment: "Clients have two callback mechanisms they can use"

Sui Jingfeng (8):
  PCI/VGA: Use unsigned type for the io_state variable
  PCI/VGA: Deal only with VGA class devices
  PCI/VGA: Tidy up the code and comment format
  PCI/VGA: Replace full MIT license text with SPDX identifier
  video/aperture: Add a helper to detect if an aperture contains
    firmware FB
  PCI/VGA: Introduce is_boot_device function callback to
    vga_client_register
  drm/amdgpu: Implement the is_boot_device callback function
  drm/radeon: Implement the is_boot_device callback function

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  12 +-
 drivers/gpu/drm/drm_aperture.c             |  16 +++
 drivers/gpu/drm/i915/display/intel_vga.c   |   3 +-
 drivers/gpu/drm/nouveau/nouveau_vga.c      |   2 +-
 drivers/gpu/drm/radeon/radeon_device.c     |  12 +-
 drivers/pci/vgaarb.c                       | 153 +++++++++++++--------
 drivers/vfio/pci/vfio_pci_core.c           |   2 +-
 drivers/video/aperture.c                   |  29 ++++
 include/drm/drm_aperture.h                 |   2 +
 include/linux/aperture.h                   |   7 +
 include/linux/vgaarb.h                     |  35 ++---
 11 files changed, 184 insertions(+), 89 deletions(-)

-- 
2.25.1

