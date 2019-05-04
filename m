Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F4513821
	for <lists+amd-gfx@lfdr.de>; Sat,  4 May 2019 09:33:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C71158954A;
	Sat,  4 May 2019 07:33:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FA418954A
 for <amd-gfx@lists.freedesktop.org>; Sat,  4 May 2019 07:33:37 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id a12so406120wrn.4
 for <amd-gfx@lists.freedesktop.org>; Sat, 04 May 2019 00:33:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=ogcfSLSFbMMnp3o3Hos1u22hWyGreKxpEdchs77kkW8=;
 b=WBW8a+tDYf6rgB/K6e2DbV8XJdECFZmbe+vgivnSjtZZvz/CglIO/NkXovWUG5eUV9
 ak3mtRSs5y2oq1DP/zkgAfVJnSpAgMq2zz7mAk4/j7oZnJ0XUCYRJV61HdFb77IGrII4
 zDoKyNhID1RAmjeS4o6V361gIqin8ga0lTvlO/RXHPpX9WJZwogcQQH2cIzt4jUA8vpv
 ljwyDZDcNRSF6SmzE41XJXm2K179iN77VJWUKj0dgsQ5T5bgzEGNCt3D0MsmwBsAl/9+
 0QbuLcWEA2mPG2atD8TGngn/l96BKPqWgUq1A5JAQpjp3gxDyCqxchgzLeSLw+/QujyD
 MSLg==
X-Gm-Message-State: APjAAAWK+x4IxcM6ZCzDxSEBbVoMSjmXOSG4p8JHIM3w0VZaRHMStAvX
 z1E85G5hhkO5AwjX/whdos8=
X-Google-Smtp-Source: APXvYqwuUSD7OanCzJiDUXpP+OATv6wqLbwBONAmVoqCCctqeiBhpdXdi8AIQL4jsvWqCBNgSZ+Fug==
X-Received: by 2002:a5d:674f:: with SMTP id l15mr9720554wrw.41.1556955216016; 
 Sat, 04 May 2019 00:33:36 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id j71sm4163239wmj.44.2019.05.04.00.33.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 04 May 2019 00:33:35 -0700 (PDT)
Subject: Re: How to dump gfx and waves after GPU reset happened?
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Tom St Denis <tom.stdenis@amd.com>
References: <CABXGCsMY=LvtCp0V8U8jbARXgapjQe4WP9ss-ui3fHsPQjevXg@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <98231ce0-f29c-df52-1ba3-c9f85a76bcac@gmail.com>
Date: Sat, 4 May 2019 09:33:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CABXGCsMY=LvtCp0V8U8jbARXgapjQe4WP9ss-ui3fHsPQjevXg@mail.gmail.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=ogcfSLSFbMMnp3o3Hos1u22hWyGreKxpEdchs77kkW8=;
 b=GYK/LcfS7rJVJInPnOfaywJCqNGoYI64E28oFgSet0/ozMBOIMWucV6GkVjK86dHxn
 CXfKy0D8/92u4WyEZHi8IPmFUOmNmrnsk8psaJDYT21PAIXXzM+XRvhoJliyXRdjYp2t
 tTmt4ye6KyvKLxPcLeW6fLwGQsbYM0pI3h4v+KVPQmqT6Ro5Ci/hMZhSgyzQeOE7QYDh
 1cOIMMwbCI3eOlAHVRLnp5IZE5cGb3Kgs8LL8bpVTg0cl/w6WzHEnXQJ2LPn0SAwxdxs
 c3WnLh4frzIWDA66hECIG60cwfq7toDbMQ2T+30jNb4s1l0GqF9B5vjmfQD3lzHr+IxQ
 by0A==
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

SGkgTWlraGFpbCwKCndlbGwgc2hvcnQgYW5zd2VyIGlzIG5vdCBhdCBhbGwgOikKCkFmdGVyIHRo
ZSBHUFUgcmVzZXQgaGFwcGVuZWQgYWxsIHdhdmVzIHNob3VsZCBiZSBnb25lIGFuZCB0aGUgZ2Z4
IGJsb2NrIAppbiBhIGNsZWFuIHN0YXRlIGFnYWluLgoKV2hhdCB5b3UgbmVlZCB0byBkbyBpcyB0
byBkaXNhYmxlIGF1dG9tYXRpYyByZXNldCBieSBzZXR0aW5nIAphbWRncHUubG9ja3VwX3RpbWVv
dXQ9LTEgb24gdGhlIGtlcm5lbCBjb21tYW5kIGxpbmUgYW5kIHRoZW4gaW5zcGVjdCB0aGUgCnN5
c3RlbSBvdmVyIHNzaC4KClJlZ2FyZHMsCkNocmlzdGlhbi4KCkFtIDAzLjA1LjE5IHVtIDE2OjIw
IHNjaHJpZWIgTWlraGFpbCBHYXZyaWxvdjoKPiBIaSBmb2xrcy4KPiBJIHRyaWVzIHBsYXkgaW4g
UmVzaWRlbnQgRXZpbCAyIHJlbWFrZSB2aWEgc3RlYW0gcGxheSBhbmQgbXkgUmFkZW9uIDcKPiAo
VmVnYSAyMCkgY2FyZCBpcyBleHBlcmllbmNlZCAicmluZyBnZnggdGltZW91dCIgcHJvYmxlbSBl
dmVyeSB0aW1lCj4gd2hlbiBJIHNlbGVjdCAiU3RvcnkiIGluIHRoZSBtYWluIGdhbWUgbWVudS4K
PiBTaW5jZSBJIGFtIHNpdHRpbmcgb24gNS4xIGtlcm5lbCBub3cgR1BVIHJlc2V0IG9jY3VycmVk
IGV2ZXJ5IHRpbWUKPiB3aGVuIGhhcHBlbmVkICJyaW5nIGdmeCB0aW1lb3V0Ii4KPiBTbyBteSBx
dWVzdGlvbjogSG93IHRvIGR1bXAgZ2Z4IGFuZCB3YXZlcyBhZnRlciBHUFUgcmVzZXQgaGFwcGVu
ZWQ/IEkKPiBzZWUgdGhhdCBhZnRlciBHUFUgcmVzZXQgaXMgbm90aGluZyB0byBkdW1wLgo+Cj4g
IyAuL3VtciAtTyBoYWx0X3dhdmVzIC13YQo+IFtXQVJOSU5HXTogUmluZ3MgYXJlIG5vdCBoYWx0
ZWQhICBVc2UgJy1PIGRpc2FzbV9hbnl3YXlzJyB0byBlbmFibGUKPiBkaXNhc3NlbWJseSB3aXRo
b3V0IGhhbHRlZCByaW5ncwo+IE5vIGFjdGl2ZSB3YXZlcyEKPgo+ICMgLi91bXIgLVIgZ2Z4Wy5d
Cj4KPiB2ZWdhMjAuZ2Z4LnJwdHIgPT0gMjU2Cj4gdmVnYTIwLmdmeC53cHRyID09IDI1Ngo+IHZl
Z2EyMC5nZnguZHJ2X3dwdHIgPT0gMjU2Cj4gdmVnYTIwLmdmeC5yaW5nWyAyMjVdID09IDB4ZmZm
ZjEwMDAgICAgLi4uCj4gdmVnYTIwLmdmeC5yaW5nWyAyMjZdID09IDB4ZmZmZjEwMDAgICAgLi4u
Cj4gdmVnYTIwLmdmeC5yaW5nWyAyMjddID09IDB4ZmZmZjEwMDAgICAgLi4uCj4gdmVnYTIwLmdm
eC5yaW5nWyAyMjhdID09IDB4ZmZmZjEwMDAgICAgLi4uCj4gdmVnYTIwLmdmeC5yaW5nWyAyMjld
ID09IDB4ZmZmZjEwMDAgICAgLi4uCj4gdmVnYTIwLmdmeC5yaW5nWyAyMzBdID09IDB4ZmZmZjEw
MDAgICAgLi4uCj4gdmVnYTIwLmdmeC5yaW5nWyAyMzFdID09IDB4ZmZmZjEwMDAgICAgLi4uCj4g
dmVnYTIwLmdmeC5yaW5nWyAyMzJdID09IDB4ZmZmZjEwMDAgICAgLi4uCj4gdmVnYTIwLmdmeC5y
aW5nWyAyMzNdID09IDB4ZmZmZjEwMDAgICAgLi4uCj4gdmVnYTIwLmdmeC5yaW5nWyAyMzRdID09
IDB4ZmZmZjEwMDAgICAgLi4uCj4gdmVnYTIwLmdmeC5yaW5nWyAyMzVdID09IDB4ZmZmZjEwMDAg
ICAgLi4uCj4gdmVnYTIwLmdmeC5yaW5nWyAyMzZdID09IDB4ZmZmZjEwMDAgICAgLi4uCj4gdmVn
YTIwLmdmeC5yaW5nWyAyMzddID09IDB4ZmZmZjEwMDAgICAgLi4uCj4gdmVnYTIwLmdmeC5yaW5n
WyAyMzhdID09IDB4ZmZmZjEwMDAgICAgLi4uCj4gdmVnYTIwLmdmeC5yaW5nWyAyMzldID09IDB4
ZmZmZjEwMDAgICAgLi4uCj4gdmVnYTIwLmdmeC5yaW5nWyAyNDBdID09IDB4ZmZmZjEwMDAgICAg
Li4uCj4gdmVnYTIwLmdmeC5yaW5nWyAyNDFdID09IDB4ZmZmZjEwMDAgICAgLi4uCj4gdmVnYTIw
LmdmeC5yaW5nWyAyNDJdID09IDB4ZmZmZjEwMDAgICAgLi4uCj4gdmVnYTIwLmdmeC5yaW5nWyAy
NDNdID09IDB4ZmZmZjEwMDAgICAgLi4uCj4gdmVnYTIwLmdmeC5yaW5nWyAyNDRdID09IDB4ZmZm
ZjEwMDAgICAgLi4uCj4gdmVnYTIwLmdmeC5yaW5nWyAyNDVdID09IDB4ZmZmZjEwMDAgICAgLi4u
Cj4gdmVnYTIwLmdmeC5yaW5nWyAyNDZdID09IDB4ZmZmZjEwMDAgICAgLi4uCj4gdmVnYTIwLmdm
eC5yaW5nWyAyNDddID09IDB4ZmZmZjEwMDAgICAgLi4uCj4gdmVnYTIwLmdmeC5yaW5nWyAyNDhd
ID09IDB4ZmZmZjEwMDAgICAgLi4uCj4gdmVnYTIwLmdmeC5yaW5nWyAyNDldID09IDB4ZmZmZjEw
MDAgICAgLi4uCj4gdmVnYTIwLmdmeC5yaW5nWyAyNTBdID09IDB4ZmZmZjEwMDAgICAgLi4uCj4g
dmVnYTIwLmdmeC5yaW5nWyAyNTFdID09IDB4ZmZmZjEwMDAgICAgLi4uCj4gdmVnYTIwLmdmeC5y
aW5nWyAyNTJdID09IDB4ZmZmZjEwMDAgICAgLi4uCj4gdmVnYTIwLmdmeC5yaW5nWyAyNTNdID09
IDB4ZmZmZjEwMDAgICAgLi4uCj4gdmVnYTIwLmdmeC5yaW5nWyAyNTRdID09IDB4ZmZmZjEwMDAg
ICAgLi4uCj4gdmVnYTIwLmdmeC5yaW5nWyAyNTVdID09IDB4ZmZmZjEwMDAgICAgLi4uCj4gdmVn
YTIwLmdmeC5yaW5nWyAyNTZdID09IDB4YzAwMzIyMDAgICAgcndECj4KPgo+IC0tCj4gQmVzdCBS
ZWdhcmRzLAo+IE1pa2UgR2F2cmlsb3YuCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+IGFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbWQtZ2Z4CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
