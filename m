Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E04559F467
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Aug 2022 09:32:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30F3B11254F;
	Wed, 24 Aug 2022 07:32:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 2277 seconds by postgrey-1.36 at gabe;
 Tue, 23 Aug 2022 16:39:50 UTC
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [IPv6:2a01:488:42:1000:50ed:8234::])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6AE010EAFF
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Aug 2022 16:39:50 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1oQWLf-0008R5-2q; Tue, 23 Aug 2022 18:01:51 +0200
Message-ID: <401cf9aa-3d6d-d038-e3d4-76f7a8a8c57d@leemhuis.info>
Date: Tue, 23 Aug 2022 18:01:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.0
Subject: Re: [Bug 216373] New: Uncorrected errors reported for AMD GPU
 #forregzbot
Content-Language: en-US
References: <20220818203812.GA2381243@bhelgaas>
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: regressions@lists.linux.dev
In-Reply-To: <20220818203812.GA2381243@bhelgaas>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1661272790;
 f5ed6bd0; 
X-HE-SMSGID: 1oQWLf-0008R5-2q
X-Mailman-Approved-At: Wed, 24 Aug 2022 07:32:23 +0000
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
Cc: linux-pci@vger.kernel.org, amd-gfx@lists.freedesktop.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

TWIMC: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. These mails usually
contain '#forregzbot' in the subject, to make them easy to spot and filter.

[TLDR: I'm adding this regression report to the list of tracked
regressions; all text from me you find below is based on a few templates
paragraphs you might have encountered already already in similar form.]

Hi, this is your Linux kernel regression tracker.

On 18.08.22 22:38, Bjorn Helgaas wrote:
> [Adding amdgpu folks]
> 
> On Wed, Aug 17, 2022 at 11:45:15PM +0000, bugzilla-daemon@kernel.org wrote:
>> https://bugzilla.kernel.org/show_bug.cgi?id=216373
>>
>>             Bug ID: 216373
>>            Summary: Uncorrected errors reported for AMD GPU
>>     Kernel Version: v6.0-rc1
>>         Regression: No
>> ...
> 
> I marked this as a regression in bugzilla.
> 
>> Hardware:
>> CPU: Intel i7-12700K (Alder Lake)
>> GPU: AMD RX 6700 XT [1002:73df]
>> Motherboard: ASUS Prime Z690-A
>>
>> Problem:
>> After upgrading to v6.0-rc1 the kernel is now reporting uncorrected PCI errors
>> for my GPU.
> 
> Thank you very much for the report and for taking the trouble to
> bisect it and test Kai-Heng's patch!
> 
> I suspect that booting with "pci=noaer" should be a temporary
> workaround for this issue.  If it, can you add that to the bugzilla
> for anybody else who trips over this?
> 
>> I have bisected this issue to: [8795e182b02dc87e343c79e73af6b8b7f9c5e635]
>> PCI/portdrv: Don't disable AER reporting in get_port_device_capability()
>> Reverting that commit causes the errors to cease.
> 
> I suspect the errors still occur, but we just don't notice and log
> them.
> 
>> I have also tried Kai-Heng Feng's patch[1] which seems to resolve a similar
>> problem, but it did not fix my issue.
>>
>> [1]
>> https://lore.kernel.org/linux-pci/20220706123244.18056-1-kai.heng.feng@canonical.com/
>>
>> dmesg snippet:
>>
>> pcieport 0000:00:01.0: AER: Multiple Uncorrected (Non-Fatal) error received:
>> 0000:03:00.0
>> amdgpu 0000:03:00.0: PCIe Bus Error: severity=Uncorrected (Non-Fatal),
>> type=Transaction Layer, (Requester ID)
>> amdgpu 0000:03:00.0:   device [1002:73df] error status/mask=00100000/00000000
>> amdgpu 0000:03:00.0:    [20] UnsupReq               (First)
>> amdgpu 0000:03:00.0: AER:   TLP Header: 40000001 0000000f 95e7f000 00000000
> 
> I think the TLP header decodes to:
> 
>   0x40000001 = 0100 0000 ... 0000 0001 binary
>   0x0000000f = 0000 0000 ... 0000 1111 binary
> 
>   Fmt           010b                 3 DW header with data
>   Type          0000b  010 0 0000    MWr Memory Write Request
>   Length        00 0000 0001b        1 DW
>   Requester ID  0x0000               00:00.0
>   Tag           0x00
>   Last DW BE    0000b                must be zero for 1 DW write
>   First DW BE   1111b                all 4 bytes in DW enabled
>   Address       0x95e7f000
>   Data          0x00000000
> 
> So I think this is a 32-bit write of zero to PCI bus address
> 0x95e7f000.
> 
> Your dmesg log says:
> 
>   pci 0000:02:00.0: PCI bridge to [bus 03]
>   pci 0000:02:00.0:   bridge window [mem 0x95e00000-0x95ffffff]
>   pci 0000:03:00.0: reg 0x24: [mem 0x95e00000-0x95efffff]
>   [drm] register mmio base: 0x95E00000
> 
> So this looks like a write to the device's BAR 5.  I don't see a PCI
> reason why this should fail.  Maybe there's some amdgpu reason?

I'd like to add to the tracking to ensure it's not forgotten.

#regzbot introduced: v5.19..v6.0-rc1 ^
https://bugzilla.kernel.org/show_bug.cgi?id=216373
#regzbot title: pci or amdgpu: Uncorrected errors reported for AMD GPU

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.
