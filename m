Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABF964ECA
	for <lists+amd-gfx@lfdr.de>; Thu, 11 Jul 2019 00:51:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAAA689B00;
	Wed, 10 Jul 2019 22:50:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
 [209.85.160.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F5D689B30
 for <amd-gfx@lists.freedesktop.org>; Wed, 10 Jul 2019 22:50:57 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id z4so4332733qtc.3
 for <amd-gfx@lists.freedesktop.org>; Wed, 10 Jul 2019 15:50:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :in-reply-to:references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=xtL3HoRzpDCaU21QNAcWP7cyxdKJK+nQIrEF2qsm4ro=;
 b=OtcvU7Ue96eO65+jtL9G2s4XAuCA6E4eFnLiKD6i36fVAS8uVChY9/E4Hrti4jRyVE
 12RuS2tP0MigHZ9Ic2h5cETBdsKfDYDFOPZnfmHfzZnHdkyCNcVuuGDR8uM9QM7DkNQr
 I4e4PGSRbNviCY5DUHSH/PQTp8wIO5gtiNatCdqE9vM9TpL+MK2eARPX9Apd92lt9zaU
 mR8fVkOIKP9ro9Wae5i2NjlCH0nAbHRip2nNYKw4jTYAbKKPPG/UYJazb68s0iZAc/h9
 JHcNP5zy7xBQmsritb1jNipU4lyi0czE1srZTIooTDCCBAvU1u3rJ/PjvGx7TJDF1kwX
 wBSQ==
X-Gm-Message-State: APjAAAU0C9gJARjIrCWWB6TfVgSHSpi5T6Z+jA+YiOnhnPYJUFZEXcc/
 vjsHfEnKH7Z1LIo11MdP2UkylQ==
X-Google-Smtp-Source: APXvYqwdaEsuz+0FFLpJnxke5qyafIf1j4rziMPweKC25OgQA/O8w4rEB0eduTfxFxtj4hvs9Wx5NA==
X-Received: by 2002:ac8:2f84:: with SMTP id l4mr376062qta.55.1562799056575;
 Wed, 10 Jul 2019 15:50:56 -0700 (PDT)
Received: from whitewolf.lyude.net
 (static-173-76-190-23.bstnma.ftas.verizon.net. [173.76.190.23])
 by smtp.gmail.com with ESMTPSA id e125sm1657909qkd.120.2019.07.10.15.50.55
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 10 Jul 2019 15:50:55 -0700 (PDT)
Message-ID: <346980b73f3b1fbbc70cbf3771788cec0777d4c0.camel@redhat.com>
Subject: Re: [PATCH v2] drm/sysfs: Add mstpath attribute to connector devices
From: Lyude Paul <lyude@redhat.com>
To: sunpeng.li@amd.com, ville.syrjala@linux.intel.com
Date: Wed, 10 Jul 2019 18:50:54 -0400
In-Reply-To: <20190705143220.11109-1-sunpeng.li@amd.com>
References: <20190704190519.29525-4-sunpeng.li@amd.com>
 <20190705143220.11109-1-sunpeng.li@amd.com>
Organization: Red Hat
User-Agent: Evolution 3.32.3 (3.32.3-1.fc30) 
MIME-Version: 1.0
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
Reply-To: lyude@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Z2FoLiBTbywgSSB3YXMgb3JpZ2luYWxseSBnb2luZyB0byBhc2sgIndoeSBkaWRuJ3Qgd2UgYWRk
IHRoZSBjb25uZWN0b3IgbmFtZQppbnRvIHRoaXM/IiwgYnV0IHRoZW4gSSByZWFsaXplZCB3ZSdy
ZSBkb2luZyB0aGUgcmlnaHQgdGhpbmcgYWxyZWFkeSBhbmQganVzdApkb2luZyBjYXJkJWQtJXMg
JSAoY2FyZF9udW1iZXIsIHBhdGhfcHJvcCkuIFdoaWNoIG1lYW5zIHdlIHByb2JhYmx5IHJlYWxs
eSBkb24ndAp3YW50IHRvIGFkZCBhIHByb3BlcnR5IGNhbGxlZCBtc3RwYXRoLCBzaW5jZSBpdCdz
IGhhcmRseSBkaWZmZXJlbnQgZnJvbSBwYXRoCih3aG9vcHMhKS4KCkFkZGl0aW9uYWxseSwgYWZ0
ZXIgc29tZSB0aGlua2luZyBJIHJlYWxpemVkIEkgbWF5IGhhdmUgbWFkZSBhIG1pc3Rha2UgYXMg
SSdtCm5vdCBlbnRpcmVseSBzdXJlIGlmIHdlIHdvdWxkIG5lZWQgdG8gc3BlY2lmeSB0aGUgRFJN
IGNhcmQgaW4gdGhlIHBhdGggcHJvcCBmb3IKdWRldiwgY29uc2lkZXJpbmcgdGhhdCdzIHNwZWNp
ZmllZCBpbiB0aGUgc3lzZnMgcGF0aCBhbGwgcmVhZHkuIEV2ZW4gaWYgSSdtCndyb25nIG9uIHRo
YXQgdGhvdWdoLCBJIHRoaW5rIGl0IG1pZ2h0IGJlIGJldHRlciBub3QgdG8gYWRkIGFuIG1zdHBh
dGggcHJvcGVydHkKYW5kIGp1c3QgZ28gdGhlIHJvdXRlIG9mIGp1c3QgYWRkaW5nIGEgbmV3IHBh
dGhfdjIgcHJvcGVydHkgdGhhdCB3ZSBjb3VsZCB1c2UKZm9yIGJvdGggTVNUIGFuZCBub24tTVNU
IGNvbm5lY3RvciBwYXRocy4gKEkgY2MnZCB5b3Ugb24gdGhlIGVtYWlsIHRocmVhZCBhYm91dAp0
aGlzLCBzbyB5b3UgY2FuIHJlYWQgbW9yZSBhYm91dCB0aGlzIHRoZXJlLgoKU28sIEkgd291bGQg
YWN0dWFsbHkgc3VnZ2VzdCB3ZSBqdXN0IGRyb3AgdGhpcyBwYXRjaCBlbnRpcmVseSBmb3Igbm93
LiBXZSBzaG91bGQKYmUgZmluZSB3aXRob3V0IGl0LCBldmVuIHRob3VnaCB0aGUgZHBfYXV4X2Rl
diBwYXRocyB3aWxsIGJlIGtpbmQgb2YgdWdseSBmb3IgYQpsaXR0bGUgd2hpbGUuIEknZCByYXRo
ZXIgdGhlIHJlc3Qgb2YgdGhpcyBzZXJpZXMgZ2V0IHVwc3RyZWFtIGZpcnN0LCBhbmQgdHJ5IHRv
CmRvIHRoZSBwYXRoIHByb3Agc3R1ZmYgc2VwYXJhdGVseS4KCgpPbiBGcmksIDIwMTktMDctMDUg
YXQgMTA6MzIgLTA0MDAsIHN1bnBlbmcubGlAYW1kLmNvbSB3cm90ZToKPiBGcm9tOiBMZW8gTGkg
PHN1bnBlbmcubGlAYW1kLmNvbT4KPiAKPiBUaGlzIGNhbiBiZSB1c2VkIHRvIGNyZWF0ZSBtb3Jl
IGRlc2NyaXB0aXZlIHN5bWxpbmtzIGZvciBNU1QgYXV4Cj4gZGV2aWNlcy4gQ29uc2lkZXIgdGhl
IGZvbGxvd2luZyB1ZGV2IHJ1bGU6Cj4gCj4gU1VCU1lTVEVNPT0iZHJtX2RwX2F1eF9kZXYiLCBT
VUJTWVNURU1TPT0iZHJtIiwgQVRUUlN7bXN0cGF0aH09PSI/KiIsCj4gCVNZTUxJTksrPSJkcm1f
ZHBfYXV4L2J5LXBhdGgvJGF0dHJ7bXN0cGF0aH0iCj4gCj4gVGhlIGZvbGxvd2luZyBzeW1saW5r
cyB3aWxsIGJlIGNyZWF0ZWQgKGRlcGVuZGluZyBvbiB5b3VyIE1TVCB0b3BvbG9neSk6Cj4gCj4g
JCBscyAvZGV2L2RybV9kcF9hdXgvYnktcGF0aC8KPiBjYXJkMC1tc3Q6MC0xICBjYXJkMC1tc3Q6
MC0xLTEgIGNhcmQwLW1zdDowLTEtOCAgY2FyZDAtbXN0OjAtOAo+IAo+IHYyOiByZW1vdmUgdW5u
ZWNlc3NhcnkgbG9ja2luZyBvZiBtb2RlX2NvbmZpZy5tdXRleAo+IAo+IFNpZ25lZC1vZmYtYnk6
IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJt
X3N5c2ZzLmMgfCAyMCArKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMjAg
aW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3N5c2Zz
LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3N5c2ZzLmMKPiBpbmRleCBhZDEwODEwYmM5NzIuLjdk
NDgzYWI2ODRhMCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3N5c2ZzLmMKPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3N5c2ZzLmMKPiBAQCAtMjM2LDE2ICsyMzYsMzYgQEAg
c3RhdGljIHNzaXplX3QgbW9kZXNfc2hvdyhzdHJ1Y3QgZGV2aWNlICpkZXZpY2UsCj4gIAlyZXR1
cm4gd3JpdHRlbjsKPiAgfQo+ICAKPiArc3RhdGljIHNzaXplX3QgbXN0cGF0aF9zaG93KHN0cnVj
dCBkZXZpY2UgKmRldmljZSwKPiArCQkJICAgIHN0cnVjdCBkZXZpY2VfYXR0cmlidXRlICphdHRy
LAo+ICsJCQkgICAgY2hhciAqYnVmKQo+ICt7Cj4gKwlzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29u
bmVjdG9yID0gdG9fZHJtX2Nvbm5lY3RvcihkZXZpY2UpOwo+ICsJc3NpemVfdCByZXQgPSAwOwo+
ICsJY2hhciAqcGF0aDsKPiArCj4gKwlpZiAoIWNvbm5lY3Rvci0+cGF0aF9ibG9iX3B0cikKPiAr
CQlyZXR1cm4gcmV0Owo+ICsKPiArCXBhdGggPSBjb25uZWN0b3ItPnBhdGhfYmxvYl9wdHItPmRh
dGE7Cj4gKwlyZXQgPSBzbnByaW50ZihidWYsIFBBR0VfU0laRSwgImNhcmQlZC0lc1xuIiwKPiAr
CQkgICAgICAgY29ubmVjdG9yLT5kZXYtPnByaW1hcnktPmluZGV4LCBwYXRoKTsKPiArCj4gKwly
ZXR1cm4gcmV0Owo+ICt9Cj4gKwo+ICBzdGF0aWMgREVWSUNFX0FUVFJfUlcoc3RhdHVzKTsKPiAg
c3RhdGljIERFVklDRV9BVFRSX1JPKGVuYWJsZWQpOwo+ICBzdGF0aWMgREVWSUNFX0FUVFJfUk8o
ZHBtcyk7Cj4gIHN0YXRpYyBERVZJQ0VfQVRUUl9STyhtb2Rlcyk7Cj4gK3N0YXRpYyBERVZJQ0Vf
QVRUUl9STyhtc3RwYXRoKTsKPiAgCj4gIHN0YXRpYyBzdHJ1Y3QgYXR0cmlidXRlICpjb25uZWN0
b3JfZGV2X2F0dHJzW10gPSB7Cj4gIAkmZGV2X2F0dHJfc3RhdHVzLmF0dHIsCj4gIAkmZGV2X2F0
dHJfZW5hYmxlZC5hdHRyLAo+ICAJJmRldl9hdHRyX2RwbXMuYXR0ciwKPiAgCSZkZXZfYXR0cl9t
b2Rlcy5hdHRyLAo+ICsJJmRldl9hdHRyX21zdHBhdGguYXR0ciwKPiAgCU5VTEwKPiAgfTsKPiAg
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4
IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
