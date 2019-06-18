Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECE349BAC
	for <lists+amd-gfx@lfdr.de>; Tue, 18 Jun 2019 10:03:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D3B76E10B;
	Tue, 18 Jun 2019 08:03:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA1E66E10B
 for <amd-gfx@lists.freedesktop.org>; Tue, 18 Jun 2019 08:03:41 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id v14so12831203wrr.4
 for <amd-gfx@lists.freedesktop.org>; Tue, 18 Jun 2019 01:03:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=0/Lr0jnR0sdw2C6Lw8TpBNfJ2v0DYU8ZWg6AcIaaYqc=;
 b=B/+aX6l/kRNwAni9fv6BH5voaoJn6WNoTvmZMh+APgKLkcdeLopksOST488iLiEyY8
 RDGr0C9RCkrZ0pUAs1LdiPRr1h9ZfQSX8L3VBpRDHRuKaMJOcYkDu9r6mAmXGBpGMsrK
 ncOlJGecCD/lGqoginL0brEsNaqXLDYdOHELtpmYxSMsRIBv0A1jh9t61IV1SqKH9FF0
 ArGMwMCCcqGgNnOYIevtvaU57iwN/G2RJx2xh2v+8878O5uwI7fI3l+/TFW88W5aiMJ6
 SrDv97oe/D6j01G2BnMdJJBGsVf/4XpHx1wsQ0cn8o5LEbfoiZKpSJtr7aFLqmD3H1t4
 8QeQ==
X-Gm-Message-State: APjAAAX1PldauUmiy/8i0dCUbRwVJA967b9SW5fif3Q+EEjmVHXSSKKQ
 gG1gEMarYr9X+vJSzDvooGiop6Oc
X-Google-Smtp-Source: APXvYqyp5LfZxqB/eurJoElopykrat4bSXMWIV3MxZ4UvSEx+//cZvGyNDUhlbKPf0yNS/lvj1X3xQ==
X-Received: by 2002:a5d:428d:: with SMTP id k13mr18845013wrq.142.1560845020521; 
 Tue, 18 Jun 2019 01:03:40 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id h90sm29155988wrh.15.2019.06.18.01.03.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 18 Jun 2019 01:03:40 -0700 (PDT)
Subject: Re: [PATCH 092/459] drm/amdgpu: add ib preemption status in amdgpu_job
To: Alex Deucher <alexdeucher@gmail.com>, amd-gfx@lists.freedesktop.org
References: <20190617191700.17899-1-alexander.deucher@amd.com>
 <20190617191700.17899-81-alexander.deucher@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <8429fbeb-fbb2-b71d-e146-c8f4c0959063@gmail.com>
Date: Tue, 18 Jun 2019 10:03:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190617191700.17899-81-alexander.deucher@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=0/Lr0jnR0sdw2C6Lw8TpBNfJ2v0DYU8ZWg6AcIaaYqc=;
 b=DKcgAuDCZl3sn37x3TADi9qsd4E7LyKoaKND6Ro3ou/nQKC3TYTnia2aSdZjpWvl3g
 jVNQ88LepudTH/eUF43QKQEovH+vw6CHThdPoZsss8CZHQPHsWvylXtEtLiZwf+WQTlQ
 bNIQ5bq/Zl+da2fqi03lSd4L62oDa1FjwWhLA4YhKujdzN4/lCQaNo6EPdI42gUWXrve
 KiaYVZw5ct7gllZZEiJ+Hg/k5u36Ak7ZeOGc1NxrTqh+ay5QWpCjERXKZzOQ2Lmj7qSF
 vjCar+RuFd116hl9kU4jYUJf9C2rX72S/ExA7fcuNvu7jUGavohXXSV8ttyiLIcvMgwT
 kzKQ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Jack Xiao <Jack.Xiao@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMTcuMDYuMTkgdW0gMjE6MTAgc2NocmllYiBBbGV4IERldWNoZXI6Cj4gRnJvbTogSmFjayBY
aWFvIDxKYWNrLlhpYW9AYW1kLmNvbT4KPgo+IEFkZCBpYiBwcmVlbXB0aW9uIHN0YXR1cyBpbiBh
bWRncHVfam9iLCBzbyB0aGF0IHJpbmcgbGV2ZWwgZnVuY3Rpb24KPiBjYW4gZGV0ZWN0IHByZWVt
cHRpb24gYW5kIHByb2dyYW0gZm9yIHJlc3VtaW5nIGl0Lgo+Cj4gQWNrZWQtYnk6IEFsZXggRGV1
Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KPiBSZXZpZXdlZC1ieTogSGF3a2luZyBa
aGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEphY2sgWGlhbyA8
SmFjay5YaWFvQGFtZC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5k
ZXIuZGV1Y2hlckBhbWQuY29tPgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2liLmMgIHwgMiArLQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2pvYi5oIHwgMyArKysKPiAgIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2liLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfaWIuYwo+IGluZGV4
IGUxNTUzMWJmY2Q0Ny4uOTBjYzA4NDFiNTY0IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9pYi5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2liLmMKPiBAQCAtMjA4LDcgKzIwOCw3IEBAIGludCBhbWRncHVfaWJfc2NoZWR1
bGUoc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nLCB1bnNpZ25lZCBudW1faWJzLAo+ICAgCj4gICAJ
c2tpcF9wcmVhbWJsZSA9IHJpbmctPmN1cnJlbnRfY3R4ID09IGZlbmNlX2N0eDsKPiAgIAlpZiAo
am9iICYmIHJpbmctPmZ1bmNzLT5lbWl0X2NudHhjbnRsKSB7Cj4gLQkJc3RhdHVzIHw9IGpvYi0+
cHJlYW1ibGVfc3RhdHVzOwo+ICsJCXN0YXR1cyB8PSBqb2ItPnByZWVtcHRpb25fc3RhdHVzOwoK
VGhhdCBhY3R1YWxseSBsb29rcyBjb21wbGV0ZWx5IGluY29ycmVjdCB0byBtZSBzaW5jZSBpdCBi
cmVha3MgdGhlIG9sZCAKc3RhdHVzIGhhbmRsaW5nLgoKQ2hyaXN0aWFuLgoKPiAgIAkJYW1kZ3B1
X3JpbmdfZW1pdF9jbnR4Y250bChyaW5nLCBzdGF0dXMpOwo+ICAgCX0KPiAgIAo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfam9iLmggYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfam9iLmgKPiBpbmRleCBlMWI0NmE2NzAzZGUuLjUxZTYy
NTA0YzI3OSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
am9iLmgKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfam9iLmgKPiBA
QCAtMjksNiArMjksOCBAQAo+ICAgI2RlZmluZSBBTURHUFVfUFJFQU1CTEVfSUJfUFJFU0VOVF9G
SVJTVCAgICAoMSA8PCAxKQo+ICAgLyogYml0IHNldCBtZWFucyBjb250ZXh0IHN3aXRjaCBvY2N1
cmVkICovCj4gICAjZGVmaW5lIEFNREdQVV9IQVZFX0NUWF9TV0lUQ0ggICAgICAgICAgICAgICgx
IDw8IDIpCj4gKy8qIGJpdCBzZXQgbWVhbnMgSUIgaXMgcHJlZW1wdGVkICovCj4gKyNkZWZpbmUg
QU1ER1BVX0lCX1BSRUVNUFRFRCAgICAgICAgICAgICAgICAgKDEgPDwgMykKPiAgIAo+ICAgI2Rl
ZmluZSB0b19hbWRncHVfam9iKHNjaGVkX2pvYikJCVwKPiAgIAkJY29udGFpbmVyX29mKChzY2hl
ZF9qb2IpLCBzdHJ1Y3QgYW1kZ3B1X2pvYiwgYmFzZSkKPiBAQCAtNDUsNiArNDcsNyBAQCBzdHJ1
Y3QgYW1kZ3B1X2pvYiB7Cj4gICAJc3RydWN0IGFtZGdwdV9pYgkqaWJzOwo+ICAgCXN0cnVjdCBk
bWFfZmVuY2UJKmZlbmNlOyAvKiB0aGUgaHcgZmVuY2UgKi8KPiAgIAl1aW50MzJfdAkJcHJlYW1i
bGVfc3RhdHVzOwo+ICsJdWludDMyX3QgICAgICAgICAgICAgICAgcHJlZW1wdGlvbl9zdGF0dXM7
Cj4gICAJdWludDMyX3QJCW51bV9pYnM7Cj4gICAJdm9pZAkJCSpvd25lcjsKPiAgIAlib29sICAg
ICAgICAgICAgICAgICAgICB2bV9uZWVkc19mbHVzaDsKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeA==
