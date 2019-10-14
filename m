Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1A8D5E21
	for <lists+amd-gfx@lfdr.de>; Mon, 14 Oct 2019 11:06:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E56A6E15A;
	Mon, 14 Oct 2019 09:06:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FED16E15A
 for <amd-gfx@lists.freedesktop.org>; Mon, 14 Oct 2019 09:06:51 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id a6so16349927wma.5
 for <amd-gfx@lists.freedesktop.org>; Mon, 14 Oct 2019 02:06:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=wIE6CbXaW4CY4lVEDSULOmID2g489rTGBD8UnWEp8/g=;
 b=UYKXXIhjjNJKdGJB2FodQD0Da6FiByZfoN9BGt3OeO/J8BOtmIspJ5VCQj+Ap4VBld
 +BhVNSgV3kCS1qbDS/wCmUXmavU8PQ2ary87lTgrcElPmW7jpUxGlFWsN0eSxpbVYLB4
 bWyFk4iscPSsxxsoJ6qRHeLgXkNyWG7qhaJx27H73hKdZsTMeAYzvDO3rfIsPGxY5JtN
 k2jYoWAK/rl8Eew/xGWDF3VWBnsBeANsC1HPU1kIv56aOKVg2YYg3iM0xFofM3unZgvA
 J3t/ENvL7aSZOng9Bh/Ek64wJTUAcBbQe3ZqTgv6T1jlFgdMYtq9VPhx5tYJSgPqPgnK
 F1IQ==
X-Gm-Message-State: APjAAAUpYlxfDLauSEx4BGuEKigV65XeWnjbltxhp/oq45rVzs+hCKzO
 G19bQBKGkwwECu8auEJA4NQZCITn
X-Google-Smtp-Source: APXvYqxmSkNGvNldiCgwAx7TJ9Na5SncwLX1N6/OFmeBxOEMcM/yg/+VWMV4va2hYbRSAX0r3JNlmA==
X-Received: by 2002:a7b:c4cf:: with SMTP id g15mr13299660wmk.122.1571044010028; 
 Mon, 14 Oct 2019 02:06:50 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id a13sm48539735wrf.73.2019.10.14.02.06.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 14 Oct 2019 02:06:49 -0700 (PDT)
Subject: Re: [PATCH 1/2] drm/amdgpu/uvd6: fix allocation size in enc ring test
To: Alex Deucher <alexdeucher@gmail.com>, amd-gfx@lists.freedesktop.org
References: <20191011205050.21021-1-alexander.deucher@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <990fccc3-f8a1-a1dc-52c6-5299c645c24a@gmail.com>
Date: Mon, 14 Oct 2019 11:06:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191011205050.21021-1-alexander.deucher@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=wIE6CbXaW4CY4lVEDSULOmID2g489rTGBD8UnWEp8/g=;
 b=EknbsskBNpTslaSvKJq8MgdqroD3hy2pnBxQNuilhcrZQ+qVdW8lgdizyRcR3QPpN8
 m73jKFcxEGWJZm8Nn6lKn1AGPCe/1ipqhLIbi8jklaig9vHFttQnIwAJxFeafIObKJkU
 9i7rH0BOyxPCveR0jwc+KcwgbSAcKmHro+uphAoMVc2hW1iFcY8HFcB3Zs5Wa8vKapoh
 3Qb51GZhDkL/yJlJTf8qizLl/fVLpooQCQdU68fnWUMBmicCWMlnMzEgnWKlUe2ym6tQ
 MHDdmXTfCOqOZdhWiKjqUYx0e53CRVYtiz9AYyN4IXcurzajX1ybqklUHbAsLKtSlqlq
 PJ7Q==
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMTEuMTAuMTkgdW0gMjI6NTAgc2NocmllYiBBbGV4IERldWNoZXI6Cj4gV2UgbmVlZCB0byBh
bGxvY2F0ZSBhIGxhcmdlIGVub3VnaCBidWZmZXIgZm9yIHRoZQo+IHNlc3Npb24gaW5mbywgb3Ro
ZXJ3aXNlIHRoZSBJQiB0ZXN0IGNhbiBvdmVyd3JpdGUKPiBvdGhlciBtZW1vcnkuCj4KPiBCdWc6
IGh0dHBzOi8vYnVnemlsbGEua2VybmVsLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MjA0MjQxCj4gU2ln
bmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgoKQWNr
ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4gZm9yIHRo
ZSBzZXJpZXMuCgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdXZkX3Y2XzAu
YyB8IDggKysrKy0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVs
ZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdXZk
X3Y2XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3V2ZF92Nl8wLmMKPiBpbmRleCA2
NzA3ODRhNzg1MTIuLjkwOWJjMmNlNzkxZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS91dmRfdjZfMC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
dXZkX3Y2XzAuYwo+IEBAIC0yMTUsMTIgKzIxNSwxMiBAQCBzdGF0aWMgaW50IHV2ZF92Nl8wX2Vu
Y19nZXRfY3JlYXRlX21zZyhzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsIHVpbnQzMl90IGhhbmRs
ZQo+ICAgCXVpbnQ2NF90IGR1bW15Owo+ICAgCWludCBpLCByOwo+ICAgCj4gLQlyID0gYW1kZ3B1
X2pvYl9hbGxvY193aXRoX2liKHJpbmctPmFkZXYsIGliX3NpemVfZHcgKiA0LCAmam9iKTsKPiAr
CXIgPSBhbWRncHVfam9iX2FsbG9jX3dpdGhfaWIocmluZy0+YWRldiwgKGliX3NpemVfZHcgKiA0
KSArIDEwMjQsICZqb2IpOwo+ICAgCWlmIChyKQo+ICAgCQlyZXR1cm4gcjsKPiAgIAo+ICAgCWli
ID0gJmpvYi0+aWJzWzBdOwo+IC0JZHVtbXkgPSBpYi0+Z3B1X2FkZHIgKyAxMDI0Owo+ICsJZHVt
bXkgPSBpYi0+Z3B1X2FkZHIgKyAoaWJfc2l6ZV9kdyAqIDQpOwo+ICAgCj4gICAJaWItPmxlbmd0
aF9kdyA9IDA7Cj4gICAJaWItPnB0cltpYi0+bGVuZ3RoX2R3KytdID0gMHgwMDAwMDAxODsKPiBA
QCAtMjc3LDEyICsyNzcsMTIgQEAgc3RhdGljIGludCB1dmRfdjZfMF9lbmNfZ2V0X2Rlc3Ryb3lf
bXNnKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZywKPiAgIAl1aW50NjRfdCBkdW1teTsKPiAgIAlp
bnQgaSwgcjsKPiAgIAo+IC0JciA9IGFtZGdwdV9qb2JfYWxsb2Nfd2l0aF9pYihyaW5nLT5hZGV2
LCBpYl9zaXplX2R3ICogNCwgJmpvYik7Cj4gKwlyID0gYW1kZ3B1X2pvYl9hbGxvY193aXRoX2li
KHJpbmctPmFkZXYsIChpYl9zaXplX2R3ICogNCkgKyAxMDI0LCAmam9iKTsKPiAgIAlpZiAocikK
PiAgIAkJcmV0dXJuIHI7Cj4gICAKPiAgIAlpYiA9ICZqb2ItPmlic1swXTsKPiAtCWR1bW15ID0g
aWItPmdwdV9hZGRyICsgMTAyNDsKPiArCWR1bW15ID0gaWItPmdwdV9hZGRyICsgKGliX3NpemVf
ZHcgKiA0KTsKPiAgIAo+ICAgCWliLT5sZW5ndGhfZHcgPSAwOwo+ICAgCWliLT5wdHJbaWItPmxl
bmd0aF9kdysrXSA9IDB4MDAwMDAwMTg7CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2FtZC1nZng=
