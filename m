Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0A9A1447
	for <lists+amd-gfx@lfdr.de>; Thu, 29 Aug 2019 11:03:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1C1789225;
	Thu, 29 Aug 2019 09:03:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70ACF89225
 for <amd-gfx@lists.freedesktop.org>; Thu, 29 Aug 2019 09:03:30 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id k1so2853798wmi.1
 for <amd-gfx@lists.freedesktop.org>; Thu, 29 Aug 2019 02:03:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=JSCP1ZRAOUVyLxE6zuSMT2xadmaZyqyGKkelAJcppTw=;
 b=HamSOlGxAHVvL5eVwVmioWVjkC9VH9DslUrM+e6AZ017FG41vHtmbe+kHwy3wGQaxX
 hhgGFpTZuWLWwP8JRRlK75f2KAv2Dcy2eZPXdJd7MPOh+qiwnZS8Whm+3g/Ah8hN+iQg
 N/n467wRiQ1po/Q7x/FzCgwfp9krDOQQU7uWhn0nkPlYflzbYZN4SDZemk1WOODhxc85
 xgr3CgQy2I7vZhgi5VpUz5tA/uVqT2KF7XBKzlJVXamKO/i/OmWEWywrfCr8rW19ORwQ
 jbloRSe3b452HccahPFaljYLNb3IvDK0euWRm+Dgley/rJMVviw+gHvQiVxwyKYiF4W6
 2j+w==
X-Gm-Message-State: APjAAAUZLWKsjR4jSsuIWC4m6APMaCTTDZkPbBXrZbEXA125+yaLB14n
 clBL6j+zrp1I9konJL9D8sfr0Quf
X-Google-Smtp-Source: APXvYqz3fjcnFQg++j82RgE87BRl+Zkj5ebtpp7GYRHV1VErpqBn0UZHeg1ZUbRzXz/UnzhJzBpr+w==
X-Received: by 2002:a7b:c935:: with SMTP id h21mr9660246wml.35.1567069409093; 
 Thu, 29 Aug 2019 02:03:29 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id 39sm5999445wrc.45.2019.08.29.02.03.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 29 Aug 2019 02:03:28 -0700 (PDT)
Subject: Re: [PATCH libdrm 0/4] amdgpu: new approach for ras inject test
To: Guchun Chen <guchun.chen@amd.com>, amd-gfx@lists.freedesktop.org,
 Hawking.Zhang@amd.com, Dennis.Li@amd.com, christian.koenig@amd.com,
 alexander.deucher@amd.com, Tao.Zhou1@amd.com
References: <20190829085917.20439-1-guchun.chen@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <16e80e67-e9eb-4091-d2ea-69255e68bb25@gmail.com>
Date: Thu, 29 Aug 2019 11:03:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190829085917.20439-1-guchun.chen@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=JSCP1ZRAOUVyLxE6zuSMT2xadmaZyqyGKkelAJcppTw=;
 b=Ekxb3deY3zPMOq3hGxtTF2508Lzakiut7kl1AalXOz8oN8A6FjjfoAqn1fipm5U/dE
 ZIx8ouRQvPCr+2r+3a5AtITKC/xHZt0MczU1wq/q1zC4y+K4PRcE5LB5b0qwnrhyIFWA
 rh04/wbISfueemfHBDE7tHYVAiCbt1UqiAR5FJ9MHmOtWBI4IAJAkHgynXdOL7VIXK3C
 mU5jAXPD3SCh+NpamKGb8C2okClAYwwygIL42x9wKzg/1w5cXT3T8/qp5FqY7N6dcyhl
 jf4LgZacCzty5RY0/yaXAjCsW9nabv1VT9Rx9a6JAJMEFiSTWKYqpaMSbwGet8HO9G/+
 1I1g==
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
Reply-To: christian.koenig@amd.com
Cc: Candice.Li@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T25seSBza2ltbWVkIG92ZXIgdGhlIHBhdGNoZXMsIGJ1dCBpbiBnZW5lcmFsIGxvb2tzIGdvb2Qg
dG8gbWUuCgpGZWVsIGZyZWUgdG8gYWRkIGFuIEFja2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxj
aHJpc3RpYW4ua29lbmlnQGFtZC5jb20+IAp0byB0aGUgd2hvbGUgc2VyaWVzLgoKQnV0IHNvbWVi
b2R5IHdpdGggbW9yZSByYXMga25vd2xlZGdlIHRoYW4gSSBoYXZlIHNob3VsZCBwcm9iYWJseSB0
YWtlIGEgCmxvb2sgYXMgd2VsbC4KCkNocmlzdGlhbi4KCkFtIDI5LjA4LjE5IHVtIDEwOjU5IHNj
aHJpZWIgR3VjaHVuIENoZW46Cj4gVGhlc2UgcGF0Y2hlcyBhcmUgdG8gcmVtb3ZlIGFkZGl0aW9u
YWwgZXh0ZXJuYWwgbGliLWpzb25jCj4gZGVwZW5kZW5jZSwgYW5kIHRvIHB1dCBhbGwgdGVzdCBj
b25maWd1cmF0aW9ucyBpbnRvIEMgY29kZS4KPgo+IEd1Y2h1biBDaGVuICg0KToKPiAgICBhbWRn
cHU6IHJlbW92ZSBqc29uIHBhY2thZ2UgZGVwZW5kZW5jZQo+ICAgIGFtZGdwdTogZGVsZXRlIHRl
c3QgY29uZmlndXJhdGlvbiBmaWxlCj4gICAgYW1kZ3B1OiBhZGQgcmFzIGluamVjdCB1bml0IHRl
c3QKPiAgICBhbWRncHU6IGFkZCByYXMgZmVhdHVyZSBjYXBhYmlsaXR5IGNoZWNrIGluIGluamVj
dCB0ZXN0Cj4KPiAgIGNvbmZpZ3VyZS5hYyAgICAgICAgICAgICB8ICAxOCAtLS0KPiAgIGRhdGEv
YW1kZ3B1X3Jhcy5qc29uICAgICB8IDI2NyAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCj4gICBtZXNvbi5idWlsZCAgICAgICAgICAgICAgfCAgIDEgLQo+ICAgdGVzdHMvYW1kZ3B1
L01ha2VmaWxlLmFtIHwgICA1ICstCj4gICB0ZXN0cy9hbWRncHUvbWVzb24uYnVpbGQgfCAgMTYg
Ky0KPiAgIHRlc3RzL2FtZGdwdS9yYXNfdGVzdHMuYyB8IDMwNSArKysrKysrKysrKysrKy0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgIDYgZmlsZXMgY2hhbmdlZCwgMTE2IGluc2VydGlvbnMo
KyksIDQ5NiBkZWxldGlvbnMoLSkKPiAgIGRlbGV0ZSBtb2RlIDEwMDY0NCBkYXRhL2FtZGdwdV9y
YXMuanNvbgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
