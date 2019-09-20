Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 997DBB9764
	for <lists+amd-gfx@lfdr.de>; Fri, 20 Sep 2019 20:53:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C211B6FD94;
	Fri, 20 Sep 2019 18:53:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BB736FD94
 for <amd-gfx@lists.freedesktop.org>; Fri, 20 Sep 2019 18:53:02 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id i18so7777739wru.11
 for <amd-gfx@lists.freedesktop.org>; Fri, 20 Sep 2019 11:53:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DzrogO4Mp2n/6JjooPDr3UVydjK1nExDS8QqULwWngc=;
 b=sowLBtMGdvR6cylboPcTDDTfE/UE64je2gYryJM8HgVqBZAEtZ7iZ3+JBk3yJSEpE3
 TkTUOWOPsoiNStKSFMRVjN9VDxof68Ta5BQrMoJ3dipNz39Y+uEUNkCtQj2HYN96GiYO
 7pq8BFcwvp3wdiM3jwxbU3UOgZ+EXsZ/HM8wzBTe9FBR86GDLFG7DoVkChxjtiKdtqPA
 PUJO+Mi+2FqrUbgiSm//zJg4tILrvFkbZueecRq+KitatFPrE40nQEdDqMNSkyBFUyat
 OeG7mys2OoCbtlIAFdXOrX+f9mhUZRTdbWH/V2PVFESA8daCjeBQPgxx1AqML7AJZnC5
 UR0g==
X-Gm-Message-State: APjAAAXDS//xu0LK9GQKIzWm3+EDCJ+ewWEc7fND4NKNHJbOyelr3awF
 GEHgVEwkgM/g05Fxzk+w0ZwhL4F2lXCsnX2QnqA=
X-Google-Smtp-Source: APXvYqwTvmZt+c2h/ckTJXoD3c9sxwKRL/FqeEDgvtpvWP6CY/VLiOFhpLkJkEFFghg/5DoNEuA0ujnrtLPM64pTorA=
X-Received: by 2002:adf:e951:: with SMTP id m17mr13106863wrn.154.1569005580739; 
 Fri, 20 Sep 2019 11:53:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190920170059.5465-1-michel@daenzer.net>
In-Reply-To: <20190920170059.5465-1-michel@daenzer.net>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 20 Sep 2019 14:52:48 -0400
Message-ID: <CADnq5_OUnQWzYcYHj7BjiMUo2=-_v8g5MYfqgexb7yBUuwj1PA@mail.gmail.com>
Subject: Re: [PATCH xf86-video-ati] Don't set up black scanout buffer if
 LeaveVT is called from CloseScreen
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=DzrogO4Mp2n/6JjooPDr3UVydjK1nExDS8QqULwWngc=;
 b=Rf5wa4hzw8mxGUFPuIlx8acPwP9K1KUD0J7ZIS2uyg2u748CcmfNn/CiMuv05uAC8/
 ycwDuEVIFY2uKSNGS5SupbNVcl992ubnQNiRDcpJwBTrk+0oCmUCzYc25fn+tG5y/NIT
 X5oQq22lYHsSH0L129HU/OdLGkdI6jlk/An2diLcw5VeHp3ToP0vXhj8OrzTwEoZ0nZH
 RP7aRkifJ9QEXgruWurYcfjjPSlQoXa5gvxbuzoN4MCAY9GdCeamuMjvB2Y9v36MJWlo
 T1RMkfdSVdmJ1kOR0lwEGhpRgKSDs5YJeXNQauJ9+8P4TbysCZTeeLNH4TX2/bEWvXpJ
 MP/Q==
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gRnJpLCBTZXAgMjAsIDIwMTkgYXQgMTowMSBQTSBNaWNoZWwgRMOkbnplciA8bWljaGVsQGRh
ZW56ZXIubmV0PiB3cm90ZToKPgo+IEZyb206IE1pY2hlbCBEw6RuemVyIDxtZGFlbnplckByZWRo
YXQuY29tPgo+Cj4gQXZvaWRzIGEgY3Jhc2ggZGVzY3JpYmVkIGluCj4gaHR0cHM6Ly9naXRsYWIu
ZnJlZWRlc2t0b3Aub3JnL3hvcmcvZHJpdmVyL3hmODYtdmlkZW8tYW1kZ3B1L21lcmdlX3JlcXVl
c3RzLzQzI25vdGVfMjIzNzE4Cj4KPiAoUG9ydGVkIGZyb20gYW1kZ3B1IGNvbW1pdCA1YjhiYzlm
YzUwNWM1NTFkY2Q5YjBlZDVhYjgzNWE0OWZhNGY5ZmRhKQo+Cj4gU2lnbmVkLW9mZi1ieTogTWlj
aGVsIETDpG56ZXIgPG1kYWVuemVyQHJlZGhhdC5jb20+CgpSZXZpZXdlZC1ieTogQWxleCBEZXVj
aGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgoKPiAtLS0KPiAgc3JjL3JhZGVvbl9rbXMu
YyB8IDEwICsrKysrKysrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL3NyYy9yYWRlb25fa21zLmMgYi9zcmMvcmFkZW9u
X2ttcy5jCj4gaW5kZXggNzc3ZmMxNGVlLi4xMDdjMWNlNzEgMTAwNjQ0Cj4gLS0tIGEvc3JjL3Jh
ZGVvbl9rbXMuYwo+ICsrKyBiL3NyYy9yYWRlb25fa21zLmMKPiBAQCAtMjYyOSw2ICsyNjI5LDEy
IEBAIHZvaWQgUkFERU9OTGVhdmVWVF9LTVMoU2NybkluZm9QdHIgcFNjcm4pCj4gICAgICAgICB1
bnNpZ25lZCB3ID0gMCwgaCA9IDA7Cj4gICAgICAgICBpbnQgaTsKPgo+ICsgICAgICAgLyogSWYg
d2UncmUgY2FsbGVkIGZyb20gQ2xvc2VTY3JlZW4sIHRyeWluZyB0byBjbGVhciB0aGUgYmxhY2sK
PiArICAgICAgICAqIHNjYW5vdXQgQk8gd2lsbCBsaWtlbHkgY3Jhc2ggYW5kIGJ1cm4KPiArICAg
ICAgICAqLwo+ICsgICAgICAgaWYgKCFwU2NyZWVuLT5HQ3BlckRlcHRoWzBdKQo+ICsgICAgICAg
ICAgIGdvdG8gaGlkZV9jdXJzb3JzOwo+ICsKPiAgICAgICAgIC8qIENvbXB1dGUgbWF4aW11bSBz
Y2Fub3V0IGRpbWVuc2lvbnMgb2YgYWN0aXZlIENSVENzICovCj4gICAgICAgICBmb3IgKGkgPSAw
OyBpIDwgeGY4Nl9jb25maWctPm51bV9jcnRjOyBpKyspIHsKPiAgICAgICAgICAgICBjcnRjID0g
eGY4Nl9jb25maWctPmNydGNbaV07Cj4gQEAgLTI3MDEsOCArMjcwNywxMCBAQCB2b2lkIFJBREVP
TkxlYXZlVlRfS01TKFNjcm5JbmZvUHRyIHBTY3JuKQo+ICAgICAgICAgICAgICAgIHBTY3JuLT5k
aXNwbGF5V2lkdGggKiBpbmZvLT5waXhlbF9ieXRlcyAqIHBTY3JuLT52aXJ0dWFsWSk7Cj4gICAg
ICB9Cj4KPiAtICAgIFRpbWVyU2V0KE5VTEwsIDAsIDEwMDAsIGNsZWFudXBfYmxhY2tfZmIsIHBT
Y3JlZW4pOwo+ICsgICAgaWYgKHBTY3JlZW4tPkdDcGVyRGVwdGhbMF0pCj4gKyAgICAgICBUaW1l
clNldChOVUxMLCAwLCAxMDAwLCBjbGVhbnVwX2JsYWNrX2ZiLCBwU2NyZWVuKTsKPgo+ICsgaGlk
ZV9jdXJzb3JzOgo+ICAgICAgeGY4Nl9oaWRlX2N1cnNvcnMgKHBTY3JuKTsKPgo+ICAgICAgcmFk
ZW9uX2Ryb3BfZHJtX21hc3RlcihwU2Nybik7Cj4gLS0KPiAyLjIzLjAKPgo+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYW1kLWdmeCBtYWlsaW5nIGxp
c3QKPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2FtZC1nZng=
