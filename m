Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0020D496BC1
	for <lists+amd-gfx@lfdr.de>; Sat, 22 Jan 2022 11:45:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0531210E485;
	Sat, 22 Jan 2022 10:45:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 564 seconds by postgrey-1.36 at gabe;
 Sat, 22 Jan 2022 02:25:53 UTC
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 174B610E137
 for <amd-gfx@lists.freedesktop.org>; Sat, 22 Jan 2022 02:25:53 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 552795801FA;
 Fri, 21 Jan 2022 21:16:27 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 21 Jan 2022 21:16:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=turner.link; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; bh=2Ks4YRmEPcljHJ
 erAZWS515icKiNKayB8uN7anMTDAI=; b=VXV7Y3cRNuHVmR+RH4wwstQhJk2Bwc
 B9kFO0ff6gkZhbATxca7ckbcB1HgUaScqPuaOsC+XQEqQ3EBB4MwgAmBEHvs4Van
 PVKq6k1E8vHKEOGS4vRJsw3vtnP+Ad5RwYam5+PU4uUV1Pp0OqkJGf6Sx7jd4OKy
 emJ4j2NQf3OUxINlxklg0zqj0s9rMgjVd/AfZ22VsxX6iWzodR2IdRHNn5g+CALQ
 1UQj29WHG4H97rpa86NsczYXK0pZsPAZu9VjeHjMzdpi1ZnN2LrC5LBlIRglsyyn
 DNd9+K+rjMFmAnVMKHHeu51xKGDSYbsStUkRmN9lILNAXYCQxp+Hgh0g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=2Ks4YRmEPcljHJerAZWS515icKiNKayB8uN7anMTD
 AI=; b=SnNXXdHkvOhaFcl+6uNNIwqzdwMIs5+H29f1NBFswg8RZumE44DooKJkb
 eCyN5r+xDC61wHCjySvRcRgrSydTQ2DW+IQtVbA4PY4LXZUeRw0LhMFbXf49wngf
 qoaXdYumEJ8aCQDsleutFUjV0QkipnX7rjOnSfGSXnh4Jv+QadDYzOs6xagnp5+Q
 MfSQ7H52/E+aUq23fvv+xM0jWcm1M05Xi+17m9pIWuBcTuoGy98FBthhpQl7Xjho
 4+gApkXpy9V4Zhq2UUY2dfWKIHtEhtsS3LrR2vT9sBSgHBaV+igtLlCWC9pwY3T/
 BKvFTNAHMF96GeX01CM7ybK2p5AAQ==
X-ME-Sender: <xms:-mjrYbmYlkxHWv7KwirPAbfu3vkMoPS-mlvzNZR7eZrBjBvIY1tNJw>
 <xme:-mjrYe1Y12lTFNN0lpuNQD79LxvWSBrYjFXhRTnwsny8fwPGABrcm3mZ2Y3CuLuPo
 4eCXvDHGhHYKJzhFw>
X-ME-Received: <xmr:-mjrYRojcgLyG-95EFCq6xkHA51RMSLGn-CEEp6ReiwtqrewULROL_LmnlUb>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrvddugdegfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpehfhffvufffjgfkgggtgfesthhqredttddtjeenucfhrhhomheplfgrmhgvshcu
 vfhurhhnvghruceolhhinhhugihkvghrnhgvlhdrfhhoshhssegumhgrrhgtqdhnohhnvg
 drthhurhhnvghrrdhlihhnkheqnecuggftrfgrthhtvghrnhepvdetfffgieevhedvgfei
 ieeiffdtvdegtdduieffvdejjeduudejgedvveeljeehnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomheplhhinhhugihkvghrnhgvlhdrfhhoshhs
 segumhgrrhgtqdhnohhnvgdrthhurhhnvghrrdhlihhnkh
X-ME-Proxy: <xmx:-2jrYTm6_cJPdEuFiDmr_4KP6ZdIUu-OzlKRXnBWpUwpXiTJ46KLbQ>
 <xmx:-2jrYZ1EJ1KCOB13Pv2uFxkZjc3kWIQwEI4sSzeADdMxhrfvphXpyQ>
 <xmx:-2jrYSvh_ymdW36VJx-4nsTEtRzgr9w1XtKM-bU55j7sMLya-b20aw>
 <xmx:-2jrYY2I6IJGhxaBNnsfB0NH76uJbtEak2-8rhk-wmBeCR-wQQSPKQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 21 Jan 2022 21:16:26 -0500 (EST)
References: <87ee57c8fu.fsf@turner.link>
 <acd2fd5e-d622-948c-82ef-629a8030c9d8@leemhuis.info>
 <87a6ftk9qy.fsf@dmarc-none.turner.link> <87zgnp96a4.fsf@turner.link>
 <fc2b7593-db8f-091c-67a0-ae5ffce71700@leemhuis.info>
 <CADnq5_Nr5-FR2zP1ViVsD_ZMiW=UHC1wO8_HEGm26K_EG2KDoA@mail.gmail.com>
From: James Turner <linuxkernel.foss@dmarc-none.turner.link>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [REGRESSION] Too-low frequency limit for AMD GPU
 PCI-passed-through to Windows VM
Date: Fri, 21 Jan 2022 19:51:11 -0500
In-reply-to: <CADnq5_Nr5-FR2zP1ViVsD_ZMiW=UHC1wO8_HEGm26K_EG2KDoA@mail.gmail.com>
Message-ID: <87czkk1pmt.fsf@dmarc-none.turner.link>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 22 Jan 2022 10:45:18 +0000
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, regressions@lists.linux.dev,
 kvm@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>,
 Lijo Lazar <lijo.lazar@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Thorsten Leemhuis <regressions@leemhuis.info>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

> Are you ever loading the amdgpu driver in your tests?

Yes, although I'm binding the `vfio-pci` driver to the AMD GPU's PCI
devices via the kernel command line. (See my initial email.) My
understanding is that `vfio-pci` is supposed to keep other drivers, such
as `amdgpu`, from interacting with the GPU, although that's clearly not
what's happening.

I've been testing with `amdgpu` included in the `MODULES` list in
`/etc/mkinitcpio.conf` (which Arch Linux uses to generate the
initramfs). However, I ran some more tests today (results below), this
time without `i915` or `amdgpu` in the `MODULES` list. The `amdgpu`
kernel module still gets loaded. (I think udev loads it automatically?)

Your comment gave me the idea to blacklist the `amdgpu` kernel module.
That does serve as a workaround on my machine =E2=80=93 it fixes the behavi=
or
for f9b7f3703ff9 ("drm/amdgpu/acpi: make ATPX/ATCS structures global (v2)")
and for the current Arch Linux prebuilt kernel (5.16.2-arch1-1). That's
an acceptable workaround for my machine only because the separate GPU
used by the host is an Intel integrated GPU. That workaround wouldn't
work well for someone with two AMD GPUs.


# New test results

The following tests are set up the same way as in my initial email,
with the following exceptions:

- I've updated libvirt to 1:8.0.0-1.

- I've removed `i915` and `amdgpu` from the `MODULES` list in
  `/etc/mkinitcpio.conf`.

For all three of these tests, `lspci` said the following:

% lspci -nnk -d 1002:6981
01:00.0 VGA compatible controller [0300]: Advanced Micro Devices, Inc. [AMD=
/ATI] Lexa XT [Radeon PRO WX 3200] [1002:6981]
	Subsystem: Dell Device [1028:0926]
	Kernel driver in use: vfio-pci
	Kernel modules: amdgpu

% lspci -nnk -d 1002:aae0
01:00.1 Audio device [0403]: Advanced Micro Devices, Inc. [AMD/ATI] Baffin =
HDMI/DP Audio [Radeon RX 550 640SP / RX 560/560X] [1002:aae0]
	Subsystem: Dell Device [1028:0926]
	Kernel driver in use: vfio-pci
	Kernel modules: snd_hda_intel


## Version f1688bd69ec4 ("drm/amd/amdgpu:save psp ring wptr to avoid attack=
")

This is the commit immediately preceding the one which introduced the issue.

% sudo dmesg | grep -i amdgpu
[   15.840160] [drm] amdgpu kernel modesetting enabled.
[   15.840884] amdgpu: CRAT table not found
[   15.840885] amdgpu: Virtual CRAT table created for CPU
[   15.840893] amdgpu: Topology: Add CPU node

% lsmod | grep amdgpu
amdgpu               7450624  0
gpu_sched              49152  1 amdgpu
drm_ttm_helper         16384  1 amdgpu
ttm                    77824  2 amdgpu,drm_ttm_helper
i2c_algo_bit           16384  2 amdgpu,i915
drm_kms_helper        303104  2 amdgpu,i915
drm                   581632  11 gpu_sched,drm_kms_helper,amdgpu,drm_ttm_he=
lper,i915,ttm

The passed-through GPU worked properly in the VM.


## Version f9b7f3703ff9 ("drm/amdgpu/acpi: make ATPX/ATCS structures global=
 (v2)")

This is the commit which introduced the issue.

% sudo dmesg | grep -i amdgpu
[   15.319023] [drm] amdgpu kernel modesetting enabled.
[   15.329468] amdgpu: CRAT table not found
[   15.329470] amdgpu: Virtual CRAT table created for CPU
[   15.329482] amdgpu: Topology: Add CPU node

% lsmod | grep amdgpu
amdgpu               7450624  0
gpu_sched              49152  1 amdgpu
drm_ttm_helper         16384  1 amdgpu
ttm                    77824  2 amdgpu,drm_ttm_helper
i2c_algo_bit           16384  2 amdgpu,i915
drm_kms_helper        303104  2 amdgpu,i915
drm                   581632  11 gpu_sched,drm_kms_helper,amdgpu,drm_ttm_he=
lper,i915,ttm

The passed-through GPU did not run above 501 MHz in the VM.


## Blacklisted `amdgpu`, version f9b7f3703ff9 ("drm/amdgpu/acpi: make ATPX/=
ATCS structures global (v2)")

For this test, I added `module_blacklist=3Damdgpu` to kernel command line
to blacklist the `amdgpu` module.

% sudo dmesg | grep -i amdgpu
[   14.591576] Module amdgpu is blacklisted

% lsmod | grep amdgpu

The passed-through GPU worked properly in the VM.


James
