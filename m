Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5355D7F0E
	for <lists+amd-gfx@lfdr.de>; Tue, 15 Oct 2019 20:30:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52788884E2;
	Tue, 15 Oct 2019 18:30:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D703789F5F
 for <amd-gfx@lists.freedesktop.org>; Tue, 15 Oct 2019 18:30:37 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id r19so142593wmh.2
 for <amd-gfx@lists.freedesktop.org>; Tue, 15 Oct 2019 11:30:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fzFVXgcr+SbryhCTIPWP1x78uV1MrL2l3mggmZnG6J0=;
 b=S7uGvDFig7EBB3DGHtYYMt8cnFYqylACTOii2BiBaYkp9ByUkBY5hP4UgupjDfBFcJ
 OhJ0GkWrscm+ZYr/+78ZRYqT1E9IxfuWZ9433pqOI972oPH8IQafdQkDGfaDrZbSRw1L
 PJiSEAd6uWl7E0MnLcB7rQmMcIkr24Rj5fCedcMjZL7LKIw39xCKsRHC0MRdDfpA3EUa
 /MGzrV4iyW3il+z+DIxmX00zwBus4j/XyiSgV8TInuTiCQ8M+e3VDTNEK2XDjVrj/obF
 FIx9B9Ss19UVcRNBqjLmySDZJHEa88FLI+dNk/naogKi7mw9N73DG1avLb7C2QwRfwex
 +rsw==
X-Gm-Message-State: APjAAAXALIDkeKp/PmUSRbR1CUJLnR0UI+ILTHIbJrw7O7HxltvTJPwf
 EA+oxRKlZ412Z1tSI4StKvCfaTxSo98LIuX7Rlg=
X-Google-Smtp-Source: APXvYqw5mjBI9MyTnIQNVNmV4S5NIMpCWobeJtM4nSdr7tbShHIZntss/bw3jdnI/nRWI/84Xu5NwnHBlop2AsFW3/U=
X-Received: by 2002:a1c:d0:: with SMTP id 199mr21418272wma.67.1571164236355;
 Tue, 15 Oct 2019 11:30:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAKwvOdnDVe-dahZGnRtzMrx-AH_C+2Lf20qjFQHNtn9xh=Okzw@mail.gmail.com>
 <9e4d6378-5032-8521-13a9-d9d9519d07de@amd.com>
 <CAK8P3a3_Q15hKT=gyupb0FrPX1xV3tEBpVaYy1LF0kMUj2u8hw@mail.gmail.com>
 <CAKwvOdnLxm_tZ_qR1D-BE64Z3QaMC2h79ooobdRVAzmCD_2_Sg@mail.gmail.com>
In-Reply-To: <CAKwvOdnLxm_tZ_qR1D-BE64Z3QaMC2h79ooobdRVAzmCD_2_Sg@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 15 Oct 2019 14:30:23 -0400
Message-ID: <CADnq5_P55aRJ-1VVz2uKA=xpddyi0BvDcXqPD=xVpw3aJZrzng@mail.gmail.com>
Subject: Re: AMDGPU and 16B stack alignment
To: Nick Desaulniers <ndesaulniers@google.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=fzFVXgcr+SbryhCTIPWP1x78uV1MrL2l3mggmZnG6J0=;
 b=d1bYUzxclgcIwQyGom6nQU9FbRAuZmgiWTJXIBD5CvPkiODLcyyeIH5MOmgIY5qegO
 wF9rakwLnWkpSmQS7tuNvPqrIV4uY42XgwNk9G+8FFAJs3YrSvMGseDiXQphlRKvwwpj
 QDiPkjXQKBwyUMwZurpk0auizQkZlIDGnKV9JzTvAMK07ogKXnNVfKPZUFqfNfgFhoWV
 Jl/NGyisdi4XUPts9Ku7O0WnFdjKBRJRQAjsLO8ApfiVQcDk/WNiqXxU1ElOmVa/1fr9
 EuU0BVoz6u0pWJau3jxbISHWYBhp9nVITAudMISOYVUTmt/NJB8yPRp9LZMsJcnjAbDj
 s17Q==
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

T24gVHVlLCBPY3QgMTUsIDIwMTkgYXQgMjowNyBQTSBOaWNrIERlc2F1bG5pZXJzCjxuZGVzYXVs
bmllcnNAZ29vZ2xlLmNvbT4gd3JvdGU6Cj4KPiBPbiBUdWUsIE9jdCAxNSwgMjAxOSBhdCAxMjox
OSBBTSBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPiB3cm90ZToKPiA+Cj4gPiBPbiBUdWUs
IE9jdCAxNSwgMjAxOSBhdCA5OjA4IEFNIFMsIFNoaXJpc2ggPHNzaGFua2FyQGFtZC5jb20+IHdy
b3RlOgo+ID4gPiBPbiAxMC8xNS8yMDE5IDM6NTIgQU0sIE5pY2sgRGVzYXVsbmllcnMgd3JvdGU6
Cj4gPgo+ID4gPiBNeSBnY2MgYnVpbGQgZmFpbHMgd2l0aCBiZWxvdyBlcnJvcnM6Cj4gPiA+Cj4g
PiA+IGRjbl9jYWxjcy5jOjE6MDogZXJyb3I6IC1tcHJlZmVycmVkLXN0YWNrLWJvdW5kYXJ5PTMg
aXMgbm90IGJldHdlZW4gNCBhbmQgMTIKPiA+ID4KPiA+ID4gZGNuX2NhbGNfbWF0aC5jOjE6MDog
ZXJyb3I6IC1tcHJlZmVycmVkLXN0YWNrLWJvdW5kYXJ5PTMgaXMgbm90IGJldHdlZW4gNCBhbmQg
MTIKPgo+IEkgd2FzIGFibGUgdG8gcmVwcm9kdWNlIHRoaXMgZmFpbHVyZSBvbiBwcmUtNy4xIHZl
cnNpb25zIG9mIEdDQy4gIEl0Cj4gc2VlbXMgdGhhdCB3aGVuOgo+IDEuIGNvZGUgaXMgdXNpbmcg
ZG91Ymxlcwo+IDIuIHNldHRpbmcgLW1wcmVmZXJyZWQtc3RhY2stYm91bmRhcnk9MyAtbW5vLXNz
ZTIsIGllLiA4QiBzdGFjayBhbGlnbm1lbnQKPiB0aGFuIEdDQyBwcm9kdWNlcyB0aGF0IGVycm9y
Ogo+IGh0dHBzOi8vZ29kYm9sdC5vcmcvei83VDhuYkgKPgo+IFRoYXQncyBhbHJlYWR5IGEgdGFs
bCBvcmRlciBvZiBjb25zdHJhaW50cywgc28gaXQncyB1bmRlcnN0YW5kYWJsZQo+IHRoYXQgdGhl
IGNvbXBpbGVyIHdvdWxkIGp1c3QgZXJyb3IgbGlrZWx5IGR1cmluZyBpbnN0cnVjdGlvbgo+IHNl
bGVjdGlvbiwgYnV0IHdhcyBldmVudHVhbGx5IHRhdWdodCBob3cgdG8gc29sdmUgc3VjaCBjb25z
dHJhaW50cy4KPgo+ID4gPgo+ID4gPiBXaGlsZSBHUEYgb2JzZXJ2ZWQgb24gY2xhbmcgYnVpbGRz
IHNlZW0gdG8gYmUgZml4ZWQuCj4KPiBUaGFua3MgZm9yIHRoZSByZXBvcnQuICBZb3VyIHRlc3Rp
bmcgdGhlc2UgcGF0Y2hlcyBpcyBpbnZhbHVhYmxlLCBTaGlyaXNoIQo+Cj4gPgo+ID4gT2ssIHNv
IGl0IHNlZW1zIHRoYXQgZ2NjIGluc2lzdHMgb24gaGF2aW5nIGF0IGxlYXN0IDJeNCBieXRlcyBz
dGFjawo+ID4gYWxpZ25tZW50IHdoZW4KPiA+IFNTRSBpcyBlbmFibGVkIG9uIHg4Ni02NCwgYnV0
IGRvZXMgbm90IGFjdHVhbGx5IHJlbHkgb24gdGhhdCBmb3IKPiA+IGNvcnJlY3Qgb3BlcmF0aW9u
Cj4gPiB1bmxlc3MgaXQncyB1c2luZyBzc2UyLiBTbyAtbXNzZSBhbHdheXMgaGFzIHRvIGJlIHBh
aXJlZCB3aXRoCj4gPiAgLW1wcmVmZXJyZWQtc3RhY2stYm91bmRhcnk9My4KPgo+IFNlZW1pbmds
eSBvbmx5IGZvciBvbGRlciB2ZXJzaW9ucyBvZiBHQ0MsIHByZSA3LjEuCj4KPiA+Cj4gPiBGb3Ig
Y2xhbmcsIGl0IHNvdW5kcyBsaWtlIHRoZSBvcHBvc2l0ZSBpcyB0cnVlOiB3aGVuIHBhc3Npbmcg
MTYgYnl0ZQo+ID4gc3RhY2sgYWxpZ25tZW50Cj4gPiBhbmQgaGF2aW5nIHNzZS9zc2UyIGVuYWJs
ZWQsIGl0IHJlcXVpcmVzIHRoZSBpbmNvbWluZyBzdGFjayB0byBiZSAxNgo+ID4gYnl0ZSBhbGln
bmVkLAo+Cj4gSSBkb24ndCB0aGluayBpdCByZXF1aXJlcyB0aGUgaW5jb21pbmcgc3RhY2sgdG8g
YmUgMTZCIGFsaWduZWQgZm9yCj4gc3NlMiwgSSB0aGluayBpdCByZXF1aXJlcyB0aGUgaW5jb21p
bmcgYW5kIGN1cnJlbnQgc3RhY2sgYWxpZ25tZW50IHRvCj4gbWF0Y2guIFRvZGF5IGl0IGRvZXMg
bm90LCB3aGljaCBpcyB3aHkgd2Ugb2JzZXJ2ZSBHUEZzLgo+Cj4gPiBidXQgcGFzc2luZyA4IGJ5
dGUgYWxpZ25tZW50IG1ha2VzIGl0IGRvIHRoZSByaWdodCB0aGluZy4KPiA+Cj4gPiBTbywgc2hv
dWxkIHdlIGp1c3QgYWx3YXlzIHBhc3MgJChjYWxsIGNjLW9wdGlvbiwgLW1wcmVmZXJyZWQtc3Rh
Y2stYm91bmRhcnk9NCkKPiA+IHRvIGdldCB0aGUgZGVzaXJlZCBvdXRjb21lIG9uIGJvdGg/Cj4K
PiBIbW1tLi4uSSB3b3VsZCBoYXZlIGxpa2VkIHRvIHJlbW92ZSBpdCBvdXRyaWdodCwgYXMgaXQg
aXMgYW4gQUJJCj4gbWlzbWF0Y2ggdGhhdCBpcyBsaWtlbHkgdG8gcmVzdWx0IGluIGluc3RhYmls
aXR5IGFuZCBub24tZnVuLXRvLWRlYnVnCj4gcnVudGltZSBpc3N1ZXMgaW4gdGhlIGZ1dHVyZS4g
IEkgc3VzcGVjdCBteSBwYXRjaCBkb2VzIHdvcmsgZm9yIEdDQwo+IDcuMSsuICBUaGUgcXVlc3Rp
b24gaXM6IERvIHdlIHdhbnQgdG8gZWl0aGVyOgo+IDEuIG1hcmsgQU1ER1BVIGJyb2tlbiBmb3Ig
R0NDIDwgNy4xLCBvcgo+IDIuIGNvbnRpbnVlIHN1cHBvcnRpbmcgaXQgdmlhIHN0YWNrIGFsaWdu
bWVudCBtaXNtYXRjaD8KPgo+IDIgaXMgYnJpdHRsZSwgYW5kIG1heSBicmVhayBhdCBhbnkgcG9p
bnQgaW4gdGhlIGZ1dHVyZSwgYnV0IGlmIGl0J3MKPiB3b3JraW5nIGZvciBzb21lb25lIGl0IGRv
ZXMgbWFrZSBtZSBmZWVsIGJhZCB0byBvdXRyaWdodCBkaXNhYmxlIGl0Lgo+IFdoYXQgSSdkIGlt
YWdlIDIgbG9va3MgbGlrZSBpcyAocHN1ZWRvIGNvZGUgaW4gYSBNYWtlZmlsZSk6CgpXZWxsLCBp
dCdzIGJlZW4gd29ya2luZyBhcyBpcyBmb3IgeWVhcnMgbm93LCBhdCBsZWFzdCB3aXRoIGdjYywg
c28gSSdkCmhhdGUgdG8gYnJlYWsgdGhhdC4KCkFsZXgKCj4KPiBpZiBDQ19JU19HQ0MgJiYgR0ND
X1ZFUlNJT04gPCA3LjE6Cj4gICBzZXQgc3RhY2sgYWxpZ25tZW50IHRvIDE2QiBhbmQgaG9wZSBm
b3IgdGhlIGJlc3QKPgo+IFNvIG15IGRpZmYgd291bGQgYmUgYW1lbmRlZCB0byBrZWVwIHRoZSBz
dGFjayBhbGlnbm1lbnQgZmxhZ3MsIGJ1dAo+IG9ubHkgdG8gc3VwcG9ydCBHQ0MgPCA3LjEuICBB
bmQgdGhhdCBhc3N1bWVzIG15IGNoYW5nZSBjb21waWxlcyB3aXRoCj4gR0NDIDcuMSsuIChMb29r
cyBsaWtlIGl0IGRvZXMgZm9yIG1lIGxvY2FsbHkgd2l0aCBHQ0MgOC4zLCBidXQgSSB3b3VsZAo+
IGZlZWwgZXZlbiBtb3JlIGNvbmZpZGVudCBpZiBzb21lb25lIHdpdGggaGFyZHdhcmUgdG8gdGVz
dCBvbiBhbmQgR0NDCj4gNy4xKyBjb3VsZCBib290IHRlc3QpLgo+IC0tCj4gVGhhbmtzLAo+IH5O
aWNrIERlc2F1bG5pZXJzCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFt
ZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
