Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10145A72B47
	for <lists+amd-gfx@lfdr.de>; Thu, 27 Mar 2025 09:19:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 302DD10E874;
	Thu, 27 Mar 2025 08:19:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=spasswolf@web.de header.b="Rtk7Cs2m";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF72810E20F
 for <amd-gfx@lists.freedesktop.org>; Wed, 26 Mar 2025 22:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1743026416; x=1743631216; i=spasswolf@web.de;
 bh=NZgnxOwxY80S06TaGsAx/yz0qgzMPN80heeewHHa8Mc=;
 h=X-UI-Sender-Class:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
 References:Content-Type:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=Rtk7Cs2mhtke8dVIjvNVnjPhcMPSKxnFEFxlSPVQwszsj53HIWkTTls7+NQac0RO
 FGYOLpi29thHXhpDfrZwg48KuniERyEFudFIrfsXhunTXdKHKFDuZy1dIy9JiaBcB
 6j88LyKYARnSHHRME1z8I7TdvKtRX3r11XgzfXUICAaf/F3JSnZgmQWSHL3q7RFMt
 aQFnA+00zGDmWT84LUFJwNPtIuR0ZfQ1MjJdRD03230tlden4JiXYWUBKW2Z+4IOB
 ya0M1p4p6Z/zs2ZNa4Xm8FWx5LV9Jz5ggmbSBg1EiR5wwigydsMqk3wyeCWc22jcA
 sKTCPIfLQf2FBjZLfg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.0.101] ([95.223.134.88]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MWQud-1teSbL2J11-00V7hD; Wed, 26
 Mar 2025 23:00:16 +0100
Message-ID: <c66e2c03648370d5e5c0745f32ebd58367bbe48b.camel@web.de>
Subject: Re: commit 7ffb791423c7 breaks steam game
From: Bert Karwatzki <spasswolf@web.de>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Balbir Singh <balbirs@nvidia.com>, Ingo Molnar <mingo@kernel.org>, Kees
 Cook <kees@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Linus Torvalds
 <torvalds@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>,
 Andy Lutomirski <luto@kernel.org>, Alex Deucher
 <alexander.deucher@amd.com>, linux-kernel@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org, spasswolf@web.de
Date: Wed, 26 Mar 2025 23:00:15 +0100
In-Reply-To: <64945196-f05f-478e-a2b5-f0bd58345136@amd.com>
References: <20250325101424.4478-1-spasswolf@web.de>
 <64945196-f05f-478e-a2b5-f0bd58345136@amd.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:vr5jK1Bq+qFoM5SrO8WZNBji/H29ncyrs12aU/ZUKzmyQle+/C/
 zGWPzODXSVFllt8jXVphewE+EMSYus9L3BRX/oAdq0OZ1+zhR6YJff/8D9tC9ngsNRtkbax
 ErFoOJP27pmpDQI1yc9R6Ugf1IxsFAyI+OtKA9A9Ewsxg4BFxpaLmb7MyrYOG17Mh1wfw58
 4Y3gENUiBfxm20zjYowNQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:I8GXOROKfjI=;dL30xzzQvmuYrt5fDYh67fF9xFZ
 f9boT61cz5+nH1BcofgETngrZ44KcCwxuOG9P3i6nxs5qOv2x81axdsxUunNDJtu4CzDjqjvh
 wRWtqhR6UPdQrGesI9tiAGSkVf8NMN8CSZeklu7k6MPRpFT1iUKLeWcXotbdvv/ntdUwDeO4M
 /6aSnK2hoMemkiaPA7If5fEqp9EYfzMal1dxyELejFydWMJIQB0DEtixLyWru+Fjtkn72ukUv
 +J1lgEquZAe/OnnK7dO5b+dvDP6gedd9nU6P79T6AnFFJcadBE3tM7+n/u/ID8bR/6AWQOkm5
 kJNuZFBDqNte5Yzck4X8QANC3s1oSd2bWG0r4akYSvgIf5+EWchOiPH0SPK3GfzhMnDgIaisA
 zmjKaKkKMTZTUhqCJFhVrFnG6gc9S9bzjREHEhMOE27si/dyHudRNER668sfJ2rv5sZsRLo+Z
 WtpCf7hIeVQ8v9cwDelzws6Ki28ZGhwickx+OTxmD9L6/sYykH2s8jm1qye/gw7boV3T2GDV2
 Sj5ZJ5cPV21iLo61XvC640HiHw/iCli64VhayInaQNsGX9xA8QILKDvK13x4jHWp/aFhhx50M
 1JqYKBxthYq1+L1IrGMmHFowKbSfVjzPC0YaAeOU0GCChlZ3a/QVodK0cSWhfNnhJvcRbYU+H
 xOX7QROcjGPBc0+qqkezrqt7sC0UBN1T/+XfqYRSui3EAojd0Hn3G+kMbXSqC7+bxfWXO1pP0
 /jHhJK6d5g/cwrRToWIEZKEV3v8UWQ6MQ9MOD/b5j+0gQ/z74PEO6oBT2TqWv41etILInRWq7
 Waojtj1ZxzBuyWmMqg6hqS7snjozM1VKBG/VsrYpNW0LnSbN+WlOGfVtzxzLuhME13WpL1mcG
 lHgP5kNKFmZN/wgAIxJAyr1w4NUsjku7FDhYMGpVtebxdu/pQt2vpN+u/zUMAczRBzYbolsNP
 Jza1aVXB66KMjCPwd0Re8GcUkdNc5PgBaj9svpNwTHrw08UIE7rsIET1fmY+RkmFJy+VVz9mU
 5Qyrbfn7+nfakGviBoenq5a2Dju01AXnNfxNJdBvpTyPg/Nq/1Y+305rJMqnd3Hf+Ui9LTVfw
 LZGIbP5R+BhyrqiRCypSV22BCYbDPDCWU8iyspq4+nNlEzWkkjOBLLqdnuj8nRFl+X0tfGP/L
 +zA7E5hg2FNtdhz3FxzzWOGtiFm6B7iUn609kca7BWi48TNhMETdKYVkrWGAuBOgtecuwkdMP
 u0KDEi041baCo3qBuui3wjOojhRX8mUK62Qkoan81o4fnRx4gtuFAPf3Db5IKPgOVVCOoTLIE
 gcZXnYjqOmjitaBTydu1cjjt+p/F9a1Qt9Vzc4Iql9ci46skDzQxceRk6/n+GjIXihwy1vtCV
 VtkeubQeCcotV9uwdxuqNyK2kOisxViYu1SxtW2hQKH+2+jJW+lOfIF8XTNaWgNioqwGOIEZs
 LSyWleQ==
X-Mailman-Approved-At: Thu, 27 Mar 2025 08:19:46 +0000
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

Am Dienstag, dem 25.03.2025 um 13:23 +0100 schrieb Christian K=C3=B6nig:
> Am 25.03.25 um 11:14 schrieb Bert Karwatzki:
> > My /proc/iomem  contans two memory areas of 8G size which are
> > belonging to PCI 0000:03:00.0, one of the is the BAR reported by dmesg
> > [ 0.312692] [ T1] pci 0000:03:00.0: BAR 0 [mem 0xfc00000000-0xfdffffff=
ff 64bit pref]
>
> > the other one is "afe00000000-affffffffff : 0000:03:00.0" (in the case=
 without nokaslr) which shifts
> > to "3ffe00000000-3fffffffffff : 0000:03:00.0" in the case with nokaslr=
.
>
> You need to figure out where that stuff is coming from.
>
> See below for another extremely odd thing.
>
> >
> > Here's /proc/iomem in the case without nokaslr:
> > 00000000-00000fff : Reserved
> > 00001000-0009ffff : System RAM
> > 000a0000-000fffff : Reserved
> >   000a0000-000dffff : PCI Bus 0000:00
> >   000f0000-000fffff : System ROM
> > 00100000-09bfefff : System RAM
> > 09bff000-0a000fff : Reserved
> > 0a001000-0a1fffff : System RAM
> > 0a200000-0a20efff : ACPI Non-volatile Storage
> > 0a20f000-e62edfff : System RAM
> > e62ee000-e63e1fff : Reserved
> > e63e2000-e87cafff : System RAM
> > e87cb000-e87cbfff : Reserved
> > e87cc000-e9e1ffff : System RAM
> > e9e20000-eb33efff : Reserved
> >   eb31e000-eb321fff : MSFT0101:00
> >   eb322000-eb325fff : MSFT0101:00
> > eb33f000-eb39efff : ACPI Tables
> > eb39f000-eb556fff : ACPI Non-volatile Storage
> > eb557000-ed1fefff : Reserved
> > ed1ff000-edffffff : System RAM
> > ee000000-efffffff : Reserved
> > f0000000-fcffffff : PCI Bus 0000:00
> >   f0000000-f7ffffff : PCI ECAM 0000 [bus 00-7f]
> >     f0000000-f7ffffff : pnp 00:00
> >   fc500000-fc9fffff : PCI Bus 0000:08
> >     fc500000-fc5fffff : 0000:08:00.7
> >       fc500000-fc5fffff : pcie_mp2_amd
> >     fc600000-fc6fffff : 0000:08:00.4
> >       fc600000-fc6fffff : xhci-hcd
> >     fc700000-fc7fffff : 0000:08:00.3
> >       fc700000-fc7fffff : xhci-hcd
> >     fc800000-fc8fffff : 0000:08:00.2
> >       fc800000-fc8fffff : ccp
> >     fc900000-fc97ffff : 0000:08:00.0
> >     fc980000-fc9bffff : 0000:08:00.5
> >       fc980000-fc9bffff : AMD ACP3x audio
> >         fc980000-fc990200 : acp_pdm_iomem
> >     fc9c0000-fc9c7fff : 0000:08:00.6
> >       fc9c0000-fc9c7fff : ICH HD audio
> >     fc9c8000-fc9cbfff : 0000:08:00.1
> >       fc9c8000-fc9cbfff : ICH HD audio
> >     fc9cc000-fc9cdfff : 0000:08:00.7
> >     fc9ce000-fc9cffff : 0000:08:00.2
> >       fc9ce000-fc9cffff : ccp
> >   fca00000-fccfffff : PCI Bus 0000:01
> >     fca00000-fcbfffff : PCI Bus 0000:02
> >       fca00000-fcbfffff : PCI Bus 0000:03
> >         fca00000-fcafffff : 0000:03:00.0
> >         fcb00000-fcb1ffff : 0000:03:00.0
> >         fcb20000-fcb23fff : 0000:03:00.1
> >           fcb20000-fcb23fff : ICH HD audio
> >     fcc00000-fcc03fff : 0000:01:00.0
> >   fcd00000-fcdfffff : PCI Bus 0000:07
> >     fcd00000-fcd03fff : 0000:07:00.0
> >       fcd00000-fcd03fff : nvme
> >   fce00000-fcefffff : PCI Bus 0000:06
> >     fce00000-fce03fff : 0000:06:00.0
> >       fce00000-fce03fff : nvme
> >   fcf00000-fcffffff : PCI Bus 0000:05
> >     fcf00000-fcf03fff : 0000:05:00.0
> >     fcf04000-fcf04fff : 0000:05:00.0
> >       fcf04000-fcf04fff : r8169
> > fd300000-fd37ffff : amd_iommu
> > fec00000-fec003ff : IOAPIC 0
> > fec01000-fec013ff : IOAPIC 1
> > fec10000-fec10fff : Reserved
> >   fec10000-fec10fff : pnp 00:04
> > fed00000-fed00fff : Reserved
> >   fed00000-fed003ff : HPET 0
> >     fed00000-fed003ff : PNP0103:00
> > fed40000-fed44fff : Reserved
> > fed80000-fed8ffff : Reserved
> >   fed81200-fed812ff : AMDI0030:00
> >   fed81500-fed818ff : AMDI0030:00
> >     fed81500-fed818ff : AMDI0030:00 AMDI0030:00
> > fedc0000-fedc0fff : pnp 00:04
> > fedc4000-fedc9fff : Reserved
> >   fedc5000-fedc5fff : AMDI0010:03
> >     fedc5000-fedc5fff : AMDI0010:03 AMDI0010:03
> > fedcc000-fedcefff : Reserved
> > fedd5000-fedd5fff : Reserved
> > fee00000-fee00fff : pnp 00:04
> > ff000000-ffffffff : pnp 00:04
> > 100000000-fee2fffff : System RAM
> >   825600000-8261fa1b1 : Kernel code
> >   826200000-82663dfff : Kernel rodata
> >   826800000-82692ef3f : Kernel data
> >   826eaf000-826ffffff : Kernel bss
>
> > fee300000-100fffffff : Reserved
>
> First it says that this range is reserved.
>
> > 1010000000-ffffffffff : PCI Bus 0000:00
>
> And this range here used for the PCI Bus.
>
> >   fc00000000-fe0fffffff : PCI Bus 0000:01
> >     fc00000000-fe0fffffff : PCI Bus 0000:02
> >       fc00000000-fe0fffffff : PCI Bus 0000:03
> >         fc00000000-fdffffffff : 0000:03:00.0 This is the usual BAR rep=
orted by dmesg (and lspci -vv)
> >         fe00000000-fe0fffffff : 0000:03:00.0
>
> And then it says that the PCIe devices are inside the reserved range.
>
> >   fe20000000-fe301fffff : PCI Bus 0000:08
> >     fe20000000-fe2fffffff : 0000:08:00.0
> >     fe30000000-fe301fffff : 0000:08:00.0
> >   fe30300000-fe304fffff : PCI Bus 0000:04
> >     fe30300000-fe303fffff : 0000:04:00.0
> >       fe30300000-fe303fffff : 0000:04:00.0
> >     fe30400000-fe30403fff : 0000:04:00.0
> >     fe30404000-fe30404fff : 0000:04:00.0
>
> > afe00000000-affffffffff : 0000:03:00.0 This is the memory which shifts=
 with nokaslr
>
> To be honest that looks like a broken ACPI table to me, but it doesn't e=
xplain why this range here shifts when activating/deactivating nokaslr.
>
> Do we have some option to enable printing when ranges are added to the i=
omem reservation? If yes than we should probably do that and take a look a=
t the dmesg again.
>
> Regards,
> Christian.
>
> >
> > Bert Karwatzki

As Balbir Singh found out this memory comes from amdkfd
(kgd2kfd_init_zone_device()) with CONFIG_HSA_AMD_SVM=3Dy. The memory gets =
placed
by devm_request_free_mem_region() which places the memory at the end of th=
e
physical address space (DIRECT_MAP_PHYSMEM_END). DIRECT_MAP_PHYSMEM_END ch=
anges
when using nokaslr and so the memory shifts.
 One can work around this by removing the GFR_DESCENDING flag from
devm_request_free_mem_region() so the memory gets placed right after the o=
ther
resources:

tail -n 15 /proc/iomem
1010000000-ffffffffff : PCI Bus 0000:00
  fc00000000-fe0fffffff : PCI Bus 0000:01
    fc00000000-fe0fffffff : PCI Bus 0000:02
      fc00000000-fe0fffffff : PCI Bus 0000:03
        fc00000000-fdffffffff : 0000:03:00.0
        fe00000000-fe0fffffff : 0000:03:00.0
  fe20000000-fe301fffff : PCI Bus 0000:08
    fe20000000-fe2fffffff : 0000:08:00.0
    fe30000000-fe301fffff : 0000:08:00.0
  fe30300000-fe304fffff : PCI Bus 0000:04
    fe30300000-fe303fffff : 0000:04:00.0
      fe30300000-fe303fffff : 0000:04:00.0
    fe30400000-fe30403fff : 0000:04:00.0
    fe30404000-fe30404fff : 0000:04:00.0
10000000000-101ffffffff : 0000:03:00.0

Bert Karwatzki
