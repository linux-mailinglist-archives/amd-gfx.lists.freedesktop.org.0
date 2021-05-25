Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8941C390A5D
	for <lists+amd-gfx@lfdr.de>; Tue, 25 May 2021 22:13:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7258A895E2;
	Tue, 25 May 2021 20:13:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 05A08895E2
 for <amd-gfx@lists.freedesktop.org>; Tue, 25 May 2021 20:09:36 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F08631516;
 Tue, 25 May 2021 13:09:34 -0700 (PDT)
Received: from [10.57.73.64] (unknown [10.57.73.64])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EB6A43F73B;
 Tue, 25 May 2021 13:09:33 -0700 (PDT)
Subject: Re: radeon ring 0 test failed on arm64
To: Alex Deucher <alexdeucher@gmail.com>, Peter Geis <pgwipeout@gmail.com>
References: <CAMdYzYptw9L=5SECtVkNZruTT-x57+03vj0A+5efvq8cESzLyQ@mail.gmail.com>
 <CADnq5_NXmRr_Q7JuWZxJAjmavVkvJjNcWayQ1x8LhfcX5CS0uA@mail.gmail.com>
 <CAMdYzYoamh-igvBbKaLSJ6bSc3wA29=8mooJDLMJkj9YQ=wj0A@mail.gmail.com>
 <CADnq5_NXFZPA_z6413FDgr8WRObhCB+HdkHE5P=PAAMV4FiWiA@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <20dffd4d-fa54-5bc3-c13b-f8ffbf0fb593@arm.com>
Date: Tue, 25 May 2021 21:09:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CADnq5_NXFZPA_z6413FDgr8WRObhCB+HdkHE5P=PAAMV4FiWiA@mail.gmail.com>
Content-Language: en-GB
X-Mailman-Approved-At: Tue, 25 May 2021 20:13:01 +0000
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
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On 2021-05-25 14:05, Alex Deucher wrote:
> On Tue, May 25, 2021 at 8:56 AM Peter Geis <pgwipeout@gmail.com> wrote:
>>
>> On Tue, May 25, 2021 at 8:47 AM Alex Deucher <alexdeucher@gmail.com> wrote:
>>>
>>> On Tue, May 25, 2021 at 8:42 AM Peter Geis <pgwipeout@gmail.com> wrote:
>>>>
>>>> Good Evening,
>>>>
>>>> I am stress testing the pcie controller on the rk3566-quartz64 prototype SBC.
>>>> This device has 1GB available at <0x3 0x00000000> for the PCIe
>>>> controller, which makes a dGPU theoretically possible.
>>>> While attempting to light off a HD7570 card I manage to get a modeset
>>>> console, but ring0 test fails and disables acceleration.
>>>>
>>>> Note, we do not have UEFI, so all PCIe setup is from the Linux kernel.
>>>> Any insight you can provide would be much appreciated.
>>>
>>> Does your platform support PCIe cache coherency with the CPU?  I.e.,
>>> does the CPU allow cache snoops from PCIe devices?  That is required
>>> for the driver to operate.
>>
>> Ah, most likely not.
>> This issue has come up already as the GIC isn't permitted to snoop on
>> the CPUs, so I doubt the PCIe controller can either.
>>
>> Is there no way to work around this or is it dead in the water?
> 
> It's required by the pcie spec.  You could potentially work around it
> if you can allocate uncached memory for DMA, but I don't think that is
> possible currently.  Ideally we'd figure out some way to detect if a
> particular platform supports cache snooping or not as well.

There's device_get_dma_attr(), although I don't think it will work 
currently for PCI devices without an OF or ACPI node - we could perhaps 
do with a PCI-specific wrapper which can walk up and defer to the host 
bridge's firmware description as necessary.

The common DMA ops *do* correctly keep track of per-device coherency 
internally, but drivers aren't supposed to be poking at that information 
directly.

Robin.
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
