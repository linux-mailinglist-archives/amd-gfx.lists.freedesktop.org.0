Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8585E7B2
	for <lists+amd-gfx@lfdr.de>; Wed,  3 Jul 2019 17:21:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A54A6E165;
	Wed,  3 Jul 2019 15:21:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3FFB6E161;
 Wed,  3 Jul 2019 15:21:36 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id 65so2353983oid.13;
 Wed, 03 Jul 2019 08:21:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JesoS1mGInzbAYCEZ1ZFW+Rbhz8GECHGcwK/QDkb7n0=;
 b=Js4Tf0tCmWzfoqx43KmBwoOdU/vjIY68bl2rG8qtMdxsqTMwss4f4KGnq2xpdw8WdZ
 Aol6l5FHU2kNt0AiNm0wYCa2AhC4UAzeVm9d2scD6YXZaqEz6cI0tfucaIlx2Y1Y0O7i
 k1BFxD+OB6o+P4pwpPkwjwEKDtNqxLghGNdPfpcBf1N1vo9RjWh8u/Ahf37eyPuvSqGw
 PGZHD9/LTf/u1yWZ+1ERoZjO0UMwYpX2n0N5bMtYEBiGRmUWc7TRdgrWemUx/4HgyUGJ
 sgVPMATMma8NBdiKYDpJi3CpWIZ0UAafDS/mp1WZd5eJ76WrwEjo/aOBRRveueU9wGmG
 PVJg==
X-Gm-Message-State: APjAAAXT8noShXptSX3eEhwVYhwtcOza5vpy18aF44Vc42BDa4YQoASs
 ELJ6UJDQG7IdaEhRVoKzXALUgo8PQN1iLiD36E8=
X-Google-Smtp-Source: APXvYqzCxGJUM0HjXJfhRX2azHu+Zalhg69iyddxVBGuG7K18stSBpK/s2YaDYtwVJ+kySTqO2a7Pkh94StiDTiXDa0=
X-Received: by 2002:aca:5241:: with SMTP id g62mr7061129oib.41.1562167296244; 
 Wed, 03 Jul 2019 08:21:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190703131414.24947-1-huangfq.daxian@gmail.com>
In-Reply-To: <20190703131414.24947-1-huangfq.daxian@gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Wed, 3 Jul 2019 16:21:45 +0100
Message-ID: <CACvgo52wa8FzddSB09WoBCfR=Jdb-AD1G3_siB7c2nWWtmdpGg@mail.gmail.com>
Subject: Re: [PATCH 06/30] drm/amdgpu: Use kmemdup rather than duplicating its
 implementation
To: Fuqian Huang <huangfq.daxian@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=JesoS1mGInzbAYCEZ1ZFW+Rbhz8GECHGcwK/QDkb7n0=;
 b=QycFk9qEiszh6we8thUlzD6zFB8gI520mJUHuWfYDStkL+HHILFwF4PslL5KGv/tsT
 4ewlbeh2Us4mBWyJtIemdCLicH0jeVkpTFHjby+9eUQHYRPSPbYLDS6RicbekMz7TOsX
 Zbed+XA+ai3uF6vWEQtIwgIfusyhUPC1KHZ4avQp0+P5BwzUIrUt/kj5ifGQP1ERoOka
 M2rfmKEwlkfCdcQ8+7DpVaplFcPMCg4aBiC0gEd2LxkH1tan3nhIZUuPSZ3tZE9iw4lx
 t3URjW0RYdhqn/9XQHj5UI0EgTfVJfBHRZrOroutA2w0Asp6q/D16MlKZI4SHyVzR7la
 l0pg==
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
Cc: David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, Leo Li <sunpeng.li@amd.com>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gV2VkLCAzIEp1bCAyMDE5IGF0IDE0OjE1LCBGdXFpYW4gSHVhbmcgPGh1YW5nZnEuZGF4aWFu
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBrbWVtZHVwIGlzIGludHJvZHVjZWQgdG8gZHVwbGljYXRl
IGEgcmVnaW9uIG9mIG1lbW9yeSBpbiBhIG5lYXQgd2F5Lgo+IFJhdGhlciB0aGFuIGttYWxsb2Mv
a3phbGxvYyArIG1lbXNldCwgd2hpY2ggdGhlIHByb2dyYW1tZXIgbmVlZHMgdG8KPiB3cml0ZSB0
aGUgc2l6ZSB0d2ljZSAoc29tZXRpbWVzIGxlYWQgdG8gbWlzdGFrZXMpLCBrbWVtZHVwIGltcHJv
dmVzCj4gcmVhZGFiaWxpdHksIGxlYWRzIHRvIHNtYWxsZXIgY29kZSBhbmQgYWxzbyByZWR1Y2Ug
dGhlIGNoYW5jZXMgb2YgbWlzdGFrZXMuCj4gU3VnZ2VzdGlvbiB0byB1c2Uga21lbWR1cCByYXRo
ZXIgdGhhbiB1c2luZyBrbWFsbG9jL2t6YWxsb2MgKyBtZW1zZXQuCj4KPiBTaWduZWQtb2ZmLWJ5
OiBGdXFpYW4gSHVhbmcgPGh1YW5nZnEuZGF4aWFuQGdtYWlsLmNvbT4KRnVxaWFuIHBsZWFzZSBh
ZGQgcmV2aWV3ZWQtYnkgYW5kIG90aGVyIHRhZ3Mgd2hlbiBzZW5kaW5nIG5ldyByZXZpc2lvbnMu
CgpGd2l3IHRoZSBwYXRjaCBpczoKUmV2aWV3ZWQtYnk6IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxp
a292QGNvbGxhYm9yYS5jb20+CgotRW1pbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2FtZC1nZng=
