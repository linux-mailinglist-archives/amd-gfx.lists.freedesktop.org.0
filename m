Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2983F9FEFE
	for <lists+amd-gfx@lfdr.de>; Wed, 28 Aug 2019 11:57:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2741F89817;
	Wed, 28 Aug 2019 09:57:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 423B589817
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Aug 2019 09:57:43 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id z11so1842643wrt.4
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Aug 2019 02:57:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=+5iTRs8VGak71rUCxkupq02gzVxP0Uuc+hdYF4bwbbg=;
 b=m1fVd8Egcl47GKxQ75DO6Oh43WhJBXGQlUTVi1jgoapK6F1SWel4l3PA/XnYbrDjex
 pyOzq83Mc9hyimOZGh29sJRpOpS4wEVHjrrenVZfM5VYrCsFOfzAla4WtDoccUvczC/S
 PaaLjc7ufreEX2Qmf4AM8N9qWSCnH4Iec/VsgFJjWRo6hgwFYJjnYW1d3QaTULKeILvX
 H3kDZeuQskpSqvMjpzXfb0Pkfez83qIy4f7fcvDf4DWXgemN2lOpoq4n/feaEldWF4hM
 2G3+P0ajGs49wnyjwPycip8fsIYbbIqWkT9eycYkW/UJ02yxFDqmdkAD1BCnR6rTMUhz
 Hxig==
X-Gm-Message-State: APjAAAX4a9Sb5Jo2Ae4Kb1GWvRxJE354K9RAK4jcpzVGkDcMQdnwrwBW
 ItX461kNM1/5ykZZLx/6gdp5XV5/
X-Google-Smtp-Source: APXvYqxaaN59p/MkLU814owiAST8EJu96R61gz+Wrw5MCpzl0L4Sj6QnilW92PnWZWC59sHU/7h4zQ==
X-Received: by 2002:a5d:6307:: with SMTP id i7mr3615454wru.144.1566986261891; 
 Wed, 28 Aug 2019 02:57:41 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id o9sm2061132wrj.17.2019.08.28.02.57.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 28 Aug 2019 02:57:41 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu/psp: keep TMR in visible vram region for SRIOV
To: Tianci Yin <tianci.yin@amd.com>, amd-gfx@lists.freedesktop.org
References: <1566984335-14830-1-git-send-email-tianci.yin@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <45fe6586-a53a-6f02-0e5f-b6224b159e12@gmail.com>
Date: Wed, 28 Aug 2019 11:57:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1566984335-14830-1-git-send-email-tianci.yin@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=+5iTRs8VGak71rUCxkupq02gzVxP0Uuc+hdYF4bwbbg=;
 b=SuTwoXNuxLcDMTBn0fj6v4zvQzZn6wYm+3XhLh5faUTI68cNDnNtNIwkfnnEgJiBpU
 /TDhEXFCvJ53A9o1aNZy8GhY9NnPWCvqkuHYrN/xSnJRVBVilsk7yzbkTTSQA72TigC6
 N8pHTisL+do3TbXnCe9wirufCHkDAdUowkoUzM4bQC7P0kuTRzhao1gkGOGdE9eDHPzX
 d5hFpmxjL7SVI6pCdkq6bUsBzq+IRSry1cEBFySI2s3tuEFniNhrGTZwwGTWS9W5OrPY
 aosEfoC9Ygom7y47ITBtfYTfSmyDCD1nyLIG43XQ5Whkxjjr2TIunMnqUjvHIRAiIMdd
 S6qw==
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

QW0gMjguMDguMTkgdW0gMTE6MjUgc2NocmllYiBUaWFuY2kgWWluOgo+IEZyb206ICJUaWFuY2ku
WWluIiA8dGlhbmNpLnlpbkBhbWQuY29tPgo+Cj4gRml4IGNvbXB1dGUgcmluZyB0ZXN0IGZhaWx1
cmUgaW4gc3Jpb3Ygc2NlbmFyaW8uCj4KPiBTaWduZWQtb2ZmLWJ5OiBUaWFuY2kuWWluIDx0aWFu
Y2kueWluQGFtZC5jb20+Cj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfcHNwLmMgfCAxNCArKysrKysrKysrLS0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3BzcC5oIHwgIDEgKwo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25z
KCspLCA0IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9wc3AuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9w
c3AuYwo+IGluZGV4IDlmN2NjNWIuLjkyYzY4YzkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3BzcC5jCj4gQEAgLTI2MSw5ICsyNjEsMTUgQEAgc3RhdGljIGludCBwc3Bf
dG1yX2luaXQoc3RydWN0IHBzcF9jb250ZXh0ICpwc3ApCj4gICAJCX0KPiAgIAl9Cj4gICAKPiAt
CXJldCA9IGFtZGdwdV9ib19jcmVhdGVfa2VybmVsKHBzcC0+YWRldiwgdG1yX3NpemUsIFBTUF9U
TVJfU0laRSwKPiAtCQkJCSAgICAgIEFNREdQVV9HRU1fRE9NQUlOX1ZSQU0sCj4gLQkJCQkgICAg
ICAmcHNwLT50bXJfYm8sICZwc3AtPnRtcl9tY19hZGRyLCBOVUxMKTsKPiArCXBzcC0+dG1yX2J1
ZiA9IE5VTEw7Cj4gKwlpZiAoIWFtZGdwdV9zcmlvdl92Zihwc3AtPmFkZXYpKQo+ICsJCXJldCA9
IGFtZGdwdV9ib19jcmVhdGVfa2VybmVsKHBzcC0+YWRldiwgdG1yX3NpemUsIFBTUF9UTVJfU0la
RSwKPiArCQkJCQkgICAgICBBTURHUFVfR0VNX0RPTUFJTl9WUkFNLAo+ICsJCQkJCSAgICAgICZw
c3AtPnRtcl9ibywgJnBzcC0+dG1yX21jX2FkZHIsIE5VTEwpOwo+ICsJZWxzZQo+ICsJCXJldCA9
IGFtZGdwdV9ib19jcmVhdGVfa2VybmVsKHBzcC0+YWRldiwgdG1yX3NpemUsIFBTUF9UTVJfU0la
RSwKPiArCQkJCQkgICAgICBBTURHUFVfR0VNX0RPTUFJTl9WUkFNLAo+ICsJCQkJCSAgICAgICZw
c3AtPnRtcl9ibywgJnBzcC0+dG1yX21jX2FkZHIsICZwc3AtPnRtcl9idWYpOwoKTWlnaHQgYmUg
YmV0dGVyIHRvIHVzZSBhIGxvY2FsIHZhcmlhYmxlIGZvciB0aGUgQ1BVIHBvaW50ZXIgaW5zdGVh
ZCBvZiAKZHVwbGljYXRpbmcgdGhlIGNhbGxpbmcgcGFyYW1ldGVycy4KCkJUVzogSG93IGRpZCB5
b3Ugc29sdmVkIHRoZSBzdG9sZW5fdmdhX21lbW9yeSBwcm9ibGVtIEkgcG9pbnRlZCBvdXQgaW4g
CnRoZSBvcmlnaW5hbCBwYXRjaCBzZXQ/CgpDaHJpc3RpYW4uCgo+ICAgCj4gICAJcmV0dXJuIHJl
dDsKPiAgIH0KPiBAQCAtMTIxNiw3ICsxMjIyLDcgQEAgc3RhdGljIGludCBwc3BfaHdfZmluaSh2
b2lkICpoYW5kbGUpCj4gICAKPiAgIAlwc3BfcmluZ19kZXN0cm95KHBzcCwgUFNQX1JJTkdfVFlQ
RV9fS00pOwo+ICAgCj4gLQlhbWRncHVfYm9fZnJlZV9rZXJuZWwoJnBzcC0+dG1yX2JvLCAmcHNw
LT50bXJfbWNfYWRkciwgTlVMTCk7Cj4gKwlhbWRncHVfYm9fZnJlZV9rZXJuZWwoJnBzcC0+dG1y
X2JvLCAmcHNwLT50bXJfbWNfYWRkciwgJnBzcC0+dG1yX2J1Zik7Cj4gICAJYW1kZ3B1X2JvX2Zy
ZWVfa2VybmVsKCZwc3AtPmZ3X3ByaV9ibywKPiAgIAkJCSAgICAgICZwc3AtPmZ3X3ByaV9tY19h
ZGRyLCAmcHNwLT5md19wcmlfYnVmKTsKPiAgIAlhbWRncHVfYm9fZnJlZV9rZXJuZWwoJnBzcC0+
ZmVuY2VfYnVmX2JvLAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfcHNwLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmgKPiBp
bmRleCBiYzA5NDdmLi5iNzNkNGFhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9wc3AuaAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9wc3AuaAo+IEBAIC0xNzEsNiArMTcxLDcgQEAgc3RydWN0IHBzcF9jb250ZXh0Cj4gICAJ
LyogdG1yIGJ1ZmZlciAqLwo+ICAgCXN0cnVjdCBhbWRncHVfYm8JCSp0bXJfYm87Cj4gICAJdWlu
dDY0X3QJCQl0bXJfbWNfYWRkcjsKPiArCXZvaWQJCQkJKnRtcl9idWY7Cj4gICAKPiAgIAkvKiBh
c2QgZmlybXdhcmUgYW5kIGJ1ZmZlciAqLwo+ICAgCWNvbnN0IHN0cnVjdCBmaXJtd2FyZQkJKmFz
ZF9mdzsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFt
ZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
