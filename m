Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4AF7D4C04
	for <lists+amd-gfx@lfdr.de>; Sat, 12 Oct 2019 04:06:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 103C56E92E;
	Sat, 12 Oct 2019 02:06:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB7F46E133
 for <amd-gfx@lists.freedesktop.org>; Sat, 12 Oct 2019 02:06:22 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id i16so12051827wmd.3
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 19:06:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RI9c+oh9/uIkHx5Gs1c/2UyxQxJxhzywxULbyDL0ML0=;
 b=WiBLrj2RizNpNrGoh3lapbQ9eVkAR5v4e8mZGveEngeGuxUvbFLXHySrb6Iaxzwvdu
 ZmmrNX8PUlEgRHIQ3F9ZLCJgi1RPZkcT30QQ8iqlQfNvovjcwJzCbulAEg1sfaR+K8PJ
 kIQBuoK8ADFiLWXedurOAFS8/V6xVWDFmLirgoQWuYkEThxycmvXfa6P5Y0rHGOlEn/q
 F96+Y8l64DjosJ6XLqj39z0bCxsFHq2R72Krm78iY+KhnKDDvvt8dm17SsYcyukXQG7D
 vcL0PgRQVeEaddMOiaZ5cieFKouT0DAidPhBO2rf+a24o56rgrNVYJBdUzPVUuAS1/q8
 bQ1Q==
X-Gm-Message-State: APjAAAUApszfHZaxN15ysvZStmOg8h7yWn3rIqu6C0iCEqFtQt+Y3h8B
 bKi9V/uLWFVaQOEl30WMbxO3iW0FmCFsc4jKT+gc9w==
X-Google-Smtp-Source: APXvYqywYK50VOdZE3jghuubnxd69cT2Yy3BgbbN3JEeI9b3gG1nasQ6cvzDruov4VKTGy30dqYhn+eX9kTyw8/0lIA=
X-Received: by 2002:a1c:d0:: with SMTP id 199mr5682756wma.67.1570845981099;
 Fri, 11 Oct 2019 19:06:21 -0700 (PDT)
MIME-Version: 1.0
References: <1570790025-8274-1-git-send-email-kenneth.feng@amd.com>
In-Reply-To: <1570790025-8274-1-git-send-email-kenneth.feng@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 11 Oct 2019 22:06:06 -0400
Message-ID: <CADnq5_PFWAma2Fb+kwXeaXsU=ybXcDXCOJ9EtqS5BCd-T5LvQA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/amd/powerplay: bug fix for pcie parameters override
To: Kenneth Feng <kenneth.feng@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=RI9c+oh9/uIkHx5Gs1c/2UyxQxJxhzywxULbyDL0ML0=;
 b=pfHBF3Jmua8Tb+wDx149zzfl43RiztQ71049xAmiTD6Nw6OctrHHdMUpIdCup6G+5I
 awunfd8Wz2MRw8X5vetv34lqkR8eHvVeKIUr5SC771xrwtcXkLp7sHfjaKH+RjoFwlPF
 5C0N6VKU8bclp3KNP4gXOznLSy8mn8RrJ518Y9p8cTGublrIr+JBZtD+Upin99IzSXED
 50Y1opM0GygvoodKKEnlY64k9nWcl6oqTwkIixAUXWBOBeUHdDsiixuBOREGltEMlR28
 XeTiPGqq2UiGGvTwbvlVuRt00iwQtksXxPlc5AK6IbdJSt47crWFmwEehXqUNulQ1N1f
 V/uA==
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

T24gRnJpLCBPY3QgMTEsIDIwMTkgYXQgNjozNCBBTSBLZW5uZXRoIEZlbmcgPGtlbm5ldGguZmVu
Z0BhbWQuY29tPiB3cm90ZToKPgo+IEJ1ZyBmaXggZm9yIHBjaWUgcGFyYW1lcmVycyBvdmVycmlk
ZSBvbiBzd3NtdS4KPiBCZWxvdyBpcyBhIHNjZW5hcmlvIHRvIGhhdmUgdGhpcyBwcm9ibGVtLgo+
IHBwdGFibGUgZGVmaW5pdGlvbiBvbiBwY2llIGRwbToKPiAwIC0+IHBjaWUgZ2VuIHNwZWVkOjEs
IHBjaWUgbGFuZXM6ICoxNgo+IDEgLT4gcGNpZSBnZW4gc3BlZWQ6NCwgcGNpZSBsYW5lczogKjE2
Cj4gVGhlbiBpZiB3ZSBoYXZlIGEgc3lzdGVtIG9ubHkgaGF2ZSB0aGUgY2FwYmlsaXR5Ogo+IHBj
aWUgZ2VuIHNwZWVkOiAzLCBwY2llIGxhbmVzOiAqOCwKPiB3ZSB3aWxsIG92ZXJyaWRlIGRwbSAx
IHRvIHBjaWUgZ2VuIHNwZWVkIDMsIHBjaWUgbGFuZXMgKjguCj4gQnV0IHRoZSBjb2RlIHNraXBz
IHRoZSBkcG0gMCBjb25maWd1cmF0aW9uLgo+IFNvIHRoZSByZWFsIHBjaWUgZHBtIHBhcmFtZXRl
cnMgYXJlOgo+IDAgLT4gcGNpZSBnZW4gc3BlZWQ6MSwgcGNpZSBsYW5lczogKjE2Cj4gMSAtPiBw
Y2llIGdlbiBzcGVlZDozLCBwY2llIGxhbmVzOiAqOAo+IFRoZW4gdGhlIHdyb25nIHBjaWUgbGFu
ZXMgd2lsbCBiZSB0b2dnbGVkLgo+Cj4gU2lnbmVkLW9mZi1ieTogS2VubmV0aCBGZW5nIDxrZW5u
ZXRoLmZlbmdAYW1kLmNvbT4KClJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5k
ZXVjaGVyQGFtZC5jb20+Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9h
bWRncHVfc211LmMgICAgIHwgNDQgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgZHJpdmVy
cy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL2FtZGdwdV9zbXUuaCB8ICA4ICsrKysrCj4gIGRy
aXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYyAgICAgfCAyMyArKysrKysr
KysrKysrKwo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYyAgICAg
IHwgNDQgKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9w
b3dlcnBsYXkvdmVnYTIwX3BwdC5jICAgICB8IDI1ICsrKysrKysrKysrKysrLQo+ICA1IGZpbGVz
IGNoYW5nZWQsIDk5IGluc2VydGlvbnMoKyksIDQ1IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYwo+IGluZGV4IGM5MjY2ZWEuLmRlNTRk
YTIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3Nt
dS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jCj4g
QEAgLTk0NSw1MCArOTQ1LDYgQEAgc3RhdGljIGludCBzbXVfZmluaV9mYl9hbGxvY2F0aW9ucyhz
dHJ1Y3Qgc211X2NvbnRleHQgKnNtdSkKPiAgICAgICAgIHJldHVybiAwOwo+ICB9Cj4KPiAtc3Rh
dGljIGludCBzbXVfb3ZlcnJpZGVfcGNpZV9wYXJhbWV0ZXJzKHN0cnVjdCBzbXVfY29udGV4dCAq
c211KQo+IC17Cj4gLSAgICAgICBzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IHNtdS0+YWRl
djsKPiAtICAgICAgIHVpbnQzMl90IHBjaWVfZ2VuID0gMCwgcGNpZV93aWR0aCA9IDAsIHNtdV9w
Y2llX2FyZzsKPiAtICAgICAgIGludCByZXQ7Cj4gLQo+IC0gICAgICAgaWYgKGFkZXYtPmZsYWdz
ICYgQU1EX0lTX0FQVSkKPiAtICAgICAgICAgICAgICAgcmV0dXJuIDA7Cj4gLQo+IC0gICAgICAg
aWYgKGFkZXYtPnBtLnBjaWVfZ2VuX21hc2sgJiBDQUlMX1BDSUVfTElOS19TUEVFRF9TVVBQT1JU
X0dFTjQpCj4gLSAgICAgICAgICAgICAgIHBjaWVfZ2VuID0gMzsKPiAtICAgICAgIGVsc2UgaWYg
KGFkZXYtPnBtLnBjaWVfZ2VuX21hc2sgJiBDQUlMX1BDSUVfTElOS19TUEVFRF9TVVBQT1JUX0dF
TjMpCj4gLSAgICAgICAgICAgICAgIHBjaWVfZ2VuID0gMjsKPiAtICAgICAgIGVsc2UgaWYgKGFk
ZXYtPnBtLnBjaWVfZ2VuX21hc2sgJiBDQUlMX1BDSUVfTElOS19TUEVFRF9TVVBQT1JUX0dFTjIp
Cj4gLSAgICAgICAgICAgICAgIHBjaWVfZ2VuID0gMTsKPiAtICAgICAgIGVsc2UgaWYgKGFkZXYt
PnBtLnBjaWVfZ2VuX21hc2sgJiBDQUlMX1BDSUVfTElOS19TUEVFRF9TVVBQT1JUX0dFTjEpCj4g
LSAgICAgICAgICAgICAgIHBjaWVfZ2VuID0gMDsKPiAtCj4gLSAgICAgICAvKiBCaXQgMzE6MTY6
IExDTEsgRFBNIGxldmVsLiAwIGlzIERQTTAsIGFuZCAxIGlzIERQTTEKPiAtICAgICAgICAqIEJp
dCAxNTo4OiAgUENJRSBHRU4sIDAgdG8gMyBjb3JyZXNwb25kcyB0byBHRU4xIHRvIEdFTjQKPiAt
ICAgICAgICAqIEJpdCA3OjA6ICAgUENJRSBsYW5lIHdpZHRoLCAxIHRvIDcgY29ycmVzcG9uZHMg
aXMgeDEgdG8geDMyCj4gLSAgICAgICAgKi8KPiAtICAgICAgIGlmIChhZGV2LT5wbS5wY2llX21s
d19tYXNrICYgQ0FJTF9QQ0lFX0xJTktfV0lEVEhfU1VQUE9SVF9YMTYpCj4gLSAgICAgICAgICAg
ICAgIHBjaWVfd2lkdGggPSA2Owo+IC0gICAgICAgZWxzZSBpZiAoYWRldi0+cG0ucGNpZV9tbHdf
bWFzayAmIENBSUxfUENJRV9MSU5LX1dJRFRIX1NVUFBPUlRfWDEyKQo+IC0gICAgICAgICAgICAg
ICBwY2llX3dpZHRoID0gNTsKPiAtICAgICAgIGVsc2UgaWYgKGFkZXYtPnBtLnBjaWVfbWx3X21h
c2sgJiBDQUlMX1BDSUVfTElOS19XSURUSF9TVVBQT1JUX1g4KQo+IC0gICAgICAgICAgICAgICBw
Y2llX3dpZHRoID0gNDsKPiAtICAgICAgIGVsc2UgaWYgKGFkZXYtPnBtLnBjaWVfbWx3X21hc2sg
JiBDQUlMX1BDSUVfTElOS19XSURUSF9TVVBQT1JUX1g0KQo+IC0gICAgICAgICAgICAgICBwY2ll
X3dpZHRoID0gMzsKPiAtICAgICAgIGVsc2UgaWYgKGFkZXYtPnBtLnBjaWVfbWx3X21hc2sgJiBD
QUlMX1BDSUVfTElOS19XSURUSF9TVVBQT1JUX1gyKQo+IC0gICAgICAgICAgICAgICBwY2llX3dp
ZHRoID0gMjsKPiAtICAgICAgIGVsc2UgaWYgKGFkZXYtPnBtLnBjaWVfbWx3X21hc2sgJiBDQUlM
X1BDSUVfTElOS19XSURUSF9TVVBQT1JUX1gxKQo+IC0gICAgICAgICAgICAgICBwY2llX3dpZHRo
ID0gMTsKPiAtCj4gLSAgICAgICBzbXVfcGNpZV9hcmcgPSAoMSA8PCAxNikgfCAocGNpZV9nZW4g
PDwgOCkgfCBwY2llX3dpZHRoOwo+IC0gICAgICAgcmV0ID0gc211X3NlbmRfc21jX21zZ193aXRo
X3BhcmFtKHNtdSwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBT
TVVfTVNHX092ZXJyaWRlUGNpZVBhcmFtZXRlcnMsCj4gLSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgc211X3BjaWVfYXJnKTsKPiAtICAgICAgIGlmIChyZXQpCj4gLSAg
ICAgICAgICAgICAgIHByX2VycigiWyVzXSBBdHRlbXB0IHRvIG92ZXJyaWRlIHBjaWUgcGFyYW1z
IGZhaWxlZCFcbiIsIF9fZnVuY19fKTsKPiAtICAgICAgIHJldHVybiByZXQ7Cj4gLX0KPiAtCj4g
IHN0YXRpYyBpbnQgc211X3NtY190YWJsZV9od19pbml0KHN0cnVjdCBzbXVfY29udGV4dCAqc211
LAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJvb2wgaW5pdGlhbGl6ZSkKPiAg
ewo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvYW1kZ3B1
X3NtdS5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL2FtZGdwdV9zbXUuaAo+
IGluZGV4IGNjZjcxMWMuLjgwOWRlMGQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wb3dlcnBsYXkvaW5jL2FtZGdwdV9zbXUuaAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
cG93ZXJwbGF5L2luYy9hbWRncHVfc211LmgKPiBAQCAtNDY4LDYgKzQ2OCw3IEBAIHN0cnVjdCBw
cHRhYmxlX2Z1bmNzIHsKPiAgICAgICAgIGludCAoKmdldF9wb3dlcl9saW1pdCkoc3RydWN0IHNt
dV9jb250ZXh0ICpzbXUsIHVpbnQzMl90ICpsaW1pdCwgYm9vbCBhc2ljX2RlZmF1bHQpOwo+ICAg
ICAgICAgaW50ICgqZ2V0X2RwbV9jbGtfbGltaXRlZCkoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUs
IGVudW0gc211X2Nsa190eXBlIGNsa190eXBlLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgdWludDMyX3QgZHBtX2xldmVsLCB1aW50MzJfdCAqZnJlcSk7Cj4gKyAgICAgICBp
bnQgKCp1cGRhdGVfcGNpZV9wYXJhbWV0ZXJzKShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgdWlu
dDMyX3QgcGNpZV9nZW5fY2FwLCB1aW50MzJfdCBwY2llX3dpZHRoX2NhcCk7Cj4gIH07Cj4KPiAg
c3RydWN0IHNtdV9mdW5jcwo+IEBAIC01NTAsNiArNTUxLDcgQEAgc3RydWN0IHNtdV9mdW5jcwo+
ICAgICAgICAgaW50ICgqbW9kZTJfcmVzZXQpKHN0cnVjdCBzbXVfY29udGV4dCAqc211KTsKPiAg
ICAgICAgIGludCAoKmdldF9kcG1fdWx0aW1hdGVfZnJlcSkoc3RydWN0IHNtdV9jb250ZXh0ICpz
bXUsIGVudW0gc211X2Nsa190eXBlIGNsa190eXBlLCB1aW50MzJfdCAqbWluLCB1aW50MzJfdCAq
bWF4KTsKPiAgICAgICAgIGludCAoKnNldF9zb2Z0X2ZyZXFfbGltaXRlZF9yYW5nZSkoc3RydWN0
IHNtdV9jb250ZXh0ICpzbXUsIGVudW0gc211X2Nsa190eXBlIGNsa190eXBlLCB1aW50MzJfdCBt
aW4sIHVpbnQzMl90IG1heCk7Cj4gKyAgICAgICBpbnQgKCpvdmVycmlkZV9wY2llX3BhcmFtZXRl
cnMpKHN0cnVjdCBzbXVfY29udGV4dCAqc211KTsKPiAgfTsKPgo+ICAjZGVmaW5lIHNtdV9pbml0
X21pY3JvY29kZShzbXUpIFwKPiBAQCAtNzgyLDYgKzc4NCwxMiBAQCBzdHJ1Y3Qgc211X2Z1bmNz
Cj4gICNkZWZpbmUgc211X3NldF9zb2Z0X2ZyZXFfbGltaXRlZF9yYW5nZShzbXUsIGNsa190eXBl
LCBtaW4sIG1heCkgXAo+ICAgICAgICAgICAgICAgICAoKHNtdSktPmZ1bmNzLT5zZXRfc29mdF9m
cmVxX2xpbWl0ZWRfcmFuZ2UgPyAoc211KS0+ZnVuY3MtPnNldF9zb2Z0X2ZyZXFfbGltaXRlZF9y
YW5nZSgoc211KSwgKGNsa190eXBlKSwgKG1pbiksIChtYXgpKSA6IC1FSU5WQUwpCj4KPiArI2Rl
ZmluZSBzbXVfb3ZlcnJpZGVfcGNpZV9wYXJhbWV0ZXJzKHNtdSkgXAo+ICsgICAgICAgICAgICAg
ICAoKHNtdSktPmZ1bmNzLT5vdmVycmlkZV9wY2llX3BhcmFtZXRlcnMgPyAoc211KS0+ZnVuY3Mt
Pm92ZXJyaWRlX3BjaWVfcGFyYW1ldGVycygoc211KSkgOiAwKQo+ICsKPiArI2RlZmluZSBzbXVf
dXBkYXRlX3BjaWVfcGFyYW1ldGVycyhzbXUsIHBjaWVfZ2VuX2NhcCwgcGNpZV93aWR0aF9jYXAp
IFwKPiArICAgICAgICAgICAgICAgKChzbXUpLT5wcHRfZnVuY3MtPnVwZGF0ZV9wY2llX3BhcmFt
ZXRlcnMgPyAoc211KS0+cHB0X2Z1bmNzLT51cGRhdGVfcGNpZV9wYXJhbWV0ZXJzKChzbXUpLCAo
cGNpZV9nZW5fY2FwKSwgKHBjaWVfd2lkdGhfY2FwKSkgOiAwKQo+ICsKPiAgZXh0ZXJuIGludCBz
bXVfZ2V0X2F0b21fZGF0YV90YWJsZShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgdWludDMyX3Qg
dGFibGUsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50MTZfdCAqc2l6
ZSwgdWludDhfdCAqZnJldiwgdWludDhfdCAqY3JldiwKPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHVpbnQ4X3QgKiphZGRyKTsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dl
cnBsYXkvbmF2aTEwX3BwdC5jCj4gaW5kZXggYTU4M2NmOC4uYTJmMzNjZiAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMKPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMKPiBAQCAtMTU5Miw2ICsxNTky
LDI4IEBAIHN0YXRpYyBpbnQgbmF2aTEwX2dldF9wb3dlcl9saW1pdChzdHJ1Y3Qgc211X2NvbnRl
eHQgKnNtdSwKPiAgICAgICAgIHJldHVybiAwOwo+ICB9Cj4KPiArc3RhdGljIGludCBuYXZpMTBf
dXBkYXRlX3BjaWVfcGFyYW1ldGVycyhzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwKPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDMyX3QgcGNpZV9nZW5fY2FwLAo+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50MzJfdCBwY2llX3dpZHRoX2Nh
cCkKPiArewo+ICsgICAgICAgUFBUYWJsZV90ICpwcHRhYmxlID0gc211LT5zbXVfdGFibGUuZHJp
dmVyX3BwdGFibGU7Cj4gKyAgICAgICBpbnQgcmV0LCBpOwo+ICsgICAgICAgdWludDMyX3Qgc211
X3BjaWVfYXJnOwo+ICsKPiArICAgICAgIGZvciAoaSA9IDA7IGkgPCBOVU1fTElOS19MRVZFTFM7
IGkrKykgewo+ICsgICAgICAgICAgICAgICBzbXVfcGNpZV9hcmcgPSAoaSA8PCAxNikgfAo+ICsg
ICAgICAgICAgICAgICAgICAgICAgICgocHB0YWJsZS0+UGNpZUdlblNwZWVkW2ldIDw9IHBjaWVf
Z2VuX2NhcCkgPyAocHB0YWJsZS0+UGNpZUdlblNwZWVkW2ldIDw8IDgpIDoKPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIChwY2llX2dlbl9jYXAgPDwgOCkpIHwgKChwcHRhYmxlLT5Q
Y2llTGFuZUNvdW50W2ldIDw9IHBjaWVfd2lkdGhfY2FwKSA/Cj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHBwdGFibGUtPlBjaWVMYW5lQ291bnRbaV0gOiBwY2llX3dp
ZHRoX2NhcCk7Cj4gKyAgICAgICAgICAgICAgIHJldCA9IHNtdV9zZW5kX3NtY19tc2dfd2l0aF9w
YXJhbShzbXUsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgU01V
X01TR19PdmVycmlkZVBjaWVQYXJhbWV0ZXJzLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHNtdV9wY2llX2FyZyk7Cj4gKyAgICAgICB9Cj4gKwo+ICsgICAgICAg
cmV0dXJuIHJldDsKPiArfQo+ICsKPiArCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcHB0YWJsZV9m
dW5jcyBuYXZpMTBfcHB0X2Z1bmNzID0gewo+ICAgICAgICAgLnRhYmxlc19pbml0ID0gbmF2aTEw
X3RhYmxlc19pbml0LAo+ICAgICAgICAgLmFsbG9jX2RwbV9jb250ZXh0ID0gbmF2aTEwX2FsbG9j
YXRlX2RwbV9jb250ZXh0LAo+IEBAIC0xNjMwLDYgKzE2NTIsNyBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IHBwdGFibGVfZnVuY3MgbmF2aTEwX3BwdF9mdW5jcyA9IHsKPiAgICAgICAgIC5nZXRfdGhl
cm1hbF90ZW1wZXJhdHVyZV9yYW5nZSA9IG5hdmkxMF9nZXRfdGhlcm1hbF90ZW1wZXJhdHVyZV9y
YW5nZSwKPiAgICAgICAgIC5kaXNwbGF5X2Rpc2FibGVfbWVtb3J5X2Nsb2NrX3N3aXRjaCA9IG5h
dmkxMF9kaXNwbGF5X2Rpc2FibGVfbWVtb3J5X2Nsb2NrX3N3aXRjaCwKPiAgICAgICAgIC5nZXRf
cG93ZXJfbGltaXQgPSBuYXZpMTBfZ2V0X3Bvd2VyX2xpbWl0LAo+ICsgICAgICAgLnVwZGF0ZV9w
Y2llX3BhcmFtZXRlcnMgPSBuYXZpMTBfdXBkYXRlX3BjaWVfcGFyYW1ldGVycywKPiAgfTsKPgo+
ICB2b2lkIG5hdmkxMF9zZXRfcHB0X2Z1bmNzKHN0cnVjdCBzbXVfY29udGV4dCAqc211KQo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92MTFfMC5jCj4gaW5kZXggYzllOTBkNS4u
YTgxMmFlNSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVf
djExXzAuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92MTFfMC5j
Cj4gQEAgLTM1LDYgKzM1LDcgQEAKPiAgI2luY2x1ZGUgInZlZ2EyMF9wcHQuaCIKPiAgI2luY2x1
ZGUgImFyY3R1cnVzX3BwdC5oIgo+ICAjaW5jbHVkZSAibmF2aTEwX3BwdC5oIgo+ICsjaW5jbHVk
ZSAiYW1kX3BjaWUuaCIKPgo+ICAjaW5jbHVkZSAiYXNpY19yZWcvdGhtL3RobV8xMV8wXzJfb2Zm
c2V0LmgiCj4gICNpbmNsdWRlICJhc2ljX3JlZy90aG0vdGhtXzExXzBfMl9zaF9tYXNrLmgiCj4g
QEAgLTE3OTIsNiArMTc5Myw0OCBAQCBzdGF0aWMgaW50IHNtdV92MTFfMF9zZXRfc29mdF9mcmVx
X2xpbWl0ZWRfcmFuZ2Uoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIGVudW0gcwo+ICAgICAgICAg
cmV0dXJuIHJldDsKPiAgfQo+Cj4gK3N0YXRpYyBpbnQgc211X3YxMV8wX292ZXJyaWRlX3BjaWVf
cGFyYW1ldGVycyhzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSkKPiArewo+ICsgICAgICAgc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSBzbXUtPmFkZXY7Cj4gKyAgICAgICB1aW50MzJfdCBwY2ll
X2dlbiA9IDAsIHBjaWVfd2lkdGggPSAwOwo+ICsgICAgICAgaW50IHJldDsKPiArCj4gKyAgICAg
ICBpZiAoYWRldi0+cG0ucGNpZV9nZW5fbWFzayAmIENBSUxfUENJRV9MSU5LX1NQRUVEX1NVUFBP
UlRfR0VONCkKPiArICAgICAgICAgICAgICAgcGNpZV9nZW4gPSAzOwo+ICsgICAgICAgZWxzZSBp
ZiAoYWRldi0+cG0ucGNpZV9nZW5fbWFzayAmIENBSUxfUENJRV9MSU5LX1NQRUVEX1NVUFBPUlRf
R0VOMykKPiArICAgICAgICAgICAgICAgcGNpZV9nZW4gPSAyOwo+ICsgICAgICAgZWxzZSBpZiAo
YWRldi0+cG0ucGNpZV9nZW5fbWFzayAmIENBSUxfUENJRV9MSU5LX1NQRUVEX1NVUFBPUlRfR0VO
MikKPiArICAgICAgICAgICAgICAgcGNpZV9nZW4gPSAxOwo+ICsgICAgICAgZWxzZSBpZiAoYWRl
di0+cG0ucGNpZV9nZW5fbWFzayAmIENBSUxfUENJRV9MSU5LX1NQRUVEX1NVUFBPUlRfR0VOMSkK
PiArICAgICAgICAgICAgICAgcGNpZV9nZW4gPSAwOwo+ICsKPiArICAgICAgIC8qIEJpdCAzMTox
NjogTENMSyBEUE0gbGV2ZWwuIDAgaXMgRFBNMCwgYW5kIDEgaXMgRFBNMQo+ICsgICAgICAgICog
Qml0IDE1Ojg6ICBQQ0lFIEdFTiwgMCB0byAzIGNvcnJlc3BvbmRzIHRvIEdFTjEgdG8gR0VONAo+
ICsgICAgICAgICogQml0IDc6MDogICBQQ0lFIGxhbmUgd2lkdGgsIDEgdG8gNyBjb3JyZXNwb25k
cyBpcyB4MSB0byB4MzIKPiArICAgICAgICAqLwo+ICsgICAgICAgaWYgKGFkZXYtPnBtLnBjaWVf
bWx3X21hc2sgJiBDQUlMX1BDSUVfTElOS19XSURUSF9TVVBQT1JUX1gxNikKPiArICAgICAgICAg
ICAgICAgcGNpZV93aWR0aCA9IDY7Cj4gKyAgICAgICBlbHNlIGlmIChhZGV2LT5wbS5wY2llX21s
d19tYXNrICYgQ0FJTF9QQ0lFX0xJTktfV0lEVEhfU1VQUE9SVF9YMTIpCj4gKyAgICAgICAgICAg
ICAgIHBjaWVfd2lkdGggPSA1Owo+ICsgICAgICAgZWxzZSBpZiAoYWRldi0+cG0ucGNpZV9tbHdf
bWFzayAmIENBSUxfUENJRV9MSU5LX1dJRFRIX1NVUFBPUlRfWDgpCj4gKyAgICAgICAgICAgICAg
IHBjaWVfd2lkdGggPSA0Owo+ICsgICAgICAgZWxzZSBpZiAoYWRldi0+cG0ucGNpZV9tbHdfbWFz
ayAmIENBSUxfUENJRV9MSU5LX1dJRFRIX1NVUFBPUlRfWDQpCj4gKyAgICAgICAgICAgICAgIHBj
aWVfd2lkdGggPSAzOwo+ICsgICAgICAgZWxzZSBpZiAoYWRldi0+cG0ucGNpZV9tbHdfbWFzayAm
IENBSUxfUENJRV9MSU5LX1dJRFRIX1NVUFBPUlRfWDIpCj4gKyAgICAgICAgICAgICAgIHBjaWVf
d2lkdGggPSAyOwo+ICsgICAgICAgZWxzZSBpZiAoYWRldi0+cG0ucGNpZV9tbHdfbWFzayAmIENB
SUxfUENJRV9MSU5LX1dJRFRIX1NVUFBPUlRfWDEpCj4gKyAgICAgICAgICAgICAgIHBjaWVfd2lk
dGggPSAxOwo+ICsKPiArICAgICAgIHJldCA9IHNtdV91cGRhdGVfcGNpZV9wYXJhbWV0ZXJzKHNt
dSwgcGNpZV9nZW4sIHBjaWVfd2lkdGgpOwo+ICsKPiArICAgICAgIGlmIChyZXQpCj4gKyAgICAg
ICAgICAgICAgIHByX2VycigiWyVzXSBBdHRlbXB0IHRvIG92ZXJyaWRlIHBjaWUgcGFyYW1zIGZh
aWxlZCFcbiIsIF9fZnVuY19fKTsKPiArCj4gKyAgICAgICByZXR1cm4gcmV0Owo+ICsKPiArfQo+
ICsKPiArCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc211X2Z1bmNzIHNtdV92MTFfMF9mdW5jcyA9
IHsKPiAgICAgICAgIC5pbml0X21pY3JvY29kZSA9IHNtdV92MTFfMF9pbml0X21pY3JvY29kZSwK
PiAgICAgICAgIC5sb2FkX21pY3JvY29kZSA9IHNtdV92MTFfMF9sb2FkX21pY3JvY29kZSwKPiBA
QCAtMTg0NCw2ICsxODg3LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBzbXVfZnVuY3Mgc211X3Yx
MV8wX2Z1bmNzID0gewo+ICAgICAgICAgLmJhY29fcmVzZXQgPSBzbXVfdjExXzBfYmFjb19yZXNl
dCwKPiAgICAgICAgIC5nZXRfZHBtX3VsdGltYXRlX2ZyZXEgPSBzbXVfdjExXzBfZ2V0X2RwbV91
bHRpbWF0ZV9mcmVxLAo+ICAgICAgICAgLnNldF9zb2Z0X2ZyZXFfbGltaXRlZF9yYW5nZSA9IHNt
dV92MTFfMF9zZXRfc29mdF9mcmVxX2xpbWl0ZWRfcmFuZ2UsCj4gKyAgICAgICAub3ZlcnJpZGVf
cGNpZV9wYXJhbWV0ZXJzID0gc211X3YxMV8wX292ZXJyaWRlX3BjaWVfcGFyYW1ldGVycywKPiAg
fTsKPgo+ICB2b2lkIHNtdV92MTFfMF9zZXRfc211X2Z1bmNzKHN0cnVjdCBzbXVfY29udGV4dCAq
c211KQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS92ZWdhMjBf
cHB0LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0LmMKPiBpbmRl
eCBmNjU1ZWJkLi5hZGNhODRhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93
ZXJwbGF5L3ZlZ2EyMF9wcHQuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L3ZlZ2EyMF9wcHQuYwo+IEBAIC0zMTM1LDYgKzMxMzUsMjggQEAgc3RhdGljIGludCB2ZWdhMjBf
Z2V0X3RoZXJtYWxfdGVtcGVyYXR1cmVfcmFuZ2Uoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsCj4g
ICAgICAgICByZXR1cm4gMDsKPiAgfQo+Cj4gK3N0YXRpYyBpbnQgdmVnYTIwX3VwZGF0ZV9wY2ll
X3BhcmFtZXRlcnMoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHVpbnQzMl90IHBjaWVfZ2VuX2NhcCwKPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgdWludDMyX3QgcGNpZV93aWR0aF9jYXApCj4gK3sKPiAr
ICAgICAgIFBQVGFibGVfdCAqcHB0YWJsZSA9IHNtdS0+c211X3RhYmxlLmRyaXZlcl9wcHRhYmxl
Owo+ICsgICAgICAgaW50IHJldCwgaTsKPiArICAgICAgIHVpbnQzMl90IHNtdV9wY2llX2FyZzsK
PiArCj4gKyAgICAgICBmb3IgKGkgPSAwOyBpIDwgTlVNX0xJTktfTEVWRUxTOyBpKyspIHsKPiAr
ICAgICAgICAgICAgICAgc211X3BjaWVfYXJnID0gKGkgPDwgMTYpIHwKPiArICAgICAgICAgICAg
ICAgICAgICAgICAoKHBwdGFibGUtPlBjaWVHZW5TcGVlZFtpXSA8PSBwY2llX2dlbl9jYXApID8g
KHBwdGFibGUtPlBjaWVHZW5TcGVlZFtpXSA8PCA4KSA6Cj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAocGNpZV9nZW5fY2FwIDw8IDgpKSB8ICgocHB0YWJsZS0+UGNpZUxhbmVDb3Vu
dFtpXSA8PSBwY2llX3dpZHRoX2NhcCkgPwo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBwcHRhYmxlLT5QY2llTGFuZUNvdW50W2ldIDogcGNpZV93aWR0aF9jYXApOwo+
ICsgICAgICAgICAgICAgICByZXQgPSBzbXVfc2VuZF9zbWNfbXNnX3dpdGhfcGFyYW0oc211LAo+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNNVV9NU0dfT3ZlcnJp
ZGVQY2llUGFyYW1ldGVycywKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBzbXVfcGNpZV9hcmcpOwo+ICsgICAgICAgfQo+ICsKPiArICAgICAgIHJldHVybiByZXQ7
Cj4gK30KPiArCj4gKwo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IHBwdGFibGVfZnVuY3MgdmVnYTIw
X3BwdF9mdW5jcyA9IHsKPiAgICAgICAgIC50YWJsZXNfaW5pdCA9IHZlZ2EyMF90YWJsZXNfaW5p
dCwKPiAgICAgICAgIC5hbGxvY19kcG1fY29udGV4dCA9IHZlZ2EyMF9hbGxvY2F0ZV9kcG1fY29u
dGV4dCwKPiBAQCAtMzE3Nyw3ICszMTk5LDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBwcHRhYmxl
X2Z1bmNzIHZlZ2EyMF9wcHRfZnVuY3MgPSB7Cj4gICAgICAgICAuZ2V0X2Zhbl9zcGVlZF9wZXJj
ZW50ID0gdmVnYTIwX2dldF9mYW5fc3BlZWRfcGVyY2VudCwKPiAgICAgICAgIC5nZXRfZmFuX3Nw
ZWVkX3JwbSA9IHZlZ2EyMF9nZXRfZmFuX3NwZWVkX3JwbSwKPiAgICAgICAgIC5zZXRfd2F0ZXJt
YXJrc190YWJsZSA9IHZlZ2EyMF9zZXRfd2F0ZXJtYXJrc190YWJsZSwKPiAtICAgICAgIC5nZXRf
dGhlcm1hbF90ZW1wZXJhdHVyZV9yYW5nZSA9IHZlZ2EyMF9nZXRfdGhlcm1hbF90ZW1wZXJhdHVy
ZV9yYW5nZQo+ICsgICAgICAgLmdldF90aGVybWFsX3RlbXBlcmF0dXJlX3JhbmdlID0gdmVnYTIw
X2dldF90aGVybWFsX3RlbXBlcmF0dXJlX3JhbmdlLAo+ICsgICAgICAgLnVwZGF0ZV9wY2llX3Bh
cmFtZXRlcnMgPSB2ZWdhMjBfdXBkYXRlX3BjaWVfcGFyYW1ldGVycwo+ICB9Owo+Cj4gIHZvaWQg
dmVnYTIwX3NldF9wcHRfZnVuY3Moc3RydWN0IHNtdV9jb250ZXh0ICpzbXUpCj4gLS0KPiAyLjcu
NAo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBh
bWQtZ2Z4IG1haWxpbmcgbGlzdAo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGlu
ZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
