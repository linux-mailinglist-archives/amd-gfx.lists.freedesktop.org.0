Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9DE48F02
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:28:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3F6389B27;
	Mon, 17 Jun 2019 19:28:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F13689A94
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:28:35 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id 207so631554wma.1
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:28:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=OhiEtFEPrYWloyW5UL099Eosj2DdKYkXE9H5d3wkkxM=;
 b=Z+qUU4DNbPSYs+ey0HtDe1eKcEBdog2OW53gb+OfEKYbExa/oQVwVgeo2FB6ayXXkf
 u2e23ypdrG/XaQ9+a6HxKTPKA3j//80eaMMjOnWXSWjpAKpy+96fZ38x65kK7l+B3Gsf
 eUox53NvymRSlc2JvxxQ5xzcucK3IPGzxxDB/CjFHR/9oQNBvYdWeHSaPLPMqqiIwdKx
 sGwa3MVLuxGgT8Wg1/1q0dpx+oDP+SSr0Xd6kGEgogLEvSGLA4vJDKeGDB4vJgoOVwnN
 OWYY8xMDN5mNcAGetxIYBDQsmzUgiI/jOmsMY1QRXeDltouyI9L8v2s+VBeDgm8+afxN
 x6SA==
X-Gm-Message-State: APjAAAXi+vXcupM7ZzalHCr54zpT8xNw/q/ruddgu6E/4+IHHwuFsWhj
 vtQtemHcIfsR5Cx12UAoUFJ2uqYs
X-Google-Smtp-Source: APXvYqyWQIwKykdAPpgFtYnPadidFSdzMemsDDdHNX1OWqoot1ZGTNxjYhOg7jZCc8k5FcsSC3woFQ==
X-Received: by 2002:a7b:c144:: with SMTP id z4mr180800wmi.50.1560799713771;
 Mon, 17 Jun 2019 12:28:33 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id a67sm123684wmh.40.2019.06.17.12.28.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Jun 2019 12:28:33 -0700 (PDT)
Subject: Re: [PATCH] drm/amd/amdgpu: cast mem->num_pages to 64-bits when
 shifting
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "StDenis, Tom" <Tom.StDenis@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20190614165108.23011-1-tom.stdenis@amd.com>
 <1d91998e-e97c-229e-e7f6-2cc0228bf213@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <2dcdc076-baee-d321-38d5-626b740eae59@gmail.com>
Date: Mon, 17 Jun 2019 21:28:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1d91998e-e97c-229e-e7f6-2cc0228bf213@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=OhiEtFEPrYWloyW5UL099Eosj2DdKYkXE9H5d3wkkxM=;
 b=I2SrpbacMDNC4teejZAw7F7P6Z+Iu7rFG21X7ViZ9Bn0AB1DdQvsRsfrjsadWSOmm0
 Hqrm18JArjYPdKzO4+eeGVm0TZQmHTryVwZhVm0EmhhYlBQnqPkQjOverM4Z3r0At2dn
 A2S/ttjiiC/pqgXTIH6h9rfyn6qE7Zr+gkPozzTU6xOci/yJbTwX2G001Ft1El59gcMk
 jH3fmzXWMPpph/OVpoH98EpQnnvBJ8/xldZsC7EfNg+Yuql1sHLs695L2mtQdLFjui6R
 H0sb/Z7NLRBVviK4xt/dDexorTCyGyYvOT8R1qOwAB5HXB1MHEblZhFVjj9FjOuXkxkj
 ppug==
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
Reply-To: christian.koenig@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMTcuMDYuMTkgdW0gMjE6MTUgc2NocmllYiBLdWVobGluZywgRmVsaXg6Cj4gTG9va3MgZ29v
ZCB0byBtZS4gT25lIGNvc21ldGljIGNvbW1lbnQgaW5saW5lLiBXaXRoIHRoYXQgZml4ZWQgdGhp
cwo+IHBhdGNoIGlzIFJldmlld2VkLWJ5OsKgIEZlbGl4IEt1ZWhsaW5nIDxGZWxpeC5LdWVobGlu
Z0BhbWQuY29tPgo+Cj4gT24gMjAxOS0wNi0xNCAxMjo1MSBwLm0uLCBTdERlbmlzLCBUb20gd3Jv
dGU6Cj4+IE9uIDMyLWJpdCBob3N0cyBtZW0tPm51bV9wYWdlcyBpcyAzMi1iaXRzIGFuZCBjYW4g
b3ZlcmZsb3cKPj4gd2hlbiBzaGlmdGVkLiAgQWRkIGEgY2FzdCB0byBhdm9pZCB0aGlzLgo+Pgo+
PiBTaWduZWQtb2ZmLWJ5OiBUb20gU3QgRGVuaXMgPHRvbS5zdGRlbmlzQGFtZC5jb20+Cj4+IC0t
LQo+PiAgICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdnJhbV9tZ3IuYyB8IDgg
KysrKystLS0KPj4gICAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlv
bnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV92cmFtX21nci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZyYW1fbWdy
LmMKPj4gaW5kZXggYzk2M2FkODYwNzJlLi4zMTg5NWQzYzMzZGUgMTAwNjQ0Cj4+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92cmFtX21nci5jCj4+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92cmFtX21nci5jCj4+IEBAIC0yNzksMTQgKzI3
OSwxNiBAQCBzdGF0aWMgaW50IGFtZGdwdV92cmFtX21ncl9uZXcoc3RydWN0IHR0bV9tZW1fdHlw
ZV9tYW5hZ2VyICptYW4sCj4+ICAgIAl1aW50NjRfdCB2aXNfdXNhZ2UgPSAwOwo+PiAgICAJdW5z
aWduZWQgaTsKPj4gICAgCWludCByOwo+PiArCXVpbnQ2NF90IG1lbV9ieXRlczsKPiBDaHJpc3Rp
YW4gbGlrZXMgdGhlICJ1cHNpZGUtZG93biBjaHJpc3RtYXMgdHJlZSIgdG8gaGVscCByZWFkYWJp
bGl0eSBvZgo+IGxvY2FsIHZhcmlhYmxlIGRlY2xhcmF0aW9ucy4KCkFoLCB5ZWFoLiBUaGFua3Mg
Zm9yIHRoZSBub3RlLgoKSSBhY3R1YWxseSBkb24ndCBjYXJlIGFib3V0IHRoYXQgbXVjaCwgYnV0
IEkgYWx3YXlzIGdldCByZWplY3RzIGZyb20gCnVwc3RyZWFtIHN1YnN5c3RlbSBtYWludGFpbmVy
cyBpZiBJIGRvbid0IGRvIHRoaXMuCgpJdCdzIG1vc3QgbGlrZWx5IG5vdCBldmVuIGRvY3VtZW50
ZWQgc29tZXdoZXJlLApDaHJpc3RpYW4uCgo+Cj4KPj4gICAgCj4+ICAgIAlscGZuID0gcGxhY2Ut
PmxwZm47Cj4+ICAgIAlpZiAoIWxwZm4pCj4+ICAgIAkJbHBmbiA9IG1hbi0+c2l6ZTsKPj4gICAg
Cj4+ICAgIAkvKiBiYWlsIG91dCBxdWlja2x5IGlmIHRoZXJlJ3MgbGlrZWx5IG5vdCBlbm91Z2gg
VlJBTSBmb3IgdGhpcyBCTyAqLwo+PiAtCWlmIChhdG9taWM2NF9hZGRfcmV0dXJuKG1lbS0+bnVt
X3BhZ2VzIDw8IFBBR0VfU0hJRlQsICZtZ3ItPnVzYWdlKSA+IGFkZXYtPmdtYy5tY192cmFtX3Np
emUpIHsKPj4gLQkJYXRvbWljNjRfc3ViKG1lbS0+bnVtX3BhZ2VzIDw8IFBBR0VfU0hJRlQsICZt
Z3ItPnVzYWdlKTsKPj4gKwltZW1fYnl0ZXMgPSAodTY0KW1lbS0+bnVtX3BhZ2VzIDw8IFBBR0Vf
U0hJRlQ7Cj4+ICsJaWYgKGF0b21pYzY0X2FkZF9yZXR1cm4obWVtX2J5dGVzLCAmbWdyLT51c2Fn
ZSkgPiBhZGV2LT5nbWMubWNfdnJhbV9zaXplKSB7Cj4+ICsJCWF0b21pYzY0X3N1YihtZW1fYnl0
ZXMsICZtZ3ItPnVzYWdlKTsKPj4gICAgCQltZW0tPm1tX25vZGUgPSBOVUxMOwo+PiAgICAJCXJl
dHVybiAwOwo+PiAgICAJfQo+PiBAQCAtMzA4LDcgKzMxMCw3IEBAIHN0YXRpYyBpbnQgYW1kZ3B1
X3ZyYW1fbWdyX25ldyhzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXIgKm1hbiwKPj4gICAgCW5v
ZGVzID0ga3ZtYWxsb2NfYXJyYXkoKHVpbnQzMl90KW51bV9ub2Rlcywgc2l6ZW9mKCpub2Rlcyks
Cj4+ICAgIAkJCSAgICAgICBHRlBfS0VSTkVMIHwgX19HRlBfWkVSTyk7Cj4+ICAgIAlpZiAoIW5v
ZGVzKSB7Cj4+IC0JCWF0b21pYzY0X3N1YihtZW0tPm51bV9wYWdlcyA8PCBQQUdFX1NISUZULCAm
bWdyLT51c2FnZSk7Cj4+ICsJCWF0b21pYzY0X3N1YihtZW1fYnl0ZXMsICZtZ3ItPnVzYWdlKTsK
Pj4gICAgCQlyZXR1cm4gLUVOT01FTTsKPj4gICAgCX0KPj4gICAgCj4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+
IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZng=
