Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4061467AE98
	for <lists+amd-gfx@lfdr.de>; Wed, 25 Jan 2023 10:44:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C65010E756;
	Wed, 25 Jan 2023 09:44:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D6EC10E0DB
 for <amd-gfx@lists.freedesktop.org>; Wed, 25 Jan 2023 09:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674639864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tz7iyPImvcUWB9Dn0OtZ/fnzXULpckXnCuNXHm7FVL4=;
 b=W6L4MNXunlfZWKbIEmjtPHu+mXm70oL8pIlpjzWSfRVzhwYIQNI9Cp1NHsUk2Red2C1fN2
 Pfeq2RPJ+3dxo8zgGuwYMMg5XGI4TLiumer81mgcbDjDPkTRqWdxkcVHkvSJ4g8jZANZhm
 8FDrC5TCW/h6fJNdpZyWGuCycdrWhTg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-94-dAnojg-IOt2YDk0ASJg_PA-1; Wed, 25 Jan 2023 04:44:22 -0500
X-MC-Unique: dAnojg-IOt2YDk0ASJg_PA-1
Received: by mail-wr1-f69.google.com with SMTP id
 e29-20020adf9bdd000000b002bb0d0ea681so3087251wrc.20
 for <amd-gfx@lists.freedesktop.org>; Wed, 25 Jan 2023 01:44:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tz7iyPImvcUWB9Dn0OtZ/fnzXULpckXnCuNXHm7FVL4=;
 b=Bf12NZuS3uJ/qo8vd2bgq/R7rQbAo10xLE2k4tNxxAG0mcUHuJrz+kPwuUVYKjUVtr
 4V8P16yFHkpbKO/+iWasyAogTj6QKUeDmh4LAVA0+2npPwJmgFpBKtRBVZFOZRur9Uc0
 GDEQyvIgq4VFeNVpKs94Gt5zqtWrCGR8Q0EtdYJrV8MjqELbyA6bEz9XG6G9ySSMyrRw
 CgpjzFQ8X2OGa6qNDzQHDPK3mMp5GooR9qmvLl5NBjW4uPiIygoHNIexlyooU3B6qy1c
 hc9HMYKC3vMT1KGVNO/wgvIoKx08i4Afc23K3Q8XAidHdMjPERIxAF4hlWLzzLMLkfsd
 NxEA==
X-Gm-Message-State: AFqh2kruqbUoBYNMd0ZjhMYX8NNdKRRuSeNPbfQ9rCrb1dR9ro3FkEMs
 7kKkQZ0rx46Enn5tOwZltYAVveCGuoyiyJfl9TtIvpTkGWJbC8LRGmb1gqYlcV/NPfIsVDKS5o/
 0RFkzDXxZ3m+7A7C0LPwDJ/dJHw==
X-Received: by 2002:a1c:4b19:0:b0:3da:fb5c:8754 with SMTP id
 y25-20020a1c4b19000000b003dafb5c8754mr28002618wma.2.1674639860818; 
 Wed, 25 Jan 2023 01:44:20 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs/ZWxYog8h3iR/G4m+bOHxbXPWtvCX/ZVFIUBahKB+Crw5vqS3Y5d/LkCiQwFYvGuCaEiL4A==
X-Received: by 2002:a1c:4b19:0:b0:3da:fb5c:8754 with SMTP id
 y25-20020a1c4b19000000b003dafb5c8754mr28002601wma.2.1674639860545; 
 Wed, 25 Jan 2023 01:44:20 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 h9-20020a05600c314900b003c6f8d30e40sm1345518wmo.31.2023.01.25.01.44.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jan 2023 01:44:20 -0800 (PST)
Message-ID: <13f04dbd-07f2-f01a-7d67-75a554374ddf@redhat.com>
Date: Wed, 25 Jan 2023 10:44:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 07/10] drm/fbdev-generic: Minimize hotplug error
 handling
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org
References: <20230124134010.30263-1-tzimmermann@suse.de>
 <20230124134010.30263-8-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20230124134010.30263-8-tzimmermann@suse.de>
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
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On 1/24/23 14:40, Thomas Zimmermann wrote:
> Call drm_fb_helper_init() in the generic-fbdev hotplug helper

drm_fb_helper_fini()

> to revert the effects of drm_fb_helper_init(). No full cleanup
> is required.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

