Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE47651D4B
	for <lists+amd-gfx@lfdr.de>; Tue, 20 Dec 2022 10:25:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A95F410E359;
	Tue, 20 Dec 2022 09:25:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CACB010E356
 for <amd-gfx@lists.freedesktop.org>; Tue, 20 Dec 2022 09:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671528303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hMFhZOuihLodO313fEA5R64i9CUhN9/n0ds4HavllAs=;
 b=gngBIQ7zUBhzzIIqKucjHvclR7o4PWQ3/726DmDRWDGZOM6mk2/YSoILD8ocMM7imtg8G6
 2CnBMyzNXJZHANGz9VzfIyhL8lgXQvWOtZiVLVz9KNl4SCR7WHloqevFWouugcH7bP5CSG
 W/In6c1pl2Eg44MnVu7mZjRSpxeojgQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-314-g7ZAPPf0PfWcXUJthU-Nrw-1; Tue, 20 Dec 2022 04:25:01 -0500
X-MC-Unique: g7ZAPPf0PfWcXUJthU-Nrw-1
Received: by mail-wr1-f72.google.com with SMTP id
 e19-20020adfa453000000b0024209415034so2071742wra.18
 for <amd-gfx@lists.freedesktop.org>; Tue, 20 Dec 2022 01:25:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hMFhZOuihLodO313fEA5R64i9CUhN9/n0ds4HavllAs=;
 b=I72DJU5NtiFTxjFuJEGPbfa0YzuFuKpLv9Qmblxv/MZD5HSTMndd0RpD0wYTjPG0Hv
 xW2Lnpu8OQGIBzDBNrvp4PobM5eKhFcmV0Te/KEHF5U1a7KKj1mlMLhlUgB5J4F9ilZ+
 9RY3pgaY5B7mGljiz0Seas0sYga0UOlQDdXCVd1Nu5lzgShgwQbGOD2puh5jh6RtN1i1
 DJgsDIygBuM/ZzCKFcxAfw7xn8w/cnQ/Lr1gcfUy4K+LQerPx+nceA+kb3N7Ps4Ae1tT
 n/sIfn/PMR4GkVFrO+IpGskEhE9Y+8F9FnobMGe385LEbIi2EBU6sPOPZAjgHsiuNAPe
 BCWw==
X-Gm-Message-State: ANoB5pmnox/iMEnh+RKofkpy32aZ+KL2oLNnMM41UQaADrzmHTajG5+S
 E5sWES0Rc11P4jnBeJgt0dtkR4EKy9hBXv/2C6H+orF6TIHn4es0TytwVBQUAyKqJg7uJq2MpZw
 WEb/ydRkwu9RH6SrkqpbYSSP3lw==
X-Received: by 2002:a05:600c:1d27:b0:3d2:27ba:dde0 with SMTP id
 l39-20020a05600c1d2700b003d227badde0mr25905735wms.33.1671528300461; 
 Tue, 20 Dec 2022 01:25:00 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6s+ju9wPrh/cxmy7d4OakLICIinEdQttdoLSS+PoembSG//ZlaMVN/BK9U8/HRYjVObQWlOA==
X-Received: by 2002:a05:600c:1d27:b0:3d2:27ba:dde0 with SMTP id
 l39-20020a05600c1d2700b003d227badde0mr25905720wms.33.1671528300274; 
 Tue, 20 Dec 2022 01:25:00 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 i27-20020a05600c4b1b00b003d220ef3232sm14440188wmp.34.2022.12.20.01.24.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 01:24:59 -0800 (PST)
Message-ID: <cc578fa7-31f0-8cfa-4cdd-981d7303412e@redhat.com>
Date: Tue, 20 Dec 2022 10:24:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 08/18] fbdev/hyperv-fb: Do not set struct fb_info.apertures
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, deller@gmx.de
References: <20221219160516.23436-1-tzimmermann@suse.de>
 <20221219160516.23436-9-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221219160516.23436-9-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-fbdev@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-hyperv@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On 12/19/22 17:05, Thomas Zimmermann wrote:
> Generic fbdev drivers use the apertures field in struct fb_info to
> control ownership of the framebuffer memory and graphics device. Do
> not set the values in hyperv-fb.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

