Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD8369234E
	for <lists+amd-gfx@lfdr.de>; Fri, 10 Feb 2023 17:30:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE53610E119;
	Fri, 10 Feb 2023 16:30:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6D7910E119
 for <amd-gfx@lists.freedesktop.org>; Fri, 10 Feb 2023 16:30:50 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 j6-20020a9d7686000000b0068d4ba9d141so1680642otl.6
 for <amd-gfx@lists.freedesktop.org>; Fri, 10 Feb 2023 08:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1xKJgqTES4Y1ubN8XM2HsQqVacGZvGadNY3UmBuYxPI=;
 b=N7MueVuzk4rFLlVoqheOJtlOEaKS4el0qRQF8Kt6tiaU7d1m2fmbz73mjwqlNou2PX
 NsESlEYoZV1aHGYBrqAnmItwLcmM4SPI5P3+cAUVTJ4cUx3DovW3kR+QZ6JixZWF1h5Y
 3tqVjZP67sIS3bTwI3Mm/PsTU43HathH3gQC6YoPs65ANwshepMsSj+tnonxqGd0h1Wn
 3Zoh7O/s6s/vQaCrM0uJ1mVrhPEeJ+9CEg76SQGVCg098vgpDBYOYBlNwXpdWTnOBlZy
 D8uXwbFkNWVJ4qgu32qjnNNr3OJPGzbLkfEdeEgo50WGHrRk8wGY101RFJTqWBbGxO9b
 mzGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1xKJgqTES4Y1ubN8XM2HsQqVacGZvGadNY3UmBuYxPI=;
 b=NW+JsI+ab1hPZEgmdMdHaqqWMP/ZcLCDmDFMscG4LG3a645+w4CvTAQcNOV6f3A9mS
 E5PYCMWcJCXmgYETTBiM8SAD77F0aZSmXBlRHCbmEcrzsiUkGanYNhcPh/A4eeJsbx+h
 qR+pWayZhiJar/q85nkSVzeNz3+5Bu7FxzC0ST10EZKu4cToZ2WmuAqbWP97+vKAmVaN
 WET5AaY6KPgr0a2FZL457aHM1DKDGR3pXLAE3jeP7s3AFVdUAl4Y5xn5l8/wRpcPmMvj
 EimWhHD9ueRAUzZboAqwkk5QYFqYcxrKKDD6LVOyMveZ/6+j/NV1XwCY/Zx77fMVXyde
 rJqg==
X-Gm-Message-State: AO0yUKU13p13oIHhLXfRAJj7EjzpHJAHSDn7q0/sKQA7FsJ/LHnupxvq
 cJbZWXN4HLxPh7yIvyT9trwQE2pTooaAtYgp1nA=
X-Google-Smtp-Source: AK7set97QTJ9hS1PDImhYsFB6nhTFb+J1wBuLYTOuOx3+Li3oqFhAlOgOrvhW6466NNQ3h1jIhydK/eY9ajBbegLszU=
X-Received: by 2002:a9d:6f13:0:b0:68d:b51a:5cde with SMTP id
 n19-20020a9d6f13000000b0068db51a5cdemr1044182otq.62.1676046649983; Fri, 10
 Feb 2023 08:30:49 -0800 (PST)
MIME-Version: 1.0
References: <20230210044826.9834-1-orlandoch.dev@gmail.com>
In-Reply-To: <20230210044826.9834-1-orlandoch.dev@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 10 Feb 2023 11:30:38 -0500
Message-ID: <CADnq5_PK7=64SW8O+Hed1h7UWfxVZSpNOwx-paUSJhpCdK7i5A@mail.gmail.com>
Subject: Re: [RFC PATCH 0/9] apple-gmux: support MMIO gmux type on T2 Macs
To: Orlando Chamberlain <orlandoch.dev@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: alsa-devel@alsa-project.org,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Rander Wang <rander.wang@intel.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 YiPeng Chai <YiPeng.Chai@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 David Airlie <airlied@gmail.com>, Evan Quan <evan.quan@amd.com>,
 Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 amd-gfx@lists.freedesktop.org, Yong Zhi <yong.zhi@intel.com>,
 Aun-Ali Zaidi <admin@kodeit.net>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Bokun Zhang <Bokun.Zhang@amd.com>, Mark Gross <markgross@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Jaroslav Kysela <perex@perex.cz>,
 Kerem Karabay <kekrby@gmail.com>, platform-driver-x86@vger.kernel.org,
 Jack Xiao <Jack.Xiao@amd.com>, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 Aditya Garg <gargaditya08@live.com>, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?B?QW1hZGV1c3ogU8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Fri, Feb 10, 2023 at 3:04 AM Orlando Chamberlain
<orlandoch.dev@gmail.com> wrote:
>
> Hi All,
>
> This patch series adds support for the MMIO based gmux present on these
> Dual GPU Apple T2 Macs: MacBookPro15,1, MacBookPro15,3, MacBookPro16,1,
> MacBookPro16,4 (although amdgpu isn't working on MacBookPro16,4 [1]).
>
> It's only been tested by people on T2 Macs with MMIO based gmux's using
> t2linux [2] kernels, but some changes may impact older port io and indexed
> gmux's so testing, especially on those older Macbooks, would be
> appreciated.
>
> # 1-2:
>
> refactor code to make it easier to add the 3rd gmux type.
>
> # 3:
>
> has a slight change in how the switch state is read, I don't
> expect this to cause issues for older models (but still, please test if
> you have one!)
>
> # 4:
>
> implements a system to support more than 2 gmux types
>
> # 5:
>
> start using the gmux's GMSP acpi method when handling interrupts. This
> is needed for the MMIO gmux's, and its present in the acpi tables of some
> indexed gmux's I could find so hopefully enabling this for all models
> will be fine, but if not it can be only used on MMIO gmux's.
>
> # 6:
>
> Adds support for the MMIO based gmux on T2 macs.
>
> # 7:
>
> Add a sysfs interface to apple-gmux so data from ports can be read
> from userspace, and written to if the user enables an unsafe kernel
> parameter.
>
> This can be used for more easily researching what unknown ports do,
> and switching gpus when vga_switcheroo isn't ready (e.g. when one gpu
> is bound to vfio-pci and in use by a Windows VM, I can use this to
> switch my internal display between Linux and Windows easily).
>
> # 8-9:
>
> These patches make amdgpu and snd_hda_intel register with vga_switcheroo
> on Macbooks. I would like advice from the AMD folks on how they want
> this to work, so that both PX and apple-gmux laptops work properly.
>
> For radeon and nouveau we just register for every non-thunderbolt
> device, but this was changed for AMD cards in commit 3840c5bcc245
> ("drm/amdgpu: disentangle runtime pm and vga_switcheroo") and commit
> 586bc4aab878 ("ALSA: hda/hdmi - fix vgaswitcheroo detection for AMD").
>
> This meant that only gpu's with PX register. Commit #8 makes amdgpu
> register for all non-thinderbolt cards, and commit #9 makes snd_hda_intel
> register for all amd cards with the PWRD (mentioned below) acpi method.
> An alternative would be using apple-gmux-detect(), but that won't work
> after apple-gmux has probed and claimed its memory resources.
>
> # Issues:
>
> 1. Switching gpus at runtime has the same issue as indexed gmux's: the
> inactive gpu can't probe the DDC lines for eDP [3]
>
> 2. Powering on the amdgpu with vga_switcheroo doesn't work well. I'm
> told on the MacBookPro15,1 it works sometimes, and adding delays helps,
> but on my MacBookPro16,1 I haven't been able to get it to work at all:
>
> snd_hda_intel 0000:03:00.1: Disabling via vga_switcheroo
> snd_hda_intel 0000:03:00.1: Cannot lock devices!
> amdgpu: switched off
> amdgpu: switched on
> amdgpu 0000:03:00.0:
>         Unable to change power state from D3hot to D0, device inaccessible
> amdgpu 0000:03:00.0:
>         Unable to change power state from D3cold to D0, device inaccessible
> [drm] PCIE GART of 512M enabled (table at 0x00000080FEE00000).
> [drm] PSP is resuming...
> [drm:psp_hw_start [amdgpu]] *ERROR* PSP create ring failed!
> [drm:psp_resume [amdgpu]] *ERROR* PSP resume failed
> [drm:amdgpu_device_fw_loading [amdgpu]]
>         *ERROR* resume of IP block <psp> failed -62
> amdgpu 0000:03:00.0: amdgpu: amdgpu_device_ip_resume failed (-62).
> snd_hda_intel 0000:03:00.1: Enabling via vga_switcheroo
> snd_hda_intel 0000:03:00.1:
>         Unable to change power state from D3cold to D0, device inaccessible
> snd_hda_intel 0000:03:00.1: CORB reset timeout#2, CORBRP = 65535
> snd_hda_codec_hdmi hdaudioC0D0: Unable to sync register 0x2f0d00. -5
>
> There are some acpi methods (PWRD, PWG1 [4, 5]) that macOS calls when
> changing the amdgpu's power state, but we don't use them and that could be
> a cause. Additionally unlike previous generation Macbooks which work

That is likely the cause.  On non-Mac platforms, the power is
controlled via the PX ACPI interface (for old platforms) or standard
ACPI power resources on more recent platforms.  This is handled by the
ACPI core on these platforms (i.e., D3cold).

> better, on MacBookPro16,1 the gpu is located behind 2 pci bridges:
>
> 01:00.0 PCI bridge: Advanced Micro Devices, Inc. [AMD/ATI]
>         Navi 10 XL Upstream Port of PCI Express Switch (rev 43)
> 02:00.0 PCI bridge: Advanced Micro Devices, Inc. [AMD/ATI]
>         Navi 10 XL Downstream Port of PCI Express Switch
> 03:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI]
>         Navi 14 [Radeon RX 5500/5500M / Pro 5500M] (rev 43)
> 03:00.1 Audio device: Advanced Micro Devices, Inc. [AMD/ATI]
>         Navi 10 HDMI Audio
>
> Upon attempting to power on the gpu with vga_switcheroo, all these
> devices except 01:00.0 have their config space in `lspci -x` filled with
> 0xff. `echo 1 > /sys/bus/pci/rescan` fixes that and the dmesg errors about
> changing power state, but "PSP create ring failed" still happens, and
> the gpu doesn't resume properly.

All of those devices are part of the dGPU itself.  When the power is
cut to the dGPU, all of those devices will lose power.  If you are
reading all 1's from the PCI config space for any of those devices,
that is a good sign that the power is off to the GPU.

Alex

>
> [1]: https://lore.kernel.org/all/3AFB9142-2BD0-46F9-AEA9-C9C5D13E68E6@live.com/
> [2]: https://t2linux.org
> [3]: https://lore.kernel.org/all/9eed8ede6f15a254ad578e783b050e1c585d5a15.1439288957.git.lukas@wunner.de/
> [4]: https://gist.github.com/Redecorating/6c7136b7a4ac7ce3b77d8e41740dd87b
> [5]: https://lore.kernel.org/all/20120710160555.GA31562@srcf.ucam.org/
>
> Kerem Karabay (1):
>   drm/amdgpu: register a vga_switcheroo client for all GPUs that are not
>     thunderbolt attached
>
> Orlando Chamberlain (8):
>   apple-gmux: use cpu_to_be32 instead of manual reorder
>   apple-gmux: consolidate version reading
>   apple-gmux: use first bit to check switch state
>   apple-gmux: refactor gmux types
>   apple-gmux: Use GMSP acpi method for interrupt clear
>   apple-gmux: support MMIO gmux on T2 Macs
>   apple-gmux: add sysfs interface
>   hda/hdmi: Register with vga_switcheroo on Dual GPU Macbooks
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  18 +-
>  drivers/platform/x86/apple-gmux.c          | 416 +++++++++++++++++----
>  include/linux/apple-gmux.h                 |  50 ++-
>  sound/pci/hda/hda_intel.c                  |  19 +-
>  4 files changed, 409 insertions(+), 94 deletions(-)
>
> --
> 2.39.1
>
