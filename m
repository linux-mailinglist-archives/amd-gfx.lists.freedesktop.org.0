Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF762EC4CE
	for <lists+amd-gfx@lfdr.de>; Wed,  6 Jan 2021 21:21:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 283116E233;
	Wed,  6 Jan 2021 20:21:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A75489C19
 for <amd-gfx@lists.freedesktop.org>; Wed,  6 Jan 2021 18:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609956638;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QC0mNMerYXipku1/5188pVRpHGHyjTqis+pQEfPaR4I=;
 b=Q5xEmAJh+keWrbKWMZasnzBIYG4W5//7lQp1n95bngoHogtGcaQ2AnGaLfyiRkMPLfOfUr
 ZTMyT3+qvP7o8FoK1xXIrFlfHKpO7/kJCL9ft252gNZW1qor6VrgQv11jHN5/QXNm+iOJm
 egESfxljNaPh7keYjYdOFmzaZZ8RnL0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-kOXI9YC2PzW9LcbT-FTT_w-1; Wed, 06 Jan 2021 13:10:36 -0500
X-MC-Unique: kOXI9YC2PzW9LcbT-FTT_w-1
Received: by mail-ed1-f70.google.com with SMTP id u17so2213069edi.18
 for <amd-gfx@lists.freedesktop.org>; Wed, 06 Jan 2021 10:10:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QC0mNMerYXipku1/5188pVRpHGHyjTqis+pQEfPaR4I=;
 b=kMWCZrJB7xnkTq6t9mZWfeCRGMJmPvjSScWvO7OFCXSzo5FLZoRngG8+6jkZws8e1p
 My5RnAGkJQ6kmnsYm1yVAnZRt/XsBbcMzzv9hUdsEKdfCe4Ba/9QBfi2UcuV0feJtGFt
 tq3wTxeABx0vATuE5QoRG9XmhrSFJFQTmlgLmDgdMl1Rk45Ey84jiZCdvibHhr3/NM1g
 gSUwyv0/BKmrka9ComFVDSUuS2ICKfNrR5rsYJ5LeCscRT70KpiXuTLKCqMK80qFVjbs
 +3OiA/dvWDr2nzqHL/A1IXgzAL5kpCWdW/JXqko8KNvmKubiVTlT/3ccIqaK+NKeXUUC
 5WnQ==
X-Gm-Message-State: AOAM531yXTn1tLS/e+I3NxmhzYdIG1/4ftc7xa6lb2wUZRCyQzHnBpJb
 Z2LUKGJba0kt1QLi81aWkTfXVIiRxthspv4BEUPVjDpgI8IrwLtU/QjleeDrjrjhUdEejXmbnpP
 on/ifV+hhhrpTvv2nA4e5eHh/3A==
X-Received: by 2002:a17:906:6693:: with SMTP id
 z19mr3599207ejo.376.1609956635017; 
 Wed, 06 Jan 2021 10:10:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzMe7h7yf1aLz93FCBRG3pJGCFGBZlQ538sdE8RQoyUGhFyBnWHSvu5igAM8ejnPrNVoUkQQQ==
X-Received: by 2002:a17:906:6693:: with SMTP id
 z19mr3599198ejo.376.1609956634814; 
 Wed, 06 Jan 2021 10:10:34 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
 by smtp.gmail.com with ESMTPSA id h23sm1563977ejg.37.2021.01.06.10.10.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jan 2021 10:10:34 -0800 (PST)
Subject: Re: radeon kernel driver not suppressing ACPI_VIDEO_NOTIFY_PROBE
 events when it should
To: Alex Deucher <alexdeucher@gmail.com>
References: <ed5b59f0-cfbf-57e8-2cdf-2d0e2c0c45bf@redhat.com>
 <CADnq5_NSBBP+c+7aGpBkUSx6h4_7zz8o-yUW3ffW0Jn2GFD1AQ@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <c11f3b78-a100-4657-7c07-1c3894296a5d@redhat.com>
Date: Wed, 6 Jan 2021 19:10:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CADnq5_NSBBP+c+7aGpBkUSx6h4_7zz8o-yUW3ffW0Jn2GFD1AQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-Mailman-Approved-At: Wed, 06 Jan 2021 20:21:52 +0000
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
Cc: =?UTF-8?Q?Michel_D=c3=a4nzer?= <mdaenzer@redhat.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Hi,

On 1/6/21 6:07 PM, Alex Deucher wrote:
> On Wed, Jan 6, 2021 at 11:25 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi All,
>>
>> I get Cc-ed on all Fedora kernel bugs and this one stood out to me:
>>
>> https://bugzilla.redhat.com/show_bug.cgi?id=1911763
>>
>> Since I've done a lot of work on the acpi-video code I thought I should
>> take a look. I've managed to help the user with a kernel-commandline
>> option which stops video.ko (the acpi-video kernel module) from emitting
>> key-press events for ACPI_VIDEO_NOTIFY_PROBE events.
>>
>> This is on a Dell Vostro laptop with i915/radeon hybrid gfx.
>>
>> I was thinking about adding a DMI quirk for this, but from the brief time
>> that I worked on nouveau (and specifically hybrid gfx setups) I know that
>> these events get fired on hybrid gfx setups when the discrete GPU is
>> powered down and something happens which requires the discrete GPUs drivers
>> attention, like an external monitor being plugged into a connector handled
>> by the dGPU (note that is not the case here).
>>
>> So I took a quick look at the radeon code and the radeon_atif_handler()
>> function from drivers/gpu/drm/radeon/radeon_acpi.c. When successful that
>> returns NOTIFY_BAD which suppresses the key-press.
>>
>> But in various cases it returns NOTIFY_DONE instead which does not
>> suppress the key-press event. So I think that the spurious key-press events
>> which the user is seeing should be avoided by this function returning
>> NOTIFY_BAD.
>>
>> Specifically I'm wondering if we should not return
>> NOTIFY_BAD when count == 0?   I guess this can cause problems if there
>> are multiple GPUs, but we could check if the acpi-event is for the
>> pci-device the radeon driver is bound to. This would require changing the
>> acpi-notify code to also pass the acpi_device pointer as part of the
>> acpi_bus_event but that should not be a problem.
>>
> 
> For A+A PX/HG systems, we'd want the notifications for both the dGPU
> and the APU since some of the events are relevant to one or the other.
> ATIF_DGPU_DISPLAY_EVENT is only relevant to the dGPU, while
> ATIF_PANEL_BRIGHTNESS_CHANGE_REQUEST would be possibly relevant to
> both (if there was a mux), but mainly the APU.
> ATIF_SYSTEM_POWER_SOURCE_CHANGE_REQUEST would be relevant to both.
> The other events have extended bits to determine which GPU the event
> is targeted at.

Right, but AFAIK on hybrid systems there are 2 ACPI video-bus devices,
one for each of the iGPU and dGPU which is why I suggested passing 
the video-bus acpi_device as extra data in acpi_bus_event and then
radeon_atif_handler() could check if the acpi_device is the companion
device of the GPU. This assumes that events for GPU# will also
originate from (through an ACPI ASL notify call) the ACPI video-bus
which belongs to that GPU.

This all assumes though that the problem is that radeon_atif_handler() 
does not return NOTIFY_BAD when the event count being 0 (in other words
a spurious event). It is also possibly that one of the earlier checks in
radeon_atif_handler() is failing...

I guess that a first step in debugging this would be to ask the reporter
to run a kernel with some debugging printk-s added to radeon_atif_handler(),
to see which code-path in radeon_atif_handler we end up in
(assuming that radeon_atif_handler() gets called at all).

Any suggestions for other debugging printk-s, before I prepare a Fedora
kernel for the reporter to test?

Regards,

Hans

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
