Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB509BD37
	for <lists+amd-gfx@lfdr.de>; Sat, 24 Aug 2019 13:08:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 654166E0B9;
	Sat, 24 Aug 2019 11:08:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F1F66E0B9
 for <amd-gfx@lists.freedesktop.org>; Sat, 24 Aug 2019 11:08:16 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id l2so11440806wmg.0
 for <amd-gfx@lists.freedesktop.org>; Sat, 24 Aug 2019 04:08:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=jbqXyU7fAV0NQo8NMnfiuj35e6CX5fB5jyOzmgQ8wFQ=;
 b=W8xU4cFtp6I/e9IQhljzXvf70nCFQIXaF8hWN3YSKVrTySIuRdog/aIYiC1nD4mpFy
 c2Owd5i6sqUjdscJkFOTv4BuUvHSTv23gXD0unwBbjro0wXrGiYIOLwSP5xIAuGolnNt
 Ew3NymE99RINETUfntdsKEYhzi+GfMQxh+zVDsXFj4ytRaQf6oU2Z8MYzIBRn//smhDH
 kYDVViw0IDBT9p/wtF6kch7pkDCe+wBw5EeWDixsyoL8hDE0wyVF4Q9lSZr34/xeEOJ8
 40qyDxr49sQTUUsP2DAahTb0elIQivUXijCe7FOuvjv8etK+I7YdGaTCz7hCC3JrMCTX
 r/NA==
X-Gm-Message-State: APjAAAVVk9CFjkkCAGB+L4V6evZGu+Al1mkqLyZHDKeMaxsD1Ce0MOSs
 UAMfL2NMWdD9fonRK6SwOCjnNMeJ
X-Google-Smtp-Source: APXvYqxZBAKsYI0Js7wNj9IFIvUnf6HuPNGLi5lCf6j2luBK2xIktaDklrm+2KTSvFwU1+5KFzoGOg==
X-Received: by 2002:a7b:c5c2:: with SMTP id n2mr10937883wmk.9.1566644894625;
 Sat, 24 Aug 2019 04:08:14 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id t24sm8377590wmj.14.2019.08.24.04.08.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 24 Aug 2019 04:08:14 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: set adev->num_vmhubs for gmc6,7,8
To: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>,
 Alex Deucher <alexdeucher@gmail.com>
References: <20190823144514.21354-1-alexander.deucher@amd.com>
 <B8D97B9E-4D80-41C9-A10F-0F65F2DBE391@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <22bc23b6-f570-47ef-f054-4d4d79b46348@gmail.com>
Date: Sat, 24 Aug 2019 13:08:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <B8D97B9E-4D80-41C9-A10F-0F65F2DBE391@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=jbqXyU7fAV0NQo8NMnfiuj35e6CX5fB5jyOzmgQ8wFQ=;
 b=TKpWIUQYVNZWEzLTZPYb5m2YbBVbQ6MD8sismX5r5qwJXgwh+eQgLR3eRbq60IqCEB
 gpugCmdRX9ZhAxB++r5n7gcIwaaLd3PFj3/aCDPRUQEeB10AIUrbQLEi6TjV7zhV4Gl5
 U5FNp2EezAjb4hSuo6lM367eZreLQI/YXQ4UoEF2Qvuplrj7BfmegVoT9kUwaYPx5YlX
 ljwaR6hSFnOPqLDCsKD0BMGDqt+UyZlERQ4mlukeKDPEzA1+jVKJRlRJci+7FfrozcVI
 TTT/OgzgrUew9DM8TyfXCrpeqaWtytiIsSi6ETlnE2rL22B84GgqQzoEh+KGqlVsrDUN
 Z7SA==
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4K
CkFtIDIzLjA4LjE5IHVtIDE3OjIxIHNjaHJpZWIgWXVhbiwgWGlhb2ppZToKPiBSZXZpZXdlZC1i
eTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KPgo+IEJSLAo+IFhpYW9qaWUK
Pgo+PiBPbiBBdWcgMjMsIDIwMTksIGF0IDEwOjQ1IFBNLCBBbGV4IERldWNoZXIgPGFsZXhkZXVj
aGVyQGdtYWlsLmNvbT4gd3JvdGU6Cj4+Cj4+IFNvIHRoYXQgd2UgcHJvcGVybHkgaGFuZGxlIHRo
ZW0gb24gb2xkZXIgYXNpY3MuCj4+Cj4+IEZpeGVzOiAzZmY5ODU0ODViMjkgKCJkcm0vYW1kZ3B1
OiBFeHBvcnQgZnVuY3Rpb24gdG8gZmx1c2ggVExCIG9mIHNwZWNpZmljIHZtIGh1YiIpCj4+IFNp
Z25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KPj4g
LS0tCj4+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192Nl8wLmMgfCAyICsrCj4+IGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192N18wLmMgfCAyICsrCj4+IGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2dtY192OF8wLmMgfCAyICsrCj4+IDMgZmlsZXMgY2hhbmdlZCwgNiBp
bnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9nbWNfdjZfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y2XzAuYwo+PiBp
bmRleCA1NjRmYjFjZTI5MmYuLjMyNjQ1NDhlMzc1YyAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y2XzAuYwo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9nbWNfdjZfMC5jCj4+IEBAIC04MzksNiArODM5LDggQEAgc3RhdGljIGludCBnbWNf
djZfMF9zd19pbml0KHZvaWQgKmhhbmRsZSkKPj4gICAgIGludCBkbWFfYml0czsKPj4gICAgIHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gKHN0cnVjdCBhbWRncHVfZGV2aWNlICopaGFuZGxl
Owo+Pgo+PiArICAgIGFkZXYtPm51bV92bWh1YnMgPSAxOwo+PiArCj4+ICAgICBpZiAoYWRldi0+
ZmxhZ3MgJiBBTURfSVNfQVBVKSB7Cj4+ICAgICAgICAgYWRldi0+Z21jLnZyYW1fdHlwZSA9IEFN
REdQVV9WUkFNX1RZUEVfVU5LTk9XTjsKPj4gICAgIH0gZWxzZSB7Cj4+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjdfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvZ21jX3Y3XzAuYwo+PiBpbmRleCA5ZTZhMjMzMDRmZDcuLmNjMGFhMTc4ZWIyZCAx
MDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y3XzAuYwo+PiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjdfMC5jCj4+IEBAIC05NTksNiAr
OTU5LDggQEAgc3RhdGljIGludCBnbWNfdjdfMF9zd19pbml0KHZvaWQgKmhhbmRsZSkKPj4gICAg
IGludCBkbWFfYml0czsKPj4gICAgIHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gKHN0cnVj
dCBhbWRncHVfZGV2aWNlICopaGFuZGxlOwo+Pgo+PiArICAgIGFkZXYtPm51bV92bWh1YnMgPSAx
Owo+PiArCj4+ICAgICBpZiAoYWRldi0+ZmxhZ3MgJiBBTURfSVNfQVBVKSB7Cj4+ICAgICAgICAg
YWRldi0+Z21jLnZyYW1fdHlwZSA9IEFNREdQVV9WUkFNX1RZUEVfVU5LTk9XTjsKPj4gICAgIH0g
ZWxzZSB7Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjhf
MC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y4XzAuYwo+PiBpbmRleCBmN2Q2
YTA3YmE0ZTEuLjg4ZjNhMTcxNDUyZiAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvZ21jX3Y4XzAuYwo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9n
bWNfdjhfMC5jCj4+IEBAIC0xMDc5LDYgKzEwNzksOCBAQCBzdGF0aWMgaW50IGdtY192OF8wX3N3
X2luaXQodm9pZCAqaGFuZGxlKQo+PiAgICAgaW50IGRtYV9iaXRzOwo+PiAgICAgc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYgPSAoc3RydWN0IGFtZGdwdV9kZXZpY2UgKiloYW5kbGU7Cj4+Cj4+
ICsgICAgYWRldi0+bnVtX3ZtaHVicyA9IDE7Cj4+ICsKPj4gICAgIGlmIChhZGV2LT5mbGFncyAm
IEFNRF9JU19BUFUpIHsKPj4gICAgICAgICBhZGV2LT5nbWMudnJhbV90eXBlID0gQU1ER1BVX1ZS
QU1fVFlQRV9VTktOT1dOOwo+PiAgICAgfSBlbHNlIHsKPj4gLS0gCj4+IDIuMjAuMQo+Pgo+PiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBhbWQtZ2Z4
IG1haWxpbmcgbGlzdAo+PiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+PiBodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngKPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGFtZC1nZnggbWFpbGlu
ZyBsaXN0Cj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
