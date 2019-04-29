Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F994E2BD
	for <lists+amd-gfx@lfdr.de>; Mon, 29 Apr 2019 14:35:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE9E489381;
	Mon, 29 Apr 2019 12:35:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95C8A89381
 for <amd-gfx@lists.freedesktop.org>; Mon, 29 Apr 2019 12:35:03 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id n25so531901wmk.4
 for <amd-gfx@lists.freedesktop.org>; Mon, 29 Apr 2019 05:35:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=b0ELGwO249uJKSO74zsOV/5Vg7G2RrhL59eDSXzS9Gs=;
 b=BUihRwD3OeKTzsg3kySlaZoOUM3Fh0icOQ4zmdyKxmL/C0cWtAaosW27hOYpI7pcfe
 GvDqYLV8xDUM6sgRS12ywdKey0I0J1QwotOz1/NXoteW5L34EkhZOJC57HxjPIC8IJaA
 r/0gHX3SkH4aFL4Fmx3kVT/9J2eG+w0A66APgxjf+JHNKDWRFr4bpRWgaseuknA9AWoh
 onmEFTN0xjrGGV3yMqB3PW4LHZFtBAseio2Fd0hw7gYn0N6Im5y9ilZYQoaprsPte359
 eQor0kkttdXVnCKcbQ03QciU9nJzmXpALPWFyLsezONKXKXrLyJWu/o0n2S3n+YhSJWt
 MI1Q==
X-Gm-Message-State: APjAAAUV6BLhhzB6oYYK3QbAh/bSQlZjTMXyclA7HlDkKevumOONvHq0
 SFI+oz3wd6T+PCLRBqfYHqVjy1hk
X-Google-Smtp-Source: APXvYqzKYQLfojk3VWUDWfmnMH/DGefi19wM/VoFBEbKVyUZNALr4p7dWGc/NhKc1Pw7jArZBhrrCQ==
X-Received: by 2002:a1c:346:: with SMTP id 67mr8971024wmd.3.1556541302312;
 Mon, 29 Apr 2019 05:35:02 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id e6sm24052594wrc.96.2019.04.29.05.34.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 29 Apr 2019 05:35:01 -0700 (PDT)
Subject: Re: [PATCH 27/27] drm/amdgpu: Fix GTT size calculation
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20190428074331.30107-1-Felix.Kuehling@amd.com>
 <20190428074331.30107-28-Felix.Kuehling@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <86fa9fc3-7a8f-9855-ae1d-5c7ccf2b5260@gmail.com>
Date: Mon, 29 Apr 2019 14:34:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190428074331.30107-28-Felix.Kuehling@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=b0ELGwO249uJKSO74zsOV/5Vg7G2RrhL59eDSXzS9Gs=;
 b=rVHKdoxN5YhZZ41LvHT/7jMk3XclUyG9zpwq7MzaDq3iYKU5Y1jAXnR9DH0/otOmZo
 zSaleS46z59C9dU+9ygAdYmybF4b5SrpZ7IcCcb/d64zOoFN+MH/MH+JDRvX7oZ35wru
 sfg+R1v5oQFUnD/8ZjdY8hzauURdmkCu1xdYO2A65vr5QjDSSq0mKmoaW4sFL0zj36RX
 lK6q0ltuqUL3vnxBLFBSFKiiIFjmJfThMVDdebHvGMKVy6YcbTVeiyDPkB4QTe5dpFQ2
 Dp58mIauo8f3qsCOG7LADSxCICXGtswykZ/RnAi/6Nm5CGZIzwiMWVvTyestob0hPbnp
 M3ew==
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
Cc: "Russell, Kent" <Kent.Russell@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMjguMDQuMTkgdW0gMDk6NDQgc2NocmllYiBLdWVobGluZywgRmVsaXg6Cj4gRnJvbTogS2Vu
dCBSdXNzZWxsIDxrZW50LnJ1c3NlbGxAYW1kLmNvbT4KPgo+IEdUVCBzaXplIGlzIGN1cnJlbnRs
eSBsaW1pdGVkIHRvIHRoZSBtaW5pbXVtIG9mIFZSQU0gc2l6ZSBvciAzLzQgb2YKPiBzeXN0ZW0g
bWVtb3J5LiBUaGlzIHNldmVyZWx5IGxpbWl0cyB0aGUgcXVhbml0aXR5IG9mIHN5c3RlbSBtZW1v
cnkKPiB0aGF0IGNhbiBiZSB1c2VkIGJ5IFJPQ20gYXBwbGljYXRpb24uCj4KPiBJbmNyZWFzZSBH
VFQgc2l6ZSB0byB0aGUgbWF4aW11bSBvZiBWUkFNIHNpemUgb3Igc3lzdGVtIG1lbW9yeSBzaXpl
LgoKV2VsbCwgTkFLLgoKVGhpcyBsaW1pdCB3YXMgZG9uZSBvbiBwdXJwb3NlIGJlY2F1c2Ugd2Ug
b3RoZXJ3aXNlIHRoZSBtYXgtdGV4dHVyZS1zaXplIAp3b3VsZCBiZSBjcmFzaGluZyB0aGUgc3lz
dGVtIGJlY2F1c2UgdGhlIE9PTSBraWxsZXIgd291bGQgYmUgY2F1c2luZyBhIApzeXN0ZW0gcGFu
aWMuCgpVc2luZyBtb3JlIHRoYW4gNzUlIG9mIHN5c3RlbSBtZW1vcnkgYnkgdGhlIEdQVSBhdCB0
aGUgc2FtZSB0aW1lIG1ha2VzIAp0aGUgc3lzdGVtIHVuc3RhYmxlIGFuZCBzbyB3ZSBjYW4ndCBh
bGxvdyB0aGF0IGJ5IGRlZmF1bHQuCgpXaGF0IGNvdWxkIG1heWJlIHdvcmsgaXMgdG8gcmVkdWNl
IGFtb3VudCBvZiBzeXN0ZW0gbWVtb3J5IGJ5IGEgZml4ZWQgCmZhY3RvciwgYnV0IEkgb2YgaGFu
ZCBkb24ndCBzZWUgYSB3YXkgb2YgZml4aW5nIHRoaXMgaW4gZ2VuZXJhbC4KClJlZ2FyZHMsCkNo
cmlzdGlhbi4KCj4KPiBTaWduZWQtb2ZmLWJ5OiBLZW50IFJ1c3NlbGwgPGtlbnQucnVzc2VsbEBh
bWQuY29tPgo+IFJldmlld2VkLWJ5OiBGZWxpeCBLdWVobGluZyA8RmVsaXguS3VlaGxpbmdAYW1k
LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBGZWxpeCBLdWVobGluZyA8RmVsaXguS3VlaGxpbmdAYW1k
LmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYyB8
IDkgKysrKy0tLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA1IGRlbGV0
aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV90dG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYwo+IGluZGV4
IGMxNDE5ODczN2RjZC4uZTllY2MzOTUzNjczIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV90dG0uYwo+IEBAIC0xNzQwLDExICsxNzQwLDEwIEBAIGludCBhbWRncHVfdHRt
X2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCj4gICAJCXN0cnVjdCBzeXNpbmZvIHNp
Owo+ICAgCj4gICAJCXNpX21lbWluZm8oJnNpKTsKPiAtCQlndHRfc2l6ZSA9IG1pbihtYXgoKEFN
REdQVV9ERUZBVUxUX0dUVF9TSVpFX01CIDw8IDIwKSwKPiAtCQkJICAgICAgIGFkZXYtPmdtYy5t
Y192cmFtX3NpemUpLAo+IC0JCQkgICAgICAgKCh1aW50NjRfdClzaS50b3RhbHJhbSAqIHNpLm1l
bV91bml0ICogMy80KSk7Cj4gLQl9Cj4gLQllbHNlCj4gKwkJZ3R0X3NpemUgPSBtYXgzKChBTURH
UFVfREVGQVVMVF9HVFRfU0laRV9NQiA8PCAyMCksCj4gKwkJCQlhZGV2LT5nbWMubWNfdnJhbV9z
aXplLAo+ICsJCQkJKCh1aW50NjRfdClzaS50b3RhbHJhbSAqIHNpLm1lbV91bml0KSk7Cj4gKwl9
IGVsc2UKPiAgIAkJZ3R0X3NpemUgPSAodWludDY0X3QpYW1kZ3B1X2d0dF9zaXplIDw8IDIwOwo+
ICAgCj4gICAJLyogSW5pdGlhbGl6ZSBHVFQgbWVtb3J5IHBvb2wgKi8KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
