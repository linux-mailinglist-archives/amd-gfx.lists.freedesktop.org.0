Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B26A98BC6C
	for <lists+amd-gfx@lfdr.de>; Tue,  1 Oct 2024 14:43:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85D0110E317;
	Tue,  1 Oct 2024 12:43:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="c8W37A3o";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05A8B10E0A6
 for <amd-gfx@lists.freedesktop.org>; Tue,  1 Oct 2024 12:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1727786585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KZZwkLCrIjRhjwyetK5HgYU6fwijbH3MWN7r4wKk24Q=;
 b=c8W37A3oELmjdnn8OUaqG1AX4h6GoQOK/reyc8TrEmwFBjWVpP1FAmIh+Go7tSbZCWyNVh
 BrC38mpytBAHyOVdIQnQYteqenmvFEdf/luQjhspSJIMvzCA2RzEQMwI2UwO0Uyt3QgJD4
 u8Rt7gweWA+uDOhA1df+v7YkcB0TCAw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-286-UlYHG33UMsaT4ICg2encFQ-1; Tue, 01 Oct 2024 08:43:04 -0400
X-MC-Unique: UlYHG33UMsaT4ICg2encFQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-42cb471a230so41821585e9.3
 for <amd-gfx@lists.freedesktop.org>; Tue, 01 Oct 2024 05:43:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727786583; x=1728391383;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KZZwkLCrIjRhjwyetK5HgYU6fwijbH3MWN7r4wKk24Q=;
 b=hpKPZCPkyLIMV/FhOvfsUom7PPX0Flz+Lqdq4rR0xaIm1z8ENn61Ryr4fqJdfD3DxL
 aW1PovwUYBv7E+RcZUWHSiYYjw3Y/uYQttd9FNUZKAezRq3JGMd42d64o+5vAY5U7bUb
 dQAgPpH1royP85di6tIrG7kXE9M4Kk6bnDPfPFu9JpIMTmlQcz6QzX0qYL3G7u1z50t+
 v19nP9bjImSjvDZnIiGa4n07O0SnTwJweFEYRtqIrSsSx4/Xk10HMbBf6TCZzb7UN2KF
 CWJOZDrtHQjX5VDXwVBJdlTgFiBy7r1taxEtXmTQ+okK3p9NzuPgUihlhCGq5LBb9rZ/
 novw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMLev/2oDYmkdLgEdkD9Y/m5YIUAVdsKvYShdsUGbuywdKJnQUwI/KdFMEKf7Seax1QiaEdnlx@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzZAKJhEcmkMFk1zuqTc9qAomu3j8/SVsLUqZXaquI6CsIYUxDi
 7ZxLJbJ2Y1An6Cm3/jycw92mG+Rbt028SQnkWpnoiZSRSShNFr2D70tnJTffJu+YvvI0Hb3LT/u
 FXQYkH7XNK3IGLGviMKiFzMfDmCJBJ72dDhYO775x+y1vWgzgxrZ4tmM0/dV8J60=
X-Received: by 2002:a05:600c:1d25:b0:426:5416:67e0 with SMTP id
 5b1f17b1804b1-42f584a20f0mr124885965e9.31.1727786583153; 
 Tue, 01 Oct 2024 05:43:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHogCrKXi/LLAK0Yw/SyE+LUwqB53YlzciFZKHfFpK4j+UOGuKZEYk3OW+MVNbB7x8klnkLJg==
X-Received: by 2002:a05:600c:1d25:b0:426:5416:67e0 with SMTP id
 5b1f17b1804b1-42f584a20f0mr124885715e9.31.1727786582790; 
 Tue, 01 Oct 2024 05:43:02 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42e96a36292sm179550505e9.32.2024.10.01.05.43.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Oct 2024 05:43:02 -0700 (PDT)
Message-ID: <9f86a94a-02da-496d-81cd-5a2306520c6d@redhat.com>
Date: Tue, 1 Oct 2024 14:43:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/amdgpu: add dce6 drm_panic support
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Lu Yao <yaolu@kylinos.cn>, ckoenig.leichtzumerken@gmail.com,
 daniel@ffwll.ch, Xinhui.Pan@amd.com, airlied@gmail.com,
 alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, srinivasan.shanmugam@amd.com,
 sunil.khatri@amd.com
References: <20240802071752.116541-1-yaolu@kylinos.cn>
 <20240812060914.102614-1-yaolu@kylinos.cn>
 <CADnq5_OcUgV9dgAynDCQnm9NS+QCvhBiHvxWnhWqi2qqhh=zXg@mail.gmail.com>
 <16352ae0-7e61-440d-8c04-7ec912f9bf9a@redhat.com>
 <CADnq5_O7njHcvu0ejvVPPKF7szsbEQ8oFfHr9GTyD+zAe2EJ8g@mail.gmail.com>
 <8a1afe12-4d59-4cbd-aede-fce22f8fb979@redhat.com>
In-Reply-To: <8a1afe12-4d59-4cbd-aede-fce22f8fb979@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 25/09/2024 10:33, Jocelyn Falempe wrote:
> On 24/09/2024 16:02, Alex Deucher wrote:
>> On Fri, Sep 20, 2024 at 11:36 AM Jocelyn Falempe <jfalempe@redhat.com> 
>> wrote:
>>>
>>> On 17/09/2024 15:21, Alex Deucher wrote:
>>>> On Mon, Aug 12, 2024 at 2:10 AM Lu Yao <yaolu@kylinos.cn> wrote:
>>>>>
>>>>> Add support for the drm_panic module, which displays a pretty user
>>>>> friendly message on the screen when a Linux kernel panic occurs.
>>>>>
>>>>> Signed-off-by: Lu Yao <yaolu@kylinos.cn>
>>>>
>>>> Patch looks good to me.  Any chance you want to convert the other
>>>> non-DC dce files (dce_v8_0.c, dce_v10_0.c, dce_v11_0.c) while you are
>>>> at it?
>>>
>>> I've made a similar patch in amdgpu_dm_plane.c, and it works on a Radeon
>>> pro w6400.
>>> But it only works when I'm in a VT terminal (so the framebuffer is
>>> linear and CPU accessible).
>>> When under Gnome/Wayland, the flag AMDGPU_GEM_CREATE_NO_CPU_ACCESS is
>>> set, so that means I can't vmap it ?
>>
>> It just means that the application does not need CPU access.  Whether
>> or not the CPU can access the buffer or not depends on the size of the
>> PCI BAR.  E.g., if the driver or bios has resized the PCI BAR, then
>> the CPU can access the entire BAR, but if not you are generally
>> limited to the first 256M of framebuffer.
> 
> I tried to use ttm_bo_kmap() anyway, it returns a valid virtual address, 
> but writing to it has no effect on the display.
>>
>>>
>>> Also I don't know if there is a similar way to disable
>>> tiling/compression on this hardware.
>>
>> UNP_GRPH_CONTROL on chips with DCE display hardware and
>> DCSURF_ADDR_CONFIG and DCSURF_TILING_CONFIG on DCN display hardware.

I've now a working Prototype on a Radeon pro W6400.

Here is what I do to disable tiling:

REG_UPDATE(DCHUBP_REQ_SIZE_CONFIG, SWATH_HEIGHT, 0);
REG_UPDATE(DCSURF_TILING_CONFIG, SW_MODE, DC_SW_LINEAR);

REG_UPDATE_6(DCSURF_SURFACE_CONTROL,
		PRIMARY_SURFACE_DCC_EN, 0,
		PRIMARY_SURFACE_DCC_IND_BLK, 0,
		PRIMARY_SURFACE_DCC_IND_BLK_C, 0,
		SECONDARY_SURFACE_DCC_EN, 0,
		SECONDARY_SURFACE_DCC_IND_BLK, 0,
		SECONDARY_SURFACE_DCC_IND_BLK_C, 0);

I also need to call this, to refresh the display:

hubp->funcs->hubp_program_surface_flip_and_addr(hubp, 
&dc_plane_state->address, dc_plane_state->flip_immediate);

And I use a modified version of amdgpu_ttm_access_memory() to write to 
the framebuffer.

I will send a patch when I've time to make a clean version.

Best regards,

-- 

Jocelyn

