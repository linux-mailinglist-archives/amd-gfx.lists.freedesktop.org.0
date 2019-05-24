Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77AD929C5B
	for <lists+amd-gfx@lfdr.de>; Fri, 24 May 2019 18:32:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2CC56E120;
	Fri, 24 May 2019 16:32:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10D5E6E120
 for <amd-gfx@lists.freedesktop.org>; Fri, 24 May 2019 16:32:56 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id i125so6297003qkd.6
 for <amd-gfx@lists.freedesktop.org>; Fri, 24 May 2019 09:32:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7JEiTdPVCIFQdDUK8gYkULbjQdi6LzSI19f3jsOolXA=;
 b=OGmXQPCO5aiNxMrlmGcd6qvScV1BsTbP4leWMnTsoYijGSwEQ66hn4kdJ2C89tHl1y
 /xVz/mLR8hfOLkQ7WnwfLbo4e00qIzsl05it8yF6R9DHE/r287o6C+f5z+oNDjinkHk9
 tr7WEcApIsPBDuCjsf4lE1iR0l423rhV2Kgdu2vG/5+OQHfpTP3wEweSgOMbbtTtLuP/
 W/m4cpfjU29pdk5fxmb1mGHz7JzXq3pP7kQyHv35fQ7m7avYyCOH+KmwwRRKA8CBhLAu
 n32hpH/qSBjZ371GAWJewT5l3cSHA3v6cOJ+hCO4MTR9YzxfcK8SE5vLKGs1VtdtlaIX
 KsDg==
X-Gm-Message-State: APjAAAXsbEtvRfr0O9e4vxLVuGpmYXYMg6zCQm65Yoob55oGCfIO2KfW
 Hma6G5kygGMMcOe2+40DeufgzBN2qgfhiDtheqVgWuIZWek=
X-Google-Smtp-Source: APXvYqxYdKVV/8Z7jqxrd4PGccsInkiA4fhiupq8gF3tQUXKiZbIhhfTAbiz8YkdFjqcsNHfo+Q2OjRtYmk5x+I2d9g=
X-Received: by 2002:ac8:534d:: with SMTP id d13mr47604011qto.217.1558715574951; 
 Fri, 24 May 2019 09:32:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190524153410.19402-1-alexander.deucher@amd.com>
 <CAHbf0-FPr8EZoZeDJKpGp3=wF38JeG7fY-Ayq96jSqq3hMNM+g@mail.gmail.com>
 <CADnq5_OGKUHGCSyFFQhmk5w1j+x5LQahh6KPbDfR2xnREdR3EA@mail.gmail.com>
In-Reply-To: <CADnq5_OGKUHGCSyFFQhmk5w1j+x5LQahh6KPbDfR2xnREdR3EA@mail.gmail.com>
From: Mike Lothian <mike@fireburn.co.uk>
Date: Fri, 24 May 2019 17:32:42 +0100
Message-ID: <CAHbf0-EYvnaVmqB068CA9hi3Wt7U2a387n6SCUdw8sUjouayZQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Don't load DMCU for Raven 1 (v2)
To: Alex Deucher <alexdeucher@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fireburn-co-uk.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=7JEiTdPVCIFQdDUK8gYkULbjQdi6LzSI19f3jsOolXA=;
 b=JWWY34bf57x5nejLM6ABDjAsfbAefju5JNa2pbQTKUh3PwauoxTcPsqtzEUAjC9wBU
 5A6TTXmHEb8+8R25UPRarpwSkZRG7EhfRdA2RGp49IjKIDDIc5wowc7USygz2s7aisxP
 +1LuUwKrgU+W3jkszuFAgCRDh6tAzG7VVXvcq3QamKZjQ+ssJQezf2YY4iU8iFFn2eRM
 k81NPiECRSr0feJvT0n4OL7N9QAGtpR2hF6pvto0xKYHKDm7r2CVVbeiCQ7o8+x8lT60
 RoJONSUGQkP0i9qcTBm+5oZ1lcuAuLkj/vHK91HDK9UxnH1nsZcpJrTVFBn6ZdirPD07
 7NsA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 "for 3.8" <stable@vger.kernel.org>, Harry Wentland <harry.wentland@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SSByZWFsaXNlIHlvdSBkb24ndCB3YW50IHRvIGVuYWJsZSB0aGlzIGFzIGl0J3MgYnJlYWtpbmcg
c29tZSBwZW9wbGUncwpzeXN0ZW1zLCBidXQgY291bGQgd2UgYWRkIGEgbmV3IGJvb3QgcGFyYW1l
dGVyIHRvIGZvcmNlIGl0IGZvciB3b3JraW5nCnN5c3RlbXM/IE9yIGNoZWNrIGFnYWluc3QgYSBi
bGFjayBsaXN0IG1heWJlPwoKT24gRnJpLCAyNCBNYXkgMjAxOSBhdCAxNzoyMCwgQWxleCBEZXVj
aGVyIDxhbGV4ZGV1Y2hlckBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCBNYXkgMjQsIDIw
MTkgYXQgMTI6MDkgUE0gTWlrZSBMb3RoaWFuIDxtaWtlQGZpcmVidXJuLmNvLnVrPiB3cm90ZToK
PiA+Cj4gPiBIaQo+ID4KPiA+IEN1cmlvdXMgdG8ga25vdyB3aGF0IHRoaXMgbWVhbnMgZm9yIGZv
bGsgdGhhdCBoYXZlIG5ld2VyIFJhdmVuMSBib2FyZHMKPiA+IHRoYXQgZGlkbid0IGhhdmUgaXNz
dWVzIGxvYWRpbmcgdGhlIGZpcm13YXJlCj4KPiBZb3Ugd29uJ3QgZ2V0IEFCTSBJIHRoaW5rLiAg
QUJNIGlzIHRoZSBhdXRvbWF0aWMgYmFja2xpZ2h0IG1hbmFnZW1lbnQuCj4KPiBBbGV4Cj4KPiA+
Cj4gPiBDaGVlcnMKPiA+Cj4gPiBNaWtlCj4gPgo+ID4gT24gRnJpLCAyNCBNYXkgMjAxOSBhdCAx
NjozNCwgQWxleCBEZXVjaGVyIDxhbGV4ZGV1Y2hlckBnbWFpbC5jb20+IHdyb3RlOgo+ID4gPgo+
ID4gPiBGcm9tOiBIYXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4KPiA+ID4K
PiA+ID4gW1dIWV0KPiA+ID4gU29tZSBlYXJseSBSYXZlbiBib2FyZHMgaGFkIGEgYmFkIFNCSU9T
IHRoYXQgZG9lc24ndCBwbGF5IG5pY2VseSB3aXRoCj4gPiA+IHRoZSBETUNVIEZXLiBXZSB0aG91
Z2h0IHRoZSBpc3N1ZXMgd2VyZSBmaXhlZCBieSBpZ25vcmluZyBlcnJvcnMgb24gRE1DVQo+ID4g
PiBsb2FkIGJ1dCB0aGF0IGRvZXNuJ3Qgc2VlbSB0byBiZSB0aGUgY2FzZS4gV2UndmUgc3RpbGwg
c2VlbiByZXBvcnRzIG9mCj4gPiA+IHVzZXJzIHVuYWJsZSB0byBib290IHRoZWlyIHN5c3RlbXMg
YXQgYWxsLgo+ID4gPgo+ID4gPiBbSE9XXQo+ID4gPiBEaXNhYmxlIERNQ1UgbG9hZCBvbiBSYXZl
biAxLiBPbmx5IGxvYWQgaXQgZm9yIFJhdmVuIDIgYW5kIFBpY2Fzc28uCj4gPiA+Cj4gPiA+IHYy
OiBGaXggaWZkZWYgKEFsZXgpCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEhhcnJ5IFdlbnRs
YW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPgo+ID4gPiBSZXZpZXdlZC1ieTogTmljaG9sYXMg
S2F6bGF1c2thcyA8bmljaG9sYXMua2F6bGF1c2thc0BhbWQuY29tPgo+ID4gPiBTaWduZWQtb2Zm
LWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cj4gPiA+IENjOiBz
dGFibGVAdmdlci5rZXJuZWwub3JnCj4gPiA+IC0tLQo+ID4gPiAgZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyB8IDEyICsrKysrKysrKystLQo+ID4gPiAg
MSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPiA+Cj4g
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2Ft
ZGdwdV9kbS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVf
ZG0uYwo+ID4gPiBpbmRleCA5OTVmOWRmNjYxNDIuLmJjYjFhOTNjMGI0YyAxMDA2NDQKPiA+ID4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwo+
ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9k
bS5jCj4gPiA+IEBAIC0yOSw2ICsyOSw3IEBACj4gPiA+ICAjaW5jbHVkZSAiZG1fc2VydmljZXNf
dHlwZXMuaCIKPiA+ID4gICNpbmNsdWRlICJkYy5oIgo+ID4gPiAgI2luY2x1ZGUgImRjL2luYy9j
b3JlX3R5cGVzLmgiCj4gPiA+ICsjaW5jbHVkZSAiZGFsX2FzaWNfaWQuaCIKPiA+ID4KPiA+ID4g
ICNpbmNsdWRlICJ2aWQuaCIKPiA+ID4gICNpbmNsdWRlICJhbWRncHUuaCIKPiA+ID4gQEAgLTY0
MCw3ICs2NDEsNyBAQCBzdGF0aWMgdm9pZCBhbWRncHVfZG1fZmluaShzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldikKPiA+ID4KPiA+ID4gIHN0YXRpYyBpbnQgbG9hZF9kbWN1X2Z3KHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2KQo+ID4gPiAgewo+ID4gPiAtICAgICAgIGNvbnN0IGNoYXIgKmZ3
X25hbWVfZG1jdTsKPiA+ID4gKyAgICAgICBjb25zdCBjaGFyICpmd19uYW1lX2RtY3UgPSBOVUxM
Owo+ID4gPiAgICAgICAgIGludCByOwo+ID4gPiAgICAgICAgIGNvbnN0IHN0cnVjdCBkbWN1X2Zp
cm13YXJlX2hlYWRlcl92MV8wICpoZHI7Cj4gPiA+Cj4gPiA+IEBAIC02NjMsNyArNjY0LDE0IEBA
IHN0YXRpYyBpbnQgbG9hZF9kbWN1X2Z3KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQo+ID4g
PiAgICAgICAgIGNhc2UgQ0hJUF9WRUdBMjA6Cj4gPiA+ICAgICAgICAgICAgICAgICByZXR1cm4g
MDsKPiA+ID4gICAgICAgICBjYXNlIENISVBfUkFWRU46Cj4gPiA+IC0gICAgICAgICAgICAgICBm
d19uYW1lX2RtY3UgPSBGSVJNV0FSRV9SQVZFTl9ETUNVOwo+ID4gPiArI2lmIGRlZmluZWQoQ09O
RklHX0RSTV9BTURfRENfRENOMV8wMSkKPiA+ID4gKyAgICAgICAgICAgICAgIGlmIChBU0lDUkVW
X0lTX1BJQ0FTU08oYWRldi0+ZXh0ZXJuYWxfcmV2X2lkKSkKPiA+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgZndfbmFtZV9kbWN1ID0gRklSTVdBUkVfUkFWRU5fRE1DVTsKPiA+ID4gKyAgICAg
ICAgICAgICAgIGVsc2UgaWYgKEFTSUNSRVZfSVNfUkFWRU4yKGFkZXYtPmV4dGVybmFsX3Jldl9p
ZCkpCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGZ3X25hbWVfZG1jdSA9IEZJUk1XQVJF
X1JBVkVOX0RNQ1U7Cj4gPiA+ICsgICAgICAgICAgICAgICBlbHNlCj4gPiA+ICsjZW5kaWYKPiA+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIDA7Cj4gPiA+ICAgICAgICAgICAgICAg
ICBicmVhazsKPiA+ID4gICAgICAgICBkZWZhdWx0Ogo+ID4gPiAgICAgICAgICAgICAgICAgRFJN
X0VSUk9SKCJVbnN1cHBvcnRlZCBBU0lDIHR5cGU6IDB4JVhcbiIsIGFkZXYtPmFzaWNfdHlwZSk7
Cj4gPiA+IC0tCj4gPiA+IDIuMjAuMQo+ID4gPgo+ID4gPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+ID4g
PiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+ID4gPiBodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hbWQtZ2Z4
