Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4B38E364
	for <lists+amd-gfx@lfdr.de>; Thu, 15 Aug 2019 06:09:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A899A6E894;
	Thu, 15 Aug 2019 04:09:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B8DB6E894
 for <amd-gfx@lists.freedesktop.org>; Thu, 15 Aug 2019 04:09:15 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id c3so1054145wrd.7
 for <amd-gfx@lists.freedesktop.org>; Wed, 14 Aug 2019 21:09:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=546SIYBv6sU4GQqhgJIY0zPiimc9YJZgM300Htau8wM=;
 b=GZF+7P04fQz/e5aJs2O7NoK2WTOjt6pP+W+GCxeG/IshrqwvdOmF3FgD/JNlpMPOH/
 DVdC7Dwy5H20fu41AMKSHOTswIhyw/PF+CrAPMeQRx9WeYZ33jPs9TmuF8xyuFuPOVnJ
 5W0vqWZFzxjryyByc4vuKo4onsj7Bo3j6Buf45Pj/te3UVz0cz5JuRliof6KYDHOHYri
 XxZuGKHYTfsO6uhU/wm4f9zRqqJWZtuj5iE9EKVqyuOkT56QQQX1HTgHQ3wlBi0iJ920
 3BGBjN8DqJxfGmELolNfD5+fcsKhXQeCQAMCQ8UJvUvN7QTBcr7thaOlEB3X7h7GlBZ9
 UXkg==
X-Gm-Message-State: APjAAAWgLZ4jLRL/yiuvUdfS81fTwjfbYCj6iCOsnfcMxBwe9u+owktg
 KBnrK/yMBOSLQMxgF2KzW5ABLglaROzeBec2Gy4=
X-Google-Smtp-Source: APXvYqzAvS4N63aLHsrlamPceLIbxb+eEIIKyw6h8vUBpktzQMdFUTl7dohkyfQE1g/6XYLI7hrt+MXJF0G0a/CSvgc=
X-Received: by 2002:a5d:6ccd:: with SMTP id c13mr3087020wrc.4.1565842154125;
 Wed, 14 Aug 2019 21:09:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190815034123.963-1-xiaojie.yuan@amd.com>
In-Reply-To: <20190815034123.963-1-xiaojie.yuan@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 15 Aug 2019 00:09:02 -0400
Message-ID: <CADnq5_MSexqjX=G=p5cFi3XAuU5AvRTFtY_6Zggx69Mk32EmMw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/powerplay: disable gfxoff for navi12
To: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=546SIYBv6sU4GQqhgJIY0zPiimc9YJZgM300Htau8wM=;
 b=Su7gJUibcv2BM8o6KNE6GRDULQr2m0r7I1Eb93itt50shtQxLCald29Q4r3bcZYd28
 0XYAfdc9LWk0aadk4KQdb5dxWM+BXXb/DOlQNwb4pp47Q8oXS82iViAVF/9+6de3FU/t
 F2tblhSjSFo43jjL6cGmELSvsNn2w2Ms2doqZeiCnFfJl9l2KisTD1lc0IV+rYBH7rjI
 7KjVfXLAIo+mrRSLlGqeOxEa7D7kdEB4tFmQZ5ESnRwT0CgFBK+OOJBwnNb4Jga5SoHf
 ecIha5SAgTFS69evOA9bzo7tQCiLQVwZVC1SeMI7c4+hU46/ZRyy8jLbnO9htU9QsnFy
 zFEA==
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
Cc: "Xiao, Jack" <Jack.Xiao@amd.com>, "Feng, Kenneth" <Kenneth.Feng@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QWNrZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KCk9uIFdl
ZCwgQXVnIDE0LCAyMDE5IGF0IDExOjQxIFBNIFl1YW4sIFhpYW9qaWUgPFhpYW9qaWUuWXVhbkBh
bWQuY29tPiB3cm90ZToKPgo+IGdmeG9mZiBkb2Vzbid0IHdvcmsgb24gbmF2aTEyIHlldCwgc28g
ZGlzYWJsZSBpdCBmb3Igbm93Cj4KPiBTaWduZWQtb2ZmLWJ5OiBYaWFvamllIFl1YW4gPHhpYW9q
aWUueXVhbkBhbWQuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhf
djEwXzAuYyB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPgo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jCj4gaW5kZXggMDY2YmE1OTNhZjIzLi5kNjQ0
NjY5ZTVkOTMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Yx
MF8wLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYwo+IEBA
IC01ODAsNiArNTgwLDcgQEAgc3RhdGljIHZvaWQgZ2Z4X3YxMF8wX2NoZWNrX2dmeG9mZl9mbGFn
KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQo+ICB7Cj4gICAgICAgICBzd2l0Y2ggKGFkZXYt
PmFzaWNfdHlwZSkgewo+ICAgICAgICAgY2FzZSBDSElQX05BVkkxMDoKPiArICAgICAgIGNhc2Ug
Q0hJUF9OQVZJMTI6Cj4gICAgICAgICAgICAgICAgIGFkZXYtPnBtLnBwX2ZlYXR1cmUgJj0gflBQ
X0dGWE9GRl9NQVNLOwo+ICAgICAgICAgICAgICAgICBicmVhazsKPiAgICAgICAgIGRlZmF1bHQ6
Cj4gLS0KPiAyLjIwLjEKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
YW1kLWdmeApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwph
bWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
