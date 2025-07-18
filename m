Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 503B6B0A4DB
	for <lists+amd-gfx@lfdr.de>; Fri, 18 Jul 2025 15:10:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C58F210E9C1;
	Fri, 18 Jul 2025 13:10:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gRi4NJni";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 160A910E9C1
 for <amd-gfx@lists.freedesktop.org>; Fri, 18 Jul 2025 13:10:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CBDFD4447B;
 Fri, 18 Jul 2025 13:10:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F304FC4CEEB;
 Fri, 18 Jul 2025 13:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752844208;
 bh=auD37W/5Bb6CHnXA3KG4MJzsvUP86PWLz7PCOdUGwRU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=gRi4NJniUdu8GMfEEPDI9N+YAIUcc3u14dZm92OIeZZSVS6bjiJ/Ngiw7v30YPamA
 ELHllfH5X9qTtZjiLCCDhy6640UnFvsMgT2DastHDrFIFqN08l7v2a8u950Da5YaIA
 LsU+UmZwH2RSUc4EGSvifphTYfSbjHqIjiqkHQylnFo5r1PKGfwMafazWh/sz4YH9y
 rA1v4UWceFVMNIruuKAkRYYtqE/HyowqbPHJ2HPKgV/mXn96i+b8LVhVcliiB/0bTd
 m0iwTNt9BvirT01z3m3LDhS8mzW08gGH+c+BoVvHttQI7I2TfxiDrd+AruH+VJ8Efl
 nJan+X2BQgZ2g==
Message-ID: <d92458bf-fc2b-47bf-b664-9609a3978646@kernel.org>
Date: Fri, 18 Jul 2025 08:10:06 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] drm/amd/display: backlight brightness set to 0 at
 amdgpu initialization
To: Lauri Tirkkonen <lauri@hacktheplanet.fi>, stable@vger.kernel.org
Cc: regressions@lists.linux.dev, amd-gfx@lists.freedesktop.org,
 Mario Limonciello <mario.limonciello@amd.com>, Wayne Lin
 <wayne.lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <aHn33vgj8bM4s073@hacktheplanet.fi>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <aHn33vgj8bM4s073@hacktheplanet.fi>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>



On 7/18/25 2:29 AM, Lauri Tirkkonen wrote:
> Hi,
> 
> I hit this regression on the stable kernel on Alpine with a Lenovo Yoga
> Slim 7 Pro 17ACH5. During early boot, when the amdgpu module gets
> loaded, backlight brightness is set to zero, resulting in a black
> screen (and nothing in userspace is running yet to handle brightness
> keys; I need to use an external monitor or type in my rootfs passphrase
> blind).
> 
> #regzbot introduced: 6c56c8ec6f9762c33bd22f31d43af4194d12da53
> 
> bisect log:
> 
> git bisect start
> # status: waiting for both good and bad commits
> # good: [e60eb441596d1c70e4a264d2bac726c6cd2da067] Linux 6.15.4
> git bisect good e60eb441596d1c70e4a264d2bac726c6cd2da067
> # status: waiting for bad commit, 1 good commit known
> # bad: [1562d948232546cfad45a1beddc70fe0c7b34950] Linux 6.15.6
> git bisect bad 1562d948232546cfad45a1beddc70fe0c7b34950
> # good: [5e10620cb8e76279fd86411536c3fa0f486cd634] drm/xe/vm: move rebind_work init earlier
> git bisect good 5e10620cb8e76279fd86411536c3fa0f486cd634
> # bad: [ece85751c3e46c0e3c4f772113f691b7aec81d5d] btrfs: record new subvolume in parent dir earlier to avoid dir logging races
> git bisect bad ece85751c3e46c0e3c4f772113f691b7aec81d5d
> # bad: [9f5d2487a9fad1d36bcf107d1f3b1ebc8b6796cf] iommufd/selftest: Add asserts testing global mfd
> git bisect bad 9f5d2487a9fad1d36bcf107d1f3b1ebc8b6796cf
> # good: [c0687ec5625b2261d48936d03c761e38657f4a4b] rust: completion: implement initial abstraction
> git bisect good c0687ec5625b2261d48936d03c761e38657f4a4b
> # bad: [889906e6eb5fab990c9b6b5fe8f1122b2416fc22] drm/amd/display: Export full brightness range to userspace
> git bisect bad 889906e6eb5fab990c9b6b5fe8f1122b2416fc22
> # good: [c7d15ba11c8561c5f325ffeb27ed8a4e82d4d322] io_uring/kbuf: flag partial buffer mappings
> git bisect good c7d15ba11c8561c5f325ffeb27ed8a4e82d4d322
> # good: [66089fa8c9ed162744037ab0375e38cc74c7f7ed] drm/amd/display: Add debugging message for brightness caps
> git bisect good 66089fa8c9ed162744037ab0375e38cc74c7f7ed
> # bad: [cd711c87c2862be5e71eee79901f94e1c943f9fc] drm/amd/display: Only read ACPI backlight caps once
> git bisect bad cd711c87c2862be5e71eee79901f94e1c943f9fc
> # bad: [6c56c8ec6f9762c33bd22f31d43af4194d12da53] drm/amd/display: Fix default DC and AC levels
> git bisect bad 6c56c8ec6f9762c33bd22f31d43af4194d12da53
> # first bad commit: [6c56c8ec6f9762c33bd22f31d43af4194d12da53] drm/amd/display: Fix default DC and AC levels
> 
> 'dmesg|grep amd' on 6.15.7 on this machine:
> 
> [    0.319726] perf/amd_iommu: Detected AMD IOMMU #0 (2 banks, 4 counters/bank).
> [    4.090573] [drm] amdgpu kernel modesetting enabled.
> [    4.094238] amdgpu: Virtual CRAT table created for CPU
> [    4.095389] amdgpu: Topology: Add CPU node
> [    4.096451] amdgpu 0000:03:00.0: enabling device (0006 -> 0007)
> [    4.174815] amdgpu 0000:03:00.0: amdgpu: detected ip block number 0 <soc15_common>
> [    4.176034] amdgpu 0000:03:00.0: amdgpu: detected ip block number 1 <gmc_v9_0>
> [    4.176992] amdgpu 0000:03:00.0: amdgpu: detected ip block number 2 <vega10_ih>
> [    4.177911] amdgpu 0000:03:00.0: amdgpu: detected ip block number 3 <psp>
> [    4.178799] amdgpu 0000:03:00.0: amdgpu: detected ip block number 4 <smu>
> [    4.179704] amdgpu 0000:03:00.0: amdgpu: detected ip block number 5 <dm>
> [    4.180594] amdgpu 0000:03:00.0: amdgpu: detected ip block number 6 <gfx_v9_0>
> [    4.181445] amdgpu 0000:03:00.0: amdgpu: detected ip block number 7 <sdma_v4_0>
> [    4.182299] amdgpu 0000:03:00.0: amdgpu: detected ip block number 8 <vcn_v2_0>
> [    4.183114] amdgpu 0000:03:00.0: amdgpu: detected ip block number 9 <jpeg_v2_0>
> [    4.183910] amdgpu 0000:03:00.0: amdgpu: Fetched VBIOS from VFCT
> [    4.184800] amdgpu: ATOM BIOS: 113-CEZANNE-017
> [    4.208484] amdgpu 0000:03:00.0: vgaarb: deactivate vga console
> [    4.208493] amdgpu 0000:03:00.0: amdgpu: Trusted Memory Zone (TMZ) feature enabled
> [    4.208509] amdgpu 0000:03:00.0: amdgpu: MODE2 reset
> [    4.209086] amdgpu 0000:03:00.0: amdgpu: VRAM: 2048M 0x000000F400000000 - 0x000000F47FFFFFFF (2048M used)
> [    4.209099] amdgpu 0000:03:00.0: amdgpu: GART: 1024M 0x0000000000000000 - 0x000000003FFFFFFF
> [    4.209376] [drm] amdgpu: 2048M of VRAM memory ready
> [    4.209386] [drm] amdgpu: 6912M of GTT memory ready.
> [    4.210517] amdgpu 0000:03:00.0: amdgpu: Found VCN firmware Version ENC: 1.24 DEC: 8 VEP: 0 Revision: 3
> [    4.927350] amdgpu 0000:03:00.0: amdgpu: reserve 0x400000 from 0xf47f400000 for PSP TMR
> [    5.010609] amdgpu 0000:03:00.0: amdgpu: RAS: optional ras ta ucode is not available
> [    5.021347] amdgpu 0000:03:00.0: amdgpu: RAP: optional rap ta ucode is not available
> [    5.021357] amdgpu 0000:03:00.0: amdgpu: SECUREDISPLAY: securedisplay ta ucode is not available
> [    5.021725] amdgpu 0000:03:00.0: amdgpu: SMU is initialized successfully!
> [    5.131949] amdgpu 0000:03:00.0: amdgpu: [drm] Using ACPI provided EDID for eDP-1
> [    5.385266] kfd kfd: amdgpu: Allocated 3969056 bytes on gart
> [    5.385286] kfd kfd: amdgpu: Total number of KFD nodes to be created: 1
> [    5.385435] amdgpu: Virtual CRAT table created for GPU
> [    5.385562] amdgpu: Topology: Add dGPU node [0x1638:0x1002]
> [    5.385569] kfd kfd: amdgpu: added device 1002:1638
> [    5.385582] amdgpu 0000:03:00.0: amdgpu: SE 1, SH per SE 1, CU per SH 8, active_cu_number 8
> [    5.385592] amdgpu 0000:03:00.0: amdgpu: ring gfx uses VM inv eng 0 on hub 0
> [    5.385598] amdgpu 0000:03:00.0: amdgpu: ring comp_1.0.0 uses VM inv eng 1 on hub 0
> [    5.385605] amdgpu 0000:03:00.0: amdgpu: ring comp_1.1.0 uses VM inv eng 4 on hub 0
> [    5.385612] amdgpu 0000:03:00.0: amdgpu: ring comp_1.2.0 uses VM inv eng 5 on hub 0
> [    5.385619] amdgpu 0000:03:00.0: amdgpu: ring comp_1.3.0 uses VM inv eng 6 on hub 0
> [    5.385625] amdgpu 0000:03:00.0: amdgpu: ring comp_1.0.1 uses VM inv eng 7 on hub 0
> [    5.385632] amdgpu 0000:03:00.0: amdgpu: ring comp_1.1.1 uses VM inv eng 8 on hub 0
> [    5.385639] amdgpu 0000:03:00.0: amdgpu: ring comp_1.2.1 uses VM inv eng 9 on hub 0
> [    5.385645] amdgpu 0000:03:00.0: amdgpu: ring comp_1.3.1 uses VM inv eng 10 on hub 0
> [    5.385652] amdgpu 0000:03:00.0: amdgpu: ring kiq_0.2.1.0 uses VM inv eng 11 on hub 0
> [    5.385659] amdgpu 0000:03:00.0: amdgpu: ring sdma0 uses VM inv eng 0 on hub 8
> [    5.385665] amdgpu 0000:03:00.0: amdgpu: ring vcn_dec uses VM inv eng 1 on hub 8
> [    5.385672] amdgpu 0000:03:00.0: amdgpu: ring vcn_enc0 uses VM inv eng 4 on hub 8
> [    5.385679] amdgpu 0000:03:00.0: amdgpu: ring vcn_enc1 uses VM inv eng 5 on hub 8
> [    5.385685] amdgpu 0000:03:00.0: amdgpu: ring jpeg_dec uses VM inv eng 6 on hub 8
> [    5.454665] amdgpu 0000:03:00.0: amdgpu: Runtime PM not available
> [    5.455003] amdgpu 0000:03:00.0: amdgpu: [drm] Using custom brightness curve
> [    5.455339] [drm] Initialized amdgpu 3.63.0 for 0000:03:00.0 on minor 1
> [    5.480731] fbcon: amdgpudrmfb (fb0) is primary device
> [    6.796057] amdgpu 0000:03:00.0: [drm] fb0: amdgpudrmfb frame buffer device
> 

Do you by chance have an OLED panel?  I believe what's going on is that 
userspace is writing zero or near zero and on OLED panels with older 
kernels this means non-visible.

There is another commit that fixes the behavior that is probably missing.

