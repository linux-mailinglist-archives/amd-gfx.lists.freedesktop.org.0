Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C2031C202
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Feb 2021 19:56:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D467C6E930;
	Mon, 15 Feb 2021 18:56:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA1E46E931;
 Mon, 15 Feb 2021 18:56:21 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id q186so4783823oig.12;
 Mon, 15 Feb 2021 10:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fXBT4xpZ44BWopiCzA5BdkSekv48SAWYnj4iW61mQF0=;
 b=eJgS51jUdUles8PvvEPpAYZzFmm/tLLusqrLPgnqRR727XPOAnyZ25rbFljT37+k+Y
 +opKtAStkmGcOEosBRVvZzmSvwyvemfAQKfML4f6nkxk2Jr96gxGMDCZSmraPyotkvzL
 wP3DDtt2lqMEnbn6A5OxJU9+UlR0vQ80SdXhlgdf9JCTWbEyRqClHQRXPLlEocqKsx+O
 s7Jakamssj57+2F88MTAg3o5KZ/faw8Y2uZLuhlszC3IvCpNclSIVckrqv3xu2gzgSBg
 FZjWDEcaikSN4IAkOJrJfCJ5mB06lrUi/5sma/WFO9Ns46IMtygHDuZbraqxj4mCSlMI
 UAaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fXBT4xpZ44BWopiCzA5BdkSekv48SAWYnj4iW61mQF0=;
 b=Tiu4Oc2R9WZ3oE113c3X2hitJuy55Z1/Gt+VqBcfXjZ9aexlTM8cAVrSY8pLaGyB0Y
 JA9HgAzw7SnPmJlsZgzSyUy1XV9zq7xsulX2dFl6QHJ1P2Anrz30eLIYfC519OdCF+N5
 zFULBK/v+tUUaAPA8K16Es/Ew+PPQOBgUlZE1IJ4B8ZUNFknbn+P6UGGDyj7MuqAQZG7
 HLQe5tQQv4/YTvEdFPktWnk5t395eucvFP54+2Mnq/V9Lut61sEYoQsff7Q8OgDlkf6d
 tUJsr/9DRDmdKfYBJAkFZpRrsb2IyowYKZpgThvAZALhYSuSKzqj+U+ZmAAp3FgTUelV
 We5A==
X-Gm-Message-State: AOAM5304sghIQy4NA37ObD0zOIO0Z9jHUitutclkCgkSBUrtn7TYVG99
 fuweRuSzFHIakUPphH1zI3IQSgM+W3Yhp05IzyM=
X-Google-Smtp-Source: ABdhPJwAcslDrIFamFjOx2UkgaG9PKUaghk0g+H6lzKFW3oWgJWZlWyGZ+fN+3cARHbKKz8K5MIAReI1IfDg8Jc/S7Y=
X-Received: by 2002:aca:fc0c:: with SMTP id a12mr200788oii.5.1613415381226;
 Mon, 15 Feb 2021 10:56:21 -0800 (PST)
MIME-Version: 1.0
References: <20210210224031.GA8795@embeddedor>
In-Reply-To: <20210210224031.GA8795@embeddedor>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 15 Feb 2021 13:56:10 -0500
Message-ID: <CADnq5_M+dCHFDoOS3dSTMCTsk7mH=dFSss=u91VwwVuFA=9t6g@mail.gmail.com>
Subject: Re: [PATCH][next] drm/amd/pm: Replace one-element array with
 flexible-array in struct SISLANDS_SMC_SWSTATE
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 linux-hardening@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gV2VkLCBGZWIgMTAsIDIwMjEgYXQgNTo0MCBQTSBHdXN0YXZvIEEuIFIuIFNpbHZhCjxndXN0
YXZvYXJzQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gVGhlcmUgaXMgYSByZWd1bGFyIG5lZWQgaW4g
dGhlIGtlcm5lbCB0byBwcm92aWRlIGEgd2F5IHRvIGRlY2xhcmUgaGF2aW5nCj4gYSBkeW5hbWlj
YWxseSBzaXplZCBzZXQgb2YgdHJhaWxpbmcgZWxlbWVudHMgaW4gYSBzdHJ1Y3R1cmUuIEtlcm5l
bCBjb2RlCj4gc2hvdWxkIGFsd2F5cyB1c2Ug4oCcZmxleGlibGUgYXJyYXkgbWVtYmVyc+KAnVsx
XSBmb3IgdGhlc2UgY2FzZXMuIFRoZSBvbGRlcgo+IHN0eWxlIG9mIG9uZS1lbGVtZW50IG9yIHpl
cm8tbGVuZ3RoIGFycmF5cyBzaG91bGQgbm8gbG9uZ2VyIGJlIHVzZWRbMl0uCj4KPiBSZWZhY3Rv
ciB0aGUgY29kZSBhY2NvcmRpbmcgdG8gdGhlIHVzZSBvZiBhIGZsZXhpYmxlLWFycmF5IG1lbWJl
ciBpbgo+IHN0cnVjdCBTSVNMQU5EU19TTUNfU1dTVEFURSwgaW5zdGVhZCBvZiBhIG9uZS1lbGVt
ZW50IGFycmF5LCBhbmQgdXNlCj4gdGhlIHN0cnVjdF9zaXplKCkgaGVscGVyIHRvIGNhbGN1bGF0
ZSB0aGUgc2l6ZSBmb3IgdGhlIGFsbG9jYXRpb24uCj4KPiBBbHNvLCB0aGlzIGhlbHBzIHdpdGgg
dGhlIG9uZ29pbmcgZWZmb3J0cyB0byBlbmFibGUgLVdhcnJheS1ib3VuZHMgYW5kCj4gZml4IHRo
ZSBmb2xsb3dpbmcgd2FybmluZ3M6Cj4KPiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9w
bS9wb3dlcnBsYXkvc2lfZHBtLmM6MjQ0ODoyMDogd2FybmluZzogYXJyYXkKPiBzdWJzY3JpcHQg
MSBpcyBhYm92ZSBhcnJheSBib3VuZHMgb2Yg4oCYU0lTTEFORFNfU01DX0hXX1BFUkZPUk1BTkNF
X0xFVkVMWzFd4oCZCj4ge2FrYSDigJhzdHJ1Y3QgU0lTTEFORFNfU01DX0hXX1BFUkZPUk1BTkNF
X0xFVkVMWzFd4oCZfSBbLVdhcnJheS1ib3VuZHNdCj4gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvLi4vcG0vcG93ZXJwbGF5L3NpX2RwbS5jOjI0NDk6MjA6IHdhcm5pbmc6IGFycmF5Cj4gc3Vi
c2NyaXB0IDEgaXMgYWJvdmUgYXJyYXkgYm91bmRzIG9mIOKAmFNJU0xBTkRTX1NNQ19IV19QRVJG
T1JNQU5DRV9MRVZFTFsxXeKAmQo+IHtha2Eg4oCYc3RydWN0IFNJU0xBTkRTX1NNQ19IV19QRVJG
T1JNQU5DRV9MRVZFTFsxXeKAmX0gWy1XYXJyYXktYm91bmRzXQo+IGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1Ly4uL3BtL3Bvd2VycGxheS9zaV9kcG0uYzoyNDUwOjIwOiB3YXJuaW5nOiBhcnJh
eQo+IHN1YnNjcmlwdCAxIGlzIGFib3ZlIGFycmF5IGJvdW5kcyBvZiDigJhTSVNMQU5EU19TTUNf
SFdfUEVSRk9STUFOQ0VfTEVWRUxbMV3igJkKPiB7YWthIOKAmHN0cnVjdCBTSVNMQU5EU19TTUNf
SFdfUEVSRk9STUFOQ0VfTEVWRUxbMV3igJl9IFstV2FycmF5LWJvdW5kc10KPiBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS8uLi9wbS9wb3dlcnBsYXkvc2lfZHBtLmM6MjQ1MToyMDogd2Fybmlu
ZzogYXJyYXkKPiBzdWJzY3JpcHQgMSBpcyBhYm92ZSBhcnJheSBib3VuZHMgb2Yg4oCYU0lTTEFO
RFNfU01DX0hXX1BFUkZPUk1BTkNFX0xFVkVMWzFd4oCZCj4ge2FrYSDigJhzdHJ1Y3QgU0lTTEFO
RFNfU01DX0hXX1BFUkZPUk1BTkNFX0xFVkVMWzFd4oCZfSBbLVdhcnJheS1ib3VuZHNdCj4gZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG0vcG93ZXJwbGF5L3NpX2RwbS5jOjI0NTI6MjA6
IHdhcm5pbmc6IGFycmF5Cj4gc3Vic2NyaXB0IDEgaXMgYWJvdmUgYXJyYXkgYm91bmRzIG9mIOKA
mFNJU0xBTkRTX1NNQ19IV19QRVJGT1JNQU5DRV9MRVZFTFsxXeKAmQo+IHtha2Eg4oCYc3RydWN0
IFNJU0xBTkRTX1NNQ19IV19QRVJGT1JNQU5DRV9MRVZFTFsxXeKAmX0gWy1XYXJyYXktYm91bmRz
XQo+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL3BtL3Bvd2VycGxheS9zaV9kcG0uYzo1
NTcwOjIwOiB3YXJuaW5nOiBhcnJheQo+IHN1YnNjcmlwdCAxIGlzIGFib3ZlIGFycmF5IGJvdW5k
cyBvZiDigJhTSVNMQU5EU19TTUNfSFdfUEVSRk9STUFOQ0VfTEVWRUxbMV3igJkKPiB7YWthIOKA
mHN0cnVjdCBTSVNMQU5EU19TTUNfSFdfUEVSRk9STUFOQ0VfTEVWRUxbMV3igJl9IFstV2FycmF5
LWJvdW5kc10KPgo+IFsxXSBodHRwczovL2VuLndpa2lwZWRpYS5vcmcvd2lraS9GbGV4aWJsZV9h
cnJheV9tZW1iZXIKPiBbMl0gaHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvaHRtbC92NS45L3By
b2Nlc3MvZGVwcmVjYXRlZC5odG1sI3plcm8tbGVuZ3RoLWFuZC1vbmUtZWxlbWVudC1hcnJheXMK
Pgo+IExpbms6IGh0dHBzOi8vZ2l0aHViLmNvbS9LU1BQL2xpbnV4L2lzc3Vlcy83OQo+IExpbms6
IGh0dHBzOi8vZ2l0aHViLmNvbS9LU1BQL2xpbnV4L2lzc3Vlcy8xMDkKPiBCdWlsZC10ZXN0ZWQt
Ynk6IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPgo+IExpbms6IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2xrbWwvNjAyM2JlNTguc2s2NkwlMkZWNHZ1U0pJNW1JJTI1bGtwQGludGVs
LmNvbS8KPiBTaWduZWQtb2ZmLWJ5OiBHdXN0YXZvIEEuIFIuIFNpbHZhIDxndXN0YXZvYXJzQGtl
cm5lbC5vcmc+CgpBcHBsaWVkLiAgVGhhbmtzIQoKQWxleAoKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1
L2RybS9hbWQvcG0vcG93ZXJwbGF5L3NpX2RwbS5jICAgICAgIHwgIDYgKystLS0tCj4gIGRyaXZl
cnMvZ3B1L2RybS9hbWQvcG0vcG93ZXJwbGF5L3Npc2xhbmRzX3NtYy5oIHwgMTAgKysrKystLS0t
LQo+ICAyIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKPgo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL3Bvd2VycGxheS9zaV9kcG0uYyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vcG93ZXJwbGF5L3NpX2RwbS5jCj4gaW5kZXggYWZhMTcx
MWM5NjIwLi42MjI5MTM1OGZiMWMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9w
bS9wb3dlcnBsYXkvc2lfZHBtLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL3Bvd2Vy
cGxheS9zaV9kcG0uYwo+IEBAIC01NzE1LDExICs1NzE1LDkgQEAgc3RhdGljIGludCBzaV91cGxv
YWRfc3dfc3RhdGUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCj4gICAgICAgICBpbnQgcmV0
Owo+ICAgICAgICAgdTMyIGFkZHJlc3MgPSBzaV9waS0+c3RhdGVfdGFibGVfc3RhcnQgKwo+ICAg
ICAgICAgICAgICAgICBvZmZzZXRvZihTSVNMQU5EU19TTUNfU1RBVEVUQUJMRSwgZHJpdmVyU3Rh
dGUpOwo+IC0gICAgICAgdTMyIHN0YXRlX3NpemUgPSBzaXplb2YoU0lTTEFORFNfU01DX1NXU1RB
VEUpICsKPiAtICAgICAgICAgICAgICAgKChuZXdfc3RhdGUtPnBlcmZvcm1hbmNlX2xldmVsX2Nv
dW50IC0gMSkgKgo+IC0gICAgICAgICAgICAgICAgc2l6ZW9mKFNJU0xBTkRTX1NNQ19IV19QRVJG
T1JNQU5DRV9MRVZFTCkpOwo+ICAgICAgICAgU0lTTEFORFNfU01DX1NXU1RBVEUgKnNtY19zdGF0
ZSA9ICZzaV9waS0+c21jX3N0YXRldGFibGUuZHJpdmVyU3RhdGU7Cj4gLQo+ICsgICAgICAgc2l6
ZV90IHN0YXRlX3NpemUgPSBzdHJ1Y3Rfc2l6ZShzbWNfc3RhdGUsIGxldmVscywKPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbmV3X3N0YXRlLT5wZXJmb3JtYW5jZV9s
ZXZlbF9jb3VudCk7Cj4gICAgICAgICBtZW1zZXQoc21jX3N0YXRlLCAwLCBzdGF0ZV9zaXplKTsK
Pgo+ICAgICAgICAgcmV0ID0gc2lfY29udmVydF9wb3dlcl9zdGF0ZV90b19zbWMoYWRldiwgYW1k
Z3B1X25ld19zdGF0ZSwgc21jX3N0YXRlKTsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9wbS9wb3dlcnBsYXkvc2lzbGFuZHNfc21jLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bt
L3Bvd2VycGxheS9zaXNsYW5kc19zbWMuaAo+IGluZGV4IGQyOTMwZWNlYWYzYy4uMGY3NTU0MDUy
YzkwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vcG93ZXJwbGF5L3Npc2xh
bmRzX3NtYy5oCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9wb3dlcnBsYXkvc2lzbGFu
ZHNfc21jLmgKPiBAQCAtMTgyLDExICsxODIsMTEgQEAgdHlwZWRlZiBzdHJ1Y3QgU0lTTEFORFNf
U01DX0hXX1BFUkZPUk1BTkNFX0xFVkVMIFNJU0xBTkRTX1NNQ19IV19QRVJGT1JNQU5DRV9MRVYK
Pgo+ICBzdHJ1Y3QgU0lTTEFORFNfU01DX1NXU1RBVEUKPiAgewo+IC0gICAgdWludDhfdCAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgZmxhZ3M7Cj4gLSAgICB1aW50OF90ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBsZXZlbENvdW50Owo+IC0gICAgdWludDhfdCAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgcGFkZGluZzI7Cj4gLSAgICB1aW50OF90ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBwYWRkaW5nMzsKPiAtICAgIFNJU0xBTkRTX1NNQ19IV19QRVJGT1JNQU5DRV9M
RVZFTCAgIGxldmVsc1sxXTsKPiArICAgICAgIHVpbnQ4X3QgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGZsYWdzOwo+ICsgICAgICAgdWludDhfdCAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgbGV2ZWxDb3VudDsKPiArICAgICAgIHVpbnQ4X3QgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHBhZGRpbmcyOwo+ICsgICAgICAgdWludDhfdCAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgcGFkZGluZzM7Cj4gKyAgICAgICBTSVNMQU5EU19TTUNfSFdfUEVSRk9STUFOQ0VfTEVWRUwg
ICBsZXZlbHNbXTsKPiAgfTsKPgo+ICB0eXBlZGVmIHN0cnVjdCBTSVNMQU5EU19TTUNfU1dTVEFU
RSBTSVNMQU5EU19TTUNfU1dTVEFURTsKPiAtLQo+IDIuMjcuMAo+Cj4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0
Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeAo=
