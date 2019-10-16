Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECB9D8A0A
	for <lists+amd-gfx@lfdr.de>; Wed, 16 Oct 2019 09:43:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 184D36E8D6;
	Wed, 16 Oct 2019 07:43:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FC0E6E3EE
 for <amd-gfx@lists.freedesktop.org>; Wed, 16 Oct 2019 01:51:37 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id p12so3932983pgn.6
 for <amd-gfx@lists.freedesktop.org>; Tue, 15 Oct 2019 18:51:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eInMsMe+BJaYRY1Pz9oWe+U9MwphvcdZCLcBAxvz7R0=;
 b=iJsTWOch5rs1tGVv8TLrAIru+KXgVg1NTe4VxkrGoRjLFJpkwQCdLvS10WNYUp93Pw
 ATktfHVY5jauAJAeTlFcj3OHjIUTbmng2ejpHfv93PZKmDHOZPDXMMvFelRYuZ68Eq0X
 rH9UZ7tamtm8KW3EFYCmf8Z6OXkYGz1mt3tf3R6ZuEYdrcwyqiTUOPAJ5pFaViUuW48N
 qhzkhMgh+ebFJZ6MNZnmzr01nfOYFjVNOXNfTBk5t2P2zJZZUchK4+oMaz+f5e6xwQnF
 DEIT8XL8yBEpiLClg2aUQqscVIXOLKerjmAYzKAsbEXjijN9tS/bVg32ptcF8iQWLTov
 K8Ww==
X-Gm-Message-State: APjAAAUWWay+4f8AMjKZa5T52yBnQ+Lrjzuv5HMElcRzdbwIPqhEAQLm
 rl3cEpvtW4h9I5sucpUDthB4noUsmR4ywpp3NfWXGA==
X-Google-Smtp-Source: APXvYqwRKPbjtP3iHgUwdE5xgVuxjM/o+4isROAa/cr/OlgflkHBhgT2X2KSWEZJdk2KR7aGLa/Ihza4EKunVksUgVQ=
X-Received: by 2002:a63:5a03:: with SMTP id o3mr4805222pgb.381.1571190696394; 
 Tue, 15 Oct 2019 18:51:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAKwvOdnDVe-dahZGnRtzMrx-AH_C+2Lf20qjFQHNtn9xh=Okzw@mail.gmail.com>
 <9e4d6378-5032-8521-13a9-d9d9519d07de@amd.com>
 <CAK8P3a3_Q15hKT=gyupb0FrPX1xV3tEBpVaYy1LF0kMUj2u8hw@mail.gmail.com>
 <CAKwvOdnLxm_tZ_qR1D-BE64Z3QaMC2h79ooobdRVAzmCD_2_Sg@mail.gmail.com>
 <20191015202636.GA1671072@rani>
In-Reply-To: <20191015202636.GA1671072@rani>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 15 Oct 2019 18:51:26 -0700
Message-ID: <CAKwvOd=yGXMwdoxKCD2gcEgevozf41jVmqCkW7CU=Xvd7mqtjw@mail.gmail.com>
Subject: Re: AMDGPU and 16B stack alignment
To: Arvind Sankar <nivedita@alum.mit.edu>
X-Mailman-Approved-At: Wed, 16 Oct 2019 07:43:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=eInMsMe+BJaYRY1Pz9oWe+U9MwphvcdZCLcBAxvz7R0=;
 b=XPI8JjSsYj2wNPJu04c2XrN1/PeiTZfQIUnpdo/TyHS6cpar5/1bLRDjwA0cPCx6be
 n2YvCGW7epfY3GWj1ROYKCzbAYH8LTfKoC9HTIukwIP+IFA76LYQ38jP5uNUZ1+ydZx5
 ZI4YJCpAjhjueDXz6a1lbLprnoEEeJpCKgx4XVW0vGzLcWfbVzzvm7tQChbAm8p5s7Ej
 k2ylWDmyDhfbh0bCaxt1fvxQb4bIfU44/U0wop9nrLb57GKqMxHajEPt1y8UzQLXV9C9
 B76LN9xOBBh8AU7kAAG6T8ZJtmBpolQnOrUbbrEvzuZIv2s91bNWbNl1ScmVJZZv2Oqf
 hI5A==
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
Cc: "Zhou, David\(ChunMing\)" <David1.Zhou@amd.com>,
 Arnd Bergmann <arnd@arndb.de>, Matthias Kaehlcke <mka@google.com>, "S,
 Shirish" <sshankar@amd.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "S, Shirish" <Shirish.S@amd.com>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 "yshuiv7@gmail.com" <yshuiv7@gmail.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Wentland,
 Harry" <Harry.Wentland@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMTUsIDIwMTkgYXQgMToyNiBQTSBBcnZpbmQgU2Fua2FyIDxuaXZlZGl0YUBh
bHVtLm1pdC5lZHU+IHdyb3RlOgo+Cj4gT24gVHVlLCBPY3QgMTUsIDIwMTkgYXQgMTE6MDU6NTZB
TSAtMDcwMCwgTmljayBEZXNhdWxuaWVycyB3cm90ZToKPiA+IEhtbW0uLi5JIHdvdWxkIGhhdmUg
bGlrZWQgdG8gcmVtb3ZlIGl0IG91dHJpZ2h0LCBhcyBpdCBpcyBhbiBBQkkKPiA+IG1pc21hdGNo
IHRoYXQgaXMgbGlrZWx5IHRvIHJlc3VsdCBpbiBpbnN0YWJpbGl0eSBhbmQgbm9uLWZ1bi10by1k
ZWJ1Zwo+ID4gcnVudGltZSBpc3N1ZXMgaW4gdGhlIGZ1dHVyZS4gIEkgc3VzcGVjdCBteSBwYXRj
aCBkb2VzIHdvcmsgZm9yIEdDQwo+ID4gNy4xKy4gIFRoZSBxdWVzdGlvbiBpczogRG8gd2Ugd2Fu
dCB0byBlaXRoZXI6Cj4gPiAxLiBtYXJrIEFNREdQVSBicm9rZW4gZm9yIEdDQyA8IDcuMSwgb3IK
PiA+IDIuIGNvbnRpbnVlIHN1cHBvcnRpbmcgaXQgdmlhIHN0YWNrIGFsaWdubWVudCBtaXNtYXRj
aD8KPiA+Cj4gPiAyIGlzIGJyaXR0bGUsIGFuZCBtYXkgYnJlYWsgYXQgYW55IHBvaW50IGluIHRo
ZSBmdXR1cmUsIGJ1dCBpZiBpdCdzCj4gPiB3b3JraW5nIGZvciBzb21lb25lIGl0IGRvZXMgbWFr
ZSBtZSBmZWVsIGJhZCB0byBvdXRyaWdodCBkaXNhYmxlIGl0Lgo+ID4gV2hhdCBJJ2QgaW1hZ2Ug
MiBsb29rcyBsaWtlIGlzIChwc3VlZG8gY29kZSBpbiBhIE1ha2VmaWxlKToKPiA+Cj4gPiBpZiBD
Q19JU19HQ0MgJiYgR0NDX1ZFUlNJT04gPCA3LjE6Cj4gPiAgIHNldCBzdGFjayBhbGlnbm1lbnQg
dG8gMTZCIGFuZCBob3BlIGZvciB0aGUgYmVzdAo+ID4KPiA+IFNvIG15IGRpZmYgd291bGQgYmUg
YW1lbmRlZCB0byBrZWVwIHRoZSBzdGFjayBhbGlnbm1lbnQgZmxhZ3MsIGJ1dAo+ID4gb25seSB0
byBzdXBwb3J0IEdDQyA8IDcuMS4gIEFuZCB0aGF0IGFzc3VtZXMgbXkgY2hhbmdlIGNvbXBpbGVz
IHdpdGgKPiA+IEdDQyA3LjErLiAoTG9va3MgbGlrZSBpdCBkb2VzIGZvciBtZSBsb2NhbGx5IHdp
dGggR0NDIDguMywgYnV0IEkgd291bGQKPiA+IGZlZWwgZXZlbiBtb3JlIGNvbmZpZGVudCBpZiBz
b21lb25lIHdpdGggaGFyZHdhcmUgdG8gdGVzdCBvbiBhbmQgR0NDCj4gPiA3LjErIGNvdWxkIGJv
b3QgdGVzdCkuCj4gPiAtLQo+ID4gVGhhbmtzLAo+ID4gfk5pY2sgRGVzYXVsbmllcnMKPgo+IElm
IHdlIGRvIGtlZXAgaXQsIHdvdWxkIGFkZGluZyAtbXN0YWNrcmVhbGlnbiBtYWtlIGl0IG1vcmUg
cm9idXN0Pwo+IFRoYXQncyBzaW1wbGUgYW5kIHdpbGwgb25seSBhZGQgdGhlIGFsaWdubWVudCB0
byBmdW5jdGlvbnMgdGhhdCByZXF1aXJlCj4gMTYtYnl0ZSBhbGlnbm1lbnQgKGF0IGxlYXN0IG9u
IGdjYykuCgpJIHRoaW5rIHRoZXJlJ3MgYWxzbyBgLW1pbmNvbWluZy1zdGFjay1ib3VuZGFyeT1g
LgpodHRwczovL2dpdGh1Yi5jb20vQ2xhbmdCdWlsdExpbnV4L2xpbnV4L2lzc3Vlcy83MzUjaXNz
dWVjb21tZW50LTU0MDAzODAxNwoKPgo+IEFsdGVybmF0aXZlIGlzIHRvIHVzZQo+IF9fYXR0cmli
dXRlX18oKGZvcmNlX2FsaWduX2FyZ19wb2ludGVyKSkgb24gZnVuY3Rpb25zIHRoYXQgbWlnaHQg
YmUKPiBjYWxsZWQgZnJvbSA4LWJ5dGUtYWxpZ25lZCBjb2RlLgoKV2hpY2ggaXMgaGFyZCB0byBh
dXRvbWF0ZSBhbmQgZWFzeSB0byBmb3JnZXQuICBMaWtlbHkgYSBsYXJnZSBkaWZmIHRvIGZpeCB0
b2RheS4KCj4KPiBJdCBsb29rcyBsaWtlIC1tc3RhY2tyZWFsaWduIHNob3VsZCB3b3JrIGZyb20g
Z2NjIDUuMyBvbndhcmRzLgoKVGhlIGtlcm5lbCB3b3VsZCBnZW5lcmFsbHkgbGlrZSB0byBzdXBw
b3J0IEdDQyA0LjkrLgoKVGhlcmUncyBwbGVudHkgb2YgZGlmZmVyZW50IHdheXMgdG8ga2VlcCBs
YXllcmluZyBvbiBkdWN0IHRhcGUgYW5kCmJhaWxpbmcgd2lyZSB0byBzdXBwb3J0IGRpZmZlcmlu
ZyBBQklzLCBidXQgdGhhdCdzIGp1c3QgYWRkaW5nCnRlY2huaWNhbCBkZWJ0IHRoYXQgd2lsbCBo
YXZlIHRvIGJlIHJlcGFpZCBvbmUgZGF5LiAgVGhhdCdzIHdoeSB0aGUKY2xlYW5lc3Qgc29sdXRp
b24gSU1PIGlzIG1hcmsgdGhlIGRyaXZlciBicm9rZW4gZm9yIG9sZCB0b29sY2hhaW5zLAphbmQg
dXNlIGEgY29kZS1iYXNlLWNvbnNpc3RlbnQgc3RhY2sgYWxpZ25tZW50LiAgQmVuZGluZyBvdmVy
CmJhY2t3YXJkcyB0byBzdXBwb3J0IG9sZCB0b29sY2hhaW5zIG1lYW5zIGFjY2VwdGluZyBzdGFj
ayBhbGlnbm1lbnQKbWlzbWF0Y2hlcywgd2hpY2ggaXMgaW4gdGhlICJ1bnNwZWNpZmllZCBiZWhh
dmlvciIgcmluZyBvZiB0aGUKInVuZGVmaW5lZCBiZWhhdmlvciIgVmVubiBkaWFncmFtLiAgSSBo
YXZlIHRoZSBzYW1lIG9waW5pb24gb24gcmVseWluZwpvbiBleHBsaWNpdGx5IHVuZGVmaW5lZCBi
ZWhhdmlvci4KCkknbGwgc2VuZCBwYXRjaGVzIGZvciBmaXhpbmcgdXAgQ2xhbmcsIGJ1dCBwbGVh
c2UgY29uc2lkZXIgbXkgc3Ryb25nCmFkdmljZSB0byBnZW5lcmFsbHkgYXZvaWQgc3RhY2sgYWxp
Z25tZW50IG1pc21hdGNoZXMsIHJlZ2FyZGxlc3Mgb2YKY29tcGlsZXIuCi0tClRoYW5rcywKfk5p
Y2sgRGVzYXVsbmllcnMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
