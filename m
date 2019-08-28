Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 636A0A0412
	for <lists+amd-gfx@lfdr.de>; Wed, 28 Aug 2019 16:04:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 497A789838;
	Wed, 28 Aug 2019 14:04:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CF3F898AA
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Aug 2019 13:51:48 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id j11so1792526wrp.11
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Aug 2019 06:51:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=25hwDKBP+GfVaA5PoC1dtzp+EUlzT0VB1EcDATP7JNA=;
 b=SqmokhIGFKnP52kkp5V2HNLLn2sYWeipMJrcZhwgBAzPQ9vRGn+XSmmUkaVEvQiBpV
 Dol5A4C+kTUpGsaE5+nmYZSrt968J54NLgS48jDL4dYHb1ONpfA/3OQnBLVaEMncxvHK
 1OeSTrnQQjcNqyj6rNWWN/nmfyps6tDfmWh7mtJ8HhM9YegUsatVs5+cClixBwxo/my3
 1GrTJRdqg+2rijGcVcRn1Reo+tRYn8mjQ+uf9KFpTSA6LWovyFq0/Cv1b2SU973G4Lq6
 Mtr/MF7/LgWGJZRtZQZJJx4GVW1Ez9r7SWuHncim1UFCdbtUF8Th0OunpsztFZM78Pg1
 9avQ==
X-Gm-Message-State: APjAAAXCLO4fdU3ahHL4D7lHr8R5pQX+7JtxcygQQ6mvcFyC0uwnOn7k
 Uv/TnPo8L1M3UawknnJaOkL/STgw
X-Google-Smtp-Source: APXvYqy8OW79FpdVX77Ufi8y4LCwNk2lpCU5gamWTmG++jQka4CC32nHfX+RBsyhcbxt0Rg2LWO6bg==
X-Received: by 2002:adf:910e:: with SMTP id j14mr5060643wrj.8.1567000306720;
 Wed, 28 Aug 2019 06:51:46 -0700 (PDT)
Received: from kontron.lan
 (2001-1ae9-0ff1-f191-3428-f576-7c9a-b44c.ip6.tmcz.cz.
 [2001:1ae9:ff1:f191:3428:f576:7c9a:b44c])
 by smtp.gmail.com with ESMTPSA id u9sm176609wrt.4.2019.08.28.06.51.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 28 Aug 2019 06:51:45 -0700 (PDT)
Subject: Re: [RFC] AMD polaris MEM_AP_SIZE location (PCI BAR aperture size)
To: "Koenig, Christian" <Christian.Koenig@amd.com>
References: <b5ce72c4-850d-1024-354c-2542045b8992@gmail.com>
 <0a40c024-84fb-a726-b69c-f2a5349fc802@gmail.com>
 <22bd05eb-ac42-3157-33a7-26bd77979c36@gmail.com>
 <b371640b-63d3-1ccd-c334-13a311548e6e@amd.com>
From: Petr Cvek <petrcvekcz@gmail.com>
Message-ID: <4696c06a-0acc-51d9-b0ab-da83b6d83e4e@gmail.com>
Date: Wed, 28 Aug 2019 15:54:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <b371640b-63d3-1ccd-c334-13a311548e6e@amd.com>
Content-Language: cs
X-Mailman-Approved-At: Wed, 28 Aug 2019 14:04:28 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=25hwDKBP+GfVaA5PoC1dtzp+EUlzT0VB1EcDATP7JNA=;
 b=l8xcXexeRcsNHM5CKzmZPOr2uuVAbWb8CHwdWpzxS9CoqoGsF6DGwEVqimUE0YZvzX
 Gzu9ne6YcFOYdrLui60xExTJ4pqrgfFKM0G+PJPnwIhxGJZ8ek2VaoIa/swFMHh5JSQT
 Dd2bIfa1PxxPQxHMkwRVX2rVUxQmNDVmFVJFiQzk1uS4wldWKYp0v9e+0NhonSvclaZG
 wmFtbFM2Vcy/nI2P7Y/Y8+gK91uLtXZu49c/uClu8uBuZOSsZrGyOnCoNXGXD8JjqHHE
 LFOeAuO6HWUaiCeLZV/7o8zCk+/L2XoVuJYcPCk07DhlQk7IitVMWTTBWe1F6LkuHlbF
 pOLw==
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RG5lIDI4LiAwOC4gMTkgdiAxNTowNiBLb2VuaWcsIENocmlzdGlhbiBuYXBzYWwoYSk6Cj4+IFll
YWggYnV0IHNhZGx5IGl0IHNlZW1zIGl0IGlzIHBvc3NpYmxlIHRvIG9ubHkgaW5jcmVhc2UgdGhl
IEJBUiBzaXplIGZyb20gaXRzIGN1cnJlbnRseSBkZWZhdWx0IDI1Nk1CLgo+IAo+IFdlbGwgdGhl
IHNwZWNpZmljYXRpb24gYWxsb3dzIHRvIGNoYW5nZSB0aGUgQkFSIHNpemUgZnJvbSAxTUIgdXAg
dG8gCj4gc2V2ZXJhbCBUQi4gVGhlIGtleSBwb2ludCBpcyB3ZSB1c3VhbGx5IHVzZSBpdCB0byBp
bmNyZWFzZSB0aGUgQkFSIHNpemUsIAo+IGJ1dCBpdCBpcyBwZXJmZWN0bHkgcG9zc2libGUgdG8g
bWFrZSBpdCBzbWFsbGVyIGFzIHdlbGwuCj4gCgpZZWFoIGJ1dCBvbmx5IHdpdGggdGhlIHNpemVz
IHJlcG9ydGVkIGluIFJlc2l6YWJsZSBCQVIgQ2FwYWJpbGl0eSBSZWdpc3RlciAoKzB4NCkuIFdo
aWNoIGluIG15IGNhc2UgY29udGFpbnMgdGhlIHZhbHVlIDB4MDAwMWYwMDAuIFRoZSBmaXJzdCBi
aXQgZnJvbSByaWdodCBpcyAxMiwgd2hpY2ggbWVhbnMgMjU2IE1CLCA1MTIgTUIsIC4uLiAuIAoK
U28gSSBndWVzcyBteSBSWDQ2MCBkb2Vzbid0IGdvIHVuZGVyIDI1Ni4KCkFueXdheSwgdGhhbmtz
IGZvciBoZWxwLgoKUGV0cgoKPiBUYWtlIGEgbG9vayBhdCB0aGUgZnVuY3Rpb24gcGNpX3JlYmFy
X3NldF9zaXplKCkgZm9yIGV4YW1wbGUuIFlvdSBzaG91bGQgCj4gYmUgYWJsZSB0byB1c2UgdGhp
cyBhcyBzb21ldGhpbmcgbGlrZSBwY2lfcmViYXJfc2V0X3NpemUoJmFkZXYtPnBkZXYsIDAsIAo+
IDYpIHRvIGdldCBhIDY0TUIgQkFSLgo+IAo+IEFsdGVybmF0aXZlbHkgeW91IGNhbiB0cnkgdG8g
cHJvZ3JhbSB0aGUgUENJZSBjb25maWcgc3BhY2Ugd2l0aCB0aGUgCj4gc2V0cGNpIGNvbW1hbmRs
aW5lIHRvb2wuCj4gCj4gVGhlbiB5b3UgbmVlZCB0byBmb3JjZSBhIHJlc2NhbiBvZiB0aGUgUENJ
ZSBidXMgc28gdGhhdCB0aGUga2VybmVsIGNhbiAKPiBhY3R1YWxseSBkZXRlY3QgdGhlIGNoYW5n
ZS4KPiAKPiBSZWdhcmRzLAo+IENocmlzdGlhbi4KPiAKPiBBbSAyOC4wOC4xOSB1bSAxNDo0NiBz
Y2hyaWViIFBldHIgQ3ZlazoKPj4gRG5lIDI4LiAwOC4gMTkgdiAxMDozMSBDaHJpc3RpYW4gS8O2
bmlnIG5hcHNhbChhKToKPj4+IEhpIFBldHIsCj4+Pgo+Pj4gd2VsbCB0aGF0IGlzIGluZGVlZCBh
IHJhdGhlciB1bnVzdWFsIHVzZSBjYXNlLgo+Pj4KPj4+IEknbSBub3QgMTAwJSBzdXJlIGhvdyB5
b3UgYWN0dWFsbHkgaGFja2VkIHRoZSBIRDQ1NTAgdG8gZG8gd2hhdCB5b3Ugd2FudCB0byBkbywg
Y2F1c2UgdGhpcyBBU0lDIGdlbmVyYXRpb24gc2hvdWxkbid0IHN1cHBvcnQgdGhpcy4KPj4gSSBk
b24ndCByZW1lbWJlciBjb3JyZWN0bHkgaG93IGV4YWN0bHkgSSd2ZSBtYW5hZ2VkIHRvIGRvIHRo
YXQgYnV0IEkgdGhpbmsgdGhlIHByb2Nlc3Mgd2FzOgo+Pgo+PiBJIGNvbXBhcmVkIGRpZmZlcmVu
dCBCSU9TZXMgZmlyc3QgYW5kIEkgZm91bmQgYSBjb3JyZWxhdGlvbiBiZXR3ZWVuIGFwZXJ0dXJl
IHNpemVzIGluIHRoZSBST00gaW1hZ2VzIG9mIG9sZGVyICh4MTMwMC9SNTIwKSBnZW5lcmF0aW9u
LiBXaGlsZSBkb2luZyB0aGF0IEkndmUgZm91bmQgbWVudGlvbnMgb2YgTUVNX0FQX1NJWkUgUk9N
IHBvd2VydXAgc3RyYXAgcmVnaXN0ZXJzIChmcm9tIHgub3JnIGRvY3VtZW50cykgYW5kIEkgdHJp
ZWQgdG8gZmxhc2ggdGhlIHNldHRpbmdzIG9mIEhENDU1MCBmcm9tIDI1Nk1CIChkZWZhdWx0KSBk
aXJlY3RseSB0byA2NE1CIGFuZCBJIHdhcyBzdXJwcmlzZWQgaXQgd29ya2VkIChJJ3ZlIHRob3Vn
aCBpdCB3aWxsIGJlIG9ubHkgMTI4TUIpLiBJRiBJIGdvb2dsZSB0aGUgIk1FTV9BUF9TSVpFIiBu
b3cgSSBjYW4gZmluZCBhIGRvY3VtZW50IFsxXSwgd2hpY2ggc2F5cyAocGFnZSA1NikgdGhlIFJP
TSBhZGRyZXNzIGlzIDB4NzggKHBhZ2UgNTYpIGFuZCB0aGUgdGFibGUgc2F5cyA2NE1CIGlzIHBv
c3NpYmxlLCB3aGljaCBib3RoIG1hdGNoIHRoZSBleHBlcmltZW50Lgo+Pgo+PiBPZiBjb3Vyc2Ug
dGhlIGJpb3MgaXMgbm93IENSQyBicm9rZW4sIGJ1dCBpdCBkb2Vzbid0IG1hdHRlciBpbiBsaW51
eCAodGhlIFJPTSBjb2RlIGlzIGp1c3QgeDg2IGFueXdheSkuCj4+Cj4+IFsxXSBodHRwczovL2Rl
di54ZGV2cy5jb20vYXR0YWNobWVudHMvZG93bmxvYWQvMjMzL0FNRF9SVjcxMF9kc19uZGFfMS4w
MWIucGRmCj4+Cj4+PiBGb3IgYSBQb2xhcmlzIHlvdSBjYW4ganVzdCB1c2UgdGhlIFBDSWUgcmVz
aXplYWJsZSBCQVIgZXh0ZW5zaW9uLiBGb3IgaG93IHRvIHVzZSBpdCBzZWUgdGhlIHBjaV9yZXNp
emVfcmVzb3VyY2UoKSBmdW5jdGlvbiBpbiB0aGUgbGludXgga2VybmVsLgo+Pj4KPj4+IFBsZWFz
ZSBiZSBhd2FyZSB0aGF0IHdlIHVzdWFsbHkgdXNlIHRoZSBmdW5jdGlvbiB0byBpbmNyZWFzZSB0
aGUgQkFSIHNpemUgdG8gYWxsb3cgdGhlIENQVSB0byBhY2Nlc3MgbW9yZSBvZiB0aGUgb24gYm9h
cmQgbWVtb3J5LCBzbyBtYWtpbmcgaXQgc21hbGxlciBtaWdodCBhY3R1YWxseSBub3QgYmUgdGVz
dGVkIGF0IGFsbC4KPj4gWWVhaCBidXQgc2FkbHkgaXQgc2VlbXMgaXQgaXMgcG9zc2libGUgdG8g
b25seSBpbmNyZWFzZSB0aGUgQkFSIHNpemUgZnJvbSBpdHMgY3VycmVudGx5IGRlZmF1bHQgMjU2
TUIuCj4+Cj4+PiBSZWdhcmRzLAo+Pj4gQ2hyaXN0aWFuLgo+Pj4KPj4+Cj4+PiBBbSAyNy4wOC4x
OSB1bSAwNDozNiBzY2hyaWViIFBldHIgQ3ZlazoKPj4+PiBIZWxsbywKPj4+Pgo+Pj4+IEknbSB0
cnlpbmcgdG8gcnVuIEFNRCBHUFVzIGluIHVudXN1YWwgY29uZmlndXJhdGlvbnMuIEkgd2FzIGFi
bGUgdG8gZGVjcmVhc2UgdGhlIFBDSSBCQVIgc2l6ZSBpbiBIRDQ1NTAgYnkgaXRzIEJJT1Mgc3Ry
YXAgY29uZmlndXJhdGlvbiBhbmQgY2hhbmdlIGl0IHRvIDY0TUIgKGFuZCBJIHdhcyBhYmxlIHRv
IHJ1biBpdCBvbiBNSVBTIHZvY29yZTIgYm9hcmQgOi1EICkuIElzIHRoZXJlIGEgc2ltaWxhciBj
b25maWd1cmF0aW9uIGxvY2F0aW9uIGZvciBBTUQgcG9sYXJpcyAxMS9SWCA0NjAgQklPUz8KPj4+
Pgo+Pj4+IFBldHIgQ3Zlawo+Pj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4+Pj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPj4+PiBhbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwo+Pj4+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeAo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZng=
