Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE11C8E86C
	for <lists+amd-gfx@lfdr.de>; Thu, 15 Aug 2019 11:38:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ADAA6E966;
	Thu, 15 Aug 2019 09:38:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0BC36E966
 for <amd-gfx@lists.freedesktop.org>; Thu, 15 Aug 2019 09:38:09 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id f72so754554wmf.5
 for <amd-gfx@lists.freedesktop.org>; Thu, 15 Aug 2019 02:38:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=vRh5Q7cElTakuLmJZr/v7Zg8Lkpskm7tuQ3artRpj0w=;
 b=OUKulVBz7ZM3gYX2v7NJ9NVDNXH09Saktx3PKMZhkeUcnH/5nU+WJz0uGrtz0iWJwb
 JyGyy80cgfy2RiCwgPodcx+DOwzF7IfXxgmkJHdkTwNyknnG5RXv+OIJ2XRQvo+XojGK
 FVJjQF6DTRB6WTYG1u8ggiAP27RJpRfWEgs7fjp8pBljYxFa2g+teCX0V/WnfqTv2iLd
 irzkPavrj1j+YVi8siMXsRPGjygeWSn2ojckYkP7w4EyCziyso/zylNMvgpTqWmFprqG
 XOh7XokRbYQ9Zxk3Zj+M2HS+H/kRlqZOvqiyjI9owqBXfsn5NJOO+pBbrlT2k31QRPyl
 xfQA==
X-Gm-Message-State: APjAAAVXO4PGXGXxtHa77t8rBYl3uFm+5yO3evJ8wHyH+jST4WAIGBZv
 iyjzcR59Rr4UDSEKmE5fWN6Hksu7
X-Google-Smtp-Source: APXvYqxb1AFs1GBW4CSAKUGbq0VLIU+IiIWGca6a8fZPtiPXt7/ngr640VDL9W0VXUe+Y6lKpm2vVw==
X-Received: by 2002:a05:600c:22d7:: with SMTP id
 23mr1949939wmg.0.1565861888313; 
 Thu, 15 Aug 2019 02:38:08 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id u129sm1156676wmb.12.2019.08.15.02.38.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 15 Aug 2019 02:38:07 -0700 (PDT)
Subject: Re: [PATCH] dmr/amdgpu: Fix compile error with
 CONFIG_DRM_AMDGPU_GART_DEBUGFS
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 amd-gfx@lists.freedesktop.org
References: <1565812118-25941-1-git-send-email-andrey.grodzovsky@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <e7e3b33a-5918-7d4f-a179-2ee344fe3423@gmail.com>
Date: Thu, 15 Aug 2019 11:38:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1565812118-25941-1-git-send-email-andrey.grodzovsky@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=vRh5Q7cElTakuLmJZr/v7Zg8Lkpskm7tuQ3artRpj0w=;
 b=MmMc4VoUEvaBfMxVAVrXQA8uiIhKkRK5HO2WAJncw0NBa7dTBQbTRU47p+y+NYL44Q
 GGoGhPLTNx6GUiL2H3ucp2JhDoqER6T9RdeQAR4PFSS85JATpsUH1Xl6M77a3lDAzBwA
 xpnZvC6MjHs1sXgnX8T2M5IHAuZCZ/HJwrpc/1THViB4bR7pXHPJV118hheG6COLeK//
 eT0Bs2HFPlmAu2w9cl8ZOWS3XP0X+WjnDN5DMDWT2Cq85NY+CaK/k2xdIa1NBYvGqki+
 eu6dY815Qh78uZHY8ty4nJEMPoTGvpUMVcoUlI+mQUS5Aqz3YZ4dakG1gzUKIDs32bmk
 HJZg==
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMTQuMDguMTkgdW0gMjE6NDggc2NocmllYiBBbmRyZXkgR3JvZHpvdnNreToKPiBEb3VibGUg
ZGVmaW50aW9uIG9mICdpJwo+Cj4gU2lnbmVkLW9mZi1ieTogQW5kcmV5IEdyb2R6b3Zza3kgPGFu
ZHJleS5ncm9kem92c2t5QGFtZC5jb20+CgpSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8
Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgoKSSB0aGluayBpbiB0aGUgbG9uZyB0ZXJtIHdlIGNv
dWxkIGFzIHdlbGwgcmVtb3ZlIApDT05GSUdfRFJNX0FNREdQVV9HQVJUX0RFQlVHRlMgYW5kIGRy
b3AgdGhlIGV4dHJhIGRlYnVnIGZ1bmN0aW9uYWxpdHkuCgpDaHJpc3RpYW4uCgo+IC0tLQo+ICAg
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dhcnQuYyB8IDIgKy0KPiAgIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nYXJ0LmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZ2FydC5jCj4gaW5kZXggYTY3ZmZmZi4uZjIwNGRiZCAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2FydC5jCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dhcnQuYwo+IEBAIC0zMDksNyAr
MzA5LDcgQEAgaW50IGFtZGdwdV9nYXJ0X2JpbmQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYs
IHVpbnQ2NF90IG9mZnNldCwKPiAgIAkJICAgICB1aW50NjRfdCBmbGFncykKPiAgIHsKPiAgICNp
ZmRlZiBDT05GSUdfRFJNX0FNREdQVV9HQVJUX0RFQlVHRlMKPiAtCXVuc2lnbmVkIGksdCxwOwo+
ICsJdW5zaWduZWQgdCxwOwo+ICAgI2VuZGlmCj4gICAJaW50IHIsIGk7Cj4gICAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBs
aXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
