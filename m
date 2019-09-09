Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11026AD889
	for <lists+amd-gfx@lfdr.de>; Mon,  9 Sep 2019 14:09:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F9A789330;
	Mon,  9 Sep 2019 12:09:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CC5189330
 for <amd-gfx@lists.freedesktop.org>; Mon,  9 Sep 2019 12:09:45 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id n10so14387373wmj.0
 for <amd-gfx@lists.freedesktop.org>; Mon, 09 Sep 2019 05:09:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Q89lPC6p5lh8HQMIlNm6ZBosFnbW/adkpEhUpr9qLTU=;
 b=lbNaR6X1HERWxfiu+6vnh7sOcfxQvMczCVXARvTn664mBLb7txGit5+fP9Fvb8+zwf
 uF2EqTRXqZiWVoWdqjy0ScK/xAWxkOnvXw5jGBJcZ7rXctdy6viU9sQ+I/wBojeVB6iA
 Ty5eZHWWhlVdpD5Sl1J5R0+apkDzeDfBA/DDi86A1EMQrYZ6ZI28IZuJ1z62WPD9PCwe
 JRsx24j/KdwNZNbTv9aSUhUamYhFRJR3glifDJaKoHGUwkyWwjpOTAmT8ciUwBKk6cCy
 ljrPNfK2g0chL+YE5QbVbrKwm9f9s5OrSNcdWvN4WUVJh/5Bf5Enj5N2QGfTb13E9aKt
 jdyQ==
X-Gm-Message-State: APjAAAVe4xHL4eA7Oz0EA6gkHmYnQqtMefjeZhOtNGiIMfGl3mc50Ph6
 Ywu3lc9/h4y/Wv2Enfl2gi7BTBZY
X-Google-Smtp-Source: APXvYqy2y+mnb+yg6HaPXnszjJwCMKvGrFMdw7WXWpyQPyAQYimUXAxV96ikGRLx8GxiMAzwee7fow==
X-Received: by 2002:a05:600c:2105:: with SMTP id
 u5mr437477wml.150.1568030983697; 
 Mon, 09 Sep 2019 05:09:43 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id x17sm11551252wmj.19.2019.09.09.05.09.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 09 Sep 2019 05:09:42 -0700 (PDT)
Subject: Re: Graceful page fault handling for Vega/Navi
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20190904150230.13885-1-christian.koenig@amd.com>
 <03e2274c-a0dd-41f4-c5e0-26e371d01d23@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <03c26b98-10e3-32fd-4df8-0f4939c23284@gmail.com>
Date: Mon, 9 Sep 2019 14:09:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <03e2274c-a0dd-41f4-c5e0-26e371d01d23@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=Q89lPC6p5lh8HQMIlNm6ZBosFnbW/adkpEhUpr9qLTU=;
 b=AQpeS1jLwHUF7h2VUnL4aCOPoBGA1gFWy1CJGxlWzV5K7byOTqDX4wchcyZoozdjOa
 g1rGaKjjg8EvfvgxObWm2TpPjCRETLWJK+9AZB2qGRWIom8sb/XvNUijmWJ8Ywf8ZQLI
 FjKbtG3M21UDRjIFMAOfsLC8w7/679IX3P8gsnUnVhXyaXgByJmZhbM62uowJhtWnkRg
 tt6xVUMd9Y5V6AoCXc0aFaSXPsQ6KhYFEfFQZA6P6JpQft5p+brMzSfTvzX7U/G7T20U
 G7dqU2NJdU9hqTz3y7xSgh4sTKMKZhQHLXHsLER/3ejmyGf9hiH2GVWhY+b74jF+wvHA
 WGfA==
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

QW0gMDUuMDkuMTkgdW0gMDA6NTIgc2NocmllYiBLdWVobGluZywgRmVsaXg6Cj4gT24gMjAxOS0w
OS0wNCAxMTowMiBhLm0uLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+PiBIaSBldmVyeW9uZSwK
Pj4KPj4gdGhpcyBzZXJpZXMgaXMgdGhlIG5leHQgcHV6emxlIHBpZWNlIGZvciByZWNvdmVyYWJs
ZSBwYWdlIGZhdWx0IGhhbmRsaW5nIG9uIFZlZ2EgYW5kIE5hdmkuCj4+Cj4+IEl0IGFkZHMgYSBu
ZXcgZGlyZWN0IHNjaGVkdWxlciBlbnRpdHkgZm9yIFZNIHVwZGF0ZXMgd2hpY2ggaXMgdGhlbiB1
c2VkIHRvIHVwZGF0ZSBwYWdlIHRhYmxlcyBkdXJpbmcgYSBmYXVsdC4KPj4KPj4gSW4gb3RoZXIg
d29yZHMgcHJldmlvdXNseSBhbiBhcHBsaWNhdGlvbiBkb2luZyBhbiBpbnZhbGlkIG1lbW9yeSBh
Y2Nlc3Mgd291bGQganVzdCBoYW5nIGFuZC9vciByZXBlYXQgdGhlIGludmFsaWQgYWNjZXNzIG92
ZXIgYW5kIG92ZXIgYWdhaW4uIE5vdyB0aGUgaGFuZGxpbmcgaXMgbW9kaWZpZWQgc28gdGhhdCB0
aGUgaW52YWxpZCBtZW1vcnkgYWNjZXNzIGlzIHJlZGlyZWN0ZWQgdG8gdGhlIGR1bW15IHBhZ2Uu
Cj4+Cj4+IFRoaXMgbmVlZHMgdGhlIGZvbGxvd2luZyBwcmVyZXF1aXNpdGVzOgo+PiBhKSBUaGUg
ZmlybXdhcmUgbXVzdCBiZSBuZXcgZW5vdWdoIHNvIGFsbG93IHJlLXJvdXRpbmcgb2YgcGFnZSBm
YXVsdHMuCj4+IGIpIEZhdWx0IHJldHJ5IG11c3QgYmUgZW5hYmxlZCB1c2luZyB0aGUgYW1kZ3B1
Lm5vcmV0cnk9MCBwYXJhbWV0ZXIuCj4+IGMpIEVub3VnaCBmcmVlIFZSQU0gdG8gYWxsb2NhdGUg
cGFnZSB0YWJsZXMgdG8gcG9pbnQgdG8gdGhlIGR1bW15IHBhZ2UuCj4+Cj4+IFRoZSByZS1yb3V0
aW5nIG9mIHBhZ2UgZmF1bHRzIGN1cnJlbnQgb25seSB3b3JrcyBvbiBWZWdhMTAsIHNvIFZlZ2Ey
MCBhbmQgTmF2aSB3aWxsIHN0aWxsIG5lZWQgc29tZSBtb3JlIHRpbWUuCj4gV2FpdCwgd2UgZG9u
J3QgZG8gdGhlIHBhZ2UgZmF1bHQgcmVyb3V0aW5nIG9uIFZlZ2EyMCB5ZXQ/IFNvIHdlJ3JlCj4g
Z2V0dGluZyB0aGUgZnVsbCBicnVudCBvZiB0aGUgZmF1bHQgc3Rvcm0gb24gdGhlIG1haW4gaW50
ZXJydXB0IHJpbmc/CgpJdCdzIGltcGxlbWVudGVkLCBidXQgdGhlIFZlZ2EyMCBmaXJtd2FyZSBm
YWlscyB0byBlbmFibGUgdGhlIApyZS1yZW91dGluZyBmb3Igc29tZSByZWFzb24uCgpJIGhhdmVu
J3QgaGFkIHRpbWUgeWV0IHRvIHRhbGsgdG8gdGhlIGZpcm13YXJlIGd1eXMgd2h5IHRoYXQgaGFw
cGVucy4KCj4gSW4gdGhhdCBjYXNlLCB3ZSBzaG91bGQgcHJvYmFibHkgY2hhbmdlIHRoZSBkZWZh
dWx0IHNldHRpbmcgb2YKPiBhbWRncHUubm9yZXRyeT0xIGF0IGxlYXN0IHVudGlsIHRoYXQncyBk
b25lLgo+Cj4gT3RoZXIgdGhhbiB0aGF0IHRoZSBwYXRjaCBzZXJpZXMgbG9va3MgcmVhc29uYWJs
ZSB0byBtZS4gSSBjb21tZW50ZWQgb24KPiBwYXRjaGVzIDQgYW5kIDkgc2VwYXJhdGVseS4KPgo+
IFBhdGNoIDEgaXMgQWNrZWQtYnk6IEZlbGl4IEt1ZWhsaW5nIDxGZWxpeC5LdWVobGluZ0BhbWQu
Y29tPgo+Cj4gV2l0aCB0aGUgaXNzdWVzIGFkZHJlc3NlZCB0aGF0IEkgcG9pbnRlZCBvdXQsIHRo
ZSByZXN0IGlzCj4KPiBSZXZpZXdlZC1ieTogRmVsaXggS3VlaGxpbmcgPEZlbGl4Lkt1ZWhsaW5n
QGFtZC5jb20+CgpUaGFua3MsCkNocmlzdGlhbi4KCj4KPiBSZWdhcmRzLAo+ICAgwqAgRmVsaXgK
Pgo+Cj4+IFBsZWFzZSByZXZpZXcgYW5kL29yIGNvbW1lbnQsCj4+IENocmlzdGlhbi4KPj4KPj4K
Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4gYW1k
LWdmeCBtYWlsaW5nIGxpc3QKPj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPj4gaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxp
bmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
