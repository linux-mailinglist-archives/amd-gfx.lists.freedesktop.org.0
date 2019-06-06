Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCAB375E3
	for <lists+amd-gfx@lfdr.de>; Thu,  6 Jun 2019 16:00:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18EB7895C4;
	Thu,  6 Jun 2019 14:00:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47B8C8932D
 for <amd-gfx@lists.freedesktop.org>; Thu,  6 Jun 2019 14:00:14 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id x15so51953wmj.3
 for <amd-gfx@lists.freedesktop.org>; Thu, 06 Jun 2019 07:00:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=+a1oAf35J4jmV5yeRRiOmAe8+4m1TwdpZK0N2P39U0c=;
 b=lFTuY8+fjD+PhnTvVyeNALLnA6vMjNrQ2WCPrAY1gqnk5+F+W79FIHlrq5i4sf4Ioi
 pXNeKGxnwp/gVanTKYcgAULfw6TgqpatJqWAf4+wVM0ira+zIJ6jetGaKBpBUdCH9qLf
 5LteqhyLLK6m8mz/jVI/Usb5iUSfatnsz1Sfxh2hEXxB2RLFv1pnDvorIiVN/0BC4eBn
 WT63+c/rgtheHPKewpvCxAjPerxFJSuOtbNO7C/aSicZ10zk5IvMTZluaU+Z6JasIj8R
 GRbp5kxWxxg07RebmdC3yVLUnqZAG/Q5LYj9ie0uGP9NySheaqiQ+omb2L27PhlPlJUd
 rwUg==
X-Gm-Message-State: APjAAAWhDqAZVUESEJvO9cs2LBqMdll+HzEbQOjjjS++kYmq8I2LFW01
 DSQnPhf2Nmv0Le1SUDZOhRA=
X-Google-Smtp-Source: APXvYqw0xzhAHV3fxstzlGmgRDZnldHDz3XR7fEwHBfdoTBb+mInnoUJe31rajUMOwk77tGUjMUTvA==
X-Received: by 2002:a1c:e109:: with SMTP id y9mr100086wmg.35.1559829612781;
 Thu, 06 Jun 2019 07:00:12 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id x8sm2330069wmc.5.2019.06.06.07.00.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 06 Jun 2019 07:00:11 -0700 (PDT)
Subject: Re: FW: [PATCH] drm/ttm: fix ttm client driver (e.g. amdgpu) reload
 issue
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Liu, Monk" <Monk.Liu@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>
References: <1559717076-25471-1-git-send-email-Monk.Liu@amd.com>
 <MN2PR12MB393308FE408E9E41EF0D615184160@MN2PR12MB3933.namprd12.prod.outlook.com>
 <8dbf96e5-056f-b2bb-b0d3-9376b92b0140@amd.com>
 <MN2PR12MB39334AC8143DDBC1AA7587E884160@MN2PR12MB3933.namprd12.prod.outlook.com>
 <bb88e890-84c4-5405-85c6-59f02d5a7a61@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <1ef221b9-f29e-cbd2-488a-d5d0b349e45f@gmail.com>
Date: Thu, 6 Jun 2019 16:00:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <bb88e890-84c4-5405-85c6-59f02d5a7a61@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=+a1oAf35J4jmV5yeRRiOmAe8+4m1TwdpZK0N2P39U0c=;
 b=ko7OcmEBv0691blJSMqsl0Otsm0v+OgrJ0LiiHinLSsCAsUa4V0o8KYvjEc5gg/TsE
 9IFfylwC4vrcebL4LG7hPVSSpsaR/AOFsBQ9SbCUSkCfny1oC+ZsdRw7Yte2AW+tgYWN
 OQ+JaNSTxAoBenYp73GmxOh3zn02N/tzqs7uwRYnjnAbhwBW+q7XIEFN1Pz7VLUwjU4T
 wtTt5NNkPVxCPpxCAt9hGG3oEn09sxZ+h3/exJhLBVaLzMP5JsIQLuhEAjpaSjrTTpgw
 Qa9ZecMRKOquG9lAkEKM7f6SS/DglFFl+vkMdWXfUMtVMlQP9RqSuC6slqEbAZ2imNMo
 UIVA==
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

SXQgaXMgcGFydCBvZiBhbWQtc3RhZ2luZy1kcm0tbmV4dCBhbmQgaGFzIEFsZXggU2lnbmVkLW9m
IGJ5IHRhZy4KClNvIGl0IHNob3VsZCBkZWZpbml0ZWx5IGJlIHVwc3RyZWFtLCBBbGV4IGFueSBp
ZGVhIHdoeSB0aGF0IHBhdGNoIGlzbid0IAppbiBkcm0tbmV4dD8KCkNocmlzdGlhbi4KCkFtIDA1
LjA2LjE5IHVtIDIwOjEwIHNjaHJpZWIgS29lbmlnLCBDaHJpc3RpYW46Cj4gTWhtLCBsb29rcyBs
aWtlIHRoYXQgc29tZWhvdyBnb3QgZHJvcHBlZCBkdXJpbmcgcmViYXNlLgo+Cj4gR29pbmcgdG8g
ZGlnIHVwIHdoZXJlIHRoYXQgYWN0dWFsbHkgZW5kZWQgdXAgdG9tb3Jyb3cuCj4KPiBDaHJpc3Rp
YW4uCj4KPiBBbSAwNS4wNi4xOSB1bSAxNjo0NCBzY2hyaWViIExpdSwgTW9uazoKPj4gU3RyYW5n
ZSwgSSBnZXQgdGhlIGxhdGVzdCAiZHJtLW5leHQiIGJyYW5jaCBhbmQgZGlkbid0IHNlZSB0aGUg
Y2hhbmdlIGxhbmRlZCAuLi4uCj4+Cj4+IC9Nb25rCj4+Cj4+IC0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tCj4+IEZyb206IEtvZW5pZywgQ2hyaXN0aWFuCj4+IFNlbnQ6IFdlZG5lc2RheSwgSnVu
ZSA1LCAyMDE5IDc6MTEgUE0KPj4gVG86IExpdSwgTW9uayA8TW9uay5MaXVAYW1kLmNvbT47IGFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4+IFN1YmplY3Q6IFJlOiBGVzogW1BBVENIXSBk
cm0vdHRtOiBmaXggdHRtIGNsaWVudCBkcml2ZXIgKGUuZy4gYW1kZ3B1KSByZWxvYWQgaXNzdWUK
Pj4KPj4gVGhpcyBzaG91bGQgYWxyZWFkeSBiZSBmaXhlZCBieSBwYXRjaCAiZHJtL3R0bTogZml4
IHJlLWluaXQgb2YgZ2xvYmFsIHN0cnVjdHVyZXMiLgo+Pgo+PiBDaHJpc3RpYW4uCj4+Cj4+IEFt
IDA1LjA2LjE5IHVtIDA5OjI5IHNjaHJpZWIgTGl1LCBNb25rOgo+Pj4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0KPj4+IEZyb206IE1vbmsgTGl1IDxNb25rLkxpdUBhbWQuY29tPgo+Pj4gU2Vu
dDogV2VkbmVzZGF5LCBKdW5lIDUsIDIwMTkgMjo0NSBQTQo+Pj4gVG86IGFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCj4+PiBDYzogTGl1LCBNb25rIDxNb25rLkxpdUBhbWQuY29tPgo+Pj4g
U3ViamVjdDogW1BBVENIXSBkcm0vdHRtOiBmaXggdHRtIGNsaWVudCBkcml2ZXIgKGUuZy4gYW1k
Z3B1KSByZWxvYWQKPj4+IGlzc3VlCj4+Pgo+Pj4gbmVlZCB0byBjbGVhciBibyBnbG9iIGFuZCBt
ZW0gZ2xvYiBkdXJpbmcgdGhlaXIgcmVsZWFzZSBvdGhlcndpc2UgdGhlaXIgbWVtYmVyIHZhbHVl
IHdvdWxkIGJlIHdyb25nbHkgdXNlZCBpbiB0aGUgbmV4dCBnbG9iIGluaXQgc3RhZ2UgYW5kIGxl
YWQgdG8gd2lsZCBwb2ludGVyIGFjY2VzcyBwcm9ibGVtczoKPj4+Cj4+PiAxKSBrb2JqLnN0YXRl
X2luaXRpYWxpemVkIGlzIDEKPj4+IDIpIHR0bV9ib19nbG9iLmJvX2NvdW50IGlzbid0IGNsZWFy
ZWQgYW5kIHJlZmVyZW5jZWQgdmlhIGl0Cj4+PiAgICAgICBvbiBtZW1iZXIgInN3YXBfbHJ1IiB3
b3VsZCBoaXQgb3V0IG9mIGJvdW5kIGFycmF5IGFjY2Vzc2luZwo+Pj4gICAgICAgYnVnCj4+Pgo+
Pj4gU2lnbmVkLW9mZi1ieTogTW9uayBMaXUgPE1vbmsuTGl1QGFtZC5jb20+Cj4+PiAtLS0KPj4+
ICAgICBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jICAgICB8IDIgKysKPj4+ICAgICBkcml2
ZXJzL2dwdS9kcm0vdHRtL3R0bV9tZW1vcnkuYyB8IDggKysrKysrKysKPj4+ICAgICAyIGZpbGVz
IGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3R0bS90dG1fYm8uYwo+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jIGlu
ZGV4IGM3ZGU2NjcuLjY0MzRlYWMgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRt
L3R0bV9iby5jCj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCj4+PiBAQCAt
MTYwNCw2ICsxNjA0LDggQEAgc3RhdGljIHZvaWQgdHRtX2JvX2dsb2JhbF9rb2JqX3JlbGVhc2Uo
c3RydWN0IGtvYmplY3QgKmtvYmopCj4+PiAgICAgCQljb250YWluZXJfb2Yoa29iaiwgc3RydWN0
IHR0bV9ib19nbG9iYWwsIGtvYmopOwo+Pj4gICAgIAo+Pj4gICAgIAlfX2ZyZWVfcGFnZShnbG9i
LT5kdW1teV9yZWFkX3BhZ2UpOwo+Pj4gKwo+Pj4gKwltZW1zZXQoZ2xvYiwgMCwgc2l6ZW9mKCpn
bG9iKSk7Cj4+PiAgICAgfQo+Pj4gICAgIAo+Pj4gICAgIHN0YXRpYyB2b2lkIHR0bV9ib19nbG9i
YWxfcmVsZWFzZSh2b2lkKSBkaWZmIC0tZ2l0Cj4+PiBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRt
X21lbW9yeS5jIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fbWVtb3J5LmMKPj4+IGluZGV4IDg2
MTc5NTguLjcxMjhiYmYgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9t
ZW1vcnkuYwo+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fbWVtb3J5LmMKPj4+IEBA
IC0yMjksOSArMjI5LDE3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc3lzZnNfb3BzIHR0bV9tZW1f
Z2xvYmFsX29wcyA9IHsKPj4+ICAgICAJLnN0b3JlID0gJnR0bV9tZW1fZ2xvYmFsX3N0b3JlLAo+
Pj4gICAgIH07Cj4+PiAgICAgCj4+PiArdm9pZCB0dG1fbWVtX2dsb2Jfa29ial9yZWxlYXNlKHN0
cnVjdCBrb2JqZWN0ICprb2JqKSB7Cj4+PiArCXN0cnVjdCB0dG1fbWVtX2dsb2JhbCAqZ2xvYiA9
IGNvbnRhaW5lcl9vZihrb2JqLCBzdHJ1Y3QKPj4+ICt0dG1fbWVtX2dsb2JhbCwga29iaik7Cj4+
PiArCj4+PiArCW1lbXNldChnbG9iLCAwLCBzaXplb2YoKmdsb2IpKTsKPj4+ICt9Cj4+PiArCj4+
PiAgICAgc3RhdGljIHN0cnVjdCBrb2JqX3R5cGUgdHRtX21lbV9nbG9iX2tvYmpfdHlwZSA9IHsK
Pj4+ICAgICAJLnN5c2ZzX29wcyA9ICZ0dG1fbWVtX2dsb2JhbF9vcHMsCj4+PiAgICAgCS5kZWZh
dWx0X2F0dHJzID0gdHRtX21lbV9nbG9iYWxfYXR0cnMsCj4+PiArCS5yZWxlYXNlID0gdHRtX21l
bV9nbG9iX2tvYmpfcmVsZWFzZSwKPj4+ICAgICB9Owo+Pj4gICAgIAo+Pj4gICAgIHN0YXRpYyBi
b29sIHR0bV96b25lc19hYm92ZV9zd2FwX3RhcmdldChzdHJ1Y3QgdHRtX21lbV9nbG9iYWwgKmds
b2IsCj4+PiAtLQo+Pj4gMi43LjQKPj4+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+IGFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbWQtZ2Z4CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
