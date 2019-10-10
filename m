Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58416D2A27
	for <lists+amd-gfx@lfdr.de>; Thu, 10 Oct 2019 14:57:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAF816E261;
	Thu, 10 Oct 2019 12:57:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33A286E261
 for <amd-gfx@lists.freedesktop.org>; Thu, 10 Oct 2019 12:57:51 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id p7so6836653wmp.4
 for <amd-gfx@lists.freedesktop.org>; Thu, 10 Oct 2019 05:57:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XEJD/PQeQaemofzxCFo8HulpNL3GdgCuRjLYqMnuAoQ=;
 b=cH3xMOVRkqyjJWkyuGLhbnNrJGTZIV9myX1e53vDErXbHJr7bE/zHotK/7l77JujqB
 xYCqYQExF0X+ejSiCu571BRwK1FjE9zF95VYbEp+LWhpZB+1afZRBz2vWpeSVNTSOHEM
 MmrvlJYr2Hhd3cLN638iXvTUJiKP94RzcCrVcZBIqBB8PHA/1o0U967uV68YhC5llshC
 DAeehLdWTXaA766HmjXde+QRtBQh6ltjjgFPmY0twSd6FhMCCnYEvK1R507JeAPxhfz+
 V1n55Cjr5bmD8Vpvta/TdorlQY5AmEz7nkih9s+NEuaA5UP4JLkDsY7JsM0x/uV65F1j
 b7Qw==
X-Gm-Message-State: APjAAAUfuBQ3REYdK70RN/4KrJGW2P2iBAiIZMOyNusUNzDvWjRSTpdH
 G43H4K+2/cXOEXl2mgZH/hiXt3TIHFDjLsjJWg+M42fd
X-Google-Smtp-Source: APXvYqyBGQuPOdRVucPkUkPzoythEu0CPBMOr/DhMD1jxUUXlBbp7T8neSyqoTgQblBjXEMR8bmPfMIJZugdwd2vVfk=
X-Received: by 2002:a1c:968b:: with SMTP id y133mr7533882wmd.141.1570712269699; 
 Thu, 10 Oct 2019 05:57:49 -0700 (PDT)
MIME-Version: 1.0
References: <20191010124757.17427-1-xiaojie.yuan@amd.com>
In-Reply-To: <20191010124757.17427-1-xiaojie.yuan@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 10 Oct 2019 08:57:36 -0400
Message-ID: <CADnq5_Mz7SDUs4MWKzhZp3toc0x0guRJjA+JyFb7CcChtBAixw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/discovery: reserve discovery data at the top
 of VRAM
To: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=XEJD/PQeQaemofzxCFo8HulpNL3GdgCuRjLYqMnuAoQ=;
 b=e8BP8nH4cBkxUGm1cX0fugytJwAYLJxfN6ThyvsfeAa60+pW9C4DrlzMiVPht7+mMe
 YyO0vd9SjofL6vlCvPn5wf5jvTKlAEs3Ui0t2w+bCMAa5lC0b+UHfG7vEHyKTo3WkdAm
 E1jAO76A75Ps1HFex/KO4SfI3+lW+49wlRnOAefB1nyZ52hvAnnu/u2kUZLU197nmwh3
 FkOWPKQp9GDf/IWctQctVdN/0maJ2M5pQdTQRxELD01QEX+2L76iNCuESXh+1xgByFo5
 IKToQf4Rr5hKSjQXlrc+zdIq+yJAz3RmEE/UezZFI67lw6aYt0pKL6hnqH/vywKqhrl0
 XjKQ==
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
Cc: "Xiao, Jack" <Jack.Xiao@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMTAsIDIwMTkgYXQgODo0OCBBTSBZdWFuLCBYaWFvamllIDxYaWFvamllLll1
YW5AYW1kLmNvbT4gd3JvdGU6Cj4KPiBJUCBEaXNjb3ZlcnkgZGF0YSBpcyBUTVIgZmVuY2VkIGJ5
IHRoZSBsYXRlc3QgUFNQIEJMLAo+IHNvIHdlIG5lZWQgdG8gcmVzZXJ2ZSB0aGlzIHJlZ2lvbi4K
Pgo+IFNpZ25lZC1vZmYtYnk6IFhpYW9qaWUgWXVhbiA8eGlhb2ppZS55dWFuQGFtZC5jb20+Cj4g
LS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oICAgICB8ICAxICsKPiAg
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jIHwgMTUgKysrKysrKysrKysr
KysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1LmgKPiBpbmRleCBiZTBiMmM2OWMyMjMuLjY3NzU2NDdmMGJhNSAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaAo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oCj4gQEAgLTgxMiw2ICs4MTIsNyBAQCBz
dHJ1Y3QgYW1kZ3B1X2RldmljZSB7Cj4gICAgICAgICB1aW50OF90ICAgICAgICAgICAgICAgICAg
ICAgICAgICpiaW9zOwo+ICAgICAgICAgdWludDMyX3QgICAgICAgICAgICAgICAgICAgICAgICBi
aW9zX3NpemU7Cj4gICAgICAgICBzdHJ1Y3QgYW1kZ3B1X2JvICAgICAgICAgICAgICAgICpzdG9s
ZW5fdmdhX21lbW9yeTsKPiArICAgICAgIHN0cnVjdCBhbWRncHVfYm8gICAgICAgICAgICAgICAg
KmRpc2NvdmVyeV9tZW1vcnk7Cj4gICAgICAgICB1aW50MzJfdCAgICAgICAgICAgICAgICAgICAg
ICAgIGJpb3Nfc2NyYXRjaF9yZWdfb2Zmc2V0Owo+ICAgICAgICAgdWludDMyX3QgICAgICAgICAg
ICAgICAgICAgICAgICBiaW9zX3NjcmF0Y2hbQU1ER1BVX0JJT1NfTlVNX1NDUkFUQ0hdOwo+Cj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYwo+IGluZGV4IGVkZmZjODgzNTQ5
YS4uYzNkN2ViNjg1YTIzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV90dG0uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90
dG0uYwo+IEBAIC0xOTU1LDYgKzE5NTUsMTggQEAgaW50IGFtZGdwdV90dG1faW5pdChzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldikKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBOVUxMLCAmc3RvbGVuX3ZnYV9idWYpOwo+ICAgICAgICAgaWYgKHIpCj4gICAgICAgICAgICAg
ICAgIHJldHVybiByOwo+ICsKPiArICAgICAgIC8qCj4gKyAgICAgICAgKiByZXNlcnZlIG9uZSBU
TVIgKDY0SykgbWVtb3J5IGF0IHRoZSB0b3Agb2YgVlJBTSB3aGljaCBob2xkcwo+ICsgICAgICAg
ICogSVAgRGlzY292ZXJ5IGRhdGEgYW5kIGlzIHByb3RlY3RlZCBieSBQU1AuCj4gKyAgICAgICAg
Ki8KPiArICAgICAgIHIgPSBhbWRncHVfYm9fY3JlYXRlX2tlcm5lbChhZGV2LCA2NCA8PCAxMCwg
UEFHRV9TSVpFLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEFNREdQVV9H
RU1fRE9NQUlOX1ZSQU0sCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJmFk
ZXYtPmRpc2NvdmVyeV9tZW1vcnksCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgTlVMTCwgTlVMTCk7Cj4gKyAgICAgICBpZiAocikKPiArICAgICAgICAgICAgICAgcmV0dXJu
IHI7Cj4gKwoKSSB0aGluayB3ZSBzaG91bGQgdXNlIGFtZGdwdV9ib19jcmVhdGVfa2VybmVsX2F0
KCkgZm9yIGJvdGggdGhpcyBhbmQKc3RvbGVuX3ZnYV9tZW1vcnkgc28gdGhhdCB3ZSBtYWtlIHN1
cmUgd2UgZW5kIHVwIHJlc2VydmluZyB0aGUgcmlnaHQKbG9jYXRpb24gc2luY2UgYm90aCBvZiB0
aGVzZSBidWZmZXJzIGFyZSBjcmVhdGVkIGJ5IGZpcm13YXJlIGF0IGZpeGVkCmxvY2F0aW9ucy4K
CkFsZXgKCj4gICAgICAgICBEUk1fSU5GTygiYW1kZ3B1OiAldU0gb2YgVlJBTSBtZW1vcnkgcmVh
ZHlcbiIsCj4gICAgICAgICAgICAgICAgICAodW5zaWduZWQpIChhZGV2LT5nbWMucmVhbF92cmFt
X3NpemUgLyAoMTAyNCAqIDEwMjQpKSk7Cj4KPiBAQCAtMjAyNCw2ICsyMDM2LDkgQEAgdm9pZCBh
bWRncHVfdHRtX2xhdGVfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKPiAgICAgICAg
IHZvaWQgKnN0b2xlbl92Z2FfYnVmOwo+ICAgICAgICAgLyogcmV0dXJuIHRoZSBWR0Egc3RvbGVu
IG1lbW9yeSAoaWYgYW55KSBiYWNrIHRvIFZSQU0gKi8KPiAgICAgICAgIGFtZGdwdV9ib19mcmVl
X2tlcm5lbCgmYWRldi0+c3RvbGVuX3ZnYV9tZW1vcnksIE5VTEwsICZzdG9sZW5fdmdhX2J1Zik7
Cj4gKwo+ICsgICAgICAgLyogcmV0dXJuIHRoZSBJUCBEaXNjb3ZlcnkgVE1SIG1lbW9yeSBiYWNr
IHRvIFZSQU0gKi8KPiArICAgICAgIGFtZGdwdV9ib19mcmVlX2tlcm5lbCgmYWRldi0+ZGlzY292
ZXJ5X21lbW9yeSwgTlVMTCwgTlVMTCk7Cj4gIH0KPgo+ICAvKioKPiAtLQo+IDIuMjAuMQo+Cj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBhbWQtZ2Z4
IG1haWxpbmcgbGlzdAo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
