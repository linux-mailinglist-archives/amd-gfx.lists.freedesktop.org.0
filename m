Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DFC2A1265
	for <lists+amd-gfx@lfdr.de>; Thu, 29 Aug 2019 09:13:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E59F89FBC;
	Thu, 29 Aug 2019 07:13:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9965589FBC
 for <amd-gfx@lists.freedesktop.org>; Thu, 29 Aug 2019 07:13:16 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id d16so2606302wme.2
 for <amd-gfx@lists.freedesktop.org>; Thu, 29 Aug 2019 00:13:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=DVPuR0Wt57dxa8dzxvJYHaof9nRdOTTRHKbLfRNSBEw=;
 b=sqyOGxhw/hMuTW2NUVOJq4TmtPaF/ZuNMqe6hUq2FKAeaHqj87VkLRxF6qta8Dcdv0
 iK3+JEW3O7x34GEY5+CNdJ7a6E9w3R8apyUn0LIoUEyHqvnBFSzzIVvN8hXo0uclUgIi
 8UY9Qu/Qeyso6vdwBZsO26V1X2yQReUnkDSkgUHwwoYsWbmAm+J/WAd7MYD22zJ+vXrL
 1a/Bwmt2/M1hSFq3lBCSxsC0mgCBFHsdua0cZG4gyL2i54/Ap/eQsYBWNX+tGCnaYR/1
 8sEkQKPvcKimuNA9knpkZZChe0PukQGBv82wMsBoL8ZZ5c9h5IoIrTiV0y46CqQCAWK+
 lDeg==
X-Gm-Message-State: APjAAAUH+NAmvtNHNMb8gcUlOHb3c911Rea5FO8dvdFOl2NSJtegzIOM
 a1S6J2kXufrAzR3SXGjXLWc=
X-Google-Smtp-Source: APXvYqxgQ/66Pa5FePlmKkxKm1nYJyDlWm+lHEhQ0lx4xVRdpccLLPKU7qkQRp3cJQdgQmGa6i5A8g==
X-Received: by 2002:a7b:cb11:: with SMTP id u17mr9301407wmj.17.1567062795240; 
 Thu, 29 Aug 2019 00:13:15 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id c12sm1376110wrx.46.2019.08.29.00.13.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 29 Aug 2019 00:13:14 -0700 (PDT)
Subject: Re: [PATCH 2/2] drm/amdgpu: keep the stolen memory in visible vram
 region
To: Tianci Yin <tianci.yin@amd.com>, amd-gfx@lists.freedesktop.org
References: <1567047930-11912-1-git-send-email-tianci.yin@amd.com>
 <1567047930-11912-2-git-send-email-tianci.yin@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <5e5b0214-0e50-1a6d-f7f2-54317e5767c4@gmail.com>
Date: Thu, 29 Aug 2019 09:13:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1567047930-11912-2-git-send-email-tianci.yin@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=DVPuR0Wt57dxa8dzxvJYHaof9nRdOTTRHKbLfRNSBEw=;
 b=OY9JP+HAP3jSujfr8bwkurLoXNqhqipCioaVtt4oDqf7BROpGiV5C5/ytP9FTkEkkN
 SgJRCljvS/IB0SIWL0eR4KJLDcov7wGfYj3YUnYoFNykdHpua7MBEijCjt68nDkpBpaH
 0oZvWFwn1ER7tBrfU4/MmiOv/SAMex2pKRVajOspGvFXs0z+wM2vlmCFiUE5CBdwnF3y
 bQ4mdhBm62qAxAtO3LiwR2Nntrp5H7vXMCLCYGTT/+2G6HLXuwHj/PP7cr2dtkrzvGfa
 ZcakAeSVOgRegRz1MFjYrfk9s8lgbRneFVkIVUN586CdLTQyR0N4EIM2bgHDfjiFaIqx
 u1DQ==
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
Cc: Feifei Xu <Feifei.Xu@amd.com>, Jack Xiao <Jack.Xiao@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>, "Le . Ma" <Le.Ma@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMjkuMDguMTkgdW0gMDU6MDUgc2NocmllYiBUaWFuY2kgWWluOgo+IEZyb206ICJUaWFuY2ku
WWluIiA8dGlhbmNpLnlpbkBhbWQuY29tPgo+Cj4gc3RvbGVuIG1lbW9yeSBzaG91bGQgYmUgZml4
ZWQgaW4gdmlzaWJsZSByZWdpb24uCj4KPiBDaGFuZ2UtSWQ6IEljYmJiZDM5ZmQxMTNlOTM0MjNh
YWQ4ZDI1NTVmNDA3M2MwODAyMGU1Cj4gU2lnbmVkLW9mZi1ieTogVGlhbmNpLllpbiA8dGlhbmNp
LnlpbkBhbWQuY29tPgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3R0bS5jIHwgNiArKysrLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8w
LmMgICB8IDMgKystCj4gICAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMyBkZWxl
dGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfdHRtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMKPiBpbmRl
eCA4MDFmOTEyLi5kY2QzMmQwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV90dG0uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV90dG0uYwo+IEBAIC0xNzMzLDYgKzE3MzMsNyBAQCBpbnQgYW1kZ3B1X3R0bV9pbml0KHN0cnVj
dCBhbWRncHVfZGV2aWNlICphZGV2KQo+ICAgCXVpbnQ2NF90IGd0dF9zaXplOwo+ICAgCWludCBy
Owo+ICAgCXU2NCB2aXNfdnJhbV9saW1pdDsKPiArCXZvaWQgKnN0b2xlbl92Z2FfYnVmOwo+ICAg
Cj4gICAJbXV0ZXhfaW5pdCgmYWRldi0+bW1hbi5ndHRfd2luZG93X2xvY2spOwo+ICAgCj4gQEAg
LTE3ODcsNyArMTc4OCw3IEBAIGludCBhbWRncHVfdHRtX2luaXQoc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYpCj4gICAJciA9IGFtZGdwdV9ib19jcmVhdGVfa2VybmVsKGFkZXYsIGFkZXYtPmdt
Yy5zdG9sZW5fc2l6ZSwgUEFHRV9TSVpFLAo+ICAgCQkJCSAgICBBTURHUFVfR0VNX0RPTUFJTl9W
UkFNLAo+ICAgCQkJCSAgICAmYWRldi0+c3RvbGVuX3ZnYV9tZW1vcnksCj4gLQkJCQkgICAgTlVM
TCwgTlVMTCk7Cj4gKwkJCQkgICAgTlVMTCwgJnN0b2xlbl92Z2FfYnVmKTsKPiAgIAlpZiAocikK
PiAgIAkJcmV0dXJuIHI7Cj4gICAJRFJNX0lORk8oImFtZGdwdTogJXVNIG9mIFZSQU0gbWVtb3J5
IHJlYWR5XG4iLAo+IEBAIC0xODUxLDggKzE4NTIsOSBAQCBpbnQgYW1kZ3B1X3R0bV9pbml0KHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQo+ICAgICovCj4gICB2b2lkIGFtZGdwdV90dG1fbGF0
ZV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQo+ICAgewo+ICsJdm9pZCAqc3RvbGVu
X3ZnYV9idWY7CgpDb2Rpbmcgc3R5bGUgc2F5cyB3ZSBzaG91bGQgYWRkIGEgbmV3IGxpbmUgYmV0
d2VlbiBkZWNsYXJhdGlvbiBhbmQgY29kZS4KCkFwYXJ0IGZyb20gdGhhdCB0aGUgc2VyaWVzIGlz
IFJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIAo8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29t
Pi4KCj4gICAJLyogcmV0dXJuIHRoZSBWR0Egc3RvbGVuIG1lbW9yeSAoaWYgYW55KSBiYWNrIHRv
IFZSQU0gKi8KPiAtCWFtZGdwdV9ib19mcmVlX2tlcm5lbCgmYWRldi0+c3RvbGVuX3ZnYV9tZW1v
cnksIE5VTEwsIE5VTEwpOwo+ICsJYW1kZ3B1X2JvX2ZyZWVfa2VybmVsKCZhZGV2LT5zdG9sZW5f
dmdhX21lbW9yeSwgTlVMTCwgJnN0b2xlbl92Z2FfYnVmKTsKPiAgIH0KPiAgIAo+ICAgLyoqCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jCj4gaW5kZXggZjc3MTM4Yi4uYWI0M2Fl
MiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYwo+IEBAIC0xMjQ4LDYg
KzEyNDgsNyBAQCBzdGF0aWMgaW50IGdtY192OV8wX3N3X2luaXQodm9pZCAqaGFuZGxlKQo+ICAg
c3RhdGljIGludCBnbWNfdjlfMF9zd19maW5pKHZvaWQgKmhhbmRsZSkKPiAgIHsKPiAgIAlzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqKWhhbmRsZTsK
PiArCXZvaWQgKnN0b2xlbl92Z2FfYnVmOwo+ICAgCj4gICAJaWYgKGFtZGdwdV9yYXNfaXNfc3Vw
cG9ydGVkKGFkZXYsIEFNREdQVV9SQVNfQkxPQ0tfX1VNQykgJiYKPiAgIAkJCWFkZXYtPmdtYy51
bWNfcmFzX2lmKSB7Cj4gQEAgLTEyODAsNyArMTI4MSw3IEBAIHN0YXRpYyBpbnQgZ21jX3Y5XzBf
c3dfZmluaSh2b2lkICpoYW5kbGUpCj4gICAJYW1kZ3B1X3ZtX21hbmFnZXJfZmluaShhZGV2KTsK
PiAgIAo+ICAgCWlmIChnbWNfdjlfMF9rZWVwX3N0b2xlbl9tZW1vcnkoYWRldikpCj4gLQkJYW1k
Z3B1X2JvX2ZyZWVfa2VybmVsKCZhZGV2LT5zdG9sZW5fdmdhX21lbW9yeSwgTlVMTCwgTlVMTCk7
Cj4gKwkJYW1kZ3B1X2JvX2ZyZWVfa2VybmVsKCZhZGV2LT5zdG9sZW5fdmdhX21lbW9yeSwgTlVM
TCwgJnN0b2xlbl92Z2FfYnVmKTsKPiAgIAo+ICAgCWFtZGdwdV9nYXJ0X3RhYmxlX3ZyYW1fZnJl
ZShhZGV2KTsKPiAgIAlhbWRncHVfYm9fZmluaShhZGV2KTsKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA==
