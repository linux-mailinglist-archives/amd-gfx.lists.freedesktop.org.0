Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B574BBC0E
	for <lists+amd-gfx@lfdr.de>; Fri, 18 Feb 2022 16:25:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E45710F11E;
	Fri, 18 Feb 2022 15:25:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1152C10E2A4
 for <amd-gfx@lists.freedesktop.org>; Fri, 18 Feb 2022 11:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645185281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZU73Lo7l6hbSvjkFhO1EujONMpX8Sskgkmm1GL0ixLg=;
 b=UDlHwW55KWkEhNCOV8g/QQ6ozSbCIjz5SBeHVw8qZYLxnkHowGUvF8YWcVIJTvirsdqr+L
 LfehSL3djJPsSoBnwcUkXpHlR/1AQLaWlEUsg2irrIGvQD/hjqbSiYnKGQdnj1JZhgImT6
 p3U7fGNXGt3Pn4T7IF/X+bI6WZd6OI4=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-370-uuaV8YUHMQKe0j7Ip5VjJQ-1; Fri, 18 Feb 2022 06:54:40 -0500
X-MC-Unique: uuaV8YUHMQKe0j7Ip5VjJQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 nb1-20020a1709071c8100b006d03c250b6fso2835018ejc.11
 for <amd-gfx@lists.freedesktop.org>; Fri, 18 Feb 2022 03:54:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZU73Lo7l6hbSvjkFhO1EujONMpX8Sskgkmm1GL0ixLg=;
 b=u1HtVG3hfb4jpfwzK9d4607Dmx65t1QOXZirIfnMp0md1GDyZleliHFNlIvbNAPQHr
 tMp5kx9m9RgVcfcExldSs9PvIx2MwshvK9GMTCRlbquSkBYGAT7dpYgt9tiqxXHt/psH
 FomQ1qQ2Tdc/KJsSekRsLIOuRl6WasPxm0i/ZUIQZLBd8qFaQhHNQjXr81H2rNR1XUJQ
 ZeymibOy+kC1eJWJoQuJItz1V6e7XYYE1H+EjVBP7nVjY8JbHo6jYg1Xe1gQqHbulkdT
 FzOw31RyEtk74KAYSmr8KXUXDIgfTNSwq7BgUSZloKa3oNRX/jW6J5uTQq1He+C4Kswx
 GFWA==
X-Gm-Message-State: AOAM531lK2BI1ME0tMW261AyrW3qrJ1xqGZYKQhtdsaotdH3RNLx+B63
 neNSIwmqRQHm6ScghbG7UP7c8pozGyDDTyAIIOotyWq9Iir5IFYcuNJVkFa3+YV6i+rGNbA5XKP
 rGO7KP5OuDEkBfBq29WaS+2PL9Q==
X-Received: by 2002:a50:9d89:0:b0:410:ff04:5a98 with SMTP id
 w9-20020a509d89000000b00410ff045a98mr7904642ede.404.1645185278738; 
 Fri, 18 Feb 2022 03:54:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyKC5xUwcjHlFIGoyRJN0JH+XVQBj7pZ69Bxv7eGGxHiHW08opExAMFa04qBDUF8/KvyA07hw==
X-Received: by 2002:a50:9d89:0:b0:410:ff04:5a98 with SMTP id
 w9-20020a509d89000000b00410ff045a98mr7904604ede.404.1645185278370; 
 Fri, 18 Feb 2022 03:54:38 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1?
 (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
 by smtp.gmail.com with ESMTPSA id s15sm2197882ejj.84.2022.02.18.03.54.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Feb 2022 03:54:37 -0800 (PST)
Message-ID: <d4f5e101-3dd5-2f3a-6c14-6b32ee37c223@redhat.com>
Date: Fri, 18 Feb 2022 12:54:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [Intel-gfx] [PATCH v8 1/3] gpu: drm: separate panel orientation
 property creating and value setting
To: Simon Ser <contact@emersion.fr>
References: <20220208084234.1684930-1-hsinyi@chromium.org>
 <CACvgo53u01BK_D0ZssV+gCepjxSz23Nr5Dy1qXeaAoJuu6VCFQ@mail.gmail.com>
 <KW6DNh6IRRgVJx9DfOFBnEqc4a0x-AnDXEbMxwpfEbk8dOn_KGVzAfo-slJWq-4nWW728Uc-OVpFh2w4fDE4-bxfkDuz1hFILRVvbcuXqaw=@emersion.fr>
 <CACvgo532-pC+7DLFCo=DWTX-OnJEJvSoTmQnt3_qLhiT4cqEMg@mail.gmail.com>
 <GYG6EVT1MqtmfKiPpMhDG9mpuATnmwVDq2PuE_dpDat5oQW_t1tUfm39lSWHj32D5r7mrog27sL4dkgdMYQ5BN830TfVOrgQ4Ts8LcO8Hcs=@emersion.fr>
 <CACvgo52+o9_ETC+1RKzqKkyw3ZJ28RjH0BqC9DfmNAKqByud8Q@mail.gmail.com>
 <d3f0cc20-d226-ee42-cc98-b469949cec9e@redhat.com>
 <YV87l-2XXzmZ2i6GuGd__uf85s2JQkbXt_qTQDYlbBh1kW2COJoNLUDinmLCokKyy-_0ZnIMUcZeW0GdJ8zF690iYi4ThKrjc09omNMe-0g=@emersion.fr>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YV87l-2XXzmZ2i6GuGd__uf85s2JQkbXt_qTQDYlbBh1kW2COJoNLUDinmLCokKyy-_0ZnIMUcZeW0GdJ8zF690iYi4ThKrjc09omNMe-0g=@emersion.fr>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 18 Feb 2022 15:25:33 +0000
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Alex Deucher <alexander.deucher@amd.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Harry Wentland <harry.wentland@amd.com>,
 LAKML <linux-arm-kernel@lists.infradead.org>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Hi,

On 2/18/22 12:39, Simon Ser wrote:
> On Friday, February 18th, 2022 at 11:38, Hans de Goede <hdegoede@redhat.com> wrote:
> 
>> What I'm reading in the above is that it is being considered to allow
>> changing the panel-orientation value after the connector has been made
>> available to userspace; and let userspace know about this through a uevent.
>>
>> I believe that this is a bad idea, it is important to keep in mind here
>> what userspace (e.g. plymouth) uses this prorty for. This property is
>> used to rotate the image being rendered / shown on the framebuffer to
>> adjust for the panel orientation.
>>
>> So now lets assume we apply the correct upside-down orientation later
>> on a device with an upside-down mounted LCD panel. Then on boot the
>> following could happen:
>>
>> 1. amdgpu exports a connector for the LCD panel to userspace without
>> setting panel-orient=upside-down
>> 2. plymouth sees this and renders its splash normally, but since the
>> panel is upside-down it will now actually show upside-down
> 
> At this point amdgpu hasn't probed the connector yet. So the connector
> will be marked as disconnected, and plymouth shouldn't render anything.

If before the initial probe of the connector there is a /dev/dri/card0 
which plymouth can access, then plymouth may at this point decide
to disable any seemingly unused crtcs, which will make the screen go black...

I'm not sure if plymouth will actually do this, but AFAICT this would
not be invalid behavior for a userspace kms consumer to do and I
believe it is likely that mutter will disable unused crtcs.

IMHO it is just a bad idea to register /dev/dri/card0 with userspace
before the initial connector probe is done. Nothing good can come
of that.

If all the exposed connectors initially are going to show up as
disconnected anyways what is the value in registering /dev/dri/card0
with userspace early ?

>> 3. amdgpu adjusts the panel-orient prop to upside-down, sends out
>> uevents
> 
> That's when amdgpu marks the connector as connected. So everything
> should be fine I believe, no bad frame.

See above.

>> 4. Lets assume plymouth handles this well (i) and now adjust its
>> rendering and renders the next frame of the bootsplash 180° rotated
>> to compensate for the panel being upside down. Then from now on
>> the user will see the splash normally
>>
>> So this means that the user will briefly see the bootsplash rendered
>> upside down which IMHO is not acceptable behavior. Also see my footnote
>> about how I seriously doubt plymouth will see the panel-orient change
>> at all.
>>
>> I'm also a bit unsure about:
>>
>> a) How you can register the panel connector with userspace before
>> reading the edid, don't you need the edid to give the physical size +
>> modeline to userspace, which you cannot just leave out ?
> 
> Yup. The KMS EDID property is created before the EDID is read, and is set
> to zero (NULL blob). The width/height in mm and other info are also zero.
> You can try inspecting the state printed by drm_info on any disconnected
> connector to see for yourself.

Right, I missed the detail hat the connector is initially marked as
disconnected. That solves the issue of invalid panel-orient / mode /
dpi info, bit it opens up other problems.

>> I guess the initial modeline is inherited from the video-bios, but
>> what about the physical size? Note that you cannot just change the
>> physical size later either, that gets used to determine the hidpi
>> scaling factor in the bootsplash, and changing that after the initial
>> bootsplash dislay will also look ugly
>>
>> b) Why you need the edid for the panel-orientation property at all,
>> typically the edid prom is part of the panel and the panel does not
>> know that it is mounted e.g. upside down at all, that is a property
>> of the system as a whole not of the panel as a standalone unit so
>> in my experience getting panel-orient info is something which comes
>> from the firmware /video-bios not from edid ?
> 
> This is an internal DRM thing. The orientation quirks logic uses the
> mode size advertised by the EDID.

The DMI based quirking does, yes. But e.g. the quirk code directly
reading this from the Intel VBT does not rely on the mode.

But if you are planning on using a DMI based quirk for the steamdeck
then yes that needs the mode.

Thee mode check is there for 2 reasons:

1. To avoid also applying the quirk to external displays, but
I think that that is also solved in most drivers by only checking for
a quirk at all on the eDP connector

2. Some laptop models ship with different panels in different badges
some of these are portrait (so need a panel-orient) setting and others
are landscape.

> I agree that at least in the Steam
> Deck case it may not make a lot of sense to use any info from the
> EDID, but that's needed for the current status quo.

We could extend the DMI quirk mechanism to allow quirks which don't
do the mode check, for use on devices where we can guarantee neither
1 nor 2 happens, then amdgpu could call the quirk code early simply
passing 0x0 as resolution.

> Also note, DisplayID has a bit to indicate the panel orientation IIRC.
> Would be nice to support parsing this at some point.

Ack.

Regards,

Hans

