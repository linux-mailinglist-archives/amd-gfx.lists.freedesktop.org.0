Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 569E059852
	for <lists+amd-gfx@lfdr.de>; Fri, 28 Jun 2019 12:26:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3E5D6E8C9;
	Fri, 28 Jun 2019 10:26:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 130D36E8C9
 for <amd-gfx@lists.freedesktop.org>; Fri, 28 Jun 2019 10:26:30 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id c2so5697316wrm.8
 for <amd-gfx@lists.freedesktop.org>; Fri, 28 Jun 2019 03:26:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=e90YwLPUywo06n1vLPDUHdVIutpW2I1eYXqVPg6cBng=;
 b=WdcHxy+0EzIB2BAg7D7dpGR/lH6BUdghaqPt72D1CEt3TPgK8gespaiwWKm0Jw3nNM
 wi7Smn5YJ9OJzEQRsp+V0twXDRFHmDTPPNPNBKnQyxDo6lj+PJaRACKLpsS9fAGGTB1h
 2Yz1HJzidjAqwRvPLPTItAhIiDoIe7QOHtzHzhWn1GQAKOxEHjmSarJAnj9mt08XTDzo
 DnFkbwAJ4Z7rR3gGLi7QnrcpdAi5JbCpFp5mTUdmFo639Gxp/JpkUscgZAL6/Rm1hDUx
 bEKau6as9wdTSb96DvoYmFOz2eNZhuM6+4uURHVTv5YWcWBiyawG11YGpv19+zyAWGk1
 gIEA==
X-Gm-Message-State: APjAAAXWVPBzQ0PDM4EJW9uy0db2h6niLd3Y4XGYrdWrMWLf8IQXv/i6
 Se/ihPi8pXcFOO+APo9QUg3Y69jX
X-Google-Smtp-Source: APXvYqzDJ69Nz/qk8iC6ykHN6TrYHXqYvz3skTlNxO0fHSSTkUQ5UbaYABSQojZqXhIy09cxFBdrvg==
X-Received: by 2002:a5d:5607:: with SMTP id l7mr7830808wrv.228.1561717588599; 
 Fri, 28 Jun 2019 03:26:28 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id 15sm1612568wmk.34.2019.06.28.03.26.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 28 Jun 2019 03:26:28 -0700 (PDT)
Subject: Re: [PATCH v3] drm/amdgpu: fix scheduler timeout calc
To: "Cui, Flora" <Flora.Cui@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <1561713800-25552-1-git-send-email-flora.cui@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <1ea0b3f9-9e1f-7fb3-8c83-af298098d90c@gmail.com>
Date: Fri, 28 Jun 2019 12:26:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <1561713800-25552-1-git-send-email-flora.cui@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=e90YwLPUywo06n1vLPDUHdVIutpW2I1eYXqVPg6cBng=;
 b=SY+enxPuKv/9r43wM2mT6E9qoMgJbDWTHW3J47jueYhJWielI1XnOrdc0vPynPI65/
 P5OG5ZRM7jx93jim7oChCjBV6I4LosZMf+CfHS4h2ew6Bgsjaa2E4xpDK99OmKgLhJd5
 LeRElzt+EtueOyEhxOUhg8qKRMpzC0bcIzk0sYItJJ2t+O/8Cx5BDjMWGBxtTalEDxft
 h8OJEYxqS9AKYu0Nu+MaYOzkLJSN2p9JEvblgmUAEjjZiFR9rgZN4taUFAs7QPI/Iwo9
 gQei/WoUll4h9vWGrg4gRTUy+0N0kiXCFARlH3YS736MWP9SQrKHQurieRXWMwplad1V
 gvIQ==
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

QW0gMjguMDYuMTkgdW0gMTE6MjMgc2NocmllYiBDdWksIEZsb3JhOgo+IHNjaGVkdWxlciB0aW1l
b3V0IGlzIGluIGppZmZpZXMKPiB2MjogbW92ZSB0aW1lb3V0IGNoZWNrIHRvIGFtZGdwdV9kZXZp
Y2VfZ2V0X2pvYl90aW1lb3V0X3NldHRpbmdzIGFmdGVyCj4gcGFyc2luZyB0aGUgdmFsdWUKPiB2
MzogYWRkIGxvY2t1cF90aW1lb3V0IHBhcmFtIGNoZWNrLiAwOiBrZWVwIGRlZmF1bHQgdmFsdWUu
IG5lZ2F0aXZlOgo+IGluZmluaXR5IHRpbWVvdXQuCj4KPiBDaGFuZ2UtSWQ6IEkyNjcwOGMxNjNk
Yjk0M2ZmOGQ5MzBkZDgxYmNhYjRiNGI5ZDg0ZWIyCj4gU2lnbmVkLW9mZi1ieTogRmxvcmEgQ3Vp
IDxmbG9yYS5jdWlAYW1kLmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9kcnYuYyB8IDE0ICsrKysrKysrKystLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMTAg
aW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfZHJ2LmMKPiBpbmRleCBlNzRhMTc1Li4wZDY2N2ZhIDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYwo+IEBAIC0yNDUsNyArMjQ1LDggQEAgbW9kdWxl
X3BhcmFtX25hbWVkKG1zaSwgYW1kZ3B1X21zaSwgaW50LCAwNDQ0KTsKPiAgICAqIEJ5IGRlZmF1
bHQod2l0aCBubyBsb2NrdXBfdGltZW91dCBzZXR0aW5ncyksIHRoZSB0aW1lb3V0IGZvciBhbGwg
bm9uLWNvbXB1dGUoR0ZYLCBTRE1BIGFuZCBWaWRlbykKPiAgICAqIGpvYnMgaXMgMTAwMDAuIEFu
ZCB0aGVyZSBpcyBubyB0aW1lb3V0IGVuZm9yY2VkIG9uIGNvbXB1dGUgam9icy4KPiAgICAqLwo+
IC1NT0RVTEVfUEFSTV9ERVNDKGxvY2t1cF90aW1lb3V0LCAiR1BVIGxvY2t1cCB0aW1lb3V0IGlu
IG1zIChkZWZhdWx0OiAxMDAwMCBmb3Igbm9uLWNvbXB1dGUgam9icyBhbmQgbm8gdGltZW91dCBm
b3IgY29tcHV0ZSBqb2JzKSwgIgo+ICtNT0RVTEVfUEFSTV9ERVNDKGxvY2t1cF90aW1lb3V0LCAi
R1BVIGxvY2t1cCB0aW1lb3V0IGluIG1zIChkZWZhdWx0OiAxMDAwMCBmb3Igbm9uLWNvbXB1dGUg
am9icyBhbmQgaW5maW5pdHkgdGltZW91dCBmb3IgY29tcHV0ZSBqb2JzLiIKPiArCQkiIDA6IGtl
ZXAgZGVmYXVsdCB2YWx1ZS4gbmVnYXRpdmU6IGluZmluaXR5IHRpbWVvdXQpLCAiCj4gICAJCSJm
b3JtYXQgaXMgW05vbi1Db21wdXRlXSBvciBbR0ZYLENvbXB1dGUsU0RNQSxWaWRlb10iKTsKPiAg
IG1vZHVsZV9wYXJhbV9zdHJpbmcobG9ja3VwX3RpbWVvdXQsIGFtZGdwdV9sb2NrdXBfdGltZW91
dCwgc2l6ZW9mKGFtZGdwdV9sb2NrdXBfdGltZW91dCksIDA0NDQpOwo+ICAgCj4gQEAgLTEzMDAs
NyArMTMwMSw5IEBAIGludCBhbWRncHVfZGV2aWNlX2dldF9qb2JfdGltZW91dF9zZXR0aW5ncyhz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKPiAgIAkgKiBCeSBkZWZhdWx0IHRpbWVvdXQgZm9y
IG5vbiBjb21wdXRlIGpvYnMgaXMgMTAwMDAuCj4gICAJICogQW5kIHRoZXJlIGlzIG5vIHRpbWVv
dXQgZW5mb3JjZWQgb24gY29tcHV0ZSBqb2JzLgo+ICAgCSAqLwo+IC0JYWRldi0+Z2Z4X3RpbWVv
dXQgPSBhZGV2LT5zZG1hX3RpbWVvdXQgPSBhZGV2LT52aWRlb190aW1lb3V0ID0gMTAwMDA7Cj4g
KwlhZGV2LT5nZnhfdGltZW91dCA9Cj4gKwlhZGV2LT5zZG1hX3RpbWVvdXQgPQo+ICsJYWRldi0+
dmlkZW9fdGltZW91dCA9IG1zZWNzX3RvX2ppZmZpZXMoMTAwMDApOwoKSSB3b3VsZCB3cml0ZSB0
aGlzIGFzOgoKYWRldi0+Z2Z4X3RpbWVvdXQgPSBtc2Vjc190b19qaWZmaWVzKDEwMDAwKTsKYWRl
di0+c2RtYV90aW1lb3V0ID0gYWRldi0+dmlkZW9fdGltZW91dCA9IGFkZXYtPmdmeF90aW1lb3V0
OwoKTG9va3MgYmV0dGVyIHRoYW4gc3BsaXR0aW5nIHRoaXMgb24gbXVsdGlwbGUgbGluZXMgd2l0
aG91dCBhbnkgaW5kZW50YXRpb24uCgpBcGFydCBmcm9tIHRoYXQgbG9va3MgZ29vZCB0byBtZSwK
Q2hyaXN0aWFuLgoKPiAgIAlhZGV2LT5jb21wdXRlX3RpbWVvdXQgPSBNQVhfU0NIRURVTEVfVElN
RU9VVDsKPiAgIAo+ICAgCWlmIChzdHJubGVuKGlucHV0LCBBTURHUFVfTUFYX1RJTUVPVVRfUEFS
QU1fTEVOVEgpKSB7Cj4gQEAgLTEzMTAsMTAgKzEzMTMsMTMgQEAgaW50IGFtZGdwdV9kZXZpY2Vf
Z2V0X2pvYl90aW1lb3V0X3NldHRpbmdzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQo+ICAg
CQkJaWYgKHJldCkKPiAgIAkJCQlyZXR1cm4gcmV0Owo+ICAgCj4gLQkJCS8qIEludmFsaWRhdGUg
MCBhbmQgbmVnYXRpdmUgdmFsdWVzICovCj4gLQkJCWlmICh0aW1lb3V0IDw9IDApIHsKPiArCQkJ
aWYgKHRpbWVvdXQgPT0gMCkgewo+ICAgCQkJCWluZGV4Kys7Cj4gICAJCQkJY29udGludWU7Cj4g
KwkJCX0gZWxzZSBpZiAodGltZW91dCA8IDApIHsKPiArCQkJCXRpbWVvdXQgPSBNQVhfU0NIRURV
TEVfVElNRU9VVDsKPiArCQkJfSBlbHNlIHsKPiArCQkJCXRpbWVvdXQgPSBtc2Vjc190b19qaWZm
aWVzKHRpbWVvdXQpOwo+ICAgCQkJfQo+ICAgCj4gICAJCQlzd2l0Y2ggKGluZGV4KyspIHsKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFp
bGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
