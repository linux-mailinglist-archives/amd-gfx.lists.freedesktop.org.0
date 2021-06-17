Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A43693AADEB
	for <lists+amd-gfx@lfdr.de>; Thu, 17 Jun 2021 09:44:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E7EA6E897;
	Thu, 17 Jun 2021 07:44:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AE136E0C8;
 Thu, 17 Jun 2021 07:44:28 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id l1so8233118ejb.6;
 Thu, 17 Jun 2021 00:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=mH6Np5gnCwiK1lKwW3Co42HomL1U87KMUL3SztR36D0=;
 b=O6HVJIih3Zbk/YXiCHGIsJpGQQ3J7RiozNFGNN5X2NaIXDWc2Pl2ksKE2VD60YldA8
 3+xTwHRC+7P7yZt/BBY2L3UMce4lYIfQxifhVya3/xvuN8eRFTh2I4FLf/wgGEDaBqmX
 WTcPY2lt7qhPEYAe8u20Lad4Jg7FYQSRQTBL3QAh5M8eh1aftkClZz4yIwKfm1F2WuJc
 cxCJa0BxA/sQqd7P5iwfbDtUGbG2r2FHm2o/PUUJjTclymFdgQesZ9DE6VVMBpcoWrCQ
 NQATqUYj+LuqP3H5k2IhLa4pLl3LUtl32QZ0O/OazF/8mNc+tUOem5ZDg2c0Ymz8NNjm
 3JhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=mH6Np5gnCwiK1lKwW3Co42HomL1U87KMUL3SztR36D0=;
 b=j0fTP9Ra9dd3pgyZmuo7fRCUIJoFJXt1aV1vX9NzawAaMeFLE8gcgFSUdT9aMISfgp
 MMOgo4xHOnaYUcnGIWR74Km9kNWIE/DlSYzQn8G2B+x18WBK8e6Q6bBd3o8U/OjgSFfD
 cyNFtoJz7qd0PSZjatl8f0+SzdpaHCHs0jJGbQ3/YlHXe0PKyEKQM8iSxEzwERhdU7v5
 1ZO490RTnL03ZEi4+wSvM0kIKPwjM9Vjivi1rEGr5o1DPxt6uHFx+Vf9RLV7ANibvI6L
 9f7X1rletqoEIOK7mIegFwGA88FiJNRKY5ZV9OtBgRkfRZUYlPPD8it0e7M/NFUSFqgJ
 xtXg==
X-Gm-Message-State: AOAM531vNgsxESY7WrCGuzxDNoXIM8DIMhnrCZFneApTLzvtTyDHw63j
 ZXIGD0QzawnDI3IdkLqbd5qrtmUG2Bc=
X-Google-Smtp-Source: ABdhPJz5GBYaJiiB5E/KPlx4CW2B0B2tIwjeqp+mel1rygGB/Rak9sbQgBV8xLzQzaXUXdVBsrG90w==
X-Received: by 2002:a17:907:2074:: with SMTP id
 qp20mr3826949ejb.35.1623915866870; 
 Thu, 17 Jun 2021 00:44:26 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:9a20:5ac9:ee4d:c186?
 ([2a02:908:1252:fb60:9a20:5ac9:ee4d:c186])
 by smtp.gmail.com with ESMTPSA id x9sm3316211ejc.37.2021.06.17.00.44.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jun 2021 00:44:26 -0700 (PDT)
Subject: Re: [PATCH 1/2] drm/amdgpu: unwrap fence chains in the explicit sync
 fence
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <Alexander.Deucher@amd.com>
References: <20210614174536.5188-1-christian.koenig@amd.com>
Message-ID: <c474a0e1-e725-be64-0730-57231b5a8d15@gmail.com>
Date: Thu, 17 Jun 2021 09:44:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210614174536.5188-1-christian.koenig@amd.com>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QWxleCBkbyB3YW50IHRvIHJldmlldyB0aG9zZSBzbyB0aGF0IHdlIGNhbiBjbG9zZSB0aGUgdGlj
a2V0PwoKVGhhbmtzLApDaHJpc3RpYW4uCgpBbSAxNC4wNi4yMSB1bSAxOTo0NSBzY2hyaWViIENo
cmlzdGlhbiBLw7ZuaWc6Cj4gVW53cmFwIHRoZSBleHBsaWNpdCBmZW5jZSBpZiBpdCBpcyBhIGRt
YV9mZW5jZV9jaGFpbiBhbmQKPiBzeW5jIHRvIHRoZSBmaXJzdCBmZW5jZSBub3QgbWF0Y2hpbmcg
dGhlIG93bmVyIHJ1bGVzLgo+Cj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hy
aXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IEFja2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwu
dmV0dGVyQGZmd2xsLmNoPgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3N5bmMuYyB8IDExOCArKysrKysrKysrKysrLS0tLS0tLS0tLQo+ICAgMSBmaWxlIGNoYW5n
ZWQsIDY4IGluc2VydGlvbnMoKyksIDUwIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9zeW5jLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfc3luYy5jCj4gaW5kZXggMWIyY2VjY2FmNWIwLi44NjJlYjNjMWM0
YzUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3N5bmMu
Ywo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9zeW5jLmMKPiBAQCAt
MjgsNiArMjgsOCBAQAo+ICAgICogICAgQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5p
Z0BhbWQuY29tPgo+ICAgICovCj4gICAKPiArI2luY2x1ZGUgPGxpbnV4L2RtYS1mZW5jZS1jaGFp
bi5oPgo+ICsKPiAgICNpbmNsdWRlICJhbWRncHUuaCIKPiAgICNpbmNsdWRlICJhbWRncHVfdHJh
Y2UuaCIKPiAgICNpbmNsdWRlICJhbWRncHVfYW1ka2ZkLmgiCj4gQEAgLTE4Niw2ICsxODgsNTUg
QEAgaW50IGFtZGdwdV9zeW5jX3ZtX2ZlbmNlKHN0cnVjdCBhbWRncHVfc3luYyAqc3luYywgc3Ry
dWN0IGRtYV9mZW5jZSAqZmVuY2UpCj4gICAJcmV0dXJuIGFtZGdwdV9zeW5jX2ZlbmNlKHN5bmMs
IGZlbmNlKTsKPiAgIH0KPiAgIAo+ICsvKiBEZXRlcm1pbmUgYmFzZWQgb24gdGhlIG93bmVyIGFu
ZCBtb2RlIGlmIHdlIHNob3VsZCBzeW5jIHRvIGEgZmVuY2Ugb3Igbm90ICovCj4gK3N0YXRpYyBi
b29sIGFtZGdwdV9zeW5jX3Rlc3RfZmVuY2Uoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCj4g
KwkJCQkgICBlbnVtIGFtZGdwdV9zeW5jX21vZGUgbW9kZSwKPiArCQkJCSAgIHZvaWQgKm93bmVy
LCBzdHJ1Y3QgZG1hX2ZlbmNlICpmKQo+ICt7Cj4gKwl2b2lkICpmZW5jZV9vd25lciA9IGFtZGdw
dV9zeW5jX2dldF9vd25lcihmKTsKPiArCj4gKwkvKiBBbHdheXMgc3luYyB0byBtb3Zlcywgbm8g
bWF0dGVyIHdoYXQgKi8KPiArCWlmIChmZW5jZV9vd25lciA9PSBBTURHUFVfRkVOQ0VfT1dORVJf
VU5ERUZJTkVEKQo+ICsJCXJldHVybiB0cnVlOwo+ICsKPiArCS8qIFdlIG9ubHkgd2FudCB0byB0
cmlnZ2VyIEtGRCBldmljdGlvbiBmZW5jZXMgb24KPiArCSAqIGV2aWN0IG9yIG1vdmUgam9icy4g
U2tpcCBLRkQgZmVuY2VzIG90aGVyd2lzZS4KPiArCSAqLwo+ICsJaWYgKGZlbmNlX293bmVyID09
IEFNREdQVV9GRU5DRV9PV05FUl9LRkQgJiYKPiArCSAgICBvd25lciAhPSBBTURHUFVfRkVOQ0Vf
T1dORVJfVU5ERUZJTkVEKQo+ICsJCXJldHVybiBmYWxzZTsKPiArCj4gKwkvKiBOZXZlciBzeW5j
IHRvIFZNIHVwZGF0ZXMgZWl0aGVyLiAqLwo+ICsJaWYgKGZlbmNlX293bmVyID09IEFNREdQVV9G
RU5DRV9PV05FUl9WTSAmJgo+ICsJICAgIG93bmVyICE9IEFNREdQVV9GRU5DRV9PV05FUl9VTkRF
RklORUQpCj4gKwkJcmV0dXJuIGZhbHNlOwo+ICsKPiArCS8qIElnbm9yZSBmZW5jZXMgZGVwZW5k
aW5nIG9uIHRoZSBzeW5jIG1vZGUgKi8KPiArCXN3aXRjaCAobW9kZSkgewo+ICsJY2FzZSBBTURH
UFVfU1lOQ19BTFdBWVM6Cj4gKwkJcmV0dXJuIHRydWU7Cj4gKwo+ICsJY2FzZSBBTURHUFVfU1lO
Q19ORV9PV05FUjoKPiArCQlpZiAoYW1kZ3B1X3N5bmNfc2FtZV9kZXYoYWRldiwgZikgJiYKPiAr
CQkgICAgZmVuY2Vfb3duZXIgPT0gb3duZXIpCj4gKwkJCXJldHVybiBmYWxzZTsKPiArCQlicmVh
azsKPiArCj4gKwljYXNlIEFNREdQVV9TWU5DX0VRX09XTkVSOgo+ICsJCWlmIChhbWRncHVfc3lu
Y19zYW1lX2RldihhZGV2LCBmKSAmJgo+ICsJCSAgICBmZW5jZV9vd25lciAhPSBvd25lcikKPiAr
CQkJcmV0dXJuIGZhbHNlOwo+ICsJCWJyZWFrOwo+ICsKPiArCWNhc2UgQU1ER1BVX1NZTkNfRVhQ
TElDSVQ6Cj4gKwkJcmV0dXJuIGZhbHNlOwo+ICsJfQo+ICsKPiArCVdBUk4oZGVidWdfZXZpY3Rp
b25zICYmIGZlbmNlX293bmVyID09IEFNREdQVV9GRU5DRV9PV05FUl9LRkQsCj4gKwkgICAgICJB
ZGRpbmcgZXZpY3Rpb24gZmVuY2UgdG8gc3luYyBvYmoiKTsKPiArCXJldHVybiB0cnVlOwo+ICt9
Cj4gKwo+ICAgLyoqCj4gICAgKiBhbWRncHVfc3luY19yZXN2IC0gc3luYyB0byBhIHJlc2VydmF0
aW9uIG9iamVjdAo+ICAgICoKPiBAQCAtMjExLDY3ICsyNjIsMzQgQEAgaW50IGFtZGdwdV9zeW5j
X3Jlc3Yoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHN0cnVjdCBhbWRncHVfc3luYyAqc3lu
YywKPiAgIAo+ICAgCS8qIGFsd2F5cyBzeW5jIHRvIHRoZSBleGNsdXNpdmUgZmVuY2UgKi8KPiAg
IAlmID0gZG1hX3Jlc3ZfZXhjbF9mZW5jZShyZXN2KTsKPiAtCXIgPSBhbWRncHVfc3luY19mZW5j
ZShzeW5jLCBmKTsKPiArCWRtYV9mZW5jZV9jaGFpbl9mb3JfZWFjaChmLCBmKSB7Cj4gKwkJc3Ry
dWN0IGRtYV9mZW5jZV9jaGFpbiAqY2hhaW4gPSB0b19kbWFfZmVuY2VfY2hhaW4oZik7Cj4gKwo+
ICsJCWlmIChhbWRncHVfc3luY190ZXN0X2ZlbmNlKGFkZXYsIG1vZGUsIG93bmVyLCBjaGFpbiA/
Cj4gKwkJCQkJICAgY2hhaW4tPmZlbmNlIDogZikpIHsKPiArCQkJciA9IGFtZGdwdV9zeW5jX2Zl
bmNlKHN5bmMsIGYpOwo+ICsJCQlkbWFfZmVuY2VfcHV0KGYpOwo+ICsJCQlpZiAocikKPiArCQkJ
CXJldHVybiByOwo+ICsJCQlicmVhazsKPiArCQl9Cj4gKwl9Cj4gICAKPiAgIAlmbGlzdCA9IGRt
YV9yZXN2X3NoYXJlZF9saXN0KHJlc3YpOwo+IC0JaWYgKCFmbGlzdCB8fCByKQo+IC0JCXJldHVy
biByOwo+ICsJaWYgKCFmbGlzdCkKPiArCQlyZXR1cm4gMDsKPiAgIAo+ICAgCWZvciAoaSA9IDA7
IGkgPCBmbGlzdC0+c2hhcmVkX2NvdW50OyArK2kpIHsKPiAtCQl2b2lkICpmZW5jZV9vd25lcjsK
PiAtCj4gICAJCWYgPSByY3VfZGVyZWZlcmVuY2VfcHJvdGVjdGVkKGZsaXN0LT5zaGFyZWRbaV0s
Cj4gICAJCQkJCSAgICAgIGRtYV9yZXN2X2hlbGQocmVzdikpOwo+ICAgCj4gLQkJZmVuY2Vfb3du
ZXIgPSBhbWRncHVfc3luY19nZXRfb3duZXIoZik7Cj4gLQo+IC0JCS8qIEFsd2F5cyBzeW5jIHRv
IG1vdmVzLCBubyBtYXR0ZXIgd2hhdCAqLwo+IC0JCWlmIChmZW5jZV9vd25lciA9PSBBTURHUFVf
RkVOQ0VfT1dORVJfVU5ERUZJTkVEKSB7Cj4gKwkJaWYgKGFtZGdwdV9zeW5jX3Rlc3RfZmVuY2Uo
YWRldiwgbW9kZSwgb3duZXIsIGYpKSB7Cj4gICAJCQlyID0gYW1kZ3B1X3N5bmNfZmVuY2Uoc3lu
YywgZik7Cj4gICAJCQlpZiAocikKPiAtCQkJCWJyZWFrOwo+IC0JCX0KPiAtCj4gLQkJLyogV2Ug
b25seSB3YW50IHRvIHRyaWdnZXIgS0ZEIGV2aWN0aW9uIGZlbmNlcyBvbgo+IC0JCSAqIGV2aWN0
IG9yIG1vdmUgam9icy4gU2tpcCBLRkQgZmVuY2VzIG90aGVyd2lzZS4KPiAtCQkgKi8KPiAtCQlp
ZiAoZmVuY2Vfb3duZXIgPT0gQU1ER1BVX0ZFTkNFX09XTkVSX0tGRCAmJgo+IC0JCSAgICBvd25l
ciAhPSBBTURHUFVfRkVOQ0VfT1dORVJfVU5ERUZJTkVEKQo+IC0JCQljb250aW51ZTsKPiAtCj4g
LQkJLyogTmV2ZXIgc3luYyB0byBWTSB1cGRhdGVzIGVpdGhlci4gKi8KPiAtCQlpZiAoZmVuY2Vf
b3duZXIgPT0gQU1ER1BVX0ZFTkNFX09XTkVSX1ZNICYmCj4gLQkJICAgIG93bmVyICE9IEFNREdQ
VV9GRU5DRV9PV05FUl9VTkRFRklORUQpCj4gLQkJCWNvbnRpbnVlOwo+IC0KPiAtCQkvKiBJZ25v
cmUgZmVuY2VzIGRlcGVuZGluZyBvbiB0aGUgc3luYyBtb2RlICovCj4gLQkJc3dpdGNoIChtb2Rl
KSB7Cj4gLQkJY2FzZSBBTURHUFVfU1lOQ19BTFdBWVM6Cj4gLQkJCWJyZWFrOwo+IC0KPiAtCQlj
YXNlIEFNREdQVV9TWU5DX05FX09XTkVSOgo+IC0JCQlpZiAoYW1kZ3B1X3N5bmNfc2FtZV9kZXYo
YWRldiwgZikgJiYKPiAtCQkJICAgIGZlbmNlX293bmVyID09IG93bmVyKQo+IC0JCQkJY29udGlu
dWU7Cj4gLQkJCWJyZWFrOwo+IC0KPiAtCQljYXNlIEFNREdQVV9TWU5DX0VRX09XTkVSOgo+IC0J
CQlpZiAoYW1kZ3B1X3N5bmNfc2FtZV9kZXYoYWRldiwgZikgJiYKPiAtCQkJICAgIGZlbmNlX293
bmVyICE9IG93bmVyKQo+IC0JCQkJY29udGludWU7Cj4gLQkJCWJyZWFrOwo+IC0KPiAtCQljYXNl
IEFNREdQVV9TWU5DX0VYUExJQ0lUOgo+IC0JCQljb250aW51ZTsKPiArCQkJCXJldHVybiByOwo+
ICAgCQl9Cj4gLQo+IC0JCVdBUk4oZGVidWdfZXZpY3Rpb25zICYmIGZlbmNlX293bmVyID09IEFN
REdQVV9GRU5DRV9PV05FUl9LRkQsCj4gLQkJICAgICAiQWRkaW5nIGV2aWN0aW9uIGZlbmNlIHRv
IHN5bmMgb2JqIik7Cj4gLQkJciA9IGFtZGdwdV9zeW5jX2ZlbmNlKHN5bmMsIGYpOwo+IC0JCWlm
IChyKQo+IC0JCQlicmVhazsKPiAgIAl9Cj4gLQlyZXR1cm4gcjsKPiArCXJldHVybiAwOwo+ICAg
fQo+ICAgCj4gICAvKioKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeAo=
