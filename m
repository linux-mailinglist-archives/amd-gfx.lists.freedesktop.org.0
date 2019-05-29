Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E3E2E73A
	for <lists+amd-gfx@lfdr.de>; Wed, 29 May 2019 23:15:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4018E89FF7;
	Wed, 29 May 2019 21:15:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB745894DD
 for <amd-gfx@lists.freedesktop.org>; Wed, 29 May 2019 21:15:32 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id 14so4480240qtf.0
 for <amd-gfx@lists.freedesktop.org>; Wed, 29 May 2019 14:15:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=q5EwstTJhgo/CmWvbkydomfc7Y5tM+FHszEHUfelsnI=;
 b=ITcnocmIjOyjR9tItLFx1qXDhEdhzcvzy6ESI7YTZJ+PhpnZTyGZGCWoLxxSTh2zfu
 1BA7dGOOzGN0y6ntL+UvBzfHIdAvBcsfVWIP9d7lsIvHN7R48IbOchZZJlmil+xHZz+p
 Uk2MRWFPQwvMkkD6I3HNfAY7jTlslZUrWZUA3O1lHkRBIZq+ShIdZyr6/zew6RbRe/7j
 6WzT7S2hUQT56pertc1OlzMwuZ2Lf2FkRsRfajjPxJXd7L6v37Bs/09mWf6Aouf1PqT+
 +Vl6VOW5jxuwpVcUazcCKcyfBToKmE0XqitgYc/a/cv5FQm+MjmmffXSJLw2MipR3UrV
 os1Q==
X-Gm-Message-State: APjAAAVZLCD5WfceHqFiUcLAQcTmrFeYg1JsdGx1/ZkaDqYxeqT/nhCH
 JzKgWzsyL8JUUR97eRe/P/kIEkS7
X-Google-Smtp-Source: APXvYqwtJsAQCorwt92UaL06uw44FCL8fslNaFAvjgA/BRG9GP3Ha0FgBHy+R+6H9qBX1JWXuSIP6w==
X-Received: by 2002:ac8:60d4:: with SMTP id i20mr125750qtm.376.1559164531703; 
 Wed, 29 May 2019 14:15:31 -0700 (PDT)
Received: from localhost ([2620:10d:c091:500::2:849f])
 by smtp.gmail.com with ESMTPSA id o185sm289478qkd.64.2019.05.29.14.15.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 29 May 2019 14:15:30 -0700 (PDT)
Date: Wed, 29 May 2019 14:15:29 -0700
From: Tejun Heo <tj@kernel.org>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>
Subject: Re: [PATCH v2 4/4] drm/amdkfd: Check against device cgroup
Message-ID: <20190529211529.GQ374014@devbig004.ftw2.facebook.com>
References: <20190517161435.14121-1-Harish.Kasiviswanathan@amd.com>
 <20190517161435.14121-5-Harish.Kasiviswanathan@amd.com>
 <e547c0a1-e153-c3a6-79bc-67f59f364c3e@amd.com>
 <20190528190239.GM374014@devbig004.ftw2.facebook.com>
 <d39ec6a7-b30d-404b-c8d1-4e22604e0c8e@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d39ec6a7-b30d-404b-c8d1-4e22604e0c8e@amd.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=q5EwstTJhgo/CmWvbkydomfc7Y5tM+FHszEHUfelsnI=;
 b=J++Vh0pi+jjTIaaZE9ElQ5pSaNpOAJzFFW8YjWcFxPPah+rXc9cdVeNvSK+15Evwc+
 zuica+uEyZVa0l+Q5Y7tS5zGzmSO2NClJ5AR2Nn858Diz5EaJICFnuVTbqn46bQXNbTa
 GkR7CfZWELzA0xEv77or9+oNoBwEj2NmgqF2FsiEciQX3cYaoJMB64YRtRWKqw4xyKqC
 2/XsTTR4GqVyTyZDnTAbPDQJpgjwaFDAenxOGw+lC8IS5zWzlpey+G2UMg/UY7yQY+Yy
 cweT0ORFhkpjlGM/aBGawbH103ooIVC1tR3G/zOyVSw2Lh5DC2du1035lLtPICx9Szv/
 sBPw==
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 Dave Airlie <airlied@redhat.com>, "Kasiviswanathan,
 Harish" <Harish.Kasiviswanathan@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "cgroups@vger.kernel.org" <cgroups@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgMjksIDIwMTkgYXQgMDg6NDU6NDRQTSArMDAwMCwgS3VlaGxpbmcsIEZlbGl4
IHdyb3RlOgo+IEp1c3QgdG8gY2xhcmlmeSwgYXJlIHlvdSBzYXlpbmcgdGhhdCB3ZSBzaG91bGQg
dXBzdHJlYW0gdGhpcyBjaGFuZ2UgCj4gdGhyb3VnaCBBbGV4IERldWNoZXIncyBhbWQtc3RhZ2lu
Zy1kcm0tbmV4dCBhbmQgRGF2ZSBBaXJsaWUncyBkcm0tbmV4dCAKPiB0cmVlcz8KClllYWgsIHN1
cmUsIHdoaWNoZXZlciB0cmVlIGlzIHRoZSBtb3N0IGNvbnZlbmllbnQuCgpUaGFua3MuCgotLSAK
dGVqdW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1k
LWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
