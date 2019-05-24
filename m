Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDC82958B
	for <lists+amd-gfx@lfdr.de>; Fri, 24 May 2019 12:15:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 267D76E04B;
	Fri, 24 May 2019 10:15:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72AB26E04B
 for <amd-gfx@lists.freedesktop.org>; Fri, 24 May 2019 10:15:52 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id l2so9406277wrb.9
 for <amd-gfx@lists.freedesktop.org>; Fri, 24 May 2019 03:15:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=DyPD1yWu5XaDPoztlH/ImdAWI4rbuTRVwFlM407pcac=;
 b=jyCEzNdX3Lgjju1wbehq+II7M1PCfRUbhFt3tLf84m5i2FZElsQO1WIXopW+ZMsbuv
 IONd9IJXNObhCR4GQ8DXGByV5kC4142pAqN+DsO/7Ns8Piup7rfjzrkUZ/8fcDhblJaw
 +rZtOMh4dAG8wU4wdAxhifTDD62a4i0xWvDCT/mfax7qj+RdEmbDnRkZU2+VYZ62i8fw
 ctZ3Jp3O6A1c2N/bVMRwkH67xTLVtSmv4ITdaxD/BDj2/T3uZtBkM99exWU6C1TcyTdo
 r2xg1yqZmk8/MH3WWNu2DsLE+X2DcsR29KGJ5L+TTVtl4tnA9YOn7wkTPMAHS8h1WT0w
 zTlA==
X-Gm-Message-State: APjAAAWzH4+lTPBQywjK0/jrb44AX3NPM6dW14BvwVtzkKSwLl4er8H+
 d1GGYVyG/VQmy0tKgTvjy4rUAPKT
X-Google-Smtp-Source: APXvYqzulMdBHKPs7GO4a7tJNDa4TqPtAKYDaqEd6CjRimC3CjFDRdI3RZejPBzGFBNhQ3O/uiNwEw==
X-Received: by 2002:a5d:5506:: with SMTP id b6mr61597297wrv.221.1558692950976; 
 Fri, 24 May 2019 03:15:50 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id 16sm1788946wmx.45.2019.05.24.03.15.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 May 2019 03:15:50 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: fix unload driver fail
To: Emily Deng <Emily.Deng@amd.com>, amd-gfx@lists.freedesktop.org
References: <1558691520-5819-1-git-send-email-Emily.Deng@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <19ffcfde-a7d6-eb17-c561-e3673e8569fc@gmail.com>
Date: Fri, 24 May 2019 12:15:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1558691520-5819-1-git-send-email-Emily.Deng@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=DyPD1yWu5XaDPoztlH/ImdAWI4rbuTRVwFlM407pcac=;
 b=PFhGhKzevDFkNPFJlaM6uppZfrIqs7HX7PELOuf9V51+y4jrKnpnAQ6HleUTNsWbuK
 C2Dj+YJxsMhydKkjloK8UnjaKmtfTY4V6UZKY2Vnb7srFvicjDr6U/UWLAl8UV2Hevz9
 aiUpNhD/jZcgciCKc6qMT1wiA9i2xsVzC0LV0uS4BuajfOVCr8OAZohf/74W28UcryzJ
 MSJGBdVWdiapwYF3xT3JoVlAHQDjHg62ekFd3xLlHYP+BxwtO+1VOHIkuZZG1b7dX2VS
 Y6B+GPqrt1NBTILQpS/qWdbwiZ53ndVp/8MPxgM2tJv41Rnz6vLLsfcsjADiNpjIyov7
 +qPQ==
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

QW0gMjQuMDUuMTkgdW0gMTE6NTIgc2NocmllYiBFbWlseSBEZW5nOgo+IGRjX2Rlc3Ryb3kgc2hv
dWxkIGJlIGNhbGxlZCBhbWRncHVfY2dzX2Rlc3Ryb3lfZGV2aWNlLAo+IGFzIGl0IHdpbGwgdXNl
IGNncyBjb250ZXh0IHRvIHJlYWQgb3Igd3JpdGUgcmVnaXN0ZXJzLgo+Cj4gU2lnbmVkLW9mZi1i
eTogRW1pbHkgRGVuZyA8RW1pbHkuRGVuZ0BhbWQuY29tPgoKQWNrZWQtYnk6IENocmlzdGlhbiBL
w7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KCj4gLS0tCj4gICBkcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIHwgNyArKysrLS0tCj4gICAxIGZp
bGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCj4gaW5kZXgg
ZmQwNDIxNy4uZjU1OGM5YyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwo+IEBAIC02MTYsNiArNjE2LDEwIEBAIHN0YXRpYyBp
bnQgYW1kZ3B1X2RtX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCj4gICBzdGF0aWMg
dm9pZCBhbWRncHVfZG1fZmluaShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKPiAgIHsKPiAg
IAlhbWRncHVfZG1fZGVzdHJveV9kcm1fZGV2aWNlKCZhZGV2LT5kbSk7Cj4gKwo+ICsJLyogREMg
RGVzdHJveSBUT0RPOiBSZXBsYWNlIGRlc3Ryb3kgREFMICovCj4gKwlpZiAoYWRldi0+ZG0uZGMp
Cj4gKwkJZGNfZGVzdHJveSgmYWRldi0+ZG0uZGMpOwo+ICAgCS8qCj4gICAJICogVE9ETzogcGFn
ZWZsaXAsIHZsYW5rIGludGVycnVwdAo+ICAgCSAqCj4gQEAgLTYzMCw5ICs2MzQsNiBAQCBzdGF0
aWMgdm9pZCBhbWRncHVfZG1fZmluaShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKPiAgIAkJ
bW9kX2ZyZWVzeW5jX2Rlc3Ryb3koYWRldi0+ZG0uZnJlZXN5bmNfbW9kdWxlKTsKPiAgIAkJYWRl
di0+ZG0uZnJlZXN5bmNfbW9kdWxlID0gTlVMTDsKPiAgIAl9Cj4gLQkvKiBEQyBEZXN0cm95IFRP
RE86IFJlcGxhY2UgZGVzdHJveSBEQUwgKi8KPiAtCWlmIChhZGV2LT5kbS5kYykKPiAtCQlkY19k
ZXN0cm95KCZhZGV2LT5kbS5kYyk7Cj4gICAKPiAgIAltdXRleF9kZXN0cm95KCZhZGV2LT5kbS5k
Y19sb2NrKTsKPiAgIAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
