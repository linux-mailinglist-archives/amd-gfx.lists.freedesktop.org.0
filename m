Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9066791E09
	for <lists+amd-gfx@lfdr.de>; Mon, 19 Aug 2019 09:39:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E365B891C5;
	Mon, 19 Aug 2019 07:39:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FC5F891C5
 for <amd-gfx@lists.freedesktop.org>; Mon, 19 Aug 2019 07:39:36 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id y8so7579742wrn.10
 for <amd-gfx@lists.freedesktop.org>; Mon, 19 Aug 2019 00:39:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=acKzkSVIktzeTlYtWtVu2PST58UaGH33LibkJWZsw9I=;
 b=puwmTl7TKKtFx4LG8FoXzIDw1nki8+RZyJ6xUmUEIdr+ftJVPmvuVIGNk9OHwSygZz
 z/oLGF3ykJqLYQQW/YMoWKKslKwLuwzHSdmxtWr3nOsK5yu8LiNZNIiOvOVR3uNk7Wo/
 PUgnH2CcVeXiBtedys5t9bmmxPtFLBO8FOMi2mwG1ZXYgkb6cae6xwj81I7yXvpgRbTz
 WylpZsFfcfH6ckUOL4426yY6C1GA8Z0gQ8kFWSpyPr3rw6+EPZ5KEjufy0PgwmuVZ3fL
 PyVsxJMQpyN/nobSlsmFAbEpoDQXIuNtFCYT7yDcM/VAvN90UFCxdshsDZkt4Y+cm8t8
 8bMA==
X-Gm-Message-State: APjAAAUH+oZSgjW1Qe4y1obm09L6Qz8anPgkjC0cIuJBqGxWNKAvX2Wf
 +hQyV+xMCpU+vhuYEeoV5ho=
X-Google-Smtp-Source: APXvYqyUPeg+FH8sTcYU0e+RJ2chCxXoWwLeJIfC89kOJmRptmWG/uFHc8FXw8XPNyBBCHGq+IxfXg==
X-Received: by 2002:adf:db03:: with SMTP id s3mr14230081wri.214.1566200374782; 
 Mon, 19 Aug 2019 00:39:34 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id q24sm1601528wmc.3.2019.08.19.00.39.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 19 Aug 2019 00:39:34 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu/psp: move TMR to cpu invisible vram region
To: Tianci Yin <tianci.yin@amd.com>, amd-gfx@lists.freedesktop.org
References: <1566200092-17283-1-git-send-email-tianci.yin@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <8f923347-6255-c663-03fd-fe77aa4e3eff@gmail.com>
Date: Mon, 19 Aug 2019 09:39:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1566200092-17283-1-git-send-email-tianci.yin@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=acKzkSVIktzeTlYtWtVu2PST58UaGH33LibkJWZsw9I=;
 b=rRZUdhqYqtIsfvJnXVGG/YInd2H6c/v1pa2j40rsiI8ELgQp/mkgArlVjvnbV4BfSK
 MpXrNpYzjTnZIvV8wDS8fhvt8FRaP4ADtdtvQ53p0Ee3jR3Eefbh7hIm8Y4bFqF1cF4N
 3Qilu4WuIRo6S3KbHxEyUuci7G/EfYyxM0Q53UcBzt7ckcGMmbm5VwttUPT0LCFkQesW
 1sPj7f0CtJVCQ6Fz+dDajk5XlBML0v7OXPZh9xaNADZVkEvgGhOG/T4ugn5S9cQQr8ix
 IzhiivU/jyK0HFekIsZJPhiFBBVNW1eNsMi0V2rH1QSJuvsbUnmTifo1dlH/R2agnr4/
 jNiw==
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
Cc: Jack Xiao <Jack.Xiao@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Xiaojie Yuan <xiaojie.yuan@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMTkuMDguMTkgdW0gMDk6MzQgc2NocmllYiBUaWFuY2kgWWluOgo+IEZyb206ICJUaWFuY2ku
WWluIiA8dGlhbmNpLnlpbkBhbWQuY29tPgo+Cj4gc28gdGhhdCBtb3JlIHZpc2libGUgdnJhbSBj
YW4gYmUgYXZhaWxhYmxlIGZvciBvY2wgYXBwbGljYXRpb25zLgo+Cj4gU2lnbmVkLW9mZi1ieTog
VGlhbmNpLllpbiA8dGlhbmNpLnlpbkBhbWQuY29tPgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5jIHwgNSArKystLQo+ICAgZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5jICAgIHwgNCArKy0tCj4gICBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfcHNwLmggICAgfCAxIC0KPiAgIDMgZmlsZXMgY2hhbmdlZCwgNSBp
bnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9vYmplY3QuYwo+IGluZGV4IDEwNTk3NzEuLmNhMzU4NjkgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5jCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5jCj4gQEAgLTI0Niw4ICsyNDYs
OSBAQCBpbnQgYW1kZ3B1X2JvX2NyZWF0ZV9yZXNlcnZlZChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldiwKPiAgIAlicC5zaXplID0gc2l6ZTsKPiAgIAlicC5ieXRlX2FsaWduID0gYWxpZ247Cj4g
ICAJYnAuZG9tYWluID0gZG9tYWluOwo+IC0JYnAuZmxhZ3MgPSBBTURHUFVfR0VNX0NSRUFURV9D
UFVfQUNDRVNTX1JFUVVJUkVEIHwKPiAtCQlBTURHUFVfR0VNX0NSRUFURV9WUkFNX0NPTlRJR1VP
VVM7Cj4gKwlicC5mbGFncyA9IChjcHVfYWRkcik/QU1ER1BVX0dFTV9DUkVBVEVfQ1BVX0FDQ0VT
U19SRVFVSVJFRAo+ICsJCTpBTURHUFVfR0VNX0NSRUFURV9OT19DUFVfQUNDRVNTOwoKQ29kaW5n
IHN0eWxlOiBZb3UgY2FuIGRyb3AgdGhlICIoKSIswqAgYnV0IHRoZXJlIHNob3VsZCBiZSBzcGFj
ZXMgYmVmb3JlIAphbmQgYWZ0ZXIgdGhlICI/IiBhbmQgIjoiLgoKQW5kIHBsZWFzZSBkb3VibGUg
Y2hlY2sgdGhhdCB0aGlzIGNoYW5nZSBkb2Vzbid0IGFmZmVjdCBhbnkgb3RoZXIgdXNlciAKb2Yg
YW1kZ3B1X2JvX2NyZWF0ZV9rZXJuZWwoKS9hbWRncHVfYm9fY3JlYXRlX3Jlc2VydmVkKCkuCgpB
cGFydCBmcm9tIHRoYXQgbG9va3MgZ29vZCB0byBtZSBhbmQgaXMgYSBuaWNlIGltcHJvdmVtZW50
LApDaHJpc3RpYW4uCgo+ICsJYnAuZmxhZ3MgfD0gQU1ER1BVX0dFTV9DUkVBVEVfVlJBTV9DT05U
SUdVT1VTOwo+ICAgCWJwLnR5cGUgPSB0dG1fYm9fdHlwZV9rZXJuZWw7Cj4gICAJYnAucmVzdiA9
IE5VTEw7Cj4gICAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3BzcC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5jCj4gaW5k
ZXggNzcxNWMwZC4uNWU3ZmJiZSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfcHNwLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfcHNwLmMKPiBAQCAtMjY0LDcgKzI2NCw3IEBAIHN0YXRpYyBpbnQgcHNwX3Rtcl9pbml0KHN0
cnVjdCBwc3BfY29udGV4dCAqcHNwKQo+ICAgCj4gICAJcmV0ID0gYW1kZ3B1X2JvX2NyZWF0ZV9r
ZXJuZWwocHNwLT5hZGV2LCB0bXJfc2l6ZSwgUFNQX1RNUl9TSVpFLAo+ICAgCQkJCSAgICAgIEFN
REdQVV9HRU1fRE9NQUlOX1ZSQU0sCj4gLQkJCQkgICAgICAmcHNwLT50bXJfYm8sICZwc3AtPnRt
cl9tY19hZGRyLCAmcHNwLT50bXJfYnVmKTsKPiArCQkJCSAgICAgICZwc3AtPnRtcl9ibywgJnBz
cC0+dG1yX21jX2FkZHIsIE5VTEwpOwo+ICAgCj4gICAJcmV0dXJuIHJldDsKPiAgIH0KPiBAQCAt
MTIxNSw3ICsxMjE1LDcgQEAgc3RhdGljIGludCBwc3BfaHdfZmluaSh2b2lkICpoYW5kbGUpCj4g
ICAKPiAgIAlwc3BfcmluZ19kZXN0cm95KHBzcCwgUFNQX1JJTkdfVFlQRV9fS00pOwo+ICAgCj4g
LQlhbWRncHVfYm9fZnJlZV9rZXJuZWwoJnBzcC0+dG1yX2JvLCAmcHNwLT50bXJfbWNfYWRkciwg
JnBzcC0+dG1yX2J1Zik7Cj4gKwlhbWRncHVfYm9fZnJlZV9rZXJuZWwoJnBzcC0+dG1yX2JvLCAm
cHNwLT50bXJfbWNfYWRkciwgTlVMTCk7Cj4gICAJYW1kZ3B1X2JvX2ZyZWVfa2VybmVsKCZwc3At
PmZ3X3ByaV9ibywKPiAgIAkJCSAgICAgICZwc3AtPmZ3X3ByaV9tY19hZGRyLCAmcHNwLT5md19w
cmlfYnVmKTsKPiAgIAlhbWRncHVfYm9fZnJlZV9rZXJuZWwoJnBzcC0+ZmVuY2VfYnVmX2JvLAo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmggYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmgKPiBpbmRleCAwMDI5ZmEyLi40
OGIwNTdkIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9w
c3AuaAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuaAo+IEBA
IC0xNzIsNyArMTcyLDYgQEAgc3RydWN0IHBzcF9jb250ZXh0Cj4gICAJLyogdG1yIGJ1ZmZlciAq
Lwo+ICAgCXN0cnVjdCBhbWRncHVfYm8JCSp0bXJfYm87Cj4gICAJdWludDY0X3QJCQl0bXJfbWNf
YWRkcjsKPiAtCXZvaWQJCQkJKnRtcl9idWY7Cj4gICAKPiAgIAkvKiBhc2QgZmlybXdhcmUgYW5k
IGJ1ZmZlciAqLwo+ICAgCWNvbnN0IHN0cnVjdCBmaXJtd2FyZQkJKmFzZF9mdzsKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBs
aXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
