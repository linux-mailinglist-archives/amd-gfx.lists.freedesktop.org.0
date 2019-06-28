Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7AC59ED4
	for <lists+amd-gfx@lfdr.de>; Fri, 28 Jun 2019 17:26:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B40BB6E94C;
	Fri, 28 Jun 2019 15:26:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9CE86E94C
 for <amd-gfx@lists.freedesktop.org>; Fri, 28 Jun 2019 15:26:10 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id p11so6730797wre.7
 for <amd-gfx@lists.freedesktop.org>; Fri, 28 Jun 2019 08:26:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=4zEXpTL5NTV8cw5hNL3xP6nkAvT3tJ8YhtGWXOkJb6w=;
 b=nnwEkI5fN0w5TT81+aDjdPFVnPz6Gyndo4/qEDaAiAA6cEJZSnrL96vY2ZpqIVR1KQ
 RRQwmteHFz881Q9Q/6uu73sp106lYxfPkaiSvirgHw8HP3L3dSuRZ6hv7EhxZQ/lcJO2
 7d1UDrfPb0up44lWwCLnMYAYv0Oo8sZbMus9DwvloTXXrsk7FEa9kMlcJy8C21rbEd2W
 AfJR/C/HVNOUXpFXQgV7uMVgQA31u/d3bMzGiwR/OvnJk/d2bKH2xspQtIh/NhKKRZmg
 gZNFoHaUJcOYxCBtfaLM7XIXtbD3xIaTLp0z1creKlkdf5bydeI4Enku7HtpPsHKd6UQ
 AmJA==
X-Gm-Message-State: APjAAAUhHuOUX2PkBnUeWQtLeHPSXBFb173KYMjrS2FLprVX/VLzDF7q
 30fiUu+/PANcCe2lUDHpgIcSxwj7
X-Google-Smtp-Source: APXvYqx1HKOWA4Z2OVfUG2oLjritGXH3rulS1zhlaqCL4nTM1JXcM6n/lGp4wSYYDEgThQTwGBcscw==
X-Received: by 2002:a5d:618d:: with SMTP id j13mr8284028wru.195.1561735569551; 
 Fri, 28 Jun 2019 08:26:09 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id l19sm1640130wmj.33.2019.06.28.08.26.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 28 Jun 2019 08:26:08 -0700 (PDT)
Subject: Re: [PATCH 1/5] drm/amdgpu: allow direct submission in the VM backends
To: Chunming Zhou <zhoucm1@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20190628121812.1400-1-christian.koenig@amd.com>
 <58a7ff4f-47f2-42a6-f9af-ca28726535bf@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <99be1543-66a2-b297-f18b-e98436147f76@gmail.com>
Date: Fri, 28 Jun 2019 17:26:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <58a7ff4f-47f2-42a6-f9af-ca28726535bf@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=4zEXpTL5NTV8cw5hNL3xP6nkAvT3tJ8YhtGWXOkJb6w=;
 b=uOMGTL5vKQNHa6RTx9rgXdZnR5lHoxwf5KarJgaE2zZKu8vdY9IHsS1ZHzD145E99y
 lloNSMsudME39u2ckBXrkZxJUnOUiC/AW+AsFozZPofApx49aIyasMytWTR+7qYnnu+y
 9neY322xCFEguX7/lLNIl2bpKK2KxQjIvE7vbpSpv8t910P4XJWJ4Ho1P5syf9xdXbGb
 osyO+7EPGyLTEd8+tav0HGIaq/C4krwh+R3139COibfJLWUBmb+slTK6A5HJ0LoCy+B8
 DCgamWA7tnDYVGEoc+0CUyMeLKZNeRzFibnp0W01Cqv94G4XQkwlL0FFHdrlt08VvIkR
 XauQ==
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMjguMDYuMTkgdW0gMTY6MzAgc2NocmllYiBDaHVubWluZyBaaG91Ogo+IOWcqCAyMDE5LzYv
MjggMjA6MTgsIENocmlzdGlhbiBLw7ZuaWcg5YaZ6YGTOgo+PiBUaGlzIGFsbG93cyB1cyB0byB1
cGRhdGUgcGFnZSB0YWJsZXMgZGlyZWN0bHkgd2hpbGUgaW4gYSBwYWdlIGZhdWx0Lgo+Pgo+PiBT
aWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+
Cj4+IC0tLQo+PiAgICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uaCAgICAg
IHwgIDUgKysrKwo+PiAgICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm1fY3B1
LmMgIHwgIDQgKysrCj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bV9z
ZG1hLmMgfCAyOSArKysrKysrKysrKysrLS0tLS0tLS0KPj4gICAgMyBmaWxlcyBjaGFuZ2VkLCAy
NyBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3ZtLmgKPj4gaW5kZXggNDg5YTE2MmNhNjIwLi41OTQxYWNjZWEwNjEgMTAw
NjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5oCj4+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5oCj4+IEBAIC0xOTcsNiAr
MTk3LDExIEBAIHN0cnVjdCBhbWRncHVfdm1fdXBkYXRlX3BhcmFtcyB7Cj4+ICAgIAkgKi8KPj4g
ICAgCXN0cnVjdCBhbWRncHVfdm0gKnZtOwo+PiAgICAKPj4gKwkvKioKPj4gKwkgKiBAZGlyZWN0
OiBpZiBjaGFuZ2VzIHNob3VsZCBiZSBtYWRlIGRpcmVjdGx5Cj4+ICsJICovCj4+ICsJYm9vbCBk
aXJlY3Q7Cj4+ICsKPj4gICAgCS8qKgo+PiAgICAJICogQHBhZ2VzX2FkZHI6Cj4+ICAgIAkgKgo+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtX2NwdS5j
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtX2NwdS5jCj4+IGluZGV4IDUy
MjJkMTY1YWJmYy4uZjk0ZTQ4OTYwNzljIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfdm1fY3B1LmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3ZtX2NwdS5jCj4+IEBAIC00OSw2ICs0OSwxMCBAQCBzdGF0aWMgaW50IGFt
ZGdwdV92bV9jcHVfcHJlcGFyZShzdHJ1Y3QgYW1kZ3B1X3ZtX3VwZGF0ZV9wYXJhbXMgKnAsIHZv
aWQgKm93bmVyLAo+PiAgICB7Cj4+ICAgIAlpbnQgcjsKPj4gICAgCj4+ICsJLyogRG9uJ3Qgd2Fp
dCBmb3IgYW55dGhpbmcgZHVyaW5nIHBhZ2UgZmF1bHQgKi8KPj4gKwlpZiAocC0+ZGlyZWN0KQo+
PiArCQlyZXR1cm4gMDsKPj4gKwo+PiAgICAJLyogV2FpdCBmb3IgUFQgQk9zIHRvIGJlIGlkbGUu
IFBUcyBzaGFyZSB0aGUgc2FtZSByZXN2LiBvYmplY3QKPj4gICAgCSAqIGFzIHRoZSByb290IFBE
IEJPCj4+ICAgIAkgKi8KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV92bV9zZG1hLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm1f
c2RtYS5jCj4+IGluZGV4IGRkZDE4MWY1ZWQzNy4uODkxZDU5NzA2M2NiIDEwMDY0NAo+PiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm1fc2RtYS5jCj4+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bV9zZG1hLmMKPj4gQEAgLTY4LDE3ICs2
OCwxNyBAQCBzdGF0aWMgaW50IGFtZGdwdV92bV9zZG1hX3ByZXBhcmUoc3RydWN0IGFtZGdwdV92
bV91cGRhdGVfcGFyYW1zICpwLAo+PiAgICAJaWYgKHIpCj4+ICAgIAkJcmV0dXJuIHI7Cj4+ICAg
IAo+PiAtCXIgPSBhbWRncHVfc3luY19mZW5jZShwLT5hZGV2LCAmcC0+am9iLT5zeW5jLCBleGNs
dXNpdmUsIGZhbHNlKTsKPj4gLQlpZiAocikKPj4gLQkJcmV0dXJuIHI7Cj4+ICsJcC0+bnVtX2R3
X2xlZnQgPSBuZHc7Cj4+ICsKPj4gKwlpZiAocC0+ZGlyZWN0KQo+PiArCQlyZXR1cm4gMDsKPj4g
ICAgCj4+IC0JciA9IGFtZGdwdV9zeW5jX3Jlc3YocC0+YWRldiwgJnAtPmpvYi0+c3luYywgcm9v
dC0+dGJvLnJlc3YsCj4+IC0JCQkgICAgIG93bmVyLCBmYWxzZSk7Cj4+ICsJciA9IGFtZGdwdV9z
eW5jX2ZlbmNlKHAtPmFkZXYsICZwLT5qb2ItPnN5bmMsIGV4Y2x1c2l2ZSwgZmFsc2UpOwo+PiAg
ICAJaWYgKHIpCj4+ICAgIAkJcmV0dXJuIHI7Cj4+ICAgIAo+PiAtCXAtPm51bV9kd19sZWZ0ID0g
bmR3Owo+PiAtCXJldHVybiAwOwo+PiArCXJldHVybiBhbWRncHVfc3luY19yZXN2KHAtPmFkZXYs
ICZwLT5qb2ItPnN5bmMsIHJvb3QtPnRiby5yZXN2LAo+PiArCQkJCW93bmVyLCBmYWxzZSk7Cj4+
ICAgIH0KPj4gICAgCj4+ICAgIC8qKgo+PiBAQCAtOTksMTMgKzk5LDIxIEBAIHN0YXRpYyBpbnQg
YW1kZ3B1X3ZtX3NkbWFfY29tbWl0KHN0cnVjdCBhbWRncHVfdm1fdXBkYXRlX3BhcmFtcyAqcCwK
Pj4gICAgCXN0cnVjdCBkbWFfZmVuY2UgKmY7Cj4+ICAgIAlpbnQgcjsKPj4gICAgCj4+IC0Jcmlu
ZyA9IGNvbnRhaW5lcl9vZihwLT52bS0+ZW50aXR5LnJxLT5zY2hlZCwgc3RydWN0IGFtZGdwdV9y
aW5nLCBzY2hlZCk7Cj4+ICsJaWYgKHAtPmRpcmVjdCkKPj4gKwkJcmluZyA9IHAtPmFkZXYtPnZt
X21hbmFnZXIucGFnZV9mYXVsdDsKPj4gKwllbHNlCj4+ICsJCXJpbmcgPSBjb250YWluZXJfb2Yo
cC0+dm0tPmVudGl0eS5ycS0+c2NoZWQsCj4+ICsJCQkJICAgIHN0cnVjdCBhbWRncHVfcmluZywg
c2NoZWQpOwo+PiAgICAKPj4gICAgCVdBUk5fT04oaWItPmxlbmd0aF9kdyA9PSAwKTsKPj4gICAg
CWFtZGdwdV9yaW5nX3BhZF9pYihyaW5nLCBpYik7Cj4+ICAgIAlXQVJOX09OKGliLT5sZW5ndGhf
ZHcgPiBwLT5udW1fZHdfbGVmdCk7Cj4+IC0JciA9IGFtZGdwdV9qb2Jfc3VibWl0KHAtPmpvYiwg
JnAtPnZtLT5lbnRpdHksCj4+IC0JCQkgICAgICBBTURHUFVfRkVOQ0VfT1dORVJfVk0sICZmKTsK
Pj4gKwo+PiArCWlmIChwLT5kaXJlY3QpCj4+ICsJCXIgPSBhbWRncHVfam9iX3N1Ym1pdF9kaXJl
Y3QocC0+am9iLCByaW5nLCAmZik7Cj4gV2hlbiB3ZSB1c2UgZGlyZWN0IHN1Ym1pc3Npb24gYWZ0
ZXIgaW50aWFsaXphdGlvbiwgd2UgbmVlZCB0byB0YWtlIGNhcmUKPiBvZiByaW5nIHJhY2UgY29u
ZGlzaW9uLCBkb24ndCB3ZT8gQW0gSSBtaXNzaW5nIGFueXRoaW5nPwoKRGlyZWN0IHN1Ym1pc3Np
b24gY2FuIG9ubHkgdXNlZCBieSB0aGUgcGFnZSBmYXVsdCB3b3JrZXIgdGhyZWFkLiBBbmQgYXQg
CmxlYXN0IGZvciBub3cgdGhlcmUgaXMgZXhhY3RseSBvbmUgd29ya2VyIHRocmVhZC4KCkNocmlz
dGlhbi4KCj4KPgo+IC1EYXZpZAo+Cj4+ICsJZWxzZQo+PiArCQlyID0gYW1kZ3B1X2pvYl9zdWJt
aXQocC0+am9iLCAmcC0+dm0tPmVudGl0eSwKPj4gKwkJCQkgICAgICBBTURHUFVfRkVOQ0VfT1dO
RVJfVk0sICZmKTsKPj4gICAgCWlmIChyKQo+PiAgICAJCWdvdG8gZXJyb3I7Cj4+ICAgIAo+PiBA
QCAtMTIwLDcgKzEyOCw2IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3ZtX3NkbWFfY29tbWl0KHN0cnVj
dCBhbWRncHVfdm1fdXBkYXRlX3BhcmFtcyAqcCwKPj4gICAgCXJldHVybiByOwo+PiAgICB9Cj4+
ICAgIAo+PiAtCj4+ICAgIC8qKgo+PiAgICAgKiBhbWRncHVfdm1fc2RtYV9jb3B5X3B0ZXMgLSBj
b3B5IHRoZSBQVEVzIGZyb20gbWFwcGluZwo+PiAgICAgKgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hbWQtZ2Z4
