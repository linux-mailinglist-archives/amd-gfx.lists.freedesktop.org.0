Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FAE18CF2
	for <lists+amd-gfx@lfdr.de>; Thu,  9 May 2019 17:27:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0905B89DB7;
	Thu,  9 May 2019 15:27:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80C1989DB7
 for <amd-gfx@lists.freedesktop.org>; Thu,  9 May 2019 15:27:43 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id w8so1217803wrl.6
 for <amd-gfx@lists.freedesktop.org>; Thu, 09 May 2019 08:27:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6kQ2Qw9rcfdJJ02MOLXLJj4GqVsayB+nVb2EaTer6RM=;
 b=Wo/RpGlm4d2F3seHHq1rfRI3yfAZwdFWtMJSEM3LVaLOl1PHu4muLW0N5q1gJUwNdQ
 ysRNXKd8S0Inv7eAidiNAlPWQNGqVLZkp495SvIYmAUjHMX09hx35Z33ouSpO6xkwq9a
 kGMF+8hTavrRo3sDHUneclaz3jyz8URkl9yva4fkKm0XfBrErEsa+C0wbVgsrI1px/h+
 Cokyzt4pBF7dE34oVsBSD2a+GIL3JQy9GQVUQWXmj1V4Oybf4hO98gTDAmbmn7XpUjBw
 BEsBct7gzBnMwobZ/DxTtDqVapF9nYUyYOawLtdGfFXCMCjVfPvfiqJ7/ZyS8mUsgdqp
 w0rA==
X-Gm-Message-State: APjAAAVlzaG5AvTBPlDiUbghd80OEpt3a9iQ6hVd8F5D9r2hasw9A12a
 j3U8mR7WHyIEznbtpqUg883o4Gk1+ShIYamsasvcsg==
X-Google-Smtp-Source: APXvYqzmwkQhnUcQuwsVgdEoBRqf7hpQJhbhSgIRiWCVYfr32nDYdG1Ol1x3hkoDW30mkpk2GrvLONbJsJtKcYPZZgQ=
X-Received: by 2002:adf:dc8a:: with SMTP id r10mr3690170wrj.15.1557415662189; 
 Thu, 09 May 2019 08:27:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190509103820.3657-1-michel@daenzer.net>
In-Reply-To: <20190509103820.3657-1-michel@daenzer.net>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 9 May 2019 11:27:30 -0400
Message-ID: <CADnq5_NiAiW2z=ztOadCKA6HszZ4KfEN8F8YLnq1GmRzHD4-Mw@mail.gmail.com>
Subject: Re: [PATCH xf86-video-ati] dri3: Always flush glamor before sharing
 pixmap storage with clients
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6kQ2Qw9rcfdJJ02MOLXLJj4GqVsayB+nVb2EaTer6RM=;
 b=oRhtf48rntz0PH1PlUnOkMBrL9FSRprlSkrBUPCvj5xnTB1ggglLZbKyA5cK+fEyyM
 UHwPxxUEkr3KO8Dz1/fWn1gTFzt/o4/EcY4P5DzNmEVuHoTU7trS3+L28247XZDrjoX3
 3Hh1ddHpl6cSCmfxI007ugMA6R8nf0bN+k18xcyjpEX6Qe9Vv0nIG0oDJbpi8VIVKK1m
 F9ag71HQVGLGkgVXPwrDxuL6zhD1lnqYOcoIAp6fw5wvMLWpsp1qBqiMb276UoyL00uf
 DuwCE09dEzF1p4r7KG/XORrVTYdocOAuEoCnJJ0e9lBkQGS0Q5UMTIkseEh8vtAjtNtX
 wg2w==
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

T24gVGh1LCBNYXkgOSwgMjAxOSBhdCA2OjM4IEFNIE1pY2hlbCBEw6RuemVyIDxtaWNoZWxAZGFl
bnplci5uZXQ+IHdyb3RlOgo+Cj4gRnJvbTogTWljaGVsIETDpG56ZXIgPG1pY2hlbC5kYWVuemVy
QGFtZC5jb20+Cj4KPiBFdmVuIGlmIGdsYW1vcl9nYm1fYm9fZnJvbV9waXhtYXAgLyBnbGFtb3Jf
ZmRfZnJvbV9waXhtYXAgdGhlbXNlbHZlcwo+IGRvbid0IHRyaWdnZXIgYW55IGRyYXdpbmcsIHRo
ZXJlIGNvdWxkIGFscmVhZHkgYmUgdW5mbHVzaGVkIGRyYXdpbmcgdG8KPiB0aGUgcGl4bWFwIHdo
b3NlIHN0b3JhZ2Ugd2Ugc2hhcmUgd2l0aCBhIGNsaWVudC4KPgo+IChQb3J0ZWQgZnJvbSBhbWRn
cHUgY29tbWl0IDRiMTc1MzNmY2IzMDg0MmNhZjAwMzViYTU5M2I3ZDk4NjUyMGNjODUpCj4KPiBT
aWduZWQtb2ZmLWJ5OiBNaWNoZWwgRMOkbnplciA8bWljaGVsLmRhZW56ZXJAYW1kLmNvbT4KCkFj
a2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cgo+IC0tLQo+
ICBzcmMvcmFkZW9uX2RyaTMuYyB8IDI2ICsrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gIDEg
ZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDIxIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAt
LWdpdCBhL3NyYy9yYWRlb25fZHJpMy5jIGIvc3JjL3JhZGVvbl9kcmkzLmMKPiBpbmRleCA3MzM1
M2JmNTEuLmY4ZjkxYzRiNCAxMDA2NDQKPiAtLS0gYS9zcmMvcmFkZW9uX2RyaTMuYwo+ICsrKyBi
L3NyYy9yYWRlb25fZHJpMy5jCj4gQEAgLTIyMCwyOSArMjIwLDEzIEBAIHN0YXRpYyBpbnQgcmFk
ZW9uX2RyaTNfZmRfZnJvbV9waXhtYXAoU2NyZWVuUHRyIHNjcmVlbiwKPiAgICAgICAgIFJBREVP
TkluZm9QdHIgaW5mbyA9IFJBREVPTlBUUihzY3JuKTsKPgo+ICAgICAgICAgaWYgKGluZm8tPnVz
ZV9nbGFtb3IpIHsKPiAtICAgICAgICAgICAgICAgQm9vbCBuZWVkX2ZsdXNoID0gVFJVRTsKPiAt
ICAgICAgICAgICAgICAgaW50IHJldCA9IC0xOwo+IC0jaWYgWE9SR19WRVJTSU9OX0NVUlJFTlQg
Pj0gWE9SR19WRVJTSU9OX05VTUVSSUMoMSwxOSw5OSw5MDQsMCkKPiAtICAgICAgICAgICAgICAg
c3RydWN0IGdibV9ibyAqZ2JtX2JvID0gZ2xhbW9yX2dibV9ib19mcm9tX3BpeG1hcChzY3JlZW4s
IHBpeG1hcCk7Cj4gKyAgICAgICAgICAgICAgIGludCByZXQgPSBnbGFtb3JfZmRfZnJvbV9waXht
YXAoc2NyZWVuLCBwaXhtYXAsIHN0cmlkZSwgc2l6ZSk7Cj4KPiAtICAgICAgICAgICAgICAgaWYg
KGdibV9ibykgewo+IC0gICAgICAgICAgICAgICAgICAgICAgIHJldCA9IGdibV9ib19nZXRfZmQo
Z2JtX2JvKTsKPiAtICAgICAgICAgICAgICAgICAgICAgICBnYm1fYm9fZGVzdHJveShnYm1fYm8p
Owo+IC0KPiAtICAgICAgICAgICAgICAgICAgICAgICBpZiAocmV0ID49IDApCj4gLSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBuZWVkX2ZsdXNoID0gRkFMU0U7Cj4gLSAgICAgICAgICAg
ICAgIH0KPiAtI2VuZGlmCj4gLQo+IC0gICAgICAgICAgICAgICBpZiAocmV0IDwgMCkKPiAtICAg
ICAgICAgICAgICAgICAgICAgICByZXQgPSBnbGFtb3JfZmRfZnJvbV9waXhtYXAoc2NyZWVuLCBw
aXhtYXAsIHN0cmlkZSwgc2l6ZSk7Cj4gLQo+IC0gICAgICAgICAgICAgICAvKiBnbGFtb3IgbWln
aHQgaGF2ZSBuZWVkZWQgdG8gcmVhbGxvY2F0ZSB0aGUgcGl4bWFwIHN0b3JhZ2UgYW5kCj4gLSAg
ICAgICAgICAgICAgICAqIGNvcHkgdGhlIHBpeG1hcCBjb250ZW50cyB0byB0aGUgbmV3IHN0b3Jh
Z2UuIFRoZSBjb3B5Cj4gLSAgICAgICAgICAgICAgICAqIG9wZXJhdGlvbiBuZWVkcyB0byBiZSBm
bHVzaGVkIHRvIHRoZSBrZXJuZWwgZHJpdmVyIGJlZm9yZSB0aGUKPiAtICAgICAgICAgICAgICAg
ICogY2xpZW50IHN0YXJ0cyB1c2luZyB0aGUgcGl4bWFwIHN0b3JhZ2UgZm9yIGRpcmVjdCByZW5k
ZXJpbmcuCj4gKyAgICAgICAgICAgICAgIC8qIEFueSBwZW5kaW5nIGRyYXdpbmcgb3BlcmF0aW9u
cyBuZWVkIHRvIGJlIGZsdXNoZWQgdG8gdGhlCj4gKyAgICAgICAgICAgICAgICAqIGtlcm5lbCBk
cml2ZXIgYmVmb3JlIHRoZSBjbGllbnQgc3RhcnRzIHVzaW5nIHRoZSBwaXhtYXAKPiArICAgICAg
ICAgICAgICAgICogc3RvcmFnZSBmb3IgZGlyZWN0IHJlbmRlcmluZy4KPiAgICAgICAgICAgICAg
ICAgICovCj4gLSAgICAgICAgICAgICAgIGlmIChyZXQgPj0gMCAmJiBuZWVkX2ZsdXNoKQo+ICsg
ICAgICAgICAgICAgICBpZiAocmV0ID49IDApCj4gICAgICAgICAgICAgICAgICAgICAgICAgcmFk
ZW9uX2NzX2ZsdXNoX2luZGlyZWN0KHNjcm4pOwo+Cj4gICAgICAgICAgICAgICAgIHJldHVybiBy
ZXQ7Cj4gLS0KPiAyLjIwLjEKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPiBhbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
