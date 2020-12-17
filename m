Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A122DD2F7
	for <lists+amd-gfx@lfdr.de>; Thu, 17 Dec 2020 15:25:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF5A589321;
	Thu, 17 Dec 2020 14:25:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E401989321
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Dec 2020 14:25:04 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id j16so6386051edr.0
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Dec 2020 06:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=ZS8iuRsxovBjtLOrjeb7Iog7OJulCvQjDwUOITim+nE=;
 b=X1dLEg53wCiemeDo0kRomPzF37YZRfRiCvISsJglWWUDg0phNoxWRbDYEn56NLD+Kt
 /lNnfWVOlf8mvrZBR9kf0BDb2b0QgmAkPta5WHiMZTTuMDOqZ/ZRmxsl6VGVjJJy9inp
 RZqrVHQ1GEDVyqdlspoGl2zRTzhUx/bI4hIy8vsVT9m8EBRtNQYRyXvE7wiNffR/rxdH
 meeYsHgCNSnSald1yOtTmCg0/hSKV2rMFRW2ZQa/XqDhiRHRSbVjj6GTALlNqoZzg45u
 Mcx8F8zgWTNZyaipT5PUhoYiJCtV6nOHVb9XitnW3Bey0R5k3LG9SvMpvqLoPuS5GZ2T
 MoEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=ZS8iuRsxovBjtLOrjeb7Iog7OJulCvQjDwUOITim+nE=;
 b=c4GkdUh15zLHJhDusWcrhL2ErJx3R8jNFCjWFT5oABa6rAnk5ycpF6r4HFnVj4NLmm
 uPkO9EmuKBUEs+Vq8OTk8AZrZ4cjLZw1ra9gCRlX7uqzFr0O09TTY9GL5Rc5S8UJxngX
 ORyIxViZG4k7ejfeURPbumisWWKPs+CkRbiZoW7A7BLX7SHDvV2nFMsNl6+Tq5U7S2Is
 xxZULxLn/CUQB7DJ9HXxmc1NAYp29wvPn+7BN5d91U5i2aGuDZ/61jKbN2wNQP6P1mh0
 gvRvGQ4qfyRBYAde+6t0eZd4E4sKNGAMPOmmI3PpRA++EzjBmS2tqcyC6tz0/ChQJgoN
 0A2w==
X-Gm-Message-State: AOAM533WxZ7hdGivUFXovahLV9jd+3f1vY77355D0hLJZbVf+7BVRS8q
 wKf7SbZkq+hMkAtg+LCB9NxN8vMHCM0=
X-Google-Smtp-Source: ABdhPJwTtAdAhXVG2aTqmGh5OQu/MB2TlKLtPYN6yKjOm41TbN/arxuxiEV/2Rqh82PBYzhAGd5+Tw==
X-Received: by 2002:aa7:d459:: with SMTP id q25mr38400262edr.279.1608215103513; 
 Thu, 17 Dec 2020 06:25:03 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id k17sm3765255ejj.1.2020.12.17.06.25.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Dec 2020 06:25:02 -0800 (PST)
Subject: Re: [PATCH v2 1/1] drm/amdgpu: clean up bo in vce and vcn test
To: Nirmoy <nirmodas@amd.com>, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>, Nirmoy Das <nirmoy.das@amd.com>,
 amd-gfx@lists.freedesktop.org
References: <772be2aa-56f0-14d5-3de4-343c556e1dc2@gmail.com>
 <20201208185916.4569-1-nirmoy.das@amd.com>
 <2823362e-9a76-b3f7-6d26-7143d7a8f40c@amd.com>
 <612b0789-81cf-4347-fc80-d5f64b7e3432@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <20b2f767-46b3-468e-8fe3-56e431999429@gmail.com>
Date: Thu, 17 Dec 2020 15:25:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <612b0789-81cf-4347-fc80-d5f64b7e3432@amd.com>
Content-Language: en-US
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
Reply-To: christian.koenig@amd.com
Cc: alexander.deucher@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMDguMTIuMjAgdW0gMjA6Mzkgc2NocmllYiBOaXJtb3k6Cj4KPiBPbiAxMi84LzIwIDg6MDQg
UE0sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+IEFtIDA4LjEyLjIwIHVtIDE5OjU5IHNjaHJp
ZWIgTmlybW95IERhczoKPj4+IEJPIGNyZWF0ZWQgd2l0aCBhbWRncHVfYm9fY3JlYXRlX3Jlc2Vy
dmVkKCkgd2Fzbid0IGNsZWFuCj4+PiBwcm9wZXJseSBiZWZvcmUsIHdoaWNoIGNhdXNlczoKPj4+
Cj4+PiBbwqDCoCAyMS4wNTYyMThdIFdBUk5JTkc6IENQVTogMCBQSUQ6IDcgYXQgCj4+PiBkcml2
ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jOjUxOCB0dG1fYm9fcmVsZWFzZSsweDJiZi8weDMxMCBb
dHRtXQo+Pj4gPHNuaXA+Cj4+PiBbwqDCoCAyMS4wNTY0MzBdIENhbGwgVHJhY2U6Cj4+PiBbwqDC
oCAyMS4wNTY1MjVdwqAgYW1kZ3B1X2JvX3VucmVmKzB4MWEvMHgzMCBbYW1kZ3B1XQo+Pj4gW8Kg
wqAgMjEuMDU2NjM1XcKgIGFtZGdwdV92Y25fZGVjX3NlbmRfbXNnKzB4MWIyLzB4MjcwIFthbWRn
cHVdCj4+PiBbwqDCoCAyMS4wNTY3NDBdIGFtZGdwdV92Y25fZGVjX2dldF9jcmVhdGVfbXNnLmNv
bnN0cHJvcC4wKzB4ZDgvMHgxMDAgCj4+PiBbYW1kZ3B1XQo+Pj4gW8KgwqAgMjEuMDU2ODQzXcKg
IGFtZGdwdV92Y25fZGVjX3JpbmdfdGVzdF9pYisweDI3LzB4MTgwIFthbWRncHVdCj4+PiBbwqDC
oCAyMS4wNTY5MzZdwqAgYW1kZ3B1X2liX3JpbmdfdGVzdHMrMHhmMS8weDE1MCBbYW1kZ3B1XQo+
Pj4gW8KgwqAgMjEuMDU3MDI0XSBhbWRncHVfZGV2aWNlX2RlbGF5ZWRfaW5pdF93b3JrX2hhbmRs
ZXIrMHgxMS8weDMwIAo+Pj4gW2FtZGdwdV0KPj4+IFvCoMKgIDIxLjA1NzAzMF3CoCBwcm9jZXNz
X29uZV93b3JrKzB4MWRmLzB4MzcwCj4+PiBbwqDCoCAyMS4wNTcwMzNdwqAgd29ya2VyX3RocmVh
ZCsweDQ2LzB4MzQwCj4+PiBbwqDCoCAyMS4wNTcwMzRdwqAgPyBwcm9jZXNzX29uZV93b3JrKzB4
MzcwLzB4MzcwCj4+PiBbwqDCoCAyMS4wNTcwMzddwqAga3RocmVhZCsweDExYi8weDE0MAo+Pj4g
W8KgwqAgMjEuMDU3MDM5XcKgID8gX19rdGhyZWFkX2JpbmRfbWFzaysweDYwLzB4NjAKPj4+IFvC
oMKgIDIxLjA1NzA0M13CoCByZXRfZnJvbV9mb3JrKzB4MjIvMHgzMAo+Pj4KPj4+IFNpZ25lZC1v
ZmYtYnk6IE5pcm1veSBEYXMgPG5pcm1veS5kYXNAYW1kLmNvbT4KPj4KPj4gQXQgc29tZSBwb2lu
dCB3ZSBzaG91bGQgcHJvYmFibHkgc3dpdGNoIHRvIHVzaW5nIGFuIFNBIEJPIGFuZCBzdG9wIAo+
PiB0aGlzIG1lc3MgaGVyZS4KPgo+Cj4gSSB3aWxsIGxvb2sgaW50byB0aGlzLgoKUGxlYXNlIGxl
YXZlIG1lIGEgbm90ZSB3aGVuIHlvdSBjYW4gZG8gdGhpcyBzaW5jZSB3ZSBzdHVtYmxlZCBpbnRv
IApwcm9ibGVtcyB3aXRoIHRoYXQuCgpUaGFua3MsCkNocmlzdGlhbi4KCj4+IEJ1dCBmb3Igbm93
IHRoZSBwYXRjaCBpcyBSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyAKPj4gPGNocmlzdGlh
bi5rb2VuaWdAYW1kLmNvbT4KPgo+IFRoYW5rcywKPgo+IE5pcm1veQo+Cj4+Cj4+PiAtLS0KPj4+
IMKgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y2UuYyB8IDIgKy0KPj4+IMKg
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y24uYyB8IDkgKysrKysrLS0tCj4+
PiDCoCAyIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPj4+
Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZjZS5j
IAo+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmNlLmMKPj4+IGluZGV4
IGVjYWEyZDc0ODNiMi4uNzhhNGRkOWJmMTFmIDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZjZS5jCj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfdmNlLmMKPj4+IEBAIC0xMTUxLDYgKzExNTEsNiBAQCBpbnQgYW1kZ3B1
X3ZjZV9yaW5nX3Rlc3RfaWIoc3RydWN0IGFtZGdwdV9yaW5nIAo+Pj4gKnJpbmcsIGxvbmcgdGlt
ZW91dCkKPj4+IMKgIGVycm9yOgo+Pj4gwqDCoMKgwqDCoCBkbWFfZmVuY2VfcHV0KGZlbmNlKTsK
Pj4+IMKgwqDCoMKgwqAgYW1kZ3B1X2JvX3VucmVzZXJ2ZShibyk7Cj4+PiAtwqDCoMKgIGFtZGdw
dV9ib191bnJlZigmYm8pOwo+Pj4gK8KgwqDCoCBhbWRncHVfYm9fZnJlZV9rZXJuZWwoJmJvLCBO
VUxMLCBOVUxMKTsKPj4+IMKgwqDCoMKgwqAgcmV0dXJuIHI7Cj4+PiDCoCB9Cj4+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zjbi5jIAo+Pj4gYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmNuLmMKPj4+IGluZGV4IDdlMTlhNjY1Njcx
NS4uOTIxYjgxMDU0YzFiIDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3Zjbi5jCj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfdmNuLmMKPj4+IEBAIC00NjUsNiArNDY1LDcgQEAgc3RhdGljIGludCBhbWRncHVfdmNuX2Rl
Y19zZW5kX21zZyhzdHJ1Y3QgCj4+PiBhbWRncHVfcmluZyAqcmluZywKPj4+IMKgwqDCoMKgwqAg
c3RydWN0IGFtZGdwdV9qb2IgKmpvYjsKPj4+IMKgwqDCoMKgwqAgc3RydWN0IGFtZGdwdV9pYiAq
aWI7Cj4+PiDCoMKgwqDCoMKgIHVpbnQ2NF90IGFkZHI7Cj4+PiArwqDCoMKgIHZvaWQgKm1zZyA9
IE5VTEw7Cj4+PiDCoMKgwqDCoMKgIGludCBpLCByOwo+Pj4gwqAgwqDCoMKgwqDCoCByID0gYW1k
Z3B1X2pvYl9hbGxvY193aXRoX2liKGFkZXYsIDY0LAo+Pj4gQEAgLTQ3NCw2ICs0NzUsNyBAQCBz
dGF0aWMgaW50IGFtZGdwdV92Y25fZGVjX3NlbmRfbXNnKHN0cnVjdCAKPj4+IGFtZGdwdV9yaW5n
ICpyaW5nLAo+Pj4gwqAgwqDCoMKgwqDCoCBpYiA9ICZqb2ItPmlic1swXTsKPj4+IMKgwqDCoMKg
wqAgYWRkciA9IGFtZGdwdV9ib19ncHVfb2Zmc2V0KGJvKTsKPj4+ICvCoMKgwqAgbXNnID0gYW1k
Z3B1X2JvX2twdHIoYm8pOwo+Pj4gwqDCoMKgwqDCoCBpYi0+cHRyWzBdID0gUEFDS0VUMChhZGV2
LT52Y24uaW50ZXJuYWwuZGF0YTAsIDApOwo+Pj4gwqDCoMKgwqDCoCBpYi0+cHRyWzFdID0gYWRk
cjsKPj4+IMKgwqDCoMKgwqAgaWItPnB0clsyXSA9IFBBQ0tFVDAoYWRldi0+dmNuLmludGVybmFs
LmRhdGExLCAwKTsKPj4+IEBAIC00OTIsNyArNDk0LDcgQEAgc3RhdGljIGludCBhbWRncHVfdmNu
X2RlY19zZW5kX21zZyhzdHJ1Y3QgCj4+PiBhbWRncHVfcmluZyAqcmluZywKPj4+IMKgIMKgwqDC
oMKgwqAgYW1kZ3B1X2JvX2ZlbmNlKGJvLCBmLCBmYWxzZSk7Cj4+PiDCoMKgwqDCoMKgIGFtZGdw
dV9ib191bnJlc2VydmUoYm8pOwo+Pj4gLcKgwqDCoCBhbWRncHVfYm9fdW5yZWYoJmJvKTsKPj4+
ICvCoMKgwqAgYW1kZ3B1X2JvX2ZyZWVfa2VybmVsKCZibywgTlVMTCwgKHZvaWQgKiopJm1zZyk7
Cj4+PiDCoCDCoMKgwqDCoMKgIGlmIChmZW5jZSkKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCAqZmVu
Y2UgPSBkbWFfZmVuY2VfZ2V0KGYpOwo+Pj4gQEAgLTUwNSw3ICs1MDcsNyBAQCBzdGF0aWMgaW50
IGFtZGdwdV92Y25fZGVjX3NlbmRfbXNnKHN0cnVjdCAKPj4+IGFtZGdwdV9yaW5nICpyaW5nLAo+
Pj4gwqAgwqAgZXJyOgo+Pj4gwqDCoMKgwqDCoCBhbWRncHVfYm9fdW5yZXNlcnZlKGJvKTsKPj4+
IC3CoMKgwqAgYW1kZ3B1X2JvX3VucmVmKCZibyk7Cj4+PiArwqDCoMKgIGFtZGdwdV9ib19mcmVl
X2tlcm5lbCgmYm8sIE5VTEwsICh2b2lkICoqKSZtc2cpOwo+Pj4gwqDCoMKgwqDCoCByZXR1cm4g
cjsKPj4+IMKgIH0KPj4+IMKgIEBAIC03NjEsNiArNzYzLDcgQEAgaW50IGFtZGdwdV92Y25fZW5j
X3JpbmdfdGVzdF9pYihzdHJ1Y3QgCj4+PiBhbWRncHVfcmluZyAqcmluZywgbG9uZyB0aW1lb3V0
KQo+Pj4gwqAgZXJyb3I6Cj4+PiDCoMKgwqDCoMKgIGRtYV9mZW5jZV9wdXQoZmVuY2UpOwo+Pj4g
wqDCoMKgwqDCoCBhbWRncHVfYm9fdW5yZXNlcnZlKGJvKTsKPj4+IC3CoMKgwqAgYW1kZ3B1X2Jv
X3VucmVmKCZibyk7Cj4+PiArwqDCoMKgIGFtZGdwdV9ib19mcmVlX2tlcm5lbCgmYm8sIE5VTEws
IE5VTEwpOwo+Pj4gKwo+Pj4gwqDCoMKgwqDCoCByZXR1cm4gcjsKPj4+IMKgIH0KPj4KPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGFtZC1nZnggbWFp
bGluZyBsaXN0Cj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeAo=
