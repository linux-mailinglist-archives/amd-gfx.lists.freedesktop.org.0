Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B07E2F4
	for <lists+amd-gfx@lfdr.de>; Mon, 29 Apr 2019 14:43:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1272F890EF;
	Mon, 29 Apr 2019 12:43:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3295890EF
 for <amd-gfx@lists.freedesktop.org>; Mon, 29 Apr 2019 12:43:48 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id s15so15781324wra.12
 for <amd-gfx@lists.freedesktop.org>; Mon, 29 Apr 2019 05:43:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=adzPF6jvkFW+juQf+7tRtF6QXBXJBmM3CCAbl5k/wVk=;
 b=Mmp8vSfBKh/U+3pVetvv6Q4S9ON3QH+L8q+5YFjNWN7ly0H6B0d6NjqVOXLI1xQkNW
 F4JSLAJ/s8fvlXieyCEyZcVzKL3XLVJQheRuFTKvmzx3ik2fcpOX25BjPCFw+BnIoRuc
 8dSRReTFpsDidilbCRQDU0xBsYRaICcvlcRTYiHNDXDewrQ4PkQ3aBf30yXlHSEiUCw9
 /h5F4a+r6bxvP7Z0JII2Np3drTKqnggTpt5n/s3DbCBmX/mIPezrp+FIEppfMGyigqVo
 rXuknnrRAWw1T2/aDXC9fCPgrJqQBl1/oO9P/0WRezwV8ok6zLcw6LfYLdWefAVXVuhQ
 EY/A==
X-Gm-Message-State: APjAAAVDWYi37D+Rc1kNUFAffmUrySrLRa5HU+mCDOxM1tPYUSu81omq
 JFPZ4e6jyFYzBJH00HVUUN/Z5Zzy
X-Google-Smtp-Source: APXvYqysNrHX4JfVZ91aB6H5nuN7/OG7ZcrcxA6Tj4oyB7WdVpW1WvrlprrPsDIW/jSha5DPWdnyJA==
X-Received: by 2002:adf:c993:: with SMTP id f19mr15241061wrh.246.1556541827152; 
 Mon, 29 Apr 2019 05:43:47 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id p18sm24945726wrp.38.2019.04.29.05.43.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 29 Apr 2019 05:43:46 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: Unmap CSA under SR-IOV in KFD path
To: Trigger Huang <Trigger.Huang@amd.com>, amd-gfx@lists.freedesktop.org
References: <1556447115-1689-1-git-send-email-Trigger.Huang@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <0afedb48-2124-0cfd-c98f-055b71d314ca@gmail.com>
Date: Mon, 29 Apr 2019 14:43:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1556447115-1689-1-git-send-email-Trigger.Huang@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=adzPF6jvkFW+juQf+7tRtF6QXBXJBmM3CCAbl5k/wVk=;
 b=sCG7m+zfW/KfpQtgh5H+5fmUTIliPEfcVOEtqzoihPzWiBkHXM0MKLWyBF7EwaBfeo
 giIdX5P1MeC3gIke4FTaRZbrkxCHVO7lHdY7Am+EoKlBfnr40TGenLIfUtp+VauvYNCu
 yssjFlOrfIojVpyGiAPHeVll5eo9Zo6vHX0JFS5SO6JD9dx5f828Zw52tIGbP2cx8IVk
 kpx7JisIda9l+2yvPIEGd71jVXlT+FE9SoUzWjKYRL6aijM7coMVPwxqKVXDeAEgDfIs
 gykRjEdcuB6bzuoJ2IMWU2OKIaOm1ou+jQP+tZMiyWjCUh4+QDQyD6CSiX/OCgqwkKl/
 5NOA==
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

QW0gMjguMDQuMTkgdW0gMTI6MjUgc2NocmllYiBUcmlnZ2VyIEh1YW5nOgo+IEluIGFtZGdwdSBv
cGVuIHBhdGgsIENTQSB3aWxsIGJlIG1hcHBlbmVkIGluIFZNLCBzbyB3aGVuIG9wZW5pbmcKPiBL
RkQsIGNhbGxpbmcgbWRncHVfdm1fbWFrZV9jb21wdXRlICB3aWxsIGZhaWwgYmVjYXVzZSBpdCBm
b3VuZCB0aGlzCj4gVk0gaXMgbm90IGEgY2xlYW4gVk0gd2l0aCBzb21lIG1hcHBpbmdzLCBhcyBh
IHJlc3VsdCwgaXQgd2lsbCBsZWFkCj4gdG8gZmFpbGVkIHRvIGNyZWF0ZSBwcm9jZXNzIFZNIG9i
amVjdAo+Cj4gVGhlIGZpeCBpcyB0cnkgdG8gdW5tYXAgQ1NBLCBhbmQgYWN0dWFsbHkgQ1NBIGlz
IG5vdCBuZWVkZWQgaW4KPiBjb21wdXRlIFZGIHdvcmxkIHN3aXRjaAoKV2VsbCB3ZSBzaG91bGQg
cmF0aGVyIHRyeSB0byBhdm9pZCB0aGF0LgoKVGhlIHBsYW4gd2l0aCB0aGF0IHdhcyB0aGF0IHdl
IGRvIHRoaXMgc28gdGhhdCBvbmUgVk0gY2FuIGJlIHVzZWQgYm90aCAKYnkgY29tcHV0ZSBhbmQg
Z2Z4LgoKSSB3b3VsZCByYXRoZXIgbG93ZXIgdGhlIGNoZWNrIGluIGFtZGdwdV92bV9tYWtlX2Nv
bXB1dGUoKSB0byBtYWtlIHN1cmUgCnRoYXQgd2UgZG9uJ3QgaGF2ZSBwYWdlIHRhYmxlcyBmaWxs
ZWQsIGluc3RlYWQgb2YgY2hlY2tpbmcgZm9yIGEgbWFwcGluZy4KCkNocmlzdGlhbi4KCj4KPiBT
aWduZWQtb2ZmLWJ5OiBUcmlnZ2VyIEh1YW5nIDxUcmlnZ2VyLkh1YW5nQGFtZC5jb20+Cj4gLS0t
Cj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMgfCAx
MCArKysrKysrKysrCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfa21zLmMg
ICAgICAgICAgfCAgMiArLQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2FtZGtmZF9ncHV2bS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2FtZGtmZF9ncHV2bS5jCj4gaW5kZXggNjk3YjhlZi4uZTBiYzQ1NyAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMKPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMKPiBAQCAtOTU2
LDYgKzk1NiwxNiBAQCBpbnQgYW1kZ3B1X2FtZGtmZF9ncHV2bV9hY3F1aXJlX3Byb2Nlc3Nfdm0o
c3RydWN0IGtnZF9kZXYgKmtnZCwKPiAgIAlpZiAoYXZtLT5wcm9jZXNzX2luZm8pCj4gICAJCXJl
dHVybiAtRUlOVkFMOwo+ICAgCj4gKwkvKiBEZWxldGUgQ1NBIG1hcHBpbmcgdG8gbWFrZSBzdXJl
IHRoaXMgVk0gaXMgYSBjbGVhbiBWTSAgYmVmb3JlCj4gKwkgKiAgY29udmVydGluZyBWTQo+ICsJ
ICovCj4gKwlpZiAoYW1kZ3B1X3NyaW92X3ZmKGFkZXYpICYmIGRydl9wcml2LT5jc2FfdmEpIHsK
PiArCQlhbWRncHVfYm9fcmVzZXJ2ZShhZGV2LT52aXJ0LmNzYV9vYmosIHRydWUpOwo+ICsJCWFt
ZGdwdV92bV9ib19ybXYoYWRldiwgZHJ2X3ByaXYtPmNzYV92YSk7Cj4gKwkJZHJ2X3ByaXYtPmNz
YV92YSA9IE5VTEw7Cj4gKwkJYW1kZ3B1X2JvX3VucmVzZXJ2ZShhZGV2LT52aXJ0LmNzYV9vYmop
Owo+ICsJfQo+ICsKPiAgIAkvKiBDb252ZXJ0IFZNIGludG8gYSBjb21wdXRlIFZNICovCj4gICAJ
cmV0ID0gYW1kZ3B1X3ZtX21ha2VfY29tcHV0ZShhZGV2LCBhdm0sIHBhc2lkKTsKPiAgIAlpZiAo
cmV0KQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfa21z
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfa21zLmMKPiBpbmRleCBkYTdi
NGZlLi4zNjFjMmU1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9rbXMuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9rbXMu
Ywo+IEBAIC0xMDY5LDcgKzEwNjksNyBAQCB2b2lkIGFtZGdwdV9kcml2ZXJfcG9zdGNsb3NlX2tt
cyhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAo+ICAgCj4gICAJYW1kZ3B1X3ZtX2JvX3JtdihhZGV2
LCBmcHJpdi0+cHJ0X3ZhKTsKPiAgIAo+IC0JaWYgKGFtZGdwdV9zcmlvdl92ZihhZGV2KSkgewo+
ICsJaWYgKGFtZGdwdV9zcmlvdl92ZihhZGV2KSAmJiBmcHJpdi0+Y3NhX3ZhKSB7Cj4gICAJCS8q
IFRPRE86IGhvdyB0byBoYW5kbGUgcmVzZXJ2ZSBmYWlsdXJlICovCj4gICAJCUJVR19PTihhbWRn
cHVfYm9fcmVzZXJ2ZShhZGV2LT52aXJ0LmNzYV9vYmosIHRydWUpKTsKPiAgIAkJYW1kZ3B1X3Zt
X2JvX3JtdihhZGV2LCBmcHJpdi0+Y3NhX3ZhKTsKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeA==
